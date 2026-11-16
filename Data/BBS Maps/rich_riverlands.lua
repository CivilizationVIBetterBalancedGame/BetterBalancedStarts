------------------------------------------------------------------------------
--	FILE:	 rich_riverlands.lua
--	AUTHOR:  
--	PURPOSE: Rich Riverlands - highlands with abundant rivers, lakes, and resources.
--           Each map size uses one tier smaller grid dimensions while
--           retaining the selected size's continent count.
--           Tiny and Small use larger grids and reshaped water (see below).
------------------------------------------------------------------------------
--	Copyright (c) 2014 Firaxis Games, Inc. All rights reserved.
------------------------------------------------------------------------------

include "MapEnums"
include "DW_MapUtilities"
include "BBS_MountainsCliffs"
include "RiversLakes"
include "BBM_FeatureGenerator"
include "TerrainGenerator"
include "BBS_TerrainGenerator"
include "BBS_NaturalWonderGenerator"
include "BBS_ResourceGenerator"
include "CoastalLowlands"
include "AssignStartingPlots"
include "BBM_AssignStartingPlots"
include "BBM_MapUtils"


local g_iW, g_iH;
local g_iFlags = {};
local g_continentsFrac = nil;
local featureGen = nil;
local g_riverPlots = {};
local g_riverStartPlots = {};
local g_iRiverID = 0;

