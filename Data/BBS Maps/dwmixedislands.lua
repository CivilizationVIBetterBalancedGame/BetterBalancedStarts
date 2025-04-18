------------------------------------------------------------------------------
--	FILE:	 DWMixedIslands.lua
--	AUTHOR:  EvilVictor (Seven05)
--	PURPOSE: Map script - Produces widely varied continents & islands.
------------------------------------------------------------------------------
--	Copyright (c) 2017 Firaxis Games, Inc. All rights reserved.
------------------------------------------------------------------------------

include "MapEnums"
include "DW_MapUtilities"
include "DW_MountainsCliffs"
include "DW_RiversLakes"
include "BBM_FeatureGenerator"
include "DW_TerrainGenerator"
include "BBS_NaturalWonderGenerator"
include "BBS_ResourceGenerator"
include "DW_CoastalLowlands"
include "AssignStartingPlots"
include "BBM_AssignStartingPlots";

local g_iW, g_iH;
local g_iFlags = {};
local g_continentsFrac = nil;
local featureGen = nil;
local world_age_new = 5;
local world_age_normal = 3;
local world_age_old = 2;

-------------------------------------------------------------------------------
function BBS_Assign(args)
	print("BBS_Assign: Injecting Spawn Placement")
	local start_plot_database = {};

	start_plot_database = BBM_AssignStartingPlots.Create(args)

	return start_plot_database
end
-------------------------------------------------------------------------------
function GenerateMap()
	print("Generating Mixed Island+ Map");
	local pPlot;

	-- Set globals
	g_iW, g_iH = Map.GetGridSize();
	g_iFlags = TerrainBuilder.GetFractalFlags();
	local temperature = MapConfiguration.GetValue("temperature"); -- Default setting is Temperate.
	if temperature == 4 then
		temperature  =  1 + TerrainBuilder.GetRandomNumber(3, "Random Temperature- Lua");
	end
	
	--	local world_age
	local world_age = MapConfiguration.GetValue("world_age");
	if (world_age == 1) then
		world_age = world_age_new;
	elseif (world_age == 2) then
		world_age = world_age_normal;
	elseif (world_age == 3) then
		world_age = world_age_old;
	else
		world_age = 2 + TerrainBuilder.GetRandomNumber(4, "Random World Age - Lua");
	end
	
	plotTypes = GeneratePlotTypes(world_age);
	terrainTypes = GenerateTerrainTypes(plotTypes, g_iW, g_iH, g_iFlags, false, temperature);
	ApplyBaseTerrain(plotTypes, terrainTypes, g_iW, g_iH);

	AreaBuilder.Recalculate();
	TerrainBuilder.AnalyzeChokepoints();
	TerrainBuilder.StampContinents();

	local iContinentBoundaryPlots = GetContinentBoundaryPlotCount(g_iW, g_iH);
	local biggest_area = Areas.FindBiggestArea(false);
	print("After Adding Hills: ", biggest_area:GetPlotCount());
		if (MapConfiguration.GetValue("BBSRidge") ~= 1) then
		print("Adding Ridges");
	AddTerrainFromContinents(plotTypes, terrainTypes, world_age, g_iW, g_iH, iContinentBoundaryPlots);
	end
	AreaBuilder.Recalculate();
	TerrainBuilder.AnalyzeChokepoints();

	-- 705: River generation moved into AddFeatures() so we can pass random rainfall value

	AddFeatures();
	
	print("Adding cliffs");
	AddCliffs(plotTypes, terrainTypes);

	local args = {
		numberToPlace = GameInfo.Maps[Map.GetMapSize()].NumNaturalWonders,
	};
	local nwGen = BBS_NaturalWonderGenerator.Create(args);

	AddFeaturesFromContinents();
	DW_MarkCoastalLowlands();
	
	resourcesConfig = MapConfiguration.GetValue("resources");
	local startConfig = MapConfiguration.GetValue("start");-- Get the start config
	local args = {
		resources = resourcesConfig,
		START_CONFIG = startConfig,
	};
	local resGen = BBS_ResourceGenerator.Create(args);

	print("Creating start plot database.");

	-- START_MIN_Y and START_MAX_Y is the percent of the map ignored for major civs' starting positions.
	local args = {
		MIN_MAJOR_CIV_FERTILITY = 150,
		MIN_MINOR_CIV_FERTILITY = 5,
		MIN_BARBARIAN_FERTILITY = 1,
		START_MIN_Y = 15,
		START_MAX_Y = 15,
		START_CONFIG = startConfig,
		WATER = false,
		LAND = false,
	};
	local start_plot_database = BBS_Assign(args)
	local GoodyGen = AddGoodies(g_iW, g_iH);
	AreaBuilder.Recalculate();
	TerrainBuilder.AnalyzeChokepoints();
end

