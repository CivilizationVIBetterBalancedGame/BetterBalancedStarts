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


function _Debug(str)
    print(str)
end

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
        self.ResourceType = plot:GetResourceType() or g_RESOURCE_NONE;
        self.HexResource = HexResource.new(self.ResourceType)
        self.FeatureType = plot:GetFeatureType() or g_FEATURE_NONE;
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
        self.IsCloseToTundra = false;
        self.IsCloseToDesert = false;
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
    -- Strategics not taken into account for yield when spawning
    if self.ResourceType == g_RESOURCE_HORSES or self.ResourceType == g_RESOURCE_NITER then
        self.Food = self.Food - 1;
        self.Prod = self.Prod - 1;
    elseif self.ResourceType == g_RESOURCE_COAL or self.ResourceType == g_RESOURCE_URANIUM then
        self.Prod = self.Prod - 2;
    elseif self.ResourceType == g_RESOURCE_OIL then
        self.Prod = self.Prod - 3;
    elseif self.ResourceType == g_RESOURCE_IRON or self.ResourceType == g_RESOURCE_ALUMINUM then
        self.Science = self.Science - 1;
    end
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

function Hex:IsCoast() 
    return self:IsWater() and self.Plot:IsLake() == false;
end

function Hex:GetAdjacentLandTiles() 
    local adjHex = {}
    for _, h in pairs(self.AllRing6Map[1]) do
        if h:IsWater() == false then 
            table.insert(adjHex, h);
        end
    end
    return adjHex;    
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

function Hex:IsCloseToCoast()
    for i, ring in pairs(self.AllRing6Map) do
        if i > 3 then
            for _, h in pairs(ring) do
                if h.IsCoastal then
                    return true;
                end
            end
            
        end
    end
    return false;
end

-- Test if a different continent is present in the range (ring in parameter). Return boolean
function Hex:HasContinentInRange(range) 
    -- TODO : Maybe check if we can walk to that second continent in given range?
    return Map.FindSecondContinent(self.Plot, range);
end

function Hex:IsNextToCoastalFreshWater()
    for _, h in pairs(self.AllRing6Map[1]) do
        if h.IsCoastal and h.IsOnRiver then
            return true;
        end
    end
    return false;
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

function Centroid:new(pX, pY, pId)
    local instance = {}
    setmetatable(instance, self);
    self.__index = self
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
    instance.mapResourcesLux = instance:GetMapResourcesLux();
    instance.mapResourcesBonus = instance:GetMapResourcesBonus();
    instance.mapResourcesStrategics = instance:GetMapResourcesStrategics();
    instance.mapResourcesFarms =instance:GetMapResourcesFarms();
    instance.mapResourcesPastures = instance:GetMapResourcesPastures();
    instance.mapResourcesPlantations = instance:GetMapResourcesPlantations();
    instance.mapResourcesMines = instance:GetMapResourcesMines();
    instance.mapResourcesQuarries = instance:GetMapResourcesQuarries();
    instance.mapResourcesFishings = instance:GetMapResourcesFishings();
    instance.PeninsulaScoreThreshold = 35;
    instance:FillHexMapDatas();
    instance:StoreHexRings();
    instance:ComputeScoreHex();
    instance.ValidSpawnHexes = {};
    instance.tempMajorSpawns = {};
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
            self:InsertMapResources(newHex);
            self:InsertMapFeatures(newHex);
            self:InsertMapTerrains(newHex);
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
            -- Fill as needed 
        end
    end
    print("Start SetAllWalkableHexInRange",  os.date("%c"))
    for y = 0, self.height - 1 do
        for x = 0, self.width - 1 do
            local hex = self:GetHexInMap(x, y);
            
            hex:SetAllWalkableHexInRange(6);
            
        end
    end
    print("End SetAllWalkableHexInRange",  os.date("%c"))
   
end

