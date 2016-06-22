
if (isDedicated) exitwith {};

//---------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------
//--------------------------------------------  3 D  H U D - M O D E   ------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------



//--------------------  V A L U E S   A N D   A R R A Y S   F O R   3 D   M O D E  --------------------------------
//-----------------------------------------------------------------------------------------------------------------
AAM_CDS_GTI_UNIT = objnull;
AAM_CDS_SCROLLTIME = time;
AAM_CDS_3D_FORM = 0; // 0 = Line, 1 = L-Form
AAM_CDS_3D_SPACING = 2;
AAM_CDS_3D_ARROW_TEXT_INDEX = 0;
AAM_CDS_3D_ARROW_TEXTCOUNT = 1;
AAM_CDS_3D_ARROWINDEX = 1;
AAM_CDS_3D_UNITS = [];
AAM_CDS_3D_ARROWS = [];
AAM_CDS_3D_DOWNKEYS = [];
AAM_CDS_SPLIT_UNITS = [];
AAM_CDS_MODIFIER_CTRL = false;
AAM_CDS_MODIFIER_SHIFT = false;
AAM_CDS_MODIFIER_ALT = false;
AAM_CDS_MODIFIER_LOCK = false;
AAM_CDS_MOUSEWHEEL_ACTIVE = false;
AAM_CDS_3D_ARROWS_IN_BUILDING = false;

profilenamespace setvariable ["AAM_CDS_NUM_VAR",profileNameSpace getVariable ["AAM_CDS_NUM_VAR", true]];
//MCSS_NUMBLOCK_ACTIVE = (profileNameSpace getVariable ["AAM_CDS_NUM_VAR", false]);
AAM_CDS_FORMATION_DIR = [player,(screenToWorld [0.5,0.5])] call BIS_fnc_dirto;
AAM_CDS_3D_STANCE_ICON = "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_stand_ca.paa";
AAM_CDS_3D_STANCE_COLOR = [1,1,1,0.2];
AAM_CDS_3D_STANCE_ARROW = "\a3\ui_f\data\GUI\RscCommon\RscHTML\arrow_right_ca.paa";
AAM_CDS_3D_STANCE_MODE = 3;
AAM_CDS_3D_STANCE_FINAL = "AUTO";


//--------------------------------------  H U D   M O D E   F U N C T I O N S  ------------------------------------
//-----------------------------------------------------------------------------------------------------------------

AAM_CDS_3D_SETSTANCE = {
	switch (AAM_CDS_3D_STANCE_MODE) do {
		case (3) : {
			AAM_CDS_3D_STANCE_ICON = "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_stand_ca.paa";
			AAM_CDS_3D_STANCE_FINAL = "UP";
			AAM_CDS_3D_STANCE_MODE = 2;
			AAM_CDS_3D_STANCE_COLOR = [1,1,0,0.2];
		};
		case (2) : {
			AAM_CDS_3D_STANCE_ICON = "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_crouch_ca.paa";
			AAM_CDS_3D_STANCE_FINAL = "MIDDLE";
			AAM_CDS_3D_STANCE_MODE = 1;
			AAM_CDS_3D_STANCE_COLOR = [1,1,0,0.2];
		};
		case (1) : {
			AAM_CDS_3D_STANCE_ICON = "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_ca.paa";
			AAM_CDS_3D_STANCE_FINAL = "DOWN";
			AAM_CDS_3D_STANCE_MODE = 0;
			AAM_CDS_3D_STANCE_COLOR = [1,1,0,0.2];
		};
		case (0) : {
			AAM_CDS_3D_STANCE_ICON = "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_stand_ca.paa";
			AAM_CDS_3D_STANCE_FINAL = "AUTO";
			AAM_CDS_3D_STANCE_MODE = 3;
			AAM_CDS_3D_STANCE_COLOR = [1,1,1,0.2];
		};

	};
};

AAM_CDS_GET_KEY_BOOL = {
	_key = _this select 0;
	_modifiers = _this select 1;
	_return = false;
	if (_key in [71,72,73,75,76,77,79,80,81]) then {
		if (profileNameSpace getVariable "AAM_CDS_NUM_VAR") then {
			_return = true;
		};
	};
	if !(isnil "AAM_CDS_FORM_KEY_ID") then {
		if (([_key] + _modifiers) isEqualTo AAM_CDS_FORM_KEY_ID) then {
			_return = true;
		};
	};
	_return
};

AAM_CDS_3D_KEYDELAY = {
	sleep 0.1;
	(_this select 0) call AAM_CDS_3D_F_KEYDOWN;
};


//-------------------------  G E N E R A L  F U N C T I O N S  ---------------------------------
//----------------------------------------------------------------------------------------------