-------------------------------------------------------------------------------
function GeneratePlotTypes(world_age)
	print("Generating Plot Types");
	local plotTypes = {};

	local sea_level_low = 60;
	local sea_level_normal = 66;
	local sea_level_high = 72;

	local extra_mountains = 0;
	local grain_amount = 3;
	local adjust_plates = 1.0;
	local shift_plot_types = true;
	local tectonic_islands = false;
	local hills_ridge_flags = g_iFlags;
	local peaks_ridge_flags = g_iFlags;
	local has_center_rift = true;
	local water_percent;

	--	local sea_level
    	local sea_level = MapConfiguration.GetValue("sea_level");
	if sea_level == 1 then -- Low Sea Level
		water_percent = sea_level_low
	elseif sea_level == 2 then -- Normal Sea Level
		water_percent =sea_level_normal
	elseif sea_level == 3 then -- High Sea Level
		water_percent = sea_level_high
	else
		water_percent = TerrainBuilder.GetRandomNumber(sea_level_high - sea_level_low, "Random Sea Level - Lua") + sea_level_low  + 1;
	end

	-- Set values for hills and mountains according to World Age chosen by user.
	local adjustment = world_age;
	if world_age <= world_age_old then -- 5 Billion Years
		adjust_plates = adjust_plates * 0.75;
	elseif world_age >= world_age_new then -- 3 Billion Years
		adjust_plates = adjust_plates * 1.5;
	else -- 4 Billion Years
	end

	-- Generate continental fractal layer and examine the largest landmass.
	local done = false;
	local iAttempts = 0;
	local iWaterThreshold, biggest_area, iNumTotalLandTiles, iNumBiggestAreaTiles, iBiggestID;
	local removedLand, removedWater, rift_dice, grain_dice;
	local grain1, grain2;
	local iNumTotalTiles = g_iH * g_iW;
	local land_percent;

	while done == false do
		grain_dice = TerrainBuilder.GetRandomNumber(7, "Continental Grain roll - LUA Continents");
		if grain_dice < 4 then
			grain_dice = 3;
		else
			grain_dice = 2;
		end
		rift_dice = TerrainBuilder.GetRandomNumber(4, "Rift Grain roll - LUA Continents");
		if rift_dice < 1 then
			rift_dice = -1;
		end
		
		-- 705: Adding arg to disable polar land (2nd false below)
		-- InitFractal{continent_grain = grain_dice, rift_grain = rift_dice};
		InitFractal{continent_grain = grain_dice, rift_grain = rift_dice, false, false};
		-- 705: Always create the initial continents using the normal sea level, when the water
		-- layer is added below that will correct the amount of water.
		iWaterThreshold = g_continentsFrac:GetHeight(sea_level_normal);
		
		for x = 0, g_iW - 1 do
			for y = 0, g_iH - 1 do
				local i = y * g_iW + x;
				local val = g_continentsFrac:GetHeight(x, y);
				local pPlot = Map.GetPlotByIndex(i);
				if(val >= iWaterThreshold) then
					plotTypes[i] = g_PLOT_TYPE_LAND;
				else
					plotTypes[i] = g_PLOT_TYPE_OCEAN;
				end
			end
		end
		
		-- 705: Shift the plots here before adding islands, we'll do this again before
		-- handling the center rift.
		ShiftPlotTypes(plotTypes);
		islands = plotTypes;
		
		-- 705: Add extra islands here, many of these may be removed in the following step but the
		-- total land percent will still be ok
		
		-- Medium Islands
		local args = {};	
		args.iWaterPercent = water_percent + 20;
		args.iRegionWidth = math.ceil(g_iW);
		args.iRegionHeight = math.ceil(g_iH * 0.8);
		args.iRegionWestX = math.floor(0);
		args.iRegionSouthY = math.floor(g_iH * 0.1);
		args.iRegionGrain = 4;
		args.iRegionHillsGrain = 4;
		args.iRegionPlotFlags = g_iFlags;
		args.iRegionFracXExp = 7;
		args.iRegionFracYExp = 6;
		plotTypes = GenerateFractalLayerWithoutHills(args, plotTypes);
		islands = plotTypes;

		-- Small Islands
		local args = {};	
		args.iWaterPercent = water_percent;
		args.iRegionWidth = math.ceil(g_iW);
		args.iRegionHeight = math.ceil(g_iH * 0.8);
		args.iRegionWestX = math.floor(0);
		args.iRegionSouthY = math.floor(g_iH * 0.1);
		args.iRegionGrain = 5;
		args.iRegionHillsGrain = 4;
		args.iRegionPlotFlags = g_iFlags;
		args.iRegionFracXExp = 7;
		args.iRegionFracYExp = 6;
		plotTypes = GenerateFractalLayerWithoutHills(args, plotTypes);
		
		for x = 0, g_iW - 1 do
			for y = 0, g_iH - 1 do
				local i = y * g_iW + x;
				local pPlot = Map.GetPlotByIndex(i);
				if(plotTypes[i] == g_PLOT_TYPE_LAND) then
					TerrainBuilder.SetTerrainType(pPlot, g_TERRAIN_TYPE_DESERT);  -- temporary setting so can calculate areas
				else
					TerrainBuilder.SetTerrainType(pPlot, g_TERRAIN_TYPE_OCEAN);  -- temporary setting so can calculate areas
				end
			end
		end
		
		-- 705: This is a big change to my old method
		-- Before adding any details lets reduce polar land and calculate the actual land percentage
		-- so we can adjust how much land is removed when adding details and try to keep the number
		-- of attempts down to speed up build times.
		AreaBuilder.Recalculate();
		local biggest_ocean = Areas.FindBiggestArea(true);

		local max = 0;
		local min = 0;
		removedLand = 0;
		maxY = g_iH - math.ceil(g_iH * 0.2);
		minY = math.ceil(g_iH * 0.2);
		iNumTotalLandTiles = 0;
		
		for x = 0, g_iW - 1 do
			for y = 0, g_iH - 1 do
				local i = y * g_iW + x;
				local pPlot = Map.GetPlotByIndex(i);
				local rChance = TerrainBuilder.GetRandomNumber(minY, "Polar Land Reduction - LUA Continents");
				local canBeLand = true;
				
				if (y < 2 or y > g_iH - 2) then
					canBeLand = false;
				elseif((y <= minY) and (y > 0) and (y < rChance)) then
					canBeLand = false;
				elseif((y >= maxY) and (y < g_iH) and (y > g_iH - rChance)) then
					canBeLand = false;						
				end
				
				if(plotTypes[i] == g_PLOT_TYPE_LAND and not canBeLand) then
					-- 705: Reduce land at poles
					removedLand = removedLand + 1;
					plotTypes[i] = g_PLOT_TYPE_OCEAN;
				elseif(plotTypes[i] == g_PLOT_TYPE_OCEAN and pPlot:GetArea() ~= biggest_ocean) then
					-- 705: Fill in inland seas
					plotTypes[i] = g_PLOT_TYPE_LAND;
				end
				-- 705: Count the total land
				if(plotTypes[i] == g_PLOT_TYPE_LAND) then
					TerrainBuilder.SetTerrainType(pPlot, g_TERRAIN_TYPE_DESERT);
					iNumTotalLandTiles = iNumTotalLandTiles + 1;
				else
					TerrainBuilder.SetTerrainType(pPlot, g_TERRAIN_TYPE_OCEAN);
				end
			end
		end
		
		land_percent = math.floor(100 * (iNumTotalLandTiles) / iNumTotalTiles);
		-- 705: We need land percent remain at 100 - water_percent once the detail pass subtracts
		-- land from the base map. So we should be safe by trying to get each water layer to remove
		-- the difference, but there is already water tiles that won't be touched so this part is, at
		-- best, a SWAG.  Detail layers at 80% water works well in most cases so lets just adjust
		-- that amount based on how much "extra" land we have at this point.
		
		local detail_water = math.max(math.min(180 - water_percent - land_percent,90),70);

		local args = {};
		args.iWaterPercent = detail_water;
		args.iRegionWidth = math.ceil(g_iW);
		args.iRegionHeight = math.ceil(g_iH);
		args.iRegionWestX = math.floor(0);
		args.iRegionSouthY = math.floor(0);
		args.iRegionGrain = 5 - grain_dice;
		args.iRegionPlotFlags = g_iFlags;
		args.iRegionFracXExp = -1;
		args.iRegionFracYExp = -1;
		args.iRiftGrain = 1;
		args.bShift = false;
		plotTypes = GenerateWaterLayer(args, plotTypes);
		
		ShiftPlotTypes(plotTypes);
		GenerateCenterRift(plotTypes);
		
		for x = 0, g_iW - 1 do
			for y = 0, g_iH - 1 do
				local i = y * g_iW + x;
				local pPlot = Map.GetPlotByIndex(i);
				if(plotTypes[i] == g_PLOT_TYPE_LAND) then
					TerrainBuilder.SetTerrainType(pPlot, g_TERRAIN_TYPE_DESERT);  -- temporary setting so can calculate areas
				else
					TerrainBuilder.SetTerrainType(pPlot, g_TERRAIN_TYPE_OCEAN);  -- temporary setting so can calculate areas
				end
			end
		end
		
		AreaBuilder.Recalculate();
		local biggest_ocean = Areas.FindBiggestArea(true);
		
		-- 705: Fill in any inland seas
		removedWater = 0;
		iNumTotalLandTiles = 0;
		
		for x = 0, g_iW - 1 do
			for y = 0, g_iH - 1 do
				local i = y * g_iW + x;
				local pPlot = Map.GetPlotByIndex(i);
				
				if (y < 2 or y > g_iH - 2) then
					if(plotTypes[i] == g_PLOT_TYPE_LAND) then
						-- 705: Remove land at polar edges
						removedLand = removedLand + 1;
						plotTypes[i] = g_PLOT_TYPE_OCEAN;
					end
				elseif(plotTypes[i] == g_PLOT_TYPE_OCEAN and pPlot:GetArea() ~= biggest_ocean) then
					-- 705: Fill in inland seas
					removedWater = removedWater + 1;
					plotTypes[i] = g_PLOT_TYPE_LAND;
				end
				
				-- 705: Count the total land, fix terrain type for areabuilder
				if(plotTypes[i] == g_PLOT_TYPE_LAND) then
					TerrainBuilder.SetTerrainType(pPlot, g_TERRAIN_TYPE_DESERT);
					iNumTotalLandTiles = iNumTotalLandTiles + 1;
				else
					TerrainBuilder.SetTerrainType(pPlot, g_TERRAIN_TYPE_OCEAN);
				end
			end
		end

		AreaBuilder.Recalculate();
		local biggest_area = Areas.FindBiggestArea(false);
		iNumBiggestAreaTiles = biggest_area:GetPlotCount();
		
		-- 705: Adjust land percent based on the number of attempts to keep it reasonable
		land_percent = math.floor(100 * (iNumTotalLandTiles) / iNumTotalTiles);
		local land_percent_plus = math.floor(100 * (iNumTotalLandTiles + iAttempts) / iNumTotalTiles);
		local land_percent_minus = math.floor(100 * (iNumTotalLandTiles - iAttempts) / iNumTotalTiles);
		local target_percent = 95 - water_percent;
		-- 705: Ideal land is +/- 5% of normalized sea level setting
		if (land_percent_plus >= target_percent and land_percent_minus <= target_percent + 10) then
			-- Now test the biggest landmass to make sure it isn't mostly a single landmass
			-- or an island map
			if (iNumBiggestAreaTiles <= iNumTotalLandTiles * 0.5 and iNumBiggestAreaTiles >= iNumTotalLandTiles * 0.33) then
				done = true;
				iBiggestID = biggest_area:GetID();
			end
			
		end
		
		iAttempts = iAttempts + 1;
	end
		
	-- Printout for debug use
	print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
	print("--- Detailed Island Regions landmass generation, Attempt#", iAttempts);
	print("-                    Grain:", grain_dice);
	print("-                     Rift:", rift_dice);
	print("-            Region Grains:", grain1, " ", grain2);
	print("-");
	print("--- World Plots");
	print("-              Total Plots:", iNumTotalTiles);
	print("-         Total Land Plots:", iNumTotalLandTiles);
	print("-             Land Percent:", land_percent);
	print("-      Target Land Percent:", 100 - water_percent);
	print("-");
	print("--- Largest landmass");
	print("-               Land Plots:", iNumBiggestAreaTiles);
	print("-       Percentage of land:", 100 * iNumBiggestAreaTiles / iNumTotalLandTiles);
	print("-");
	print("--- Cleanup Pass");
	print("-       Polar land removed:", removedLand);
	print("-     Inland water removed:", removedWater);
	print("-");
	print("--- Tectonics")

	local args = {};
	args.world_age = world_age;
	args.iW = g_iW;
	args.iH = g_iH;
	args.iFlags = g_iFlags;
	args.blendRidge = 10;
	args.blendFract = 1;
	args.extra_mountains = (2 + ( 3 - world_age)) * 2;
	args.tectonic_islands = tectonic_islands;
	mountainRatio = (11 + ( 3 - world_age)) * 2;
		if (MapConfiguration.GetValue("BBSRidge") == 1) then
		mountainRatio = 10 + world_age * 3;
	end
	plotTypes = ApplyTectonics(args, plotTypes);
	plotTypes = AddLonelyMountains(plotTypes, mountainRatio);

	-- 705: Found a good map, now we can loop through every tile and add additional details
	print("-");
	local plotDataIsCoastal = GenerateCoastalLandDataTable();
	local hillsAdded = 0;
	local mountainsAdded = 0;
	local mountainsFilled = 0;
	
	for x = 0, g_iW - 1 do
		for y = 0, g_iH - 1 do
			local i = y * g_iW + x;
			-- 705: First, clean up the rare case of a non mountain plot surrounded by mountains
			if(plotTypes[i] == g_PLOT_TYPE_LAND or plotTypes[i] == g_PLOT_TYPE_HILLS) then
				local mountainCount = 0;
				for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local adjacentPlot = Map.GetAdjacentPlot(x, y, direction);
					if adjacentPlot ~= nil then
						local newIndex = adjacentPlot:GetIndex();
						if(plotTypes[newIndex] == g_PLOT_TYPE_MOUNTAIN) then
							mountainCount = mountainCount + 1;
						end
					end
				end
				
				if(mountainCount == 6) then -- surrounded by mountains
					plotTypes[i] = g_PLOT_TYPE_MOUNTAIN;
					mountainsFilled = mountainsFilled + 1;
				end
			end
			
			-- 705: Detailed hills and mountains pass
			-- Add extra hills in vast flatlands
			-- Change hills into mountains or flat land in vast hilly areas
			
			local rChance = TerrainBuilder.GetRandomNumber(6, "Add hills - LUA Mixed Continents");
			local mountainsAllowed = g_iH / (6 - world_age);
			
			if(plotDataIsCoastal[i] == false) then
				local hillCount = 0;
				for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local adjacentPlot = Map.GetAdjacentPlot(x, y, direction);
					if adjacentPlot ~= nil then
						local newIndex = adjacentPlot:GetIndex();
						if(plotTypes[newIndex] == g_PLOT_TYPE_HILLS) then
							hillCount = hillCount + 1;
						end
					end
				end
				
				-- Add hill to flatland areas
				if(hillCount < rChance - 2 and plotTypes[i] == g_PLOT_TYPE_LAND) then
					plotTypes[i] = g_PLOT_TYPE_HILLS;
					hillsAdded = hillsAdded + 1;

				-- Add mountain or remove hill in hilly areas
				elseif(hillCount > rChance + 1 and mountainsAdded < mountainsAllowed) then
					plotTypes[i] = g_PLOT_TYPE_MOUNTAIN;
					mountainsAdded = mountainsAdded + 1;
				elseif(hillCount > rChance) then
					plotTypes[i] = g_PLOT_TYPE_LAND;
				end
			
			end
		end
	end
	
	print("-");
	print("--- Details pass");
	print("-    Mountain Holes Filled:", mountainsFilled);
	print("-              Hills added:", hillsAdded);
	print("-          Mountains added:", mountainsAdded);
	
	-- 705: Flip the map?
	
	local flipMap = DetermineFlip(plotTypes); -- Todo: check polar land to determine if we need to flip
	
	if(flipMap) then
		local i, j = 1, #plotTypes;

		while i < j do
			plotTypes[i], plotTypes[j] = plotTypes[j], plotTypes[i];

			i = i + 1;
			j = j - 1;
		end
		print("-");
		print("- Map Flipped!");
	end
	
	print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");

	return plotTypes;
