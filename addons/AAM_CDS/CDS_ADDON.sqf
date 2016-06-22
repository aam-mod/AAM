if (isDedicated) exitwith {};

////////////////////////////////// CBA Keybindings Setup, calls precompiled functions
AAM_CDS_ADD_KEYBINDS_EHD = -1;
AAM_CDS_ADD_KEYBINDS_EHU = -1;
AAM_CDS_ADD_KEYBINDS_EMB = -1;
AAM_CDS_ADD_KEYBINDS_EMZ = -1;

call compile preprocessFileLineNumbers "AAM_CDS\AAM_CDS.sqf";
//call compile preprocessFileLineNumbers "AAM_CDS\AAM_CDS_hud.sqf"; //actual hud calling ?

AAM_CDS_ADD_KEYBINDS =
{
	if !(AAM_CDS_ADD_KEYBINDS_EHD == -1) then {(findDisplay 46) displayRemoveEventHandler ["KeyDown",AAM_CDS_ADD_KEYBINDS_EHD]};
	if !(AAM_CDS_ADD_KEYBINDS_EHU == -1) then {(findDisplay 46) displayRemoveEventHandler ["KeyUp",AAM_CDS_ADD_KEYBINDS_EHU]};
	if !(AAM_CDS_ADD_KEYBINDS_EMB == -1) then {(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown",AAM_CDS_ADD_KEYBINDS_EMB];};
	if !(AAM_CDS_ADD_KEYBINDS_EMZ == -1) then {(findDisplay 46) displayRemoveEventHandler ["MouseZChanged",AAM_CDS_ADD_KEYBINDS_EMZ];};

	//-- Prevent Bleeding of UI Eventhandlers
	AAM_CDS_KEY_VAR_KD  = uiNamespace getVariable "AAM_CDS_INDEX_VAR_KEYD";
	if not (isNil "AAM_CDS_KEY_VAR_KD") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown",AAM_CDS_KEY_VAR_KD];};

	AAM_CDS_KEY_VAR_KU  = uiNamespace getVariable "AAM_CDS_INDEX_VAR_KEYU";
	if not (isNil "AAM_CDS_KEY_VAR_KU") then {(findDisplay 46) displayRemoveEventHandler ["KeyUp",AAM_CDS_KEY_VAR_KU];};

	AAM_CDS_MOUSE_VAR_B  = uiNamespace getVariable "AAM_CDS_INDEX_VAR_MOUSEB";
	if not (isNil "AAM_CDS_MOUSE_VAR_B") then {(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown",AAM_CDS_MOUSE_VAR_B];};

	AAM_CDS_MOUSE_VAR_Z  = uiNamespace getVariable "AAM_CDS_INDEX_VAR_MOUSEZ";
	if not (isNil "AAM_CDS_MOUSE_VAR_Z") then {(findDisplay 46) displayRemoveEventHandler ["mouseZChanged",AAM_CDS_MOUSE_VAR_Z];};


	AAM_CDS_ADD_KEYBINDS_EHD =
		//KEY PRESS
		(findDisplay 46) displayAddEventHandler ["KeyDown",
		{
			_this call AAM_CDS_3D_KEYHANDLER_DOWN;
			[(_this select 1),[(_this select 2),(_this select 3),(_this select 4)]] call AAM_CDS_GET_KEY_BOOL
		}];
		uiNamespace setVariable ["AAM_CDS_INDEX_VAR_KEYD",AAM_CDS_ADD_KEYBINDS_EHD];

	AAM_CDS_ADD_KEYBINDS_EHU =
		//KEY RELEASE
		(findDisplay 46) displayAddEventHandler ["KeyUp",
		{
			_this call AAM_CDS_3D_KEYHANDLER_UP;
			false
		}];
		uiNamespace setVariable ["AAM_CDS_INDEX_VAR_KEYU",AAM_CDS_ADD_KEYBINDS_EHU];

	AAM_CDS_ADD_KEYBINDS_EMB =
		// MOUSEBUTTON
		(findDisplay 46) displayAddEventHandler ["MouseButtonDown",
		{
			_this spawn AAM_CDS_3D_MouseDown;
			false
		}];
		uiNamespace setVariable ["AAM_CDS_INDEX_VAR_MOUSEB",AAM_CDS_ADD_KEYBINDS_EMB];

	AAM_CDS_ADD_KEYBINDS_EMZ =
		// MOUSEWHEEL
		(findDisplay 46) displayAddEventHandler ["MouseZChanged",
		{
			_this call AAM_CDS_3D_MOUSEWHL_HANDLER;
			if (!isnull (finddisplay 6999)) then {true} else {false}
		}];
		uiNamespace setVariable ["AAM_CDS_INDEX_VAR_MOUSEZ",AAM_CDS_ADD_KEYBINDS_EMZ];

	 //["C2", "C2_KeyFnc_Shift2", ["Shift Modifier", "Customizable Shift-layer for C2 Functions. NEEDS TO INCLUDE CTRL KEY!!"], {["SHIFT","DOWN"] call AAM_CDS_FNC_CBA_KEY}, {["SHIFT","UP"] call AAM_CDS_FNC_CBA_KEY}, [42,[true,false,false]] ] call cba_fnc_addKeybind;

	//["AAM", "AAM_KeyFnc_CDS", ["C.D.S.", "Activate CDS Display"], {["CDS"]call AAM_CDS_FNC_CBA_KEY}, {}, [15,[true,false,false]],true] call cba_fnc_addKeybind;

	["AAM", "AAM_KeyFnc_CDSB", ["CDS Brightness", "Adjust CDS Brightness"], {["CDS_Bright"]call AAM_CDS_FNC_CBA_KEY}, {}, [15,[true,false,false]],true] call cba_fnc_addKeybind;

	["AAM", "AAM_KeyFnc_CDSNV", ["CDS Nightvision", "Activate CDS Nightvision"], {["CDS_NV"]call AAM_CDS_FNC_CBA_KEY}, {}, [15,[true,false,false]],true] call cba_fnc_addKeybind;

	["AAM", "AAM_KeyFnc_CDSNVB", ["CDS NV Brightness", "CDS Nightvision Brightness"], {["CDS_NVBright"]call AAM_CDS_FNC_CBA_KEY}, {}, [15,[true,false,false]],true] call cba_fnc_addKeybind;

	["AAM", "AAM_KeyFnc_Grenade", ["GetTactical Grenade", "Gives enhanced throwing-options"], {["GREN_P","DOWN"] call AAM_CDS_FNC_CBA_KEY}, {["GREN_P","UP"] call AAM_CDS_FNC_CBA_KEY}, [35,[false,false,false]],false ] call cba_fnc_addKeybind;

		//["C2", "C2_KeyFnc_Alt2", ["Alt Modifier", "Customizable Alt-layer for C2 functions. NEEDS TO INCLUDE CTRL KEY!!"], {["ALT","DOWN"] call AAM_CDS_FNC_CBA_KEY}, {["ALT","UP"] call AAM_CDS_FNC_CBA_KEY}, [56,[false,false,true]] ] call cba_fnc_addKeybind;

		//["AAM", "AAM_KeyFnc_ACM", ["A.CM.", "Active Camo Activation"], {["ACM"] call AAM_CDS_FNC_CBA_KEY}, {}, [15,[false,false,false]],true] call cba_fnc_addKeybind;

		//["C2", "C2_KeyFnc_Suppress", ["Suppression Hotkey", "Key for ingame suppression actions"], {["SUPPRESSION","DOWN"] call AAM_CDS_FNC_CBA_KEY}, {["SUPPRESSION","UP"] call AAM_CDS_FNC_CBA_KEY}, [20,[false,false,false]],false ] call cba_fnc_addKeybind;

		//["C2", "C2_KeyFnc_Lock", ["Lock Formation", "Locks the indicator objects in position while maintaining other options"], {["LOCK","DOWN"] call AAM_CDS_FNC_CBA_KEY}, {}, [38,[false,false,false]],false ] call cba_fnc_addKeybind;

		//["C2", "C2_KeyFnc_Formation_Menu_1", ["Quick Formation Menu", "Allows formation selection with mouse instead of keys"], {["FORM","DOWN",_this] call AAM_CDS_FNC_CBA_KEY}, {["FORM","UP"] call AAM_CDS_FNC_CBA_KEY}, [33,[false,true,false]],true] call cba_fnc_addKeybind;

		//["C2", "C2_KeyFnc_ZEUS_Remote", ["C2-ZEUS Exit", "Exit C2-Zeus Remote"], {["ZEUS","DOWN"] call AAM_CDS_FNC_CBA_KEY}, {}, [21,[true,false,false]],false] call cba_fnc_addKeybind;
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
[] spawn
		{
		/*
			_hudrange = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_range");
			_hudcolour = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_colour");
			_hudfriendlycolour = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_friendlycolour");
			_hudenemycolour = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_enemycolour");
			_hudcivcolour = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_civcolour");
			_hudsquadcolour = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_squadcolour");
			_hudalpha = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_alpha");
			_hudasl = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_asl");
			_hudazt = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_azt");
			_hudgrd = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_grd");
			_hudlmt = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_lmt");
			_hudtmp = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_tmp");
			_hudhlt = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_hlt");
			_hudrng = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_rng");
			_hudvel = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_vel");
			_hudprx = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_prx");
			_hudunit = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_unit");
			_hudoffset = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_offset");
			_hudscale = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_scale");
			_hudtextscale = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_textscale");
			_huddegrade = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_degradation");
			_hudthird = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_thirdperson");
			_hudtac = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_addtac");
			_hudicons = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_icons");
			_hudvehfac = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_vehiclefactor");
			_hudaudible = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_audible");
		*/
		waitUntil {!isNil "BIS_fnc_init"};
		while {true} do
			{
			_hud = /*[_hudrange,_hudcolour,_hudfriendlycolour,_hudenemycolour,_hudcivcolour,_hudsquadcolour,_hudalpha,_hudasl,_hudazt,_hudgrd,_hudlmt,_hudtmp,_hudhlt,_hudrng,_hudvel,_hudprx,_hudunit,_hudoffset,_hudscale,_hudtextscale,_huddegrade,_hudthird,_hudtac,_hudicons,_hudvehfac,_hudaudible]*/
			execvm "\AAM_CDS\aam_cds_hud.sqf";
			waitUntil {sleep 10; scriptDone _hud};
			};
		};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*
OLD TAKE ON THINGS
////////////////////////////////// Compiles and preloads things

call compile preprocessFileLineNumbers "AAM_CDS\Scripts\AAM_CBA_Keys.sqf"; //Keybindings
call compile preprocessFileLineNumbers "AAM_CDS\Scripts\AAM_FNC.sqf"; //functions
call compile preprocessFileLineNumbers "AAM_CDS\Scripts\AAM_Grenade_Act.sqf"; //Grenade Action
call compile preprocessFileLineNumbers "AAM_CDS\Scripts\AAM_Grenade_Data.sqf"; //Grenade


////////////////////////////////// Main Start
waituntil {alive player};
// Runner
0 spawn
{	while {true} do {
		waitUntil {!isNull (findDisplay 46) && !isNull player};
		sleep 1;
		waituntil {alive player};
		sleep 0.1;
		[] call AAM_CDS_ADD_KEYBINDS;
		//systemchat 'runner';
		MCSS_C2_LOADED_EVH = addMissionEventHandler ["Loaded",
		{
			[] spawn {
				waitUntil {!isNull (findDisplay 46) && !isNull player};
				sleep 1;
				waituntil {alive player};
				MCSS_C2_3D_DOWNKEYS = [];
				[] call AAM_CDS_ADD_KEYBINDS;
			};
		}];
		waitUntil {isNull (findDisplay 46)};
		waituntil {!alive player};
	};

};

//////////////////////////////////////////////////////OLD CDS INIT//////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
if (hasinterface) then {
	//waitUntil{!isNil "BIS_fnc_init"};
	waituntil {!(IsNull (findDisplay 46))};
	uiSleep 0.5;
	//Key press detection
	private "_keydown";
	_keydown = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this select 1 call CDS_FNC;"];
};

CDS_FNC = {
	switch (_this) do {
		case 36: {
			nul = [] execvm "\AAM_CDS\Scripts\AAM_CDS_Hud.sqf";
		};
		default {};
	};
};