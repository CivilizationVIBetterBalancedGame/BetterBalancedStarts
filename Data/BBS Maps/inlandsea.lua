------------------------------------------------------------------------------
--	FILE:	 InlandSea.lua
--	AUTHOR:  D. / Jack The Narrator
--	PURPOSE: Base game script - Produces widely varied continents.
------------------------------------------------------------------------------
--	Copyright (c) 2014 Firaxis Games, Inc. All rights reserved.
------------------------------------------------------------------------------

include "MapEnums"
include "DW_MapUtilities"
include "BBS_MountainsCliffs"
include "RiversLakes"
include "BBM_FeatureGenerator"
include "BBS_TerrainGenerator"
include "TerrainGenerator"
include "BBS_NaturalWonderGenerator"
include "BBS_ResourceGenerator"
include "AssignStartingPlots"
include "BBM_AssignStartingPlots";local g_iW, g_iH;
local g_iFlags = {};
local g_continentsFrac = nil;
local g_riverPlots = {};
local g_riverStartPlots = {};
local g_iRiverID = 0;
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
	print("Generating Inland Sea Map");
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

	local shift = 0.07;

	plotTypes = GeneratePlotTypes(world_age);
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
	TerrainBuilder.StampContinents();

	local iContinentBoundaryPlots = GetContinentBoundaryPlotCount(g_iW, g_iH);
	local biggest_area = Areas.FindBiggestArea(false);
	print("After Adding Hills: ", biggest_area:GetPlotCount());
		if (MapConfiguration.GetValue("BBSRidge") ~= 1) then
		print("Adding Ridges");
	AddTerrainFromContinents(plotTypes, terrainTypes, world_age, g_iW, g_iH, iContinentBoundaryPlots);
	end
	AreaBuilder.Recalculate();

	-- River generation is affected by plot types, originating from highlands and preferring to traverse lowlands.
	for x = 0, g_iW - 1 do
		for y = 0, g_iH - 1 do
			local i = y * g_iW + x; -- C++ Plot indices, starting at 0.
			g_riverPlots[i] = 0;
		end
	end
	
	AddRivers();
	
	-- Lakes would interfere with rivers, causing them to stop and not reach the ocean, if placed any sooner.
	local numLargeLakes = math.ceil(GameInfo.Maps[Map.GetMapSize()].Continents / 2);
	AddLakes(numLargeLakes);

	AddFeatures();
	TerrainBuilder.AnalyzeChokepoints();
	
	print("Adding cliffs");
	AddCliffs(plotTypes, terrainTypes);

	local args = {
		numberToPlace = GameInfo.Maps[Map.GetMapSize()].NumNaturalWonders,
		Invalid= {g_FEATURE_GALAPAGOS, g_FEATURE_PIOPIOTAHI},
	};
	local nwGen = BBS_NaturalWonderGenerator.Create(args);

	AddFeaturesFromContinents();
	
	--for i = 0, (g_iW * g_iH) - 1, 1 do
		--pPlot = Map.GetPlotByIndex(i);
		--print ("i: plotType, terrainType, featureType: " .. tostring(i) .. ": " .. tostring(plotTypes[i]) .. ", " .. tostring(terrainTypes[i]) .. ", " .. tostring(pPlot:GetFeatureType(i)));
	--end
	local resourcesConfig = MapConfiguration.GetValue("resources");
	local startConfig = MapConfiguration.GetValue("start");-- Get the start config
	local args = {
		iWaterLux = 1,
		iWaterBonus = 1.0,
		resources = resourcesConfig,
		START_CONFIG = startConfig,
	};
	local resGen = BBS_ResourceGenerator.Create(args);
	if (MapConfiguration.GetValue("BBSRidge") == 1) then
		AddVolcanos(plotTypes,world_age,g_iW, g_iH)
	end
	print("Creating start plot database.");
	-- START_MIN_Y and START_MAX_Y is the percent of the map ignored for major civs' starting positions.
	
	local args = {
		MIN_MAJOR_CIV_FERTILITY = 200,
		MIN_MINOR_CIV_FERTILITY = 50, 
		MIN_BARBARIAN_FERTILITY = 1,
		START_MIN_Y = 15,
		START_MAX_Y = 15,
		START_CONFIG = startConfig,
	};
	local start_plot_database = BBS_Assign(args)

	local GoodyGen = AddGoodiesBBM(g_iW, g_iH);
	AreaBuilder.Recalculate();	
	TerrainBuilder.AnalyzeChokepoints();
