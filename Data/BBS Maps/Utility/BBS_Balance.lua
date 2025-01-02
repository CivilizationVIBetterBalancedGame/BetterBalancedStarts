------------------------------------------------------------------------------
--	FILE:	 BBS_Balance.lua 2.2.0
--	AUTHOR:  D. / Jack The Narrator, 57Fan
--	PURPOSE: Rebalance the map spawn post placement 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ExposedMembers.LuaEvents = LuaEvents

include "MapEnums"
include "SupportFunctions"
include "BBM_AssignStartingPlots"
include("MapUtilities");
include "BBM_MapUtils";

local world_age = 2;
local high_roll = 0.15;
local bHighRoll = false;

local m_BBGId:string = "bdffd1bc-49e5-4dd6-81b2-aab1eb55563f";
local m_BBGEnabled:boolean = false;


function BBS_Script()
    print("Not Executing Balancing Spawn", os.date("%c"))
    return 
end