function HexMap:CanHaveJungle(hex) 
    -- Rainforest on Earth mostly in Tropics, so keep in narrow band around Equator
    local equator = math.ceil(self.height / 2);
    local jungleBottom = equator - (20 * self.height / 180);
    local jungleTop = equator + (20 * self.height / 180);
    if (self.mapScript == MAP_TILTED_AXIS) then
        local centerX = math.ceil(self.height / 2);
        local centerY = math.ceil(self.width / 2);
        local distanceToCenter = Map.GetPlotDistance(hex:GetX(), hex:GetY(), centerX, centerY);
        jungleBottom = equator - (20 * self.height / 180);
        jungleTop = equator + (20 * self.height / 180);
        if(distanceToCenter >= jungleBottom and distanceToCenter <= jungleTop) then
            return true;
        else
            return false;
        end
    end
    if(hex:GetY() >= jungleBottom  and hex:GetY() <= jungleTop) then 
        return true;
    end
    return false;
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
    hex.PeninsulaScore = 0
    if hex:IsImpassable() == false and hex:IsHexNextTo4ImpassableTiles() == false and hex:IsSnowLand() == false then
        local visitedRing = {}
        local visitedHex = {}
        local totalVisited = 0
        visitedRing[0] = {}
        table.insert(visitedRing[0], hex)
        for n = 1, 6 do
            visitedRing[n] = {}
            local n1 = n - 1
            for i, h in pairs(visitedRing[n1]) do
                for _, neighbor in pairs(h.AllRing6Map[1]) do
                    if neighbor:IsImpassable() == false and visitedHex[neighbor] == nil then
                        visitedHex[neighbor] = true;
                        table.insert(visitedRing[n], neighbor)
                        totalVisited = totalVisited + 1
                    end
                end 
            end 
        end            
        hex.PeninsulaScore = math.floor((totalVisited / #hex.AllRing6) * 100 )
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

    --for ress, _ in pairs(hex.ResourcesScore) do
    --    hex.ResourcesScore[ress] = hex.ResourcesScore[ress] / #hex.AllRing6  * 100;
    --end

end

function HexMap:ComputeFeaturesScore(hex)
    hex.FeaturesScore = {}
    for i, ring in pairs(hex.AllRing6Map) do
        for _, h in pairs(ring) do
            local feature = h.FeatureType
            if feature ~= g_FEATURE_NONE then
                local score = hex.FeaturesScore[feature] or 0 --init
                score = score + 1
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

    --for feat, _ in pairs(hex.FeaturesScore) do
    --   hex.FeaturesScore[feat] = hex.FeaturesScore[feat] / #hex.AllRing6  * 100;
    --end

end

function HexMap:ComputeTerrainsScore(hex)
    hex.TerrainsScore = {}
    for i, ring in pairs(hex.AllRing6Map) do
        for _, h in pairs(ring) do
            local terrain = h.TerrainType
            if terrain ~= g_TERRAIN_TYPE_NONE then
                local score = hex.TerrainsScore[terrain] or 0 --init
                score = score + 1
                hex.TerrainsScore[terrain] = score
            end
            -- Compute coastal tiles score
            local isCoastal = h.IsCoastal
            if isCoastal == true then
                local score = hex.TerrainsScore[g_TERRAIN_TYPE_COAST] or 0 --init
                score = score + 1
                hex.TerrainsScore[g_TERRAIN_TYPE_COAST] = score
            end
            if h:IsTundraLand() and i < 3 then
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

   -- for terr, _ in pairs(hex.TerrainsScore) do
    --    hex.TerrainsScore[terr] = hex.TerrainsScore[terr] / #hex.AllRing6 * 100;
    --end

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
    local isCloseToTooManyFlood = hex:IsHexNextTo5FloodTiles();
    local isNextToVolcano = hex:IsHexNextToVolcano();
    local coastalNextToRiver = hex.IsCoastal and hex.IsFreshWater == false and hex:IsNextToCoastalFreshWater();
    for i, r in pairs(hex.AllRing6Map) do
        for _, h in pairs(r) do
            -- Limit to 5 tiles like now
            if h.IsNaturalWonder or hex.IsNaturalWonder and i < 5 then
                isTooCloseToNaturalWonder = true;
                break;
            end
        end
    end
    local isNotInPeninsula = hex.PeninsulaScore >= self.PeninsulaScoreThreshold
    hex.IsMajorSpawnable = hex:IsWater() == false 
        and hex:IsSnowLand() == false 
        and isCloseToMapBorderX == false 
        and isCloseToMapBorderY == false 
        and isNotInPeninsula == true
        and isCloseToTooManyFlood == false
        and isNextToVolcano == false
        and isTooCloseToNaturalWonder == false
        and coastalNextToRiver == false;
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
   if dist < 4 then
        return 1.5;
    else 
        return 1;
    end
end

function Hex:IsHexNextTo4ImpassableTiles()
    local ring1 = self.AllRing6Map[1];
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

function Hex:IsHexNextToVolcano()
    local ring1 = self.AllRing6Map[1];
    for _, r1 in pairs(ring1) do
        if r1.FeatureType == g_FEATURE_VOLCANO then
            return true;
        end
    end
    return false;
end

-- Avoid spawns on too many floodplains ring 1 and coastal on spawning
function Hex:IsHexNextTo5FloodTiles()
    local ring1 = self.AllRing6Map[1];
    local floodplainsR1 = 0
    for _, r1 in pairs(ring1) do
        if r1:IsFloodplains() or r1:IsWater() then
            floodplainsR1 = floodplainsR1 + 1
        end
        if floodplainsR1 > 4 then
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

function HexMap:InsertMapResources(hex)   
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
function HexMap:RemoveMapResources(hex)
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


function HexMap:InsertMapFeatures(hex)   
    if hex ~= nil and hex.FeatureType ~= g_FEATURE_NONE then
        self.mapFeatures[hex.FeatureType] = self.mapFeatures[hex.FeatureType] or {};
        table.insert(self.mapFeatures[hex.FeatureType], hex)
    end
end

function HexMap:RemoveMapFeatures(hex)   
    if hex ~= nil and hex.FeatureType ~= g_FEATURE_NONE then
        for i , h in ipairs(self.mapFeatures[hex.FeatureType]) do
            if h == hex then
                table.remove(self.mapFeatures[hex.FeatureType], i)
                break;
            end
        end
    end
end

function HexMap:InsertMapTerrains(hex)   
    if hex ~= nil and hex.TerrainType ~= g_TERRAIN_TYPE_NONE then
        self.mapTerrains[hex.TerrainType] = self.mapTerrains[hex.TerrainType] or {};
        table.insert(self.mapTerrains[hex.TerrainType], hex)
    end
end

function HexMap:RemoveMapTerrains(hex)   
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

-- Return the list of hex in each ring that are accessible by walking, range is step, if no obstacle, range = ring
function Hex:SetAllWalkableHexInRange(range)
    if self:IsImpassable() then
        return;
    end
    local visitedRing = {};
    local visitedHex = {};
    visitedRing[0] = {};
    table.insert(visitedRing[0], self);
    for n = 1, range do
        visitedRing[n] = {};
        local n1 = n - 1;
        for i, h in pairs(visitedRing[n1]) do
            for _, neighbor in pairs(h.AllRing6Map[1]) do
                if neighbor:IsImpassable() == false and visitedHex[neighbor] == nil then
                    visitedHex[neighbor] = true;
                    table.insert(visitedRing[n], neighbor);
                end
            end 
        end 
    end
    self.WalkableHexInRing = visitedRing;
end

function Hex:IsWalkableInRange(hexTarget, range)
    if self.WalkableHexInRing == nil then
        return
    end
    for _, h in pairs(self.WalkableHexInRing[range]) do
        if h == hexTarget then
            return true;
        end
    end
    return false;
end

function Hex:HasContinentInWalkableRange(range) 
    if self.WalkableHexInRing == nil then
        return
    end
    if range > 6 then
        print("WARN - Walkable tiles limited at 6 by default")
        return false;
    end
    for _, h in pairs(self.WalkableHexInRing[range]) do
        if h.IdContinent ~= self.IdContinent then
            return true;
        end
    end
    return false;
end


---------------------------------------
-- Terraforming methods 
---------------------------------------

---------------------------------------
-- Terrains
-- Should never be none
---------------------------------------
function HexMap:TerraformSetTerrain(hex, terrainId) 
    if hex ~= nil and hex.TerrainType ~= g_TERRAIN_TYPE_NONE then
        self:RemoveMapTerrains(hex);
        TerrainBuilder.SetTerrainType(hex.Plot, terrainId);
        hex.TerrainType = terrainId
        hex:UpdateYields();
        self:InsertMapTerrains(hex);
    end
end

---------------------------------------
-- Resources
---------------------------------------
function HexMap:TerraformSetResource(hex, resourceId, forced) 
    --and ResourceBuilder.CanHaveResource(hex.Plot, resourceId)
    if hex.Plot ~= nil  then
        if resourceId == g_RESOURCE_NONE then
            ResourceBuilder.SetResourceType(hex.Plot, g_RESOURCE_NONE);
            hex.ResourceType = resourceId;
            hex.HexResource = HexResource.new(self.ResourceType);
            hex:UpdateYields()
            return true;
        end
        -- For specifics resources, we can force a good tile to meet the right conditions
        if forced then
            ResourceBuilder.SetResourceType(hex.Plot, g_RESOURCE_NONE);
            if resourceId == g_RESOURCE_HORSES then
                self:TerraformToFlat(hex, true);
            elseif resourceId == g_RESOURCE_IRON then
                self:TerraformToHill(hex, true);
            elseif resourceId == g_RESOURCE_NITER then
                self:TerraformToFlat(hex, true);
            elseif resourceId == g_RESOURCE_COAL then
                local rng = TerrainBuilder.GetRandomNumber(100, "Coal terraform");
                if rng <= 50 then
                    self:TerraformSetFeature(hex, g_FEATURE_FOREST);
                else
                    self:TerraformToHill(hex, true);
                end
            elseif resourceId == g_RESOURCE_ALUMINUM then
                if self:CanHaveJungle(hex) then
                    self:TerraformSetFeature(hex, g_FEATURE_JUNGLE);
                else 
                    self:TerraformToFlat(hex, true);
                    self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_PLAINS);
                end  
            end
        end
        if ResourceBuilder.CanHaveResource(hex.Plot, resourceId) then
            --self:RemoveMapResources(hex);
            ResourceBuilder.SetResourceType(hex.Plot, g_RESOURCE_NONE);
            ResourceBuilder.SetResourceType(hex.Plot, resourceId, 1);
            hex.ResourceType = resourceId;
            hex.HexResource = HexResource.new(self.ResourceType);
            self:InsertMapResources(hex);
            hex:UpdateYields()
            return true;
        else
            _Debug("TerraformSetResource - Can't terraform "..tostring(resourceId).." on "..hex:PrintXY())
        end
    end
    return false;
end

---------------------------------------
-- Features
---------------------------------------
function HexMap:TerraformSetFeature(hex, featureId)
    if hex.Plot ~= nil  then
        self:RemoveMapFeatures(hex)
        TerrainBuilder.SetFeatureType(hex.Plot, featureId);
        hex.FeatureType = featureId;
        hex:UpdateYields()
        self:InsertMapFeatures(hex);
        return true;
    else
        _Debug("Can't terraform feature "..tostring(featureId).." on "..hex:PrintXY())
    end 
    return false;
end

---------------------------------------
-- Hills
-- Info : not currently mapped, see if needed
---------------------------------------
function HexMap:TerraformToHill(hex, cleanTile)
    if (cleanTile) then
        self:TerraformSetFeature(hex, g_FEATURE_NONE);
        self:TerraformSetResource(hex, g_RESOURCE_NONE);
    end
    if hex.TerrainType == g_TERRAIN_TYPE_GRASS then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_GRASS_HILLS)
    elseif hex.TerrainType == g_TERRAIN_TYPE_PLAINS then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_PLAINS_HILLS)
    elseif hex.TerrainType == g_TERRAIN_TYPE_DESERT then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_DESERT_HILLS)
    elseif hex.TerrainType == g_TERRAIN_TYPE_TUNDRA then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_TUNDRA_HILLS)
    elseif hex.TerrainType == g_TERRAIN_TYPE_SNOW then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_SNOW_HILLS)
    end
    hex:UpdateYields()
end

function HexMap:TerraformMountainToHill(hex)
    self:TerraformSetFeature(hex, g_FEATURE_NONE);
    if hex.TerrainType == g_TERRAIN_TYPE_GRASS_MOUNTAIN then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_GRASS_HILLS)
    elseif hex.TerrainType == g_TERRAIN_TYPE_PLAINS_MOUNTAIN then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_PLAINS_HILLS)
    elseif hex.TerrainType == g_TERRAIN_TYPE_DESERT_MOUNTAIN then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_DESERT_HILLS)
    elseif hex.TerrainType == g_TERRAIN_TYPE_TUNDRA_MOUNTAIN then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_TUNDRA_HILLS)
    elseif hex.TerrainType == g_TERRAIN_TYPE_SNOW_MOUNTAIN then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_SNOW_HILLS)
    end
    hex:UpdateYields()
end

