---------------------------------------
-- CivilizationAssignSpawn
---------------------------------------

CivilizationAssignSpawn = {}

function CivilizationAssignSpawn.new(player, leader, name, team)
    local instance = {}
    setmetatable(instance, {__index = CivilizationAssignSpawn});
    instance.Player = player;
    instance.CivilizationLeader = leader;
    instance.CivilizationName = name;
    instance.CivilizationTeam = team;
    instance.IsNoBias = false;
    instance.IsCoastalBias = false;
    instance.IsJungleBias = false;
    instance.IsDesertBias = false;
    instance.IsTundraBias = false;
    instance.IsRiverBias = false;
    instance.IsFloodplainsBias = false;
    instance.IsHydrophobicBias = false;
    instance.IsNoFreshWaterBias = false;
    instance.IsSaltyBias = false;
    instance.IsKingNorthBias = false;
    instance.IsContSplitBias = false;
    instance.IsMountainLoverBias = false;
    instance.IsMountainBias = false; --less priority than the lover
    instance.IsOceanBias = false;
    instance.HighestBias = 6
    instance.CivilizationBiases = instance:GetBiases();
    -- Table containing all differents score for each centroid
    instance.CentroidsScore = {}
    instance.AttributedCentroid = nil;
    instance.StartingHex = nil;
    return instance;
end