------------------------------------------------------------------------------
-- Tiny (2v2) and Small (3v3): water reshaping.
-- BBM only counts water bodies of 10+ tiles as coast (the game's OCEAN_MIN_WATER_SIZE), so coastal-bias
-- civs (Spain, Japan, Norway, Phoenicia...) rarely found a start and BBM fell back to Firaxis placement.
-- Bodies of 6-9 tiles are neither coast nor wanted lakes, so on Tiny and Small:
--   * a few bodies, spaced apart, are grown to sea size (real coast for naval civs),
--   * every other body is cut down to at most WATER_MAX_LAKE_TILES.
------------------------------------------------------------------------------
local WATER_MAX_LAKE_TILES = 5;
local WATER_SEA_MIN_TILES = 10;
local WATER_SEA_TARGET_TILES = 12;
local WATER_SEA_SPACING = 12; -- below the 14 tile minimum distance between majors
local WATER_SEA_MARGIN = 4;   -- keep new seas away from the map edge
-- Seas must stay clear of tundra (starts at latitude 0.66 here, and BBM rejects starts with tundra within
-- 3 tiles) and of the polar ice band that ConvertIceToSnow turns into land. 0 = equator, 1 = pole.
local WATER_SEA_MAX_LAT = 0.45;

function UseWaterReshape()
	local sizeType = GameInfo.Maps[Map.GetMapSize()].MapSizeType;
	return sizeType == "MAPSIZE_TINY" or sizeType == "MAPSIZE_SMALL";
end

-- Number of guaranteed sea-sized bodies: 3 on Tiny (2v2), 4 on Small (3v3, a bit more map and two more civs).
function GetWaterSeaBodies()
	if GameInfo.Maps[Map.GetMapSize()].MapSizeType == "MAPSIZE_SMALL" then
		return 4;
	end
	return 3;
end

------------------------------------------------------------------------------
-- The application side will call GetMapScriptInfo directly to request
-- information about the map script.
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function BBS_Assign(args)
	print("BBS_Assign: Injecting Spawn Placement")
	local start_plot_database = {};

	start_plot_database = BBM_AssignStartingPlots.Create(args)

	return start_plot_database
end

function GenerateMap()
	print("Generating Rich Riverlands Map");
	local pPlot;

	-- Set globals
	g_iW, g_iH = Map.GetGridSize();
	g_iFlags = TerrainBuilder.GetFractalFlags();
	local temperature = MapConfiguration.GetValue("temperature"); -- Default setting is Temperate.
	if temperature == 4 then
		temperature  =  1 + TerrainBuilder.GetRandomNumber(3, "Random Temperature- Lua");
	end
	
	plotTypes = GeneratePlotTypes();
	local BBS_temp = false;
	if (GameConfiguration.GetValue("BBStemp") ~= nil) then 
		if (GameConfiguration.GetValue("BBStemp") == true) then
			BBS_temp = true;
			print ("BBS Temperature: On");
			terrainTypes = BBS_GenerateTerrainTypes(plotTypes, g_iW, g_iH, g_iFlags, false, temperature);
			else
			BBS_temp = false;
			terrainTypes = GenerateTerrainTypes(plotTypes, g_iW, g_iH, g_iFlags, false, temperature);
		end
		else
		BBS_temp = false;
		terrainTypes = GenerateTerrainTypes(plotTypes, g_iW, g_iH, g_iFlags, false, temperature);
	end				   
	ApplyBaseTerrain(plotTypes, terrainTypes, g_iW, g_iH);
	
	AreaBuilder.Recalculate();
	TerrainBuilder.AnalyzeChokepoints();

	-- Place polar ice by latitude so ConvertIceToSnow runs before StampContinents.
	local iceLat = 0.78;
	for x = 0, g_iW - 1 do
		for y = 0, g_iH - 1 do
			local lat = math.abs((g_iH / 2) - y) / (g_iH / 2);
			if lat >= iceLat then
				local plot = Map.GetPlot(x, y);
				if plot:IsWater() and TerrainBuilder.CanHaveFeature(plot, g_FEATURE_ICE) then
					TerrainBuilder.SetFeatureType(plot, g_FEATURE_ICE);
				end
			end
		end
	end
	ConvertIceToSnow();
	AreaBuilder.Recalculate();

	TerrainBuilder.StampContinents();
	
	-- Normalize continent sizes
	print("Starting continent normalization process...")
	NormalizeContinents(g_iW, g_iH)
	print("Continent normalization complete")
	
	-- Temp
	local iContinentBoundaryPlots = GetContinentBoundaryPlotCount(g_iW, g_iH);
	local biggest_area = Areas.FindBiggestArea(false);
	print("After Adding Hills: ", biggest_area:GetPlotCount());
	if (MapConfiguration.GetValue("BBSRidge") ~= 1) then
		print("Adding Ridges");
		AddTerrainFromContinents(plotTypes, terrainTypes, 5, g_iW, g_iH, iContinentBoundaryPlots);
	end	
	AreaBuilder.Recalculate();

	-- River generation is affected by plot types, originating from highlands and preferring to traverse lowlands.
	for x = 0, g_iW - 1 do
		for y = 0, g_iH - 1 do
			local i = y * g_iW + x; -- C++ Plot indices, starting at 0.
			g_riverPlots[i] = 0;
		end
	end
	
	-- Rivers from coastline.
	AddRivers();

	-- Standard large lakes, then flat-only small lake passes.
	-- AddFlatLakes skips hills and mountains, preserving the highlands character.
	local numLargeLakes = math.ceil(GameInfo.Maps[Map.GetMapSize()].Continents / 2);
	-- AddLakes' large lake can reach 7 tiles; Tiny and Small keep lakes at WATER_MAX_LAKE_TILES or fewer.
	if UseWaterReshape() then
		numLargeLakes = 0;
	end
	AddLakes(numLargeLakes);
	AddFlatLakes(4);
	AreaBuilder.Recalculate();

	AddFeatures();
	TerrainBuilder.AnalyzeChokepoints();
	
	print("Adding cliffs");
	AddCliffs(plotTypes, terrainTypes);

	local args = {
		numberToPlace = GameInfo.Maps[Map.GetMapSize()].NumNaturalWonders,
	};
	local nwGen = BBS_NaturalWonderGenerator.Create(args);

	AddFeaturesFromContinents();
	MarkCoastalLowlands();

	local iContinentBoundaryPlots = GetContinentBoundaryPlotCount(g_iW, g_iH);

	AreaBuilder.Recalculate();
	
	resourcesConfig = MapConfiguration.GetValue("resources");
	local startConfig = MapConfiguration.GetValue("start");-- Get the start config
	local args = {
		resources = resourcesConfig,
		START_CONFIG = startConfig,
	};
	local resGen =  BBS_ResourceGenerator.Create(args);
   
   if (MapConfiguration.GetValue("BBSRidge") == 1) then
		AddVolcanos(plotTypes, 5,g_iW, g_iH)
	end

	print("Creating start plot database.");
	
	-- START_MIN_Y and START_MAX_Y is the percent of the map ignored for major civs' starting positions.
	local args = {
		MIN_MAJOR_CIV_FERTILITY = 150,
		MIN_MINOR_CIV_FERTILITY = 50, 
		MIN_BARBARIAN_FERTILITY = 1,
		START_MIN_Y = 5,
		START_MAX_Y = 5,
		START_CONFIG = startConfig,
	};
	local start_plot_database = BBS_Assign(args)

	local GoodyGen = AddGoodiesBBM(g_iW, g_iH);
	AreaBuilder.Recalculate();
	TerrainBuilder.AnalyzeChokepoints();	
end

-------------------------------------------------------------------------------
function GeneratePlotTypes()
	print("Generating Plot Types");
	local plotTypes = {};
	local plotTypes = table.fill(g_PLOT_TYPE_LAND, g_iW * g_iH);
	
	g_iW, g_iH = Map.GetGridSize();
	g_iFlags = TerrainBuilder.GetFractalFlags();
	
	
	-- Use Standard's PlateValue (4): our grid is 84x54 (Standard dimensions) even though
	-- Map.GetMapSize() returns Large. Large's PlateValue=5 (grain=6) produces a coarser
	-- fractal with fewer hills, so we match the original rich_highlands_xp2 behaviour.
	local numPlates = 4;

	local grain = numPlates + 1;
	
	local mountains = 75;
   
   local hills = 43;
   
   local world_age = MapConfiguration.GetValue("world_age");
	if (world_age == 1) then --new
		hills = 43
	elseif (world_age == 2) then --standard
		hills = 54
	elseif (world_age == 3) then -- old
		hills = 58
	else
		hills = 43 + TerrainBuilder.GetRandomNumber(15, "Random World Age - Lua");
	end
   
	
	local lakes = 15;
	local lake_grain = 4;
	
	local fracFlags = {};
	
	if(invert_heights) then
		fracFlags.FRAC_INVERT_HEIGHTS = true;
	end
	
	if(polar) then
		fracFlags.FRAC_POLAR = true;
	end
	
	local terrainFrac = Fractal.Create(g_iW, g_iH, grain, fracFlags, 6, 5);
	local lakesFrac = Fractal.Create(g_iW, g_iH, lake_grain, fracFlags, 6, 5);
	local mountain_passFrac = Fractal.Create(g_iW, g_iH, grain, fracFlags, 6, 5);
	
	local iLakesThreshold = lakesFrac:GetHeight(100 - lakes);
	local iHillsThreshold = terrainFrac:GetHeight(hills);
	local iMountainsThreshold = terrainFrac:GetHeight(mountains);

	local iPassThreshold = mountain_passFrac:GetHeight(85);
	
	mountain_passFrac:BuildRidges(numPlates, {}, 1, 2);
	
	for x = 0, g_iW - 1, 1 do
		for y = 0, g_iH - 1, 1 do
			local i = y*g_iW + x + 1;
			local lakeVal = lakesFrac:GetHeight(x,y);
			local val = terrainFrac:GetHeight(x,y);
			
			if lakeVal >= iLakesThreshold then
				plotTypes[i] = g_PLOT_TYPE_OCEAN;
			elseif val >= iMountainsThreshold then
				local passVal = mountain_passFrac:GetHeight(x,y);
				if passVal >= iPassThreshold then
					plotTypes[i] = g_PLOT_TYPE_HILLS;
				else
					plotTypes[i] = g_PLOT_TYPE_MOUNTAIN;
				end
			elseif val >= iHillsThreshold and val < iMountainsThreshold then
				plotTypes[i] = g_PLOT_TYPE_HILLS;
			else
				plotTypes[i] = g_PLOT_TYPE_LAND;
			end
		end
	end
	
	if UseWaterReshape() then
		-- Land type a removed water tile gets, using the same thresholds as the loop above.
		ReshapeTinyWater(plotTypes, function(x, y)
			local val = terrainFrac:GetHeight(x, y);
			if val >= iMountainsThreshold then
				if mountain_passFrac:GetHeight(x, y) >= iPassThreshold then
					return g_PLOT_TYPE_HILLS;
				end
				return g_PLOT_TYPE_MOUNTAIN;
			elseif val >= iHillsThreshold then
				return g_PLOT_TYPE_HILLS;
			end
			return g_PLOT_TYPE_LAND;
		end);
	end

	AreaBuilder.Recalculate();
	
	return plotTypes;
end

-- Works on plotTypes before terrain is generated. Water bodies are connected groups of ocean plots
-- (all water at this stage is the lake fractal). Tiles of a body are kept in breadth-first order, so
-- any prefix of the list is still connected.
function ReshapeTinyWater(plotTypes, landTypeAt)
	local iW, iH = Map.GetGridSize();
	local seaBodyTarget = GetWaterSeaBodies();

	local function idx(x, y)
		return y * iW + x + 1;
	end

	local function isWater(x, y)
		return plotTypes[idx(x, y)] == g_PLOT_TYPE_OCEAN;
	end

	local function neighbors(x, y)
		local list = {};
		for dir = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
			local p = Map.GetAdjacentPlot(x, y, dir);
			if p ~= nil then
				table.insert(list, {x = p:GetX(), y = p:GetY()});
			end
		end
		return list;
	end

	local bodyOf = {}; -- plot index -> body number
	local bodies = {};
	for x = 0, iW - 1 do
		for y = 0, iH - 1 do
			if isWater(x, y) and bodyOf[idx(x, y)] == nil then
				local n = #bodies + 1;
				local tiles = {};
				local queue = {{x = x, y = y}};
				bodyOf[idx(x, y)] = n;
				local head = 1;
				while head <= #queue do
					local t = queue[head];
					head = head + 1;
					table.insert(tiles, t);
					for _, nb in ipairs(neighbors(t.x, t.y)) do
						if isWater(nb.x, nb.y) and bodyOf[idx(nb.x, nb.y)] == nil then
							bodyOf[idx(nb.x, nb.y)] = n;
							table.insert(queue, nb);
						end
					end
				end
				bodies[n] = {n = n, tiles = tiles, kind = "lake"};
			end
		end
	end

	-- Latitude 0 = equator, 1 = pole. Water near the poles turns to ice and then tundra (ConvertIceToSnow),
	-- and nobody starts there, so only bodies in the middle band count as usable coast.
	local function latitude(y)
		return math.abs(iH / 2 - y) / (iH / 2);
	end

	local function inSeaBand(tiles)
		for _, t in ipairs(tiles) do
			if latitude(t.y) > WATER_SEA_MAX_LAT then
				return false;
			end
		end
		return true;
	end

	local seas = {};
	local polarBodies = 0;
	for _, b in ipairs(bodies) do
		if #b.tiles >= WATER_SEA_MIN_TILES then
			if inSeaBand(b.tiles) then
				b.kind = "sea";
				table.insert(seas, b);
			else
				b.kind = "polar"; -- big, but out of the band: left as it is, not counted
				polarBodies = polarBodies + 1;
			end
		end
	end
	local naturalSeas = #seas;

	local function bodyDistance(tilesA, tilesB)
		local best = 1000;
		for _, a in ipairs(tilesA) do
			for _, b in ipairs(tilesB) do
				local d = Map.GetPlotDistance(a.x, a.y, b.x, b.y);
				if d < best then
					best = d;
				end
			end
		end
		return best;
	end

	local function farFromSeas(tiles)
		for _, s in ipairs(seas) do
			if bodyDistance(tiles, s.tiles) < WATER_SEA_SPACING then
				return false;
			end
		end
		return true;
	end

	-- Adds land tiles next to the body, preferring tiles that touch it most, and never tiles that touch
	-- another water body (that would merge them).
	local function growBody(body, targetSize)
		while #body.tiles < targetSize do
			local best = nil;
			local bestScore = -1;
			local seen = {};
			for _, t in ipairs(body.tiles) do
				for _, nb in ipairs(neighbors(t.x, t.y)) do
					local k = idx(nb.x, nb.y);
					if not seen[k] and not isWater(nb.x, nb.y) and latitude(nb.y) <= WATER_SEA_MAX_LAT then
						seen[k] = true;
						local ok = true;
						local contact = 0;
						for _, nn in ipairs(neighbors(nb.x, nb.y)) do
							if isWater(nn.x, nn.y) then
								if bodyOf[idx(nn.x, nn.y)] == body.n then
									contact = contact + 1;
								else
									ok = false;
								end
							end
						end
						if ok then
							local score = contact * 10 + TerrainBuilder.GetRandomNumber(10, "Water reshape grow");
							if score > bestScore then
								best = nb;
								bestScore = score;
							end
						end
					end
				end
			end
			if best == nil then
				return;
			end
			plotTypes[idx(best.x, best.y)] = g_PLOT_TYPE_OCEAN;
			bodyOf[idx(best.x, best.y)] = body.n;
			table.insert(body.tiles, best);
		end
	end

	-- Starts a new body on land, as far as possible from the existing seas.
	local function seedNewSea()
		local best = nil;
		local bestScore = -1;
		for x = WATER_SEA_MARGIN, iW - 1 - WATER_SEA_MARGIN do
			for y = WATER_SEA_MARGIN, iH - 1 - WATER_SEA_MARGIN do
				if latitude(y) <= WATER_SEA_MAX_LAT and not isWater(x, y) then
					local touching = false;
					for _, nb in ipairs(neighbors(x, y)) do
						if isWater(nb.x, nb.y) then
							touching = true;
						end
					end
					if not touching then
						local minD = 30;
						for _, s in ipairs(seas) do
							for _, t in ipairs(s.tiles) do
								local d = Map.GetPlotDistance(x, y, t.x, t.y);
								if d < minD then
									minD = d;
								end
							end
						end
						local score = minD * 10 + TerrainBuilder.GetRandomNumber(10, "Water reshape seed");
						if score > bestScore then
							best = {x = x, y = y};
							bestScore = score;
						end
					end
				end
			end
		end
		if best == nil then
			return nil;
		end
		local n = #bodies + 1;
		plotTypes[idx(best.x, best.y)] = g_PLOT_TYPE_OCEAN;
		bodyOf[idx(best.x, best.y)] = n;
		local body = {n = n, tiles = {best}, kind = "lake"};
		bodies[n] = body;
		growBody(body, WATER_SEA_TARGET_TILES);
		return body;
	end

	-- Promote the biggest existing bodies that are far enough from the seas chosen so far.
	local candidates = {};
	for _, b in ipairs(bodies) do
		if b.kind == "lake" and inSeaBand(b.tiles) then
			table.insert(candidates, b);
		end
	end
	table.sort(candidates, function(a, b)
		if #a.tiles ~= #b.tiles then
			return #a.tiles > #b.tiles;
		end
		return a.n < b.n;
	end);
	for _, b in ipairs(candidates) do
		if #seas >= seaBodyTarget then
			break
		end
		if farFromSeas(b.tiles) then
			growBody(b, WATER_SEA_TARGET_TILES);
			if #b.tiles >= WATER_SEA_MIN_TILES then
				b.kind = "sea";
				table.insert(seas, b);
			end
		end
	end

	-- Not enough suitable bodies: carve new ones.
	local attempts = 0;
	while #seas < seaBodyTarget and attempts < 6 do
		attempts = attempts + 1;
		local b = seedNewSea();
		if b == nil then
			break
		end
		if #b.tiles >= WATER_SEA_MIN_TILES then
			b.kind = "sea";
			table.insert(seas, b);
		end
	end

	-- Everything that is not a sea is a lake: keep a connected core of at most WATER_MAX_LAKE_TILES.
	local lakesKept = 0;
	local tilesRemoved = 0;
	for _, b in ipairs(bodies) do
		if b.kind == "lake" then
			lakesKept = lakesKept + 1;
			for i = WATER_MAX_LAKE_TILES + 1, #b.tiles do
				local t = b.tiles[i];
				plotTypes[idx(t.x, t.y)] = landTypeAt(t.x, t.y);
				tilesRemoved = tilesRemoved + 1;
			end
		end
	end

	local seaSizes = {};
	for _, s in ipairs(seas) do
		table.insert(seaSizes, #s.tiles);
	end
	print("Water reshape: " .. #seas .. " sea bodies (" .. naturalSeas .. " natural), sizes " .. table.concat(seaSizes, ",")
		.. "; " .. lakesKept .. " lakes kept at <= " .. WATER_MAX_LAKE_TILES .. " tiles, " .. tilesRemoved .. " water tiles removed; "
		.. polarBodies .. " big polar bodies left alone");
end

function AddFeatures()
	print("Adding Features");

	-- Get Rainfall setting input by user.
	local rainfall = MapConfiguration.GetValue("rainfall");
	if rainfall == 4 then
		rainfall = 1 + TerrainBuilder.GetRandomNumber(3, "Random Rainfall - Lua");
	end
	
	local args = {rainfall = rainfall}
	featuregen = BBM_FeatureGenerator.Create(args);
	featuregen:AddFeatures(true, false);  --second parameter is whether or not rivers start inland);
end

function AddFeaturesFromContinents()
	print("Adding Features from Continents");

	featuregen:AddFeaturesFromContinents();
end

function AddFlatLakes(numPasses)
	local iW, iH = Map.GetGridSize();
	local lakePlotRand = GlobalParameters.LAKE_PLOT_RANDOM or 25;

	for pass = 1, numPasses do
		for i = 0, (iW * iH) - 1, 1 do
			local plot = Map.GetPlotByIndex(i);
			if plot ~= nil
				and not plot:IsWater()
				and not plot:IsHills()
				and not plot:IsMountain()
				and not plot:IsCoastalLand()
				and not plot:IsRiver()
				and not AdjacentToNaturalWonder(plot) then
				if TerrainBuilder.GetRandomNumber(lakePlotRand, "AddFlatLakes") == 0 then
					TerrainBuilder.SetTerrainType(plot, g_TERRAIN_TYPE_COAST);
				end
			end
		end
	end
end

function ConvertIceToSnow()
	local iW, iH = Map.GetGridSize();
	local count = 0;
	for x = 0, iW - 1 do
		for y = 0, iH - 1 do
			local plot = Map.GetPlot(x, y);
			if plot:GetFeatureType() == g_FEATURE_ICE and plot:IsWater() then
				-- Skip if a river terminates here; converting to land would make it invisible in 3D.
				local adjRiver = false;
				for dir = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1 do
					local adj = Map.GetAdjacentPlot(x, y, dir);
					if adj ~= nil and not adj:IsWater() and adj:IsRiver() then
						adjRiver = true;
						break;
					end
				end
				if not adjRiver then
					TerrainBuilder.SetFeatureType(plot, g_FEATURE_NONE);
					-- 60% tundra hills, 40% flat tundra
					if TerrainBuilder.GetRandomNumber(10, "IceToTundra") < 6 then
						TerrainBuilder.SetTerrainType(plot, g_TERRAIN_TYPE_TUNDRA_HILLS);
					else
						TerrainBuilder.SetTerrainType(plot, g_TERRAIN_TYPE_TUNDRA);
					end
					count = count + 1;
				end
			end
		end
	end
	print("ConvertIceToSnow: converted " .. count .. " tiles to tundra");
end

function GetRiverValueAtPlot(plot)

	if(plot:IsNWOfCliff() or plot:IsWOfCliff() or plot:IsNEOfCliff()) then
		return 1000;
	elseif(plot:IsNaturalWonder() or AdjacentToNaturalWonder(plot)) then
		return 1000;
	end

	local sum = GetPlotElevation(plot) * 20;

	local numDirections = DirectionTypes.NUM_DIRECTION_TYPES;
	for direction = 0, numDirections - 1, 1 do

		local adjacentPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), direction);

		if (adjacentPlot ~= nil) then
			sum = sum + GetPlotElevation(adjacentPlot);	
		else
			sum = 1000;  -- Prevent running off the map
		end
		
	end

	sum = sum + TerrainBuilder.GetRandomNumber(10, "River Rand");

	return sum;