end

-- Input a Hash; Export width, height, and wrapX
function GetMapInitData(MapSize)
	local MapSizeTypes = {};
	local Width = 0;
	local Height = 0;

	for row in GameInfo.Maps() do
		if(MapSize == row.Hash) then
			Width = row.GridWidth;
			Height = row.GridHeight;
		end
	end

	local WrapX = false;

	return {Width = Width, Height = Height, WrapX = WrapX,}
end

-------------------------------------------------------------------------------
function GeneratePlotTypes(world_age)
	print("Generating Plot Types");
	local plotTypes = table.fill(g_PLOT_TYPE_LAND, g_iW * g_iH);

	-- Generate the inland sea.
	local iWestX = math.floor(g_iW * 0.18) - 1;
	local iEastX = math.ceil(g_iW * 0.82) - 1;
	local iWidth = iEastX - iWestX;
	local iSouthY = math.floor(g_iH * 0.28) - 1;
	local iNorthY = math.ceil(g_iH * 0.72) - 1;
	local iHeight = iNorthY - iSouthY;
	local grain = 1 + TerrainBuilder.GetRandomNumber(2, "Inland Sea ocean grain - LUA");
	local fracFlags = {};
	fracFlags.FRAC_POLAR = true;
	g_continentsFrac = Fractal.Create(iWidth, iHeight, grain, fracFlags, -1, -1);	

	local seaThreshold = g_continentsFrac:GetHeight(60);
	
	for region_y = 0, iHeight - 1 do
		for region_x = 0, iWidth - 1 do
			local val = g_continentsFrac:GetHeight(region_x, region_y);
			if val >= seaThreshold then
				local x = region_x + iWestX;
				local y = region_y + iSouthY;
				local i = y * g_iW + x + 1; -- add one because Lua arrays start at 1
				plotTypes[i] = g_PLOT_TYPE_OCEAN;
			end
		end
	end

	-- Second, oval layer to ensure one main body of water.
	local centerX = (g_iW / 2) - 1;
	local centerY = (g_iH / 2) - 1;
	local xAxis = centerX / 2;
	local yAxis = centerY * 0.35;
	local xAxisSquared = xAxis * xAxis;
	local yAxisSquared = yAxis * yAxis;
	for x = 0, g_iW - 1 do
		for y = 0, g_iH - 1 do
			local i = y * g_iW + x + 1;
			local deltaX = x - centerX;
			local deltaY = y - centerY;
			local deltaXSquared = deltaX * deltaX;
			local deltaYSquared = deltaY * deltaY;
			local oval_value = deltaXSquared / xAxisSquared + deltaYSquared / yAxisSquared;
			if oval_value <= 1 then
				plotTypes[i] = g_PLOT_TYPE_OCEAN;
			end
		end
	end

	AreaBuilder.Recalculate();
	
	-- Land and water are set. Now apply hills and mountains.

	local args = {};
	args.world_age = world_age;
	args.iW = g_iW;
	args.iH = g_iH
	args.iFlags = g_iFlags;
	args.blendRidge = 10;
	args.blendFract = 1;
	args.extra_mountains = 7 - world_age;
	mountainRatio = 13 + world_age;
		if (MapConfiguration.GetValue("BBSRidge") == 1) then
		mountainRatio = 14 + world_age ;
	end
	plotTypes = ApplyTectonics(args, plotTypes);
	plotTypes = AddLonelyMountains(plotTypes, mountainRatio);

	-- Plot Type generation completed. Return global plot array.

	return plotTypes;
end

function AddFeatures()
	print("Adding Features");

	-- Get Rainfall setting input by user.
	local rainfall = MapConfiguration.GetValue("rainfall");
	if rainfall == 4 then
		rainfall = 1 + TerrainBuilder.GetRandomNumber(3, "Random Rainfall - Lua");
	end
	
	local args = {rainfall = rain}
	featuregen = BBM_FeatureGenerator.Create(args);
	featuregen:AddFeatures(true, false);  --second parameter is whether or not rivers start inland);
end

function AddFeaturesFromContinents()
	print("Adding Features from Continents");

	featuregen:AddFeaturesFromContinents();
end


