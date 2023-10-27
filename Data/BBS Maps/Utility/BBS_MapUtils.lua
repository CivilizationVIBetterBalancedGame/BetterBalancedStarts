---------------------------------------
-- Firaxis constants maps scripts
---------------------------------------
MAP_HIGHLANDS = "Highlands_XP2.lua"
MAP_RICH_HIGHLANDS = "rich_highlands_xp2.lua"
MAP_LAKES = "Lakes.lua"
MAP_INLAND_SEA = "InlandSea.lua"
MAP_SEVEN_SEAS = "Seven_Seas.lua"
MAP_PRIMORDIAL = "Primordial.lua"
MAP_PANGAEA = "Pangaea.lua"
MAP_DW_PANGAEA = "DWPangaea.lua"
MAP_SHUFFLE = "Shuffle.lua"
MAP_TILTED_AXIS = "Tilted_Axis.lua"
MAP_FRACTAL = "Fractal.lua"
MAP_ISLAND_PLATES = "Island_Plates.lua"
MAP_SMALL_CONTINENTS = "Small_Continents.lua"
MAP_ARCHIPELAGO = "Archipelago_XP2.lua"
MAP_CONTINENTS = "Continents.lua"
MAP_WETLANDS = "Wetlands_XP2.lua"
MAP_CONTINENTS_ISLANDS = "Continents_Islands.lua"
MAP_SPLINTERED_FRACTAL = "Splintered_Fractal.lua"
MAP_DW_ARCHIPELAGO = "DWArchipelago.lua"
MAP_DW_FRACTAL = "DWFractal.lua"
MAP_DW_MIXED_LANDS = "DWMixedLand.lua"
MAP_DW_SMALL_CONTINENTS = "DWSmallContinents.lua"
MAP_DW_MIXEDISLANDS = "DWMixedIslands.lua"
MAP_TERRA = "Terra.lua"

g_FEATURE_VOLCANO			    = GetGameInfoIndex("Features", "FEATURE_VOLCANO");
g_FEATURE_VOLCANIC_SOIL			= GetGameInfoIndex("Features", "FEATURE_VOLCANIC_SOIL");
g_FEATURE_GEOTHERMAL_FISSURE	= GetGameInfoIndex("Features", "FEATURE_GEOTHERMAL_FISSURE");


g_RESOURCE_NONE				    = -1;
g_RESOURCE_BANANAS				= GetGameInfoIndex("Resources", "RESOURCE_BANANAS");--0
g_RESOURCE_CATTLE				= GetGameInfoIndex("Resources", "RESOURCE_CATTLE");
g_RESOURCE_COPPER               = GetGameInfoIndex("Resources", "RESOURCE_COPPER");
g_RESOURCE_CRABS				= GetGameInfoIndex("Resources", "RESOURCE_CRABS");
g_RESOURCE_DEER				    = GetGameInfoIndex("Resources", "RESOURCE_DEER");
g_RESOURCE_FISH                 = GetGameInfoIndex("Resources", "RESOURCE_FISH");--5
g_RESOURCE_RICE     			= GetGameInfoIndex("Resources", "RESOURCE_RICE");
g_RESOURCE_SHEEP    			= GetGameInfoIndex("Resources", "RESOURCE_SHEEP");
g_RESOURCE_STONE                = GetGameInfoIndex("Resources", "RESOURCE_STONE");
g_RESOURCE_WHEAT                = GetGameInfoIndex("Resources", "RESOURCE_WHEAT");
g_RESOURCE_CITRUS               = GetGameInfoIndex("Resources", "RESOURCE_CITRUS");--10
g_RESOURCE_COCOA                = GetGameInfoIndex("Resources", "RESOURCE_COCOA");
g_RESOURCE_COFFEE               = GetGameInfoIndex("Resources", "RESOURCE_COFFEE");
g_RESOURCE_COTTON               = GetGameInfoIndex("Resources", "RESOURCE_COTTON");
g_RESOURCE_DIAMONDS             = GetGameInfoIndex("Resources", "RESOURCE_DIAMONDS");
g_RESOURCE_DYES                 = GetGameInfoIndex("Resources", "RESOURCE_DYES");--15
g_RESOURCE_FURS                 = GetGameInfoIndex("Resources", "RESOURCE_FURS");
g_RESOURCE_GYPSUM               = GetGameInfoIndex("Resources", "RESOURCE_GYPSUM");
g_RESOURCE_INCENSE              = GetGameInfoIndex("Resources", "RESOURCE_INCENSE");
g_RESOURCE_IVORY                = GetGameInfoIndex("Resources", "RESOURCE_IVORY");
g_RESOURCE_JADE                 = GetGameInfoIndex("Resources", "RESOURCE_JADE");--20
g_RESOURCE_MARBLE               = GetGameInfoIndex("Resources", "RESOURCE_MARBLE");
g_RESOURCE_MERCURY              = GetGameInfoIndex("Resources", "RESOURCE_MERCURY");
g_RESOURCE_PEARLS               = GetGameInfoIndex("Resources", "RESOURCE_PEARLS");
g_RESOURCE_SALT                 = GetGameInfoIndex("Resources", "RESOURCE_SALT");
g_RESOURCE_SILK                 = GetGameInfoIndex("Resources", "RESOURCE_SILK");--25
g_RESOURCE_SILVER               = GetGameInfoIndex("Resources", "RESOURCE_SILVER");
g_RESOURCE_SPICES               = GetGameInfoIndex("Resources", "RESOURCE_SPICES");
g_RESOURCE_SUGAR                = GetGameInfoIndex("Resources", "RESOURCE_SUGAR");
g_RESOURCE_TEA                  = GetGameInfoIndex("Resources", "RESOURCE_TEA");
g_RESOURCE_TOBACCO              = GetGameInfoIndex("Resources", "RESOURCE_TOBACCO");--30
g_RESOURCE_TRUFFLES             = GetGameInfoIndex("Resources", "RESOURCE_TRUFFLES");
g_RESOURCE_WHALES               = GetGameInfoIndex("Resources", "RESOURCE_WHALES");
g_RESOURCE_WINE                 = GetGameInfoIndex("Resources", "RESOURCE_WINE");
g_RESOURCE_JEANS                = GetGameInfoIndex("Resources", "RESOURCE_JEANS");
g_RESOURCE_PERFUME              = GetGameInfoIndex("Resources", "RESOURCE_PERFUME");--35
g_RESOURCE_COSMETICS            = GetGameInfoIndex("Resources", "RESOURCE_COSMETICS");
g_RESOURCE_TOYS                 = GetGameInfoIndex("Resources", "RESOURCE_TOYS");
g_RESOURCE_CINNAMON             = GetGameInfoIndex("Resources", "RESOURCE_CINNAMON");
g_RESOURCE_CLOVES               = GetGameInfoIndex("Resources", "RESOURCE_CLOVES");
g_RESOURCE_ALUMINUM             = GetGameInfoIndex("Resources", "RESOURCE_ALUMINUM");--40
g_RESOURCE_COAL                 = GetGameInfoIndex("Resources", "RESOURCE_COAL");
g_RESOURCE_HORSES               = GetGameInfoIndex("Resources", "RESOURCE_HORSES");
g_RESOURCE_IRON                 = GetGameInfoIndex("Resources", "RESOURCE_IRON");
g_RESOURCE_NITER                = GetGameInfoIndex("Resources", "RESOURCE_NITER");
g_RESOURCE_OIL                  = GetGameInfoIndex("Resources", "RESOURCE_OIL");--45
g_RESOURCE_URANIUM              = GetGameInfoIndex("Resources", "RESOURCE_URANIUM");
g_RESOURCE_ANTIQUITY_SITE       = GetGameInfoIndex("Resources", "RESOURCE_ANTIQUITY_SITE");
g_RESOURCE_SHIPWRECK            = GetGameInfoIndex("Resources", "RESOURCE_SHIPWRECK");
g_RESOURCE_AMBER                = GetGameInfoIndex("Resources", "RESOURCE_AMBER");
g_RESOURCE_OLIVES               = GetGameInfoIndex("Resources", "RESOURCE_OLIVES");--50
g_RESOURCE_TURTLES              = GetGameInfoIndex("Resources", "RESOURCE_TURTLES");
g_RESOURCE_MAIZE                = GetGameInfoIndex("Resources", "RESOURCE_MAIZE");
g_RESOURCE_HONEY                = GetGameInfoIndex("Resources", "RESOURCE_HONEY");

g_RESOURCES_LUX_LIST = {}
g_RESOURCES_LUX_LIST[g_RESOURCE_CITRUS]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_COCOA]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_COFFEE]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_COTTON]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_DIAMONDS]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_DYES]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_FURS]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_GYPSUM]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_INCENSE]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_IVORY]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_JADE]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_MARBLE]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_MERCURY]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_PEARLS]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_SALT]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_SILK]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_SILVER]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_SPICES]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_SUGAR]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_TEA]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_TOBACCO]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_TRUFFLES]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_WHALES]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_WINE]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_JEANS]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_PERFUME]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_COSMETICS]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_TOYS]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_CINNAMON]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_CLOVES]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_AMBER]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_OLIVES]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_TURTLES]= true;
g_RESOURCES_LUX_LIST[g_RESOURCE_HONEY]= true;

g_RESOURCES_BONUS_LIST = {}
g_RESOURCES_BONUS_LIST[g_RESOURCE_BANANAS]= true;
g_RESOURCES_BONUS_LIST[g_RESOURCE_CATTLE]= true;
g_RESOURCES_BONUS_LIST[g_RESOURCE_COPPER]= true;
g_RESOURCES_BONUS_LIST[g_RESOURCE_CRABS]= true;
g_RESOURCES_BONUS_LIST[g_RESOURCE_DEER]= true;
g_RESOURCES_BONUS_LIST[g_RESOURCE_FISH]= true;
g_RESOURCES_BONUS_LIST[g_RESOURCE_RICE]= true;
g_RESOURCES_BONUS_LIST[g_RESOURCE_SHEEP]= true;
g_RESOURCES_BONUS_LIST[g_RESOURCE_STONE]= true;
g_RESOURCES_BONUS_LIST[g_RESOURCE_WHEAT]= true;
g_RESOURCES_BONUS_LIST[g_RESOURCE_MAIZE]= true;

g_RESOURCES_FARM_LIST = {}
g_RESOURCES_FARM_LIST[g_RESOURCE_RICE]= true;
g_RESOURCES_FARM_LIST[g_RESOURCE_WHEAT]= true;
g_RESOURCES_FARM_LIST[g_RESOURCE_MAIZE]= true;

g_RESOURCES_MINE_LIST = {}
g_RESOURCES_MINE_LIST[g_RESOURCE_DIAMONDS]= true;
g_RESOURCES_MINE_LIST[g_RESOURCE_JADE]= true;
g_RESOURCES_MINE_LIST[g_RESOURCE_AMBER]= true;
g_RESOURCES_MINE_LIST[g_RESOURCE_MERCURY]= true;
g_RESOURCES_MINE_LIST[g_RESOURCE_SALT]= true;
g_RESOURCES_MINE_LIST[g_RESOURCE_SILVER]= true;
g_RESOURCES_MINE_LIST[g_RESOURCE_COPPER]= true;
g_RESOURCES_MINE_LIST[g_RESOURCE_IRON]= true;
g_RESOURCES_MINE_LIST[g_RESOURCE_NITER]= true;
g_RESOURCES_MINE_LIST[g_RESOURCE_COAL]= true;
g_RESOURCES_MINE_LIST[g_RESOURCE_ALUMINUM]= true;
g_RESOURCES_MINE_LIST[g_RESOURCE_URANIUM]= true;

g_RESOURCES_QUARRY_LIST = {};
g_RESOURCES_QUARRY_LIST[g_RESOURCE_STONE] = true;
g_RESOURCES_QUARRY_LIST[g_RESOURCE_MARBLE] = true;
g_RESOURCES_QUARRY_LIST[g_RESOURCE_GYPSUM] = true;

g_RESOURCES_PASTURE_LIST = {}
g_RESOURCES_PASTURE_LIST[g_RESOURCE_HORSES]= true;
g_RESOURCES_PASTURE_LIST[g_RESOURCE_CATTLE]= true;
g_RESOURCES_PASTURE_LIST[g_RESOURCE_SHEEP]= true;