-- Fill all the biases data for the civ and set the parameters
function CivilizationAssignSpawn:GetBiases()
    local biases = {};
    if GameInfo.Leaders_XP2[self.CivilizationLeader] ~= nil and GameInfo.Leaders_XP2[self.CivilizationLeader].OceanStart == true then
        --self.IsOceanBias = true;
        local bias = {};
        bias.IsNegative = false;
        bias.Tier = 1;
        bias.Type = "TERRAINS";
        bias.Value = g_TERRAIN_TYPE_COAST;
        ___Debug("BBS_AssignStartingPlots: Add Bias : Civilization",self.CivilizationName,"Bias Type:", bias.Type, "Tier :", bias.Tier, "Type :", row.TerrainType);
        table.insert(biases, bias);
        self.IsCoastalBias = true;
    end
    for row in GameInfo.StartBiasResources() do
        if(row.CivilizationType == self.CivilizationName) then
            local bias = {};
            bias.IsNegative = false;
            bias.Tier = row.Tier;
            bias.Type = "RESOURCES";
            bias.Value = GetResourceIndex(row.ResourceType);
            ___Debug("BBS_AssignStartingPlots: Add Bias : Civilization",self.CivilizationName,"Bias Type:", bias.Type, "Tier :", bias.Tier, "Type :", row.ResourceType);
            table.insert(biases, bias);
        end
    end
    for row in GameInfo.StartBiasFeatures() do
        if(row.CivilizationType == self.CivilizationName) then
            local bias = {};
            bias.IsNegative = false;
            bias.Tier = row.Tier;
            bias.Type = "FEATURES";
            bias.Value = GetFeatureIndex(row.FeatureType);
            ___Debug("BBS_AssignStartingPlots: Add Bias : Civilization",self.CivilizationName,"Bias Type:", bias.Type, "Tier :", bias.Tier, "Type :", row.FeatureType);
            table.insert(biases, bias);
            if bias.Value == g_FEATURE_FLOODPLAINS or bias.Value == g_FEATURE_FLOODPLAINS_GRASSLAND or bias.Value == g_FEATURE_FLOODPLAINS_PLAINS then
                self.IsFloodplainsBias = true;
            end
            if bias.Value == g_FEATURE_JUNGLE then
                self.IsJungleBias = true;
            end
        end
    end
    for row in GameInfo.StartBiasTerrains() do
        if(row.CivilizationType == self.CivilizationName) then
            local bias = {};
            bias.IsNegative = false;
            bias.Tier = row.Tier;
            bias.Type = "TERRAINS";
            bias.Value = GetTerrainIndex(row.TerrainType);
            ___Debug("BBS_AssignStartingPlots: Add Bias : Civilization",self.CivilizationName,"Bias Type:", bias.Type, "Tier :", bias.Tier, "Type :", row.TerrainType);
            table.insert(biases, bias);
            if bias.Value == g_TERRAIN_TYPE_COAST then --only wilhemine has non T1 coast bias -what to do with her)
                self.IsCoastalBias = true
            elseif bias.Tier == 1 and (bias.Value == g_TERRAIN_TYPE_DESERT or bias.Value == g_TERRAIN_TYPE_DESERT_HILLS or bias.Value == g_TERRAIN_TYPE_DESERT_MOUNTAIN) then
                self.IsDesertBias = true;
            elseif bias.Tier == 1 and (bias.Value == g_TERRAIN_TYPE_TUNDRA or bias.Value == g_TERRAIN_TYPE_TUNDRA_HILLS or bias.Value == g_TERRAIN_TYPE_TUNDRA_MOUNTAIN) then
                self.IsTundraBias = true;
            elseif IsMountain(bias.Value) then
                self.IsMountainBias = true;
            end
        end
    end
    for row in GameInfo.StartBiasRivers() do
        if(row.CivilizationType == self.CivilizationName) then
            local bias = {};
            bias.IsNegative = false;
            bias.Tier = row.Tier;
            bias.Type = "RIVERS";
            bias.Value = nil;
            ___Debug("BBS_AssignStartingPlots: Add Bias : Civilization",self.CivilizationName,"Bias Type:", bias.Type, "Tier :", bias.Tier, "Type :", bias.Value);
            table.insert(biases, bias);
            print("BBS_AssignStartingPlots - Civilization ",self.CivilizationName)
            self.IsRiverBias = true;
        end
    end
	for _, row in ipairs(bbs_negative_bias) do
        if(row.CivilizationType == self.CivilizationName) then
            local bias = {};
            bias.IsNegative = true;
			if row.TerrainType ~= nil then
				bias.Value = GetTerrainIndex(row.TerrainType);
				bias.Type = "NEGATIVE_TERRAINS";
				bias.Tier = row.Tier;
				___Debug("BBS_AssignStartingPlots: Add Bias : Civilization",self.CivilizationName,"Bias Type:", bias.Type, "Tier :", bias.Tier, "Type :", row.TerrainType);
				table.insert(biases, bias);
				elseif row.FeatureType ~= nil then
				bias.Value = GetFeatureIndex(row.FeatureType);
				bias.Type = "NEGATIVE_FEATURES";
				bias.Tier = row.Tier;
				___Debug("BBS_AssignStartingPlots: Add Bias : Civilization",self.CivilizationName,"Bias Type:", bias.Type, "Tier :", bias.Tier, "Type :", row.FeatureType);
				table.insert(biases, bias);
				elseif row.ResourceType ~= nil then
				bias.Value = GetResourceIndex(row.ResourceType);
				bias.Type = "NEGATIVE_RESOURCES";
				bias.Tier = row.Tier;
				___Debug("BBS_AssignStartingPlots: Add Bias : Civilization",self.CivilizationName,"Bias Type:", bias.Type, "Tier :", bias.Tier, "Type :", row.ResourceType);
				table.insert(biases, bias);
			end	
        end
    end
	for _, row in ipairs(bbs_custom_bias) do
        if(row.CivilizationType == self.CivilizationName) then
            local bias = {};
            bias.IsNegative = false;
			if row.CustomPlacement ~= nil then
				bias.Type = row.CustomPlacement;
				bias.Tier = 1;
				bias.Value = -1;
				___Debug("BBS_AssignStartingPlots: Add Bias : Civilization",self.CivilizationName,"Bias Type:", bias.Type, "Tier :", bias.Tier, "Type :", bias.Value);
				___Debug("BBS_AssignStartingPlots: Add Bias : Civilization",self.CivilizationName,"Bias Type:", bias.Type, "Tier :", bias.Tier, "Type :", bias.Value);
				table.insert(biases, bias);
                -- Custom Biases 
                if (bias.Type == "CUSTOM_NO_FRESH_WATER") then
                    self.IsNoFreshWaterBias = true;
                elseif (bias.Type == "CUSTOM_CONTINENT_SPLIT") then
                    self.IsContSplitBias = true;
                elseif (bias.Type == "CUSTOM_NO_LUXURY_LIMIT") then
                    print("Calculate no lux limit score "..tostring(bias.Value))
                elseif (bias.Type == "CUSTOM_MOUNTAIN_LOVER") then
                    print("self.IsMountainLoverBias = true")
                    self.IsMountainLoverBias = true;
                elseif (bias.Type == "CUSTOM_KING_OF_THE_NORTH") then	
                    print("King of the North Bias found")
                    self.IsKingNorthBias = true;
                elseif (bias.Type == "CUSTOM_I_AM_SALTY")  then	
                    self.IsSaltyBias = true;
                elseif (bias.Type == "CUSTOM_HYDROPHOBIC") then	
                    self.IsHydrophobicBias = true;
                    self.IsNoFreshWaterBias = true;
                end			
			end			
        end
    end
    table.sort(biases, function(a, b) return a.Tier < b.Tier; end);
    if #biases > 0 then
        -- Get highest non negative feature (mapuche has negative feat as highest tier)
        -- 6 is default value for non bias
        for i, bias in pairs(biases) do
            if self.HighestBias == 6 and bias.Type ~= "NEGATIVE_FEATURES" and bias.Type ~= "NEGATIVE_TERRAINS" and bias.Type ~= "NEGATIVE_RESOURCES" then
                self.HighestBias = biases[i].Tier
            end
        end
       
    else 
        self.HighestBias = 6
        self.IsNoBias = true;
    end
    return biases;