end

function DoRiverReverse(startPlot, thisFlowDirection, originalFlowDirection, minLength, curLength, iRiverID)	

	print ("Creating River at: " .. tostring(startPlot:GetX()) .. ", ".. tostring(startPlot:GetY()));

	thisFlowDirection = thisFlowDirection or FlowDirectionTypes.NO_FLOWDIRECTION;
	originalFlowDirection = originalFlowDirection or FlowDirectionTypes.NO_FLOWDIRECTION;

	print ("thisFlowDirection: " .. tostring(thisFlowDirection));
	print ("originalFlowDirection: " .. tostring(originalFlowDirection));
	print ("minLength: " .. tostring(minLength));
	print ("curLength: " .. tostring(curLength));
	print ("iRiverID: " .. tostring(iRiverID));

	-- pStartPlot = the plot at whose SE corner the river is starting
	local riverPlot;
		
	local bestFlowDirection = FlowDirectionTypes.NO_FLOWDIRECTION;
	if (thisFlowDirection == FlowDirectionTypes.FLOWDIRECTION_NORTH) then

		riverPlot = Map.GetAdjacentPlot(startPlot:GetX(), startPlot:GetY(), DirectionTypes.DIRECTION_SOUTHWEST);
		if (riverPlot == nil) then
			return;
		end
			
		local adjacentPlot = Map.GetAdjacentPlot(riverPlot:GetX(), riverPlot:GetY(), DirectionTypes.DIRECTION_EAST);
		if (adjacentPlot == nil or riverPlot:IsWOfRiver() or riverPlot:IsWater() or adjacentPlot:IsWater()) then
			if (riverPlot:IsWater()) then
				TerrainBuilder.SetWOfRiver(riverPlot, true, thisFlowDirection, iRiverID);	    
			end
			return;
		end
			
		TerrainBuilder.SetWOfRiver(riverPlot, true, thisFlowDirection, iRiverID);
		-- riverPlot does not change
		if (riverPlot == nil) then
			return;
		end
		print ("At (x,y) SetWOfRiver, flowDirection = ", riverPlot:GetX(), riverPlot:GetY(), thisFlowDirection);
			
	elseif (thisFlowDirection == FlowDirectionTypes.FLOWDIRECTION_NORTHEAST) then
		
		riverPlot = startPlot;
		local adjacentPlot = Map.GetAdjacentPlot(riverPlot:GetX(), riverPlot:GetY(), DirectionTypes.DIRECTION_SOUTHEAST);
		if (adjacentPlot == nil or riverPlot:IsNWOfRiver() or riverPlot:IsWater() or adjacentPlot:IsWater()) then
			if (riverPlot:IsWater()) then
				TerrainBuilder.SetNWOfRiver(riverPlot, true, thisFlowDirection, iRiverID);	    
			end
			return;
		end
			
		TerrainBuilder.SetNWOfRiver(riverPlot, true, thisFlowDirection, iRiverID);
		-- riverPlot does not change
		if (riverPlot == nil) then
			return;
		end
		print ("At (x,y) SetNWOfRiver, flowDirection = ", riverPlot:GetX(), riverPlot:GetY(), thisFlowDirection);
		
	elseif (thisFlowDirection == FlowDirectionTypes.FLOWDIRECTION_SOUTHEAST) then
		
		riverPlot = startPlot;
		local adjacentPlot = Map.GetAdjacentPlot(riverPlot:GetX(), riverPlot:GetY(), DirectionTypes.DIRECTION_SOUTHWEST);
		if (adjacentPlot == nil or riverPlot:IsNEOfRiver() or riverPlot:IsWater() or adjacentPlot:IsWater()) then
			if (riverPlot:IsWater()) then
					TerrainBuilder.SetNEOfRiver(riverPlot, true, thisFlowDirection, iRiverID);	    
			end
			return;
		end

		TerrainBuilder.SetNEOfRiver(riverPlot, true, thisFlowDirection, iRiverID);
		riverPlot = Map.GetAdjacentPlot(riverPlot:GetX(), riverPlot:GetY(), DirectionTypes.DIRECTION_WEST);
		if (riverPlot == nil) then
			return;
		end
		print ("At (x,y) SetNEOfRiver, flowDirection = ", riverPlot:GetX(), riverPlot:GetY(), thisFlowDirection);
		
	elseif (thisFlowDirection == FlowDirectionTypes.FLOWDIRECTION_SOUTH) then
		
		riverPlot = startPlot;
		local adjacentPlot = Map.GetAdjacentPlot(riverPlot:GetX(), riverPlot:GetY(), DirectionTypes.DIRECTION_EAST);
		if (adjacentPlot == nil or riverPlot:IsWOfRiver() or riverPlot:IsWater() or adjacentPlot:IsWater() ) then
			if (riverPlot:IsWater()) then
				TerrainBuilder.SetWOfRiver(riverPlot, true, thisFlowDirection, iRiverID);	    
			end
			return;
		end

		TerrainBuilder.SetWOfRiver(riverPlot, true, thisFlowDirection, iRiverID);
		riverPlot = Map.GetAdjacentPlot(riverPlot:GetX(), riverPlot:GetY(), DirectionTypes.DIRECTION_NORTHEAST);
		if (riverPlot == nil) then
			return;
		end
		print ("At (x,y) SetWOfRiver, flowDirection = ", riverPlot:GetX(), riverPlot:GetY(), thisFlowDirection);
		
	elseif (thisFlowDirection == FlowDirectionTypes.FLOWDIRECTION_SOUTHWEST) then

		riverPlot = startPlot;
		local adjacentPlot = Map.GetAdjacentPlot(riverPlot:GetX(), riverPlot:GetY(), DirectionTypes.DIRECTION_SOUTHEAST);
		if (adjacentPlot == nil or riverPlot:IsNWOfRiver() or riverPlot:IsWater() or adjacentPlot:IsWater() ) then
			if (riverPlot:IsWater()) then
				TerrainBuilder.SetNWOfRiver(riverPlot, true, thisFlowDirection, iRiverID);	    
			end
				return;
		end

		TerrainBuilder.SetNWOfRiver(riverPlot, true, thisFlowDirection, iRiverID);
		-- riverPlot does not change
		if (riverPlot == nil) then
			return;
		end
		print ("At (x,y) SetNWOfRiver, flowDirection = ", riverPlot:GetX(), riverPlot:GetY(), thisFlowDirection);

	elseif (thisFlowDirection == FlowDirectionTypes.FLOWDIRECTION_NORTHWEST) then
			
		riverPlot = Map.GetAdjacentPlot(startPlot:GetX(), startPlot:GetY(), DirectionTypes.DIRECTION_EAST);
		if (riverPlot == nil) then
			return;
		end
			
		local adjacentPlot = Map.GetAdjacentPlot(riverPlot:GetX(), riverPlot:GetY(), DirectionTypes.DIRECTION_SOUTHWEST);
		if (adjacentPlot == nil or riverPlot:IsNEOfRiver() or riverPlot:IsWater() or adjacentPlot:IsWater()) then
			if (riverPlot:IsWater()) then
				TerrainBuilder.SetNEOfRiver(riverPlot, true, thisFlowDirection, iRiverID);	    
			end
			return;
		end

		TerrainBuilder.SetNEOfRiver(riverPlot, true, thisFlowDirection, iRiverID, iRiverID);
		-- riverPlot does not change
		if (riverPlot == nil) then
			return;
		end
		print ("At (x,y) SetNEOfRiver, flowDirection = ", riverPlot:GetX(), riverPlot:GetY(), thisFlowDirection);
		
	else
		-- River is starting here, set the direction in the next step
		riverPlot = startPlot;		
	end

	if (IsAdjacentRiver(riverPlot, iRiverID) 
		    or (IsAdjacentMountain(riverPlot) and curLength > minLength) 
		    or (curLength > minLength * 1.5)) then
			
		-- The river has flowed off into a lake or another river, next to a mountain (having met minimum distance), or equalled min length +50%.  We are done.
		print ("DoRiverReverse() success");
		return; 
	end

	-- Storing X,Y positions as locals to prevent redundant function calls.
	local riverPlotX = riverPlot:GetX();
	local riverPlotY = riverPlot:GetY();
		
	print ("River Plot now (x, y): ", riverPlotX, riverPlotY);
		
	-- Mark this plot as having a river so we don't come here again
	local iMapIndex = riverPlotY * g_iW + riverPlotX;
	g_riverPlots[iMapIndex] = iRiverID;
		
	-- Table of methods used to determine the adjacent plot.
	local adjacentPlotFunctions = {
		[FlowDirectionTypes.FLOWDIRECTION_NORTH] = function() 
			return Map.GetAdjacentPlot(riverPlotX, riverPlotY, DirectionTypes.DIRECTION_NORTHWEST); 
		end,
		
		[FlowDirectionTypes.FLOWDIRECTION_NORTHEAST] = function() 
			return Map.GetAdjacentPlot(riverPlotX, riverPlotY, DirectionTypes.DIRECTION_NORTHEAST);
		end,
		
		[FlowDirectionTypes.FLOWDIRECTION_SOUTHEAST] = function() 
			return Map.GetAdjacentPlot(riverPlotX, riverPlotY, DirectionTypes.DIRECTION_EAST);
		end,
		
		[FlowDirectionTypes.FLOWDIRECTION_SOUTH] = function() 
			return Map.GetAdjacentPlot(riverPlotX, riverPlotY, DirectionTypes.DIRECTION_SOUTHWEST);
		end,
		
		[FlowDirectionTypes.FLOWDIRECTION_SOUTHWEST] = function() 
			return Map.GetAdjacentPlot(riverPlotX, riverPlotY, DirectionTypes.DIRECTION_WEST);
		end,
		
		[FlowDirectionTypes.FLOWDIRECTION_NORTHWEST] = function() 
			return Map.GetAdjacentPlot(riverPlotX, riverPlotY, DirectionTypes.DIRECTION_NORTHWEST);
		end	
	}
		
	if(bestFlowDirection == FlowDirectionTypes.NO_FLOWDIRECTION) then

		-- Attempt to calculate the best flow direction.
		local bestValue = math.huge;
		for flowDirection, getAdjacentPlot in pairs(adjacentPlotFunctions) do
				
			if (GetOppositeFlowDirection(flowDirection) ~= originalFlowDirection) then
					
				if (thisFlowDirection == FlowDirectionTypes.NO_FLOWDIRECTION or
					flowDirection == TurnRightFlowDirections[thisFlowDirection] or 
					flowDirection == TurnLeftFlowDirections[thisFlowDirection]) then
					
					local adjacentPlot = getAdjacentPlot();

					if (adjacentPlot ~= nil) then

						local value = GetRiverValueAtPlot(adjacentPlot);
						if (flowDirection == originalFlowDirection) then
							value = value / 4;
						end
							
						if (value < bestValue) then
							bestValue = value;
							bestFlowDirection = flowDirection;
						end
					end
				end
			end
		end
			
		if(bestFlowDirection == FlowDirectionTypes.NO_FLOWDIRECTION) then
		
			-- Patch river to north edge of map if can't flow off there normally
			if (originalFlowDirection == FlowDirectionTypes.FLOWDIRECTION_NORTHEAST) then
				TerrainBuilder.SetNWOfRiver(riverPlot, true, FlowDirectionTypes.FLOWDIRECTION_NORTHEAST, riverID);
				TerrainBuilder.SetWOfRiver(riverPlot, true, FlowDirectionTypes.FLOWDIRECTION_NORTH, riverID);
				print ("*** NORTH EDGE OF MAP RIVER REPAIR ***");
			end
		end
	end
		
		--Recursively generate river.
	if (bestFlowDirection ~= FlowDirectionTypes.NO_FLOWDIRECTION) then
		DoRiverReverse(riverPlot, bestFlowDirection, originalFlowDirection, minLength, curLength +1, iRiverID);
	end