function HexMap:TerraformDesert(hex) 
    --50% plain/grass
    if hex.FeatureType == g_FEATURE_FLOODPLAINS then
        self:TerraformSetFeature(hex, g_FEATURE_NONE);
    end
    if hex.FeatureType == g_FEATURE_OASIS then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_COAST)
        self:TerraformSetFeature(hex, g_FEATURE_NONE);
    end
    local rng = TerrainBuilder.GetRandomNumber(100, "Desert terraform");
    if rng <= 50 then
        if hex.TerrainType == g_TERRAIN_TYPE_DESERT then
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_GRASS)
        elseif hex.TerrainType == g_TERRAIN_TYPE_DESERT_HILLS then
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_GRASS_HILLS)
        elseif hex.TerrainType == g_TERRAIN_TYPE_DESERT_MOUNTAIN then
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_GRASS_HILLS)
        end
    else
        if hex.TerrainType == g_TERRAIN_TYPE_DESERT then
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_PLAINS)
        elseif hex.TerrainType == g_TERRAIN_TYPE_DESERT_HILLS then
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_PLAINS_HILLS)
        elseif hex.TerrainType == g_TERRAIN_TYPE_DESERT_MOUNTAIN then
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_PLAINS_HILLS)
        end
    end
    
end

-- TODO Add rng
-- Possible 2/2 tiles without lux : 
-- Grass+Hill+Forest, Plain+Junle+Hills, Stone+Hills, Deer+Forest, Grass+Sheeps 
-- Extra yield (gold faith culture science) not taken in account here
function HexMap:TerraformTo4Yields(hex)
    -- Low yield strategics and lux are not changed here, floodplains untouched because placement is making sure we are not around 5 or 6 flood in ring 1
    if hex.Food + hex.Prod >= 4  
        or g_RESOURCES_STRATEGICS[hex.ResourceType] 
        or g_RESOURCES_LUX_LIST[hex.ResourceType] 
        or hex:IsWater()
        or hex:IsFloodplains() 
        or hex.FeatureType == g_FEATURE_GEOTHERMAL_FISSURE then
            print("TerraformTo4Yields - Can't upgrade naturally (excluded) - Terrain : "..tostring(hex.TerrainType).." Resource :"..tostring(hex.ResourceType).." - Feature : "..tostring(hex.FeatureType))
            return false;
    end
    -- Low yields upgrades
    if hex.TerrainType == g_TERRAIN_TYPE_GRASS and hex.FeatureType == g_FEATURE_FOREST then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_GRASS_HILLS);
    elseif hex.TerrainType == g_TERRAIN_TYPE_PLAINS and hex.FeatureType == g_FEATURE_JUNGLE and hex.ResourceType == g_RESOURCE_NONE then
        local rng = TerrainBuilder.GetRandomNumber(100, "Random");
        if rng <= 50 then
            print("Add bananas to jungle")
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_PLAINS_HILLS);
        else
            self:TerraformSetResource(hex, g_RESOURCE_BANANAS);
        end
    elseif hex.TerrainType == g_TERRAIN_TYPE_PLAINS and hex.FeatureType == g_FEATURE_FOREST and hex.ResourceType == g_RESOURCE_NONE then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_PLAINS_HILLS);
    elseif hex.ResourceType == g_RESOURCE_STONE and hex.TerrainType == g_TERRAIN_TYPE_GRASS then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_GRASS_HILLS);
    elseif hex.ResourceType == g_RESOURCE_NONE and (hex.FeatureType == g_FEATURE_NONE or hex.FeatureType == g_FEATURE_MARSH)
        and hex:IsTundraLand() == false and hex:IsDesertLand() == false then
        local rng = TerrainBuilder.GetRandomNumber(100, "Random");
        if hex.FeatureType ~= g_FEATURE_NONE then
            self:TerraformSetFeature(hex, g_FEATURE_NONE);
        end
        if rng <= 10 then
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_GRASS);
            self:TerraformSetFeature(hex, g_FEATURE_FOREST);
            self:TerraformSetResource(hex, g_RESOURCE_DEER);
            print("TerraformTo4Yields "..hex:PrintXY().." to 2/2 Deer");
        elseif rng <= 30 then
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_PLAINS_HILLS);
            self:TerraformSetResource(hex, g_RESOURCE_SHEEP);
            print("TerraformTo4Yields "..hex:PrintXY().." to 2/2 Sheep");
        elseif rng <= 50 then
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_GRASS_HILLS);
            self:TerraformSetResource(hex, g_RESOURCE_STONE);
            print("TerraformTo4Yields "..hex:PrintXY().." to 2/2 Stone");
        else
            self:TerraformTo4YieldsNoResource(hex);
        end
    -- Some bonus or lux resources that cant be changed naturally
    else
        print("TerraformTo4Yields - Can't upgrade naturally - Terrain : "..tostring(hex.TerrainType).." Resource :"..tostring(hex.ResourceType).." - Feature : "..tostring(hex.FeatureType))
        return false;
    end
    hex:UpdateYields()
    return true;
end

function HexMap:TerraformTo4YieldsNoResource(hex)
    if hex.TerrainType == g_TERRAIN_TYPE_GRASS then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_GRASS_HILLS);
        self:TerraformSetFeature(hex, g_FEATURE_FOREST);
        print("TerraformTo4Yields "..hex:PrintXY().." to 2/2 Grass Hill Forest");
    elseif hex.TerrainType == g_TERRAIN_TYPE_GRASS_HILLS then
        self:TerraformSetFeature(hex, g_FEATURE_FOREST);
        print("TerraformTo4Yields "..hex:PrintXY().." to 2/2 Grass Hill Forest");
    elseif hex.TerrainType == g_TERRAIN_TYPE_PLAINS then
        if self:CanHaveJungle(hex) then
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_PLAINS_HILLS);
            self:TerraformSetFeature(hex, g_FEATURE_JUNGLE);
            print("TerraformTo4Yields "..hex:PrintXY().." to 2/2 Plain Hill Jungle");
        else
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_GRASS_HILLS);
            self:TerraformSetFeature(hex, g_FEATURE_FOREST);
            print("TerraformTo4Yields "..hex:PrintXY().." to 2/2 Grass Hill Forest");
        end
    elseif hex.TerrainType == g_TERRAIN_TYPE_PLAINS_HILLS then
        if self:CanHaveJungle(hex) then
            self:TerraformSetFeature(hex, g_FEATURE_JUNGLE);
            print("TerraformTo4Yields "..hex:PrintXY().." to 2/2 Plain Hill Jungle");
        else
            self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_GRASS_HILLS);
            self:TerraformSetFeature(hex, g_FEATURE_FOREST);
            print("TerraformTo4Yields "..hex:PrintXY().." to 2/2 Grass Hill Forest");
        end
    end
    hex:UpdateYields()
end

function HexMap:TerraformToFlat(hex, cleanTile)
    if (cleanTile) then
        self:TerraformSetFeature(hex, g_FEATURE_NONE);
        self:TerraformSetResource(hex, g_RESOURCE_NONE);
    end
    if hex.TerrainType == g_TERRAIN_TYPE_GRASS_HILLS then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_GRASS)
    elseif hex.TerrainType == g_TERRAIN_TYPE_PLAINS_HILLS then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_PLAINS)
    elseif hex.TerrainType == g_TERRAIN_TYPE_DESERT_HILLS then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_DESERT)
    elseif hex.TerrainType == g_TERRAIN_TYPE_TUNDRA_HILLS then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_TUNDRA)
    elseif hex.TerrainType == g_TERRAIN_TYPE_SNOW_HILLS then
        self:TerraformSetTerrain(hex, g_TERRAIN_TYPE_SNOW)
    end
    hex:UpdateYields()
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

local TerraformType = {};
TerraformType[1] = "Terrain";
TerraformType[2] = "Feature";
TerraformType[3] = "Resource";
TerraformType[4] = "To4Yields";

-- Call basic terraforming method depending on type
function HexMap:TerraformHex(hex, type, id, forced)
    if type == TerraformType[1] then
        return self:TerraformSetTerrain(hex, id);
    elseif type == TerraformType[2] then
        return self:TerraformSetFeature(hex, id);
    elseif type == TerraformType[3] then
        return self:TerraformSetResource(hex, id, forced);
    elseif type == TerraformType[4] then
        return self:TerraformTo4Yields(hex);
    else 
        return false;
    end
end

