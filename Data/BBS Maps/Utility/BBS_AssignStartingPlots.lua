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
        BBS_GRID_SIZE = Map.GetGridSize(),
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

    -- Get Players data
    local bbs_civilisations = {};
    local civilisationsIDs = PlayerManager.GetAliveMajorIDs();

    for i = 1, PlayerManager.GetAliveMajorsCount() do
        local leader = PlayerConfigurations[civilisationsIDs[i]]:GetLeaderTypeName();
        local name = PlayerConfigurations[civilisationsIDs[i]]:GetCivilizationTypeName();
        local team = Players[civilisationsIDs[i]]:GetTeam();

        print(leader, name, team);

        table.insert(bbs_civilisations, {
            leader = leader,
            name = name,
            team = team
        });
    end

    -- Get City States data
    local bbs_citystates = {}
    local citystatesIDs = PlayerManager.GetAliveMinorIDs();

    for i = 1, PlayerManager.GetAliveMinorsCount() do
        local leader = PlayerConfigurations[citystatesIDs[i]]:GetLeaderTypeName();
        local name = PlayerConfigurations[citystatesIDs[i]]:GetCivilizationTypeName();
        
        print(leader, name);

        table.insert(bbs_citystates, {
            leader = leader,
            name = name
        });
    end

    -- Get Bias all
    local bbs_negative_bias = {}
    local bbs_custom_bias = {}

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

    local bbs_min_distance = bbs_game_config.BBS_MIN_DISTANCE
    print("bbs_min_distance", bbs_min_distance)
    -- Set min distance if minDistance is nil or 0 via map settings
    if ((bbs_min_distance == nil or bbs_min_distance == 0) and 
        bbs_game_config.BBS_MAP_SCRIPT ~= nil) 
    then
        bbs_min_distance = BBS_MAP_MAP_SCRIPT_TO_MIN_DISTANCE[bbs_game_config.BBS_MAP_SCRIPT]
    end

    -- Adjust min distance in function of player number
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

    if true then
        print("BBS_AssignStartingPlots: To Many Attempts Failed - Go to Firaxis Placement")
        Game:SetProperty("BBS_RESPAWN", false)
        return AssignStartingPlots.Create(args)
    end


    -- instance = {
    --     __InitStartingData() = BBS.__InitStartingData
    -- }

    -- instance:__InitStartingData()

    -- print("BBS_AssignStartingPlots: Sending Data")
    -- return instance
end


function BBS_AssignStartingPlots:__InitStartingData()
end


function BBS_AssignStartingPlots:__GetTerrainIndex(terrainType)
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

function BBS_AssignStartingPlots:__GetFeatureIndex(featureType)
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

function BBS_AssignStartingPlots:__GetResourceIndex(resourceType)
    local resourceTypeName = "LOC_" .. resourceType .. "_NAME";
    for row in GameInfo.Resources() do
        if (row.Name == resourceTypeName) then
            return row.Index;
        end
    end
end