end

function IsAdjacentRiver(pPlot, iRiverID)			
	local adjacentPlot;	
	local numDirections = DirectionTypes.NUM_DIRECTION_TYPES;
	for direction = 0, numDirections - 1, 1 do
		adjacentPlot = Map.GetAdjacentPlot(pPlot:GetX(), pPlot:GetY(), direction);
		if (adjacentPlot ~= nil) then
	   		local i = adjacentPlot:GetY() * g_iW + adjacentPlot:GetX();
			if (g_riverPlots[i] > 0 and iRiverID ~= g_riverPlots[i]) then
				return true;
			end
		end
	end
	return false;
end

function IsAdjacentMountain(pPlot)			
	local adjacentPlot;	
	local numDirections = DirectionTypes.NUM_DIRECTION_TYPES;
	for direction = 0, numDirections - 1, 1 do
		adjacentPlot = Map.GetAdjacentPlot(pPlot:GetX(), pPlot:GetY(), direction);
		if (adjacentPlot ~= nil) then
	   		local i = adjacentPlot:GetY() * g_iW + adjacentPlot:GetX();
			if (plotTypes[i] == g_PLOT_TYPE_MOUNTAIN) then
				return true;
			end
		end
	end
	return false;
end

function NotCloseToAnotherRiver(pStartPlot)
	
	-- Set to 0 so only duplicate starts at the exact same plot are blocked.
	local iNotAllowedAsCloseAs = 0;

	local iPlotIndex = pStartPlot:GetIndex();
	for i, riverPlotIndex in ipairs(g_riverStartPlots) do
		if (Map.GetPlotDistance(iPlotIndex, riverPlotIndex) <= iNotAllowedAsCloseAs) then
		    return false;
		end
	end

	return true;
