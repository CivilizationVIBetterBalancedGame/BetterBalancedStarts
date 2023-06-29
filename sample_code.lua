---------------------------------------------------------------------------------
-- definition of Globals --------------------------------------------------------
---------------------------------------------------------------------------------

-- Min distance definition
local bbs_mapTypeToDistance = {};
bbs_mapTypeToDistance["Highlands_XP2.lua"] = 15
bbs_mapTypeToDistance["Lakes.lua"] = 15
bbs_mapTypeToDistance["InlandSea.lua"] = 14
bbs_mapTypeToDistance["Seven_Seas.lua"] = 13
bbs_mapTypeToDistance["Primordial.lua"] = 13
bbs_mapTypeToDistance["Pangaea.lua"] = 12
bbs_mapTypeToDistance["DWPangaea.lua"] = 12
bbs_mapTypeToDistance["Shuffle.lua"] = 12
bbs_mapTypeToDistance["Tilted_Axis.lua"] = 12
bbs_mapTypeToDistance["Tilted_Axis.lua"] = 12
bbs_mapTypeToDistance["Fractal.lua"] = 10
bbs_mapTypeToDistance["Island_Plates.lua"] = 10
bbs_mapTypeToDistance["Small_Continents.lua"] = 10
bbs_mapTypeToDistance["Archipelago_XP2.lua" ] = 10
bbs_mapTypeToDistance["Continents.lua"] = 10
bbs_mapTypeToDistance["Wetlands_XP2.lua"] = 10
bbs_mapTypeToDistance["Continents_Islands.lua"] = 10
bbs_mapTypeToDistance["Splintered_Fractal.lua"] = 10
bbs_mapTypeToDistance["DWArchipelago.lua"] = 10
bbs_mapTypeToDistance["DWFractal.lua"] = 10
bbs_mapTypeToDistance["DWMixedLand.lua"] = 10
bbs_mapTypeToDistance["DWSmallContinents.lua"] = 10
bbs_mapTypeToDistance["DWMixedIslands.lua"] = 10
bbs_mapTypeToDistance["Terra.lua"] = 8

-- Special civilisation types
BBS_LEADER_TYPE_SPECTATOR = "LEADER_SPECTATOR"

---------------------------------------------------------------------------------
-- Gather base game info and setup config ---------------------------------------
---------------------------------------------------------------------------------

-- Get map size and min distance data
local Width, Height = Map.GetGridSize();
local minDistance = MapConfiguration.GetValue("BBSMinDistance");
local mapScript = MapConfiguration.GetValue("MAP_SCRIPT");
-- Set min distance if minDistance is nil or 0
if ((minDistance == nil or minDistance == 0) and mapScript ~= nil) then
    minDistance = bbs_mapTypeToDistance[mapScript]
end
-- Adjust min distance in function of player number
minDistance = minDistance + BBS_DistanceFromPlayerCount()

-- Get map type

-- Get Players data
local civilisations = {}
local civilisationsIDs = PlayerManager.GetAliveMajorIDs();

for i = 1, PlayerManager.GetAliveMajorsCount() do
    local leader = PlayerConfigurations[civilisationsIDs[i]]:GetLeaderTypeName();
    local name = PlayerConfigurations[civilisationsIDs[i]]:GetCivilizationTypeName();
    local team = Players[civilisationsIDs[i]]:GetTeam();
    table.insert(civilisations, {
        leader = leader,
        name = name,
        team = team,
    });
end

-- Get City States data
local citystates = {}
local citystatesIDs = PlayerManager.GetAliveMinorIDs();

for i = 1, PlayerManager.GetAliveMinorsCount() do
    local leader = PlayerConfigurations[citystatesIDs[i]]:GetLeaderTypeName();
    local name = PlayerConfigurations[citystatesIDs[i]]:GetCivilizationTypeName();

    table.insert(citystates, {
        leader = leader, 
        name = name,
    });
end

-- Get Bias all
local g_negative_bias = {}
local g_custom_bias = {}

local ret = DB.Query("SELECT * from StartBiasNegatives");
for key , value in pairs(ret) do
    if v.CivilizationType ~= nil then
        table.insert(g_negative_bias, {
            CivilizationType = v.CivilizationType,
            TerrainType = v.TerrainType,
            FeatureType = v.FeatureType,
            Tier = v.Tier,
            Extra = v.Extra
        });
    end
end

local ret = DB.Query("SELECT * from StartBiasCustom");
for key , value in pairs(ret) do
    if v.CivilizationType ~= nil then
        table.insert(g_custom_bias, {
            CivilizationType = v.CivilizationType,
            CustomPlacement = v.CustomPlacement,
        });
    end
end

function BBS_DistanceFromPlayerCount()
    local civilisationsIDs = PlayerManager.GetAliveMajorIDs();
    local totalPlayers = 0
    for i = 1, PlayerManager.GetAliveMajorsCount() do
        player = PlayerConfigurations[civilisationsIDs[i]]
        if (player:GetLeaderTypeName() ~= BBS_LEADER_TYPE_SPECTATOR and player:GetHandicapTypeID() ~= 2021024770) then
            totalPlayers = totalPlayers + 1
        end
    end
    local mapSize = Map.GetMapSize();
    local numberPlayerSettings = (mapSize + 1) * 2
    if totalPlayers > numberPlayerSettings then
        return -2;
    elseif totalPlayers < numberPlayerSettings then
        return 2
    end
    return 0
end