/*

_CDSgroup = groupId (group player);
_CDSname = name vehicle player;
ACE medic class ?  or shactac Medic class for medic cross unit icon ?

REDO ALL

	TPW HUD - Realistic Heads Up Display for Tactical Goggles
	Author: tpw
	Additional code: hypnomatic
	Date: 20150413
	Version: 1.48
	Requires: CBA A3, tpw_core.sqf
	Compatibility: SP, MP client

	Disclaimer: Feel free to use and modify this code, on the proviso that you post back changes and improvements so that everyone can benefit from them, and acknowledge the original author (tpw) in any derivative works.

	To use:
	1 - Save this script into your mission directory as eg tpw_hud.sqf
	2 - Call it with 0 =
	[
	[50,500], // Min/max range of goggles
	[1,1,1], // HUD colour
	[0,1,1], // Friendly colour
	[1,0.5,0], // Enemy units colour
	[1,1,1], // Civ colour
	[0,1,0], // Squad and marker colour
	0.6, // Initial HUD brightness
	[1,0.4,0.4,1], // ASL where 1 = active ( 0 = inactive), 0.4 = X position, 0.4 = Y position, 1 = text size
	[1,0.5,0.4,1], // AZT
	[1,0.6,0.4,1], // GRD
	[1,0.4,0.5,1], // LMT
		[1,0.6,0.5,1], // TMP
	[1,0.4,0.6,1], // HLT
	[1, 0.5,0.6,1], // RNG
	[1,0.6,0.6,1], // VEL
	[1,	0.5,0.5,1], // PRX
	[1,1,0.25,0.5], // UNITS where 1 = active ( 0 = inactive), 1 = icon max size, 0.25 = icon min size, 0.5 = text size ( 1 = same size as HUD text)
	[0.03,0], //HUD offset [x,y] -1 to 1
	1, // HUD scale. > 1 = larger
	1, // Text scale. > 1 = larger
	1, // HUD distance degradation. 0 = no degradation
	0, // No HUD in 3rd person. 1 = HUD in 3rd person
	1, // Add TAC glasses to player's uniform if not present. 0 = don't add
	[24,23,30,29,24,23,30,29,22,20], // ICONS [unit, hidden unit, vehicle, hidden vehicle, enemy unit, hidden enemy unit, enemy vehicle, hidden enemy vehicle, marker, predictor]
	1.5, // Detection range multiplication factor for vehicles (1.5 = 750m max detection range for vehicles vs 500m for units)
	1 // Audible warning when enemies detected
	] execvm "tpw_hud.sqf";

	THIS SCRIPT WON'T RUN ON DEDICATED SERVERS.


	0 cutRsc ["AAM_lens","PLAIN",0,false];  - Show HUD FRAME
	0 cutRsc ["AAM_clear","PLAIN",0,false]; - Hide HUD FRAME

*/

if (isDedicated) exitWith {};
WaitUntil {!isNull FindDisplay 46};
//if (count _this < 26) exitwith {hint "TPW HUD incorrect/ no config, exiting."};
//WaitUntil {!isnil "tpw_core_sunangle"};
tpw_core_sunangle = 2;
//VARIABLES
	tpw_hud_version = "1.48";
	tpw_hud_range = [5,300];
	tpw_hud_colour = [0.55,0.56,0.91]; // HUD BLU
	tpw_hud_friendlycolour = [0.55,0.56,0.91]; // Friendlies BLU
	tpw_hud_enemycolour = [1,0,0]; // Enemies RED
	tpw_hud_civcolour = [0.55,0.56,0.91]; // Civs - REMOVE
	tpw_hud_squadcolour = [0.55,0.56,0.91]; // Squad and markers BLU
	AAM_CDS_markercolour = [1,1,1]; //markers  WHITE
	AAM_CDS_markercolourB = [0,0,0]; //markers  BLACK
	tpw_hud_alpha = 1; // initial HUD brightness
	AAM_cds_no = 0; // for non-visiable HUD elements
	tpw_hud_asl = [1,0.58,0.46,1]; // ASL		show / x / y / alpha   0.45 Y
	tpw_hud_azt = [1,0.50,0.46,1]; // AZT
	tpw_hud_grd = [1,0.40,0.46,1]; // GRD

	tpw_hud_hlt = [1,0.39,0.5,1]; // HLT 0.4,0.5

	tpw_hud_lmt = [1,0.34,0.56,1]; // LMT 0.4, 0.55

	tpw_hud_tmp = [0,0.5,0.5,1]; // TMP
	tpw_hud_rng = [0,0.5,0.55,1]; // RNG
	tpw_hud_vel = [0,0.4,0.55,1]; // VEL
	tpw_hud_prx = [0,0.5,0.55,1]; // PRX

	tpw_hud_unit = [1,1,0.25,0.75]; // UNITS
	tpw_hud_offset = [-0.01,0.29]; // Offset [0.35,0.28] - orig -0.01
	tpw_hud_scale = 1; // Scale
	tpw_hud_textscale = 1; // Text scale
	tpw_hud_degradation = 1; // HUD degradation
	tpw_hud_thirdperson = 0; // HUD in 3rd person view
	tpw_hud_addtac = 0; // Add TAC glasses
	tpw_hud_icons = [4,28,10,21,22,21,28,21,34,21]; // Icon types [4,0,10,0,22,0,28,0,23,0]
	tpw_hud_vehiclefactor = 1; // Range factor for vehicles
	tpw_hud_audible = 0;