end

function TryStartRiver(pStartPlot, directionIntoSea)

	local iW, iH = Map.GetGridSize();

	-- Check N/S flow direction for match
	if (pStartPlot:GetX() < iW / 2) then
		-- Should flow south
		if (directionIntoSea == FlowDirectionTypes.FLOWDIRECTION_NORTHEAST or directionIntoSea == FlowDirectionTypes.FLOWDIRECTION_NORTH or directionIntoSea == FlowDirectionTypes.FLOWDIRECTION_NORTHWEST) then
			return;
		end
	else
		-- Should flow north
		if (directionIntoSea == FlowDirectionTypes.FLOWDIRECTION_SOUTHEAST or directionIntoSea == FlowDirectionTypes.FLOWDIRECTION_SOUTH or directionIntoSea == FlowDirectionTypes.FLOWDIRECTION_SOUTHWEST) then
			return;
		end
	end
	if (pStartPlot:GetY() < iH / 2) then
		-- Should flow west
		if (directionIntoSea == FlowDirectionTypes.FLOWDIRECTION_NORTHEAST or directionIntoSea == FlowDirectionTypes.FLOWDIRECTION_SOUTHEAST) then
			return;
		end
	else
		-- Should flow east
		if (directionIntoSea == FlowDirectionTypes.FLOWDIRECTION_NORTHWEST or directionIntoSea == FlowDirectionTypes.FLOWDIRECTION_SOUTHWEST) then
			return;
		end
	end

	if NotCloseToAnotherRiver(pStartPlot) and not IsAdjacentMountain(pStartPlot) then
		table.insert(g_riverStartPlots, pStartPlot:GetIndex());

		local current_direction;
		local iRand = TerrainBuilder.GetRandomNumber (2, "River First Turn Rand");

		if     (directionIntoSea == FlowDirectionTypes.FLOWDIRECTION_NORTHEAST) then
			TerrainBuilder.SetNWOfRiver(pStartPlot, true, directionIntoSea, g_iRiverID);
			current_direction = FlowDirectionTypes.FLOWDIRECTION_NORTH;
			if (iRand == 1) then 
				current_direction = FlowDirectionTypes.FLOWDIRECTION_SOUTHEAST;
			end
			
		elseif (directionIntoSea == FlowDirectionTypes.FLOWDIRECTION_SOUTHEAST) then
			TerrainBuilder.SetNEOfRiver(pStartPlot, true, directionIntoSea, g_iRiverID);
			local pWPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), DirectionTypes.DIRECTION_WEST);
			pStartPlot = pWPlot;
			current_direction = FlowDirectionTypes.FLOWDIRECTION_SOUTH; 
			if (iRand == 1) then 
				current_direction = FlowDirectionTypes.FLOWDIRECTION_NORTHEAST; 
			end

		elseif (directionIntoSea == FlowDirectionTypes.FLOWDIRECTION_SOUTH) then
			local pWPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), DirectionTypes.DIRECTION_WEST);
			TerrainBuilder.SetWOfRiver(pWPlot, true, directionIntoSea, g_iRiverID);
			local pNWPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), DirectionTypes.DIRECTION_NORTHWEST);
			pStartPlot = pNWPlot;
			current_direction = FlowDirectionTypes.FLOWDIRECTION_SOUTHWEST;
			if (iRand == 1) then 
				current_direction = FlowDirectionTypes.FLOWDIRECTION_SOUTHEAST; 
			end

		elseif (directionIntoSea == FlowDirectionTypes.FLOWDIRECTION_SOUTHWEST) then
			local pNWPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), DirectionTypes.DIRECTION_NORTHWEST);
			TerrainBuilder.SetNWOfRiver(pNWPlot, true, directionIntoSea, g_iRiverID);
			pStartPlot = pNWPlot;
			current_direction = FlowDirectionTypes.FLOWDIRECTION_SOUTH;
			if (iRand == 1) then 
				current_direction = FlowDirectionTypes.FLOWDIRECTION_NORTHWEST;
			end

		elseif (directionIntoSea == FlowDirectionTypes.FLOWDIRECTION_NORTHWEST) then
			local pNEPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), DirectionTypes.DIRECTION_NORTHEAST);
			TerrainBuilder.SetNEOfRiver(pNEPlot, true, directionIntoSea, g_iRiverID);
			pStartPlot = pNEPlot;
			current_direction = FlowDirectionTypes.FLOWDIRECTION_SOUTHWEST;
			if (iRand == 1) then 
				current_direction = FlowDirectionTypes.FLOWDIRECTION_NORTH;
			end

		elseif (directionIntoSea == FlowDirectionTypes.FLOWDIRECTION_NORTH) then
			TerrainBuilder.SetWOfRiver(pStartPlot, true, directionIntoSea, g_iRiverID);
			current_direction = FlowDirectionTypes.FLOWDIRECTION_NORTHWEST;
			if (iRand == 1) then 
				current_direction = FlowDirectionTypes.FLOWDIRECTION_NORTHEAST; 
			end
		end

		DoRiverReverse(pStartPlot, current_direction, directionIntoSea, 8 + (Map.GetMapSize() * 5), 1, g_iRiverID);
		
		g_iRiverID = g_iRiverID + 1;
	end