end

-- Need to convert the bias value (in text) from database to the corresponding index
function GetTerrainIndex(terrainType)
    if (terrainType == "TERRAIN_COAST") then
        return g_TERRAIN_TYPE_COAST;
    elseif (terrainType == "TERRAIN_DESERT") then
        return g_TERRAIN_TYPE_DESERT;
    elseif (terrainType == "TERRAIN_TUNDRA") then
        return g_TERRAIN_TYPE_TUNDRA;
    elseif (terrainType == "TERRAIN_SNOW") then
        return g_TERRAIN_TYPE_SNOW;
    elseif (terrainType == "TERRAIN_PLAINS") then
        return g_TERRAIN_TYPE_PLAINS;
    elseif (terrainType == "TERRAIN_GRASS") then
        return g_TERRAIN_TYPE_GRASS;
    elseif (terrainType == "TERRAIN_DESERT_HILLS") then
        return g_TERRAIN_TYPE_DESERT_HILLS;
    elseif (terrainType == "TERRAIN_TUNDRA_HILLS") then
        return g_TERRAIN_TYPE_TUNDRA_HILLS;
    elseif (terrainType == "TERRAIN_TUNDRA_MOUNTAIN") then
        return g_TERRAIN_TYPE_TUNDRA_MOUNTAIN;
    elseif (terrainType == "TERRAIN_SNOW_HILLS") then
        return g_TERRAIN_TYPE_SNOW_HILLS;
    elseif (terrainType == "TERRAIN_PLAINS_HILLS") then
        return g_TERRAIN_TYPE_PLAINS_HILLS;
    elseif (terrainType == "TERRAIN_GRASS_HILLS") then
        return g_TERRAIN_TYPE_GRASS_HILLS;
    elseif (terrainType == "TERRAIN_GRASS_MOUNTAIN") then
        return g_TERRAIN_TYPE_GRASS_MOUNTAIN;
    elseif (terrainType == "TERRAIN_PLAINS_MOUNTAIN") then
        return g_TERRAIN_TYPE_PLAINS_MOUNTAIN;
    elseif (terrainType == "TERRAIN_DESERT_MOUNTAIN") then
        return g_TERRAIN_TYPE_DESERT_MOUNTAIN;
    end
end

function GetFeatureIndex(featureType)
    if (featureType == "FEATURE_VOLCANO") then
        return g_FEATURE_VOLCANO;
    elseif (featureType == "FEATURE_JUNGLE") then
        return g_FEATURE_JUNGLE;
    elseif (featureType == "FEATURE_FOREST") then
        return g_FEATURE_FOREST;
    elseif (featureType == "FEATURE_MARSH") then
        return 5;
    elseif (featureType == "FEATURE_FLOODPLAINS") then
        return g_FEATURE_FLOODPLAINS;
    elseif (featureType == "FEATURE_FLOODPLAINS_PLAINS") then
        return g_FEATURE_FLOODPLAINS_PLAINS;
    elseif (featureType == "FEATURE_FLOODPLAINS_GRASSLAND") then
        return g_FEATURE_FLOODPLAINS_GRASSLAND;
    elseif (featureType == "FEATURE_GEOTHERMAL_FISSURE") then
        return g_FEATURE_GEOTHERMAL_FISSURE;
    end
end

function GetResourceIndex(resourceType)
    local resourceTypeName = "LOC_" .. resourceType .. "_NAME";
    for row in GameInfo.Resources() do
        if (row.Name == resourceTypeName) then
            return row.Index;
        end
    end