function HexMap:TerraformEmpty(hex, type, id, forced) 
    if hex.ResourceType ~= g_RESOURCE_NONE or hex.FeatureType ~= g_FEATURE_NONE then
        return false;
    end
    return self:TerraformHex(hex, type, id, forced);
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
                local score = hex.PeninsulaScore
                if score == 0 then
                    score = "00"
                elseif score == 100 then
                    score = "99"
                else
                    score = tostring(hex.PeninsulaScore)
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
        -- Need to add +1 in because of table index can not be 0
        local index = TerrainBuilder.GetRandomNumber(sample_size, "pick random centroid") + 1;
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
            centroid = Centroid:new(newX, newY, i);
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

function printAllStartYields(hexMap) 
    print("PrintAllStartYields")
    local meanFoodR1 = 0;
    local meanProdR1 = 0;
    for _,start in pairs(hexMap.majorSpawns) do
        print("Start "..start:PrintXY())
        local foodR1 = 0;
        local prodR1 = 0;
        local countR1 = 0;
        local ring1 = hexMap:GetHexInRing(start, 1)
        for _, h in pairs(ring1) do
            foodR1 = foodR1 + h.Food;
            prodR1 = prodR1 + h.Prod;
        end
        print("Start "..start:PrintXY().." Food = "..tostring(foodR1).." and Prod = "..tostring(prodR1))
        meanFoodR1 = meanFoodR1 + foodR1;
        meanProdR1 = meanProdR1 + prodR1;
    end
    meanFoodR1 = meanFoodR1 / #hexMap.majorSpawns;
    meanProdR1 = meanProdR1 / #hexMap.majorSpawns;
    print("meanFoodR1 = "..tostring(meanFoodR1));
    print("meanProdR1 = "..tostring(meanProdR1));
end

function BalanceSpawns(hexMap, civ)
    local balancing = SpawnBalancing.new(civ.StartingHex, hexMap, civ);
    balancing:RemoveRing1MountainsOnRiver();
    balancing:RemoveRing1Deserts();
    --balancing:FillTablesRings();
    --balancing:ApplyMinimalLandTiles(1, 3);
    balancing:ApplyMinimalLandTiles(1, 3);
    balancing:ApplyMinimalCoastalTiles();
    balancing:ApplyGaranteedStrategics();
    return balancing;
end

---------------------------------------
-- SpawnBalancing
---------------------------------------
local CoastalScoring = {}
CoastalScoring.CRABS_R2 = 30
CoastalScoring.CRABS_R3 = 10
CoastalScoring.FISH_R2 = 70
CoastalScoring.FISH_R3 = 40
CoastalScoring.FISH_REEF_R2 = 110
CoastalScoring.FISH_REEF_R3 = 80
CoastalScoring.PEARLS_R2 = 70
CoastalScoring.PEARLS_R3 = 40
CoastalScoring.AMBER_R2 = 55
CoastalScoring.AMBER_R3 = 30
CoastalScoring.WHALES_R2 = 80
CoastalScoring.WHALES_R3 = 50
CoastalScoring.TURTLES_R2 = 120
CoastalScoring.TURTLES_R3 = 95
CoastalScoring.REEF_R2 = 20
CoastalScoring.REEF_R3 = 10
CoastalScoring.REEF_CAMPUS = 20
CoastalScoring.HARBOR_ADJ = 30
CoastalScoring.BASE_COASTAL_SCORE = 210 --210
CoastalScoring.COASTAL_MARGIN = 30 --30

SpawnBalancing = {}

function SpawnBalancing.new(hex, hexMap, civ)
    local instance = {};
    setmetatable(instance, {__index = SpawnBalancing});
    instance.Hex = hex;
    instance.HexMap = hexMap;
    instance.Civ = civ
    instance.RingTables = {};
    instance.MaxRing = 5;
    instance.CoastalScore = 0;
    instance.AimedCoastalScore = 0;
    instance:FillTablesRings();
    print("Init SpawnBalancing")
    return instance;
end

function SpawnBalancing:CanAddToCoastalScore(testScore)
    if self.AimedCoastalScore > 0 then
        if testScore > 0 then
            return self.CoastalScore + testScore < self.AimedCoastalScore + CoastalScoring.COASTAL_MARGIN
        elseif testScore < 0 then
            return self.CoastalScore + testScore > self.AimedCoastalScore - CoastalScoring.COASTAL_MARGIN;
        end
    end 
    return false;
end