// DEFAULT HUD ELEMENT LAYOUT (SCRIPT VERSION)
	tpw_hud_asl_txt = "%1<t size='0.5' font='AAMFS' shadow='true'><br />ASL</t>";
	tpw_hud_azt_txt = "%1<t size='0.5' font='AAMFS' shadow='true'><br />AZT %2</t>";
	tpw_hud_grd_txt = " %1<t size='0.5' font='AAMFS' shadow='true'><br />    GRD</t>";

	tpw_hud_lmt_txt = "%1%2<t size='0.5' font='AAMFS' shadow='true'> LMT</t>";
	tpw_hud_tmp_txt = "%1<t size='0.5' font='AAMFS' shadow='true'><br />TMP</t>";
	tpw_hud_hlt_txt = "<t size='2' font='AAMFS' shadow='true'>%1</t><t size='0.5' font='AAMFS' shadow='true'><br />  BPM</t>";

	tpw_hud_rng_txt = "%1<t size='0.5' font='AAMFS' shadow='true'><br />RNG</t>";
	tpw_hud_vel_txt = "%1<t size='0.5' font='AAMFS' shadow='true'><br />VEL</t>";
	tpw_hud_airvel_txt = "%1<t size='0.5' font='AAMFS' shadow='true'><br />VEL KTS</t>";
	tpw_hud_prx_txt = "<t color='%5'>%1</t> <t color='%6'>%2</t> <t color='%7'>%3</t> <t color='%8'>%4</t><t size='0.5'><br />PRX</t>";
	//aam_cds_name = "Monty - ALpha 2-1"
	//<t shadow='true'></t>

// HUD VARIABLES
	tpw_hud_eh=false;
	tpw_hud_active=true;
	tpw_hud_params =[tpw_hud_asl,tpw_hud_azt,tpw_hud_grd,tpw_hud_lmt,tpw_hud_prx,tpw_hud_tmp,tpw_hud_hlt,tpw_hud_rng,tpw_hud_vel];
	tpw_hud_offset_x = tpw_hud_offset select 0;
	tpw_hud_offset_y = tpw_hud_offset select 1;
	tpw_hud_minrange = tpw_hud_range select 0;
	tpw_hud_maxrange = tpw_hud_range select 1;
	tpw_hud_vehiclerange = tpw_hud_maxrange * tpw_hud_vehiclefactor;
	tpw_hud_markers = [];
	tpw_hud_gogglewearers = [];
	tpw_hud_nearunits = [];
	tpw_hud_muzvel = 800;
	tpw_hud_feh=false;
	tpw_hud_nvflag = false;
	tpw_hud_nv = false;
	tpw_nv_fac = 0;
	tpw_nv_brightness = [5,2,1,0.5,0.25,0.125];
	tpw_hud_visible = [];
	tpw_hud_hidden = [];
	tpw_hud_unsure = [];
	tpw_hud_restingheartrate = floor (55 + (random 10));
	tpw_hud_prevenemies = 0;
	tpw_hud_tracer_tracedUnits = [];
	tpw_hud_traceactive = 0;