g_RESOURCES_PLANTATION_LIST = {}
g_RESOURCES_PLANTATION_LIST[g_RESOURCE_BANANAS]= true;
g_RESOURCES_PLANTATION_LIST[g_RESOURCE_CITRUS]= true;
g_RESOURCES_PLANTATION_LIST[g_RESOURCE_COCOA]= true;
g_RESOURCES_PLANTATION_LIST[g_RESOURCE_COTTON]= true;
g_RESOURCES_PLANTATION_LIST[g_RESOURCE_COFFEE]= true;
g_RESOURCES_PLANTATION_LIST[g_RESOURCE_DYES]= true;
g_RESOURCES_PLANTATION_LIST[g_RESOURCE_INCENSE]= true;
g_RESOURCES_PLANTATION_LIST[g_RESOURCE_OLIVES]= true;
g_RESOURCES_PLANTATION_LIST[g_RESOURCE_SILK]= true;
g_RESOURCES_PLANTATION_LIST[g_RESOURCE_SPICES]= true;
g_RESOURCES_PLANTATION_LIST[g_RESOURCE_SUGAR]= true;
g_RESOURCES_PLANTATION_LIST[g_RESOURCE_TEA]= true;
g_RESOURCES_PLANTATION_LIST[g_RESOURCE_TOBACCO]= true;
g_RESOURCES_PLANTATION_LIST[g_RESOURCE_WINE]= true;

g_RESOURCES_FISHINGBOAT_LIST = {}
g_RESOURCES_FISHINGBOAT_LIST[g_RESOURCE_CRABS]= true;
g_RESOURCES_FISHINGBOAT_LIST[g_RESOURCE_FISH]= true;
g_RESOURCES_FISHINGBOAT_LIST[g_RESOURCE_AMBER]= true;
g_RESOURCES_FISHINGBOAT_LIST[g_RESOURCE_PEARLS]= true;
g_RESOURCES_FISHINGBOAT_LIST[g_RESOURCE_TURTLES]= true;
g_RESOURCES_FISHINGBOAT_LIST[g_RESOURCE_WHALES]= true;

g_RESOURCES_STRATEGICS = {}
g_RESOURCES_STRATEGICS[g_RESOURCE_HORSES]= true;
g_RESOURCES_STRATEGICS[g_RESOURCE_IRON]= true;
g_RESOURCES_STRATEGICS[g_RESOURCE_NITER]= true;
g_RESOURCES_STRATEGICS[g_RESOURCE_COAL]= true;
g_RESOURCES_STRATEGICS[g_RESOURCE_OIL]= true;
g_RESOURCES_STRATEGICS[g_RESOURCE_ALUMINUM]= true;
g_RESOURCES_STRATEGICS[g_RESOURCE_URANIUM]= true;

---------------------------------------
-- Hex
---------------------------------------
Hex = {}

function Hex.new(pX, pY)
    local instance = {};
    setmetatable(instance, {__index = Hex});
    instance.x = pX;
    instance.y = pY;
    return instance;
end

function Hex:GetX()
    return self.x;
end

function Hex:GetY()
    return self.y;
end

function Hex:PrintXY()
    return "("..tostring(self.x)..", "..tostring(self.y)..")"
end


-- Fill the data for selected hex through firaxis datas
function Hex:FillHexDatas()
    local plot = Map.GetPlot(self:GetX(), self:GetY()); 
    if plot ~= nil then
        self.Plot = plot;
        self.ResourceType = plot:GetResourceType();
        self.HexResource = HexResource.new(self.ResourceType)
        self.FeatureType = plot:GetFeatureType();
        self.TerrainType = plot:GetTerrainType();
        self.IsNaturalWonder = plot:IsNaturalWonder();
        self.IsFreshWater = plot:IsFreshWater();
        self.IsOnRiver = plot:IsRiver();
        self.IsCoastal = AdjacentToSaltWater(self.x, self.y);
        self.IslandId = plot:GetArea():GetID();
        self.IslandSize = plot:GetArea():GetPlotCount();
        self.IdContinent = plot:GetContinentType(); 
        self.IsOnSplit = Map.FindSecondContinent(plot, 1);
        self.IsMajorSpawnable = not self:IsWater();
        self.IsMinorSpawnable = true;
        self.IsCivStartingPlot = false;
        self:UpdateYields();
        return;
    end
end

function Hex:UpdateYields()
    local plot = Map.GetPlot(self.x, self.y);
    self.Food = plot:GetYield(g_YIELD_FOOD);
    self.Prod = plot:GetYield(g_YIELD_PRODUCTION);
    self.Gold = plot:GetYield(g_YIELD_GOLD);
    self.Science = plot:GetYield(g_YIELD_SCIENCE);
    self.Culture = plot:GetYield(g_YIELD_CULTURE);
    self.Faith = plot:GetYield(g_YIELD_FAITH);
    self.Is22 = self.Food == 2 and self.Prod == 2
    self.Is31 = self.Food == 3 and self.Prod == 1
end

function Hex:IsMountain()
    return IsMountain(self.TerrainType);
 end

 function IsMountain(terrainIndex)
    return terrainIndex == g_TERRAIN_TYPE_DESERT_MOUNTAIN 
        or terrainIndex == g_TERRAIN_TYPE_DESERT_MOUNTAIN 
        or terrainIndex == g_TERRAIN_TYPE_GRASS_MOUNTAIN 
        or terrainIndex == g_TERRAIN_TYPE_PLAINS_MOUNTAIN 
        or terrainIndex == g_TERRAIN_TYPE_SNOW_MOUNTAIN 
        or terrainIndex == g_TERRAIN_TYPE_TUNDRA_MOUNTAIN;
 end


function Hex:SetCentroid(c)
    self.Centroid = c
end

function Hex:IsWater()
    return self.TerrainType == g_TERRAIN_TYPE_OCEAN 
        or self.TerrainType == g_TERRAIN_TYPE_COAST;
end

function Hex:IsHill()
    return IsHill(self.TerrainType);
end

function IsHill(terrainIndex)
    return terrainIndex == g_TERRAIN_TYPE_DESERT_HILLS 
        or terrainIndex == g_TERRAIN_TYPE_GRASS_HILLS 
        or terrainIndex == g_TERRAIN_TYPE_SNOW_HILLS 
        or terrainIndex == g_TERRAIN_TYPE_TUNDRA_HILLS 
        or terrainIndex == g_TERRAIN_TYPE_PLAINS_HILLS;
end


-- List of method to get type of terrain (mountains excluded)
function Hex:IsPlainLand()
    return IsPlainLand(self.TerrainType);
end

function IsPlainLand(terrainIndex)
    return terrainIndex == g_TERRAIN_TYPE_PLAINS_HILLS
        or terrainIndex == g_TERRAIN_TYPE_PLAINS
        or terrainIndex == g_TERRAIN_TYPE_PLAINS_MOUNTAIN;
end

function Hex:IsGrassLand()
    return IsGrassLand(self.TerrainType);
end

function IsGrassLand(terrainIndex)
    return terrainIndex == g_TERRAIN_TYPE_GRASS_HILLS
        or terrainIndex == g_TERRAIN_TYPE_GRASS
        or terrainIndex == g_TERRAIN_TYPE_GRASS_MOUNTAIN
end

function Hex:IsDesertLand()
    return IsDesertLand(self.TerrainType);
end

function IsDesertLand(terrainIndex)
    return terrainIndex == g_TERRAIN_TYPE_DESERT_HILLS
        or terrainIndex == g_TERRAIN_TYPE_DESERT
        or terrainIndex == g_TERRAIN_TYPE_DESERT_MOUNTAIN
end

function Hex:IsTundraLand()
    return IsTundraLand(self.TerrainType);
end

function IsTundraLand(terrainIndex)
    return terrainIndex == g_TERRAIN_TYPE_TUNDRA_HILLS
        or terrainIndex == g_TERRAIN_TYPE_TUNDRA
        or terrainIndex == g_TERRAIN_TYPE_TUNDRA_MOUNTAIN
end

function Hex:IsSnowLand()
    return IsSnowLand(self.TerrainType);
end

function IsSnowLand(terrainIndex)
    return terrainIndex == g_TERRAIN_TYPE_SNOW_HILLS
        or terrainIndex == g_TERRAIN_TYPE_SNOW
        or terrainIndex == g_TERRAIN_TYPE_SNOW_MOUNTAIN
end

function Hex:IsFloodplains()
    return IsFloodplains(self.FeatureType);
end

function IsFloodplains(featureIndex)
    return featureIndex == g_FEATURE_FLOODPLAINS
        or featureIndex == g_FEATURE_FLOODPLAINS_GRASSLAND
        or featureIndex == g_FEATURE_FLOODPLAINS_PLAINS;
end

function Hex:IsImpassable() 
    return self:IsWater() or self:IsMountain();
end

function Hex:HasLux()
    return self.HexResource.isLux;
end

-- Test if a different continent is present in the range (ring in parameter). Return boolean
function Hex:HasContinentInRange(range) 
    -- TODO : Maybe check if we can walk to that second continent in given range?
    return Map.FindSecondContinent(self.Plot, range);
end

function Hex:HexAdd(vec)
    if vec.getmetatable == Hex then
        local newX = self:GetX() + vec.x;
        local newY = self:GetY() + vec.y;
        return Hex(newX, newY);
    else 
        print("HexAdd - parameter must be an Hex")
    end
end

function Hex:DistanceTo(other)
    local q = self:GetY() - (self:GetX() - even(self:GetX())) / 2
    local r = self:GetX();
    local otherQ = other.y - (other.x - even(other.x)) / 2;
    local otherR = other.x;
    local result = (math.abs(q - otherQ)+ math.abs(q - otherQ + r - otherR)+ math.abs(r - otherR)) / 2;
    return result;
end
     

-- return the closest point to this hex among the list of points in param
function Hex:Closest(hexMap, points)
	local min = math.huge
	local min_i
	for i, point in ipairs(points) do
		local dist = self:DistanceTo(point)
        if hexMap.canCircumnavigate then
            local shiftedPoint = Hex.new(point.x + hexMap.width, point.y)
            local shiftedDist = self:DistanceTo(shiftedPoint)
            if shiftedDist < dist then
                dist = shiftedDist
            end
        end
		if dist < min then
			min = dist
			min_i = i
		end
	end
	return points[min_i]
end

function Hex:DistanceToClosest(hexMap, points)
    local closest = self:Closest(hexMap, points)
    if closest == nil then
        return nil;
    end
    return self:DistanceTo(closest);
end

---------------------------------------
-- HexResource
-- Contains resources data as categories - fill as needed
---------------------------------------
HexResource = {}
function HexResource.new(resIndex)
    local instance = {}
    setmetatable(instance, {__index = HexResource});
    instance.ResourceIndex = resIndex;
    instance.IsPlantationResource = g_RESOURCES_PLANTATION_LIST[resIndex] ~= nil;
    instance.IsFarmResource = g_RESOURCES_FARM_LIST[resIndex] ~= nil;
    instance.IsPastureResource= g_RESOURCES_PASTURE_LIST[resIndex] ~= nil;
    instance.IsMineResource = g_RESOURCES_MINE_LIST[resIndex] ~= nil;
    instance.IsFishingResource=  g_RESOURCES_FISHINGBOAT_LIST[resIndex] ~= nil;
    instance.IsStrategic = g_RESOURCES_STRATEGICS[resIndex] ~= nil;
    instance.IsBonus = g_RESOURCES_BONUS_LIST[resIndex] ~= nil;
    instance.IsLux = g_RESOURCES_LUX_LIST[resIndex] ~= nil;
    return instance;
end

---------------------------------------
-- Centroid
---------------------------------------
Centroid = {}

function Centroid.new(pX, pY, pId)
    local instance = {}
    setmetatable(instance, {__index = Centroid});
    instance.x = pX;
    instance.y = pY;
    instance.id = pId;
    -- List of hexes closest to this centroid
    instance.HexCluster = {};
    -- Put cluster datas here (number of ressources, hills etc ?)
    instance.ResourcesScore = {};
    instance.FeaturesScore = {};
    instance.TerrainsScore = {};
    instance.FreshWaterScore = 0;
    instance.IsRiverScore = 0;
    instance.IsTundraCentroid = false;
    instance.IsCoastalCentroid = false;
    instance.HasCoast = false;
    instance.TundraScore = 0
    instance.PlacedCiv = false
    return instance;
