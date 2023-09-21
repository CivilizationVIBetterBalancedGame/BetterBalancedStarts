---------------------------------------
-- Firaxis constants maps scripts
---------------------------------------
MAP_HIGHLANDS = "Highlands_XP2.lua"
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

-- Fill the data for selected hex through firaxis datas
function Hex:FillHexDatas()
    local plot = Map.GetPlot(self:GetX(), self:GetY()); 
    if plot ~= nil then
        self.ResourceType = plot:GetResourceType();
        self.HexResource = HexResource.new(self.ResourceType)
        self.FeatureType = plot:GetFeatureType();
        self.TerrainType = plot:GetTerrainType();
        self.IsNaturalWonder = plot:IsNaturalWonder();
        self.IsFreshWater = plot:IsFreshWater();
        self.IsCoastal = plot:IsCoastalLand();
        self.IslandId = plot:GetArea();
        self.IslandSize = plot:GetArea():GetPlotCount();
        self.IdContinent = plot:GetContinentType(); 
        self.IsOnSplit = Map.FindSecondContinent(plot, 1);
        self.IsSpawnable = not self:IsWater();
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
    return self.TerrainType == g_TERRAIN_TYPE_DESERT_MOUNTAIN 
        or self.TerrainType == g_TERRAIN_TYPE_DESERT_MOUNTAIN 
        or self.TerrainType == g_TERRAIN_TYPE_GRASS_MOUNTAIN 
        or self.TerrainType == g_TERRAIN_TYPE_PLAINS_MOUNTAIN 
        or self.TerrainType == g_TERRAIN_TYPE_SNOW_MOUNTAIN 
        or self.TerrainType == g_TERRAIN_TYPE_TUNDRA_MOUNTAIN;
 end

function Hex:SetCentroid(c)
    self.Centroid = c
end

function Hex:IsWater()
    return self.TerrainType == g_TERRAIN_TYPE_OCEAN 
        or self.TerrainType == g_TERRAIN_TYPE_COAST;
end

function Hex:IsHill()
    return self.TerrainType == g_TERRAIN_TYPE_DESERT_HILLS 
        or self.TerrainType == g_TERRAIN_TYPE_GRASS_HILLS 
        or self.TerrainType == g_TERRAIN_TYPE_SNOW_HILLS 
        or self.TerrainType == g_TERRAIN_TYPE_TUNDRA_HILLS 
        or self.TerrainType == g_TERRAIN_TYPE_PLAINS_HILLS;
end

-- List of method to get type of terrain (mountains excluded)
function Hex:IsPlainLand()
    return self.TerrainType == g_TERRAIN_TYPE_PLAINS_HILLS
        or self.TerrainType == g_TERRAIN_TYPE_PLAINS
        or self.TerrainType == g_TERRAIN_TYPE_PLAINS_MOUNTAIN
end

function Hex:IsGrassLand()
    return self.TerrainType == g_TERRAIN_TYPE_GRASS_HILLS
        or self.TerrainType == g_TERRAIN_TYPE_GRASS
        or self.TerrainType == g_TERRAIN_TYPE_GRASS_MOUNTAIN
end

function Hex:IsDesertLand()
    return self.TerrainType == g_TERRAIN_TYPE_DESERT_HILLS
        or self.TerrainType == g_TERRAIN_TYPE_DESERT
        or self.TerrainType == g_TERRAIN_TYPE_DESERT_MOUNTAIN
end

function Hex:IsTundraLand()
    return self.TerrainType == g_TERRAIN_TYPE_TUNDRA_HILLS
        or self.TerrainType == g_TERRAIN_TYPE_TUNDRA
        or self.TerrainType == g_TERRAIN_TYPE_TUNDRA_MOUNTAIN
end

function Hex:IsSnowLand()
    return self.TerrainType == g_TERRAIN_TYPE_SNOW_HILLS
        or self.TerrainType == g_TERRAIN_TYPE_SNOW
        or self.TerrainType == g_TERRAIN_TYPE_SNOW_MOUNTAIN
end

function Hex:IsImpassable() 
    return self:IsWater() or self:IsMountain();
end

function Hex:HasLux()
    return self.HexResource.isLux;
end

-- Test if a different continent is present in the range (ring in parameter). Return boolean
function Hex:HasContinentInRange(range) 
    local plot = Map.GetPlot(self.x, self.y); 
    return Map.FindSecondContinent(pPlot, range);
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
    instance:CanCircumnavigate(mapScript);
    instance.map = {};
    instance.mapFreshWater = {};
    instance.mapCostal = {};
    instance.mapResources = {};
    instance.mapFeatures = {};
    instance.mapTerrains = {};
    instance.mapWater = {};
    instance.mapContinents = {};
    instance.mapOnSplit = {}
    instance.mapWonders = {};
    instance.map22 = {}
    instance.centroidsArray = {};
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

    -- Put maps parameters here ? (world age, temperature, rainfall etc)
    return instance;
end

function HexMap:CanCircumnavigate()
    self.canCircumnavigate = self.mapScript ~= MAP_INLAND_SEA and self.mapScript ~= MAP_TILTED_AXIS;
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
        end
    end
    self:UpdateYieldMap();
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
-- Remove from the map the hex with current resource 
-- Amber can be mine ressource (on land) and fishing (on water) - have to deal with that during mapping
function HexMap:RemoveMapResources(x, y)
    local hex = self:GetHexInMap(x, y)
    if hex ~= nil and hex.ResourceType ~= g_RESOURCE_NONE then
        -- Remove previous resource from map
        table.remove(self.mapResources[hex.ResourceType], hex)
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

