-- Get map size and min distance data
local Width, Height = Map.GetGridSize();
local minDistance = MapConfiguration.GetValue("BBSMinDistance");
-- Setmin distance if minDistance is nil.

-- Get map type

-- Get Players data
local civilisations = {}
local civilisationsIDs = PlayerManager.GetAliveMajorIDs();

for i = 1, PlayerManager.GetAliveMajorsCount() do
    local leader = PlayerConfigurations[civilisationsIDs[i]]:GetLeaderTypeName();
    local name = PlayerConfigurations[civilisationsIDs[i]]:GetCivilizationTypeName();
    local team = Players[civilisationsIDs[i]]:GetTeam();
    civilisations[i] = {
        leader = leader,
        name = name,
        team = team,
    };
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