// ACTIVATE HUD FUNCTIONS
tpw_hud_fnc_activate = {
	tpw_hud_shortfunc = []; // functions for the short loop
	tpw_hud_longfunc = []; // functions for the long loop

	if ((tpw_hud_unit select 0) == 1) then {
		tpw_hud_shortfunc = tpw_hud_shortfunc + [tpw_hud_fnc_markerscan];
		tpw_hud_shortfunc = tpw_hud_shortfunc + [tpw_hud_fnc_unitscan];
		tpw_hud_shortfunc = tpw_hud_shortfunc + [tpw_hud_fnc_unitprepare];
		tpw_hud_shortfunc = tpw_hud_shortfunc + [tpw_hud_fnc_unitshow];
		tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_gogglecheck];
		tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_mapmarkers];
		//tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_feh];
		if (tpw_hud_degradation == 1) then {
			tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_effectiveness];
			};
		};
	if ((tpw_hud_asl select 0) == 1) then {
		tpw_hud_shortfunc = tpw_hud_shortfunc + [tpw_hud_fnc_asl];
		};
	if ((tpw_hud_azt select 0) == 1) then {
		tpw_hud_shortfunc = tpw_hud_shortfunc + [tpw_hud_fnc_azt];

		};
	if ((tpw_hud_grd select 0) == 1) then {
		tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_grd];
		};
	if ((tpw_hud_lmt select 0) == 1) then {
		tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_lmt];
		};
	if ((tpw_hud_prx select 0) == 1) then {
		tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_prx];
		};
	if ((tpw_hud_tmp select 0) == 1) then {
		if (!isnil "tpw_fog_active") then {
			waituntil {!isnil "tpw_fog_temp"};
			tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_tmp];
			};
		};
	if ((tpw_hud_hlt select 0) == 1) then {
		tpw_hud_longfunc = tpw_hud_longfunc + [tpw_hud_fnc_hlt];
		};
	if ((tpw_hud_rng select 0) == 1) then {
		tpw_hud_shortfunc = tpw_hud_shortfunc + [tpw_hud_fnc_rng];
		};
	if ((tpw_hud_vel select 0) == 1) then {
		tpw_hud_shortfunc = tpw_hud_shortfunc + [tpw_hud_fnc_vel];
		};
	tpw_hud_shortfunc = tpw_hud_shortfunc + [tpw_hud_fnc_nv];
};
// ADD TAC GLASSES G_Tactical_Black
tpw_hud_fnc_addgoggles = {
	if (
	!("ADF_Wrap_CDS" in items player) &&
	!("G_Tactical_Black" in items player) &&
	!("G_Tactical_Clear" in items player) &&
	!("G_Bandanna_shades" in items player) &&
	!("G_Goggles_VR" in items player) &&
	!("ADF_Wrap_CDS" in vestitems player) &&
	!("G_Tactical_Black" in vestitems player) &&
	!("G_Tactical_Clear" in vestitems player) &&
	!("G_Bandanna_shades" in vestitems player) &&
	!("G_Goggles_VR" in vestitems player) &&
	!("ADF_Wrap_CDS" in backpackitems player) &&
	!("G_Tactical_Black" in backpackitems player) &&
	!("G_Tactical_Clear" in backpackitems player) &&
	!("G_Bandanna_shades" in backpackitems player) &&
	!("G_Goggles_VR" in backpackitems player) &&
	!(player getvariable ["tpw_hud_goggles",0] == 1)) then {
		if (vehicle player == player) then {
			player additemtouniform "G_Tactical_Black";
			} else {
			player addGoggles "G_Tactical_Black";
			};
		};
};
// ASL
tpw_hud_fnc_asl = {
	private ["_asl"];
	_asl = round ((getposasl player) select 2);
	_ctrl_asl ctrlSetStructuredText parseText format[tpw_hud_asl_txt,_asl];
};
// AZIMUTH
tpw_hud_fnc_azt = {
	private ["_azt","_ang","_points","_num","_compass"];
	_azt = (((eyedirection player) select 0) atan2 ((eyedirection player) select 1));
	_ang = _azt;
	if (_azt < 0) then
		{
		_azt = 360 + _azt;
		};
	_ang = _ang + 11.25;
	if (_ang < 0) then
		{
		_ang = 360 + _ang;
		};
	_points = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"];
	_num = floor (_ang / 22.5);
	_compass = _points select _num;
	_ctrl_azt ctrlSetStructuredText parseText format [tpw_hud_azt_txt,_compass,round _azt]; //[tpw_hud_azt_txt,_compass,round _azt]
};
// SET DISPLAY PARAMETERS FOR EACH HUD CONTROL
tpw_hud_fnc_displayparams = {
	private ["_display","_param","_ctrl","_xpos","_ypos","_diff","_size","_squadrgb","_friendlyrgb","_enemyrgb"];
	disableSerialization;
	_display = uiNamespace getVariable "TPW_HUD_DISPLAY";
	for "_i" from 0 to (count tpw_hud_params - 1) do {
		_param = tpw_hud_params select _i;
		_ctrl = _display displayctrl (100001 + _i);
		_xpos = (_param select 1);
		_ypos = (_param select 2);

		// Scale
		if (_xpos < 0.5) then {
			_diff = 0.5 - _xpos;
			_xpos = 0.5 - (_diff * tpw_hud_scale);
			};
		if (_xpos > 0.5) then {
			_diff = _xpos - 0.5;
			_xpos = 0.5 + (_diff * tpw_hud_scale);
			};
		if (_ypos < 0.5) then {
			_diff = 0.5 - _ypos;
			_ypos = 0.5 - (_diff * tpw_hud_scale);
			};
		if (_ypos > 0.5) then {
			_diff = _ypos - 0.5;
			_ypos = 0.5 + (_diff * tpw_hud_scale);
			};

		// Apply offset
		_xpos = _xpos + tpw_hud_offset_x;
		_ypos = _ypos + tpw_hud_offset_y;

		// Resolution correction
		_xpos = _xpos * safezoneW + safezoneX;
		_ypos = _ypos * safezoneW + safezoneX;
		_size = (_param select 3) * tpw_hud_textscale;

		// Update control
		_ctrl ctrlsetposition [_xpos,_ypos];
		_ctrl ctrlsetscale _size;
		_ctrl ctrlcommit 0;
	};
	tpw_hud_maxiconsize = tpw_hud_unit select 1;
	tpw_hud_miniconsize = tpw_hud_unit select 2;
	tpw_hud_unittextsize = (0.03 / (getResolution select 5)) *(tpw_hud_unit select 3) * tpw_hud_textscale;

	// RGBA to HTML for coloured text
	_squadrgb = tpw_hud_squadcolour + [tpw_hud_alpha];
	tpw_hud_squadhtml = _squadrgb call BIS_fnc_colorRGBAtoHTML;
	_friendlyrgb = tpw_hud_friendlycolour + [tpw_hud_alpha];
	tpw_hud_friendlyhtml = _friendlyrgb call BIS_fnc_colorRGBAtoHTML;
	_enemyrgb = tpw_hud_enemycolour + [tpw_hud_alpha];
	tpw_hud_enemyhtml = _enemyrgb call BIS_fnc_colorRGBAtoHTML;
	_civrgb = tpw_hud_civcolour + [tpw_hud_alpha];
	tpw_hud_civhtml = _civrgb call BIS_fnc_colorRGBAtoHTML;
};
// EFFECTIVENESS OF HUD REDUCED AT NIGHT, IN RAIN, IN FOG, PRONE UNITS
tpw_hud_fnc_effectiveness = {
	private ["_unit","_dist","_dropout","_thresh","_uthresh","_cta"];
	_thresh = 8;
	if (tpw_core_sunangle < 0) then {
		_thresh = _thresh / 2;
		};
	if (rain > 0.2 || fog > 0.2 ) then {
		_thresh = _thresh / 2;
		};

	if (count tpw_hud_nearunits > 0) then {
		for "_cta" from 0 to (count tpw_hud_nearunits - 1) do {
			_unit = tpw_hud_nearunits select _cta;
			_dist = _unit distance player;
			if( !isNil "_unit" && {!isnull _unit}) then {
				if (stance _unit == "PRONE") then {
					_uthresh = _thresh / 2;
					} else {
						_uthresh = _thresh;
					};
				if (vehicle _unit != _unit) then {
					_uthresh = _thresh * 20;
				};

				// Magic formula to determine likelihood of unit not being detected properly
				if (random _uthresh < (_dist / tpw_hud_maxrange) ^ 2) then
				{
					_dropout = time + random (_dist / 100);
					_unit setvariable ["tpw_hud_dropout",_dropout];	// how long till unit is fully visible again
				};
			};
		};
	};
};
// HUD GLITCHES
tpw_hud_fnc_glitch = {
	private ["_ctc"];
	if (cameraview == "external" || (player getvariable ["tpw_hud_goggles",0] == 1)) exitwith {};
	private ["_display","_ctrl_asl","_ctrl_azt","_ctrl_grd","_ctrl_lmt","_ctrl_tmp","_ctrl_hlt","_ctrl_rng","_ctrl_vel"];

	// GET DISPLAY AND CONTROLS
	disableSerialization;
	_display = uiNamespace getVariable "TPW_HUD_DISPLAY";
	_ctrl_asl = _display displayCtrl 100001;
	_ctrl_azt = _display displayCtrl 100002;
	_ctrl_grd = _display displayCtrl 100003;
	_ctrl_lmt = _display displayCtrl 100004;
	_ctrl_ctr = _display displayCtrl 100005;
	_ctrl_tmp = _display displayCtrl 100006;
	_ctrl_hlt = _display displayCtrl 100007;
	_ctrl_rng = _display displayCtrl 100008;
	_ctrl_vel = _display displayCtrl 100009;

	for "_ctc" from 1 to (10 + random 10) do {
		//HUD off
			{
			_x ctrlshow false;
			} foreach [_ctrl_asl,_ctrl_azt,_ctrl_grd,_ctrl_lmt,_ctrl_ctr,_ctrl_tmp,_ctrl_hlt,_ctrl_rng,_ctrl_vel];
		if (tpw_hud_eh) then {
			["tpw_hud", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
			tpw_hud_eh = false;
			};
		sleep random 0.2;
		//HUD on
			{
			_x ctrlshow true;
			_x ctrlsettextcolor (tpw_hud_colour + [random 1]);
			} foreach [_ctrl_asl,_ctrl_azt,_ctrl_grd,_ctrl_lmt,_ctrl_ctr,_ctrl_tmp,_ctrl_hlt,_ctrl_rng,_ctrl_vel];
		if !(tpw_hud_eh) then  {
			[] call tpw_hud_fnc_unitshow;
			};
		sleep random 0.2;
	};
};
// GOGGLES + UAV ?
tpw_hud_fnc_gogglecheck = {
	private ["_tempgoggles","_ctb"];
	_tempgoggles = [];
	for "_ctb" from 0 to (count (units group player) - 1) do {
		_unit = (units group player) select _ctb;
		[_unit] call tpw_hud_fnc_goggles;
		if (_unit getvariable ["tpw_hud_goggles",0] == 1) then {
			_tempgoggles set [count _tempgoggles,_unit];
			};
		if (!isnull getconnecteduav _unit) then {
			_tempgoggles set [count _tempgoggles,(driver getconnecteduav _unit)];
			};
		};
	tpw_hud_gogglewearers = _tempgoggles;
};
// GOGGLE ? - CAN UNIT HAVE HUD - HELMETS IN HERE AS WELL
tpw_hud_fnc_goggles = {
	private ["_unit"];
	_unit = _this select 0;
	/*
	if (((goggles _unit) in
		[
		"G_Tactical_Black",
		"G_Tactical_Clear",
		"G_Goggles_VR"
		])
	|| ((headgear _unit) in
		[
		"H_HelmetSpecO_blk",
		"H_HelmetSpecO_ocamo",
		"H_HelmetLeaderO_oucamo",
		"H_HelmetLeaderO_ocamo"
		])) then
	*/
	if (((goggles _unit) in
	    [
	    "ADF_Wrap_CDS",
	    "G_Tactical_Black",
	    "G_Tactical_Clear",
	    "G_Goggles_VR",
	    "G_Bandanna_shades"
	    ]))
	then {
		_unit setvariable ["tpw_hud_goggles",1];
		} else {
		_unit setvariable ["tpw_hud_goggles",0];
		};
};
// GPS POS
tpw_hud_fnc_grd = {
	private ["_grd"];
	_grd = mapGridPosition (position player);
	_ctrl_grd ctrlsetstructuredtext parsetext format [tpw_hud_grd_txt,_grd];
};
// HEALTH
tpw_hud_fnc_hlt = {
	private ["_hlt","_bpm","_ft","_dm","_factor"];
	if (damage player > 0 || getfatigue player > 0) then {
		_hlt = round (100 * (1 - damage player));
		_ft = (getfatigue player); // fatigue
		_dm = (damage player) ^ 2; // damage squared
		_factor = (1 + (3 * _ft) * (1 + _dm)); // heartrate factor
		if (_factor > 3) then {
			_factor = 3;
		};
		_bpm = floor (tpw_hud_restingheartrate * _factor);
		} else {
			_bpm = tpw_hud_restingheartrate;
			_hlt = 100;
		};
	_ctrl_hlt ctrlsetstructuredtext parsetext format [tpw_hud_hlt_txt,_bpm]; //,_hlt
};
// SELECT ICONS
tpw_hud_fnc_icon = {
	private ["_num"];
	_num = _this select 0;
	switch _num do {
		case 0: {tpw_hud_icon = "\AAM_CDS\data\hud\empty.paa";};
		case 1: {tpw_hud_icon = "\AAM_CDS\data\hud\2px_cross.paa";};
		case 2: {tpw_hud_icon = "\AAM_CDS\data\hud\2px_cross_open.paa";};
		case 3: {tpw_hud_icon = "\AAM_CDS\data\hud\2px_cross_small.paa";};
		case 4: {tpw_hud_icon = "\AAM_CDS\data\hud\2px_diamond.paa";};
		case 5: {tpw_hud_icon = "\AAM_CDS\data\hud\2px_diamond_half.paa";};
		case 6: {tpw_hud_icon = "\AAM_CDS\data\hud\2px_diamond_open.paa";};
		case 7: {tpw_hud_icon = "\AAM_CDS\data\hud\2px_dot.paa";};
		case 8: {tpw_hud_icon = "\AAM_CDS\data\hud\2px_line.paa";};
		case 9: {tpw_hud_icon = "\AAM_CDS\data\hud\2px_line_open.paa";};
		case 10: {tpw_hud_icon = "\AAM_CDS\data\hud\2px_square.paa";};
		case 11: {tpw_hud_icon = "\AAM_CDS\data\hud\2px_square_half.paa";};
		case 12: {tpw_hud_icon = "\AAM_CDS\data\hud\2px_square_open.paa";};
		case 13: {tpw_hud_icon = "\AAM_CDS\data\hud\2px_x.paa";};
		case 14: {tpw_hud_icon = "\AAM_CDS\data\hud\2px_x_open.paa";};
		case 15: {tpw_hud_icon = "\AAM_CDS\data\hud\2px_x_small.paa";};
		case 16: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_circle.paa";};
		case 17: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_circle_half.paa";};
		case 18: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_circle_open.paa";};
		case 19: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_cross.paa";};
		case 20: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_cross_open.paa";};
		case 21: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_cross_small.paa";};
		case 22: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_diamond.paa";};
		case 23: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_diamond_half.paa";};
		case 24: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_diamond_open.paa";};
		case 25: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_dot.paa";};
		case 26: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_line.paa";};
		case 27: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_line_open.paa";};
		case 28: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_square.paa";};
		case 29: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_square_half.paa";};
		case 30: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_square_open.paa";};
		case 31: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_x.paa";};
		case 32: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_x_open.paa";};
		case 33: {tpw_hud_icon = "\AAM_CDS\data\hud\3px_x_small.paa";};
		case 34: {tpw_hud_icon = "\AAM_CDS\data\hud\grfsobjt.paa";};
	};
};
// TIME
tpw_hud_fnc_lmt = {
	private ["_h","_m"];
	_h = date select 3;
	_m = date select 4;
	if (_h < 10) then {
		_h = format ["0%1",_h];
	};
	if (_m < 10) then {
		_m = format ["0%1",_m];
	};
	_ctrl_lmt ctrlsetstructuredtext parsetext format [tpw_hud_lmt_txt,_h,_m];
};
// LONG HUD UPDATE LOOP
tpw_hud_fnc_longloop = {
	private ["_display","_ctrl_asl","_ctrl_azt","_ctrl_grd","_ctrl_lmt","_ctrl_tmp","_ctrl_hlt","_ctrl_rng","_ctrl_vel"];
	disableSerialization;
	_display = uiNamespace getVariable "TPW_HUD_DISPLAY";
	_ctrl_asl = _display displayCtrl 100001;
	_ctrl_azt = _display displayCtrl 100002;
	_ctrl_grd = _display displayCtrl 100003;
	_ctrl_lmt = _display displayCtrl 100004;
	_ctrl_ctr = _display displayCtrl 100005;
	_ctrl_tmp = _display displayCtrl 100006;
	_ctrl_hlt = _display displayCtrl 100007;
	_ctrl_rng = _display displayCtrl 100008;
	_ctrl_vel = _display displayCtrl 100009;
	while {true} do {
		if (tpw_hud_active) then {
			// Update display data
			{
			[] call _x;
			} foreach tpw_hud_longfunc;
		};
		sleep 2.533;
	};
};
// PLAYER ADDED MAP MARKERS
tpw_hud_fnc_mapmarkers = {
	private ["_marker","_markers_temp","_ctd"];
	_markers_temp = [];
		//for "_ctd" from 0 to (count allMapMarkers - 1) do
		{
		//_marker = allmapmarkers select _ctd;
		_marker = _x;
		if ((!isnil "_marker") && {getmarkertype _marker == "hd_objective"} && {["!!",markerText _marker] call bis_fnc_instring}) then
			{
			_markers_temp set [count _markers_temp,_marker];
			};
		} foreach allmapmarkers;
	tpw_hud_markers = _markers_temp;
	};

// GET MARKER INFO FOR DISPLAY
tpw_hud_fnc_markerscan = {
	private ["_pos","_dist","_scale","_text","_marker","_markerarray_temp","_cte"];
	_markerarray_temp = [];
	for "_cte" from 0 to (count tpw_hud_markers - 1) do {
		_marker = tpw_hud_markers select _cte;
		if (!isnil "_marker") then {
			_pos = getmarkerpos _marker;
			_dist = format ["%1m",round (player distance _pos)];
			_scale = (2/*tpw_hud_maxiconsize*/) - (round (player distance _pos) / 200);
			_text = [markerText _marker, "!!", ""] call CBA_fnc_replace;
			if (_text != "") then {
				_dist = _text;// + " " + _dist;
				};
			if (_scale < (tpw_hud_miniconsize)) then {
				_scale = tpw_hud_miniconsize;
			};
			if (player distance _pos > tpw_hud_minrange) then {
				_markerarray_temp set [count _markerarray_temp,[_pos,_dist,_scale]];
			};
		};
	};
	tpw_hud_markerarray = _markerarray_temp;
};
// PROXIMITY ALERT ===========================================================================================================REMOVE==========
tpw_hud_fnc_prx = {
	private ["_civ","_friendly","_enemy","_squad","_unitarray","_side","_ctf","_newenemies"];
	_unitarray = [];
	_civ = 0;
	_friendly = 0;
	_enemy = 0;
	_squad = 0;
	_unitarray = tpw_hud_visible + tpw_hud_hidden + tpw_hud_unsure;
	for "_ctf" from 0 to (count _unitarray - 1) do {
		_unit = _unitarray select _ctf;
		if ((side _unit) getFriend (side player) < 0.6) then {
			// Enemies
			_side = "enemy";
			} else {
			// Friendlies / civs
			_side = "friendly";
			if (side _unit == CIVILIAN) then {
				_side = "civ"
				};
			};
		// Squad
		if (_unit in units (group player)) then {
			_side = "squad";
			};

		switch _side do {
			case "enemy": {
				_enemy = _enemy + 1;
				};
			case "friendly": {
				_friendly = _friendly + 1;
				};
			case "squad":
				{
				_squad = _squad + 1;
				};
			case "civ":
				{
				_civ = _civ + 1;
				};
		};
	};

		// Audible warning if new enemy appears
		_newenemies = _enemy - tpw_hud_prevenemies;
		if (_newenemies < 0) then
			{
			_newenemies = 0;
			};
		for "_i" from 1 to _newenemies do
			{
			if (tpw_hud_audible == 1) then
				{
				player say "readoutclick";
				};
			};
		tpw_hud_prevenemies =  _enemy;


	if (_enemy == 0) then
		{
		_enemy = ".";
		};
	if (_friendly == 0) then
		{
		_friendly = ".";
		};
	if (_squad == 0) then
		{
		_squad = ".";
		};
	if (_civ == 0) then
		{
		_civ = ".";
		};

	_ctrl_ctr ctrlsetstructuredtext parsetext format [tpw_hud_prx_txt,_civ,_squad,_friendly,_enemy,tpw_hud_civhtml,tpw_hud_squadhtml,tpw_hud_friendlyhtml,tpw_hud_enemyhtml];
};
// HUD RESET
tpw_hud_fnc_reset = {
	("TPW_HUD_Layer" call BIS_fnc_rscLayer) cuttext ["","PLAIN",0,false];
	("TPW_HUD_Layer" call BIS_fnc_rscLayer) cutRsc ["TPW_HUD_DIALOG","PLAIN",0,false];
	if (!isnil "tpw_hud_handle1") then {
		terminate tpw_hud_handle1;
		};
	if (!isnil "tpw_hud_handle2") then {
		terminate tpw_hud_handle2;
		};
	[] call tpw_hud_fnc_displayparams;
	tpw_hud_handle1 = [] spawn tpw_hud_fnc_shortloop;
	tpw_hud_handle2 = [] spawn tpw_hud_fnc_longloop;
	if (tpw_hud_addtac == 1) then {
		[] call tpw_hud_fnc_addgoggles;
		};
};
// RANGE
tpw_hud_fnc_rng = {
	private ["_objects","_rng"];
	_objects = lineintersectsobjs [(eyepos player),(atltoasl screentoworld [0.5,0.5]),(vehicle player),objnull,false,2];
	_rng = 0;
	if (count _objects > 0) then {
		_obj = _objects select 0;
		_rng = round (player distance _obj);
		}else {
		_rng = round (player distance (screentoworld [0.5,0.5]));
		};
	if (_rng > 1800 || _rng < 10) then {
		_rng = "---";
		};
	_ctrl_rng ctrlsetstructuredtext parsetext format [tpw_hud_rng_txt,_rng];
};
// SHORT HUD UPDATE LOOP
tpw_hud_fnc_shortloop = {
	private ["_display","_ctrl_asl","_ctrl_azt","_ctrl_grd","_ctrl_lmt","_ctrl_tmp","_ctrl_hlt","_ctrl_rng","_ctrl_vel"];
	// GET DISPLAY AND CONTROLS
	disableSerialization;
	_display = uiNamespace getVariable "TPW_HUD_DISPLAY";
	_ctrl_asl = _display displayCtrl 100001;
	_ctrl_azt = _display displayCtrl 100002;
	_ctrl_grd = _display displayCtrl 100003;
	_ctrl_lmt = _display displayCtrl 100004;
	_ctrl_ctr = _display displayCtrl 100005;
	_ctrl_tmp = _display displayCtrl 100006;
	_ctrl_hlt = _display displayCtrl 100007;
	_ctrl_rng = _display displayCtrl 100008;
	_ctrl_vel = _display displayCtrl 100009;
	while {true} do {
		// Player goggle check
		[player] call tpw_hud_fnc_goggles;
		// Only show/update HUD if player wearing tactical goggles and permitted to in external view
		if ((player getvariable ["tpw_hud_goggles",0] == 1) && {cameraview != "external" || tpw_hud_thirdperson == 1} && {(eyepos player) select 2 > 0}) then
		{ //SHOW
			tpw_hud_active = true;
			// Show HUD
			{ _x ctrlshow true;
				_x ctrlsettextcolor (tpw_hud_colour + [tpw_hud_alpha]);
			} foreach [_ctrl_asl,_ctrl_azt,_ctrl_grd,_ctrl_lmt,_ctrl_ctr,_ctrl_tmp,_ctrl_hlt,_ctrl_rng,_ctrl_vel];
			0 cutRsc ["AAM_lens","PLAIN",0,false]; // SHOW HUD FRAMES
			// Update display data
			{
				[] call _x;
				} foreach tpw_hud_shortfunc;
		} else
		{ //HIDE
			if (tpw_hud_active) then {
				tpw_hud_active = false;
				// NV off
				if (tpw_hud_nv) then {
					ppEffectDestroy tpw_hud_nvgrain;
					ppEffectDestroy tpw_hud_nvblur;
					titleCut ["", "BLACK IN", 4];
					setaperture -1;
					tpw_hud_nv=false;
				};
				// Hide HUD
				{ _x ctrlshow false;
					} foreach [_ctrl_asl,_ctrl_azt,_ctrl_grd,_ctrl_lmt,_ctrl_ctr,_ctrl_tmp,_ctrl_hlt,_ctrl_rng,_ctrl_vel];
					0 cutRsc ["AAM_clear","PLAIN",0,false]; // Hide HUD FRAMES
				// Disable unit display - remove PFEH
				if (tpw_hud_eh) then {
					["tpw_hud", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
					tpw_hud_eh = false;
				};
			};
		};
		sleep 0.5333;
	};
};
// TEMPERATURE
tpw_hud_fnc_tmp = {
	private ["_tmp"];
	_tmp = round tpw_fog_temp;
	_ctrl_tmp ctrlsetstructuredtext parsetext format [tpw_hud_tmp_txt,_tmp];
};
// SCAN FOR INFANTRY AND OCCUPIED VEHICLES/STATICS, DETERMINE THEIR COLOUR
tpw_hud_fnc_unitscan = {
	private ["_ctg","_colour","_nearunits","_nearveh","_side","_icon","_hidicon"];
	_nearunits = (getpos player) nearentities [["camanbase"],tpw_hud_maxrange ]; // infantry
	_nearveh = (getpos player) nearentities [["landvehicle","air"],tpw_hud_vehiclerange]; // air and land vehicles, static weapons

	for "_ctg" from 0 to (count _nearveh - 1) do {
		_veh = _nearveh select _ctg;
		if (!isnull driver _veh && {alive driver _veh}) then {
			_unit = driver _veh;
			_nearunits set [count _nearunits,_unit];
		};
		if (!isnull gunner _veh && {alive driver _veh} && {isnull driver _veh}) then {
			_unit = gunner _veh;
			_nearunits set [count _nearunits,_unit];
		};
	};

	// Remove close units
	for "_ctg" from 0 to (count _nearunits - 1) do {
		_unit = _nearunits select _ctg;
		if (_unit distance player < tpw_hud_minrange) then {
			_nearunits set [_ctg,-1];
		};
	};
	_nearunits = _nearunits - [-1];

	for "_ctg" from 0 to (count _nearunits - 1) do {
		_unit = _nearunits select _ctg;
		_side = (side _unit) getFriend (side player);

		// Icon type and colour
		_colour = tpw_hud_civcolour;
		if (vehicle _unit == _unit) then {
			if (_side < 0.6) then {
				_icon = aam_cds_foeicon;
				_hidicon = tpw_hud_enemyunithidicon;
				_colour = tpw_hud_enemycolour;
				} else {
				_icon = aam_cds_friendicon;
				_hidicon = tpw_hud_unithidicon;
				_colour = tpw_hud_friendlycolour;
				if (side _unit == CIVILIAN) then {_colour = tpw_hud_civcolour;};
				};
		} else {
			if (_side < 0.6) then {
				_icon = aam_cds_foeicon;
				_hidicon = tpw_hud_enemyvehiclehidicon;
				_colour = tpw_hud_enemycolour;
				} else {
				_icon = aam_cds_friendicon;
				_hidicon = tpw_hud_vehiclehidicon;
				_colour = tpw_hud_friendlycolour;
				if (side _unit == CIVILIAN) then {_colour = tpw_hud_civcolour;};
			};
		};

		// Squad colour
		if (_unit in units (group player)) then {_colour = tpw_hud_squadcolour;};
		_unit setvariable ["tpw_hud_visicon", _icon];
		_unit setvariable ["tpw_hud_hidicon", _hidicon];
		_unit setvariable ["tpw_hud_unitrgb",_colour];
	};
	tpw_hud_nearunits = _nearunits;
};
// PREPARE UNITS FOR DISPLAY
tpw_hud_fnc_unitprepare = {
	private ["_cth","_cti","_dist","_unit","_diff","_scale","_stance","_height","_angle","_visible_temp","_invisible_temp","_squadmem","_colour","_status"];

	// Temp arrays for display
	_visible_temp = [];
	_hidden_temp = [];
	_unsure_temp = [];

	// Assign units to visible/hidden/unsure array
	for "_cth" from 0 to (count tpw_hud_nearunits - 1) do
		{
		_unit = tpw_hud_nearunits select _cth;
		if (!isnil "_unit" && {!isnull _unit}) then
			{
			_status = "hidden";
			// HUD icon scale
			_scale = tpw_hud_maxiconsize - (round (player distance _unit) / 200);
			if (_scale < tpw_hud_miniconsize) then
				{
				_scale = tpw_hud_miniconsize;
				};
			_unit setvariable ["tpw_hud_scale",_scale];

			// Is unit visible to anyone in squad wearing tac goggles?
			for "_cti" from 0 to (count tpw_hud_gogglewearers - 1) do
				{
				_squadmem = tpw_hud_gogglewearers select _cti;
				// Squad member has line of sight to unit
				if (!lineintersects [eyepos _squadmem, eyepos _unit,vehicle _unit,vehicle _squadmem] && !terrainintersect [asltoatl eyepos _squadmem, asltoatl eyepos _unit]) exitwith
					{
					_status = "visible";

					// Simulate reduced HUD effectiveness
					if (tpw_hud_degradation == 1 && {_unit getvariable ["tpw_hud_dropout",0] > time}) then
						{
						_status= "unsure";
						};
					};
				};

			// Colour for HUD display
			_colour = _unit getvariable ["tpw_hud_unitrgb",[0,0,0]];

			switch _status do
				{
				case "visible":
					{
					// Stance
					_stance = stance _unit;
					switch _stance do
						{
						case "STAND":
							{
							_height = 1.25;
							};
						case "CROUCH":
							{
							_height = 0.75;
							};
						case "PRONE":
							{
							_height = 0.25;
							};
						case "UNDEFINED":
							{
							_height = 0;
							};
						default
							{
							_height = 0;
							};
						};

					//_unit setvariable ["tpw_hud_predtime",(0.27 * (player distance _unit) / tpw_hud_muzvel)];
					_unit setvariable ["tpw_hud_distance", format ["%1m",round (player distance _unit)]];
					_unit setvariable ["tpw_hud_height",_height];
					_unit setvariable ["tpw_hud_lasttime",time + 30];
					//_unit setvariable ["tpw_hud_unitcolour",(_colour + [tpw_hud_alpha])];
					_side = (side _unit) getFriend (side player);
					if (_side < 0.6) then
						{
						_unit setvariable ["tpw_hud_unitcolour",(_colour + [aam_cds_no])];	// hostile Visiable tpw_hud_alpha
						} else
						{
						_unit setvariable ["tpw_hud_unitcolour",(_colour + [tpw_hud_alpha])];  	// Friendly Visiable tpw_hud_alpha
						if (side _unit == CIVILIAN) then {
							_unit setvariable ["tpw_hud_unitcolour",(_colour + [aam_cds_no])];	//Civ Visiable tpw_hud_alpha
							};
						};
					if (_unit in units (group player)) then
						{
						_unit setvariable ["tpw_hud_unitcolour",(_colour + [tpw_hud_alpha])]; //Group Visiable tpw_hud_alpha
						};


					_visible_temp set [count _visible_temp, _unit]; // move to visible units array
					};
				case "unsure":
					{
					_unit setvariable ["tpw_hud_unitcolour",(_colour + [AAM_cds_no])];
					_unsure_temp set [count _unsure_temp, _unit]; // move to unsure units array
					};
				case "hidden":
					{
					if (_unit getvariable "tpw_hud_lasttime" > time) then
						{
						_unit setvariable ["tpw_hud_unitcolour",(_colour + [AAM_cds_no])];
						_unit setvariable ["tpw_hud_lastseen",format ["%1m %2s",round (player distance (_unit getvariable "tpw_hud_lastpos")),(30 - round ((_unit getvariable "tpw_hud_lasttime") - time))]];
						_hidden_temp set [count _hidden_temp, _unit];	// move to hidden units array
						};
					};
				};
			};
		};
	tpw_hud_visible = _visible_temp;
	tpw_hud_hidden = _hidden_temp;
	tpw_hud_unsure = _unsure_temp;
	};

// SHOW SCANNED UNITS ON HUD
tpw_hud_fnc_unitshow = {
	// Start PFEH
	tpw_hud_eh = true;
	["tpw_hud","oneachframe",
		{
		private ["_ctj","_ipos","_pos","_dist","_scale","_xpos","_ypos","_zpos","_marker","_unit","_predpos"];

		//Show markers
		for "_ctj" from 0 to (count tpw_hud_markerarray - 1) do
			{
			_marker = tpw_hud_markerarray select _ctj;
			_ipos = _marker select 0;

			_posup = _ipos + [0,0,10]; //////////////////////////////

			_dist = _marker select 1;
			_scale = _marker select 2;
			//				texture				colour								posAGL	w		h	a	txt		size				txt siz				font	talign
			drawIcon3D [tpw_hud_markericon,(AAM_CDS_markercolour + [tpw_hud_alpha]),_ipos,_scale,_scale,0,_dist,tpw_hud_unittextsize,tpw_hud_unittextsize, "AAMFS","center"];
			//			start    end     colour
			};
		// Show visible units
		for "_ctj" from 0 to (count tpw_hud_visible - 1) do {
			_unit = tpw_hud_visible select _ctj;
			if (!isnil "_unit" && {!isnull _unit}) then {
					_pos = getPosAtl/*visibleposition*/ _unit;
					_xpos = _pos select 0;
					_ypos = _pos select 1;
					_zpos =(_pos select 2) + (_unit getvariable "tpw_hud_height");
					_unit setvariable ["tpw_hud_lastpos",[_xpos,_ypos,_zpos]];
					//_predpos = [[_xpos,_ypos,_zpos], ((speed vehicle _unit) * (_unit getvariable ["tpw_hud_predtime",0])),(getdir _unit)] call BIS_fnc_relPos;
						// Unit icon
					drawIcon3D [(_unit getvariable ["tpw_hud_visicon",""]),(_unit getvariable ["tpw_hud_unitcolour",[0,0,0,0]]), [_xpos,_ypos,_zpos], (_unit getvariable ["tpw_hud_scale",0]), (_unit getvariable ["tpw_hud_scale",0]),0,"",1,tpw_hud_unittextsize , "etelkamonospacepro","center"];
						// Units Distance
					//drawIcon3D [(_unit getvariable ["tpw_hud_visicon",""]),(_unit getvariable ["tpw_hud_unitcolour",[0,0,0,0]]), [_xpos,_ypos,_zpos], (_unit getvariable ["tpw_hud_scale",0]), (_unit getvariable ["tpw_hud_scale",0]),0,(_unit getvariable ["tpw_hud_distance",""]),1,tpw_hud_unittextsize , "etelkamonospacepro","left",true];
						// Predicted position icon
					//if (_predpos distance [_xpos,_ypos,_zpos] > 0.3) then
					//{
						//drawIcon3D [tpw_hud_predictoricon,(_unit getvariable ["tpw_hud_unitcolour",[0,0,0,0]]), _predpos,(_unit getvariable ["tpw_hud_scale",0]),(_unit getvariable ["tpw_hud_scale",0]),0,"",0,0 ,"etelkamonospacepro"];
					//};
			};
		};

		// Show units hidden less than 30 sec
		for "_ctj" from 0 to (count tpw_hud_hidden - 1) do
			{
			_unit = tpw_hud_hidden select _ctj;
			if (!isnil "_unit" && {!isnull _unit}) then
				{
				drawIcon3D [(_unit getvariable ["tpw_hud_hidicon",""]), (_unit getvariable ["tpw_hud_unitcolour",[0,0,0,0]]),(_unit getvariable ["tpw_hud_lastpos",[0,0,0]]), (_unit getvariable ["tpw_hud_scale",0]), (_unit getvariable ["tpw_hud_scale",0]),0,(_unit getvariable ["tpw_hud_lastseen",""]),0,tpw_hud_unittextsize, "etelkamonospacepro","center"];
				};
			};

		// Show units HUD has incomplete data on
		for "_ctj" from 0 to (count tpw_hud_unsure - 1) do
		{
			_unit = tpw_hud_unsure select _ctj;
			if (!isnil "_unit" && {!isnull _unit}) then
				{
				drawIcon3D [(_unit getvariable ["tpw_hud_visicon",""]),(_unit getvariable ["tpw_hud_unitcolour",[0,0,0,0]]),(_unit getvariable ["tpw_hud_lastpos",[0,0,0]]), (_unit getvariable ["tpw_hud_scale",0]), (_unit getvariable ["tpw_hud_scale",0]),0,(_unit getvariable ["tpw_hud_distance",""]),0,tpw_hud_unittextsize, "etelkamonospacepro","center"];
				};
			};
		}
	] call BIS_fnc_addStackedEventHandler;
	};

// SPEED
tpw_hud_fnc_vel =
	{
	private ["_vel"];
	_vel = round (speed vehicle player);
	if (vehicle player iskindof "air") then
		{
		_vel = round (_vel * 0.53995);
		_ctrl_vel ctrlsetstructuredtext parsetext format [tpw_hud_airvel_txt,_vel];
		}else
		{
		_ctrl_vel ctrlsetstructuredtext parsetext format [tpw_hud_vel_txt,_vel];
		};
	};

// ADD HIT EVENTHANDLER
player addEventHandler ["Hit",{[] spawn tpw_hud_fnc_glitch}];

// TEAM SWITCH
onteamswitch
	{
	[] call tpw_hud_fnc_reset;
	};

// ICONS
_tempicon = [];
	{
	[_x] call tpw_hud_fnc_icon;
	_tempicon set [count _tempicon, tpw_hud_icon]
	} foreach tpw_hud_icons;
	tpw_hud_uniticon = _tempicon select 0; //number
	tpw_hud_unithidicon = _tempicon select 1;
	tpw_hud_vehicleicon = _tempicon select 2;
	tpw_hud_vehiclehidicon = _tempicon select 3;
	tpw_hud_enemyuniticon = _tempicon select 4;
	tpw_hud_enemyunithidicon = _tempicon select 5;
	tpw_hud_enemyvehicleicon = _tempicon select 6;
	tpw_hud_enemyvehiclehidicon = _tempicon select 7;
	tpw_hud_markericon = _tempicon select 8;
	tpw_hud_predictoricon = _tempicon select 9;
	aam_cds_friendicon = _tempicon select 1;
	aam_cds_foeicon = _tempicon select 4;

// RUN IT
	sleep 1;
	//[] spawn tpw_hud_fnc_traceloop;
	[] call tpw_hud_fnc_activate;
	//[] call tpw_hud_fnc_brightness;
	[] call tpw_hud_fnc_reset;
	//setaperture -1;

// LOOP TO ENSURE SCRIPT DOESN'T TERMINATE. PERIODICALLY RESET HUD.
//while {true} do
//{
//	sleep 60;
//	[] call tpw_hud_fnc_reset;
//};