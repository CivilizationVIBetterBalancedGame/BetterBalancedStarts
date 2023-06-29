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

local BBS_VERSION = "2.2.0"

--------------------------------------------------------------------------------
-- constant definition  --------------------------------------------------------
--------------------------------------------------------------------------------
-- Min distance definition
local BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE = {};
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["Highlands_XP2.lua"] = 15
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["Lakes.lua"] = 15
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["InlandSea.lua"] = 14
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["Seven_Seas.lua"] = 13
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["Primordial.lua"] = 13
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["Pangaea.lua"] = 12
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["DWPangaea.lua"] = 12
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["Shuffle.lua"] = 12
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["Tilted_Axis.lua"] = 12
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["Fractal.lua"] = 10
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["Island_Plates.lua"] = 10
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["Small_Continents.lua"] = 10
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["Archipelago_XP2.lua"] = 10
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["Continents.lua"] = 10
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["Wetlands_XP2.lua"] = 10
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["Continents_Islands.lua"] = 10
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["Splintered_Fractal.lua"] = 10
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["DWArchipelago.lua"] = 10
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["DWFractal.lua"] = 10
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["DWMixedLand.lua"] = 10
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["DWSmallContinents.lua"] = 10
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["DWMixedIslands.lua"] = 10
BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE["Terra.lua"] = 8

-- Special civilisations types
BBS_LEADER_TYPE_SPECTATOR = "LEADER_SPECTATOR"

--------------------------------------------------------------------------------
--  Init metatable -------------------------------------------------------------
--------------------------------------------------------------------------------

BBS_AssignStartingPlots = {};
BBS_HexMap = {};

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
        BBS_MIN_DISTANCE = MapConfiguration.GetValue("BBSMinDistance"),
    }

    instance = {
        __InitStartingData      = BBS_AssignStartingPlots.__InitStartingData,
        __FindBias              = BBS_AssignStartingPlots.__FindBias,
        __ComputeBiasScore      = BBS_AssignStartingPlots.__ComputeBiasScore,
        __GetTerrainIndex       = BBS_AssignStartingPlots.__GetTerrainIndex,
        __GetFeatureIndex       = BBS_AssignStartingPlots.__GetFeatureIndex,
        __GetResourceIndex      = BBS_AssignStartingPlots.__GetResourceIndex,

        majorSpawns = {},
        minorSpawns = {},
    }

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
    -- Get min distance
    local bbs_min_distance = bbs_game_config.BBS_MIN_DISTANCE
    print("bbs_min_distance", bbs_min_distance)
    -- Set min distance if minDistance is nil or 0 via map settings
    if ((bbs_min_distance == nil or bbs_min_distance == 0) and 
        bbs_game_config.BBS_MAP_SCRIPT ~= nil) 
    then
        bbs_min_distance = BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE[bbs_game_config.BBS_MAP_SCRIPT]
    end
    
    -- Get Players data
    local bbs_civilisations = {};
    local civilisationsIDs = PlayerManager.GetAliveMajorIDs();

    for i = 1, PlayerManager.GetAliveMajorsCount() do
        local player = Players[civilisationsIDs[i]];
        local leader = PlayerConfigurations[civilisationsIDs[i]]:GetLeaderTypeName();
        local name = PlayerConfigurations[civilisationsIDs[i]]:GetCivilizationTypeName();
        local team = Players[civilisationsIDs[i]]:GetTeam();
        local newCivilization = CivilizationAssignSpawn.new(player, leader, name, team)

        table.insert(bbs_civilisations, newCivilization);

        --instance.iNumMajorCivs = instance.iNumMajorCivs + 1
        --table.insert(instance.majorList, civilisationsIDs[i])
    end

    -- Get City States data
    local bbs_citystates = {}
    local citystatesIDs = PlayerManager.GetAliveMinorIDs();

    for i = 1, PlayerManager.GetAliveMinorsCount() do
        local player = Players[citystatesIDs[i]];
        local leader = PlayerConfigurations[citystatesIDs[i]]:GetLeaderTypeName();
        local name = PlayerConfigurations[citystatesIDs[i]]:GetCivilizationTypeName();
        local newCS = CivilizationAssignSpawn.new(player, leader, name, nil)
        
        table.insert(bbs_citystates, newCS);
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
    local number_player_settings = (bbs_game_config.BBS_MAP_SIZE + 1) * 2
    -- If has more players than base setting reduce distance by 2
    -- If has less players then base setting increase distance by 2
    if total_players > number_player_settings then
        bbs_min_distance = bbs_min_distance - 2;
    elseif total_players < number_player_settings then
        bbs_min_distance = bbs_min_distance + 2;
    end

    -- Set game properties
    Game:SetProperty("BBS_MAJOR_DISTANCE", bbs_min_distance)

    if MapConfiguration.GetValue("BBS_Team_Spawn") ~= nil then
		Teamers_Config = MapConfiguration.GetValue("BBS_Team_Spawn")
	end

    local BBS_failed = false;

    instance:__InitStartingData()

    print("Start Assign Centroid",  os.date("%c"))
    -- Place civs, highest bias first
    table.sort(bbs_civilisations, function (a, b)
        return a.HighestBias < b.HighestBias;
    end)
    for _, civ in pairs(bbs_civilisations) do
        civ:AssignSpawnByCentroid(BBS_HexMap);
    end

    -- Firaxis attribution of spawns 
    for j, civ in pairs(bbs_civilisations) do
        if civ.CivilizationLeader ~= BBS_LEADER_TYPE_SPECTATOR then
            civ.Player:SetStartingPlot(civ.StartingHex.Plot)
            table.insert(instance.majorSpawns, civ.StartingHex);
            print(civ.CivilizationLeader.." spawn = "..tostring(civ.StartingHex:PrintXY()))
        else
            local hex0 = BBS_HexMap:GetHexInMap(j, 0);
            civ.Player:SetStartingPlot(hex0.Plot)
        end
    end
    -- randomly place cs in free space
    for i, cs in pairs(bbs_citystates) do
        local foundSpawn = false
        local validspawnsleft = BBS_HexMap:GetAnySpawnablesTiles()
        while foundSpawn == false do
            local rng = TerrainBuilder.GetRandomNumber(#validspawnsleft - 1, "Random valid spawns");
            local testedHex = validspawnsleft[rng+1]
            local distMinor = testedHex:DistanceToClosest(BBS_HexMap, instance.minorSpawns) 
            local distMajor = testedHex:DistanceToClosest(BBS_HexMap, instance.majorSpawns)
            if testedHex.IsCivStartingPlot == false and (distMinor == nil or distMinor > 7) and (distMajor == nil or distMajor > 8) then
                foundSpawn = true;
                table.insert(instance.minorSpawns, testedHex);
                cs.StartingHex = testedHex
                testedHex.IsCivStartingPlot = true;
                cs.Player:SetStartingPlot(cs.StartingHex.Plot)
                print("CS "..tostring(i).." spawn = "..tostring(cs.StartingHex:PrintXY()))
            end
        end
        
    end
    --StartPositioner.DivideMapIntoMinorRegions(instance.iNumMinorCivs);
    Game:SetProperty("BBS_RESPAWN", true)
    print("End Assign Centroid",  os.date("%c"))
    
    if BBS_failed then
        print("BBS_AssignStartingPlots: To Many Attempts Failed - Go to Firaxis Placement")
        Game:SetProperty("BBS_RESPAWN", false)
        local argSPlot = AssignStartingPlots.Create(args)

        return instance;
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

    BBS_HexMap:RunKmeans(20, 30);
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

end