end

function AddRivers()

	-- Coverage-based passes only: no unconditional pass avoids invisible rivers from
	-- landlocked mountains that have no path to the sea.
	-- Higher plotsPerRiverEdge = fewer rivers per land area.
	local riverSourceRangeDefault = GlobalParameters.RIVER_SOURCE_RANGE_DEFAULT or 4;
	local seaWaterRangeDefault = 3;
	local plotsPerRiverEdge = 1;

	print("Map Generation - Adding Rivers");

	local passConditions = {
		-- Pass 1: hills only (not mountains - surrounded mountains produce invisible dead-end rivers).
		function(plot)
			local area = plot:GetArea();
			return plot:IsHills() and (area:GetRiverEdgeCount() < ((area:GetPlotCount() / plotsPerRiverEdge) + 1));
		end,

		-- Pass 2: all land, fills areas that have no hills.
		function(plot)
			local area = plot:GetArea();
			return (area:GetRiverEdgeCount() < (area:GetPlotCount() / plotsPerRiverEdge) + 1);
		end
	}

	for iPass, passCondition in ipairs(passConditions) do

		local riverSourceRange = 2.8;  -- was 2.8; higher = fewer river starts near existing water
		local seaWaterRange    = seaWaterRangeDefault / 4;

		local iW, iH = Map.GetGridSize();

		for i = 0, (iW * iH) - 1, 1 do
			plot = Map.GetPlotByIndex(i);
			if (not plot:IsWater()) then
				if (passCondition(plot) and plot:IsNaturalWonder() == false and AdjacentToNaturalWonder(plot) == false) then
					if (not Map.FindWater(plot, riverSourceRange, true)) then
						if (not Map.FindWater(plot, seaWaterRange, false)) then
							local inlandCorner = TerrainBuilder.GetInlandCorner(plot);
							if (inlandCorner ~= nil) then
								DoRiver(inlandCorner);
							end
						end
					end
				end
			end
		end
	end