end

function Centroid:GetHillsInCluster()
    local count = 0;
    local mappedHex = {};
    if self.HexCluster ~= nil and #self.HexCluster > 0 then
        for _, hex in pairs(self.HexCluster) do
            if hex:IsHill() then
                count = count + 1;
                table.insert(mappedHex, hex);
            end
        end
    end
    return count;
end


function Centroid:GetTotalResourcesCountInCluster()
    local countLux = 0;
    local countBonus = 0;
    local countStrategics = 0;
    for _, hex in pairs(self.HexCluster) do
        if hex.HexResource.IsLux then
            countLux = countLux + 1;
        elseif hex.HexResource.IsBonus then
            countBonus = countBonus + 1;
        elseif hex.HexResource.IsStrategic then
            countStrategics = countStrategics + 1;
        end
    end 
    return countLux, countBonus, countStrategics;
end

function Centroid:GetLuxResourcesInCluster()
    local count = 0;
    local mappedHex = {};
    if self.HexCluster ~= nil and #self.HexCluster > 0 then
        for _, hex in pairs(self.HexCluster) do
            if hex:HasLux() then
                count = count + 1;
                table.insert(mappedHex, hex);
            end
        end
    end
    return count, mappedHex;
end

function Centroid:GetRessourceIdCountInCluster(ressourceId)
    local count = 0;
    local mappedHex = {};
    if self.HexCluster ~= nil and #self.HexCluster > 0 then
        for _, hex in pairs(self.HexCluster) do
            if hex.ResourceType == ressourceId then
                count = count + 1;
                table.insert(mappedHex, hex);
            end
        end
    end
    return count, mappedHex;
end

function Centroid:GetTerrainTypeCountInCluster(terrainId)
    local count = 0;
    local mappedHex = {};
    if self.HexCluster ~= nil and #self.HexCluster > 0 then
        for _, hex in pairs(self.HexCluster) do
            if hex.TerrainType == terrainId then
                count = count + 1;
                table.insert(mappedHex, hex);
            end
        end
    end
    return count, mappedHex;
end

function Centroid:ComputeCentroidScore()
    if self.HexCluster ~= nil and #self.HexCluster > 0 then
        local numberCoastalHex = 0
        for _, hex in pairs(self.HexCluster) do
            local ressource = hex.ResourceType
            if ressource ~= g_RESOURCE_NONE then
                local hexScore = hex.ResourcesScore[ressource]
                local centScore = self.ResourcesScore[ressource] or 0 --init
                centScore = centScore + hexScore
                self.ResourcesScore[ressource] = centScore
            end
            local feature = hex.FeatureType
            if feature ~= g_FEATURE_NONE then
                local hexScore = hex.FeaturesScore[feature]
                local centScore = self.FeaturesScore[feature] or 0 --init
                centScore = centScore + hexScore
                self.FeaturesScore[feature] = centScore
            end
            local terrain = hex.TerrainType
            if terrain ~= g_TERRAIN_TYPE_NONE then
                local hexScore = hex.TerrainsScore[terrain]
                local centScore = self.TerrainsScore[terrain] or 0 --init
                centScore = centScore + hexScore
                self.TerrainsScore[terrain] = centScore
            end
            if hex.IsFreshWater then
                self.FreshWaterScore = self.FreshWaterScore + 1 
            end
            if hex.IsOnRiver then
                self.IsRiverScore = self.IsRiverScore + 1 
            end
            if hex.IsTundraLand then
                self.TundraScore = self.TundraScore + hex.TundraScore
            end
            if hex.IsCoastal and hex:IsTundraLand() == false and hex:IsSnowLand() == false then
                self.HasCoast = true
                numberCoastalHex = numberCoastalHex + 1;
                if numberCoastalHex > 7 then
                    self.IsCoastalCentroid = true;
                end
            end

        end
        -- Mean score
        for id, _ in pairs(self.ResourcesScore) do
            local scoreRes = self.ResourcesScore[id]
            self.ResourcesScore[id] = scoreRes / #self.HexCluster
        end
        for id, _ in pairs(self.FeaturesScore) do
            local scoreFeat = self.FeaturesScore[id]
            self.FeaturesScore[id] = scoreFeat / #self.HexCluster
        end
        for id, _ in pairs(self.TerrainsScore) do
            local scoreTerr = self.TerrainsScore[id]
            self.TerrainsScore[id] = scoreTerr / #self.HexCluster
        end
        self.FreshWaterScore = self.FreshWaterScore / #self.HexCluster
        self.IsRiverScore = self.IsRiverScore / #self.HexCluster
        self.TundraScore = self.TundraScore / #self.HexCluster
    end
end

---------------------------------------
-- HexMap
---------------------------------------

HexMap = {}

function HexMap.new(_width, _height, mapScript)
    local instance = {};
    setmetatable(instance, {__index = HexMap});
    instance.width = _width;
    instance.height = _height;
    instance.mapScript = mapScript;
    instance.canCircumnavigate = instance:CanCircumnavigate();
    instance.minimumDistanceMajortoMajorCivs = instance:SetMinimumDistanceMajortoMajorCivs();
    instance.minimumDistanceMinorToMajorCivs = GlobalParameters.START_DISTANCE_MINOR_MAJOR_CIVILIZATION or 8;
    instance.minimumDistanceMinorToMinorCivs = GlobalParameters.START_DISTANCE_MINOR_CIVILIZATION_START or 7;
    instance.map = {};
    instance.mapFreshWater = {};
    instance.mapCostal = {};
    instance.mapResources = {};
    instance.mapFeatures = {};
    instance.mapTerrains = {};
    instance.mapDesert = {};
    instance.mapTundra = {};
    instance.mapWater = {};
    instance.mapOcean = {};
    instance.mapContinents = {};
    instance.mapOnSplit = {}
    instance.mapWonders = {};
    instance.map22 = {}
    instance.centroidsArray = {};
    instance.PeninsuleScoreOK = {}
    instance.mapResourcesLux = instance:GetMapResourcesLux();
    instance.mapResourcesBonus = instance:GetMapResourcesBonus();
    instance.mapResourcesStrategics = instance:GetMapResourcesStrategics();
    instance.mapResourcesFarms =instance:GetMapResourcesFarms();
    instance.mapResourcesPastures = instance:GetMapResourcesPastures();
    instance.mapResourcesPlantations = instance:GetMapResourcesPlantations();
    instance.mapResourcesMines = instance:GetMapResourcesMines();
    instance.mapResourcesQuarries = instance:GetMapResourcesQuarries();
    instance.mapResourcesFishings = instance:GetMapResourcesFishings();
    instance:FillHexMapDatas();
    instance:StoreHexRings();
    instance:ComputeScoreHex();
    instance.ValidSpawnHexes = {};
    instance.majorSpawns = {};
    instance.minorSpawns = {};
    -- instance:InitSetSpawnableWater -- too close to border, non fresh or coast, peninsula score 
    -- Put maps parameters here ? (world age, temperature, rainfall etc)
    return instance;
end

function HexMap:CanCircumnavigate()
    return self.mapScript ~= MAP_INLAND_SEA and self.mapScript ~= MAP_TILTED_AXIS;
end

function HexMap:SetMinimumDistanceMajortoMajorCivs()
    if self.mapScript == MAP_HIGHLANDS or self.mapScript == MAP_LAKES or self.MAP_RICH_HIGHLANDS then
        return 15;
    elseif self.mapScript == MAP_INLAND_SEA then
        return 14;
    elseif self.mapScript == MAP_SEVEN_SEAS or self.mapScript == MAP_PRIMORDIAL then
        return 13;
    elseif self.mapScript == MAP_PANGAEA or self.mapScript == MAP_DW_PANGAEA or self.mapScript == MAP_SHUFFLE or self.mapScript == MAP_TILTED_AXIS then
        return 12;
    elseif self.mapScript == MAP_TERRA then
        return 8;
    else
        return 10;
    end
end

-- Put datas of every hex in map
function HexMap:FillHexMapDatas()
    for y = 0, self.height - 1 do
        self.map[y] = {};
        for x = 0, self.width - 1 do
            local newHex = Hex.new(x,y);
            newHex:FillHexDatas();
            self.map[y][x] = newHex;
            if newHex.IsFreshWater then
                table.insert(self.mapFreshWater, newHex);   
            end
            if newHex.IsCoastal then
                table.insert(self.mapCostal, newHex);
            end
            self:InsertMapResources(newHex.x, newHex.y);
            self:InsertMapFeatures(newHex.x, newHex.y);
            self:InsertMapTerrains(newHex.x, newHex.y);
            if newHex.IdContinent ~= nil then
                self.mapContinents[newHex.IdContinent] = self.mapContinents[newHex.IdContinent] or {}
                table.insert(self.mapContinents[newHex.IdContinent], newHex);
            end
            if newHex.IsOnSplit == true then
                table.insert(self.mapOnSplit, newHex);
            end
            if newHex.IsNaturalWonder == true then
                table.insert(self.mapWonders, newHex);
            end
            if newHex:IsWater() == true then
                table.insert(self.mapWater, newHex);
            end
            if newHex.TerrainType == g_TERRAIN_TYPE_OCEAN then
                table.insert(self.mapOcean, newHex);
            end
            if newHex:IsTundraLand() == true then
                table.insert(self.mapTundra, newHex);
            end
            if newHex:IsDesertLand() == true then
                table.insert(self.mapDesert, newHex);
            end
        end
    end
    self:UpdateYieldMap();
end

-- Pre store rings data for each hex for later uses and improve performances
function HexMap:StoreHexRings()
    for y = 0, self.height - 1 do
        for x = 0, self.width - 1 do
            local hex = self:GetHexInMap(x, y);
            hex.AllRing6, hex.AllRing6Map = self:GetAllHexInRing(hex, 6);
            hex.Ring1 = hex.AllRing6Map[1];
            hex.Ring2 = hex.AllRing6Map[2];
            -- Fill as needed 
        end
    end
end

-- For each tile, store the score density for each ressource/feature/terrain - use for civ biases
-- TODO : how to calculate a score 
function HexMap:ComputeScoreHex()
    print("Start ComputeScoreHex",  os.date("%c"))
    for y = 0, self.height - 1 do
        for x = 0, self.width - 1 do
            local hex = self:GetHexInMap(x, y);
            self:ComputeCostalScore(hex);
            self:ComputePeninsulaScore(hex);
            self:ComputeResourcesScore(hex);
            self:ComputeFeaturesScore(hex);
            self:ComputeTerrainsScore(hex);
            self:ComputeWaterScore(hex);
            self:ComputeRiverScore(hex);
            self:ComputeMajorSpawnableTiles(hex);
            self:ComputeMinorSpawnableTiles(hex);
        end
    end
    print("End ComputeScoreHex",  os.date("%c"))
end

function HexMap:ResetSpawnableHex()
    for y = 0, self.height - 1 do
        for x = 0, self.width - 1 do
            local hex = self:GetHexInMap(x, y);
            self:ComputeMajorSpawnableTiles(hex);
            self:ComputeMinorSpawnableTiles(hex);
            hex.IsCivStartingPlot = false;
        end
    end
end

function HexMap:ComputeCostalScore(hex)
    local score = {}
    local ring_distance = 3
    local min_land_tiles = 0
    local start_ring = 1
    for i = start_ring, ring_distance do
        min_land_tiles = min_land_tiles + 6 * i * (ring_distance + 1 - i)
        score[i] = ring_distance + 1 - i
    end
    min_land_tiles = min_land_tiles * 0.4 -- 40% of land tiles
    hex.CostalScore = 0
    if hex:IsWater() == false and (hex.IslandSize > 31 or hex:IsMountain()) then
        for i = start_ring, ring_distance, 1 do
            local t = self:GetHexInRing(hex, i);
            for _, h in pairs(t) do
                if h:IsWater() == false and (h.IslandSize > 31 or h:IsMountain()) then
                    hex.CostalScore = hex.CostalScore + score[i]
                end
            end
        end
        if (hex.CostalScore / min_land_tiles) >= 1 then
            hex.CostalScore = 1
        else
            hex.CostalScore = 0
        end
    end
end

