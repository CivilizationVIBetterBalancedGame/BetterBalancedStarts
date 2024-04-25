------------------------------------------------------------------------------
--	FILE:	BBS_AssignStartingPlot.lua    -- 2.2.0
--	AUTHOR:  Talasta, Keride, Vodairo
--	PURPOSE: Custom Spawn Placement Script
------------------------------------------------------------------------------
--	Copyright (c) 2014 Firaxis Games, Inc. All rights reserved.
------------------------------------------------------------------------------
include("MapEnums");
include("MapUtilities");
include("FeatureGenerator");
include("TerrainGenerator");
include("NaturalWonderGenerator");
include("ResourceGenerator");
include("AssignStartingPlots");
include "BBS_MapUtils";
include "BBS_CivilizationAssign";

local BBS_VERSION = "2.2.0"

--------------------------------------------------------------------------------
-- constant definition  --------------------------------------------------------
--------------------------------------------------------------------------------
-- Special civilisations types
BBS_LEADER_TYPE_SPECTATOR = "LEADER_SPECTATOR"

--------------------------------------------------------------------------------
--  Init metatable -------------------------------------------------------------
--------------------------------------------------------------------------------
BBS_AssignStartingPlots = {};
local BBS_HexMap = {};
local BBS_Civilisations = {};
local BBS_Teams = {}
------------------------------------------------------------------------------
function ___Debug(...)
    print(...);
end

