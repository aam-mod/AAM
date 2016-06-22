
if (isDedicated) exitwith {};


AAM_CDS_FNC_CBA_KEY = {
	private ["_btn"];
	_function = _this select 0;
	_mode = _this select 1;
	_btnData = if (count _this > 2) then {(_this select 2)} else {0};
	_btn = 0;
	_AAM_CDS_chk = 1;
	switch (_function) do {
		/*case ("SHIFT") : {
			if (_mode == "DOWN") then {
				AAM_CDS_MODIFIER_SHIFT = true;
			} else {
				AAM_CDS_MODIFIER_SHIFT = false;
			};
		};*/
		/*case ("ALT") : {
			if (_mode == "DOWN") then {
				AAM_CDS_MODIFIER_ALT = true;
			} else {
				AAM_CDS_MODIFIER_ALT = false;
			};
		};*/
		/*case ("SUPPRESSION") : {
			if (_mode == "DOWN") then {
				AAM_CDS_SUPPRESSION_UNITS = (groupselectedunits player);
				if ({(_x getvariable "AAM_CDS_SUPPRESSION_TARGET") select 1} count (groupselectedunits player) > 0 ) then {
					[] spawn AAM_CDS_SUPPRESSION_OFF;
				} else {
					if ( (count (groupselectedunits player)) > 0) then {
						AAM_CDS_SUPPRESSIONHEIGHT = 0;
						AAM_CDS_SUPPRESSION_INDICATOR = "MCSS_ASM_SUPRESSION_INDICATOR_F" createVehicleLocal (screenToWorld [0.5, 0.5]);
						[] spawn AAM_CDS_MOVE_SUPPRESSION_INDICATOR;
					};
				};
				showCommandingMenu "";
			} else {
				if !(isnull AAM_CDS_SUPPRESSION_INDICATOR) then {
					[AAM_CDS_SUPPRESSION_UNITS] spawn AAM_CDS_SUPPRESSION_ON;
					deletevehicle AAM_CDS_SUPPRESSION_INDICATOR;
				};
			};
		};*/
		// Grenade player
		/*case ("GRENADE") : {
			if (_mode == "DOWN") then {
				BR_GRENADEMODE = true;
				showCommandingMenu "";
				BR_TACV_oefId = ["BR_TACV_oefId", "onEachFrame", "BR_OEFControl"] call BIS_fnc_addStackedEventHandler;
			} else {
				_cun = ((groupselectedunits player) select 0);
				if (BR_GRENADEMODE) then {
					BR_GRENADEMODE = false;
					BR_TEMP_gfeh = _cun addEventHandler ["fired",
					{
						_unit = _this select 0;
						if (_this select 1 == "THROW") then {
							(_this select 6) setVelocity BR_TACV_throwVel;
						};
						if (({(_this select 2) in _x} count (AAM_CDS_GREN_FRAG + AAM_CDS_GREN_STUN)) > 0) then {
							if ((side _unit) == WEST) then {
								_unit say "AAM_CDS_FireInTheHole";
							};
						};
						if (({(_this select 2) in _x} count AAM_CDS_GREN_Smoke) > 0) then {
							if ((side _unit) == WEST) then {
								_unit say "AAM_CDS_ThrowingSmoke";
							};
						};
						_unit removeEventHandler ["fired", BR_TEMP_gfeh];
						_add = if (BR_TACV_throwV0 <= BR_TACV_GV0MaxS) then {BR_TACV_throwV0 * BR_TACV_fatAdd} else {BR_TACV_throwV0 * BR_TACV_fatAdd * 2};
						_unit setFatigue ((getFatigue _unit) + _add);
					}];
					_cun forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
					["BR_TACV_oefId", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
				};
			};
		};*/
		/*case ("LOCK") : {
			if (_mode == "DOWN") then {
				if (AAM_CDS_MODIFIER_LOCK) then {
					AAM_CDS_MODIFIER_LOCK = false;
				} else {
					AAM_CDS_MODIFIER_LOCK = true;
				};
			};
		};*/
		/*case ("INTERFACE") : {
			if (_mode == "DOWN") then {
				if (player == (leader group player)) then {
					nul = [] execVM "CCOREM\gui\AAM_CDS_DIALOG.sqf";
				};
			};
		};*/
		case ("GREN_P") : {
			[_mode] call AAM_CDS_GRENADE_PLAYER;
		};
		/*case ("CDS") : {
			execVM "\AAM_CDS\AAM_CDS_Hud.sqf";
		};*/
		case ("CDS_Bright") : {
			[] call aam_hud_bright;//AAM_CDS_Hud_Bright;
		};
		case ("CDS_NV") : {
			[] call aam_nv_on;//AAM_CDS_HUD_NV;
		};

		case ("CDS_NVBright") : {
			[] call aam_nv_bright;//AAM_CDS_Hud_NVBright;

		};
		/*case ("ACM") : {
			if (ACM_Chk == 1) then {
				call sotg_active_camo_deactivate;
			} else {
				call sotg_active_camo_activate;
			};
			//execVM "\AAM_CDS\Scripts\Active_Camo.sqf";
		};*/
		/*case ("FORM") : {
			if (_mode == "DOWN") then {
				if (isnil "AAM_CDS_FORM_KEY_ID") then {
					[] spawn {
						hint "initialized...please repeat";
						sleep 5;
						hint "";
					};
				};
				AAM_CDS_FORM_KEY_ID = [(_btnData select 1),(_btnData select 2),(_btnData select 3),(_btnData select 4)];
				setMousePosition [0.5, 0.5];
			};
		};*/
		/*case ("ZEUS") : {
			selectplayer AAM_CDS_ZEUS_UNIT;
		};*/
	};

};