end

function InitFractal(args)

	if(args == nil) then args = {}; end

	local continent_grain = args.continent_grain or 2;
	local rift_grain = args.rift_grain or -1; -- Default no rifts. Set grain to between 1 and 3 to add rifts. - Bob
	local invert_heights = args.invert_heights or false;
	local polar = args.polar or true;
	local ridge_flags = args.ridge_flags or g_iFlags;

	local fracFlags = {};
	
	if(invert_heights) then
		fracFlags.FRAC_INVERT_HEIGHTS = true;
	end
	
	if(polar) then
		fracFlags.FRAC_POLAR = true;
	end

	-- 705: Reduce max vertical size and hope that the plot shift function will clean up this mess.
	local g_maxH = math.floor(g_iH * 0.9);

	if(rift_grain > 0 and rift_grain < 4) then
		local riftsFrac = Fractal.Create(g_iW, g_maxH, rift_grain, {}, 6, 5);
		g_continentsFrac = Fractal.CreateRifts(g_iW, g_maxH, continent_grain, fracFlags, riftsFrac, 6, 5);
	else
		g_continentsFrac = Fractal.Create(g_iW, g_maxH, continent_grain, fracFlags, 6, 5);	
	end

	-- Use Brian's tectonics method to weave ridgelines in to the continental fractal.
	-- Without fractal variation, the tectonics come out too regular.
	--
	--[[ "The principle of the RidgeBuilder code is a modified Voronoi diagram. I 
	added some minor randomness and the slope might be a little tricky. It was 
	intended as a 'whole world' modifier to the fractal class. You can modify 
	the number of plates, but that is about it." ]]-- Brian Wade - May 23, 2009
	--
	local MapSizeTypes = {};
	for row in GameInfo.Maps() do
		MapSizeTypes[row.MapSizeType] = row.PlateValue;
	end
	local sizekey = Map.GetMapSize();

	local numPlates = MapSizeTypes[sizekey] or 4
	
	-- 705: Increase plates for better detail on all map sizes
	numPlates = numPlates * 1.5;

	-- Blend a bit of ridge into the fractal.
	-- This will do things like roughen the coastlines and build inland seas. - Brian

	g_continentsFrac:BuildRidges(numPlates, {}, 1, 2);
end

function AddFeatures()
	print("Adding Features");

	-- Get Rainfall setting input by user.
	local rainfall = MapConfiguration.GetValue("rainfall");
	if rainfall == 4 then
		rainfall = 1 + TerrainBuilder.GetRandomNumber(3, "Random Rainfall - Lua");
	end
	
	local args = {};
	args.rainfall = rainfall;
	
	-- River generation is affected by plot types, originating from highlands and preferring to traverse lowlands.
	-- 705: Custom river method to take rainfall into consideration
	AddRivers(args);
	
	-- Lakes would interfere with rivers, causing them to stop and not reach the ocean, if placed any sooner.
	local numLargeLakes = GameInfo.Maps[Map.GetMapSize()].Continents;
	-- 705: Adjusted large lakes by rainfall
	numLargeLakes = numLargeLakes + rainfall - 2;
	AddLakes(numLargeLakes);
	
	args.iJunglePercent = 38;
	args.iForestPercent = 26; 
	args.iMarshPercent = 3;
	args.iOasisPercent = 1;
	args.iReefPercent = 8;
	
	featuregen = BBM_FeatureGenerator.Create(args);
	featuregen:AddFeatures(true, true);
end

function AddFeaturesFromContinents()
	print("Adding Features from Continents");

	featuregen:AddFeaturesFromContinents();
end

function GenerateCenterRift(plotTypes)
	-- Causes a rift to break apart and separate any landmasses overlaying the map center.
	-- Rift runs south to north ala the Atlantic Ocean.
	-- Any land plots in the first or last map columns will be lost, overwritten.
	-- This rift function is hex-dependent. It would have to be adapted to work with squares tiles.
	-- Center rift not recommended for non-oceanic worlds or with continent grains higher than 2.
	-- 
	-- First determine the rift "lean". 0 = Starts west, leans east. 1 = Starts east, leans west.
	local riftLean = TerrainBuilder.GetRandomNumber(2, "FractalWorld Center Rift Lean - Lua");
	
	-- Set up tables recording the rift line and the edge plots to each side of the rift line.
	local riftLine = {};
	local westOfRift = {};
	local eastOfRift = {};
	-- Determine minimum and maximum length of line segments for each possible direction.
	local primaryMaxLength = math.max(1, math.floor(g_iH / 8));
	local secondaryMaxLength = math.max(1, math.floor(g_iH / 11));
	local tertiaryMaxLength = math.max(1, math.floor(g_iH / 14));
	
	-- Set rift line starting plot and direction.
	local startDistanceFromCenterColumn = math.floor(g_iH / 8);
	if riftLean == 0 then
		startDistanceFromCenterColumn = -(startDistanceFromCenterColumn);
	end
	local startX = math.floor(g_iW / 2) + startDistanceFromCenterColumn;
	local startY = 0;
	local startingDirection = DirectionTypes.DIRECTION_NORTHWEST;
	if riftLean == 0 then
		startingDirection = DirectionTypes.DIRECTION_NORTHEAST;
	end
	-- Set rift X boundary.
	local riftXBoundary = math.floor(g_iW / 2) - startDistanceFromCenterColumn;
	
	-- Rift line is defined by a series of line segments traveling in one of three directions.
	-- East-leaning lines move NE primarily, NW secondarily, and E tertiary.
	-- West-leaning lines move NW primarily, NE secondarily, and W tertiary.
	-- Any E or W segments cause a wider gap on that row, requiring independent storage of data regarding west or east of rift.
	--
	-- Key variables need to be defined here so they persist outside of the various loops that follow.
	-- This requires that the starting plot be processed outside of those loops.
	local currentDirection = startingDirection;
	local currentX = startX;
	local currentY = startY;
	table.insert(riftLine, {currentX, currentY});
	-- Record west and east of the rift for this row.
	local rowIndex = currentY + 1;
	westOfRift[rowIndex] = currentX - 1;
	eastOfRift[rowIndex] = currentX + 1;
	-- Set this rift plot as type Ocean.
	local plotIndex = currentX + 1; -- Lua arrays starting at 1 sure makes for a lot of extra work and chances for bugs.
	plotTypes[plotIndex] = g_PLOT_TYPE_OCEAN; -- Tiles crossed by the rift all turn in to water.
	
	-- Generate the rift line.
	if riftLean == 0 then -- Leans east
		while currentY < g_iH - 1 do
			-- Generate a line segment
			local nextDirection = 0;

			if currentDirection == DirectionTypes.DIRECTION_EAST then
				local segmentLength = TerrainBuilder.GetRandomNumber(tertiaryMaxLength + 1, "FractalWorld Center Rift Segment Length - Lua");
				-- Choose next direction
				if currentX >= riftXBoundary then -- Gone as far east as allowed, must turn back west.
					nextDirection = DirectionTypes.DIRECTION_NORTHWEST;
				else
					local dice = TerrainBuilder.GetRandomNumber(3, "FractalWorld Center Rift Direction - Lua");
					if dice == 1 then
						nextDirection = DirectionTypes.DIRECTION_NORTHWEST;
					else
						nextDirection = DirectionTypes.DIRECTION_NORTHEAST;
					end
				end
				-- Process the line segment
				local plotsToDo = segmentLength;
				while plotsToDo > 0 do
					currentX = currentX + 1; -- Moving east, no change to Y.
					rowIndex = currentY;
					-- westOfRift[rowIndex] does not change.
					eastOfRift[rowIndex] = currentX + 1;
					plotIndex = currentY * g_iW + currentX + 1;
					plotTypes[plotIndex] = g_PLOT_TYPE_OCEAN;
					plotsToDo = plotsToDo - 1;
				end

			elseif currentDirection == DirectionTypes.DIRECTION_NORTHWEST then
				local segmentLength = TerrainBuilder.GetRandomNumber(secondaryMaxLength + 1, "FractalWorld Center Rift Segment Length - Lua");
				-- Choose next direction
				if currentX >= riftXBoundary then -- Gone as far east as allowed, must turn back west.
					nextDirection = DirectionTypes.DIRECTION_NORTHWEST;
				else
					local dice = TerrainBuilder.GetRandomNumber(4, "FractalWorld Center Rift Direction - Lua");
					if dice == 2 then
						nextDirection = DirectionTypes.DIRECTION_EAST;
					else
						nextDirection = DirectionTypes.DIRECTION_NORTHEAST;
					end
				end
				-- Process the line segment
				local plotsToDo = segmentLength;
				while plotsToDo > 0 and currentY < g_iH - 1 do
					local nextPlot = Map.GetAdjacentPlot(currentX, currentY, currentDirection);
					currentX = nextPlot:GetX();
					currentY = currentY + 1;
					rowIndex = currentY;
					westOfRift[rowIndex] = currentX - 1;
					eastOfRift[rowIndex] = currentX + 1;
					plotIndex = currentY * g_iW + currentX + 1;
					plotTypes[plotIndex] = g_PLOT_TYPE_OCEAN;
					plotsToDo = plotsToDo - 1;
				end
				
			else -- NORTHEAST
				local segmentLength = TerrainBuilder.GetRandomNumber(primaryMaxLength + 1, "FractalWorld Center Rift Segment Length - Lua");
				-- Choose next direction
				if currentX >= riftXBoundary then -- Gone as far east as allowed, must turn back west.
					nextDirection = DirectionTypes.DIRECTION_NORTHWEST;
				else
					local dice = TerrainBuilder.GetRandomNumber(2, "FractalWorld Center Rift Direction - Lua");
					if dice == 1 and currentY > g_iH * 0.28 then
						nextDirection = DirectionTypes.DIRECTION_EAST;
					else
						nextDirection = DirectionTypes.DIRECTION_NORTHWEST;
					end
				end
				-- Process the line segment
				local plotsToDo = segmentLength;
				while plotsToDo > 0 and currentY < g_iH - 1 do
					local nextPlot = Map.GetAdjacentPlot(currentX, currentY, currentDirection);
					currentX = nextPlot:GetX();
					currentY = currentY + 1;
					rowIndex = currentY;
					westOfRift[rowIndex] = currentX - 1;
					eastOfRift[rowIndex] = currentX + 1;
					plotIndex = currentY * g_iW + currentX + 1;
					plotTypes[plotIndex] = g_PLOT_TYPE_OCEAN;
					plotsToDo = plotsToDo - 1;
				end
			end
			
			-- Line segment is done, set next direction.
			currentDirection = nextDirection;
		end

	else -- Leans west
		while currentY < g_iH - 1 do
			-- Generate a line segment
			local nextDirection = 0;

			if currentDirection == DirectionTypes.DIRECTION_WEST then
				local segmentLength = TerrainBuilder.GetRandomNumber(tertiaryMaxLength + 1, "FractalWorld Center Rift Segment Length - Lua");
				-- Choose next direction
				if currentX <= riftXBoundary then -- Gone as far west as allowed, must turn back east.
					nextDirection = DirectionTypes.DIRECTION_NORTHEAST;
				else
					local dice = TerrainBuilder.GetRandomNumber(3, "FractalWorld Center Rift Direction - Lua");
					if dice == 1 then
						nextDirection = DirectionTypes.DIRECTION_NORTHEAST;
					else
						nextDirection = DirectionTypes.DIRECTION_NORTHWEST;
					end
				end
				-- Process the line segment
				local plotsToDo = segmentLength;
				while plotsToDo > 0 do
					currentX = currentX - 1; -- Moving west, no change to Y.
					rowIndex = currentY;
					westOfRift[rowIndex] = currentX - 1;
					-- eastOfRift[rowIndex] does not change.
					plotIndex = currentY * g_iW + currentX + 1;
					plotTypes[plotIndex] = g_PLOT_TYPE_OCEAN;
					plotsToDo = plotsToDo - 1;
				end

			elseif currentDirection == DirectionTypes.DIRECTION_NORTHEAST then
				local segmentLength = TerrainBuilder.GetRandomNumber(secondaryMaxLength + 1, "FractalWorld Center Rift Segment Length - Lua");
				-- Choose next direction
				if currentX <= riftXBoundary then -- Gone as far west as allowed, must turn back east.
					nextDirection = DirectionTypes.DIRECTION_NORTHEAST;
				else
					local dice = TerrainBuilder.GetRandomNumber(4, "FractalWorld Center Rift Direction - Lua");
					if dice == 2 then
						nextDirection = DirectionTypes.DIRECTION_WEST;
					else
						nextDirection = DirectionTypes.DIRECTION_NORTHWEST;
					end
				end
				-- Process the line segment
				local plotsToDo = segmentLength;
				while plotsToDo > 0 and currentY < g_iH - 1 do
					local nextPlot = Map.GetAdjacentPlot(currentX, currentY, currentDirection);
					currentX = nextPlot:GetX();
					currentY = currentY + 1;
					rowIndex = currentY;
					westOfRift[rowIndex] = currentX - 1;
					eastOfRift[rowIndex] = currentX + 1;
					plotIndex = currentY * g_iW + currentX + 1;
					plotTypes[plotIndex] = g_PLOT_TYPE_OCEAN;
					plotsToDo = plotsToDo - 1;
				end
				
			else -- NORTHWEST
				local segmentLength = TerrainBuilder.GetRandomNumber(primaryMaxLength + 1, "FractalWorld Center Rift Segment Length - Lua");
				-- Choose next direction
				if currentX <= riftXBoundary then -- Gone as far west as allowed, must turn back east.
					nextDirection = DirectionTypes.DIRECTION_NORTHEAST;
				else
					local dice = TerrainBuilder.GetRandomNumber(2, "FractalWorld Center Rift Direction - Lua");
					if dice == 1 and currentY > g_iH * 0.28 then
						nextDirection = DirectionTypes.DIRECTION_WEST;
					else
						nextDirection = DirectionTypes.DIRECTION_NORTHEAST;
					end
				end
				-- Process the line segment
				local plotsToDo = segmentLength;
				while plotsToDo > 0 and currentY < g_iH - 1 do
					local nextPlot = Map.GetAdjacentPlot(currentX, currentY, currentDirection);
					currentX = nextPlot:GetX();
					currentY = currentY + 1;
					rowIndex = currentY;
					westOfRift[rowIndex] = currentX - 1;
					eastOfRift[rowIndex] = currentX + 1;
					plotIndex = currentY * g_iW + currentX + 1;
					plotTypes[plotIndex] = g_PLOT_TYPE_OCEAN;
					plotsToDo = plotsToDo - 1;
				end
			end
			
			-- Line segment is done, set next direction.
			currentDirection = nextDirection;
		end
	end
	-- Process the final plot in the rift.
	westOfRift[g_iH] = currentX - 1;
	eastOfRift[g_iH] = currentX + 1;
	plotIndex = (g_iH - 1) * g_iW + currentX + 1;
	plotTypes[plotIndex] = g_PLOT_TYPE_OCEAN;

	-- Now force the rift to widen, causing land on either side of the rift to drift apart.
	local horizontalDrift = 3;
	local verticalDrift = 2;
	--
	if riftLean == 0 then
		-- Process Western side from top down.
		for y = g_iH - 1 - verticalDrift, 0, -1 do
			local thisRowX = westOfRift[y+1];
			for x = horizontalDrift, thisRowX do
				local sourcePlotIndex = y * g_iW + x + 1;
				local destPlotIndex = (y + verticalDrift) * g_iW + (x - horizontalDrift) + 1;
				plotTypes[destPlotIndex] = plotTypes[sourcePlotIndex]
			end
		end
		-- Process Eastern side from bottom up.
		for y = verticalDrift, g_iH - 1 do
			local thisRowX = eastOfRift[y+1];
			for x = thisRowX, g_iW - horizontalDrift - 1 do
				local sourcePlotIndex = y * g_iW + x + 1;
				local destPlotIndex = (y - verticalDrift) * g_iW + (x + horizontalDrift) + 1;
				plotTypes[destPlotIndex] = plotTypes[sourcePlotIndex]
			end
		end
		-- Clean up remainder of tiles (by turning them all to Ocean).
		-- Clean up bottom left.
		for y = 0, verticalDrift - 1 do
			local thisRowX = westOfRift[y+1];
			for x = 0, thisRowX do
				local plotIndex = y * g_iW + x + 1;
				plotTypes[plotIndex] = g_PLOT_TYPE_OCEAN;
			end
		end
		-- Clean up top right.
		for y = g_iH - verticalDrift, g_iH - 1 do
			local thisRowX = eastOfRift[y+1];
			for x = thisRowX, g_iW - 1 do
				local plotIndex = y * g_iW + x + 1;
				plotTypes[plotIndex] = g_PLOT_TYPE_OCEAN;
			end
		end
		-- Clean up the rift.
		for y = verticalDrift, g_iH - 1 - verticalDrift do
			local westX = westOfRift[y-verticalDrift+1] - horizontalDrift + 1;
			local eastX = eastOfRift[y+verticalDrift+1] + horizontalDrift - 1;
			for x = westX, eastX do
				local plotIndex = y * g_iW + x + 1;
				plotTypes[plotIndex] = g_PLOT_TYPE_OCEAN;
			end
		end

	else -- riftLean = 1
		-- Process Western side from bottom up.
		for y = verticalDrift, g_iH - 1 do
			local thisRowX = westOfRift[y+1];
			for x = horizontalDrift, thisRowX do
				local sourcePlotIndex = y * g_iW + x + 1;
				local destPlotIndex = (y - verticalDrift) * g_iW + (x - horizontalDrift) + 1;
				plotTypes[destPlotIndex] = plotTypes[sourcePlotIndex]
			end
		end
		-- Process Eastern side from top down.
		for y = g_iH - 1 - verticalDrift, 0, -1 do
			local thisRowX = eastOfRift[y+1];
			for x = thisRowX, g_iW - horizontalDrift - 1 do
				local sourcePlotIndex = y * g_iW + x + 1;
				local destPlotIndex = (y + verticalDrift) * g_iW + (x + horizontalDrift) + 1;
				plotTypes[destPlotIndex] = plotTypes[sourcePlotIndex]
			end
		end
		-- Clean up remainder of tiles (by turning them all to Ocean).
		-- Clean up top left.
		for y = g_iH - verticalDrift, g_iH - 1 do
			local thisRowX = westOfRift[y+1];
			for x = 0, thisRowX do
				local plotIndex = y * g_iW + x + 1;
				plotTypes[plotIndex] = g_PLOT_TYPE_OCEAN;
			end
		end
		-- Clean up bottom right.
		for y = 0, verticalDrift - 1 do
			local thisRowX = eastOfRift[y+1];
			for x = thisRowX, g_iW - 1 do
				local plotIndex = y * g_iW + x + 1;
				plotTypes[plotIndex] = g_PLOT_TYPE_OCEAN;
			end
		end
		-- Clean up the rift.
		for y = verticalDrift, g_iH - 1 - verticalDrift do
			local westX = westOfRift[y+verticalDrift+1] - horizontalDrift + 1;
			local eastX = eastOfRift[y-verticalDrift+1] + horizontalDrift - 1;
			for x = westX, eastX do
				local plotIndex = y * g_iW + x + 1;
				plotTypes[plotIndex] = g_PLOT_TYPE_OCEAN;
			end
		end
	end
end
-------------------------------------------------------------------------------
function GenerateWaterLayer (args, plotTypes)
	-- This function is intended to allow adding seas to specific areas of large continents.
	local args = args or {};
	
	-- Handle args or assign defaults.
	local iWaterPercent = args.iWaterPercent or 55;
	local iRegionWidth = args.iRegionWidth; -- Mandatory Parameter, no default
	local iRegionHeight = args.iRegionHeight; -- Mandatory Parameter, no default
	local iRegionWestX = args.iRegionWestX; -- Mandatory Parameter, no default
	local iRegionSouthY = args.iRegionSouthY; -- Mandatory Parameter, no default
	local iRegionGrain = args.iRegionGrain or 1;
	local iRegionPlotFlags = args.iRegionPlotFlags or g_iFlags;
	local iRegionFracXExp = args.iRegionFracXExp or 6;
	local iRegionFracYExp = args.iRegionFracYExp or 5;
	local iRiftGrain = args.iRiftGrain or -1;

	-- Init the plot types array for this region's plot data. Redone for each new layer.
	-- Compare to self.wholeworldPlotTypes, which contains the sum of all layers.
	plotTypes2 = {};
	-- Loop through the region's plots
	for x = 0, iRegionWidth - 1, 1 do
		for y = 0, iRegionHeight - 1, 1 do
			local i = y * iRegionWidth + x + 1; -- Lua arrays start at 1.
			plotTypes2[i] = g_PLOT_TYPE_OCEAN;
		end
	end

	-- Init the land/water fractal
	local regionContinentsFrac;
	if (iRiftGrain > 0) and (iRiftGrain < 4) then
		local riftsFrac = Fractal.Create(iRegionWidth, iRegionHeight, iRiftGrain, {}, iRegionFracXExp, iRegionFracYExp);
		regionContinentsFrac = Fractal.CreateRifts(iRegionWidth, iRegionHeight, iRegionGrain, iRegionPlotFlags, riftsFrac, iRegionFracXExp, iRegionFracYExp);
	else
		regionContinentsFrac = Fractal.Create(iRegionWidth, iRegionHeight, iRegionGrain, iRegionPlotFlags, iRegionFracXExp, iRegionFracYExp);	
	end
	
	-- Using the fractal matrices we just created, determine fractal-height values for sea level.
	local iWaterThreshold = regionContinentsFrac:GetHeight(iWaterPercent);

	-- Loop through the region's plots
	for x = 0, iRegionWidth - 1, 1 do
		for y = 0, iRegionHeight - 1, 1 do
			local i = y * iRegionWidth + x + 1; -- Lua arrays start at 1.
			local val = regionContinentsFrac:GetHeight(x,y);
			if val <= iWaterThreshold then
				--do nothing
			else
				plotTypes2[i] = g_PLOT_TYPE_LAND;
			end
		end
	end

	-- Apply the region's plots to the global plot array.
	for x = 0, iRegionWidth - 1, 1 do
		local wholeworldX = x + iRegionWestX;
		for y = 0, iRegionHeight - 1, 1 do
			local i = y * iRegionWidth + x + 1;
			if plotTypes2[i] ~= g_PLOT_TYPE_OCEAN then
				local wholeworldY = y + iRegionSouthY;
				local index = wholeworldY * g_iW + wholeworldX + 1
				plotTypes[index] = g_PLOT_TYPE_OCEAN;
			end
		end
	end

	-- This region is done.
	return plotTypes;
end

-------------------------------------------------------------------------------
function GenerateFractalLayerWithoutHills (args, plotTypes)
	--[[ This function is intended to be paired with ApplyTectonics. If all the hills and
	mountains plots are going to be overwritten by the tectonics results, then why waste
	calculations generating them? ]]--
	local args = args or {};
	local plotTypes2 = {};

	-- Handle args or assign defaults.
	local iWaterPercent = args.iWaterPercent or 55;
	local iRegionWidth = args.iRegionWidth; -- Mandatory Parameter, no default
	local iRegionHeight = args.iRegionHeight; -- Mandatory Parameter, no default
	local iRegionWestX = args.iRegionWestX; -- Mandatory Parameter, no default
	local iRegionSouthY = args.iRegionSouthY; -- Mandatory Parameter, no default
	local iRegionGrain = args.iRegionGrain or 1;
	local iRegionPlotFlags = args.iRegionPlotFlags or g_iFlags;
	local iRegionTerrainFlags = g_iFlags; -- Removed from args list.
	local iRegionFracXExp = args.iRegionFracXExp or 6;
	local iRegionFracYExp = args.iRegionFracYExp or 5;
	local iRiftGrain = args.iRiftGrain or -1;
	
	--print("Received Region Data");
	--print(iRegionWidth, iRegionHeight, iRegionWestX, iRegionSouthY, iRegionGrain);
	--print("- - -");
	
	--print("Filled regional table.");
	-- Loop through the region's plots
	for x = 0, iRegionWidth - 1, 1 do
		for y = 0, iRegionHeight - 1, 1 do
			local i = y * iRegionWidth + x + 1; -- Lua arrays start at 1.
			plotTypes2[i] =g_PLOT_TYPE_OCEAN;
		end
	end

	-- Init the land/water fractal
	local regionContinentsFrac;
	if(iRiftGrain > 0 and iRiftGrain < 4) then
		local riftsFrac = Fractal.Create(g_iW, g_iH, rift_grain, {}, iRegionFracXExp, iRegionFracYExp);
		regionContinentsFrac = Fractal.CreateRifts(g_iW, g_iH, iRegionGrain, iRegionPlotFlags, riftsFrac, iRegionFracXExp, iRegionFracYExp);
	else
		regionContinentsFrac = Fractal.Create(g_iW, g_iH, iRegionGrain, iRegionPlotFlags, iRegionFracXExp, iRegionFracYExp);	
	end
	--print("Initialized main fractal");
	local iWaterThreshold = regionContinentsFrac:GetHeight(iWaterPercent);

	-- Loop through the region's plots
	for x = 0, iRegionWidth - 1, 1 do
		for y = 0, iRegionHeight - 1, 1 do
			local i = y * iRegionWidth + x + 1; -- Lua arrays start at 1.
			local val = regionContinentsFrac:GetHeight(x,y);
			if val <= iWaterThreshold or Adjacent(i) == true then
				--do nothing
			else
				plotTypes2[i] = g_PLOT_TYPE_LAND;
			end
		end
	end

	-- print("Shifted Plots - Width: ", iRegionWidth, "Height: ", iRegionHeight);

	-- Apply the region's plots to the global plot array.
	for x = 0, iRegionWidth - 1, 1 do
		local wholeworldX = x + iRegionWestX;
		for y = 0, iRegionHeight - 1, 1 do
			local index = y * iRegionWidth + x + 1
			if plotTypes2[index] ~= g_PLOT_TYPE_OCEAN then
				local wholeworldY = y + iRegionSouthY;
				local i = wholeworldY * g_iW + wholeworldX + 1
				plotTypes[i] = plotTypes2[index];
			end
		end
	end
	--print("Generated Plot Types");

	return plotTypes;
end

-------------------------------------------------------------------------------------------
function Adjacent(index)
	aIslands = islands;
	index = index -1;

	if(aIslands == nil) then
		return false;
	end
	
	if(index < 0) then
		return false
	end

	local plot = Map.GetPlotByIndex(index);
	if(aIslands[index] ~= nil and aIslands[index] == g_PLOT_TYPE_LAND) then
		return true;
	end

	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local adjacentPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), direction);
		if(adjacentPlot ~= nil) then
			local newIndex = adjacentPlot:GetIndex();
			if(aIslands  ~= nil and aIslands[newIndex] == g_PLOT_TYPE_LAND) then
				return true;
			end
		end
	end

	return false;