function GetRiverValueAtPlot(plot)

    -- Prevent running back into the sea
	if (plot:IsCoastalLand()) then
		return 1000;
	end

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
		
			-- Patch river to north edge of map if can't flow off their normally
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
	
	local iNotAllowedAsCloseAs = 4;

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

	if NotCloseToAnotherRiver(pStartPlot) and not IsAdjacentMountain(pStartPlot) and not IsAdjacentRiver(pStartPlot, -1) then
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

		DoRiverReverse(pStartPlot, current_direction, directionIntoSea, 8 + (Map.GetMapSize() * 3), 1, g_iRiverID);
		
		g_iRiverID = g_iRiverID + 1;
	end
end

function AddRivers()

	print("Map Generation - Adding Rivers");
				
	local iW, iH = Map.GetGridSize();
	local orig_direction, current_direction, pStartPlot;

	for i = 0, (iW * iH) - 1, 1 do
		plot = Map.GetPlotByIndex(i);
		if (plot:IsCoastalLand()) then
			if (plot:IsNaturalWonder() == false and AdjacentToNaturalWonder(plot) == false) then
				local pNWPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), DirectionTypes.DIRECTION_NORTHWEST);
				local pNEPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), DirectionTypes.DIRECTION_NORTHEAST);
				local pEPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), DirectionTypes.DIRECTION_EAST);
				local pSEPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), DirectionTypes.DIRECTION_SOUTHEAST);
				local pSWPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), DirectionTypes.DIRECTION_SOUTHWEST);
				local pWPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), DirectionTypes.DIRECTION_WEST);

				-- Don't start any rivers really near the map edge 
				if (pNWPlot ~= nil and pNEPlot ~= nil and pEPlot ~= nil and pSEPlot ~= nil and pSWPlot ~= nil and pWPlot ~= nil) then

				    -- ... or near another river
					if (not pNWPlot:IsRiver() and not pNEPlot:IsRiver() and not pEPlot:IsRiver() and not pSEPlot:IsRiver() and not pSWPlot:IsRiver() and not pWPlot:IsRiver()) then

						if     (pEPlot:IsWater()  and not pSEPlot:IsWater() and not pSWPlot:IsWater() and not pWPlot:IsWater())  then
							TryStartRiver(plot, FlowDirectionTypes.FLOWDIRECTION_NORTHEAST);
						elseif (pSEPlot:IsWater() and not pSWPlot:IsWater() and not pWPlot:IsWater()  and not pNWPlot:IsWater()) then
							TryStartRiver(plot, FlowDirectionTypes.FLOWDIRECTION_SOUTHEAST);
						elseif (pSWPlot:IsWater() and not pWPlot:IsWater()  and not pNWPlot:IsWater() and not pNEPlot:IsWater()) then
							TryStartRiver(plot, FlowDirectionTypes.FLOWDIRECTION_SOUTH);
						elseif (pWPlot:IsWater()  and not pNWPlot:IsWater() and not pNEPlot:IsWater() and not pEPlot:IsWater())  then
							TryStartRiver(plot, FlowDirectionTypes.FLOWDIRECTION_SOUTHWEST);
						elseif (pNWPlot:IsWater() and not pNEPlot:IsWater() and not pEPlot:IsWater()  and not pSEPlot:IsWater()) then
							TryStartRiver(plot, FlowDirectionTypes.FLOWDIRECTION_NORTHWEST);
						elseif (pNEPlot:IsWater() and not pEPlot:IsWater()  and not pSEPlot:IsWater() and not pSWPlot:IsWater()) then
							TryStartRiver(plot, FlowDirectionTypes.FLOWDIRECTION_NORTH);
						end
					end
				end
			end			
		end
	end	
end

-------------------------------------------------------------------------------
function AddFeatures()
	print("Adding Features");

	-- Get Rainfall setting input by user.
	local rainfall = MapConfiguration.GetValue(rainfall);
	if rainfall == 4 then
		rainfall = 1 + TerrainBuilder.GetRandomNumber(3, "Random Rainfall - Lua");
	end
	
	local args = {rainfall = rainfall}
	featuregen = BBM_FeatureGenerator.Create(args);
	featuregen:AddFeatures(true, false);  --second parameter is whether or not rivers start inland);
end
------------------------------------------------------------------------------
function BBM_FeatureGenerator:AddIceAtPlot(plot, iX, iY, lat)
	return
end
------------------------------------------------------------------------------