//--- create visible indicator and assign to unit
AAM_CDS_3D_ADD_SELECTED = {
	private ["_unit","_arrowIndex","_btn"];
	_unit = (_this select 0);

	if !(_unit == driver (vehicle _unit)) exitwith {};
	_btn = (_this select 1);
	AAM_CDS_3D_UNITS pushback _unit;
	if ((count AAM_CDS_3D_UNITS) == 1) then {
		[] spawn AAM_CDS_3D_LOOP;
		AAM_CDS_NUM_DIR = 0;
	};
	call compile format ["
		AAM_CDS_3D_ARROW_%1 = 'MCSS_ASM_INDICATOR_F' createVehicleLocal (position %2);
		AAM_CDS_3D_ARROW_%1 setvariable ['AAM_CDS_ARROW_BPOS',[0,0],true];
		AAM_CDS_3D_ARROWS pushback AAM_CDS_3D_ARROW_%1;
		%2 setvariable ['AAM_CDS_3D_DATA',[AAM_CDS_3D_ARROW_%1,'%4'],true];
		if ((count AAM_CDS_3D_UNITS) == 1) then {
			AAM_CDS_FORMATION_DIR = ((getdir player) - 180);
			AAM_CDS_3D_ARROW_%1 setObjectTextureGlobal[0,'#(argb,8,8,3)color(0,1,0,0.1)'];
			['AAM_CDS_STANCE_INDICATOR', 'onEachFrame', { drawIcon3D [AAM_CDS_3D_STANCE_ICON, AAM_CDS_3D_STANCE_COLOR, (AAM_CDS_3D_ARROWS select 0), 5, 5, 0, '',0,0.05]; }] call BIS_fnc_addStackedEventHandler;
			['AAM_CDS_STANCE_ARROWCATOR', 'onEachFrame', { drawIcon3D [AAM_CDS_3D_STANCE_ARROW, [0,0,0,0.2], (AAM_CDS_3D_ARROWS select 0), 0.8, 0.8, 0, '',0,0.05]; }] call BIS_fnc_addStackedEventHandler;

		} else {
			AAM_CDS_3D_ARROW_%1 setObjectTextureGlobal[0,'#(argb,8,8,3)color(0.5,0.5,0,0.2)'];
		};
		['%4', 'onEachFrame', { drawIcon3D['', [1,1,1,0.7], AAM_CDS_3D_ARROW_%1, 0, 0, 0, '%5',1,0.05]; }] call BIS_fnc_addStackedEventHandler;
	",AAM_CDS_3D_ARROWINDEX,_unit,_btn,AAM_CDS_3D_ARROW_TEXTCOUNT,(_unit getvariable 'AAM_CDS_FORMATION_INDEX')];
	AAM_CDS_3D_ARROW_TEXTCOUNT = AAM_CDS_3D_ARROW_TEXTCOUNT + 1;
	AAM_CDS_3D_ARROWINDEX = AAM_CDS_3D_ARROWINDEX + 1;
};

//--- remove indicator / unassign unit
AAM_CDS_3D_REMOVE_SELECTED = {
	private ["_unit"];
	_unit = (_this select 0);
	call compile format ["
		if (%1 == (AAM_CDS_3D_UNITS select 0)) then {
			(((AAM_CDS_3D_UNITS select 1) getvariable 'AAM_CDS_3D_DATA') select 0) setObjectTextureGlobal [0,'#(argb,8,8,3)color(0,1,0,0.1)'];
		};
	",_unit];
	_unit = _this select 0;
	_teamMembers = AAM_CDS_3D_UNITS;
	_switchOn = false;
	_data = [];
	[((_unit getvariable 'AAM_CDS_3D_DATA') select 1), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	if ((count AAM_CDS_3D_UNITS) == 1) then {
		['AAM_CDS_STANCE_INDICATOR', "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		['AAM_CDS_STANCE_ARROWCATOR', "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	};
	deletevehicle ((_unit getvariable 'AAM_CDS_3D_DATA') select 0);
	AAM_CDS_3D_ARROWS = AAM_CDS_3D_ARROWS - [((_unit getvariable 'AAM_CDS_3D_DATA') select 0)];
	AAM_CDS_3D_UNITS = AAM_CDS_3D_UNITS - [_unit];
	_unit setvariable ["AAM_CDS_3D_DATA",[],true];
	if ((count AAM_CDS_3D_UNITS) == 1) then {
		(((AAM_CDS_3D_UNITS select 0) getvariable 'AAM_CDS_3D_DATA') select 0) setObjectTextureGlobal [0,'#(argb,8,8,3)color(0,1,0,0.1)'];
	};

};

//-- Realtime repositioning of indicators
AAM_CDS_3D_LOOP = {
	_cursorPos = 0;
	_useCursorPos = 0;
	{inGameUISetEventHandler [_x, "true"]} foreach ["PrevAction","NextAction"];
	while {(count AAM_CDS_3D_ARROWS) > 0} do {
		_useCursorPos = true;
		if !(AAM_CDS_MODIFIER_LOCK) then {
			//if (cursorTarget isKindOf "house") then {};
			if !(isnull cursortarget) then {
				if ( ([cursortarget] call AAM_CDS_COUNT_BUILDING_POS) > 0) then {
					AAM_CDS_3D_ARROWS_IN_BUILDING = true;
					_useCursorPos = false;
					if !(AAM_CDS_MODIFIER_LOCK) then {
						[cursorTarget] call AAM_CDS_3D_CREATEFORMATION_BUILDING;
					};
				};
			};

			if (_useCursorPos) then {
				AAM_CDS_3D_ARROWS_IN_BUILDING = false;
				{
					_x setvariable ['AAM_CDS_ARROW_BPOS',[0,0],true];
				} foreach AAM_CDS_3D_ARROWS;
				if !(AAM_CDS_MODIFIER_LOCK) then {
					[(screenToWorld [0.5,0.5])] call AAM_CDS_3D_CREATEFORMATION;
				};
			};
			sleep 0.05;
		} else {
			if !(AAM_CDS_3D_ARROWS_IN_BUILDING) then {
				[(screenToWorld [0.5,0.5])] call AAM_CDS_3D_CREATEFORMATION;
			};
		};
	};
};

//-- Send units to the positions of their indicators
AAM_CDS_3D_MOVE = {
	private ["_unit","_arrow"];
	_unit = (_this select 0);
	_unit stop false;
	_arrow = ((_unit getvariable 'AAM_CDS_3D_DATA') select 0);
	_unit forcespeed -1;
	_unit setunitpos AAM_CDS_3D_STANCE_FINAL;
	if (AAM_CDS_3D_ARROWS_IN_BUILDING) then {
		if ( (typename ((_arrow getvariable "AAM_CDS_ARROW_BPOS") select 0)) == "ARRAY" ) then {
			_unit doMove ((_arrow getvariable "AAM_CDS_ARROW_BPOS") select 0);
			_unit moveTo ((_arrow getvariable "AAM_CDS_ARROW_BPOS") select 0);
			if !( (effectivecommander (vehicle _unit)) == _unit) then {
				(effectivecommander (vehicle _unit)) domove ((_arrow getvariable "AAM_CDS_ARROW_BPOS") select 0);
				(effectivecommander (vehicle _unit)) moveto ((_arrow getvariable "AAM_CDS_ARROW_BPOS") select 0);
			};
		} else {
			_unit doMove (position _arrow);
			_unit moveTo (position _arrow);
			if !(_unit == (vehicle _unit)) then {
				if (player in [(gunner (vehicle _unit)),(commander (vehicle _unit))]) then {
					_unit commandmove (position _arrow);
				};
			};
			if !( (effectivecommander (vehicle _unit)) == _unit) then {
				(effectivecommander (vehicle _unit)) domove (position _arrow);
				(effectivecommander (vehicle _unit)) moveto (position _arrow);
			};
		};
		_unit lookat ([(position _arrow), 100,((_arrow getvariable "AAM_CDS_ARROW_BPOS") select 1)] call BIS_fnc_relPos);
	} else {
		_unit doMove (position _arrow);
		_unit moveTo (position _arrow);
		if !(_unit == (vehicle _unit)) then {
				if (player in [(gunner (vehicle _unit)),(commander (vehicle _unit))]) then {
					_unit commandmove (position _arrow);
				};
			};
		if !( (effectivecommander (vehicle _unit)) == _unit) then {
			(effectivecommander (vehicle _unit)) domove (position _arrow);
			(effectivecommander (vehicle _unit)) moveto (position _arrow);
		};
	};
	_unit setvariable ["AAM_CDS_3D_DATA",[],true];
	deletevehicle _arrow;
};

//----------------------- F U N C T I O N S   T O   C A L C U L A T E   I N D I C A T E D   F O R M A T I O N S  ---------------
//------------------------------------------------------------------------------------------------------------------------------
/*
//-- Function to set indicators in formations (outside of buildings)
AAM_CDS_3D_CREATEFORMATION = {
	private ["_cursorPos","_offset","_amount"];
	_cursorPos = _this select 0;
	if (AAM_CDS_MODIFIER_LOCK) then {
		_cursorPos = (position (AAM_CDS_3D_ARROWS select 0));
	};
	_offset = AAM_CDS_3D_SPACING;
	_amount = count AAM_CDS_3D_ARROWS;
	_watchdir = ((AAM_CDS_FORMATION_DIR + AAM_CDS_NUM_DIR) + 180);
	_dirParams = 0;
	_switchMode = 0;
	switch (AAM_CDS_3D_FORM) do {
		case (0) : {
			//-- Line Formation Right
			for "_i" from 0 to ((count AAM_CDS_3D_ARROWS) -1) do {
				if (_i == 0) then {
					(AAM_CDS_3D_ARROWS select _i) setpos [(_cursorPos select 0),(_cursorPos select 1),0];
				} else {
					(AAM_CDS_3D_ARROWS select _i) setpos ([(AAM_CDS_3D_ARROWS select 0), (_offset * _i), (AAM_CDS_FORMATION_DIR + AAM_CDS_NUM_DIR)] call BIS_fnc_relPos);
				};
			};
		};
		case (1) : {
			//-- Line Formation Left
			for "_i" from 0 to ((count AAM_CDS_3D_ARROWS) -1) do {
				if (_i == 0) then {
					(AAM_CDS_3D_ARROWS select _i) setpos [(_cursorPos select 0),(_cursorPos select 1),0];
				} else {
					(AAM_CDS_3D_ARROWS select _i) setpos ([(AAM_CDS_3D_ARROWS select 0), (_offset * _i), (AAM_CDS_FORMATION_DIR + AAM_CDS_NUM_DIR)] call BIS_fnc_relPos);
				};
			};
		};
		case (2) : {
			//-- L Formation Right
			(AAM_CDS_3D_ARROWS select 0) setpos [(_cursorPos select 0),(_cursorPos select 1),0];
			for "_i" from 1 to (_amount - 1) do {
				if (_i >= (_amount /2)) then {_dirParams = ((AAM_CDS_FORMATION_DIR + AAM_CDS_NUM_DIR) - 90)} else {_dirParams = ((AAM_CDS_FORMATION_DIR + AAM_CDS_NUM_DIR))};
				(AAM_CDS_3D_ARROWS select _i) setpos ([(AAM_CDS_3D_ARROWS select (_i - 1)), (_offset * 1), _dirParams] call BIS_fnc_relPos);
			};
		};
		case (3) : {
			//-- L Formation Left
			(AAM_CDS_3D_ARROWS select 0) setpos [(_cursorPos select 0),(_cursorPos select 1),0];
			for "_i" from 1 to (_amount - 1) do {
				if (_i >= (_amount /2)) then {_dirParams = ((AAM_CDS_FORMATION_DIR + AAM_CDS_NUM_DIR) + 90)} else {_dirParams = ((AAM_CDS_FORMATION_DIR + AAM_CDS_NUM_DIR))};
				(AAM_CDS_3D_ARROWS select _i) setpos ([(AAM_CDS_3D_ARROWS select (_i - 1)), (_offset * 1), _dirParams] call BIS_fnc_relPos);
			};

		};
		case (4) : {
			//-- Cube Formation Right
			(AAM_CDS_3D_ARROWS select 0) setpos [(_cursorPos select 0),(_cursorPos select 1),0];
			for "_i" from 1 to (_amount - 1) do {
				if (_switchMode == 0) then {
					_dirParams = ((AAM_CDS_FORMATION_DIR + AAM_CDS_NUM_DIR) - 90);
					(AAM_CDS_3D_ARROWS select _i) setpos ([(AAM_CDS_3D_ARROWS select (_i - 1)), (_offset * 1), _dirParams] call BIS_fnc_relPos);
					_switchMode = 1;
				} else {
					_dirParams = ((AAM_CDS_FORMATION_DIR + AAM_CDS_NUM_DIR));
					(AAM_CDS_3D_ARROWS select _i) setpos ([(AAM_CDS_3D_ARROWS select (_i - 2)), (_offset * 1), _dirParams] call BIS_fnc_relPos);
					_switchMode = 0;
				};

			};
		};
		case (5) : {
			//-- Cube Formation Left
			(AAM_CDS_3D_ARROWS select 0) setpos [(_cursorPos select 0),(_cursorPos select 1),0];
			for "_i" from 1 to (_amount - 1) do {
				if (_switchMode == 0) then {
					_dirParams = ((AAM_CDS_FORMATION_DIR + AAM_CDS_NUM_DIR) + 90);
					(AAM_CDS_3D_ARROWS select _i) setpos ([(AAM_CDS_3D_ARROWS select (_i - 1)), (_offset * 1), _dirParams] call BIS_fnc_relPos);
					_switchMode = 1;
				} else {
					_dirParams = ((AAM_CDS_FORMATION_DIR + AAM_CDS_NUM_DIR));
					(AAM_CDS_3D_ARROWS select _i) setpos ([(AAM_CDS_3D_ARROWS select (_i - 2)), (_offset * 1), _dirParams] call BIS_fnc_relPos);
					_switchMode = 0;
				};

			};

		};


	};

};
//-- Function to set indicators on building positions
AAM_CDS_3D_CREATEFORMATION_BUILDING = {
	private ["_fea"];
	_building = _this select 0;
	_outSidePositions = [_building] call AAM_CDS_3D_BBOX;
	_availablePositions = ([_building] call AAM_CDS_COUNT_BUILDING_POS);
	_positionArray = [player,_building,_availablePositions] call AAM_CDS_fnc_SmartBpos;

	{
		_fea = _forEachIndex;
		if !( ((_building buildingpos _forEachIndex) distance [0,0,0]) == 0 ) then {
			_x setposATL (_building buildingpos (_positionArray select _forEachIndex));
			_x setvariable ["AAM_CDS_ARROW_BPOS",[(_building buildingpos (_positionArray select _forEachIndex)),([_building,_x] call BIS_fnc_dirTo)],true];
		} else {
			if !( (typename ((_x getvariable "AAM_CDS_ARROW_BPOS") select 0)) == "ARRAY" ) then {
				if ( ((_x getvariable "AAM_CDS_ARROW_BPOS") select 0) == 0) then {
					if (_fea <= (_availablePositions + 4) ) then {
						_x setpos (_outSidePositions select ((_fea - _availablePositions) -1));
					} else {
						_x setpos ([(position _building),(random ((sizeof (typeOf cursortarget))) / 2),(random 360)] call BIS_fnc_Relpos);
					};
					_x setvariable ["AAM_CDS_ARROW_BPOS",[1,([(position _building),(position _x)] call BIS_fnc_dirTo)],true];
				};
			};
		};
	} foreach AAM_CDS_3D_ARROWS;
};

//-- Function to get the amount of available building position
AAM_CDS_COUNT_BUILDING_POS = {
	_house = _this select 0;
	_effpos = [0,0,0];
	_m = 0;
	while { format ["%1", (_house) buildingPos _m] != "[0,0,0]" } do {_m=_m+1};
	_m = _m-1;
	_m;

};

//-- Function to find building-positions on the floor that player is looking at
AAM_CDS_fnc_SmartBpos = {
	_unit = _this select 0;
	_building = _this select 1;
	_bPosAmount = _this select 2;
	_buildingASL = getposASL _building;
	_buildingATL = getposATL _building;
	_buildingHeightASL = _buildingASL select 2;
	_buildingHeightATL = _buildingATL select 2;
	_unitASL =   eyepos _unit;        //eyepos _unit;
	_unitHeightASL = (_unitASL select 2);
	_unitATL =   getposATL _unit;
	_unitHeightATL = _unitATL select 2;
	_dist2d = (_buildingASL select [0,2]) distance (_unitASL select [0,2]);
	_alpha = atan ((_unit weapondirection (currentweapon _unit) ) select 2) ;
	_lookingheight = _dist2d * (tan _alpha);
	_differenceHeight = _unitHeightASL - _buildingHeightASL;
	_heightAtBuilding = (_unitHeightASL - _buildingHeightASL) + _lookingheight;
	_unsorted = [];
	_return = [];
	for "_i" from 0 to (_bPosAmount - 1) do {_unsorted pushback (_building buildingpos _i)};
	_sorted = [];
	_sorted = [_unsorted,[],{[(_x select 2),_heightAtBuilding] call AAM_CDS_FIND_DIFFERENCE},"ASCEND"] call BIS_fnc_sortBy;
	{
		_posi = _x;
		for "_i" from 0 to (_bPosAmount - 1) do {
			if ((_posi distance (_building buildingpos _i)) < 0.2) then {
				_return pushback _i;
			};
		};
	} foreach _sorted;
	_return
};
*/

//---------------------------------------  S U P R E S S I O N  F U N C T I O N S  ------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------
/*
AAM_CDS_SUPPRESSION = false;
{
	_x setvariable ["AAM_CDS_SUPPRESSION_TARGET",[0,false,0],true];
} foreach units group player;


AAM_CDS_VEHICLE_SUPPRESSION = {
	_unit = _this select 0;
	_target = _this select 1;
	_exit = false;
};

AAM_CDS_SUPPRESSION_FORBIDDEN = ["missiles_DAGR","missiles_ASRAAM","cannon_120mm"];

AAM_CDS_TAJIN = {
	private ["_a","_b","_WDir","_WDeg","_abs","_bolean","_range"];
	//Unit to be in line of weapon
	_a = _this select 0;
	//Ai with the weapon in question
	_b = _this select 1;
	_bolean = false;
	if (weaponlowered _b) exitwith {_bolean};
	_WDir = _b weaponDirection (currentweapon _b);
	_WDeg = ((_WDir select 0) atan2 (_WDir select 1));
	_dirTo = [_b, _a] call BIS_fnc_dirTo;

	_Pb = eyepos _b;
	_Pa = eyepos _a;
	_abs = abs(_dirTo - _WDeg);
	//_abs = ([_b,_a] call bis_fnc_relativedirto);
	if (_abs < 0) then {_abs = _abs + 360};
	if (_abs > 180) then {_abs = 360 - _abs};
	if (_abs < 0) then {_abs = (_abs * -1);};

	//hintsilent str _abs;
	_range = _abs >= 10 && _abs <= 349;
	if (_range) then {
		//hintsilent "NOT IN SIGHT";
		_bolean = false;
	} else {
		//hintsilent "IN SIGHT";
		_bolean = true;
	};
	_bolean;
};

AAM_CDS_NOBLUEONBLUE = {
	_unit = _this select 0;
	_result = true;
	_otherunits = [];
	{
		if ( ((side _x) getfriend (side _unit)) >= 0.6 ) then {
			_otherunits pushback _x;
		};
	} foreach (_unit nearEntities ["Man", 150]) - [_unit];
	if ( { ([_x, _unit] call AAM_CDS_TAJIN) } count _otherunits > 0) then {_result = false};
	_array = [];
	{
		if ([_x, _unit] call AAM_CDS_TAJIN) then {
			_array pushback _x;
		};
	} foreach _otherunits;

	//hint str _array;
	_result
};

AAM_CDS_INFANTRY_SUPPRESS = {
	_unit = _this select 0;
	_target = _this select 1;
	if ((count (_unit getvariable "AAM_CDS_UNITMOVE"))  == 0) then {dostop _unit;};
	_unit dotarget _target;
	_amount = 0;
	_burst = true;
	_modes = (getArray (configFile >> "CfgWeapons" >> currentWeapon _unit >> "modes"));
	_modeFinal = _modes select 1;
	_unit selectWeapon (primaryWeapon _unit);
	sleep 2;
	while {alive _unit} do {
		_unit dotarget _target;
		_unit dowatch _target;
		_unit lookat _target;
		//if ((_unit getvariable "AAM_CDS_SUPPRESSION_TARGET") select 1) exitwith {};
		if ((assignedtarget _unit) == _target) then {
			if !(weaponLowered _unit) then {
				if (speed _unit < 1) then {
					if ([_target, _unit] call AAM_CDS_TAJIN) then {
						if ([_unit] call AAM_CDS_NOBLUEONBLUE) then {
							_burst = [true,false] call BIS_fnc_selectRandom;
							_amount = 1 + (round random 5);
							for "_i" from 1 to _amount do {
								_unit forceWeaponFire [(primaryWeapon _unit),_modeFinal];
								if (_burst) then {
									sleep 0.1;
								} else {
									sleep 0.1 + (random 0.5);
								};
							};
						};
					};
				};
			};
		};
		sleep 0.5 + (random 1);
	};

};

AAM_CDS_SUPPRESSION_LOOP = {
	private ["_aslpos","_aslpos1"];
	_unit = _this select 0;
	_target = _this select 1;
	//[_target] spawn {
		//while {true} do {
	//		player allowdamage false;
	//		player attachto [(_this select 0),[0,0,0]];
	//		sleep 0.1;
		//};
	//};
	_targetpos = _this select 2;
	_origin = _this select 3;
	_mode = _this select 4;
	_veh = vehicle _unit;
	_aslpos = [((getposASL _veh) select 0),((getposASL _veh) select 1),2];
	_weapons = (weapons _veh - AAM_CDS_SUPPRESSION_FORBIDDEN);
	_neartargets = [];
	_realtargetsPre = [];
	_realtargetsPOST = [];
	while {((_unit getvariable "AAM_CDS_SUPPRESSION_TARGET") select 1)} do {
		_neartargets = [];
		_realtargetsPre = [];
		_realtargetsPOST = [];
		{
			if ( ((side _x) getfriend (side _unit)) < 0.6) then {_neartargets = _neartargets + [_x]}
		} foreach (_veh nearObjects ["ALLVEHICLES",500]);  //(_veh neartargets 500);
		{
			_item = _x;
			if ({_item iskindof _x} count ["TANK","MAN","CAR"] == 0) then {
				_neartargets = _neartargets - [_item];
			};
		} foreach _neartargets;
		if ((count _neartargets) > 0) then {
			{
				if (_mode == "INF") then {
					if ([_x, _unit,"AREA"] CALL AAM_CDS_LOS_INF) then {
						_realtargetsPRE pushback _x;
						_unit reveal [_x,4];
					};

				} else {
					if ([_unit,_x] call AAM_CDS_LOS_SIMPLE) then {
						_realtargetsPRE pushback _x; // &&  !
						_unit reveal [_x,4];
					};
				};
			} foreach _neartargets;
			{
				if ((_x aimedAtTarget [_veh]) > 0) then {_realtargetsPOST pushback _x; _realtargetsPRE = _realtargetsPRE -[_x]};
			} foreach _realtargetsPRE;
			_realtargetsPOST = _realtargetsPOST + _realtargetsPRE;
			if (count _realtargetsPOST > 0) then {
				_origin setpos ([(position _unit),(viewdistance + 500),(getdir _unit)] call BIS_fnc_Relpos);
				if (_mode == "INF") then {
					terminate (_unit getvariable "MCSS_SUPPRESSION_SCRIPT");
					_unit dowatch objnull; _unit dotarget (_realtargetsPOST select 0); _unit dofire (_realtargetsPOST select 0);

				} else {
					/*
					{_x dowatch objnull; _x dotarget (_realtargetsPOST select 0)} foreach crew vehicle _unit;
					_unit dotarget (_realtargetsPOST select 0);
					_unit dofire (_realtargetsPOST select 0);
					//_Unit dowatch position (_realtargetsPOST select 0);
					if (_Unit aimedAtTarget [(_realtargetsPOST select 0)] > 0) then {
						//{_veh fireAtTarget [(_realtargetsPOST select 0),_x]} forEach _weapons;
						_veh fireAtTarget [(_realtargetsPOST select 0),(_weapons select 0)];
						sleep (0.1 + (random 0.4));
					};
					*/
					/*
				};
			} else {
				_origin setpos _targetpos;
				if (_mode == "INF") then {
					_unit dowatch objnull;
					_unit dotarget _target;
					_unit dofire _target;
					if (isnull (_unit getvariable "MCSS_SUPPRESSION_SCRIPT")) then {
						_script = [_unit,_target] spawn AAM_CDS_INFANTRY_SUPPRESS;
						 _unit setvariable ["MCSS_SUPPRESSION_SCRIPT",_script,false];
					};
				} else {
					{_x dowatch objnull; _x dotarget _target} foreach crew vehicle _unit;
					_unit dotarget _target;
					_unit dowatch _target;
					_unit dofire _target;
					if (_Unit aimedAtTarget [_target] > 0) then {
						{_veh fireAtTarget [_target,_x]} forEach _weapons;
						sleep (0.1 + (random 0.4));
					};
				};
			};
		} else {
			if ((_origin distance _targetpos) > 500) then {
				_origin setpos _targetpos;
			};
			if (_mode == "INF") then {
				_unit dowatch objnull;
				_unit dotarget _target;
				_unit dofire _target;
				if (isnull (_unit getvariable "MCSS_SUPPRESSION_SCRIPT")) then {
					_script = [_unit,_target] spawn AAM_CDS_INFANTRY_SUPPRESS;
					 _unit setvariable ["MCSS_SUPPRESSION_SCRIPT",_script,false];
				};
			} else {
					_unit dotarget _target;
					_unit dofire _target;
					if (_Unit aimedAtTarget [_target] > 0) then {
						{_veh fireAtTarget [_target,_x]} forEach _weapons;
						sleep (0.1 + (random 0.4));
					};
			};

		};
		//hintsilent format ["Targets: %1 , activetarget: %2, snakepos :%3", (_realtargetsPOST),assignedtarget _unit, position _origin];
		sleep 0.1;
	};
};
/*
AAM_CDS_SUPPRESSION_ON = {
	private ["_target","_veh","_weapons"];
	_units = _this select 0;

	_count = count _this;
	_position = [];
	//if ((count _units) == 0) exitwith {};

	if (_count > 1) then {
		_position = _this select 1;
		AAM_CDS_SUPPRESSIONHEIGHT = 0;
	} else {
		_position = (screenToWorld [0.5, 0.5]);
	};
	_aimpos =  [(_position select 0),(_position select 1),1];
	_target = 0;
	{
		_unit = _x;
		if ((vehicle _x) == _x) then {
			_origin = "AAM_CDS_SUPRESSion_Target_F" createVehicleLocal _position; //  "Land_HelipadEmpty_F"
			_target = "AAM_CDS_SUPRESSion_Target_F" createVehicleLocal _position;
			_target attachto [_origin,[0,0,(AAM_CDS_SUPPRESSIONHEIGHT + 1)]];
			_origin hideobject true;
			{
				_x setObjectTexture [0,""];
				_x allowdamage false;
				_unit reveal [_x,4];
			} foreach [_target,_origin];
			_unit setvariable ["AAM_CDS_SUPPRESSION_TARGET",[_target,true,_origin],true];
			_unit reveal [_target,4];
			_unit dotarget _target;
			if (_unit == (AAM_CDS_SUPPRESSION_UNITS select 0)) then {
				_unit commandfire _target;
			} else {
				_unit dofire _target;
			};
			_script = [_unit,_target] spawn AAM_CDS_INFANTRY_SUPPRESS;
			_unit setvariable ["MCSS_SUPPRESSION_SCRIPT",_script,false];
			[_origin] spawn AAM_CDS_MOVE_SUPPRESSION_TARGET;
			[_unit,_target,_position,_origin,"INF"] spawn AAM_CDS_SUPPRESSION_LOOP;
		} else {
			if (_unit == (gunner vehicle _unit)) then {
				_origin = "AAM_CDS_SUPRESSion_Target_F" createVehicleLocal _position;
				_target = "AAM_CDS_SUPRESSion_Target_F" createVehicleLocal _position;
				_target attachto [_origin,[0,0,(AAM_CDS_SUPPRESSIONHEIGHT + 1)]];
				_origin hideobject true;
				{
					_x allowdamage false;
					_unit reveal [_x,4];
				} foreach [_target,_origin];
				_veh = vehicle _Unit;
				_weapons = (weapons _veh - AAM_CDS_SUPPRESSION_FORBIDDEN);
				{_x dotarget _target} foreach crew vehicle _unit;
				_unit dofire _target;
				_unit setvariable ["MCSS_SUPPRESSION_SCRIPT",nil,false];
				_Unit dowatch position _target;
				_unit setvariable ["AAM_CDS_SUPPRESSION_TARGET",[_target,true,_origin],true];
				[_unit,_target,_position,_origin,"VEHICLE"] spawn AAM_CDS_SUPPRESSION_LOOP;
			};
		};
		showCommandingMenu "";
	} foreach _units;
	sleep 2;
	(_units select 0) say "AAM_CDS_Suppressing";
};

AAM_CDS_SUPPRESSION_UNITS = [];
AAM_CDS_SUPPRESSION_OFF = {
	private ["_target"];
	_target = 0;
	_count = count _this;
	_units = if (_count == 0) then {AAM_CDS_SUPPRESSION_UNITS} else {(_this select 0)};
	//player say "AAM_CDS_StopSuppressing";
	sleep 1;
	{
		_target = ((_x getvariable "AAM_CDS_SUPPRESSION_TARGET") select 0);
		_origin = ((_x getvariable "AAM_CDS_SUPPRESSION_TARGET") select 2);
		if !(typename _target == "SCALAR") then {
			if (!isnull _target) then {
				terminate (_x getvariable "MCSS_SUPPRESSION_SCRIPT");
				{deletevehicle _x} foreach [_target,_origin];
				_x setvariable ["AAM_CDS_SUPPRESSION_TARGET",[_target,false,_origin],true];

				AAM_CDS_SUPPRESSION_UNITS = AAM_CDS_SUPPRESSION_UNITS - [_x];
				_x dowatch objnull;
			};
		};
	} foreach _units;
	showCommandingMenu "";
};

AAM_CDS_MOVE_SUPPRESSION_INDICATOR = {
	while {!(isnull AAM_CDS_SUPPRESSION_INDICATOR)} do {
		_pos = (screenToWorld [0.5, 0.5]);
		_dir = [vehicle player ,AAM_CDS_SUPPRESSION_INDICATOR] call bis_fnc_dirto;
		AAM_CDS_SUPPRESSION_INDICATOR setpos [(_pos select 0),(_pos select 1),AAM_CDS_SUPPRESSIONHEIGHT];
		if ((typeName _dir) == "SCALAR") then {
			AAM_CDS_SUPPRESSION_INDICATOR setdir _dir;
		};
		sleep 0.01;
	};
};

AAM_CDS_MOVE_SUPPRESSION_TARGET = {
	_origin = _this select 0;
	_position = [];
	while {!(isnull _origin)} do {
		_position = position _origin;
		_origin setpos ([_position,(random 2),(random 360)] call BIS_fnc_Relpos);
		//_target setpos [(_position select 0),(_position select 1),AAM_CDS_SUPPRESSIONHEIGHT];
		sleep 2;
	};
};
*/
//---------------------------------------  G E N E R A L  F U N C T I O N S  ------------------------------------------
//---------------------------------------------------------------------------------------------------------------------
/*
//-- function to get bounding box of objects
AAM_CDS_3D_BBOX = {
	private ["_objct","_bbox","_arr"];
	_objct = _this select 0;
	_bbox = boundingboxreal _objct;
	_arr = [];
	_FL = _objct modeltoworld (_bbox select 0); _FL = [(_FL select 0),(_FL select 1),0];
	_FR = _objct modeltoworld [((_bbox select 1) select 0),((_bbox select 0) select 1),0]; _FR = [(_FR select 0),(_FR select 1),0];
	_BR = _objct modeltoworld [((_bbox select 1) select 0),((_bbox select 1) select 1),0]; _BR = [(_BR select 0),(_BR select 1),0];
	_BL = _objct modeltoworld [((_bbox select 0) select 0),((_bbox select 1) select 1),0]; _BL = [(_BL select 0),(_BL select 1),0];
	_arr = [_FL,_FR,_BR,_BL];
	{
		//player setpos _x;
		//sleep 1;

	} foreach _arr;
	_arr
};

//-- Function to find the difference between two Scalar values
AAM_CDS_FIND_DIFFERENCE = {
	_a = _this select 0;
	_b = _this select 1;
	_difference = _a - _b;
	if (_difference < 0) then {_difference = (_difference * -1)};
	_difference
};

AAM_CDS_LOS_SIMPLE = {
	_a = _this select 0;
	_b = _this select 1;
	_return = false;
	_aslPos1 = if (typename _a == "ARRAY") then {ATLtoASL _a} else {if ((vehicle _a) == _a) then {eyepos _a} else {[((getposASL (vehicle _a)) select 0),((getposASL (vehicle _a)) select 1),( ((getposASL (vehicle _a)) select 2) + ((((boundingboxreal (vehicle _a)) select 1) select 2) + 0.1))]};};
	_aslPos2 = if (typename _b == "ARRAY") then {ATLtoASL _b} else {if ((vehicle _b) == _b) then {eyepos _b} else {[((getposASL (vehicle _b)) select 0),((getposASL (vehicle _b)) select 1),(((getposASL (vehicle _a)) select 2) + ((((boundingboxreal (vehicle _b)) select 1) select 2) + 0.1))]};};
	//systemchat format ["%1  %2", _a ,_b];
	_refob1 = if (typename _a == "ARRAY") then {objnull} else {(vehicle _a)};
	_refob2 = if (typename _b == "ARRAY") then {objnull} else {(vehicle _b)};
	if ((lineIntersects [_aslPos1, _aslPos2]) || (terrainIntersectASL [_aslPos1, _aslPos2])) then {
		_return = false;
	} else {
		_return = true;
	};
	_return
};

AAM_CDS_LOS_INF = {
	private ["_a","_b","_dirTo","_eyeD","_eyePb","_eyePa","_eyeDV","_abs","_boolean","_range"];

	//who to see or not
	_a = (vehicle (_this select 0));
	//AI to see or not
	_b = _this select 1;
	_dirMode = _this select 2;
	_eyeDV = eyeDirection _b;
	_eyeD = ((_eyeDV select 0) atan2 (_eyeDV select 1));
	if (_dirMode == "AREA") then {_eyeD = getdir _b};
	if (_eyeD < 0) then {_eyeD = 360 + _eyeD};
	_dirTo = [_b, _a] call BIS_fnc_dirTo;
	_eyePb = eyePos _b;
	_eyePa = eyePos _a;
	_abs = abs(_dirTo - _eyeD);
	_range = if (_a distance _b < 20) then {_abs >= 90 && _abs <= 270} else {_abs >= 60 && _abs <= 240};
	if (_range || (lineIntersects [_eyePb, _eyePa]) || (terrainIntersectASL [_eyePb, _eyePa])) then {
		//hintsilent "NOT IN SIGHT";
		_boolean = false;
	} else {
		//hintsilent " IN SIGHT";
		_boolean = true;
	};
	_boolean;
};

*/
//--------------------------------------------  C2  M E N U  D A T A  -------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------

BR_GRENADEMODE = false;
/*
AAM_CDS_MAINMENUBUTTON = {
	_mode = _this select 0;
	_btn = if ((count _this) > 1) then {(_this select 1)} else {0};
	switch (_mode) do {
		case ("GRENMAIN") : {
			//ctrlSetText [8001, "CCOREM\MENU\OL2.paa"];
			((findDisplay 7999) displayCtrl 8001) ctrlSetText "CCOREM\MENU\OL2.paa";
			if (BV_GREN == 0) then {
				BV_GREN = 1;
				//{ctrlShow [_x, true]} foreach [8001,8011,8012,8013,8014,8015,8016];
				{((findDisplay 7999) displayCtrl _x) ctrlShow true} foreach [8001,8011,8012,8013,8014,8015,8016];
				//ctrlSetText [8011, "CCOREM\Menu\Frag.paa"];
				((findDisplay 7999) displayCtrl 8011) ctrlSetText "CCOREM\Menu\Frag.paa";
				//ctrlSetText [8013, "CCOREM\Menu\Flash.paa"];
				((findDisplay 7999) displayCtrl 8013) ctrlSetText "CCOREM\Menu\Flash.paa";
				//ctrlSetText [8015, "CCOREM\Menu\SmokeGrey.paa"];
				((findDisplay 7999) displayCtrl 8015) ctrlSetText "CCOREM\Menu\SmokeGrey.paa";
			} else {
				BV_GREN = 0;
				//{ctrlShow [_x, false]} foreach [8001,8011,8012,8013,8014,8015,8016];
				{((findDisplay 7999) displayCtrl _x) ctrlShow false} foreach [8001,8011,8012,8013,8014,8015,8016];
			};
		};
		case ("ROE") : {
			//ctrlSetText [8002, "CCOREM\MENU\OR2.paa"];
			((findDisplay 7999) displayCtrl 8002) ctrlSetText "CCOREM\MENU\OR2.paa";
			if (BV_ROE == 0) then {
				BV_ROE = 1;
				//{ctrlShow [_x, true]} foreach [8002,8017,8018,8019,8020];
				{((findDisplay 7999) displayCtrl _x) ctrlShow true} foreach [8002,8017,8018,8019,8020];
				//ctrlSetText [8017, "CCOREM\Menu\FAW.paa"];
				((findDisplay 7999) displayCtrl 8017) ctrlSetText "CCOREM\Menu\FAW.paa";
				//ctrlSetText [8019, "CCOREM\Menu\FOT.paa"];
				((findDisplay 7999) displayCtrl 8019) ctrlSetText "CCOREM\Menu\FOT.paa";
			} else {
				BV_ROE = 0;
				//{ctrlShow [_x, false]} foreach [8002,8017,8018,8019,8020];
				{((findDisplay 7999) displayCtrl _x) ctrlShow false} foreach [8002,8017,8018,8019,8020];
			};
		};
		case ("BRAIN") : {
			//ctrlSetText [8004, "CCOREM\MENU\UR2.paa"];
			((findDisplay 7999) displayCtrl 8004) ctrlSetText "CCOREM\MENU\UR2.paa";
			if (BV_BRAIN == 0) then {
				BV_BRAIN = 1;
				//{ctrlShow [_x, true]} foreach [8004,8023,8024,8025,8026,8043,8044];
				{((findDisplay 7999) displayCtrl _x) ctrlShow true} foreach [8004,8023,8024,8025,8026,8043,8044];
				//ctrlSetText [8023, "CCOREM\Menu\view.paa"];
				((findDisplay 7999) displayCtrl 8023) ctrlSetText "CCOREM\Menu\view.paa";
				//ctrlSetText [8025, "CCOREM\Menu\stance_auto.paa"];
				((findDisplay 7999) displayCtrl 8025) ctrlSetText "CCOREM\Menu\stance_auto.paa";
				//ctrlSetText [8043, "CCOREM\Menu\shield.paa"];
				((findDisplay 7999) displayCtrl 8043) ctrlSetText "CCOREM\Menu\shield.paa";
			} else {
				BV_BRAIN = 0;
				//{ctrlShow [_x, false]} foreach [8004,8023,8024,8025,8026,8043,8044];
				{((findDisplay 7999) displayCtrl _x) ctrlShow false} foreach [8004,8023,8024,8025,8026,8043,8044];
			};
		};

		case ("REFRESH") : {
			//closedialog 0;
			if (_btn == 1) then {
				{_x doFollow player} foreach (groupSelectedUnits player);
				player say "AAM_CDS_FallBack";
				player groupchat "FALL BACK";
			} else {
				[(units group player) - [player]] call AAM_CDS_GROUP_RESET;
			};
		};
	};
};

AAM_CDS_MENU_FNC_TEAMCOLOR = {
	_color = _this select 0;
	_btn = _this select 1;
	_units = [];
	{
		if ((assignedTeam _x) == _color) then {
			_units pushback _x;
		};
	} foreach units group player - [player];
	if (_color == "PURPLE") then {
		_units = (units group player) - [player];
	};
	_count = if (_btn == 1) then {({_x in AAM_CDS_3D_UNITS} count _units)} else {({_x in (groupSelectedUnits player)} count _units)};
	if (_count == (count _units)) then {
		{
			if (_btn == 1) then {
				[_x] call AAM_CDS_3D_REMOVE_SELECTED;
			} else {
				player groupSelectUnit [_x, false];
			};


		} forEach _units;
	} else {
		{
			if (_btn == 1) then {
				if !(_x in AAM_CDS_3D_UNITS) then {
					[_x,_x getvariable "AAM_CDS_FORMATION_INDEX"] call AAM_CDS_3D_ADD_SELECTED;
				};
			} else {
				if !(_x in (groupSelectedUnits player)) then {
					player groupSelectUnit [_x, true];
				};
			};

		} forEach _units;
	};
};

AAM_CDS_FNC_FORMMENU = {
	_formation = _this select 0;
	(group player) setFormation _formation;
	showCommandingMenu "";
	//closedialog 0;
};

AAM_CDS_FindCover = {
	private ["_occupiedPositions","_houses","_positionCheck","_enemies","_altSelection"];
	_units = _this select 0; //Array of units to find cover
	if ((count _units) == 0 ) exitwith {};
	[_units,true,false] spawn AAM_CDS_CANCELPLANS;
	player groupchat "TAKE COVER!";
	player say "AAM_CDS_TakeCover";
	sleep 1;
	_side = side (_units select 0);
	_enemies = [];
	_occupiedPositions = [];
	_houses = [];
	_positionCheck = [];
	_altSelection = [];
	{
		_soldier = _x;
		if ((_side getfriend (side _soldier)) < 0.5) then {
			if (({((vehicle _soldier) distance _x) < 300} count _units) > 0 ) then {
				if !((vehicle _soldier) in _enemies) then {
					_enemies pushback (vehicle _soldier);
				};
			};
		};
	} foreach allunits;

	{
		_soldier = _x;
		_positioncheck = [];
		_coverObjects = [];
		_nearObjects = nearestObjects [_soldier, [],30];
		//-- adapted, don"t forget to credit!
		{
			if !(_x iskindof "Insect") then {
				if !(_x iskindof "Animals") then {
					if !(_x iskindof "Man") then {
						if !(_x iskindof "EmptyDetector") then {
							//nor footprints or anything without an ID
							if !((str _x) find "NOID " > -1) then {
								// nor any type of freather or leaves
								if !((str _x) find ": cl_" > -1) then {
									// get rid of pavement type's
									if !((str _x) find ": pavement_" > -1) then {
										// cant hind behind leaflets on ground
										if !((str _x) find ": garbage_" > -1) then {
											/// oh yeh lets not forget to exclude roads
											if !(_x in (_soldier nearRoads 100))  then {
												if ( ((boundingboxreal _x select 1) select 2) > 0.5) then {
													_coverObjects pushback _x;
												};
											};
										};
									};
								};
							};
						};
					};
				};
			};

		} foreach _nearObjects;
		_nearObjects = [];

		//-- sort the array according to priorities
		_coverObjects = [_coverObjects,[],{_soldier distance _x},"ASCEND"] call BIS_fnc_sortBy;
		//{player sidechat str (getnumber (configFile >> "cfgVehicles" >> (typeOf _x) >> "Armor"))} forEach _coverObjects;
		//_altSelection = [];
		//{
		//	private ["_forEachIndex"];
		//	if ((_x distance _soldier) < 20) then {
		//		_altSelection pushback _x;
		//		_coverObjects = _coverObjects - [_x];
		//	};
		//} forEach _coverObjects;
		//_altSelection = [_altSelection,[],{((boundingboxreal _x select 1) select 2)},"DESCEND"] call BIS_fnc_sortBy;
		//_coverObjects = _altSelection + _coverObjects;
		//hint str _coverObjects;
		{
			_bldg = _x;
			_bPosCount = ([_x] call AAM_CDS_COUNT_BUILDING_POS);
			//player commandchat str _bposcount;
			if (_bPosCount > -1 ) then {

				for "_i" from 0 to _bPosCount do {
					//hintsilent format ["Soldier: %1, House %2, pos %3",_soldier,_foreachIndex,_i];
					//systemchat format ["distance: %1",((_bldg buildingpos _i) distance _x)];
					if ( ({((_bldg buildingpos _i) distance _x) < 1} count _occupiedPositions) == 0) then {
						// _check position for visibility
						_bpos = (_bldg buildingpos _i);
						if (({[[(_bpos select 0),(_bPos select 1),((_bPos select 2) + 1.2)],_x] call AAM_CDS_LOS_SIMPLE} count _enemies) == 0) then {
							_positionCheck = (_bldg buildingpos _i);
							//_soldier groupchat "I am moving to bpos";
							_occupiedPositions pushback _positionCheck;
							_soldier moveTo (_bldg buildingpos _i);
							_soldier domove (_bldg buildingpos _i);
							_soldier dowatch objnull;
							_soldier lookat objnull;

						};
					};
					if ((count _positionCheck) > 0) exitwith {};

				};
				if ((count _positionCheck) > 0) exitwith {};
			};
			if ((count _positionCheck) > 0) exitwith {};
			_bBox2d = [_x] call AAM_CDS_3D_BBOX;
			{
				_tPos = [(_x select 0),(_x select 1), 1];
				if ( ({(_tPos distance _x) < 1} count _occupiedPositions) == 0) then {
					if (({[_tPos,_x] call AAM_CDS_LOS_SIMPLE} count _enemies) == 0) then {
						if ((vehicle _soldier) == _soldier) then {
							_positionCheck = _tPos;
							//_soldier groupchat "I am moving to coverpos";
							_occupiedPositions pushback _positionCheck;
							_soldier moveTo _tPos;
							_soldier domove _tPos;
							//player sidechat str (getnumber (configFile >> "cfgVehicles" >> (typeOf _bldg) >> "Armor"));
							//player sidechat str typeof _bldg;
							_soldier dowatch objnull;
							_soldier lookat objnull;
							if ( ((boundingboxreal _bldg select 1) select 2) < 1) then {
								_soldier setunitPos "middle";
							};
						} else {
							_positionCheck = [1,1,1];
						};
					};
				};
				if ((count _positionCheck) > 0) exitwith {};
			} foreach _bBox2d;
			//systemchat str (parsetext  (getText (configFile >> "CfgVehicles" >> (typeOf (_x)) >> "displayName"))); //str (typeof _x);
			if ((count _positionCheck) > 0) exitwith {};
		} foreach _coverObjects;
		//if ((count _positionCheck) > 0) exitwith {};
		sleep 0.5;
	} forEach _units;
	//systemchat format ["%1 enemies",count _enemies];
};
*/

AAM_CDS_GREN_SMOKE = [["SmokeShellOrange","SmokeShellOrangeMuzzle"],["SmokeShellBlue","SmokeShellBlueMuzzle"],["SmokeShell","SmokeShellMuzzle"],["SmokeShellGreen","SmokeShellGreenMuzzle"],["SmokeShellYellow","SmokeShellYellowMuzzle"],["SmokeShellRed","SmokeShellRedMuzzle"],["SmokeShellPurple","SmokeShellPurpleMuzzle"],["rhs_mag_mk3a2","Rhsusf_Throw_Grenade"],["rhs_mag_m18_green","Rhsusf_Throw_Smoke_green"],["rhs_mag_m18_red","Rhsusf_Throw_Smoke_red"],["rhs_mag_m18_yellow","Rhsusf_Throw_Smoke_yellow"],["rhs_mag_m18_purple","Rhsusf_Throw_Smoke_purple"],["rhs_mag_rdg2_white","Rhs_Throw_Smoke"],["rhs_mag_an_m8hc","Rhsusf_Throw_Smoke_white"]];
AAM_CDS_GREN_FRAG = [["HandGrenade","HandGrenadeMuzzle"],["MiniGrenade","MiniGrenadeMuzzle"],["rhs_mag_m67","Rhsusf_Throw_Grenade"]];
AAM_CDS_GREN_STUN = [["rhs_mag_mk84","Rhsusf_Throw_Flash"],["rhs_mag_plamyam","Rhs_Throw_Flash"],["SUPER_flash","SUPER_flash_Muzzle"],["ACE_M84","ACE_M84Muzzle"]];

AAM_CDS_GRENADE_PLAYER = {
	_mode = _this select 0;
	if !(player == (vehicle player)) exitwith {};
	if ( (count(currentThrowable player)) == 0 ) exitwith {};
	AAM_CDS_GTI_UNIT = player;
	if (_mode == "DOWN") then {
		//AAM_CDS_MenuUnits = [player];
		BR_TACV_oefId = ["BR_TACV_oefId", "onEachFrame", "BR_OEFControl"] call BIS_fnc_addStackedEventHandler;
		BR_GRENADEMODE = true;
		AAM_CDS_GRENADEHANDLER_P = (findDisplay 46) displayAddEventHandler ["MouseButtonDown",
		{
			if ((_this select 1) == 1) then {
				BR_GRENADEMODE = false;
				//AAM_CDS_MenuUnits = [];
				(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown",AAM_CDS_GRENADEHANDLER_P];
				AAM_CDS_GTI_UNIT = objnull;
			};
		}];
	} else {
		if (BR_GRENADEMODE) then {
			BR_TEMP_gfeh = player addEventHandler ["fired",
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
				AAM_CDS_GTI_UNIT = objNull;
			}];
			player forceWeaponFire [((currentThrowable player) select 1),((currentThrowable player) select 1)];
			["BR_TACV_oefId", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		} else {
		};
		(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown",AAM_CDS_GRENADEHANDLER_P];
		BR_GRENADEMODE = false;
	};

};
/*
AAM_CDS_MENU_GREN = {
	_mode = _this select 0;
	AAM_CDS_GREN_MUZZLE = 0;
	if ((count (groupSelectedUnits player)) == 0) exitwith {
		player groupchat "No units in selection";
	};
	{[_x] call AAM_CDS_3D_REMOVE_SELECTED} foreach AAM_CDS_3D_UNITS;
	_unit = (groupSelectedUnits player) select 0;
	switch (_mode) do {
		case ("SMOKE") : {
			{if ((_x select 0) in (magazines _unit)) then {AAM_CDS_GREN_MUZZLE = (_x select 1)};} foreach AAM_CDS_GREN_SMOKE;
		};
		case ("FRAG") : {
			{if ((_x select 0) in (magazines _unit)) then {AAM_CDS_GREN_MUZZLE = (_x select 1)};} foreach AAM_CDS_GREN_FRAG;
		};
		case ("FLASH") : {
			{if ((_x select 0) in (magazines _unit)) then {AAM_CDS_GREN_MUZZLE = (_x select 1)};} foreach AAM_CDS_GREN_STUN;
		};
	};
	sleep 0.1;

	if ((typename AAM_CDS_GREN_MUZZLE) == "SCALAR") exitwith {_unit groupchat "I do not have this grenade sir"};
	AAM_CDS_GTI_UNIT = _unit;
	BR_TACV_oefId = ["BR_TACV_oefId", "onEachFrame", "BR_OEFControl"] call BIS_fnc_addStackedEventHandler;
	BR_GRENADEMODE = true;

	(findDisplay 7999) closeDisplay 0;
	AAM_CDS_GRENADEHANDLER = (findDisplay 46) displayAddEventHandler ["MouseButtonUP",
	{
		[_unit,AAM_CDS_GREN_MUZZLE,(_this select 1)] spawn AAM_CDS_GREN_MOUSEUP;
		false
	}];
	AAM_CDS_GRENADEHANDLER_1 =
	(findDisplay 46) displayAddEventHandler ["KeyUp",
	{
		[_this] spawn {
			_button = _this select 0;
			_button = _button - [(_button select 0)];
			if ((_button select 0) == (AAM_CDS_MENU_KEY_ID select 0)) then {
				[] spawn {
					if (BR_GRENADEMODE) then {
						BR_GRENADEMODE = false;
						BR_TEMP_gfeh = AAM_CDS_GTI_UNIT addEventHandler ["fired",
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
						AAM_CDS_GTI_UNIT forceWeaponFire [AAM_CDS_GREN_MUZZLE,AAM_CDS_GREN_MUZZLE];
						["BR_TACV_oefId", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
						(findDisplay 46) displayRemoveEventHandler ["KeyUp", AAM_CDS_CBA_UP_MENU];
						(findDisplay 46) displayRemoveEventHandler ["KeyUp", AAM_CDS_GRENADEHANDLER_1];
						(findDisplay 46) displayRemoveEventHandler ["MouseButtonUp", AAM_CDS_GRENADEHANDLER];
						AAM_CDS_GTI_UNIT = objnull;
					};
				};
			};
		};
		false

	}];
	showCommandingMenu "";
};
*/
/*
AAM_CDS_MENU_ROE = {
	_mode = _this select 0;
	//closeDialog 0;
	if (count (groupSelectedUnits player) == 0) exitwith {};
	_unitNames = "";

	switch (_mode) do {
		case (0) : {
			{
				_unit = _x;
				_unit setvariable ["AAM_CDS_ROE",false,true];
				_unit enableAI "AUTOTARGET";
				_unitNames = _unitNames + ([_unit,1] call AAM_CDS_NAMESTRING);
			} foreach (groupSelectedUnits player);
			player groupchat _unitNames + "choose your targets!";
		};
		case (1) : {
			{
				_unit = _x;
				_unitNames = _unitNames + ([_unit,1] call AAM_CDS_NAMESTRING);
				_unit setvariable ["AAM_CDS_ROE",true,true];
				[_unit] spawn {
					_unit = _this select 0;
					while {alive _unit} do {
						if !(_unit getvariable "AAM_CDS_ROE") exitwith {_unit enableAI "AUTOTARGET"};
						_unit disableAI "AUTOTARGET";
						sleep 5;
					};
				};
			} foreach (groupSelectedUnits player);
			player groupchat _unitNames  + "do not fire until I designate your target!";

		};
	};
};

AAM_CDS_NUMPAD_TOGGLE = {
	//if (MCSS_NUMBLOCK_ACTIVE) then {
	if (profileNameSpace getVariable "AAM_CDS_NUM_VAR") then {
		//MCSS_NUMBLOCK_ACTIVE = false;
		profilenamespace setvariable ["AAM_CDS_NUM_VAR",false];
		((findDisplay 7999) displayCtrl 8027) ctrlSetTextColor [1,0,0,0.6];
	} else {
		//MCSS_NUMBLOCK_ACTIVE = true;
		profilenamespace setvariable ["AAM_CDS_NUM_VAR",true];
		((findDisplay 7999) displayCtrl 8027) ctrlSetTextColor [0,1,0,0.6];
	};
};

AAM_CDS_SPAWN_RADIAL = compile preprocessfileLineNumbers "CCOREM\gui\AAM_CDS_MENU.sqf";
*/
//------------------------------------  Z A P A T  /  G T I  G R E N A D E  D A T A  ----------------------------------
//---------------------------------------------------------------------------------------------------------------------

BRfn_relativePos =
{
	private ["_p1", "_dir","_dst","_r","_alt"];
	_p1 = _this select 0;
	_dir = _this select 1;
	_dst = _this select 2;

	_alt = 0;
	if (count _this > 3) then {_alt = _this select 3};

	_r = [(_p1 select 0) + sin _dir * _dst,(_p1 select 1) + cos _dir * _dst,_alt];

	_r
};

BR_TACV_GV0MaxS = 19;		//standing
BR_TACV_fatEff	= 0.4;		//max - fatEff*max when fat = 1
BR_TACV_GV0MaxP = 0.75;		//prone
BR_TACV_GV0MaxC = 0.9;		//crouch
BR_GRENADEMODE = false;
BR_TACV_throwTheta = 45;

BR_OEFControl = {
	if (isnull AAM_CDS_GTI_UNIT) exitwith {};
	BR_GRENADEMODE = true;
		_un =  AAM_CDS_GTI_UNIT;
		//calculate needed v0
		_v0Max = 19; // _un getVariable ["BR_RPG_throwForce",BR_TACV_GV0MaxS];
		_v0Max = _v0Max - (getFatigue _un) * BR_TACV_fatEff * _v0Max;
		_ehATL = (ASLtoATL (eyepos _un)) select 2;
		if (_ehATL < 1.4) then {
			if  (_ehATL < 0.8) then {
				_v0Max = _v0Max * BR_TACV_GV0MaxP
			} else  {
				_v0Max = _v0Max * BR_TACV_GV0MaxC
			};
		};

		_range = (screentoWorld [0.5,0.5]) distance _un;
		_v0 = sqrt(_range * 9.81 / sin (2 * BR_TACV_throwTheta));

		//maximalize v0 - recalc range
		if (_v0 > _v0Max) then {
			_v0 = _v0Max;
			_range = (_v0 ^ 2 * sin (2 * BR_TACV_throwTheta)) / 9.81;
		};
		//data
		_v0x = cos BR_TACV_throwTheta * _v0;
		_v0z = sin BR_TACV_throwTheta * _v0;
		_unPos = [getPosATL _un, direction _un, 1] call BRfn_relativePos;
		_unDir = getDir _un;
		_throwDir = [_un,screenToWorld [0.5,0.5]] call BIS_fnc_dirTo;
		_flyDirSin = sin _throwDir;
		_flyDirCos = cos _throwDir;
		_sPosx = _unPos select 0;
		_sPosy = _unPos select 1;
		_prevtrajATL = [_sPosx,_sPosy,1.4];
		_newtrajASL = [];
		_newtrajATL = [];
		_trayBase = (getPosASL _un) select 2;

		BR_TACV_throwVel = [_flyDirSin * _v0x,_flyDirCos * _v0x, _v0z];
		BR_TACV_throwV0 = _v0;

		drawIcon3D ["\AAM_CDS\Data\dot.paa", [0,0,0,1],screentoworld [0.5,0.5], 0.2, 0.2, 0];
		//draw trajectory
		for "_t" from 0.1 to 5 step 0.1 do {
			_dx = _v0x * _t;
			_dy = _v0z * _t - 4.905 * _t ^ 2  +  1.4;
			_newtrajASL = [_sPosx + _flyDirSin * _dx,_sPosy + _flyDirCos * _dx,_trayBase + _dy];
			_newtrajATL = ASLtoATL _newtrajASL;
			_cross = 0;
			if (_newtrajATL select 2 <= 0) then {
				_cross = 1
			} else {
				if (lineInterSects [ATLtoASL _prevtrajATL, _newtrajASL]) then {
					_cross = 2;
				};
			};
			_iDim = (((1 / ((getposATL player) distance _newtrajATL)) * 4) max 0.08) min 0.3;
			_col = if (_cross == 0) then {[1,1,1,1]}else{if (_cross == 1) then {[0,1,0,1]} else {[1,0,0,1]};};
			if (_cross != 2 && lineInterSects [(eyepos player), _newtrajASL]) then {_col set [3,0.2]};
			drawIcon3D ["AAM_CDS\Data\dot.paa", _col,_newtrajATL, _iDim, _iDim, 0]; //, str _iDim,1, 0.025 * safezoneH, "PuristaMedium"];
			if (_cross > 0) exitWith {};
			_prevtrajATL = _newtrajATL;
		};

		_un doWatch _newtrajATL;
		//if (BR_TACV_mode == 1) then {_un setDir _throwDir};

};









