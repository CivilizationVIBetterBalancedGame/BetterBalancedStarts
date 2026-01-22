------------------------------------------------------------------------------
--	FILE:	 BBS_TerrainGenerator.lua -- 1.42
--	AUTHOR:  D. / Jack The Narrator, Wazabaza, Codenaught
--	PURPOSE: Shared map script to assign Civ 6 terrain types to a map
------------------------------------------------------------------------------
--	Copyright (c) 2014-6 Firaxis Games, Inc. All rights reserved.
------------------------------------------------------------------------------

include "TerrainGenerator"

-------------------------------------------------------------------------------

function BBS_GenerateTerrainTypes(plotTypes, iW, iH, iFlags, bNoCoastalMountains, temperature, notExpandCoasts, iDesertPercentArg, iPlainsPercentArg, fSnowLatitudeArg, fTundraLatitudeArg, fGrassLatitudeArg, fDesertBottomLatitudeArg, fDesertTopLatitudeArg)
	print("Generating Terrain Types");
	local terrainTypes = {};

	-- Sea Level option affects only plot generation.
	-- World Age option affects plot generation and geothermal/volcanic features
	-- Temperature map options affect only terrain generation.
	-- Rainfall map options affect only feature generation.
	if(temperature == nil) then
		temperature = 2;
	end

	local coldShift = 0.0;
	local temperature_shift = 0.1;
	local desert_shift = 16;
	local plains_shift = 6;
	
	-- Set terrain bands args.
	local iDesertShift = iDesertPercentArg or 0;
	local iPlainsShift = iPlainsPercentArg or 0;
	local fSnowShift = fSnowLatitudeArg or 0.0;
	local fTundraShift = fTundraLatitudeArg or 0.0;
	local fGrassShift = fGrassLatitudeArg or 0.0;
	local fDesertShiftTop = fDesertBottomLatitudeArg or 0.0;
	local fDesertShiftBottom = fDesertTopLatitudeArg or 0.0;
	
	-- Set terrain bands.
	local iDesertPercent = 18; -- Was 30% then 26% while making desert more centered put 18% after Mali's rework
	local iPlainsPercent = 50; 
	local fSnowLatitude  = 0.86 + coldShift; -- was 0.84 in 1.4.1 put back 0.86
	local fTundraLatitude = 0.66 + coldShift; -- was 0.65 put 0.63
	local fGrassLatitude = 0.1; 
	local fDesertBottomLatitude = 0.4; 
	local fDesertTopLatitude = 0.6; -- was 0.56 should be 0.6 to make the map symmetrical

	-- Adjust user's Temperature selection.
	if temperature == 5 then
		iDesertPercent = 0;
		fTundraLatitude = 0;
		iPlainsPercent = 0;
		fDesertTopLatitude = 0;
		fGrassLatitude = 0;
	elseif temperature > 2.5 then -- World Temperature is Cool.
		iDesertPercent = iDesertPercent - desert_shift;
		fTundraLatitude = fTundraLatitude - (temperature_shift * 1.5);
		iPlainsPercent = iPlainsPercent + plains_shift;
		fDesertTopLatitude = fDesertTopLatitude - temperature_shift;
		fGrassLatitude = fGrassLatitude - (temperature_shift * 0.5);
	elseif temperature < 1.5 then -- World Temperature is Hot.
		iDesertPercent = iDesertPercent + desert_shift;
		fSnowLatitude  = fSnowLatitude + (temperature_shift * 0.5);
		fTundraLatitude = fTundraLatitude + temperature_shift;
		fDesertTopLatitude = fDesertTopLatitude + temperature_shift;
		fGrassLatitude = fGrassLatitude - (temperature_shift * 0.5);
		iPlainsPercent = iPlainsPercent + plains_shift;
	else -- Normal Temperature.
	end

	local iDesertTopPercent		= 100;
	local iDesertBottomPercent	= math.max(0, math.floor(100-iDesertPercent));
	local iPlainsTopPercent		= 100;
	local iPlainsBottomPercent	= math.max(0, math.floor(100-iPlainsPercent));

	
	-- Activate printout for debugging only
	print("-"); print("- Desert Percentage:", iDesertPercent);
	print("--- Latitude Readout ---");
	print("- All Grass End Latitude:", fGrassLatitude);
	print("- Desert Start Latitude:", fDesertBottomLatitude);
	print("- Desert End Latitude:", fDesertTopLatitude);
	print("- Tundra Start Latitude:", fTundraLatitude);
	print("- Snow Start Latitude:", fSnowLatitude);
	print("- - - - - - - - - - - - - -");

	local fracXExp = -1;
	local fracYExp = -1;
	local grain_amount = 3;
	local iDesertTop;
	local iDesertBottom;																
	local iPlainsTop;
	local iPlainsBottom;

	deserts = Fractal.Create(iW, iH, 
									grain_amount, iFlags, 
									fracXExp, fracYExp);
									
	iDesertTop = deserts:GetHeight(iDesertTopPercent);
	iDesertBottom = deserts:GetHeight(iDesertBottomPercent);

	plains = Fractal.Create(iW, iH, 
									grain_amount, iFlags, 
									fracXExp, fracYExp);
																		
	iPlainsTop = plains:GetHeight(iPlainsTopPercent);
	iPlainsBottom = plains:GetHeight(iPlainsBottomPercent);

	local variationFrac = Fractal.Create(iW, iH,  
									grain_amount, iFlags, 
									fracXExp, fracYExp);
	
	for iX = 0, iW - 1 do
		for iY = 0, iH - 1 do
			local index = (iY * iW) + iX;
			if (plotTypes[index] == g_PLOT_TYPE_OCEAN) then
				if (IsAdjacentToLand(plotTypes, iX, iY)) then
					terrainTypes[index] = g_TERRAIN_TYPE_COAST;
				else
					terrainTypes[index] = g_TERRAIN_TYPE_OCEAN;
				end
			end
		end
	end

	if (bNoCoastalMountains == true) then
		plotTypes = RemoveCoastalMountains(plotTypes, terrainTypes);
	end

	for iX = 0, iW - 1 do
		for iY = 0, iH - 1 do
			local index = (iY * iW) + iX;
			local lat = GetLatitudeAtPlot(variationFrac, iX, iY);

			if (plotTypes[index] == g_PLOT_TYPE_MOUNTAIN) then
			    terrainTypes[index] = g_TERRAIN_TYPE_GRASS_MOUNTAIN;

				if(lat >= fSnowLatitude) then
					terrainTypes[index] = g_TERRAIN_TYPE_SNOW_MOUNTAIN;
				elseif(lat >= fTundraLatitude) then
					terrainTypes[index] = g_TERRAIN_TYPE_TUNDRA_MOUNTAIN;
				elseif (lat < fGrassLatitude) then
					terrainTypes[index] = g_TERRAIN_TYPE_GRASS_MOUNTAIN;
				else
					local desertVal = deserts:GetHeight(iX, iY);
					local plainsVal = plains:GetHeight(iX, iY);
					if ((desertVal >= iDesertBottom) and (desertVal <= iDesertTop) and (lat >= fDesertBottomLatitude) and (lat < fDesertTopLatitude)) then
						terrainTypes[index] = g_TERRAIN_TYPE_DESERT_MOUNTAIN;
					elseif ((plainsVal >= iPlainsBottom) and (plainsVal <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS_MOUNTAIN;
					end
				end

			elseif (plotTypes[index] ~= g_PLOT_TYPE_OCEAN) then
				terrainTypes[index] = g_TERRAIN_TYPE_GRASS;
				
				if(lat >= fSnowLatitude) then
					terrainTypes[index] = g_TERRAIN_TYPE_SNOW;
				elseif(lat >= fTundraLatitude) then
					terrainTypes[index] = g_TERRAIN_TYPE_TUNDRA;
				elseif (lat < fGrassLatitude) then
					terrainTypes[index] = g_TERRAIN_TYPE_GRASS;
				else
					local desertVal = deserts:GetHeight(iX, iY);
					local plainsVal = plains:GetHeight(iX, iY);
					if ((desertVal >= iDesertBottom) and (desertVal <= iDesertTop) and (lat >= fDesertBottomLatitude) and (lat < fDesertTopLatitude)) then
						terrainTypes[index] = g_TERRAIN_TYPE_DESERT;
					elseif ((plainsVal >= iPlainsBottom) and (plainsVal <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS;
					end
				end
			end
		end
	end

	-- Add extra hills if option is enabled
	if (MapConfiguration.GetValue("BBMExtraHills") == true) then
		print("Extra Hills option enabled");
		plotTypes = AddExtraHills(plotTypes);
	end

	local bNotExpandCoasts = notExpandCoasts or false;

	if bNotExpandCoasts == true then
		return terrainTypes;
	end

	print("Expanding coasts");
	for iI = 0, 2 do
		local shallowWaterPlots = {};
		for iX = 0, iW - 1 do
			for iY = 0, iH - 1 do
				local index = (iY * iW) + iX;
				if (terrainTypes[index] == g_TERRAIN_TYPE_OCEAN) then
					-- Chance for each eligible plot to become an expansion is 1 / iExpansionDiceroll.
					-- Default is two passes at 1/4 chance per eligible plot on each pass.
					if (IsAdjacentToShallowWater(terrainTypes, iX, iY) and TerrainBuilder.GetRandomNumber(4, "add shallows") == 0) then
						table.insert(shallowWaterPlots, index);
					end
				end
			end
		end
		for i, index in ipairs(shallowWaterPlots) do
			terrainTypes[index] = g_TERRAIN_TYPE_COAST;
		end
	end
	
	return terrainTypes; 
end

-------------------------------------------------------------------------------
function AddExtraHills(plotTypes)
    print("Adding extra hills to the map");
    
    local g_iW, g_iH = Map.GetGridSize();
    local hillsAdded = 0;
    local hillConversionChance = 20; -- 20% base chance to convert flat land to hills
    local maxHillsTarget = 0.50; -- Target up to 50% of land as hills
    
    -- First count current hills and land to determine how many we need to add
    local totalLandTiles = 0;
    local existingHills = 0;
    
    for y = 0, g_iH - 1 do
        for x = 0, g_iW - 1 do
            local plot = Map.GetPlot(x, y);
            if plot and not plot:IsWater() and not plot:IsMountain() then
                totalLandTiles = totalLandTiles + 1;
                if plot:IsHills() then
                    existingHills = existingHills + 1;
                end
            end
        end
    end
    
    local currentHillPercent = 0;
    if totalLandTiles > 0 then
        currentHillPercent = existingHills / totalLandTiles;
    end
    
    --print("Current hill percentage: " .. string.format("%.1f%%", currentHillPercent * 100));
    --print("Target hill percentage: " .. string.format("%.1f%%", maxHillsTarget * 100));
    
    -- If we're already over our target, reduce the chance
    --if currentHillPercent >= maxHillsTarget then
    --    print("Already at or above target hill percentage, reducing chance");
    --    hillConversionChance = 20; -- Much lower chance if we already have enough hills
    --end
    
    -- Process plots to add hills
    for y = 0, g_iH - 1 do
        for x = 0, g_iW - 1 do
            local i = y * g_iW + x;
            local plot = Map.GetPlot(x, y);
            
            -- Only process land tiles that are not already hills or mountains
            if plot and not plot:IsWater() and not plot:IsHills() and not plot:IsMountain() then
                -- Higher chance to add hills if adjacent to existing hills or mountains
                local adjacentHillsOrMountains = 0;
                for direction = 0, 5 do
                    local adjacentPlot = Map.GetAdjacentPlot(x, y, direction);
                    if adjacentPlot and (adjacentPlot:IsHills() or adjacentPlot:IsMountain()) then
                        adjacentHillsOrMountains = adjacentHillsOrMountains + 1;
                    end
                end
                
                -- Base chance + bonus for adjacent hills/mountains
                local finalChance = hillConversionChance + (adjacentHillsOrMountains * 5);
                
                -- Roll for hill conversion
                if TerrainBuilder.GetRandomNumber(100, "Extra Hills") < finalChance then
                    -- Make sure we use the correct terrain type
                    local terrainType = plot:GetTerrainType();
                    
                    -- Set the terrain with hills=true
                    TerrainBuilder.SetTerrainType(plot, terrainType, true, false);
                    
                    -- CRITICAL: Update plotTypes array to reflect this is now a hill
                    plotTypes[i] = g_PLOT_TYPE_HILLS;
                    
                    hillsAdded = hillsAdded + 1;
                end
            end
        end
    end
    
    print("Added " .. hillsAdded .. " extra hills to the map");
    
    -- Calculate new hill percentage
    local newHillPercent = 0;
    if totalLandTiles > 0 then
        newHillPercent = (existingHills + hillsAdded) / totalLandTiles;
    end
    print("New hill percentage: " .. string.format("%.1f%%", newHillPercent * 100));
    
    return plotTypes;
end