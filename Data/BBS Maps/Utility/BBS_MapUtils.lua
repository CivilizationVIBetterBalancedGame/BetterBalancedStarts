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
        -- TODO to fill
        self.ResourceType = plot:GetResourceType();
        self.FeatureType = plot:GetFeatureType();
        self.TerrainType = plot:GetTerrainType();
        self.IsNaturalWonder = plot:IsNaturalWonder();
        self.IsFreshWater = plot:IsFreshWater();
        self.IsCoastal = plot:IsCoastalLand(); 
        return;
    end
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

function Hex:IsImpassable() 
    return self:IsWater() or self:IsMountain();
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
     

-- return the centroid at the index
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
-- Centroid
---------------------------------------
Centroid = {}
setmetatable(Centroid, { __index = Hex})

function Centroid.new(pX, pY, pId)
    local instance = Hex.new(pX, pY);
    setmetatable(instance, {__index = Centroid});
    instance.x = pX;
    instance.y = pY;
    instance.id = pId
    return instance;
end


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

---------------------------------------
-- HexMap
---------------------------------------


HexMap = {}

function HexMap.new(_width, _height, mapScript)
    local instance = {};
    setmetatable(instance, {__index = HexMap});
    instance.width = _width
    instance.height = _height
    instance.mapScript = mapScript
    instance:CanCircumnavigate(mapScript)
    instance.map = {}
    instance.centroidsArray = {}
    -- Put maps parameters here ? (world age, temperature, rainfall etc)
    return instance;
end

function HexMap:CanCircumnavigate()
    self.canCircumnavigate = self.mapScript ~= MAP_INLAND_SEA and self.mapScript ~= MAP_TILTED_AXIS;
end

-- Put datas of every hex in map
function HexMap:AlimenteHexMap()
    for y = 0, self.height - 1 do
        self.map[y] = {}
        for x = 0, self.width - 1 do
            local newHex = Hex.new(x,y);
            newHex:FillHexDatas();
            self.map[y][x] = newHex;
        end
    end
end

-- Return the hex at the coord in parameter
function HexMap:GetHexInMap(pX, pY)
    if self.canCircumnavigate then 
        pX = pX % self.width 
    end
    if (self.canCircumnavigate == false and pX < 0 or pX > self.width) or  (pY < 0 or pY > self.height) then
        return nil
    end
    local hex = self.map[pY][pX];
    return hex
end

-- Return the sum of two hex vectors - do not check if the result is on map or not
function HexMap:GetHexSum(hex, vec)
    local newX = hex.x + vec.x
    local newY = hex.y + vec.y
    -- loop through the map if we can
    if self.canCircumnavigate then
        newX = newX % self.width
    end
    return Hex.new(newX, newY)
end

-- Return multiplication of hex vector times the factor in param
function HexMap:GetHexScale(hex, factor)
    return Hex.new(hex.x * factor, hex.y * factor)
end

-- Loop through all tiles in the specified ringRadius in parameter
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

-- Loop through all rings up to ringRadius parameter
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
         return Hex.new(1, 1);
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
end

-- TEMP - Print Map in logs with centroid id 
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

-- TEMP print map for logs
function Hex:PrintCentroidIdMap()
    local printed = ""
    if self:IsWater() == true then
        if self.isCentroid == true then
            return "[~~]"
        end
        return "~~"
    end
    if self.Centroid == nil then
        print("PrintCentroidIdMap - Centroid not found for hex ("..self.Centroid.x..", "..self.Centroid.y..")")
        return printed
    end
    local idCentroid = self.Centroid.id
    printed = tostring(idCentroid)
    if idCentroid < 10 then
        printed = "0"..tostring(idCentroid)
    end
    if self.isCentroid == true then
        printed = "["..printed.."]"
    end
    return printed
end