function SpawnBalancing:FillTablesRings() 
    print("SpawnBalancing FillTablesRings")
    for i = 1, self.MaxRing do
        self.RingTables[i] = {};
        self.RingTables[i].HexRings = self.Hex.AllRing6Map[i];
        self.RingTables[i].WATER = {}; 
        self.RingTables[i].WATER_EMPTY = {}; 
        self.RingTables[i].WATER_RF = {}; -- water with resource or reef
        self.RingTables[i].COAST = {};
        self.RingTables[i].LAKES = {}; 
        self.RingTables[i].IMPASSABLE = {};  --mountain or water
        self.RingTables[i].EMPTY_TILES = {}; -- grasslands or plains without feature or resource
        self.RingTables[i].LOW_YIELD_TILES = {}; --yields < 2 food or < 2 prod with feature or resource 
        self.RingTables[i].STANDARD_YIELD_TILES = {}; -- 4 yields tiles
        self.RingTables[i].HIGH_YIELD_TILES = {}; -- food+prod > 4
        self.RingTables[i].RELOCATING_TILES = {}; -- Used during process to relocate existing tiles
        for _, h in pairs(self.RingTables[i].HexRings) do
            self:UpdateTableDataRing(h, i, nil);
        end
        print(self.Hex:PrintXY().." - EMPTY_TILES "..tostring(i).. " = "..tostring(#self.RingTables[i].EMPTY_TILES))
        print(self.Hex:PrintXY().." - LOW_YIELD_TILES "..tostring(i).. " = "..tostring(#self.RingTables[i].LOW_YIELD_TILES))
        print(self.Hex:PrintXY().." - STANDARD_YIELD_TILES "..tostring(i).. " = "..tostring(#self.RingTables[i].STANDARD_YIELD_TILES))
        print(self.Hex:PrintXY().." - HIGH_YIELD_TILES "..tostring(i).. " = "..tostring(#self.RingTables[i].HIGH_YIELD_TILES))
    end
end


function SpawnBalancing:RemoveRing1MountainsOnRiver()
    for _, h in pairs(self.RingTables[1].HexRings) do
        if (h.IsOnRiver or h.IsCoastal) and h:IsMountain() and h.FeatureType ~= g_FEATURE_VOLCANO then
            self.HexMap:TerraformMountainToHill(h);
        end
    end
end

function SpawnBalancing:RemoveRing1Deserts()
    if self.Civ.IsDesertBias == false then
        print("RemoveRing1Deserts")
        self.HexMap:TerraformDesert(self.Hex);
        for _, h in pairs(self.RingTables[1].HexRings) do
            self.HexMap:TerraformDesert(h);
        end
    end
end

-- Starting from empty tile to low yields tiles, try to convert lower tiles to the desired amount of on every ring 1 to 3 2/2 or 3/1 
-- Rules : 2 standards yields tiles (food+prod=4) in ring 1, 3 in ring 2, 4 in ring 3
-- If a resource or feature prevents terraforming, it is removed and relocated to the next ring if possible
-- Standard yields balance (avoiding only 1/3 spawns for example) is in BalanceAllCivYields
function SpawnBalancing:ApplyMinimalLandTiles(iMin, iMax)
    -- At least 2 4yields tiles workables ring1
    if self.Hex.ResourceType ~= g_RESOURCE_NONE then
        local hexData = { TerrainId = self.Hex.TerrainType,  FeatureId = self.Hex.FeatureType, ResourceId = self.Hex.ResourceType, Relocated = false}
        print("Spawned on a resource, relocating "..tostring(self.Hex.ResourceType))
        table.insert(self.RingTables[1].RELOCATING_TILES, hexData);
        self.HexMap:TerraformSetResource(self.Hex, g_RESOURCE_NONE)
    end
    for i, _ in pairs(self.RingTables) do
        if i == iMax + 1 then 
            return;
        end
        if i >= iMin then 
            print("MinimalTileV2 Ring "..tostring(i));
            -- Apply relocated resources from previous ring
            self:PlaceRelocatedHexOnRing(i);
            -- Formula used to count the number of standard yields tiles needed in a given ring around the spawning hex
            local tileToUp = (i + 1) - #self.RingTables[i].STANDARD_YIELD_TILES - #self.RingTables[i].HIGH_YIELD_TILES;
            -- Try to apply randomly desired number of standard yield tiles in ring i
            while (tileToUp > 0 and self:TerraformRandomInRing(i, TerraformType[4], 0, false, false)) do
                tileToUp = tileToUp - 1;
            end
            -- If left to update, it means there were obstacle to the terraformation (existing resources or features) if possible, relocate them in next ring
            while tileToUp > 0 and i < self.MaxRing do
                local relocatedHex = self:RelocateRandomHexToNextRing(self.RingTables[i].LOW_YIELD_TILES, i)
                if relocatedHex ~= nil and self.HexMap:TerraformTo4Yields(relocatedHex) then 
                    self:UpdateTableDataRing(relocatedHex, i, self.RingTables[i].LOW_YIELD_TILES);
                    tileToUp = tileToUp - 1;
                else 
                    print("Can't relocate to meet requirements") --desert/tundra civ, see how to deal 
                    break;
                end
            end
        end
    end
end


-- Rules : Check if harbor tile, add a fish ring 2 if none
function SpawnBalancing:ApplyMinimalCoastalTiles()
    -- Check if harbor tile, else clean and relocate
    if self.Hex.IsCoastal == false then
        print("Not coastal tile")
        return;
    end
    print("Coastal tile")
    -- 1) Get a valid harbor tile
    local waterR1 = self.RingTables[1].COAST;
    local validHarborTile = false;
    local fishRing2OK = 0;
    local resourceRing3OK = 0;
    print("Number of water tiles R1 = "..tostring(#waterR1))
    for _, h in pairs(waterR1) do 
        if h.ResourceType == g_RESOURCE_NONE and h.FeatureType == g_FEATURE_NONE then
            validHarborTile = true;
            break;           
        end
    end

    if validHarborTile == false then
        print("No harbor tile found, try relocate")
        local rng = math.random(#waterR1);
        local randomR1 = waterR1[rng];
        local hexData = { TerrainId = randomR1.TerrainType,  FeatureId = randomR1.FeatureType, ResourceId = randomR1.ResourceType }
        self.HexMap:TerraformSetResource(randomR1, g_RESOURCE_NONE);
        self.HexMap:TerraformSetFeature(randomR1, g_FEATURE_NONE);
        table.insert(self.RingTables[2].RELOCATING_TILES, hexData);
        self:PlaceRelocatedHexOnRing(2);
    end
    -- 2) Adding river 


    -- 3) Changing ocean to coast in all round 2 tiles
    print("Number of water tiles R2 = "..tostring(#self.RingTables[2].WATER))
    for _, h in pairs(self.RingTables[2].WATER) do
        if h.TerrainType == g_TERRAIN_TYPE_OCEAN then
            self.HexMap:TerraformSetTerrain(h, g_TERRAIN_TYPE_COAST)
        end
    end

    -- 4) At least one fish ring 2
    local foundFishR2 = false;
    if #self.RingTables[2].WATER_RF > 0 then
        for _, h in pairs(self.RingTables[2].WATER_RF) do
            if h.ResourceType == g_RESOURCE_FISH then
                foundFishR2 = true;
            end
        end
    end 

    if foundFishR2 == false then
        if #self.RingTables[2].WATER_EMPTY > 0 then
            self:TerraformRandomInRing(2, TerraformType[3], g_RESOURCE_FISH, false, false);
        elseif #self.RingTables[2].WATER_RF > 0 then
            -- replace a random ring, do we need to relocate or adjust later anyway ?
            local relocatedHex = self:RelocateRandomHexToNextRing(self.RingTables[2].WATER_RF, 2)
            self.HexMap:TerraformHex(relocatedHex, TerraformType[3], g_RESOURCE_FISH, false);
            self:UpdateTableDataRing(relocatedHex, 2, self.RingTables[2].WATER_RF)
        end
    end

    -- 5) 50% to change ocean to coast on ring 3
    for _, h in pairs(self.RingTables[3].WATER) do
        if h.TerrainType == g_TERRAIN_TYPE_OCEAN then
            local rng = TerrainBuilder.GetRandomNumber(100, "Ring3 Ocean to coast");
            if rng <= 50 then
                self.HexMap:TerraformSetTerrain(h, g_TERRAIN_TYPE_COAST);
            end
        end
        if g_RESOURCES_FISHINGBOAT_LIST[h.ResourceType] then
            resourceRing3OK = resourceRing3OK + 1;
        end
    end
    if fishRing2OK == 1 and resourceRing3OK == 0 then
        if self:TerraformInRingsOrder(2, 3, TerraformType[3], g_RESOURCE_FISH, false, true) then
            print("Added a fish ring 2 or 3 ")
        end
    end    

    self:GetCoastalScoreHex();
end



function SpawnBalancing:GetCoastalScoreHex()
    local coastalScore = 0;
    for i, _ in pairs(self.RingTables) do
        for _, hex in pairs(self.RingTables[i].WATER_RF) do
            if i == 1 or i == 2 then
                --if hex.ResourceType == g_RESOURCE_NONE and hex.FeatureType == g_FEATURE_REEF then
                --    coastalScore = coastalScore + CoastalScoring.REEF_R2
                if hex.ResourceType == g_RESOURCE_FISH then
                    if hex.FeatureType == g_FEATURE_REEF then
                        coastalScore = coastalScore + CoastalScoring.FISH_REEF_R2
                        _Debug("FISH_REEF_R2 "..tostring(CoastalScoring.FISH_REEF_R2))
                    else
                        coastalScore = coastalScore + CoastalScoring.FISH_R2
                        _Debug("FISH_R2 "..tostring(CoastalScoring.FISH_R2))
                    end
                elseif hex.ResourceType == g_RESOURCE_TURTLES then
                    coastalScore = coastalScore + CoastalScoring.TURTLES_R2 
                    print(tostring(CoastalScoring.FISH_R2))
                elseif hex.ResourceType == g_RESOURCE_WHALES then
                    coastalScore = coastalScore + CoastalScoring.WHALES_R2
                    print(tostring(CoastalScoring.WHALES_R2))
                elseif hex.ResourceType == g_RESOURCE_PEARLS then
                    coastalScore = coastalScore + CoastalScoring.PEARLS_R2
                    print(tostring(CoastalScoring.PEARLS_R2))
                elseif hex.ResourceType == g_RESOURCE_AMBER then
                    coastalScore = coastalScore + CoastalScoring.AMBER_R2
                    print(tostring(CoastalScoring.AMBER_R2)) 
                elseif hex.ResourceType == g_RESOURCE_CRABS then
                    coastalScore = coastalScore + CoastalScoring.CRABS_R2
                    print(tostring(CoastalScoring.CRABS_R2))
                end
            elseif i == 3 then
                --if hex.ResourceType == g_RESOURCE_NONE and hex.FeatureType == g_FEATURE_REEF then
                --    coastalScore = coastalScore + CoastalScoring.REEF_R3
                if hex.ResourceType == g_RESOURCE_FISH then
                    if hex.FeatureType == g_FEATURE_REEF then
                        coastalScore = coastalScore + CoastalScoring.FISH_REEF_R3
                        print(tostring(CoastalScoring.FISH_REEF_R3))
                    else
                        coastalScore = coastalScore + CoastalScoring.FISH_R3
                        print(tostring(CoastalScoring.FISH_R3))
                    end
                elseif hex.ResourceType == g_RESOURCE_TURTLES then
                    coastalScore = coastalScore + CoastalScoring.TURTLES_R3 
                    print(tostring(CoastalScoring.TURTLES_R3))
                elseif hex.ResourceType == g_RESOURCE_WHALES then
                    coastalScore = coastalScore + CoastalScoring.WHALES_R3
                    print(tostring(CoastalScoring.WHALES_R3))
                elseif hex.ResourceType == g_RESOURCE_PEARLS then
                    coastalScore = coastalScore + CoastalScoring.PEARLS_R3
                    print(tostring(CoastalScoring.PEARLS_R3))
                elseif hex.ResourceType == g_RESOURCE_AMBER then
                    coastalScore = coastalScore + CoastalScoring.AMBER_R3
                    print(tostring(CoastalScoring.AMBER_R3)) 
                elseif hex.ResourceType == g_RESOURCE_CRABS then
                    coastalScore = coastalScore + CoastalScoring.CRABS_R3
                    print(tostring(CoastalScoring.CRABS_R3))
                end
            end
        end
    end
    print("Coastal Score for civ "..self.Civ.CivilizationLeader.." = "..tostring(coastalScore));
    self.CoastalScore = coastalScore;
end

-- From a selected table of hex datas, take a random hex and prepare to relocating in the next ring
-- replaced when method PlaceRelocatedHexOnRing is called with the right ring index
function SpawnBalancing:RelocateRandomHexToNextRing(tableToRelocateFrom, ringTableIndex)
    tableToRelocateFrom = GetShuffledCopyOfTable(tableToRelocateFrom);
    for _, hex in pairs(tableToRelocateFrom) do
        -- Do not relocate floodplains, desert and tundra
        if hex:IsFloodplains() == false and hex:IsDesertLand() == false and hex:IsTundraLand() == false and hex:IsSnowLand() == false then
            local nextIndex = ringTableIndex + 1
            local hexData = { TerrainId = hex.TerrainType,  FeatureId = hex.FeatureType, ResourceId = hex.ResourceType, Relocated = false }
            print("Relocating "..hex:PrintXY().." : "..tostring(hex.TerrainType).." "..tostring(hex.FeatureId).." "..tostring(hex.ResourceType))
            table.insert(self.RingTables[nextIndex].RELOCATING_TILES, hexData);
            self.HexMap:TerraformSetResource(hex, g_RESOURCE_NONE);
            self.HexMap:TerraformSetFeature(hex, g_FEATURE_NONE);
            return hex
        end
    end
    print("RelocateRandomHexToNextRingERROR - No hex to relocate")
    return nil;
end

-- To call after using a method that can fill the relocating table, will try to add it to the ring in index
function SpawnBalancing:PlaceRelocatedHexOnRing(i) 
    print("PlaceRelocatedHexOnRing entry")
    local totalRelocating = #self.RingTables[i].RELOCATING_TILES
    if totalRelocating > 0 then
        for _, hexData in pairs(self.RingTables[i].RELOCATING_TILES) do
            local isRelocated = false;
            if #self.RingTables[i].WATER > 0 then
                local listWater = self.RingTables[i].WATER;
                if #listWater > 1 then
                    listWater = GetShuffledCopyOfTable(listWater);
                end
                for _, hex in pairs(listWater) do
                    -- TODO : check if necessary to separate feature and resources, may have problem with none
                    if hexData.FeatureId ~= g_FEATURE_NONE and TerrainBuilder.CanHaveFeature(hex.Plot, hexData.FeatureId) then
                        self.HexMap:TerraformEmpty(hex, TerraformType[1], hexData.TerrainId, false);
                        self.HexMap:TerraformEmpty(hex, TerraformType[2], hexData.FeatureId, false);
                        isRelocated = true;
                    end
                    if hexData.ResourceId ~= g_RESOURCE_NONE and ResourceBuilder.CanHaveResource(hex.Plot, hexData.ResourceId) then
                        self.HexMap:TerraformEmpty(hex, TerraformType[1], hexData.TerrainId, false);
                        self.HexMap:TerraformEmpty(hex, TerraformType[3], hexData.ResourceId, false);
                        isRelocated = true;
                    end
                    if isRelocated then break end
                end
            end
            if #self.RingTables[i].EMPTY_TILES > 0 then
                local randomEmptyYields = GetShuffledCopyOfTable(self.RingTables[i].EMPTY_TILES);
                for _, hex in pairs(randomEmptyYields) do
                    if isRelocated then break end
                    if hexData.FeatureId ~= g_FEATURE_NONE and TerrainBuilder.CanHaveFeature(hex.Plot, hexData.FeatureId) then
                        self.HexMap:TerraformEmpty(hex, TerraformType[1], hexData.TerrainId, false);
                        self.HexMap:TerraformEmpty(hex, TerraformType[2], hexData.FeatureId, false);
                        isRelocated = true;
                    end
                    if hexData.ResourceId ~= g_RESOURCE_NONE and ResourceBuilder.CanHaveResource(hex.Plot, hexData.ResourceId) then
                        self.HexMap:TerraformEmpty(hex, TerraformType[1], hexData.TerrainId, false);
                        self.HexMap:TerraformEmpty(hex, TerraformType[3], hexData.ResourceId, false);
                        isRelocated = true;
                    end
                    if isRelocated then
                        totalRelocating = totalRelocating - 1;
                        self:UpdateTableDataRing(hex, i, self.RingTables[i].EMPTY_TILES);
                        print("Relocated feat = "..tostring(hexData.FeatureId).." res = "..tostring(hexData.ResourceId).." on "..hex:PrintXY())
                    else
                        print("Cant terraform relocating")
                    end
                end
            end
            if isRelocated == false and #self.RingTables[i].LOW_YIELD_TILES > 0 then
                local randomLowYields = GetShuffledCopyOfTable(self.RingTables[i].LOW_YIELD_TILES);
                for _, hex in pairs(randomLowYields) do
                    if isRelocated then break end;
                    if hexData.FeatureId ~= g_FEATURE_NONE and TerrainBuilder.CanHaveFeature(hex.Plot, hexData.FeatureId) then
                        self.HexMap:TerraformHex(hex, TerraformType[1], hexData.TerrainId, false);
                        self.HexMap:TerraformHex(hex, TerraformType[2], hexData.FeatureId, false);
                        isRelocated = true;
                    end
                    if hexData.ResourceId ~= g_RESOURCE_NONE and ResourceBuilder.CanHaveResource(hex.Plot, hexData.ResourceId) then
                        self.HexMap:TerraformHex(hex, TerraformType[1], hexData.TerrainId, false);
                        self.HexMap:TerraformHex(hex, TerraformType[3], hexData.ResourceId, false);
                        isRelocated = true;
                    end
                    if isRelocated then
                        totalRelocating = totalRelocating - 1;
                        self:UpdateTableDataRing(hex, i, self.RingTables[i].EMPTY_TILES);
                        print("Relocated feat = "..tostring(hexData.FeatureId).." res = "..tostring(hexData.ResourceId).." on "..hex:PrintXY())
                    else
                        print("Cant terraform relocating")
                    end
                end
            end
        end
    end
    if totalRelocating > 0 then
        print("PlaceRelocatedHexOnRing WARNING - Could not relocate all hex")
    end
    self.RingTables[i].RELOCATING_TILES = {}
end

-- Method used to terraform a random tile around the main tile starting from empty or low yields tiles 
-- on the last selected ring, we may force a last resort terraformation if needed
-- iMin and iMax are the respectively starting ring (most desired) to last possible ring
-- terraformType is TerraformType[n] => sort of enum to choose terrain/feature/resource with its id  
function SpawnBalancing:TerraformInRingsOrder(iMin, iMax, terraformType, id, needToBeWalkableTo, forced) 
    for i, _ in pairs(self.RingTables) do
        if i >= iMin and i < iMax + 1 then 
            if self:TerraformRandomInRing(i, terraformType, id, needToBeWalkableTo, forced) then
                print("TerraformInRingsOrderOK terraform "..terraformType.." "..tostring(id));
                return true;
            end
        end
    end
    print("TerraformInRingsOrderERROR Could not terraform "..terraformType.." "..tostring(id).." from "..self.Hex:PrintXY());
    return false;
end


-- Add a terraformation given in parameter in the given ring, for empty or low yields tiles
function SpawnBalancing:TerraformRandomInRing(i, terraformType, id, needToBeWalkableTo, forced)
    print("TerraformRandomInRing "..tostring(i)); 
    -- For water/coastal works, limited to fishing resources (WARNING amber in fishing and mining)
    if (terraformType == TerraformType[3] and g_RESOURCES_FISHINGBOAT_LIST[id]) 
            or (terraformType == TerraformType[2] and id == g_FEATURE_REEF) then
        if #self.RingTables[i].WATER > 0 then
            local listWater = self.RingTables[i].WATER;
            if #listWater > 1 then
                listWater = GetShuffledCopyOfTable(listWater);
            end
            for _, hex in pairs(listWater) do
                if self.HexMap:TerraformHex(hex, terraformType, id, true) then
                    self:UpdateTableDataRing(hex, i, self.RingTables[i].WATER);
                    return true;
                else 
                    print("Couldnt add on water")
                end
            end
        end
    end
    if #self.RingTables[i].EMPTY_TILES > 0 then
        local listEmpty = self.RingTables[i].EMPTY_TILES;
        if #listEmpty > 1 then
            listEmpty = GetShuffledCopyOfTable(listEmpty);
        end
        for _, hex in pairs(listEmpty) do
            if needToBeWalkableTo == false or (needToBeWalkableTo and self.Hex:IsWalkableInRange(hex, i)) then
                if self.HexMap:TerraformEmpty(hex, terraformType, id, true) then
                    print("Found a empty tile "..hex:PrintXY().." to add "..tostring(terraformType).." "..tostring(id))
                    self:UpdateTableDataRing(hex, i, self.RingTables[i].EMPTY_TILES);
                    return true;
                end 
            end
        end
    end
    if #self.RingTables[i].LOW_YIELD_TILES > 0 then
        local listLowYieldsTiles = self.RingTables[i].LOW_YIELD_TILES;
        if #listLowYieldsTiles > 1 then
            listLowYieldsTiles = GetShuffledCopyOfTable(listLowYieldsTiles);
        end
        for _, hex in pairs(listLowYieldsTiles) do
            if needToBeWalkableTo == false or (needToBeWalkableTo and self.Hex:IsWalkableInRange(hex, i)) then
                if self.HexMap:TerraformHex(hex, terraformType, id, false) then
                    print("Found a low yield tile "..hex:PrintXY().." to add "..tostring(terraformType).." "..tostring(id))
                    self:UpdateTableDataRing(hex, i, self.RingTables[i].LOW_YIELD_TILES);
                    return true;
                end
            end
        end
        -- if unable to place on low yield tile force if asked in paramter
        if #listLowYieldsTiles > 0 and forced then
            -- Already shuffled from before, just take the first hex and force desired terraform on it
            local hex = listLowYieldsTiles[1];
            print("Try to force on ring "..tostring(i));
            -- Try to add Feature, exclude flood and geo
            if hex.ResourceType == g_RESOURCE_NONE and hex:IsFloodplains() == false 
                and hex.FeatureType ~= g_FEATURE_GEOTHERMAL_FISSURE then
                self.HexMap:TerraformHex(hex, TerraformType[2], g_FEATURE_NONE, true);
                if self.HexMap:TerraformHex(hex, terraformType, id, true) then
                    print("Terraformed a "..tostring(hex.FeatureType).." feature "..hex:PrintXY());
                    self:UpdateTableDataRing(hex, i, self.RingTables[i].LOW_YIELD_TILES);
                    return true;
                end
            end
            -- Try to add Resource, relocate only bonus
            if g_RESOURCES_BONUS_LIST[hex.ResourceType] then
                self.HexMap:TerraformHex(hex, TerraformType[3], g_RESOURCE_NONE, true);
                if self.HexMap:TerraformHex(hex, terraformType, id, true) then
                    print("Terraformed a "..tostring(hex.ResourceType).." resource "..hex:PrintXY());
                    self:UpdateTableDataRing(hex, i, self.RingTables[i].LOW_YIELD_TILES);
                    return true;
                end
            end
        end
    end
    return false;
end

function SpawnBalancing:ApplyGaranteedStrategics() 
    if MapConfiguration.GetValue("BBSStratRes") ~= 3 then
        return
    end
    -- Horse and iron in ring 1-3, other strats in ring 1-5
    local ring1To2 = self.HexMap:GetAllHexInRing(self.Hex, 2);
    local horsesOK = false;
    local ironOK = false;
    for _, h in pairs(ring1To2) do
        if h.ResourceType == g_RESOURCE_HORSES then
            print("Already found horses");
            horsesOK = true;
        end
        if h.ResourceType == g_RESOURCE_IRON then 
            print("Already found iron");
            ironOK = true;
        end
    end
    if horsesOK == false then 
        print("Adding horses 1-3")
        self:TerraformInRingsOrder(1, 2, TerraformType[3], g_RESOURCE_HORSES, true, true);
    end
    if ironOK == false then 
        print("Adding iron 1-3")
        self:TerraformInRingsOrder(1, 3, TerraformType[3], g_RESOURCE_IRON, true, true);
    end

    local ring1To5 = self.HexMap:GetAllHexInRing(self.Hex, 5);
    local niterOK = false;
    local coalOK = false;
    local oilOK = false;
    local uraniumOK = false;
    local aluOK = false;
    for _, h in pairs(ring1To5) do
        if h.ResourceType == g_RESOURCE_NITER and niterOK == false then
            print("Already found niter");
            niterOK = true;
        end
        if h.ResourceType == g_RESOURCE_COAL and coalOK == false then
            print("Already found coal");
            coalOK = true;
        end
        if h.ResourceType == g_RESOURCE_OIL and oilOK == false then
            print("Already found oil");
            oilOK = true;
        end
        if h.ResourceType == g_RESOURCE_ALUMINUM and aluOK == false then
            print("Already found aluminium");
            aluOK = true;
        end
        if h.ResourceType == g_RESOURCE_URANIUM and uraniumOK == false then
            print("Already found uranium");
            uraniumOK = true;
        end
    end
    if niterOK == false then 
        self:TerraformInRingsOrder(4, 5, TerraformType[3], g_RESOURCE_NITER, false, true);
    end
    if coalOK == false then 
        self:TerraformInRingsOrder(4, 5, TerraformType[3], g_RESOURCE_COAL, false, true);
    end
    if oilOK == false then 
        self:TerraformInRingsOrder(4, 5, TerraformType[3], g_RESOURCE_OIL, false, true);
    end
    if aluOK == false then 
        self:TerraformInRingsOrder(4, 5, TerraformType[3], g_RESOURCE_ALUMINUM, false, true);
    end
    if uraniumOK == false then 
        self:TerraformInRingsOrder(4, 5, TerraformType[3], g_RESOURCE_URANIUM, false, true);
    end
end


-- Data for each ring around the designed spawn
function SpawnBalancing:UpdateTableDataRing(h, i, previousTable)
    if previousTable ~= nil then
        RemoveFromTable(previousTable, h);
    end
    h:UpdateYields();
    if h:IsWater() then
        table.insert(self.RingTables[i].WATER, h)
        if h.FeatureType == g_FEATURE_NONE and h.ResourceType == g_RESOURCE_NONE then
            table.insert(self.RingTables[i].WATER_EMPTY, h)
        else
            table.insert(self.RingTables[i].WATER_RF, h)
        end
        if h:IsCoast() then
            table.insert(self.RingTables[i].COAST, h)
        elseif h.Plot:IsLake() then
            table.insert(self.RingTables[i].LAKES, h)
        end
    elseif h:IsImpassable() then
        table.insert(self.RingTables[i].IMPASSABLE, h)
    elseif h.ResourceType == g_RESOURCE_NONE and h.FeatureType == g_FEATURE_NONE then
        table.insert(self.RingTables[i].EMPTY_TILES, h)
    elseif h.Food + h.Prod < 4 then
        table.insert(self.RingTables[i].LOW_YIELD_TILES, h)
    elseif h.Food + h.Prod == 4 and h.Prod > 0 then
        table.insert(self.RingTables[i].STANDARD_YIELD_TILES, h)
    elseif h.Food + h.Prod > 4 or h.Food == 0 then
        table.insert(self.RingTables[i].HIGH_YIELD_TILES, h)
    end
end

function SpawnBalancing:UpdateCoastalScore(score)
    self.CoastalScore = self.CoastalScore + score
    _Debug("New Coastal Score for "..self.Civ.CivilizationLeader.." = "..tostring(self.CoastalScore))
end

-- List of "SpawnBalancing" object for each major civ 
function BalanceAllCivYields(spawns)
    local aimedCoastalScore = CoastalScoring.BASE_COASTAL_SCORE;
    local meanCoastalScore = 0
    local nbCoastal = 0
    for _, spawn in pairs(spawns) do
        if spawn.CoastalScore > 0 then
            meanCoastalScore = meanCoastalScore + spawn.CoastalScore
            nbCoastal = nbCoastal + 1
        end
    end
    -- Balancing coastal resources on coastal 
    if nbCoastal > 0 then
        aimedCoastalScore = math.max((meanCoastalScore / nbCoastal), CoastalScoring.BASE_COASTAL_SCORE);
        _Debug("BalanceAllCivYields - "..tostring(aimedCoastalScore))
        for _, spawn in pairs(spawns) do
            spawn.AimedCoastalScore = aimedCoastalScore
            _Debug(spawn.Civ.CivilizationLeader.." - Initial coastal score = "..tostring(spawn.CoastalScore))
            if spawn.CoastalScore < spawn.AimedCoastalScore then
                spawn:ImproveCoastal()
            elseif spawn.CoastalScore > spawn.AimedCoastalScore then
                --spawn:NerfCoastal()
            end   
        end
    end
end

-- CoastalScore < Aimed 
function SpawnBalancing:ImproveCoastal()
    if self.AimedCoastalScore == 0 or self.CoastalScore == 0 then
        return
    end
    _Debug("ImproveCoastal diff score = "..tostring(self.AimedCoastalScore - self.CoastalScore).." for "..tostring(self.Civ.CivilizationLeader))
    while math.abs(self.AimedCoastalScore - self.CoastalScore) > CoastalScoring.COASTAL_MARGIN do
        local stepDone = false;
        -- Test highest score first ?
        local waterRFRing2 = GetShuffledCopyOfTable(self.RingTables[2].WATER_RF);
        for _, h in pairs(waterRFRing2) do
            if h.ResourceType == g_RESOURCE_FISH and h.FeatureType == g_FEATURE_NONE 
                and self:CanAddToCoastalScore(CoastalScoring.FISH_REEF_R2 - CoastalScoring.FISH_R2) then
                self.HexMap:TerraformHex(h, TerraformType[2], g_FEATURE_REEF, false);
                self.HexMap:TerraformHex(h, TerraformType[3], g_RESOURCE_FISH, true);
                self:UpdateTableDataRing(h, 2, self.RingTables[2].WATER_RF)
                self:UpdateCoastalScore(CoastalScoring.FISH_REEF_R2 - CoastalScoring.FISH_R2)
                stepDone = true;
                _Debug(h:PrintXY().." ImproveCoastal - Fish to FishReef R2")
            elseif h.ResourceType == g_RESOURCE_NONE and h.FeatureType == g_FEATURE_REEF 
                and self:CanAddToCoastalScore(CoastalScoring.FISH_REEF_R2 - CoastalScoring.REEF_R2) then
                self.HexMap:TerraformHex(h, TerraformType[3], g_RESOURCE_FISH, true);
                self:UpdateTableDataRing(h, 2, self.RingTables[2].WATER_RF)
                self:UpdateCoastalScore(CoastalScoring.FISH_REEF_R2 - CoastalScoring.REEF_R2)
                stepDone = true;
                _Debug(h:PrintXY().." ImproveCoastal - Reef to FishReef R2")
            elseif h.ResourceType == g_RESOURCE_CRABS and self:CanAddToCoastalScore(CoastalScoring.FISH_R2 - CoastalScoring.CRABS_R2) then
                self.HexMap:TerraformHex(h, TerraformType[3], g_RESOURCE_FISH, true);
                self:UpdateTableDataRing(h, 2, self.RingTables[2].WATER_RF)
                self:UpdateCoastalScore(CoastalScoring.FISH_R2 - CoastalScoring.CRABS_R2)
                stepDone = true;
                _Debug(h:PrintXY().." ImproveCoastal - Crab to Fish R2")
            end
        end

        if stepDone == false then
            local waterRFRing3 = GetShuffledCopyOfTable(self.RingTables[3].WATER_RF);
            for _, h in pairs(waterRFRing3) do
                if h.ResourceType == g_RESOURCE_FISH and h.FeatureType == g_FEATURE_NONE 
                    and self:CanAddToCoastalScore(CoastalScoring.FISH_REEF_R3 - CoastalScoring.FISH_R3) then
                    -- TODO add calculations costal score
                    self.HexMap:TerraformHex(h, TerraformType[2], g_FEATURE_REEF, true);
                    self.HexMap:TerraformHex(h, TerraformType[3], g_RESOURCE_FISH, true);
                    self:UpdateTableDataRing(h, 3, self.RingTables[3].WATER_RF)
                    self:UpdateCoastalScore(CoastalScoring.FISH_REEF_R3 - CoastalScoring.FISH_R3)
                    stepDone = true;
                    _Debug(h:PrintXY().." ImproveCoastal - Fish to FishReef R3")
                elseif h.ResourceType == g_RESOURCE_NONE and h.FeatureType == g_FEATURE_REEF 
                    and self:CanAddToCoastalScore(CoastalScoring.FISH_REEF_R3 - CoastalScoring.REEF_R3) then
                    self.HexMap:TerraformHex(h, TerraformType[3], g_RESOURCE_FISH, true);
                    self:UpdateTableDataRing(h, 3, self.RingTables[3].WATER_RF)
                    self:UpdateCoastalScore(CoastalScoring.FISH_REEF_R3 - CoastalScoring.REEF_R3)
                    stepDone = true;
                    _Debug(h:PrintXY().." ImproveCoastal - Reef to FishReef R3")
                elseif h.ResourceType == g_RESOURCE_CRABS 
                    and self:CanAddToCoastalScore(CoastalScoring.FISH_R3 - CoastalScoring.CRABS_R3) then
                    self.HexMap:TerraformHex(h, TerraformType[3], g_RESOURCE_FISH, true);
                    self:UpdateTableDataRing(h, 3, self.RingTables[3].WATER_RF)
                    self:UpdateCoastalScore(CoastalScoring.FISH_R3 - CoastalScoring.CRABS_R3)
                    stepDone = true;
                    _Debug(h:PrintXY().." ImproveCoastal - Crab to Fish R3")
                end
            end
        end
        
        if stepDone == false then
            local waterEmptyRing2 = GetShuffledCopyOfTable(self.RingTables[2].WATER_EMPTY);
            for _, h in pairs(waterEmptyRing2) do
                -- Fish reef test -- TODO if reef is near coast ?
                if self:CanAddToCoastalScore(CoastalScoring.FISH_REEF_R2) then
                    self.HexMap:TerraformHex(h, TerraformType[2], g_FEATURE_REEF, true);
                    self.HexMap:TerraformHex(h, TerraformType[3], g_RESOURCE_FISH, true);
                    self:UpdateTableDataRing(h, 2, self.RingTables[2].WATER_EMPTY)
                    self:UpdateCoastalScore(CoastalScoring.FISH_REEF_R2)
                    stepDone = true;
                    _Debug(h:PrintXY().." ImproveCoastal - Empty to FishReef R2")
                elseif self:CanAddToCoastalScore(CoastalScoring.FISH_R2) then
                    self.HexMap:TerraformHex(h, TerraformType[3], g_RESOURCE_FISH, true);
                    self:UpdateTableDataRing(h, 2, self.RingTables[2].WATER_EMPTY)
                    self:UpdateCoastalScore(CoastalScoring.FISH_R2)
                    stepDone = true;
                    _Debug(h:PrintXY().." ImproveCoastal - Empty to Fish R2")
                end
            end  
        end

        if stepDone == false then
            local waterEmptyRing3 = GetShuffledCopyOfTable(self.RingTables[3].WATER_EMPTY);
            for _, h in pairs(waterEmptyRing3) do
                -- Fish reef test -- TODO if reef is near coast ?
                if self:CanAddToCoastalScore(CoastalScoring.FISH_REEF_R3) then
                    self.HexMap:TerraformHex(h, TerraformType[2], g_FEATURE_REEF, true);
                    self.HexMap:TerraformHex(h, TerraformType[3], g_RESOURCE_FISH, true);
                    self:UpdateTableDataRing(h, 3, self.RingTables[3].WATER_EMPTY)
                    self:UpdateCoastalScore(CoastalScoring.FISH_REEF_R3)
                    stepDone = true;
                    _Debug(h:PrintXY().." ImproveCoastal - Empty to FishReef R3")
                elseif self:CanAddToCoastalScore(CoastalScoring.FISH_R3) then
                    self.HexMap:TerraformHex(h, TerraformType[3], g_RESOURCE_FISH, true);
                    self:UpdateTableDataRing(h, 3, self.RingTables[3].WATER_EMPTY)
                    self:UpdateCoastalScore(CoastalScoring.FISH_R3)
                    stepDone = true;
                    _Debug(h:PrintXY().." ImproveCoastal - Empty to Fish R3")
                end
            end  
        end
        -- todo rest if we keep same algo
    end
end

function SpawnBalancing:NerfCoastal()
    if self.AimedCoastalScore == 0 or self.CoastalScore == 0 then
        return
    end
    _Debug("NerfCoastal diff score = "..tostring(self.CoastalScore - self.AimedCoastalScore))
    while self.CoastalScore - self.AimedCoastalScore > CoastalScoring.COASTAL_MARGIN do
        local stepDone = false;

        local waterRFRing2 = GetShuffledCopyOfTable(self.RingTables[2].WATER_RF);
        for _, h in pairs(waterRFRing2) do
            if h.ResourceType == g_RESOURCE_FISH and h.FeatureType == g_FEATURE_REEF then
                self.HexMap:TerraformHex(h, TerraformType[2], g_FEATURE_NONE, false);
                self:UpdateTableDataRing(h, 2, self.RingTables[2].WATER_RF)
            end
        end
    end
    
end

function RemoveFromTable(table, valueToRemove)
    for i, v in pairs(table) do
        if v == valueToRemove then
            table[i] = nil  -- Set the value at index i to nil to remove it
            break  -- Exit the loop after the first occurrence is removed
        end
    end
end