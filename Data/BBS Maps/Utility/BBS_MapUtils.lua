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

function Hex:isMountain()
    local terrainType = self.TerrainType;
    if terrainType == g_TERRAIN_TYPE_DESERT_MOUNTAIN or terrainType == g_TERRAIN_TYPE_DESERT_MOUNTAIN 
        or terrainType == g_TERRAIN_TYPE_GRASS_MOUNTAIN or terrainType == g_TERRAIN_TYPE_PLAINS_MOUNTAIN 
        or terrainType == g_TERRAIN_TYPE_SNOW_MOUNTAIN or terrainType == g_TERRAIN_TYPE_TUNDRA_MOUNTAIN then
       return true;
    end
    return false;
 end

function Hex:AddCentroid(c)
    self.Centroid = c
end

function Hex:IsWater()
    if (self.TerrainType == g_TERRAIN_TYPE_OCEAN or self.TerrainType == g_TERRAIN_TYPE_COAST) then
        return true;
     end
     return false
end

function Hex:isHill()
    if self.TerrainType == g_TERRAIN_TYPE_DESERT_HILLS 
        or self.TerrainType == g_TERRAIN_TYPE_GRASS_HILLS 
        or self.TerrainType == g_TERRAIN_TYPE_SNOW_HILLS 
        or self.TerrainType == g_TERRAIN_TYPE_TUNDRA_HILLS 
        or self.TerrainType == g_TERRAIN_TYPE_PLAINS_HILLS then
            return true
    end             
    return false
end

function Hex:IsImpassable() 
    if self:IsWater() or self.isMountain() then
        return true
    end
    return false
end

function Hex:HexAdd(vec)
    if vec.getmetatable == Hex then
        local newX = self:GetX() + vec.x
        local newY = self:GetY() + vec.y
        return Hex(newX, newY)
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
        if hexMap.roundEW == true then
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
-- HexMap
---------------------------------------

HexMap = {}

function HexMap.new(_width, _height, _roundEW)
    local instance = {};
    setmetatable(instance, {__index = HexMap});
    instance.width = _width
    instance.height = _height
    instance.roundEW = _roundEW
    instance.map = {}
    instance.centroidMap = {}
    return instance;
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
    if self.roundEW then 
        pX = pX % self.width 
    end
    if (self.roundEW == false and pX < 0 or pX > self.width) or  (pY < 0 or pY > self.height) then
        return nil
    end
    local hex = self.map[pY][pX];
    return hex
end

-- Return a addition of two hex 
function HexMap:GetHexSum(hex, vec)
    local newX = hex.x + vec.x
    local newY = hex.y + vec.y
    -- loop through the map if we can
    if self.roundEW then
        newX = newX % self.width
    end
    return Hex.new(newX, newY)
end

function HexMap:GetHexScale(hex, factor)
    return Hex.new(hex.x * factor, hex.y * factor)
end

-- Loop through all tiles in ringRadius in parameter
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
        local hexInRingX = self:GetHexInRing(hexCenter, i)
        table.insert(hexList, hexInRingX)
    end
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

-- Print Map in logs
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
    for y = 0, self.height - 1 do
        for x = 0, self.width - 1 do
            local hex = self.map[y][x]
            if hex:IsWater() == false then
                table.insert(landTiles, hex)
            end
        end
    end
    return landTiles;
end

----------------------------
-- K-means
----------------------------
function HexMap:RunKmeans(n, iters)
    iters = iters or 20
    n = n or 16
    print("Start k-means "..tostring(n).." centroids for "..tostring(iters).." iterations. ", os.date("%c"))
    local points = self:GetLandHexList()
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

	for i = 1, iters do
        print("RunKmeans - Iteration "..tostring(i))
		centroids = self:UpdateCentroids(points, centroids)
		--table.sort(centroids, function (c1, c2) return c1.x < c2.x end )
        --for _, centroid in pairs(centroids) do
         --   print("Found centroid on ("..tostring(centroid.x)..", "..tostring(centroid.y)..")")
         --   self:AddCentroid(centroid)
         --   return
       -- end
	end
    print("RunKmeans - Last grouping")
    self.groupByCentroid = self:CentroidGroupby(points, centroids)
    print("End k-means ", os.date("%c"))
end

-- Mean of hex coord linked to the selected centroid
function HexMap:UpdateCentroids(points, centroids)
	local groupedHexes = self:CentroidGroupby(points, centroids)
	local result = {}
	local i = 1
    self:ClearCentroidsInMap()
	for _, g in pairs(groupedHexes) do
        local sumX, sumY = sum(g, 0);
        local newX = math.floor(sumX / len(g))
        local newY= math.floor(sumY / len(g))
		result[i] = Centroid.new(newX, newY, i);
        print("Updated new Centroid "..tostring(i).." at ("..tostring(newX)..", "..tostring(newY)..")")
        local hexAt = self:GetHexInMap(newX, newY)
        self:AddCentroid(result[i])
		i = i + 1
	end
	return result
end

-- Group a list of hex to a centroid as index of the g table
function HexMap:CentroidGroupby(points, centroids)
	local g = {}
	for _, p in pairs(points) do
		local centroid = p:Closest(self, centroids)
		g[centroid] = g[centroid] or {}
        p:AddCentroid(centroid)
		table.insert(g[centroid], p)
	end
	return g 
end

function HexMap:ShiftXPoints(points, shift)
    local shiftedPoints = {}
    for _, p in pairs(points) do
        -- TODO secure p has to be Hex
        local shifted = Hex.new(p.x + shift, p.y)
        table.insert(shiftedPoints, shifted)
    end
    return shiftedPoints
end

function HexMap:AddCentroid(c)
    local hex = self:GetHexInMap(c.x, c.y)
    table.insert(self.centroidMap, hex)
    hex.isCentroid = true
end

function HexMap:ClearCentroidsInMap()
    for y = 0, self.height - 1 do
        for x = 0, self.width - 1 do
            local hex = self:GetHexInMap(x, y)
            hex.isCentroid = false
        end
    end 
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