function HexMap:GetLandHexList()
    local landTiles = {}
    local countLandtiles = 0
    for y = 0, self.height - 1 do
        for x = 0, self.width - 1 do
            local hex = self.map[y][x]
            if hex:IsWater() == false then
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
        -- Put random hex as centroids
        local randX = TerrainBuilder.GetRandomNumber(self.width, "cX")
        local randY = TerrainBuilder.GetRandomNumber(self.height, "cY")
        local randomHex = Centroid.new(randX, randY, i)
        print("Init random at centroid ("..tostring(randomHex.x)..", "..tostring(randomHex.y)..")")
        table.insert(centroids, randomHex)
    end

    -- Run interations
	for i = 1, iters do
        print("RunKmeans - Iteration "..tostring(i))
		centroids = self:UpdateCentroids(points, centroids)
        centroids = self:UpdateCentroidsSortedIndex(centroids)
	end
    -- TODO find better name - contains table with centroid table as key and list of hexes as value
    self.groupByCentroid = self:CentroidGroupby(points, centroids)
    print("End k-means ", os.date("%c"))
end

-- Mean of hex coord linked to the selected centroid
function HexMap:UpdateCentroids(points, centroids)
	local groupedHexes = self:CentroidGroupby(points, centroids);
	local result = {};
	local i = 1;
    self:ClearCentroidsInMap();
	for _, g in pairs(groupedHexes) do
        local sumX, sumY = sum(g, 0);
        local newX = math.floor(sumX / len(g));
        local newY= math.floor(sumY / len(g));
		result[i] = Centroid.new(newX, newY, i);
        print("Updated new Centroid "..tostring(i).." at ("..tostring(newX)..", "..tostring(newY)..")");
        local hexAt = self:GetHexInMap(newX, newY);
        -- self:AddCentroid(result[i])
		i = i + 1;
	end
	return result;
end

-- Group a list of hex to a centroid as index of the g table
function HexMap:CentroidGroupby(points, centroids)
	local g = {};
	for _, p in pairs(points) do
		local centroid = p:Closest(self, centroids);
		g[centroid] = g[centroid] or {};
        p:SetCentroid(centroid);
		table.insert(g[centroid], p);
	end
	return g;
end

-- Update indexes of centroids, to put them in a new array after sorting by x
function HexMap:UpdateCentroidsSortedIndex(centroids) 
    table.sort(centroids, function (c1, c2) return c1.x < c2.x end)
    local new_centroids = {}
    for i = 1, #centroids do
        local centroid = centroids[i]
        new_centroids[i] = centroid
        centroid.id = i
        self.centroidsArray[i] = centroid
        local correspondingHex = self:GetHexInMap(centroid.x, centroid.y)
        correspondingHex.isCentroid = true
    end
    return new_centroids
end

function HexMap:ClearCentroidsInMap()
    for y = 0, self.height - 1 do
        for x = 0, self.width - 1 do
            local hex = self:GetHexInMap(x, y)
            hex.isCentroid = false
        end
    end 
end

-- TODO error management
function HexMap:GetHexListInCentroidId(centroidId)
    local listHexByCentroid= {};
    -- The Centroid object is used as key for groupByCentroid, need to get it from id first
    local centroid = self.centroidsArray[centroidId];
    -- Get the list of Hexes linked to that centroid by HexMap:CentroidGroupby
    local listHexCentroid = self.groupByCentroid[centroid];
    for _, hex in ipairs(listHexCentroid) do
        table.insert(listHexByCentroid, hex);
    end
    return listHexByCentroid;
end

function sum(t, start)
	local total = start or 0
    local totalX = 0
    local totalY = 0
	for k, i in ipairs(t) do
		totalX = totalX + i.x
        totalY = totalY + i.y
	end
	return totalX, totalY
end

function len(t)
	local l = 0
	for _ in pairs(t) do
		l = l + 1
	end
	return l
end

function even(test)
	if (test % 2 == 0) then
	    return 0
	else
    	return 1
    end
end