end

function GetMapInitData(MapSize)
	local MapSizeTypes = {};
	local Width = 0;
	local Height = 0;
	local isWrap = MapConfiguration.GetValue("BBMWraparound") or 0
	for row in GameInfo.Maps() do
		if(MapSize == row.Hash) then
			Width = row.GridWidth;
			Height = row.GridHeight;
		end
	end

	-- Use one size smaller for grid dimensions, keeping continent count from the selected size.
	-- This keeps the map denser/more focused while retaining the correct number of continents.
	--   Tiny     → 54×34 (~459 tiles per player at 4 players, close to Large's ~454 at 10)
	--   Small    → 64×40 (~427 tiles per player at 6 players, same as Standard's ~426 at 8)
	--   Standard → Small   dimensions (74×46)
	--   Large    → Standard dimensions (84×54)  ← CPL 10-man FFA standard
	--   Huge     → Large   dimensions (96×60)
	-- Width and height must both be even numbers: odd dimensions bug the map wrap.
	local sizeDownMap = {
		MAPSIZE_TINY     = {W=54,  H=34},
		MAPSIZE_SMALL    = {W=64,  H=40},
		MAPSIZE_STANDARD = {W=74,  H=46},
		MAPSIZE_LARGE    = {W=84,  H=54},
		MAPSIZE_HUGE     = {W=96, H=60},
	};
	for sizeName, dims in pairs(sizeDownMap) do
		local sizeRow = GameInfo.Maps[sizeName];
		if sizeRow ~= nil and MapSize == sizeRow.Hash then
			Width  = dims.W;
			Height = dims.H;
			break;
		end
	end

	local WrapX = isWrap == 0 or isWrap == 1;

	return {Width = Width, Height = Height, WrapX = WrapX,}
end
