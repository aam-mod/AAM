
if (isDedicated) exitwith {};


call compile preprocessFileLineNumbers "AAM_CDS\AAM_CDS_events.sqf";
call compile preprocessFileLineNumbers "AAM_CDS\AAM_CDS_INIT.sqf";
call compile preprocessFileLineNumbers "AAM_CDS\AAM_CDS_Mode_HUD.sqf";
call compile preprocessFileLineNumbers "AAM_CDS\AAM_CDS_Hud_Fnc.sqf"; // TPE HUD functions
//call compile preprocessFileLineNumbers "AAM_CDS\Active_Camo.sqf";
//call compile preprocessFileLineNumbers "AAM_CDS\AAM_CDS_Hud.sqf";
[] execVM "AAM_CDS\AAM_CDS_EXECUTE.SQF";

AAM_CDS_loaded = true;