-- Calculate number of reachable tiles in ring 6 to avoid peninsula spawns
function HexMap:ComputePeninsulaScore(hex)
    hex.PeninsuleScore = 0
    if hex:IsImpassable() == false and self:IsHexNextTo4ImpassableTiles(hex) == false and hex:IsSnowLand() == false then
        local threshold = #hex.AllRing6 * 0.33
        local visitedRing = {}
        local visitedHex = {}
        local totalVisited = 0
        visitedRing[0] = {}
        table.insert(visitedRing[0], hex)
        for n = 1, 6 do
            visitedRing[n] = {}
            local n1 = n - 1
            for i, h in pairs(visitedRing[n1]) do
                for _, neighbor in pairs(h.Ring1) do
                    if neighbor:IsImpassable() == false and visitedHex[neighbor] == nil then
                        visitedHex[neighbor] = true;
                        table.insert(visitedRing[n], neighbor)
                        totalVisited = totalVisited + 1
                    end
                end 
            end 
        end
        --print("ComputePeninsuleNonSpawnable - Number of visitable tiles in 6 rings for ("..tostring(hex.x)..", "..tostring(hex.y)..") is "..tostring(totalVisited).." sur "..tostring(#hex.AllRing6))               
        hex.PeninsuleScore = math.floor((totalVisited / #hex.AllRing6) * 100 )
        if totalVisited > threshold then
            table.insert(self.PeninsuleScoreOK, hex)
        end
    end
end

--TODO - refacto
function HexMap:ComputeResourcesScore(hex)
    hex.ResourcesScore = {}
    for i, ring in pairs(hex.AllRing6Map) do
        for _, h in pairs(ring) do
            local ressource = h.ResourceType
            if h:IsImpassable() == false and ressource ~= g_RESOURCE_NONE then
                local score = hex.ResourcesScore[ressource] or 0 --init
                score = score + 1 * ScoreDistanceFactor(i)
                hex.ResourcesScore[ressource] = score
            end
        end
    end
    -- Include the tile itself
    if hex.ResourceType ~= g_RESOURCE_NONE then
        local hexScore = hex.ResourcesScore[hex.ResourceType] or 0
        hexScore = hexScore + 1
        hex.ResourcesScore[hex.ResourceType] = hexScore
    end

    for ress, _ in pairs(hex.ResourcesScore) do
        hex.ResourcesScore[ress] = hex.ResourcesScore[ress] / #hex.AllRing6  * 100;
    end

end

function HexMap:ComputeFeaturesScore(hex)
    hex.FeaturesScore = {}
    for i, ring in pairs(hex.AllRing6Map) do
        for _, h in pairs(ring) do
            local feature = h.FeatureType
            if feature ~= g_FEATURE_NONE then
                local score = hex.FeaturesScore[feature] or 0 --init
                score = score + 1 * ScoreDistanceFactor(i)
                hex.FeaturesScore[feature] = score
            end
        end
    end
    -- Include the tile itself
    if hex.FeatureType ~= g_FEATURE_NONE then
        local hexScore = hex.FeaturesScore[hex.FeatureType] or 0
        hexScore = hexScore + 1
        hex.FeaturesScore[hex.FeatureType] = hexScore
    end

    for feat, _ in pairs(hex.FeaturesScore) do
        hex.FeaturesScore[feat] = hex.FeaturesScore[feat] / #hex.AllRing6  * 100;
    end

end

function HexMap:ComputeTerrainsScore(hex)
    hex.TerrainsScore = {}
    for i, ring in pairs(hex.AllRing6Map) do
        for _, h in pairs(ring) do
            local terrain = h.TerrainType
            if terrain ~= g_TERRAIN_TYPE_NONE then
                local score = hex.TerrainsScore[terrain] or 0 --init
                score = score + 1 * ScoreDistanceFactor(i)
                hex.TerrainsScore[terrain] = score
            end
            -- Compute coastal tiles score
            local isCoastal = h.IsCoastal
            if isCoastal == true then
                local score = hex.TerrainsScore[g_TERRAIN_TYPE_COAST] or 0 --init
                score = score + 1 * ScoreDistanceFactor(i)
                hex.TerrainsScore[g_TERRAIN_TYPE_COAST] = score
            end
            if h:IsTundraLand() and i < 4 then
                hex.IsCloseToTundra = true
            elseif h:IsDesertLand() and i < 4 then
                hex.IsCloseToDesert = true
            end
        end
    end
    -- Include the tile itself
    if hex.TerrainType ~= g_TERRAIN_TYPE_NONE then
        local hexScore = hex.TerrainsScore[hex.TerrainType] or 0
        hexScore = hexScore + 1
        hex.TerrainsScore[hex.TerrainType] = hexScore
    end

    for terr, _ in pairs(hex.TerrainsScore) do
        hex.TerrainsScore[terr] = hex.TerrainsScore[terr] / #hex.AllRing6 * 100;
    end

    -- see if how to calculate for more precision in score (by ring distance etc)
    local flatTundraScore =  hex.TerrainsScore[g_TERRAIN_TYPE_TUNDRA] or 0;
    local hillsTundraScore = hex.TerrainsScore[g_TERRAIN_TYPE_TUNDRA_HILLS] or 0;
    local mountainTundraScore=  hex.TerrainsScore[g_TERRAIN_TYPE_TUNDRA_MOUNTAIN] or 0;
    hex.TundraScore = flatTundraScore + hillsTundraScore + mountainTundraScore;
    
    local flatDesertScore =  hex.TerrainsScore[g_TERRAIN_TYPE_DESERT] or 0;
    local hillsDesertScore = hex.TerrainsScore[g_TERRAIN_TYPE_DESERT_HILLS] or 0;
    local mountainDesertScore=  hex.TerrainsScore[g_TERRAIN_TYPE_DESERT_MOUNTAIN] or 0;
    hex.DesertScore = flatDesertScore + hillsDesertScore + mountainDesertScore;
end

function HexMap:ComputeWaterScore(hex)
    hex.WaterScore = 0
    for _, h in pairs(hex.AllRing6) do
        if h:IsImpassable() == false and h.IsFreshWater then
            local score = hex.WaterScore or 0 --init
            score = score + 1
            hex.WaterScore = score
        end
    end
    -- Include the tile itself
    if hex.IsFreshWater == false then
        local hexScore = hex.WaterScore or 0
        hexScore = hexScore + 1
        hex.WaterScore = hexScore
    end

    hex.WaterScore = hex.WaterScore / #hex.AllRing6  * 100;

end

function HexMap:ComputeRiverScore(hex)
    hex.RiverScore = 0
    for _, h in pairs(hex.AllRing6) do
        if h:IsImpassable() == false and h.IsOnRiver then
            local score = hex.RiverScore or 0 --init
            score = score + 1
            hex.RiverScore = score
        end
    end
    -- Include the tile itself
    if hex.IsOnRiver == false then
        local hexScore = hex.RiverScore or 0
        hexScore = hexScore + 1
        hex.RiverScore = hexScore
    end

    hex.RiverScore = hex.RiverScore / #hex.AllRing6  * 100;

end

-- Initial analysis of the tile to avoid technical spawns
function HexMap:ComputeMajorSpawnableTiles(hex) 
    local isCloseToMapBorderX = self.canCircumnavigate == false and (self.width - hex.x <= 3 or hex.x <= 3);
    local isCloseToMapBorderY = self.height - hex.y <= 3 or hex.y <= 3;
    local isTooCloseToNaturalWonder = false
    for i, r in pairs(hex.AllRing6Map) do
        for _, h in pairs(r) do
            -- Limit to 5 tiles like now
            if h.IsNaturalWonder or hex.IsNaturalWonder and i < 6 then
                isTooCloseToNaturalWonder = true;
                break;
            end
        end
    end
    local isNotInPeninsula = hex.PeninsuleScore >= 33
    hex.IsMajorSpawnable = hex:IsWater() == false 
        and hex:IsSnowLand() == false 
        and isCloseToMapBorderX == false 
        and isCloseToMapBorderY == false 
        and isNotInPeninsula == true
        and isTooCloseToNaturalWonder == false;
end


function HexMap:ComputeMinorSpawnableTiles(hex)
    local isTooCloseToNaturalWonder = false
    for _, h in pairs(hex.AllRing6) do
        if h.IsNaturalWonder then
            isTooCloseToNaturalWonder = true;
            break;
        end
    end
    hex.IsMinorSpawnable = hex:IsWater() == false and isTooCloseToNaturalWonder == false;
end

-- TODO : Testing score calculations depending on distance
function ScoreDistanceFactor(dist)
    return 1;
    --[[if dist == 1 then
        return 1.2;
    elseif dist == 2 then
        return 1.1;
    else 
        return 1;
    end]]--
end

function HexMap:HasContinentInWalkableRange(hex, range)
    local visitedRing = {}
    local visitedHex = {}
    visitedRing[0] = {}
    table.insert(visitedRing[0], hex)
    for n = 1, range do
        visitedRing[n] = {}
        local n1 = n - 1
        for i, h in pairs(visitedRing[n1]) do
            for _, neighbor in pairs(h.Ring1) do
                if neighbor:IsImpassable() == false and visitedHex[neighbor] == nil then
                    visitedHex[neighbor] = true;
                    table.insert(visitedRing[n], neighbor)
                    if neighbor.IdContinent ~= hex.IdContinent then
                        return true;
                    end
                end
            end 
        end 
    end
    return false;
end

function HexMap:IsHexNextTo4ImpassableTiles(hex)
    local ring1 = hex.AllRing6Map[1];
    local impassableRing1 = 0
    for _, r1 in pairs(ring1) do
        if r1:IsImpassable() then
            impassableRing1 = impassableRing1 + 1
        end
        if impassableRing1 > 3 then
            return true;
        end
    end
    return false;
end


function HexMap:UpdateYieldMap()
    -- Temp - 2f 2p tiles are mapped 
    self.map22 = {}
    for y = 0, self.height - 1 do
        for x = 0, self.width - 1 do
            local h = self.map[y][x]
            h:UpdateYields();
            if h.Is22 == true then
                table.insert(self.map22, h);
            end
        end
    end
end

function HexMap:InsertMapResources(x, y)   
    local hex = self:GetHexInMap(x, y)
    if hex ~= nil and hex.ResourceType ~= g_RESOURCE_NONE then
        self.mapResources[hex.ResourceType] = self.mapResources[hex.ResourceType] or {}
        table.insert(self.mapResources[hex.ResourceType], hex);
        if g_RESOURCES_LUX_LIST[hex.ResourceType] ~= nil then
            table.insert(self.mapResourcesLux, hex);
        elseif g_RESOURCES_BONUS_LIST[hex.ResourceType] ~= nil then
            table.insert(self.mapResourcesBonus, hex);
        elseif g_RESOURCES_STRATEGICS[hex.ResourceType] ~= nil then
            table.insert(self.mapResourcesStrategics, hex);
        elseif g_RESOURCES_MINE_LIST[hex.ResourceType] ~= nil and hex:IsWater() == false then
            table.insert(self.mapResourcesMines, hex);
        elseif g_RESOURCES_FARM_LIST[hex.ResourceType] ~= nil then
            table.insert(self.mapResourcesFarms, hex);
        elseif g_RESOURCES_PASTURE_LIST[hex.ResourceType] ~= nil then
            table.insert(self.mapResourcesPastures, hex);
        elseif g_RESOURCES_QUARRY_LIST[hex.ResourceType] ~= nil then
            table.insert(self.mapResourcesQuarries, hex);
        elseif g_RESOURCES_PLANTATION_LIST[hex.ResourceType] ~= nil then
            table.insert(self.mapResourcesPlantations, hex);
        elseif g_RESOURCES_FISHINGBOAT_LIST[hex.ResourceType] ~= nil and hex:IsWater() == true then
            table.insert(self.mapResourcesFishings, hex);
        end
    end
end

-- Remove from the map the hex with current resource 
-- Amber can be mine ressource (on land) and fishing (on water) - have to deal with that during mapping
function HexMap:RemoveMapResources(x, y)
    local hex = self:GetHexInMap(x, y)
    if hex ~= nil and hex.ResourceType ~= g_RESOURCE_NONE then
        -- Remove previous resource from map
        for i , h in ipairs(self.mapResources[hex.ResourceType]) do
            if h == hex then
                table.remove(self.mapResources[hex.ResourceType], i)
                break;
            end
        end
        -- Remove from map to corresponding type of resources
        if g_RESOURCES_LUX_LIST[hex.ResourceType] ~= nil then
            table.remove(self.mapResourcesLux, hex);
        elseif g_RESOURCES_BONUS_LIST[hex.ResourceType] ~= nil then
            table.remove(self.mapResourcesBonus, hex);
        elseif g_RESOURCES_STRATEGICS[hex.ResourceType] ~= nil then
            table.remove(self.mapResourcesStrategics, hex);
        elseif g_RESOURCES_MINE_LIST[hex.ResourceType] ~= nil and hex:IsWater() == false then
            table.remove(self.mapResourcesMines, hex);
        elseif g_RESOURCES_PASTURE_LIST[hex.ResourceType] ~= nil then
            table.remove(self.mapResourcesPastures, hex);
        elseif g_RESOURCES_FARM_LIST[hex.ResourceType] ~= nil then
            table.remove(self.mapResourcesFarms, hex);
        elseif g_RESOURCES_QUARRY_LIST[hex.ResourceType] ~= nil then
            table.remove(self.mapResourcesQuarries, hex);
        elseif g_RESOURCES_PLANTATION_LIST[hex.ResourceType] ~= nil then
            table.remove(self.mapResourcesPlantations, hex);
        elseif g_RESOURCES_FISHINGBOAT_LIST[hex.ResourceType] ~= nil and hex:IsWater() == true then
            table.remove(self.mapResourcesFishings, hex);
        end
    end
end


function HexMap:InsertMapFeatures(x, y)   
    local hex = self:GetHexInMap(x, y)
    if hex ~= nil and hex.FeatureType ~= g_FEATURE_NONE then
        self.mapFeatures[hex.FeatureType] = self.mapFeatures[hex.FeatureType] or {};
        table.insert(self.mapFeatures[hex.FeatureType], hex)
    end
end

function HexMap:RemoveMapFeatures(x, y)   
    local hex = self:GetHexInMap(x, y)
    if hex ~= nil and hex.FeatureType ~= g_FEATURE_NONE then
        for i , h in ipairs(self.mapFeatures[hex.FeatureType]) do
            if h == hex then
                table.remove(self.mapFeatures[hex.FeatureType], i)
                break;
            end
        end
    end
end

function HexMap:InsertMapTerrains(x, y)   
    local hex = self:GetHexInMap(x, y)
    if hex ~= nil and hex.TerrainType ~= g_TERRAIN_TYPE_NONE then
        self.mapTerrains[hex.TerrainType] = self.mapTerrains[hex.TerrainType] or {};
        table.insert(self.mapTerrains[hex.TerrainType], hex)
    end
end

function HexMap:RemoveMapTerrains(x, y)   
    for i , h in ipairs(self.mapTerrains[hex.TerrainType]) do
        if h == hex then
            table.remove(self.mapTerrains[hex.TerrainType], i)
            break;
        end
    end
end

function HexMap:GetMapResourcesLux()
    local resourceLuxList = {}
    for idRes, t in pairs(self.mapResources) do
        if g_RESOURCES_LUX_LIST[idRes] ~= nil then
            local mapResourceIndex = self.mapResources[idRes];
            for _, hex in ipairs(mapResourceIndex) do
                table.insert(resourceLuxList, hex);
            end
        end
    end
    return resourceLuxList;
end

function HexMap:GetMapResourcesBonus()
    local resourceBonusList = {}
    for idRes, t in pairs(self.mapResources) do
        if g_RESOURCES_BONUS_LIST[idRes] ~= nil then
            local mapResourceIndex = self.mapResources[idRes];
            for _, hex in ipairs(mapResourceIndex) do
                table.insert(resourceBonusList, hex);
            end
        end
    end
    return resourceBonusList;
end

function HexMap:GetMapResourcesStrategics()
    local resourceStratList = {}
    for idRes, t in pairs(self.mapResources) do
        if g_RESOURCES_STRATEGICS[idRes] ~= nil then
            local mapResourceIndex = self.mapResources[idRes];
            for _, hex in ipairs(mapResourceIndex) do
                table.insert(resourceStratList, hex);
            end
        end
    end
    return resourceStratList;
end

function HexMap:GetMapResourcesFarms()
    local resourceFarmsList = {}
    for idRes, t in pairs(self.mapResources) do
        if g_RESOURCES_FARM_LIST[idRes] ~= nil then
            local mapResourceIndex = self.mapResources[idRes];
            for _, hex in ipairs(mapResourceIndex) do
                table.insert(resourceFarmsList, hex);
            end
        end
    end
    return resourceFarmsList;
end

function HexMap:GetMapResourcesPastures()
    local resourcePasturesList = {}
    for idRes, t in pairs(self.mapResources) do
        if g_RESOURCES_PASTURE_LIST[idRes] ~= nil then
            local mapResourceIndex = self.mapResources[idRes];
            for _, hex in ipairs(mapResourceIndex) do
                table.insert(resourcePasturesList, hex);
            end
        end
    end
    return resourcePasturesList;
end

function HexMap:GetMapResourcesMines()
    local resourceMinesList = {}
    for idRes, t in pairs(self.mapResources) do
        if g_RESOURCES_MINE_LIST[idRes] ~= nil then
            local mapResourceIndex = self.mapResources[idRes];
            for _, hex in ipairs(mapResourceIndex) do
                table.insert(resourceMinesList, hex);
            end
        end
    end
    return resourceMinesList;
end

function HexMap:GetMapResourcesQuarries()
    local resourceQuarriesList = {}
    for idRes, t in pairs(self.mapResources) do
        if g_RESOURCES_QUARRY_LIST[idRes] ~= nil then
            local mapResourceIndex = self.mapResources[idRes];
            for _, hex in ipairs(mapResourceIndex) do
                table.insert(resourceQuarriesList, hex);
            end
        end
    end
    return resourceQuarriesList;
end

function HexMap:GetMapResourcesPlantations()
    local resourcePlantationsList = {}
    for idRes, t in pairs(self.mapResources) do
        if g_RESOURCES_PLANTATION_LIST[idRes] ~= nil then
            local mapResourceIndex = self.mapResources[idRes];
            for _, hex in ipairs(mapResourceIndex) do
                table.insert(resourcePlantationsList, hex);
            end
        end
    end
    return resourcePlantationsList;
end

function HexMap:GetMapResourcesFishings()
    local resourcesFishingsList = {}
    for idRes, t in pairs(self.mapResources) do
        if g_RESOURCES_FISHINGBOAT_LIST[idRes] ~= nil then
            local mapResourceIndex = self.mapResources[idRes];
            for _, hex in ipairs(mapResourceIndex) do
                table.insert(resourcesFishingsList, hex);
            end
        end
    end
    return resourcesFishingsList;
end


-- Return the hex at the coord in parameter. nil if out of bound
function HexMap:GetHexInMap(pX, pY)
    if self.canCircumnavigate then 
        pX = pX % self.width;
    end
    if (self.canCircumnavigate == false and (pX < 0 or pX >= self.width)) or (pY < 0 or pY >= self.height) then
        return nil
    end
    local hex = self.map[pY][pX];
    return hex
end

-- Return the sum of two hex vectors - do not check if the result is on map or not
function HexMap:GetHexSum(hex, vec)
    local newX = hex.x + vec.x
    local newY = hex.y + vec.y
    if self.canCircumnavigate then
        newX = newX % self.width
    end
    return Hex.new(newX, newY)
end

-- Return multiplication of hex vector times the factor in param
-- TODO : Warning - does not work with directions dependent to Y, for the moment only use with West or East direction
function HexMap:GetHexScale(hex, factor)
    return Hex.new(hex.x * factor, hex.y * factor)
end

-- 1 -> 0 
-- 2 -> 1
-- 3 -> 2
-- 4 -> 3
-- Loop through all tiles in the specified ring in parameter
function HexMap:GetHexInRing(hexCenter, ringRadius)
    local hexList = {};
    -- Starting from the hex to the left
    local hexWest = self:GetHexSum(hexCenter, self:GetHexScale(hexCenter:GetAdjDirection(DirectionTypes.DIRECTION_WEST), ringRadius));
    local testHex = hexWest;
    for i=0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
        for r = 0, ringRadius - 1 do
            -- Check if the tested hex is in map coord range
            local hexToAdd = self:GetHexInMap(testHex.x, testHex.y)
            -- if yes we add it to the table
            if hexToAdd ~= nil then
                table.insert(hexList, hexToAdd);
            end
            -- in every cases we move to the next tile 
            local hexDir = testHex:GetAdjDirection(i);
            testHex = self:GetHexSum(testHex, hexDir)
        end
    end
    return hexList;
end

-- Loop through all rings up to ring radius in parameter
function HexMap:GetAllHexInRing(hexCenter, ringRadius)
    local hexList = {};
    local hexTable = {}
    for i=0, ringRadius do
        hexTable[i] = {}
        local hexInRingX = self:GetHexInRing(hexCenter, i);
        for _, hex in ipairs(hexInRingX) do
            table.insert(hexList, hex);
            table.insert(hexTable[i], hex)
        end
    end
    return hexList, hexTable;
end

function Hex:GetAdjDirection(directionIndex)
    if self.y % 2 == 0 then
        if directionIndex == DirectionTypes.DIRECTION_NORTHEAST then
            return Hex.new(0, 1);
        elseif directionIndex == DirectionTypes.DIRECTION_EAST then
            return Hex.new(1, 0);
        elseif directionIndex == DirectionTypes.DIRECTION_SOUTHEAST then
            return Hex.new(0, -1);
        elseif directionIndex == DirectionTypes.DIRECTION_SOUTHWEST then
            return Hex.new(-1, -1);
        elseif directionIndex == DirectionTypes.DIRECTION_WEST then
            return Hex.new(-1, 0);
        elseif directionIndex == DirectionTypes.DIRECTION_NORTHWEST then
            return Hex.new(-1, 1);
        end
    elseif self.y % 2 == 1 then
        if directionIndex == DirectionTypes.DIRECTION_NORTHEAST then
            return Hex.new(1, 1);
        elseif directionIndex == DirectionTypes.DIRECTION_EAST then
           return Hex.new(1, 0);
        elseif directionIndex == DirectionTypes.DIRECTION_SOUTHEAST then
           return Hex.new(1, -1);
        elseif directionIndex == DirectionTypes.DIRECTION_SOUTHWEST then
           return Hex.new(0, -1);
        elseif directionIndex == DirectionTypes.DIRECTION_WEST then
           return Hex.new(-1, 0);
        elseif directionIndex == DirectionTypes.DIRECTION_NORTHWEST then
           return Hex.new(0, 1);
        end
   end
end

function HexMap:ContinentsInRange(hex, range)
    local hexes, _ = self:GetAllHexInRing(hex, range)
    local continentsInRange = 1
    for _ , h in pairs(hexes) do
        if h.IdContinent ~= hex.IdContinent then
            continentsInRange = continentsInRange + 1
        end
    end
    return continentsInRange;
end

function HexMap:getRandomHex()
    local randX = TerrainBuilder.GetRandomNumber(self.width, "randX");
    local randY = TerrainBuilder.GetRandomNumber(self.height, "randY");
    return self:GetHexInMap(randX, randY);
end


---------------------------------------
-- Terraforming methods 
---------------------------------------

---------------------------------------
-- Terrains
-- Should never be none
---------------------------------------
function HexMap:TerraformSetTerrain(hex, terrainId) 
    local plot = Map.GetPlot(hex.x, hex.y);
    if plot ~= nil and hex.TerrainType ~= g_TERRAIN_TYPE_NONE then
        print("TerraformSetTerrain "..tostring(terrainId))
        self:RemoveMapTerrains(hex.x, hex.y);
        TerrainBuilder.SetTerrainType(plot, terrainId);
        hex.TerrainType = terrainId
        hex:UpdateYields();
        self:InsertMapTerrains(hex.x, hex.y);
    end
end

---------------------------------------
-- Resources
---------------------------------------
function HexMap:TerraformSetResource(hex, resourceId) 
    local plot = Map.GetPlot(hex.x, hex.y);
    if plot ~= nil and ResourceBuilder.CanHaveResource(plot, resourceId) then
        self:RemoveMapResources(hex.x, hex.y);
        ResourceBuilder.SetResourceType(plot, resourceId, 1);
        hex.ResourceType = resourceId;
        hex.HexResource = HexResource.new(self.ResourceType);
        hex:UpdateYields()
        self:InsertMapResources(hex.x, hex.y);
        return true;
    end
    return false;
end

---------------------------------------
-- Features
---------------------------------------
function HexMap:TerraformSetFeature(hex, featureId)
    local plot = Map.GetPlot(hex.x, hex.y);
    local i = hex.y * self.width + hex.x;
	local plotindex = Map.GetPlotByIndex(i);
    if plot ~= nil and TerrainBuilder.CanHaveFeature(plotindex, featureId) then
        self:RemoveMapFeatures(hex.x, hex.y)
        TerrainBuilder.SetFeatureType(plotindex, featureId);
        hex.FeatureType = featureId;
        hex:UpdateYields()
        self:InsertMapFeatures(hex.x, hex.y);
        return true;
    end 
    return false;
end

---------------------------------------
-- Hills
-- Info : not currently mapped, see if needed
---------------------------------------
function Hex:TerraformToHill(cleanTile)
    if (cleanTile) then
        self:TerraformSetFeature(g_FEATURE_NONE);
        self:TerraformSetResource(g_RESOURCE_NONE);
    end
    if self.TerrainType == g_TERRAIN_TYPE_GRASS then
        self:TerraformSetTerrain(g_TERRAIN_TYPE_GRASS_HILLS)
    elseif self.TerrainType == g_TERRAIN_TYPE_PLAINS then
        self:TerraformSetTerrain(g_TERRAIN_TYPE_PLAINS_HILLS)
    elseif self.TerrainType == g_TERRAIN_TYPE_DESERT then
        self:TerraformSetTerrain(g_TERRAIN_TYPE_DESERT_HILLS)
    elseif self.TerrainType == g_TERRAIN_TYPE_TUNDRA then
        self:TerraformSetTerrain(g_TERRAIN_TYPE_TUNDRA_HILLS)
    elseif self.TerrainType == g_TERRAIN_TYPE_SNOW then
        self:TerraformSetTerrain(g_TERRAIN_TYPE_SNOW_HILLS)
    end
    self:UpdateYields()
end

function Hex:TerraformToFlat(cleanTile)
    if (cleanTile) then
        self:TerraformSetFeature(g_FEATURE_NONE);
        self:TerraformSetResource(g_RESOURCE_NONE);
    end
    if self.TerrainType == g_TERRAIN_TYPE_GRASS_HILLS then
        self:TerraformSetTerrain(g_TERRAIN_TYPE_GRASS)
    elseif self.TerrainType == g_TERRAIN_TYPE_PLAINS_HILLS then
        self:TerraformSetTerrain(g_TERRAIN_TYPE_PLAINS)
    elseif self.TerrainType == g_TERRAIN_TYPE_DESERT_HILLS then
        self:TerraformSetTerrain(g_TERRAIN_TYPE_DESERT)
    elseif self.TerrainType == g_TERRAIN_TYPE_TUNDRA_HILLS then
        self:TerraformSetTerrain(g_TERRAIN_TYPE_TUNDRA)
    elseif self.TerrainType == g_TERRAIN_TYPE_SNOW_HILLS then
        self:TerraformSetTerrain(g_TERRAIN_TYPE_SNOW)
    end
    self:UpdateYields()
end

function HexMap:RemoveVolcano(hex)
    if (hex:IsMountain() == true and hex.FeatureType == g_FEATURE_VOLCANO) then
        self:TerraformSetFeature(hex, g_FEATURE_NONE);
        if hex.TerrainType == g_TERRAIN_TYPE_DESERT_MOUNTAIN then
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_DESERT_HILLS)
        elseif hex.TerrainType == g_TERRAIN_TYPE_GRASS_MOUNTAIN  then
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_GRASS_HILLS)
        elseif hex.TerrainType == g_TERRAIN_TYPE_PLAINS_MOUNTAIN  then
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_PLAINS_HILLS)
        elseif hex.TerrainType == g_TERRAIN_TYPE_SNOW_MOUNTAIN  then
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_SNOW_HILLS)
        elseif hex.TerrainType == g_TERRAIN_TYPE_TUNDRA_MOUNTAIN  then
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_TUNDRA_HILLS)
        end
        print("Removed volcano"..tostring(hex.x).." "..tostring(hex.y));
    end  
    hex:UpdateYields()