function HexMap:InsertMapFeatures(x, y)   
    local hex = self:GetHexInMap(x, y)
    if hex ~= nil and hex.FeatureType ~= g_FEATURE_NONE then
        self.mapFeatures[hex.FeatureType] = self.mapFeatures[hex.FeatureType] or {};
        table.insert(self.mapFeatures[hex.FeatureType], hex)
    end
end

function HexMap:InsertMapTerrains(x, y)   
    local hex = self:GetHexInMap(x, y)
    if hex ~= nil and hex.TerrainType ~= g_TERRAIN_TYPE_NONE then
        self.mapTerrains[hex.TerrainType] = self.mapTerrains[hex.TerrainType] or {};
        table.insert(self.mapTerrains[hex.TerrainType], hex)
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
    local hexWest = self:GetHexSum(hexCenter, self:GetHexScale(self:GetAdjDirection(DirectionTypes.DIRECTION_WEST), ringRadius));
    local testHex = hexWest;
    for i=0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
        for r = 0, ringRadius - 1 do
            -- Check if the tested hex is in map coord range
            local hexToAdd = self:GetHexInMap(testHex.x, testHex.y)
            -- if yes we add it to the table
            if hexToAdd ~= nil then
                table.insert(hexList, self:GetHexInMap(hexToAdd.x, hexToAdd.y));
                -- print("GetHexInRing - "..tostring(ringRadius).." ("..tostring(hexToAdd.x)..", "..tostring(hexToAdd.y)..")")            
            end
            -- in every cases we move to the next tile 
            local hexDir = self:GetAdjDirection(i);
            testHex = self:GetHexSum(testHex, hexDir)
        end
    end
    return hexList;
end

-- Loop through all rings up to ring radius in parameter
function HexMap:GetAllHexInRing(hexCenter, ringRadius)
    local hexList = {};
    for i=0, ringRadius do
        local hexInRingX = self:GetHexInRing(hexCenter, i);
        for _, hex in ipairs(hexInRingX) do
            table.insert(hexList, hex);
        end
    end
    return hexList;
end

-- Transform DirectionTypes index to Hex vector
function HexMap:GetAdjDirection(directionIndex)
    if directionIndex == DirectionTypes.DIRECTION_NORTHEAST then
         return Hex.new(0, 1);
    elseif directionIndex == DirectionTypes.DIRECTION_EAST then
        return Hex.new(1, 0);
    elseif directionIndex == DirectionTypes.DIRECTION_SOUTHEAST then
        return Hex.new(1, -1);
    elseif directionIndex == DirectionTypes.DIRECTION_SOUTHWEST then
        return Hex.new(-1, -1);
    elseif directionIndex == DirectionTypes.DIRECTION_WEST then
        return Hex.new(-1, 0);
    elseif directionIndex == DirectionTypes.DIRECTION_NORTHWEST then
        return Hex.new(-1, 1);
    end
end

function HexMap:ContinentsInRange(hex, range)
    local hexes = self:GetAllHexInRing(hex, range)
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
        table.remove(self.mapTerrains[hex.TerrainType], hex);
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
        self:RemoveMapResources(x, y);
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
function HexMap:TerraformSetFeature(hex,featureId)
    local plot = Map.GetPlot(hex.x, hex.y);
    if plot ~= nil and TerrainBuilder.CanHaveFeature(plot, featureId) then
        if hex.FeatureType ~= g_FEATURE_NONE then
            table.remove(self.mapFeatures[hex.FeatureType], hex)
        end
        TerrainBuilder.SetFeatureType(plot, featureId);
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
                logX = logX.."0"..tostring(hex.CostalScore).." ";
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
    if self.isCentroid == true then
        printed = "["..printed.."]"
    end
    return printed
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
    local _, points = self:GetLandHexList()
    local nbLandTiles = 0
    for _, p in pairs(points) do
        nbLandTiles = nbLandTiles + 1
    end
    print("k-means - nbLandTiles = "..tostring(nbLandTiles))
	local centroids = {}
    for i = 1, n do
        local randomHex = self:getRandomHex();
        local randomHexIsNotLand = true
        -- init random centroids anywhere on land to avoid isolated centroids on water
        while (randomHexIsNotLand) do
            if randomHex:IsWater() == false then
                randomHexIsNotLand = false
            else
                randomHex = self:getRandomHex();
                for _, c in pairs(centroids) do
                    if c.x == randomHex.x and c.y == randomHex.y then
                        randomHexIsNotLand = false
                    end
                end
            end
        end 
        local newCentroid = Centroid.new(randomHex.x, randomHex.y, i)
        print("Init random at centroid ("..tostring(newCentroid.x)..", "..tostring(newCentroid.y)..")")
        table.insert(centroids, randomHex)
    end
    self.centroidsArray = centroids
    -- Run interations
	for i = 1, iters do
        print("RunKmeans - Iteration "..tostring(i))
		self:UpdateCentroids(points)
	end
    self:CentroidGroupby(points)
    self:UpdateCentroidsSortedIndex()
    print("End k-means ", os.date("%c"))
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
        c.HexCluster = g[c]
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