AAM_CDS_3D_F_KEYUP = {
	_btn = _this select 1;

	if (_btn == 29) exitwith {
		AAM_CDS_MODIFIER_CTRL = false;
	};
	if (_btn in (actionKeys "User13")) exitwith {
		//AAM_CDS_MODIFIER_SHIFT = false;
	};
	if (_btn in (actionKeys "User14")) exitwith {
		//AAM_CDS_MODIFIER_ALT = false;
	};
};

AAM_CDS_DIALOG_F_KEYDOWN = {
	private ["_teamcolor","_exit","_alt"];

	_btn = _this select 1;
	_gpUnits = ((units group player) - [player]);
	_unitCount = count _gpUnits;
	if (_unitCount > 9) then {_unitCount = 9};
	_teamColor = "MAIN";
	_colorTeamUnits = [];
	if (_btn == 2) exitwith {
		if (MCSS_HELI_INF_MODE == "HELI") then {
			MCSS_HELI_INF_MODE = "INF";
			[] call AAM_CDS_STARTDIAG_INF;
		};

	};
	if (_btn == 3) exitwith {
		if (MCSS_HELI_INF_MODE == "INF") then {
			MCSS_HELI_INF_MODE = "HELI";
			[] call AAM_CDS_STARTDIAG_AIR;
		};
	};

	if (_exit) exitwith {};
	//if (_unitamount > 10) then {_unitAmount = 10};

	//-- shorten range of acceptable keystrokes
	if ( (_btn < 59) OR (_btn > 68) ) then {
		if !(_btn == 41) then {
			_exit = true;
		};
	};

	if (_exit) exitwith {};


	//-- .. F1 Key : Selects all units 2-10
	if (_btn == 41) exitwith {
			systemchat "all units selected or deselected";
	};

	_subtractor = 59;
	if (AAM_CDS_MODIFIER_CTRL) then {_subtractor = 49};
	_unit = ( (AAM_CDS_GROUP_LOGIC getvariable "AAM_CDS_3D_GROUPUNITS") select (_btn - _subtractor) );

	if !(alive _unit) exitwith {}; // necessary?
	_unitIndex = (_btn - 58); // necessary? better use formation index function?
	_arrowIndex = 0;
	nul = [(_btn - _subtractor),AAM_CDS_MODIFIER_SHIFT] call AAM_CDS_BTN_SELECT_UNIT;
};
AAM_CDS_3D_KEYHANDLER_UP = {
	_btn = _this select 1;
	AAM_CDS_3D_DOWNKEYS = AAM_CDS_3D_DOWNKEYS - [_btn];
	_this call AAM_CDS_3D_F_KEYUP;
};
AAM_CDS_3D_F_KEYDOWN = {
	private ["_teamcolor","_exit","_alt"];
	AAM_CDS_LASTUSED_KD = time;
	if !(player == (leader group player)) exitwith {};
	_btn = _this select 1;
	_shift = _this select 2;
	_ctrl = _this select 3;
	_alt = _this select 4;
	_exit = false;
	_relativeDir = 0;
	_dir = 0;
	_flip = false;
	_colorTeamUnits = [];
	_teamColor = "";
	_gpUnits = ((units group player) - [player]);
	_unitCount = count _gpUnits;
	if !(isnil "AAM_CDS_FORM_KEY_ID") then {
		if ([_btn,_shift,_ctrl,_alt] isEqualTo AAM_CDS_FORM_KEY_ID) then {
			{inGameUISetEventHandler [_x, "true"]} foreach ["PrevAction","NextAction"];
			with uiNameSpace do {
				AAM_CDS_QUICKFORMMENU = (finddisplay 46) createDisplay "AAM_CDS_MENU_FORM";
			};
			AAM_CDS_CBA_UP_FORM = (findDisplay 8100) displayAddEventHandler ["KeyUp", {
				_btn1 = _this select 1;
				if (_btn1 == (AAM_CDS_FORM_KEY_ID select 0)) then {
					(findDisplay 8100) closeDisplay 2;
					AAM_CDS_3D_DOWNKEYS = AAM_CDS_3D_DOWNKEYS - [_btn1];
					showCommandingMenu "";
					(findDisplay 8100) displayRemoveEventHandler ["KeyUp", AAM_CDS_CBA_UP_FORM];
					{inGameUISetEventHandler [_x, "false"]} foreach ["PrevAction","NextAction"];
				};
			}];
			setMousePosition [0.5, 0.5];
			_exit = true;
		};
	};
	if (_exit) exitwith {};
	if ((_btn in [103,104,105,106]) && (profileNameSpace getVariable "AAM_CDS_NUM_VAR") ) exitwith {
		if ((count AAM_CDS_3D_UNITS) == 0) then {AAM_CDS_3D_FORM = 0};
		AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_right_ca.paa";
		switch (_btn) do {
			case (103) : {_teamColor = "RED"};
			case (104) : {_teamColor = "GREEN"};
			case (105) : {_teamColor = "BLUE"};
			case (106) : {_teamColor = "YELLOW"};
		};
		for "_i" from 0 to (_unitCount - 1) do {
			if (alive (_gpUnits select _i)) then {
				if ((assignedTeam (_gpUnits select _i)) == _teamColor) then {
					_colorTeamUnits pushback (_gpUnits select _i);
				};
			};
		};
		{
			if (_x in AAM_CDS_3D_UNITS) then {
				[_x] call AAM_CDS_3D_REMOVE_SELECTED;
			};
			if (_x in _colorTeamUnits) then {
				[_x,_btn] call AAM_CDS_3D_ADD_SELECTED;
			};
		} foreach (units group player) - [player];
	};
	if ((_btn in [71,72,73,75,76,77,79,80,81]) && (profileNameSpace getVariable "AAM_CDS_NUM_VAR") ) exitwith {
		if (AAM_CDS_FORMATION_DIR > 360) then {AAM_CDS_FORMATION_DIR = AAM_CDS_FORMATION_DIR - 360};
		if (AAM_CDS_FORMATION_DIR < 0) then {AAM_CDS_FORMATION_DIR = AAM_CDS_FORMATION_DIR + 360};
		_dir = [position player,(screentoworld [0.5,0.5])] call BIS_fnc_dirto;
		if ((_dir > 90) && (_dir < 270)) then {_flip = true};
		_gpUnits = ((AAM_CDS_GROUP_LOGIC getvariable "AAM_CDS_3D_GROUPUNITS") - [player]);
		_unitCount = count _gpUnits;
		if ((count AAM_CDS_3D_UNITS) == 0) then {
			AAM_CDS_NUM_DIR = 0;
			for "_i" from 0 to (_unitCount - 1) do {
				if (alive (_gpUnits select _i)) then {
					[(_gpUnits select _i),_i] call AAM_CDS_3D_ADD_SELECTED;
				};
			};
			if (AAM_CDS_3D_FORM == 0) then {
				AAM_CDS_3D_FORM = 1;
				AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_left_ca.paa";
			};
		};
		while {((AAM_CDS_FORMATION_DIR > 360) OR (AAM_CDS_FORMATION_DIR < 0))} do {
			if (AAM_CDS_FORMATION_DIR > 360) then {
				AAM_CDS_FORMATION_DIR = AAM_CDS_FORMATION_DIR - 360;
			};
			if (AAM_CDS_FORMATION_DIR < 0) then {
				AAM_CDS_FORMATION_DIR = AAM_CDS_FORMATION_DIR + 360;
			};
		};


		switch (_btn) do {
			//- L-Formation top left
			case (71) : {
				AAM_CDS_NUM_DIR = 180;
				AAM_CDS_3D_FORM = 3;
				AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_right_ca.paa";

			};
			//-
			case (72) : {
				// Line Straight + Toggle
				if (AAM_CDS_3D_FORM == 0) then {
					AAM_CDS_3D_FORM = 1;
					AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_left_ca.paa";
				} else {
					AAM_CDS_3D_FORM = 0;
					AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_right_ca.paa";
				};
				AAM_CDS_NUM_DIR = 0;
			};
			//- L-Formation top right
			case (73) : {
				AAM_CDS_NUM_DIR = 180;
				AAM_CDS_3D_FORM = 2;
				AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_left_ca.paa";
			};

			//- Line Formation left
			case (75) : {
				if (AAM_CDS_3D_FORM == 0) then {
					AAM_CDS_3D_FORM = 1;
					AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_left_ca.paa";
				} else {
					AAM_CDS_3D_FORM = 0;
					AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_right_ca.paa";
				};
				AAM_CDS_NUM_DIR = 90;
			};

			// center 76 (NUM5)

			//- Line Formation Right
			case (77) : {
				if (AAM_CDS_3D_FORM == 0) then {
					AAM_CDS_3D_FORM = 1;
					AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_left_ca.paa";
				} else {
					AAM_CDS_3D_FORM = 0;
					AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_right_ca.paa";
				};
				AAM_CDS_NUM_DIR = -90;
			};


			//- L-Formation low left
			case (79) : {
				AAM_CDS_NUM_DIR = 0;
				AAM_CDS_3D_FORM = 2;
				AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_left_ca.paa";
			};
			// Line Straight + Toggle Upside Down
			case (80) : {
				if (AAM_CDS_3D_FORM == 0) then {
					AAM_CDS_3D_FORM = 1;
					AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_left_ca.paa";
				} else {
					AAM_CDS_3D_FORM = 0;
					AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_right_ca.paa";
				};
				AAM_CDS_NUM_DIR = 180;
			};
			//- L-Formation low right
			case (81) : {
				AAM_CDS_NUM_DIR = 0;
				AAM_CDS_3D_FORM = 3;
				AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_right_ca.paa";
			};
		};
	};
	switch (true) do {
		//-- safety if user alt/tabs out of the game
		case (_btn == 15) : {
			if (_alt) then {
				AAM_CDS_MODIFIER_ALT = false;
				_exit = true;
			};
		};
		//-- CTRL button
		case (_btn == 29) : {
			AAM_CDS_MODIFIER_CTRL = true;
			_exit = true;
		};
		//-- customized SHIFT button
		case (_btn in (actionKeys "User13")) : {
			//AAM_CDS_MODIFIER_SHIFT = true;
			_exit = true;
		};
		//-- customized ALT button
		case (_btn in (actionKeys "User14")) : {
			//AAM_CDS_MODIFIER_ALT = true;
			_exit = true;
		};
	};
	if (_exit) exitwith {};

	//-- switch to DIALOG key-eventhandler if C2-dialog is active
	if !(isnull finddisplay 6999) exitwith {
		_this call AAM_CDS_DIALOG_F_KEYDOWN;
	};

	if ( (count AAM_CDS_3D_UNITS) == 0) then {
		AAM_CDS_MODIFIER_LOCK = false;
	};

	_gpUnits = ((units group player) - [player]);
	_unitCount = count _gpUnits;
	//if (_unitCount > 9) then {_unitCount = 9};
	_teamColor = "MAIN";
	_colorTeamUnits = [];
	//-- prevent usage when units are selected in default A3-mode
	if ( ((_btn > 59) OR (_btn < 68) OR (_btn == 87)) && ((count (groupSelectedUnits player)) > 0 )  )  exitwith {
		if (!(_btn == 29) && _ctrl) then {hint "not possible while you have units selected"};
	};

	//-- select a whole color team
	if (AAM_CDS_MODIFIER_ALT) then {

		//if (AAM_CDS_MODIFIER_CTRL) then {
			if ((_btn in [59,60,61,62,63])) then {
				AAM_CDS_3D_FORM = 0;
				AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_right_ca.paa";
				switch (_btn) do {
					case (59) : {_teamColor = "RED"};
					case (60) : {_teamColor = "GREEN"};
					case (61) : {_teamColor = "BLUE"};
					case (62) : {_teamColor = "YELLOW"};
				};
				for "_i" from 0 to (_unitCount - 1) do {
					if (alive (_gpUnits select _i)) then {
						if ((assignedTeam (_gpUnits select _i)) == _teamColor) then {
							_colorTeamUnits pushback (_gpUnits select _i);
						};
					};
				};
				{
					if (_x in AAM_CDS_3D_UNITS) then {
						[_x] call AAM_CDS_3D_REMOVE_SELECTED;
					};
					if (_x in _colorTeamUnits) then {
						[_x,_btn] call AAM_CDS_3D_ADD_SELECTED;
					};
				} foreach (units group player) - [player];
				_exit = true;
			};
		//};
	};
	if (_exit) exitwith {};
	if (_unitamount > 10) then {_unitAmount = 10};
	switch (true) do {
		//-- shorten range of acceptable keystrokes
		case ( (_btn < 59) OR (_btn > 68) ) : {_exit = true};

	};
	if (_exit) exitwith {};

	//-- all commands after this line can assume that the ctrl modifier is active
	if !(AAM_CDS_MODIFIER_CTRL) exitwith {
		if (  ((count (AAM_CDS_3D_UNITS)) > 0 )  )  exitwith {
			{
				[_x] call AAM_CDS_3D_REMOVE_SELECTED;
			} foreach AAM_CDS_3D_UNITS;
		};
	};
	[] spawn {
		sleep 0.02;
		if ((count (groupSelectedUnits player)) > 0 ) then {
			{
				player groupSelectUnit [_x, false];
			} forEach (groupSelectedUnits player);
			showCommandingMenu "";
		};
	};

	// - CTRL modifier + ..
	//-- .. F1 Key : Selects all
	if ((_btn == 59) && !(AAM_CDS_MODIFIER_SHIFT)) exitwith {
		AAM_CDS_3D_FORM = 0;
		AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_right_ca.paa";
		if ((count AAM_CDS_3D_UNITS) == 0) then {
			for "_i" from 0 to (_unitCount - 1) do {
				if (alive (_gpUnits select _i)) then {
					[(_gpUnits select _i),(_btn - 59)] call AAM_CDS_3D_ADD_SELECTED;
				};
			};
		} else {
			{
				[_x] call AAM_CDS_3D_REMOVE_SELECTED;
			} foreach AAM_CDS_3D_UNITS;

		};
	};
	// necessary?
	if ( (count AAM_CDS_SELECTED_UNITS) == 0 ) then {
		AAM_CDS_3D_FORM = 0;
		AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_right_ca.paa";
	};
	_exit = false;
	if (AAM_CDS_MODIFIER_SHIFT) then {
		if ( (_btn - 49) > ( count (AAM_CDS_GROUP_LOGIC getvariable "AAM_CDS_3D_GROUPUNITS") ) ) then {
			_exit = true;
		};
	} else {
		if ( (_btn - 59) > ( count (AAM_CDS_GROUP_LOGIC getvariable "AAM_CDS_3D_GROUPUNITS") ) ) then {
			_exit = true;
		};
	};

	if (_exit) exitwith {};

	_unit = ( (AAM_CDS_GROUP_LOGIC getvariable "AAM_CDS_3D_GROUPUNITS") select (_btn - 59) );
	if (AAM_CDS_MODIFIER_SHIFT) then {
		_unit = ( (AAM_CDS_GROUP_LOGIC getvariable "AAM_CDS_3D_GROUPUNITS") select (_btn - 49) );
	};
	if !(alive _unit) exitwith {}; // necessary?
	_unitIndex = (_btn - 58); // necessary? better use formation index function?
	_arrowIndex = 0;
	if (_unit in AAM_CDS_3D_UNITS) then {
		[_unit] call AAM_CDS_3D_REMOVE_SELECTED;

	} else {
		if (alive _unit) then {
			[_unit,_unitIndex] call AAM_CDS_3D_ADD_SELECTED;
		};
	};
};
AAM_CDS_GREN_MOUSEUP = {
	_cun = AAM_CDS_GTI_UNIT;
	_muzzle = _this select 1;
	_bttn = _this select 2;
	if !(_bttn == 0) exitwith {
		(findDisplay 46) displayRemoveEventHandler ["MouseButtonUP",AAM_CDS_GRENADEHANDLER];
		(findDisplay 46) displayRemoveEventHandler ["KeyUp", AAM_CDS_GRENADEHANDLER_1];
	};

};
AAM_CDS_3D_MouseDown = {
	private ["_bttn","_shft","_ctl","_watchDir","_divisor"];
	_bttn = (_this select 1);
	_shft = (_this select 4);

	if (BR_GRENADEMODE) exitwith {
		if (_bttn == 1) then {
			BR_GRENADEMODE = false;
			["BR_TACV_oefId", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
			(findDisplay 46) displayRemoveEventHandler ["MouseButtonUP",AAM_CDS_GRENADEHANDLER];
		};
	};
	if ( (count AAM_CDS_3D_UNITS) == 0 ) exitwith {};

	//_ctl = (_this select 5);
	//_alt = (_this select 6);
	_watchdir = (AAM_CDS_FORMATION_DIR + 180);
	if (_watchdir > 360) then {_watchdir = (_watchdir - 360)};
	if (_watchdir < 0) then {_watchdir = (_watchdir + 360)};
	_unitAmount = (count AAM_CDS_3D_UNITS);
	_altAmount = ((count AAM_CDS_3D_UNITS) - 1 );
	if (_altAmount < 0) then {_altAmount = 0};
	_divisor = 0;
	_arrow = 0;
	_activeUnits = [];
	//if (AAM_CDS_MODIFIER_CTRL) then {
		if (_bttn == 1) then {
			if (AAM_CDS_MODIFIER_SHIFT) then {
				switch (AAM_CDS_3D_FORM) do {
					case (0) : {
						AAM_CDS_3D_FORM = 1;
						AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_left_ca.paa";
					};
					case (1) : {
						AAM_CDS_3D_FORM = 2;
						AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_left_ca.paa";
					};
					case (2) : {
						AAM_CDS_3D_FORM = 3;
						AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_right_ca.paa";
					};
					case (3) : {
						AAM_CDS_3D_FORM = 4;
						AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\gui\Rsc\RscDisplayMultiplayer\arrow_up_ca.paa";
					};
					case (4) : {
						AAM_CDS_3D_FORM = 5;
						AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\gui\Rsc\RscDisplayMultiplayer\arrow_up_ca.paa";
					};
					case (5) : {
						AAM_CDS_3D_FORM = 0;
						AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_right_ca.paa";
					};
				};
			} else {
				if (AAM_CDS_MODIFIER_ALT) then {
					[] call AAM_CDS_3D_SETSTANCE;
				} else {
					if (AAM_CDS_MODIFIER_CTRL) then {
					['AAM_CDS_STANCE_INDICATOR', "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
					['AAM_CDS_STANCE_ARROWCATOR', "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
					//['AAM_CDS_STANCE_ARROW', "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
					// assign correct watching positions
					if (count AAM_CDS_3D_UNITS > 1) then {
						_divisor = (180 / _altAmount);
					};
					switch (AAM_CDS_3D_FORM) do {
						case (0) : {
							for "_i" from 0 to _altAmount do {
								_arrow = (((AAM_CDS_3D_UNITS select _i) getvariable 'AAM_CDS_3D_DATA') select 0);
								(AAM_CDS_3D_UNITS select _i) doWatch ([_arrow, 100, (_watchdir + (_divisor * _i))] call BIS_fnc_relPos);
							};
						};
						case (1) : {
							for "_i" from 0 to _altAmount do {
								_arrow = (((AAM_CDS_3D_UNITS select _i) getvariable 'AAM_CDS_3D_DATA') select 0);
								(AAM_CDS_3D_UNITS select _i) doWatch ([_arrow, 100, (_watchdir - (_divisor * _i))] call BIS_fnc_relPos);
							};
						};
						case (2) : {
							for "_i" from 0 to _altAmount do {
								_arrow = (((AAM_CDS_3D_UNITS select _i) getvariable 'AAM_CDS_3D_DATA') select 0);
								(AAM_CDS_3D_UNITS select _i) doWatch ([_arrow, 100, (_watchdir - (_divisor * _i))] call BIS_fnc_relPos);
							};
						};
						case (3) : {
							for "_i" from 0 to _altAmount do {
								_arrow = (((AAM_CDS_3D_UNITS select _i) getvariable 'AAM_CDS_3D_DATA') select 0);
								(AAM_CDS_3D_UNITS select _i) doWatch ([_arrow, 100, (_watchdir + (_divisor * _i))] call BIS_fnc_relPos);
							};
						};
						case (4) : {
							for "_i" from 0 to _altAmount do {
								_arrow = (((AAM_CDS_3D_UNITS select _i) getvariable 'AAM_CDS_3D_DATA') select 0);
								(AAM_CDS_3D_UNITS select _i) doWatch ([_arrow, 100, (_watchdir + (_divisor * 0))] call BIS_fnc_relPos);
							};
						};
						case (5) : {
							for "_i" from 0 to _altAmount do {
								_arrow = (((AAM_CDS_3D_UNITS select _i) getvariable 'AAM_CDS_3D_DATA') select 0);
								(AAM_CDS_3D_UNITS select _i) doWatch ([_arrow, 100, (_watchdir + (_divisor * 0))] call BIS_fnc_relPos);
							};
						};
					};
					//-- exit dialog orders
					{
						if ( (count (_x getvariable "AAM_CDS_UNITMOVE")) > 0 ) then {
							_activeUnits pushback _x;
							//sleep 0.1;
						};
						[((_x getvariable 'AAM_CDS_3D_DATA') select 1), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
					} foreach AAM_CDS_3D_UNITS;
					{_x hideobject true} foreach AAM_CDS_3D_ARROWS;



					[_activeUnits,true,false] call AAM_CDS_CANCELPLANS;
					// spawn moving function
					{
						[_x] spawn AAM_CDS_3D_MOVE;
					} foreach AAM_CDS_3D_UNITS;
					{inGameUISetEventHandler [_x, "false"]} foreach ["PrevAction","NextAction"];

					AAM_CDS_3D_FORM = 0;
					AAM_CDS_3D_UNITS = [];
					AAM_CDS_3D_ARROWS = [];
				};};
			};
		};
	//};
};
AAM_CDS_3D_KEYHANDLER_DOWN = {
	_btn = _this select 1;
	//hint str _btn;
	if !(_btn in AAM_CDS_3D_DOWNKEYS) then {
		AAM_CDS_3D_DOWNKEYS pushback _btn;
		_this call AAM_CDS_3D_F_KEYDOWN;
	};
};

// NOTE: RE WRITE ALL THESE DOUBLE FUNCTIONS INTO SINGLE ONES
AAM_CDS_3D_MOUSEWHL_HANDLER = {

	_pos = 0;
	if (!isnull AAM_CDS_SUPPRESSION_INDICATOR) exitwith {
		showCommandingMenu "";
		_pos = position AAM_CDS_SUPPRESSION_INDICATOR;
		if ((_this select 1) > 0) then {
			AAM_CDS_SUPPRESSIONHEIGHT = AAM_CDS_SUPPRESSIONHEIGHT + 0.2;
		} else {
			if ((_pos select 2) > 0) then {
				AAM_CDS_SUPPRESSIONHEIGHT = AAM_CDS_SUPPRESSIONHEIGHT - 0.2;
			};
		};
	};
	if ( AAM_CDS_MODIFIER_CTRL ) exitwith {
		if ((_this select 1)  > 0) then {
			AAM_CDS_3D_SPACING = AAM_CDS_3D_SPACING + 1;
		} else {
			AAM_CDS_3D_SPACING = AAM_CDS_3D_SPACING - 1;
		};
		if (AAM_CDS_3D_SPACING < 2) then {AAM_CDS_3D_SPACING = 2};
	};

	if ( AAM_CDS_MODIFIER_SHIFT ) exitwith {
		if ((_this select 1) > 0 ) then {
			AAM_CDS_3D_FORM = AAM_CDS_3D_FORM + 1;
		} else {
			AAM_CDS_3D_FORM = AAM_CDS_3D_FORM - 1;
		};
		if (AAM_CDS_3D_FORM < 0) then {AAM_CDS_3D_FORM = 5};
		if (AAM_CDS_3D_FORM > 5) then {AAM_CDS_3D_FORM = 0};
		switch (AAM_CDS_3D_FORM) do {
			case (0) : {
				AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_right_ca.paa";
			};
			case (1) : {
				AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_left_ca.paa";
			};
			case (2) : {
				AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_left_ca.paa";
			};
			case (3) : {
				AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_right_ca.paa";
			};
			case (4) : {
				AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\gui\Rsc\RscDisplayMultiplayer\arrow_up_ca.paa";
			};
			case (5) : {
				AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\gui\Rsc\RscDisplayMultiplayer\arrow_up_ca.paa";
			};

		};
	};

	if ( AAM_CDS_MODIFIER_ALT ) exitwith {
		if ((_this select 1)  > 0) then {
			AAM_CDS_3D_STANCE_MODE = AAM_CDS_3D_STANCE_MODE + 1;
		} else {
			AAM_CDS_3D_STANCE_MODE = AAM_CDS_3D_STANCE_MODE - 1;
		};
		if (AAM_CDS_3D_STANCE_MODE < 0) then {AAM_CDS_3D_STANCE_MODE = 3};
		if (AAM_CDS_3D_STANCE_MODE > 3) then {AAM_CDS_3D_STANCE_MODE = 0};
		switch (AAM_CDS_3D_STANCE_MODE) do {
			case (0) : {
				AAM_CDS_3D_STANCE_ICON = "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_ca.paa";
				AAM_CDS_3D_STANCE_FINAL = "DOWN";
				AAM_CDS_3D_STANCE_COLOR = [1,1,0,0.2];
			};
			case (1) : {
				AAM_CDS_3D_STANCE_ICON = "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_crouch_ca.paa";
				AAM_CDS_3D_STANCE_FINAL = "MIDDLE";
				AAM_CDS_3D_STANCE_COLOR = [1,1,0,0.2];
			};
			case (2) : {
				AAM_CDS_3D_STANCE_ICON = "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_stand_ca.paa";
				AAM_CDS_3D_STANCE_FINAL = "UP";
				AAM_CDS_3D_STANCE_COLOR = [1,1,0,0.2];
			};
			case (3) : {
				AAM_CDS_3D_STANCE_ICON = "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_stand_ca.paa";
				AAM_CDS_3D_STANCE_FINAL = "AUTO";
				AAM_CDS_3D_STANCE_COLOR = [1,1,1,0.2];
			};
		};
	};

	if (AAM_CDS_FORMATION_DIR > 360) then {AAM_CDS_FORMATION_DIR = AAM_CDS_FORMATION_DIR - 360};
	if (AAM_CDS_FORMATION_DIR < 0) then {AAM_CDS_FORMATION_DIR = AAM_CDS_FORMATION_DIR + 360};

	_factor = 1;

	_speed = (_this select 1);
	if (_speed < 0) then {_speed = (_speed * -1)};
	switch (true) do {
		case (_speed == 1.2) : {_factor = 1};
		case (_speed == 2.4) : {_factor = 5};
		case (_speed >= 3.6) : {_factor = 25};
	};

	if ((_this select 1) < 0 ) then {_factor = (_factor * -1)};
	AAM_CDS_FORMATION_DIR = AAM_CDS_FORMATION_DIR + _factor;
	AAM_CDS_SCROLLTIME = time;

	if (AAM_CDS_FORMATION_DIR > 360) then {AAM_CDS_FORMATION_DIR = AAM_CDS_FORMATION_DIR - 360};
	if (AAM_CDS_FORMATION_DIR < 0) then {AAM_CDS_FORMATION_DIR = AAM_CDS_FORMATION_DIR + 360};
};