------------------------------------------------------------- BBS ----------------------------
function BBS_AssignStartingPlots.Create(args)
    bbs_game_config = {
        BBS_TEAM_SPAWN = MapConfiguration.GetValue("BBS_Team_Spawn"),
        BBS_MAP_SCRIPT = MapConfiguration.GetValue("MAP_SCRIPT"),
        BBS_MAP_SIZE = Map.GetMapSize(),
        BBS_GAME_SYNC_SEED = GameConfiguration.GetValue("GAME_SYNC_RANDOM_SEED"),
        BBS_MULTIPLAYER_GAME = GameConfiguration.IsAnyMultiplayer(),
        BBS_GAME_SEED = MapConfiguration.GetValue("RANDOM_SEED"),
        BBS_BASE_TEMPERATURE = MapConfiguration.GetValue("temperature"),
        BBS_BOOL_TEMPERATURE = GameConfiguration.GetValue("BBStemp"),
        BBS_RAINFALL = MapConfiguration.GetValue("rainfall"),
        BBS_WORLD_AGE = MapConfiguration.GetValue("world_age"),
        BBS_RIDGE = MapConfiguration.GetValue("BBSRidge"),
        BBS_SEA_LEVEL = MapConfiguration.GetValue("sea_level"),
        BBS_STRATEGIC_RESOURCES = MapConfiguration.GetValue("BBSStratRes"),
        BBS_BASE_RESOURCES = MapConfiguration.GetValue("resources"),
        BBS_START = MapConfiguration.GetValue("start"),
        BBM_MIN_ATTEMPTS = MapConfiguration.GetValue("BBMMinAttempts"),
    }

    instance = {
        __InitStartingData      = BBS_AssignStartingPlots.__InitStartingData,
        __FindBias              = BBS_AssignStartingPlots.__FindBias,
        __ComputeBiasScore      = BBS_AssignStartingPlots.__ComputeBiasScore,
        __GetTerrainIndex       = BBS_AssignStartingPlots.__GetTerrainIndex,
        __GetFeatureIndex       = BBS_AssignStartingPlots.__GetFeatureIndex,
        __GetResourceIndex      = BBS_AssignStartingPlots.__GetResourceIndex,
        __PlaceMajorCivs        = BBS_AssignStartingPlots.__PlaceMajorCivs,
        __ResetMajorsSpawns     = BBS_AssignStartingPlots.__ResetMajorsSpawns,
    }
    _Debug("START BBS WORK",  os.date("%c"))
    -- Get Bias all
    bbs_negative_bias = {}
    bbs_custom_bias = {}
    -- Custom negative bias located in StartBiasNegatives table
    local ret = DB.Query("SELECT * from StartBiasNegatives");
    for key, value in pairs(ret) do
        if value.CivilizationType ~= nil then
            print("StartBiasNegatives", value.CivilizationType, value.TerrainType,  value.FeatureType, value.Tier, value.Extra);
            table.insert(bbs_negative_bias, {
                CivilizationType = value.CivilizationType,
                TerrainType = value.TerrainType,
                FeatureType = value.FeatureType,
                Tier = value.Tier,
                Extra = value.Extra
            });
        end
    end

    -- Custom bias located in StartBiasNegatives table
    local ret = DB.Query("SELECT * from StartBiasCustom");
    for key, value in pairs(ret) do
        if value.CivilizationType ~= nil then
            print("StartBiasCustom", value.CivilizationType, value.CustomPlacement);
            table.insert(bbs_custom_bias, {
                CivilizationType = value.CivilizationType,
                CustomPlacement = value.CustomPlacement
            });
        end
    end

    -- Get Players data
    local civilisationsIDs = PlayerManager.GetAliveMajorIDs();
    for i = 1, PlayerManager.GetAliveMajorsCount() do
        local player = Players[civilisationsIDs[i]];
        local leader = PlayerConfigurations[civilisationsIDs[i]]:GetLeaderTypeName();
        local name = PlayerConfigurations[civilisationsIDs[i]]:GetCivilizationTypeName();
        local team = Players[civilisationsIDs[i]]:GetTeam();
        local newCivilization = CivilizationAssignSpawn.new(player, leader, name, team)
        if leader ~= BBS_LEADER_TYPE_SPECTATOR then
            BBS_Teams[team] = BBS_Teams[team] or 0
            _Debug("IsTeamerConfig - Added in team ", team)
            BBS_Teams[team] = BBS_Teams[team] + 1;
        end
        table.insert(BBS_Civilisations, newCivilization);
    end

    -- Get City States data
    local BBS_Citystates = {}
    local citystatesIDs = PlayerManager.GetAliveMinorIDs();

    for i = 1, PlayerManager.GetAliveMinorsCount() do
        local player = Players[citystatesIDs[i]];
        local leader = PlayerConfigurations[citystatesIDs[i]]:GetLeaderTypeName();
        local name = PlayerConfigurations[citystatesIDs[i]]:GetCivilizationTypeName();
        local newCS = CivilizationAssignSpawn.new(player, leader, name, nil)

        table.insert(BBS_Citystates, newCS);
    end

    -- Adjust min distance in function of player number
    -- Count number of real players in the game
    total_players = 0
    for i = 1, PlayerManager.GetAliveMajorsCount() do
        player = PlayerConfigurations[civilisationsIDs[i]]
        if (player:GetLeaderTypeName() ~= BBS_LEADER_TYPE_SPECTATOR and player:GetHandicapTypeID() ~= 2021024770) then
            total_players = total_players + 1
        end
    end

    GlobalNumberOfRegions = total_players + PlayerManager.GetAliveMinorsCount();

    if MapConfiguration.GetValue("BBS_Team_Spawn") ~= nil then
        Teamers_Config = MapConfiguration.GetValue("BBS_Team_Spawn")
    end

    instance:__InitStartingData()

    if Contains(MapScripts, bbs_game_config.BBS_MAP_SCRIPT) == false then
        print("Map is not supported by BBM ' Firaxis placement will be used");
        Game:SetProperty("BBM_SUPPORTEDMAP", false)
        CallFiraxisPlacement(args);
        return instance;
    else
        Game:SetProperty("BBM_SUPPORTEDMAP", true)
        print("Map is supported by BBM");
    end

    -- Set game properties
    Game:SetProperty("BBM_MAJOR_DISTANCE", BBS_HexMap.minimumDistanceMajorToMajorCivs);

    print("Start Assign Score Centroid",  os.date("%c"))

    local isTeamer = IsTeamerConfig();

    -- Define scores for centroids
    for _, civ in pairs(BBS_Civilisations) do
        civ:CalculateTotalScores(BBS_HexMap);
    end

    print("End Assign Score Centroid",  os.date("%c"))

    print("Start Assign spawn order",  os.date("%c"))
    -- Define spawn order 
    -- Comparing first the number of valid tiles, placing first 
    for _, civ in pairs(BBS_Civilisations) do
        print(tostring(civ.CivilizationLeader).." - ScoreTotal = "..tostring(civ.TotalMapScore).." -  Valid tiles = "..tostring(civ.TotalValidTiles))
    end

    table.sort(BBS_Civilisations,
            function(a, b)
                if a.TotalValidTiles == b.TotalValidTiles then
                    if a.TotalMapScore == b.TotalMapScore then
                        print("SortBBS_Civilisations same score ", a.RandomPlaceIdOrder, a.CivilizationLeader, b.RandomPlaceIdOrder, b.CivilizationLeader)
                        return a.RandomPlaceIdOrder < b.RandomPlaceIdOrder;
                    else
                        print("SortBBS_Civilisations Same valid tiles")
                        return a.TotalMapScore < b.TotalMapScore
                    end
                else
                    print("SortBBS_Civilisations Less valid tiles")
                    -- less score = more constraints for bias respect
                    return a.TotalValidTiles < b.TotalValidTiles
                end
            end)

    for _, civ in pairs(BBS_Civilisations) do
        print(tostring(civ.CivilizationLeader).." - ScoreTotal = "..tostring(civ.TotalMapScore).." -  Valid tiles = "..tostring(civ.TotalValidTiles))
    end

    -- Recursive call 
    local BBS_AssignTries = 0;
    local BBS_Success = false;
    local TriesMajorSpawnableLeft = {};
    while BBS_Success == false and BBS_AssignTries < bbs_game_config.BBM_MIN_ATTEMPTS do
        BBS_AssignTries = BBS_AssignTries + 1;
        -- Place all civs and fill BBS_HexMap.tempMajorSpawns
        local placementOK = instance:__PlaceMajorCivs(BBS_Civilisations, BBS_HexMap, BBS_AssignTries);
        -- Determine how many spawnable tiles left
        local countMajorSpawnableLeft = BBS_HexMap:GetNumberMajorSpawnable(true);
        TriesMajorSpawnableLeft[BBS_AssignTries] = countMajorSpawnableLeft;
       
        instance:__ResetMajorsSpawns(BBS_Civilisations, BBS_HexMap);
        if placementOK == false then
            --instance:__ResetMajorsSpawns(BBS_Civilisations, BBS_HexMap);
            BBS_HexMap.tempMajorSpawns[BBS_AssignTries] = {};
            print("Failed try number "..tostring(BBS_AssignTries))
        else
            print("BBS_Success on try "..tostring(BBS_AssignTries),  os.date("%c"))
        end
    end
    local maxMeanScore = 0;
    local globalMinScore = 0;
    local maxMeanScoreIndex = 0
    local globalMajorSpawnableScore = 0;
    for index, c in pairs(BBS_HexMap.tempMajorSpawns) do
        local list = BBS_HexMap.tempMajorSpawns[index]
        local majorSpawnableScore = TriesMajorSpawnableLeft[index]
        local minLocalScore = 9999;
        local maxLocalScore = 0;
        local minDiffScore = 0;
        local meanScore = 0
        if #list > 0 then
            local totalScore = 0
            for _, civscore in pairs(list) do
                totalScore = totalScore + civscore.Score;
                if civscore.Score < minLocalScore then
                    minLocalScore = civscore.Score;
                end
                if civscore.Score > maxLocalScore then
                    maxLocalScore = civscore.Score;
                end
            end

            _Debug("majorSpawnableScore = ", majorSpawnableScore);

            meanScore = totalScore / #list
            if isTeamer and BBS_HexMap:IsTeamerValidContinentPlacement(index) == false then
                _Debug("Malus try score because all team spawns in a single continent")
                meanScore = meanScore - 20;
            end

            minDiffScore = maxLocalScore - minLocalScore
            -- Take the highest minimum score, if equals, highest mean
            if (minLocalScore > globalMinScore) or (meanScore > maxMeanScore and minLocalScore >= globalMinScore) then
                BBS_Success = true;
                --globalMinDiffScore = minDiffScore;
                maxMeanScore = meanScore;
                globalMinScore = minLocalScore;
                globalMajorSpawnableScore = majorSpawnableScore;
                maxMeanScoreIndex = index;
            end
        end
        print("Assign mean score for try "..tostring(index).." = "..meanScore.." with minimum score of "..tostring(minLocalScore).." and maximum of "..tostring(maxLocalScore))
    end

    print("End Assign spawn order",  os.date("%c"))
    print("BBS_AssignTries = "..tostring(BBS_AssignTries).." - BBS_Success = "..tostring(BBS_Success))
    if BBS_Success then
        print("Selected try max score = "..tostring(maxMeanScoreIndex))
        if isTeamer then
            Game:SetProperty("BBS_TEAMERCONTINENTCHECK", BBS_HexMap:IsTeamerValidContinentPlacement(maxMeanScoreIndex))
        end
        for _, c in pairs(BBS_HexMap.tempMajorSpawns[maxMeanScoreIndex]) do
            print("tempMajorSpawns AssignMajorCivSpawn for "..c.Civ.CivilizationLeader.." "..c.Spawn:PrintXY())
            c.Civ:AssignMajorCivSpawn(BBS_HexMap, c.Spawn);
        end
         -- Firaxis methods for attribution of spawns 
        for j, civ in pairs(BBS_Civilisations) do
            if civ.CivilizationLeader ~= BBS_LEADER_TYPE_SPECTATOR then
                civ.Player:SetStartingPlot(civ.StartingHex.Plot)
                table.insert(BBS_HexMap.majorSpawns, civ.StartingHex);
                local bW, nbW = civ.StartingHex:HasSpawnEnoughWalkableTiles()
                print(civ.CivilizationLeader.." spawn = "..tostring(civ.StartingHex:PrintXY()).." - HasWalkableRequirements = "..tostring(bW).." "..tostring(nbW))
                _Debug("WalkableHexInRing ", civ.StartingHex:PrintXY(), #civ.StartingHex.WalkableHexInRing[1])
                _Debug("WalkableHexInRing ", civ.StartingHex:PrintXY(), #civ.StartingHex.WalkableHexInRing[2])
                _Debug("WalkableHexInRing ", civ.StartingHex:PrintXY(), #civ.StartingHex.WalkableHexInRing[3])

            else
                local hex0 = BBS_HexMap:GetHexInMap(j, 0);
                civ.Player:SetStartingPlot(hex0.Plot)
            end
        end
        -- Measure minimum distance
        local closestDist = 9999
        for _, hex in ipairs(BBS_HexMap.majorSpawns) do
            local localClosestDist = hex:DistanceToClosest(BBS_HexMap, BBS_HexMap.majorSpawns)
            if localClosestDist < closestDist then
                closestDist = localClosestDist;
            end
        end
        Game:SetProperty("BBM_ACTUALMINDIST", closestDist)
        _Debug("BBM_ACTUALMINDIST = ", closestDist)
        _Debug("BBM_ACTUALMINDIST GameProperty = ", Game:GetProperty("BBM_ACTUALMINDIST"))
        print("Start BalanceMap",  os.date("%c"))
        BalanceMap(BBS_HexMap);

        print("Start InitSpawnBalancing",  os.date("%c"))
        local allSpawnBalancing = {}
        for _, civ in pairs(BBS_Civilisations) do
            if civ.CivilizationLeader ~= BBS_LEADER_TYPE_SPECTATOR then
                local spawn = InitSpawnBalancing(BBS_HexMap, civ);
                table.insert(allSpawnBalancing, spawn);
            end
        end

        printAllStartYields(BBS_HexMap);
        BalanceAllCivYields(allSpawnBalancing)
        print("End InitSpawnBalancing",  os.date("%c"))
        -- randomly place cs in free space
        for i, cs in pairs(BBS_Citystates) do
            local foundSpawn = false
            local validspawnsleft = BBS_HexMap:GetAnyMinorSpawnablesTiles()
            while foundSpawn == false do
                local rng = TerrainBuilder.GetRandomNumber(#validspawnsleft - 1, "Random valid spawns");
                local testedHex = validspawnsleft[rng+1]
                if testedHex.IsCivStartingPlot == false then
                    foundSpawn = true;
                    cs:AssignMinorCivSpawn(BBS_HexMap, testedHex)
                    cs.Player:SetStartingPlot(cs.StartingHex.Plot)
                    print("CS "..tostring(i).." - "..tostring(cs.CivilizationName).." spawn = "..tostring(cs.StartingHex:PrintXY()))
                end
            end
            
        end
        Game:SetProperty("BBM_RESPAWN", true)
        print("End Assign Centroid",  os.date("%c"))
    else
        print("BBS_AssignStartingPlots: To Many Attempts Failed - Go to Firaxis Placement")
        CallFiraxisPlacement(args);
    end   
    
    -- print("BBS_AssignStartingPlots: Sending Data")
    return instance
end

BBS_resources_count = {};

-- Check bias in cluster
-- Check closest water tile from center of cluster
-- Exclude distance to player

-- 1: Min distance between civilisations
-- 2: Spawn bias
-- 3: Fresh water settle
function BBS_AssignStartingPlots:__InitStartingData()
    print("Start parsing map",  os.date("%c"))
    -- Datas stored in HexMap object
    local width, height = Map.GetGridSize();
    BBS_HexMap = HexMap.new(width, height, bbs_game_config.BBS_MAP_SCRIPT);

    --BBS_HexMap:PrintHexSpawnableMap();
    BBS_HexMap:PrintHexPeninsuleMap();

    BBS_HexMap:RunKmeans(GlobalNumberOfRegions, 30);
    BBS_HexMap:PrintHexMap();
    for _, c in pairs(BBS_HexMap.centroidsArray) do
        c:ComputeCentroidScore();
    end
    -- TEMP get hexes from a region (same centroid)
    -- TEMP count % of hills in a region
    for index, centroid in ipairs(BBS_HexMap.centroidsArray) do
        if centroid.HexCluster ~= nil and #centroid.HexCluster > 0 then 
            local count = centroid:GetHillsInCluster();
            local hillPercent = (count / #centroid.HexCluster) * 100
            print("Number of hill in centroid "..tostring(index).." = "..tostring(count).." for a total of "..tostring(#centroid.HexCluster).." tiles (="..tostring(hillPercent).."%)")
            local luxCount, bonusCount, strategicsCount = centroid:GetTotalResourcesCountInCluster();
            print("Number of lux resource in centroid "..tostring(index).." = "..tostring(luxCount))
            print("Number of bonus resource in centroid "..tostring(index).." = "..tostring(bonusCount))
            print("Number of strat resource in centroid "..tostring(index).." = "..tostring(strategicsCount))
        end
    end
    -- Count % of hills on the land map
    local countHills, _ = BBS_HexMap:LookForHills();
    local countLandTiles, _ = BBS_HexMap:GetLandHexList();
    print("totalLandPlots = "..tostring(countLandTiles))
    print("totalHillPlots = "..tostring(countHills))
    print("totalCostal = "..tostring(#BBS_HexMap.mapCostal))
    local hillpercent = (countHills / countLandTiles) * 100
    print("Hill% = "..tostring(hillpercent).." %")
     --------------------
    print("Done parsing map",  os.date("%c"))
    _Debug("END BBM WORK",  os.date("%c"))
end

function BBS_AssignStartingPlots:__PlaceMajorCivs(civs, BBS_HexMap, index) 
-- TODO : manage cases when unable to place a civ => rollback and try again
    BBS_HexMap.tempMajorSpawns[index] = {};
    for ind, civ in pairs(civs) do
        if civ.CivilizationLeader ~= BBS_LEADER_TYPE_SPECTATOR then
            local placed, spawnHex, score = civ:AssignSpawnByCentroid(BBS_HexMap);
            if placed == false then
                print("Failed to place civ "..tostring(civ.CivilizationLeader))
                return false;
            end
            table.insert(BBS_HexMap.tempMajorSpawns[index], {Civ = civ, Spawn = spawnHex, Score = score});
            _Debug("Civ ", ind, " in team ", civ.CivilizationTeam, " - Continent ID = ", spawnHex.IdContinent)
        end
    end
    return true;
end

function BBS_AssignStartingPlots:__ResetMajorsSpawns(civs, BBS_HexMap)
    BBS_HexMap.majorSpawns = {};
    BBS_HexMap:ResetSpawnableHex();
    for _, civ in pairs(civs) do
        if civ.AttributedCentroid ~= nil then
            civ.AttributedCentroid.PlacedCiv = false;
        end
        civ.AttributedCentroid = nil;
        civ.StartingHex = {};
    end
end

-- At least 4v4 and 2 teams
-- Fixed index is used here in case team number is not the usual 1 and 2
function IsTeamerConfig()
    local teamCount = 0
    local team1Size = 0
    local team2Size = 0
    local fixedIndex = 1
    for team, _ in pairs(BBS_Teams) do
        teamCount = teamCount + 1;
        if fixedIndex == 1 then
            team1Size = BBS_Teams[team]
        elseif fixedIndex == 2 then
            team2Size = BBS_Teams[team]
        end
        fixedIndex = fixedIndex + 1;
    end
    local isTeamerConfig = teamCount == 2;
    _Debug("IsTeamerConfig : ", teamCount, team1Size, team2Size, isTeamerConfig);
    return isTeamerConfig;
end


function CallFiraxisPlacement(args)
    Game:SetProperty("BBM_RESPAWN", false)
    local argSPlot = AssignStartingPlots.Create(args)
end