end

-- Find the total score 
function CivilizationAssignSpawn:CalculateTotalScores(BBS_HexMap)
    -- Define scores for centroids and order them by score
    if self.CivilizationLeader ~= BBS_LEADER_TYPE_SPECTATOR then
        self:CalculateOrderCentroidsScore(BBS_HexMap);
        -- Sum of centroid scores (cover all maps) 
        local totalScore = 0 
        local totalValidTiles = 0
        local maxCentScore = 0
        for _, c in pairs(self.CentroidsScore) do
            totalScore = totalScore + c.Score
            totalValidTiles = totalValidTiles + #c.ValidTilesBias
            if c.Score > maxCentScore then
                maxCentScore = c.Score;
            end
        end
        -- By default, if no bias are giving score, put the max score by default being the max number of regions
        if maxCentScore == 0 then
            totalScore = GlobalNumberOfRegions;
            maxCentScore = 1;
        end
        self.TotalMapScore = totalScore / maxCentScore
        self.TotalValidTiles = totalValidTiles
        print("CalculateTotalScores "..self.CivilizationLeader.." "..tostring(totalValidTiles))
    else 
        self.TotalMapScore = 100;
        self.TotalValidTiles = 0
    end

end


-- Main first method to call to assign spawn
-- Complete function of assigning spawn to a major civ 
-- Add more random to calculations for non coastal and non bias ? 
function CivilizationAssignSpawn:AssignSpawnByCentroid(BBS_HexMap)
    print("AssignSpawnByCentroid for "..self.CivilizationLeader);
    if self.CivilizationLeader == BBS_LEADER_TYPE_SPECTATOR then
        return true;
    end
    -- Recalculate valid tiles in each centroid
    self:CalculateOrderCentroidsScore(BBS_HexMap);
    -- Find the best tiles based on score of top centroids 
    local hexSpawnFound, score = self:FindHighestScoreHex();

    -- 
    if hexSpawnFound ~= nil then
        self:AssignMajorCivSpawn(BBS_HexMap, hexSpawnFound);
        return true, hexSpawnFound, score;
    else 
         -- Try again or go to firaxis placement
        print("Unable to find a valid tile for this civ on this map")
        return false, nil, nil;
    end
end