end

---------------------------------------
-- DEBUGGING prints
---------------------------------------
-- DEBUGGING - map for every resources 
function HexMap:PrintMaps() 
    -- Loop through every resources index
    for idRes, t in pairs(self.mapResources) do
        local mapResourceIndex = self.mapResources[idRes]
        -- Through all resources, then through all hexes 
        for _, hex in ipairs(mapResourceIndex) do
            print("Index resource = "..tostring(idRes).." at plot ("..tostring(hex.x)..", "..tostring(hex.y)..")")
        end
    end
end
-- DEBUGGING - Lux - can use any resource list
function HexMap:PrintMapsLux() 
    -- Loop through every resources index - only print if they are luxes 
    for idRes, t in pairs(self.mapResources) do
        if g_RESOURCES_LUX_LIST[idRes] ~= nil then
            local mapResourceIndex = self.mapResources[idRes]
            -- Through all resources, then through all hexes 
            for _, hex in ipairs(mapResourceIndex) do
                print("Index resource = "..tostring(idRes).." at plot ("..tostring(hex.x)..", "..tostring(hex.y)..")")
            end
        end
    end
end

-- DEBUGGING - Print Map in logs with centroid id 
function HexMap:PrintHexMap()
    local scanMap = {}
    for y = 0, self.height - 1 do
        local logX = ""
        if y % 2 == 1 then
            logX = " "
        end
        for x = 0, self.width - 1 do
            local hex = self.map[y][x]
            logX = logX..hex:PrintCentroidIdMap().." ";
        end
        scanMap[self.height - y] = logX
    end
    local skeys = {}
    for k in pairs(scanMap) do
        table.insert(skeys, k)
    end
    table.sort(skeys)
    for _,v in ipairs(skeys) do
        print(v, scanMap[v])
    end
