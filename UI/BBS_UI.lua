local g_version = "0.24" --TODO fix get version from modinfo
-------------------------------------------------------------------------------
print("-------------- BBM UI v"..g_version.." -D- Init --------------")
-------------------------------------------------------------------------------
function OnLocalPlayerTurnBegin()

	if Game.GetLocalPlayer() == -1 then
		return
	end
	if Game.GetCurrentGameTurn() == GameConfiguration.GetStartTurn() then
		print("BBM UI Welcome ", g_version)
		local message = "BBM #"..g_version.." loaded succesfully!"
		print("BBM_ACTUALMINDIST == ", Game:GetProperty("BBM_ACTUALMINDIST"))
		if Game:GetProperty("BBS_TEAMERCONTINENTCHECK") ~= nil and Game:GetProperty("BBS_TEAMERCONTINENTCHECK") then
			print("BBS_TEAMERCONTINENTCHECK - ", Game:GetProperty("BBS_TEAMERCONTINENTCHECK"))
			NotificationManager.SendNotification(Game.GetLocalPlayer(), NotificationTypes.USER_CONTCHECK, "WARNING - Teamer setting - Could not place a team on at least two continents.")
		end
		if (Game:GetProperty("BBM_RESPAWN") == false) then
			message = message.." Firaxis Placement Algorithm has been used."
			NotificationManager.SendNotification(Game.GetLocalPlayer(), NotificationTypes.BARBARIANS_SIGHTED, message);
		else
			message = message.." BBM Placement Algorithm successful."
			if Game:GetProperty("BBM_ACTUALMINDIST") ~= nil then
				message = message.." Minimum Distance is "..tostring(Game:GetProperty("BBM_MAJOR_DISTANCE"))
			end
			--if Game:GetProperty("BBM_MAJOR_DISTANCE") ~= nil then
			--	message = message.." (Map Min= "..tostring(Game:GetProperty("BBM_MAJOR_DISTANCE")..")")
			--end
			--print(Game:GetProperty("BBS_ITERATION"),Game:GetProperty("BBS_MAJOR_DISTANCE"))
			NotificationManager.SendNotification(Game.GetLocalPlayer(), NotificationTypes.USER_DEFINED_5, message);
		end
	if (Game:GetProperty("BBS_DISTANCE_ERROR") ~= nil) then
	message = tostring(Game:GetProperty("BBS_DISTANCE_ERROR"))
	NotificationManager.SendNotification(Game.GetLocalPlayer(), NotificationTypes.BARBARIANS_SIGHTED, message);
	end
	if (Game:GetProperty("BBS_MINOR_FAILING_TOTAL") ~= nil) then
	message = tostring(Game:GetProperty("BBS_MINOR_FAILING_TOTAL")).." CS had to be razed to observe minimum distances requirements."
	NotificationManager.SendNotification(Game.GetLocalPlayer(), NotificationTypes.BARBARIANS_SIGHTED, message);
	end


	end
	
	
end


Events.LocalPlayerTurnBegin.Add( OnLocalPlayerTurnBegin);


-- ===========================================================================
function GetLocalModVersion(id)
	if id == nil then
		return nil
	end
	
	local mods = Modding.GetInstalledMods();
	if(mods == nil or #mods == 0) then
		print("No mods locally installed!")
		return nil
	end
	
	local handle = -1
	for i,mod in ipairs(mods) do
		if mod.Id == id then
			handle = mod.Handle
			break
		end
	end
	if handle ~= -1 then
		local version = Modding.GetModProperty(handle, "Version");
		print("id",id,version)
		return version
		else
		return nil
	end
	
	
end