-- Order the regions based on bias score and number of valid spawn tiles
function CivilizationAssignSpawn:CalculateOrderCentroidsScore(BBS_HexMap)
    self.CentroidsScore = {};
     -- Mean score for each hex in centroid cluster by bias
    for i, centroid in pairs(BBS_HexMap.centroidsArray) do
        local centScore = self:ComputeBiasScoreCiv(centroid);
        local meanPeninsulaScore = 0;
        local validTiles = self:GetValidSpawnsInHexList(centroid.HexCluster);
        local validBiasTiles = {}
        if #validTiles > 0 then
            for _, hex in pairs(validTiles) do
                if self:IsBiasRespected(hex, BBS_HexMap) then
                    table.insert(validBiasTiles, hex);
                    meanPeninsulaScore = meanPeninsulaScore + hex.PeninsulaScore;
                end
            end
            meanPeninsulaScore = meanPeninsulaScore / #validBiasTiles;
        end
        table.insert(self.CentroidsScore, { Centroid = centroid, Score = centScore, ValidTiles = validTiles, ValidTilesBias = validBiasTiles, MeanPeninsulaScore = meanPeninsulaScore, TundraScoring = centroid.TundraScore });
    end
     -- Go through each centroid, from highest to lower centroid score for the civ
    table.sort(self.CentroidsScore, 
    function(a, b) 
        if a.Score == 0 and b.Score == 0 then
            return #a.ValidTilesBias > #b.ValidTilesBias
        else
            return a.Score > b.Score
        end
    end)

    -- DEBUG PRINT
    print("Civilization : "..self.CivilizationLeader)
    for _, c in pairs(self.CentroidsScore) do
        print("AssignSpawnByCentroid - Score for centroid "..tostring(c.Centroid.id).." = "..tostring(c.Score).." Valid = "..tostring(#c.ValidTiles).." ValidBias = "..tostring(#c.ValidTilesBias).." TundraScoring = "..tostring(c.TundraScoring).." PeninsulaScore = "..tostring(c.MeanPeninsulaScore));
    end 

    return self.CentroidsScore;
end

-- Main method to get valid spawns tiles depending on civ bias 
function CivilizationAssignSpawn:GetValidSpawnsInHexList(listHex)
    local validTiles = {}
    for _, hex in pairs(listHex) do
        if hex.IsMajorSpawnable then --pre calculation of technical spawns
            if self.IsTundraBias == false and self.IsDesertBias == false and (hex.IsCloseToTundra == false and hex.TundraScore < 24) then
                if self.IsHydrophobicBias and hex:IsTundraLand() == false then -- ignore freshwater ?
                    table.insert(validTiles, hex);
                elseif self.IsCoastalBias and hex.IsCoastal and hex:IsTundraLand() == false then
                    -- Fresh water is favored on score calculations
                    table.insert(validTiles, hex);
                elseif (hex.IsFreshWater or hex.IsCoastal) and hex:IsTundraLand() == false then
                    table.insert(validTiles, hex);
                end
            elseif self.IsTundraBias and hex:IsTundraLand() and hex.IsFreshWater then
                table.insert(validTiles, hex);
            --elseif self.IsDesertBias and hex:IsDesertLand() and hex.IsFreshWater then
            elseif self.IsDesertBias and self:FindDesertBiasV2(hex) then
                table.insert(validTiles, hex); 
            end
        end
    end
    return validTiles;
end

-- Test for Mali : at least 2 desert tiles and 2 non desert
-- We do not check here fresh water, we will add oasis if needed
function CivilizationAssignSpawn:FindDesertBiasV2(hex)
    local countDesert = 0
    local countLand = 0
    for _, r in pairs(hex.AllRing6Map[1]) do
        if r:IsImpassable() == false then
            if r:IsDesertLand() then
                countDesert = countDesert + 1;
            elseif r:IsGrassLand() or r:IsPlainLand() then
                countLand = countLand + 1;
            end
        end
    end
    if countDesert >= 2 and countLand >= 2 then
        return true;
    end
    return false;
end

-- Find the best centroid for the civ from data analysis
function CivilizationAssignSpawn:FindHighestScoreHex()
    local topCentroids =  {};
    local i = 0;
    local totalSpawnableBias = 0;
    local useEveryValidTiles = false;
    -- self.CentroidsScore must be filled by CalculateOrderCentroidsScore method
    -- Get 3 best regions (already sorted by score or valid tiles)
    for _, c in pairs(self.CentroidsScore) do
        if #c.ValidTilesBias > 0 then
            table.insert(topCentroids, c)
            i = i + 1
            totalSpawnableBias = totalSpawnableBias + #c.ValidTilesBias
            if i == 5 then
                break;
            end
        end
    end
    -- TODO TRY : if not enough valid bias tile but lots of valid spawn : use these
    if totalSpawnableBias == 0 then
        print("Not enough vald tiles for bias, use default valid spawns")
        useEveryValidTiles = true;
        topCentroids =  {};
        i = 0
        for _, c in pairs(self.CentroidsScore) do
            if #c.ValidTiles > 0 then
                table.insert(topCentroids, c)
                i = i + 1
                if i == 5 then
                    break;
                end
            end
        end
    end
    if #topCentroids == 0 then
        --  No centroid found => not even a valid tile in the map = impossible to place civ
        return nil;
    end
    -- Compare regions by size of valids tiles and best score tile in region 
    local validTilesInTop5 = {}
    for _, c in pairs(topCentroids) do
        if useEveryValidTiles then 
            for _, h in pairs(c.ValidTiles) do
                table.insert(validTilesInTop5, h);
            end
        else
            for _, h in pairs(c.ValidTilesBias) do
                table.insert(validTilesInTop5, h);
            end
        end    
    end

    -- Take random tile among the highest scores 
    local selectedHex, score = self:GetHighestHexScore(validTilesInTop5)

    return selectedHex, score;
end


-- Return the highest score hex for this civ 
function CivilizationAssignSpawn:GetHighestHexScore(hexList)
    local scoring = {}
    -- Get all the hex scores for this civ and order them 
    for _, h in pairs(hexList) do
        local score = self:ComputeHexScoreCiv(h)
        table.insert(scoring, { Hex = h, Score = score})
    end
    table.sort(scoring, function(a, b) 
        return a.Score > b.Score; 
    end);
    local highestScore = scoring[1].Score;
    -- Take the highest score among the tiles
    local highestScoresTable = {}
    for _, s in pairs(scoring) do
        if s.Score == highestScore then
            print("GetHighestHexScore - Highest score found = "..tostring(s.Score).." "..s.Hex:PrintXY());
            table.insert(highestScoresTable, s)
        end
    end
    -- If multiples tiles with same score, take a random one
    if #highestScoresTable > 1 then
        highestScoresTable = GetShuffledCopyOfTable(highestScoresTable);
    end

    return highestScoresTable[1].Hex, highestScoresTable[1].Score; 
end


-- Calculate the hex score for a civ, taking account for the bias score + extra parameters like fresh water/yield etc (to determine) 
-- TODO Define scores
function CivilizationAssignSpawn:ComputeHexScoreCiv(hex)
    local score = 100

    -- Favor fresh water in almost every case 
    if self.IsNoFreshWaterBias or hex.IsFreshWater  then
        score = score + 20;
    elseif  hex.IsCoastal and (self.IsNoBias or self.IsCoastalBias) then -- coastal for no bias TEST
        score = score + 18;
    end

    local baseScore = tostring(score);
    local totalBiasScore = 0
    local countBias = 0;
    for _, bias in pairs(self.CivilizationBiases) do
        local thisBiasScore = ComputeHexScoreByBias(hex, bias);
        if thisBiasScore > 0 then
            countBias = countBias + 1;
        end
        totalBiasScore = totalBiasScore + thisBiasScore
        score = score + thisBiasScore;
    end

    local peninsulaScore = math.floor((hex.PeninsulaScore / 10) + 0.5)
    if self.IsNoBias or self.IsKingNorthBias then
        score = score + math.min(8, peninsulaScore)
    else
        -- especially for river and coastal else 5 pt is not much when testing other biases
        score = score + math.min(5, peninsulaScore)
    end
    --[[
    local peninsulaScore = 0;
    -- Favor more open land for no bias and coastal civ
    if self.IsNoBias or self.IsCoastalBias or self.IsKingNorthBias or self.IsMountainBias then
        -- Rounding the score
        peninsulaScore = math.floor((hex.PeninsulaScore / 10) + 0.5)
        -- Cap peninsula score avoid every on inland sea for naval civ and favor spawns with more land (ex small seas inland)
        if self.IsCoastalBias or self.IsMountainBias or self.IsMountainLoverBias then
            score = score + math.min(5, peninsulaScore)
        else
            -- Select hex at random when >80% score 
            score = score + math.min(8, peninsulaScore)
        end
    end
    ]]--

    -- Avoid unwanted tiles (score = percentage of tundraa tile in ring 6, with a little threshold, valid tile threshold is 16 atm)
    -- Desert not calculated because future terraforming
    local tundraScore = math.floor(hex.TundraScore / 4 + 0.5);
    if self.IsTundraBias == false then
        score = score - tundraScore;
    end
    print(hex:PrintXY().." - Score = "..baseScore.." + "..tostring(totalBiasScore).." + "..tostring(peninsulaScore).." - "..tostring(tundraScore).." ("..tostring(hex.TundraScore)..") = "..tostring(math.floor(score + 0.5)), os.date("%c"))

    return math.floor(score + 0.5);
end



-- For each hex in cluster, calculate the bias score and take score mean
function CivilizationAssignSpawn:ComputeBiasScoreCiv(centroid)
    if self.CivilizationLeader == BBS_LEADER_TYPE_SPECTATOR or self.IsOceanBias then
        return;
    end
    local centScore = 0
    local nbBias = 0;
    for _, bias in pairs(self.CivilizationBiases) do
        local scoredBias = 0
        for _, hex in pairs(centroid.HexCluster) do
            local score = ComputeHexScoreByBias(hex, bias)
            scoredBias = scoredBias + score
            centScore = centScore + score
        end
        if scoredBias > 0 then
            nbBias = nbBias + 1
        end
    end
    if nbBias == 0 then
        centScore = centScore / #centroid.HexCluster
    else
        centScore = centScore / (#centroid.HexCluster * nbBias)
    end
    -- print("Centroid score = "..tostring(centScore).." for civ "..civ.CivilizationLeader)
    return centScore;
end


-- Get the hex score for a given bias
-- Score for each tile are from the HexMap:ComputeScores -- TODO : takes into account the tile surroundings in ring 6 for now
-- Weighted by bias tier TODO : determine the weight for each tier
function ComputeHexScoreByBias(hex, bias)
    local biasScore = 0;
    -- TODO : Bias threshold and factor : highter tier = higher threshold ?
    local scoreThreshold = 25; -- to determine
    if bias.Value == g_TERRAIN_TYPE_COAST and hex.IsCoastal then
        -- Not taking into account the number of coastal tiles in the centroid for now 
        return biasScore;
    elseif (bias.Type == "TERRAINS" and bias.Value ~= g_TERRAIN_TYPE_COAST) then
        if hex.TerrainsScore[bias.Value] ~= nil  then
            -- Terrains are more common (hills, plains etc) so factoring less 
            if IsMountain() then
                biasScore = hex.TerrainsScore[bias.Value] * GetBiasFactor(bias);
            else
                biasScore = math.ceil((hex.TerrainsScore[bias.Value] * GetBiasFactor(bias) / 3) + 0.5);
            end
            scoreThreshold = 25; -- to determine
        end
    elseif (bias.Type == "FEATURES") then
        if hex.FeaturesScore[bias.Value] ~= nil  then
            biasScore = hex.FeaturesScore[bias.Value] * GetBiasFactor(bias)
            scoreThreshold = 20;
        end
    elseif (bias.Type == "RIVERS") then
        if hex.IsOnRiver  then
            biasScore = hex.RiverScore * GetBiasFactor(bias);
            scoreThreshold = 25;
        end
    elseif (bias.Type == "RESOURCES") then
        if hex.ResourcesScore[bias.Value] ~= nil  then
            biasScore = hex.ResourcesScore[bias.Value] * GetBiasFactor(bias)
            scoreThreshold = 3;
        end
    -- Negative Biases are optionnal and act as repellents 	
    elseif (bias.Type == "NEGATIVE_TERRAINS") then
        if hex.TerrainsScore[bias.Value] ~= nil  then
            biasScore = - math.ceil((hex.TerrainsScore[bias.Value] * GetBiasFactor(bias) / 3) + 0.5);
            scoreThreshold = -20;
        end
    elseif (bias.Type == "NEGATIVE_FEATURES") then
        if hex.FeaturesScore[bias.Value] ~= nil  then
            biasScore = - hex.FeaturesScore[bias.Value] * GetBiasFactor(bias)
            scoreThreshold = -2;
        end
    -- not exist atm
    elseif (bias.Type == "NEGATIVE_RESOURCES") then
        if hex.ResourcesScore[bias.Value] ~= nil  then
            biasScore = - hex.ResourcesScore[bias.Value] * GetBiasFactor(bias)
        end
    -- Custom Biases are usually computed in valid tiles and isBiasRespected method, not in the score
    end
    return math.min(biasScore, scoreThreshold);
end

-- TODO : determine weight 
function GetBiasFactor(bias)
    if bias.Tier == 1 then
        return 3;
    elseif bias.Tier == 2 then
        return 1.75;
    elseif bias.Tier == 3 then
        return 1.5;
    elseif bias.Tier == 4 then
        return 1.25;
    elseif bias.Tier == 5 then
        return 1.1;
    end
end

-- Set the starting hex
-- Firaxis method SetStartingPlot called in BBS_AssignStartingPlots
function CivilizationAssignSpawn:AssignMajorCivSpawn(BBS_HexMap, startingHex)
    if startingHex.Centroid ~= nil then
        self.AttributedCentroid = startingHex.Centroid
        self.AttributedCentroid.PlacedCiv = true
    end
    self.StartingHex = startingHex;
    startingHex.IsCivStartingPlot = true;
    startingHex.IsMajorSpawnable = false;
    startingHex.IsMinorSpawnable = false;
    -- Set minimum distance around starting hex
    local list, mappedHex = BBS_HexMap:GetAllHexInRing(startingHex, BBS_HexMap.minimumDistanceMajortoMajorCivs)
    for i, ringHexes in pairs(mappedHex) do
        for _, h in pairs(ringHexes) do
            h.IsMajorSpawnable = false;
            -- distance to cs usually shorter 
            if i <= BBS_HexMap.minimumDistanceMinorToMajorCivs then
                h.IsMinorSpawnable = false;
            end
        end
        
    end
    --BBS_HexMap:PrintHexSpawnableMap()
    print("Assigned spawn "..startingHex:PrintXY().." for civ "..tostring(self.CivilizationLeader))
    return;
end

-- To call after placing majors civs
function CivilizationAssignSpawn:AssignMinorCivSpawn(BBS_HexMap, startingHex)
    self.StartingHex = startingHex
    startingHex.IsCivStartingPlot = true;
    startingHex.IsMinorSpawnable = false;
    table.insert(BBS_HexMap.minorSpawns, startingHex);
    local list, _ = BBS_HexMap:GetAllHexInRing(startingHex, BBS_HexMap.minimumDistanceMinorToMinorCivs)
    for i, hex in pairs(list) do
        hex.IsMinorSpawnable = false;
    end
end

-- Return a boolean testing bias respect on hex in parameter
function CivilizationAssignSpawn:IsBiasRespected(hex, hexMap)
    -- Biases should be already sorted by tier
    -- TODO : Make custom variable per category for better management ? (isMineResourceBias etc)
    if #self.CivilizationBiases == 0 then
        return true;
    end
    if self.IsFloodplainsBias and hex:IsFloodplains() == false then
        return false;
    end
     -- Custom bias treated by valid tiles
    local isOneOfBiasRespected = false;
    for _, bias in pairs(self.CivilizationBiases) do
        -- Mandatory biases
        if bias.Type == "TERRAINS" and IsTundraLand(bias.Value) and hex:IsTundraLand() == false then
            return false;
        elseif bias.Type == "TERRAINS" and IsDesertLand(bias.Value) and hex:IsDesertLand() == false then
            return false;
        elseif bias.Type == "RIVERS" then
            if hex.IsOnRiver then
                isOneOfBiasRespected = true;
            else
                return false;
            end
        elseif bias.Type == "TERRAINS" and bias.Value == g_TERRAIN_TYPE_COAST then
            if hex.IsCoastal  then
                isOneOfBiasRespected = true;
            else
                return false;
            end
        elseif bias.Type == "CUSTOM_HYDROPHOBIC" then 
            if hex.PeninsulaScore > 45 and hex:IsCloseToCoast() == false then
                isOneOfBiasRespected = true;
            else 
                return false;
            end  
        elseif bias.Type == "CUSTOM_KING_OF_THE_NORTH" then
            --hex.y < hexMap.height * 0.3 or hex.y > hexMap.height * 0.7
            if hex.TundraScore > 0 then
                isOneOfBiasRespected = true;
            end 
        end
        if bias.Type == "CUSTOM_CONTINENT_SPLIT" and hex:HasContinentInWalkableRange(4) == false then
            return false;
        end
        local jungleFound = false;
        for i, ringList in pairs(hex.AllRing6Map) do
            for _, hring in pairs(ringList) do
                if bias.Type == "RESOURCES" then
                    -- Respected if at least 1 ressource in ring 3
                    if i < 4 and hring.ResourceType == bias.Value then
                        isOneOfBiasRespected = true;
                    end
                elseif bias.Type == "FEATURES" then
                    -- Respected if at lease 1 feature in ring 3
                    if i < 4 and hring.FeatureType == bias.Value then
                        isOneOfBiasRespected = true;
                        if self.IsJungleBias and bias.Value == g_FEATURE_JUNGLE then
                            jungleFound = true;
                        end
                    end     
                elseif (bias.Type == "TERRAINS" and bias.Value ~= g_TERRAIN_TYPE_COAST) or bias.Type == "CUSTOM_MOUNTAIN_LOVER" then
                    if IsMountain(bias.Value) then
                        -- At least a mountain in ring 2, density score do the rest
                        if i == 2 and hring:IsMountain() then
                            isOneOfBiasRespected = true;
                        end
                    elseif i < 4 and hring.TerrainType == bias.Value then
                        -- Plains and grassland checked by density, tundra and desert bias in valid tile checks
                        isOneOfBiasRespected = true;
                    end            
                elseif bias.Type == "NEGATIVE_TERRAINS" then
                    -- Test: excluded by tile scoring
                    if i < 4 and hring.TerrainType == bias.Value then
                        return false;
                    end
                elseif bias.Type == "NEGATIVE_FEATURES" then
                    if i < 4 and hring.FeatureType == bias.Value then
                        return false;
                    end
                elseif bias.Type == "NEGATIVE_RESOURCES" then
                    if i < 4 and hring.ResourceType == bias.Value then
                        return false;
                    end
                end
            end
        end
        if self.IsJungleBias and bias.Type == "FEATURES" and bias.Value == g_FEATURE_JUNGLE then
            return jungleFound;
        end
    end
    return isOneOfBiasRespected;
end