end

function HexMap:PrintHexSpawnableMap()
    local scanMap = {}
    for y = 0, self.height - 1 do
        local logX = ""
        if y % 2 == 1 then
            logX = " "
        end
        for x = 0, self.width - 1 do
            local hex = self.map[y][x]
            if hex:IsWater() then
                logX = logX.."~~".." ";
            else
                if hex.IsMajorSpawnable then
                    logX = logX.."11".." ";
                else
                    logX = logX.."00".." ";
                end
            end
            
        end
        scanMap[self.height - y] = logX
    end
    local skeys = {}
    for k in pairs(scanMap) do
        table.insert(skeys, k)
    end
    table.sort(skeys)
    for _,v in ipairs(skeys) do
        print(v, scanMap[v])
    end
end

function HexMap:PrintHexPeninsuleMap()
    local scanMap = {}
    for y = 0, self.height - 1 do
        local logX = ""
        if y % 2 == 1 then
            logX = " "
        end
        for x = 0, self.width - 1 do
            local hex = self.map[y][x]
            if hex:IsWater() then
                logX = logX.."~~".." ";
            else
                local printScore = ""
                local score = hex.PeninsuleScore
                if score == 0 then
                    score = "00"
                elseif score == 100 then
                    score = "99"
                else
                    score = tostring(hex.PeninsuleScore)
                end
                logX = logX..score.." ";
            end
            
        end
        scanMap[self.height - y] = logX
    end
    local skeys = {}
    for k in pairs(scanMap) do
        table.insert(skeys, k)
    end
    table.sort(skeys)
    for _,v in ipairs(skeys) do
        print(v, scanMap[v])
    end
end

-- TEMP DEBUG print map for logs
function Hex:PrintCentroidIdMap()
    local printed = ""
    if self:IsWater() == true then
        if self.isCentroid == true then
            return "[~~]"
        end
        return "~~"
    end
    if self.Centroid == nil then
        return "00"
    end
    local idCentroid = self.Centroid.id
    printed = tostring(idCentroid)
    if idCentroid ~= nil and idCentroid < 10 then
        printed = "0"..tostring(idCentroid)
    end
    --if self.isCentroid == true then
    --    printed = "["..printed.."]"
    --end
    return printed
end

-- Return the count and all the hexes in the map that are not water and not snow
function HexMap:GetNonExtremCostalTiles()
    local landTiles = {}
    local countLandtiles = 0
    for y = 0, self.height - 1 do
        for x = 0, self.width - 1 do
            local hex = self.map[y][x]
            if hex:IsWater() == false and hex:IsSnowLand() == false and hex.CostalScore == 1 then
                countLandtiles = countLandtiles + 1
                table.insert(landTiles, hex)
            end
        end
    end
    return countLandtiles, landTiles;
end



-- Return the count and all the hexes in the map that are not water and not snow
function HexMap:GetLandHexList()
    local landTiles = {}
    local countLandtiles = 0
    for y = 0, self.height - 1 do
        for x = 0, self.width - 1 do
            local hex = self.map[y][x]
            if hex:IsWater() == false and hex:IsSnowLand() == false then
                countLandtiles = countLandtiles + 1
                table.insert(landTiles, hex)
            end
        end
    end
    return countLandtiles, landTiles;
end

function HexMap:LookForHills(map) 
    -- if map nil, check all the tiles in the map
    local mappedHex = {};
    local count = 0;
    if map == nil then
        for y = 0, self.height - 1 do
            for x = 0, self.width - 1 do
                local hex = self:GetHexInMap(x, y)
                if hex:IsHill() then
                    count = count + 1;
                    table.insert(mappedHex, hex);
                end
            end    
        end
    else
        for i = 10, #map do
            -- check is Hex
            local hex = map[i]
            if hex:IsHill() then
                count = count + 1;
                table.insert(mappedHex, hex);
            end
        end
    end
   
    return count, mappedHex
end

----------------------------
-- K-means
-- Centroids data currently stored in HexMap, if multiples centroids and run configs needed, 
-- change the methods to return the list of centroids instead of directly change HexMap.centroidsArray 
----------------------------
function HexMap:RunKmeans(n, iters)
    iters = iters or 30
    n = n or 16
    print("Start k-means "..tostring(n).." centroids for "..tostring(iters).." iterations. ", os.date("%c"))
    local _, points = self:GetNonExtremCostalTiles()
    local nbLandTiles = 0
    for _, p in pairs(points) do
        nbLandTiles = nbLandTiles + 1
    end
    print("k-means - nbLandTiles = "..tostring(nbLandTiles))
    -- Init centroids for Kmean
    self:InitKmeanCentroids(n, points)
    -- Run interations
	for i = 1, iters do
		self:UpdateCentroids(points)
	end
    self:CentroidGroupby(points)
    self:UpdateCentroidsSortedIndex()

    print("End k-means ", os.date("%c"))
end

function HexMap:CheckHexInCentroid(hex, centroids)
    for _, c in pairs(centroids) do
        if c.x == hex.x and c.y == hex.y then
            return true;
        end
    end
    return false;
end