end

-------------------------------------------------------------------------------------------
function DetermineFlip(plotTypes)
	-- 705: See if we need to flip the map to put the most land along the north edge of the
	-- map to make it look more earth-like which will make the map feel more natural

	local g_iW, g_iH = Map.GetGridSize();

	-- First loop through the map rows and record land plots in each row.
	local land_totals = {};
	for y = 0, g_iH - 1 do
		local current_row = 0;
		for x = 0, g_iW - 1 do
			local i = y * g_iW + x + 1;
			if (plotTypes[i] ~= g_PLOT_TYPE_OCEAN) then
				current_row = current_row + 1;
			end
		end
		table.insert(land_totals, current_row);
	end
	
	-- Now evaluate row groups, each record applying to the center row of the group.
	local row_groups = {};
	-- Determine the group size in relation to map height.
	local group_radius = math.floor(g_iH / 15);
	-- Measure the groups.
	for row_index = 1, g_iH do
		local current_group_total = 0;
		for current_row = row_index - group_radius, row_index + group_radius do
			local current_index = current_row % g_iH;
			if current_index == 0 then -- Modulo of the last row will be zero; this repairs the issue.
				current_index = g_iH;
			end
			current_group_total = current_group_total + land_totals[current_index];
		end
		table.insert(row_groups, current_group_total);
	end
	
	-- Identify the group with the least amount of land in it.
	local best_value = g_iW * (2 * group_radius + 1); -- Set initial value to max possible.
	local best_group = 1; -- Set initial best group as current map edge.
	for row_index, group_land_plots in ipairs(row_groups) do
		if group_land_plots < best_value then
			best_value = group_land_plots;
			best_group = row_index;
		end
	end
	
	if best_group < math.floor(g_iH * 0.25) then
		return false;
	end
	
	return true;
end