-- Init n centroids for Kmean clustering using naive sharding sampling
-- https://www.kdnuggets.com/2017/03/naive-sharding-centroid-initialization-method.html
function HexMap:InitKmeanCentroids(n, spawnableHex)
    print("InitKmeanCentroids:")
    for _, hex in pairs(spawnableHex) do
        hex._mean = hex.x + hex.y
    end
    table.sort(spawnableHex, function (c1, c2) return c1._mean < c2._mean end)

    local sample_size = math.floor(#spawnableHex / n)
    local centroids = {}
    for i = 0, n - 1 do
        local index = TerrainBuilder.GetRandomNumber(sample_size, "pick random centroid");
        local randomHex = spawnableHex[sample_size * i + index] 
        print("Analysis kmeans : "..tostring(sample_size * i + index).." and size = "..tostring(#spawnableHex))

        print("Init random at centroid ("..tostring(randomHex.x)..", "..tostring(randomHex.y)..")")
        table.insert(centroids, randomHex)
    end

    -- OUTDATED random centroid selection
    -- local centroids = {}
    -- for i = 1, n do
    --     local randomHex = self:getRandomHex();
    --     local randomHexIsNotLand = true
    --     -- init random centroids anywhere on land to avoid isolated centroids on water
    --     while (randomHexIsNotLand) do
    --         if randomHex:IsWater() == false and self:CheckHexInCentroid(randomHex, centroids) == false then
    --             randomHexIsNotLand = false
    --         else
    --             randomHex = self:getRandomHex();  
    --         end
    --     end 
    --     local newCentroid = Centroid.new(randomHex.x, randomHex.y, i)
    --     print("Init random at centroid ("..tostring(newCentroid.x)..", "..tostring(newCentroid.y)..")")
    --     table.insert(centroids, randomHex)
    -- end
    self.centroidsArray = centroids
end

-- Mean of hex coord linked to the selected centroid
function HexMap:UpdateCentroids(points)
    self:CentroidGroupby(points);
    self:ClearCentroidsInMap();
	for i, centroid in pairs(self.centroidsArray) do
        if #centroid.HexCluster > 0 then
            local totalX = 0
            local totalY = 0
            for _, h in pairs(centroid.HexCluster) do
                totalX = totalX + h.x
                totalY = totalY + h.y
            end
            local newX = math.floor(totalX / #centroid.HexCluster);
            local newY= math.floor(totalY / #centroid.HexCluster);
            centroid = Centroid.new(newX, newY, i);
            self.centroidsArray[i] = centroid
            -- For display purpose in log 
            local correspondingHex = self:GetHexInMap(centroid.x, centroid.y)
            correspondingHex.isCentroid = true
        end
	end
end

-- Group a list of hex to a centroid (in centroidsArray) as index of the g table
function HexMap:CentroidGroupby(points)
	local g = {};
	for _, p in pairs(points) do
		local centroid = p:Closest(self, self.centroidsArray);
		g[centroid] = g[centroid] or {};
        p.Centroid = centroid
		table.insert(g[centroid], p);
	end
    -- put the list directly in Centroid table c.HexCluster = { list of hexes}
    for _, c in pairs(self.centroidsArray) do
        c.HexCluster = g[c] or {}
    end
end

-- Update indexes of centroids, sorting by x value (for display purpose - might remove later)
function HexMap:UpdateCentroidsSortedIndex()
    local new_centroids = self.centroidsArray
    table.sort(new_centroids, function (c1, c2) return c1.x < c2.x end)
    for i = 1, #new_centroids do
        local centroid = new_centroids[i]
        centroid.id = i
        self.centroidsArray[i] = centroid
        local correspondingHex = self:GetHexInMap(centroid.x, centroid.y)
        correspondingHex.isCentroid = true
        print("Updated new Centroid "..tostring(i).." at ("..tostring(centroid.x)..", "..tostring(centroid.y)..")");
    end
end

function HexMap:ClearCentroidsInMap()
    for y = 0, self.height - 1 do
        for x = 0, self.width - 1 do
            local hex = self:GetHexInMap(x, y)
            hex.isCentroid = false
        end
    end 
end

-- TODO error management -- param is index
function HexMap:GetHexListInCentroidId(centroidId)
    local centroid = self.centroidsArray[centroidId]
    return centroid.HexCluster;
end

-- TODO error management -- param is Centroid class
function HexMap:GetHexListInCentroid(centroid)
    return centroid.HexCluster;
end

function even(test)
	if (test % 2 == 0) then
	    return 0
	else
    	return 1
    end
end

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
    print("Civ "..tostring(instance.CivilizationLeader).." Bias priority = "..tostring(instance.BiasPriority))
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
            bias.Value = self:GetResourceIndex(row.ResourceType);
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
            bias.Value = self:GetFeatureIndex(row.FeatureType);
            ___Debug("BBS_AssignStartingPlots: Add Bias : Civilization",self.CivilizationName,"Bias Type:", bias.Type, "Tier :", bias.Tier, "Type :", row.FeatureType);
            table.insert(biases, bias);
            if bias.Value == g_FEATURE_FLOODPLAINS or bias.Value == g_FEATURE_FLOODPLAINS_GRASSLAND or bias.Value == g_FEATURE_FLOODPLAINS_PLAINS then
                self.IsFloodplainsBias = true;
            end
        end
    end
    for row in GameInfo.StartBiasTerrains() do
        if(row.CivilizationType == self.CivilizationName) then
            local bias = {};
            bias.IsNegative = false;
            bias.Tier = row.Tier;
            bias.Type = "TERRAINS";
            bias.Value = self:GetTerrainIndex(row.TerrainType);
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
				bias.Value = self:GetTerrainIndex(row.TerrainType);
				bias.Type = "NEGATIVE_TERRAINS";
				bias.Tier = row.Tier;
				___Debug("BBS_AssignStartingPlots: Add Bias : Civilization",self.CivilizationName,"Bias Type:", bias.Type, "Tier :", bias.Tier, "Type :", row.TerrainType);
				table.insert(biases, bias);
				elseif row.FeatureType ~= nil then
				bias.Value = self:GetFeatureIndex(row.FeatureType);
				bias.Type = "NEGATIVE_FEATURES";
				bias.Tier = row.Tier;
				___Debug("BBS_AssignStartingPlots: Add Bias : Civilization",self.CivilizationName,"Bias Type:", bias.Type, "Tier :", bias.Tier, "Type :", row.FeatureType);
				table.insert(biases, bias);
				elseif row.ResourceType ~= nil then
				bias.Value = self:GetResourceIndex(row.ResourceType);
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
function CivilizationAssignSpawn:GetTerrainIndex(terrainType)
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

function CivilizationAssignSpawn:GetFeatureIndex(featureType)
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

function CivilizationAssignSpawn:GetResourceIndex(resourceType)
    local resourceTypeName = "LOC_" .. resourceType .. "_NAME";
    for row in GameInfo.Resources() do
        if (row.Name == resourceTypeName) then
            return row.Index;
        end
    end
end

-- Used for city states, get any non water tiles and test if meet requirements
function HexMap:GetAnyMinorSpawnablesTiles()
    local valid = {}
    for y = 0, self.height - 1 do
        for x = 0, self.width - 1 do
            local hex = self:GetHexInMap(x, y)
            if hex:IsWater() == false and hex.IsMinorSpawnable then
                table.insert(valid, hex)
            end
        end
    end
    return valid;
end
            

-- Complete function of assigning spawn to a major civ 
-- Add more random to calculations for non coastal and non bias ? 
function CivilizationAssignSpawn:AssignSpawnByCentroid(BBS_HexMap)
    print("AssignSpawnByCentroid for "..self.CivilizationLeader);
    if self.CivilizationLeader == BBS_LEADER_TYPE_SPECTATOR then
        return true;
    end
    -- Ocean tile out of centroid for the maori (now coastal)
    --[[if self.IsOceanBias then
        local validTiles = BBS_HexMap.mapOcean
        local oceanTilesMid = {}
        -- TODO more precise ? 
        for _, h in pairs(validTiles) do
            if h.y > BBS_HexMap.height * 0.25 and h.y < BBS_HexMap.height * 0.75 then
                table.insert(oceanTilesMid, h)
            end
        end
        local rng = TerrainBuilder.GetRandomNumber(#oceanTilesMid - 1, "Random valid in centroid");
        rng = rng + 1
        local random = validTiles[rng];
        self:AssignMajorCivSpawn(BBS_HexMap, random);
        return true;
    end]]--

    local allCentScore = self:GetCentroidsOrderedByScore(BBS_HexMap);
    -- Get best centroid checking the best tile in the top 3 regions in allCentScore
    local hexSpawnFound = self:FindHighestScoreHex(allCentScore);


    if hexSpawnFound ~= nil then
        -- local validTiles = bestCentroid.ValidTilesBias;
        -- FindHighestScoreHex can return a centroid with no bias but only valid tile in last resort
        --if #validTiles == 0 then
        --    validTiles = bestCentroid.ValidTiles;
        --end
        --local highestScoreHex, score =  self:GetHighestHexScore(validTiles);
        --print("Score for spawn "..highestScoreHex:PrintXY().." = "..tostring(score));
        self:AssignMajorCivSpawn(BBS_HexMap, hexSpawnFound);
        return true;
    else 
         -- Try again or go to firaxis placement
        print("Unable to find a valid tile for this civ on this map")
        return false;
    end
end


-- Main method to get valid spawns tiles depending on civ bias 
function HexMap:GetValidSpawnsInList(civ, listHex)
    local validTiles = {}
    for _, hex in pairs(listHex) do
        if hex.IsMajorSpawnable then --pre calculation of technical spawns
            -- TundraScore and DesertScore are the percent of tundra/desert tile in 6 rings around the tile
            if hex.TundraScore < 16 and civ.IsTundraBias == false then
                if civ.IsCoastalBias then
                    -- Fresh water is favored on score calculations
                    if hex.IsCoastal and hex:IsTundraLand() == false then
                        table.insert(validTiles, hex);
                    end
                else -- default take all water tiles
                    if (hex.IsFreshWater or hex.IsCoastal) and hex:IsTundraLand() == false then
                        table.insert(validTiles, hex);
                    end
                end
            elseif civ.IsTundraBias and hex:IsTundraLand() and hex.IsFreshWater then
                table.insert(validTiles, hex);
            elseif civ.IsDesertBias and hex:IsDesertLand() and hex.IsFreshWater then
                table.insert(validTiles, hex); 
            end
        end
    end
    return validTiles;
end

-- For each hex in cluster, calculate the bias score and take score mean
function Centroid:ComputeBiasScoreCiv(civ)
    if civ.CivilizationLeader == BBS_LEADER_TYPE_SPECTATOR or civ.IsOceanBias then
        return;
    end
    local centScore = 0
    local nbBias = 0;
    for _, bias in pairs(civ.CivilizationBiases) do
        local scoredBias = 0
        for _, hex in pairs(self.HexCluster) do
            local score = hex:ComputeHexScoreByBias(bias)
            scoredBias = scoredBias + score
            centScore = centScore + score
        end
        if scoredBias > 0 then
            nbBias = nbBias + 1
        end
    end
    if nbBias == 0 then
        centScore = centScore / #self.HexCluster
    else
        centScore = centScore / (#self.HexCluster * nbBias)
    end
    -- print("Centroid score = "..tostring(centScore).." for civ "..civ.CivilizationLeader)
    return centScore;
end


-- Calculate the hex score for a civ, taking account for the bias score + extra parameters like fresh water/yield etc (to determine) 
-- TODO Define scores
function Hex:ComputeHexScoreCiv(civ)
    local score = 100

    -- Favor fresh water in almost every case 
    if civ.IsNoFreshWaterBias or self.IsFreshWater or (self.IsCoastal and civ.IsCoastalBias) then
        score = score + 20;
    end

    local baseScore = tostring(score);
    local biasScore = 0
    for _, bias in pairs(civ.CivilizationBiases) do
        biasScore = biasScore + self:ComputeHexScoreByBias(bias)
        score = score + self:ComputeHexScoreByBias(bias);
    end

    local peninsulaScore = 0;
    -- Favor more open land for no bias and coastal civ
    if civ.IsNoBias or civ.IsCoastalBias or civ.IsKingNorthBias then
        -- Rounding the score
        peninsulaScore = math.floor((self.PeninsuleScore / 10) + 0.5)
        -- Cap peninsula score avoid every on inland spawn 
        if civ.IsCoastalBias then
            score = score + math.min(5, peninsulaScore)
        else
            score = score + peninsulaScore
        end
       
    end
    

    -- Avoid unwanted tiles (score = percentage of tundraa tile in ring 6, with a little threshold, valid tile threshold is 16 atm)
    -- Desert not calculated because future terraforming
    local tundraScore = (100 - self.TundraScore / 2) / 100
    if civ.IsTundraBias == false and self.TundraScore > 5 then
        score = score * tundraScore;
    end
    print(self:PrintXY().." - Score = "..baseScore.." + "..tostring(biasScore).." + "..tostring(peninsulaScore).." * "..tostring(tundraScore).." = "..tostring(math.floor(score)) )

    return math.floor(score);
end

-- Get the hex score for a given bias
-- Score for each tile are from the HexMap:Compute***Scores -- TODO : takes into account the tile surroundings in ring 6 for now
-- Weighted by bias tier TODO : determine the weight for each tier
-- TODO : do the custom bias calculations
function Hex:ComputeHexScoreByBias(bias) 
    local biasScore = 0;
    if bias.Value == g_TERRAIN_TYPE_COAST and self.IsCoastal then
        -- Not taking into account the number of coastal tiles in the centroid for now 
        return biasScore;
    elseif (bias.Type == "TERRAINS" and bias.Value ~= g_TERRAIN_TYPE_COAST) then
        if self.TerrainsScore[bias.Value] ~= nil  then
            biasScore = self.TerrainsScore[bias.Value] * GetBiasFactor(bias)
        end
    elseif (bias.Type == "FEATURES") then
        if self.FeaturesScore[bias.Value] ~= nil  then
            biasScore = self.FeaturesScore[bias.Value] * GetBiasFactor(bias)
        end
    elseif (bias.Type == "RIVERS") then
        if self.IsOnRiver  then
            -- TODO Better calc
            biasScore = self.RiverScore * GetBiasFactor(bias);
        end
    elseif (bias.Type == "RESOURCES") then
        if self.ResourcesScore[bias.Value] ~= nil  then
            biasScore = self.ResourcesScore[bias.Value] * GetBiasFactor(bias)
        end
    -- Negative Biases are optionnal and act as repellents 	
    elseif (bias.Type == "NEGATIVE_TERRAINS") then
        if self.TerrainsScore[bias.Value] ~= nil  then
            biasScore = - self.TerrainsScore[bias.Value] * GetBiasFactor(bias)
        end
    elseif (bias.Type == "NEGATIVE_FEATURES") then
        if self.FeaturesScore[bias.Value] ~= nil  then
            biasScore = - self.FeaturesScore[bias.Value] * GetBiasFactor(bias)
        end
    elseif (bias.Type == "NEGATIVE_RESOURCES") then
        if self.ResourcesScore[bias.Value] ~= nil  then
            biasScore = - self.ResourcesScore[bias.Value] * GetBiasFactor(bias)
        end
    -- Custom Biases 				
    elseif (bias.Type == "CUSTOM_NO_FRESH_WATER") then
        --print("Calculate custom no fresh score "..tostring(bias.Value))
    elseif (bias.Type == "CUSTOM_CONTINENT_SPLIT") then
        --print("CUSTOM_CONTINENT_SPLIT")
    elseif (bias.Type == "CUSTOM_NO_LUXURY_LIMIT") then
        --print("Calculate no lux limit score "..tostring(bias.Value))
    elseif (bias.Type == "CUSTOM_MOUNTAIN_LOVER") then
        --print("Calculate mountain lover inca score "..tostring(bias.Value))
    elseif (bias.Type == "CUSTOM_KING_OF_THE_NORTH") then	
        --print("Calculate king of the north norvegian score "..tostring(bias.Value))
    elseif (bias.Type == "CUSTOM_I_AM_SALTY")  then	
        --print("Calculate salty astralian score "..tostring(bias.Value))
    elseif (bias.Type == "CUSTOM_HYDROPHOBIC") then	
        --print("Calculate hydrophobic maya score "..tostring(bias.Value))
    end
    return biasScore;
end




function CivilizationAssignSpawn:GetHighestHexScore(hexList)
    local scoring = {}
    
    for _, h in pairs(hexList) do
        local score = h:ComputeHexScoreCiv(self)

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
            print("GetHighestHexScore - Highest score found = "..tostring(s.Score).." "..s.Hex:PrintXY())
            table.insert(highestScoresTable, s)
        end
    end
    -- If multiples tiles with same score, take any 
    if #highestScoresTable > 1 then
        highestScoresTable = GetShuffledCopyOfTable(highestScoresTable);
    end

    return highestScoresTable[1].Hex, highestScoresTable[1].Score; 
end

-- Find the highest score tile in the validTiles table
-- Firaxis method SetStartingPlot called in BBS_AssignStartingPlots
function CivilizationAssignSpawn:AssignMajorCivSpawn(BBS_HexMap, bestStartingHex)
    -- Maori start is not in a centroid
    if bestStartingHex.Centroid ~= nil then
        self.AttributedCentroid = bestStartingHex.Centroid
        self.AttributedCentroid.PlacedCiv = true
    end
    self.StartingHex = bestStartingHex;
    bestStartingHex.IsCivStartingPlot = true;
    bestStartingHex.IsMajorSpawnable = false;
    bestStartingHex.IsMinorSpawnable = false;
    local list, mappedHex = BBS_HexMap:GetAllHexInRing(bestStartingHex, BBS_HexMap.minimumDistanceMajortoMajorCivs)
    for i, ringHexes in pairs(mappedHex) do
        for _, h in pairs(ringHexes) do
            h.IsMajorSpawnable = false;
            -- distance to cs usually shorter 
            if i <= BBS_HexMap.minimumDistanceMinorToMajorCivs then
                h.IsMinorSpawnable = false;
            end
        end
        
    end
    print("Assigned spawn "..bestStartingHex:PrintXY().." for civ "..tostring(self.CivilizationLeader))
    return;
end

-- To call after placing majors civs
function CivilizationAssignSpawn:AssignMinorCivSpawn(BBS_HexMap, bestStartingHex)
    self.StartingHex = bestStartingHex
    bestStartingHex.IsCivStartingPlot = true;
    bestStartingHex.IsMinorSpawnable = false;
    table.insert(BBS_HexMap.minorSpawns, bestStartingHex);
    local list, _ = BBS_HexMap:GetAllHexInRing(bestStartingHex, BBS_HexMap.minimumDistanceMinorToMinorCivs)
    for i, hex in pairs(list) do
        hex.IsMinorSpawnable = false;
    end
end



-- TODO refacto 
-- return a adjustment in hex score and a boolean for bias respect on hex
function CivilizationAssignSpawn:IsBiasRespected(hex, hexMap)
    -- Biases should be already sorted by tier
        -- TODO : Make custom variable per category for better management (isMineResourceBias etc)
    if #self.CivilizationBiases == 0 then
        return true;
    end
    if self.IsFloodplainsBias and hex:IsFloodplains() == false then
        return false;
    end
     -- Custom bias treated by valid tiles
    local isOneOfBiasRespected = false;
    for _, bias in pairs(self.CivilizationBiases) do
        if bias.Type == "TERRAINS" and IsTundraLand(bias.Value) and hex:IsTundraLand() == false then
            return false;
        elseif bias.Type == "TERRAINS" and IsDesertLand(bias.Value) and hex:IsDesertLand() == false then
            return false;
        elseif bias.Type == "RIVERS" and hex.IsOnRiver then
            isOneOfBiasRespected = true;
        elseif bias.Type == "TERRAINS" and bias.Value == g_TERRAIN_TYPE_COAST and hex.IsCoastal then
            isOneOfBiasRespected = true;
        end
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
                    end
                elseif (bias.Type == "TERRAINS" and bias.Value ~= g_TERRAIN_TYPE_COAST) or bias.Type == "CUSTOM_MOUNTAIN_LOVER" then
                    if IsMountain(bias.Value) then
                        if i > 1 and i < 4 and hring:IsMountain() then
                            isOneOfBiasRespected = true;
                        end
                    elseif i < 4 and hring.TerrainType == bias.Value then
                        -- Plains and grassland checked by density, tundra and desert bias in valid tile checks
                        isOneOfBiasRespected = true;
                    end            
                elseif bias.Type == "CUSTOM_CONTINENT_SPLIT" and hexMap:HasContinentInWalkableRange(hex, 5) == false then
                    return false;
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
                elseif bias.Type == "CUSTOM_KING_OF_THE_NORTH" then
                    if hex.y < hexMap.height * 0.3 or hex.y > hexMap.height * 0.7 then
                        isOneOfBiasRespected = true;
                    end
                elseif bias.Type == "CUSTOM_HYDROPHOBIC" then 
                    if hex.PeninsuleScore > 45 and hex:DistanceToClosest(hexMap, hexMap.mapCostal) > 3 then
                        isOneOfBiasRespected = true;
                    end
                end
            end
        end
    end
    return isOneOfBiasRespected;
end



-- TODO : determine weight
function GetBiasFactor(bias)
    if bias.Tier == 1 then
        return 3;
    elseif bias.Tier == 2 then
        return 2;
    elseif bias.Tier == 3 then
        return 1.5;
    elseif bias.Tier == 4 then
        return 1.25;
    elseif bias.Tier == 5 then
        return 1.1;
    end
end

-- Order the regions based on bias score and number of valid spawn tiles
function CivilizationAssignSpawn:GetCentroidsOrderedByScore(BBS_HexMap)
     -- Mean score for each hex in centroid cluster by bias
    local allCentScore = {};
    for i, centroid in pairs(BBS_HexMap.centroidsArray) do
        local centScore = centroid:ComputeBiasScoreCiv(self);
        local meanPeninsulaScore = 0;
        local validTiles = BBS_HexMap:GetValidSpawnsInList(self, centroid.HexCluster);
        local validBiasTiles = {}
        if #validTiles > 0 then
            for _, hex in pairs(validTiles) do
                if self:IsBiasRespected(hex, BBS_HexMap) then
                    table.insert(validBiasTiles, hex);
                    --print("GetCentroidsOrderedByScore valid bias centroid "..tostring(centroid.id).." "..hex:PrintXY().." Score = "..tostring(hex:ComputeHexScoreCiv(self)))
                    meanPeninsulaScore = meanPeninsulaScore + hex.PeninsuleScore;
                end
            end
            meanPeninsulaScore = meanPeninsulaScore / #validBiasTiles;
        end
        table.insert(allCentScore, { Centroid = centroid, Score = centScore, ValidTiles = validTiles, ValidTilesBias = validBiasTiles, MeanPeninsulaScore = meanPeninsulaScore, TundraScoring = centroid.TundraScore });
    end
     -- Go through each centroid, from highest to lower centroid score for the civ
    table.sort(allCentScore, 
    function(a, b) 
        if a.Score == 0 and b.Score == 0 then
            return #a.ValidTilesBias > #b.ValidTilesBias
        else
            return a.Score > b.Score
        end
    end)
    -- TODO prendre en compte valid tiles sans bias si besoin ?
    print("Civilization : "..self.CivilizationLeader)
    for _, c in pairs(allCentScore) do
        print("AssignSpawnByCentroid - Score for centroid "..tostring(c.Centroid.id).." = "..tostring(c.Score).." Valid = "..tostring(#c.ValidTiles).." ValidBias = "..tostring(#c.ValidTilesBias).." TundraScoring = "..tostring(c.TundraScoring).." PeninsulaScore = "..tostring(c.MeanPeninsulaScore));
    end 
    return allCentScore;
end

-- Find the best centroid for the civ from the top 3 data analysis
function CivilizationAssignSpawn:FindHighestScoreHex(allCentScore)
    local top3Centroids =  {};
    local i = 0;
    local totalSpawnableBias = 0;
    local useEveryValidTiles = false;
    -- Get 3 best regions (already sorted by score or valid tiles)
    for _, c in pairs(allCentScore) do
        if #c.ValidTilesBias > 0 then
            table.insert(top3Centroids, c)
            i = i + 1
            totalSpawnableBias = totalSpawnableBias + #c.ValidTilesBias
            print("Centroid number "..tostring(i).." ID = "..tostring(c.Centroid.id))
            if i == 10 then
                break;
            end
        end
    end
    -- TODO TRY : if not enough valid bias tile but lots of valid spawn : use these
    if totalSpawnableBias < 3 then
        print("Not enough vald tiles for bias, use default valid spawns")
        useEveryValidTiles = true;
        top3Centroids =  {};
        i = 0
        for _, c in pairs(allCentScore) do
            if #c.ValidTiles > 0 then
                table.insert(top3Centroids, c)
                i = i + 1
                if i == 3 then
                    break;
                end
            end
        end
    end
    if #top3Centroids == 0 then
        --  No centroid found => not even a valid tile in the map = impossible to place civ
        return nil;
    end
    -- Compare regions by size of valids tiles and best score tile in region 
    local validTilesInTop3 = {}
    for _, c in pairs(top3Centroids) do
        if useEveryValidTiles then 
            for _, h in pairs(c.ValidTiles) do
                table.insert(validTilesInTop3, h);
            end
        else
            for _, h in pairs(c.ValidTilesBias) do
                table.insert(validTilesInTop3, h);
            end
        end    
    end
    --print("FindHighestScoreHex : "..tostring(#validTilesInTop3).." valid tiles in top 3")
    -- Take random tile among the highest scores 
    local selectedHex = self:GetHighestHexScore(validTilesInTop3)

    return selectedHex;
end
