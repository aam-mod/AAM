
if (isDedicated) exitwith {};

//--------------------  S H A R E D   V A L U E S   A N D   A R R A Y S  ----------------------------
//---------------------------------------------------------------------------------------------------
AAM_CDS_UNITCOUNTER = (count (units group player));


//--------------------------  G E N E R A L  /  S H A R E D  F U N C T I O N S  ----------------
//----------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------


//-- PLAYER HAS SWITCHED GROUPS
AAM_CDS_Teamswitch = {
	//hint "you have switched groups";
	AAM_CDS_PLAYERGROUP = group player;
	player setvariable ["AAM_CDS_FORMATION_INDEX", 1, true];
	{[_x] call AAM_CDS_VARNAME} foreach (units group player);
	{_x setvariable ["AAM_CDS_FORMATION_INDEX", [_x] call AAM_CDS_GETUNITINDEX, true]} foreach units group player;
	AAM_CDS_GROUP_LOGIC setvariable ["AAM_CDS_3D_GROUPUNITS",(units group player),false];
	AAM_CDS_KILLED = player addEventHandler ["killed",{[_this select 0] spawn AAM_CDS_KILLED_EVH}];
	[(units group player) - [player]] call AAM_CDS_GROUP_RESET;
};

//-- RESET ALL GROUP SETTINGS
AAM_CDS_GROUP_RESET = {
	_units = _this select 0;
	{player reveal [_x,4]} foreach units group player;
	{
		_x setvariable ["AAM_CDS_REFRESH_DATA",[(assignedteam _x),(expecteddestination _x),(assignedvehicle _x)],true];
		[_x] join grpnull;
	} foreach _units;
	_side = side player;
	_group1 = group player;
	[player] join grpnull;
	_group2 = createGroup _side;
	[player] joinSilent _group2;
	deleteGroup _group1;
	{
		[_x] joinsilent (group player);
		_x assignTeam ((_x getvariable "AAM_CDS_REFRESH_DATA") select 0);
		switch (((_x getvariable "AAM_CDS_REFRESH_DATA") select 1) select 1) do {
			case ("LEADER PLANNED") : {
				if (_x == (driver (vehicle _x))) then {
					_x domove (((_x getvariable "AAM_CDS_REFRESH_DATA") select 1) select 0);
					_x moveTo (((_x getvariable "AAM_CDS_REFRESH_DATA") select 1) select 0);
				};
			};
			case ("DoNotPlan") : {
				if (_x == (driver (vehicle _x))) then {
					_x domove (position (vehicle _x));
					_x moveto (position (vehicle _x));
				};
			};
		};

		_x setdestination ((_x getvariable "AAM_CDS_REFRESH_DATA") select 1);
		if !(isnull ((_x getvariable "AAM_CDS_REFRESH_DATA") select 2)) then {
			if !(_x in ((_x getvariable "AAM_CDS_REFRESH_DATA") select 2)) then {
				_x assignAsCargo ((_x getvariable "AAM_CDS_REFRESH_DATA") select 2);
				[_x] ordergetin true;
			};
		};

	} foreach _units;
	{[_x] call AAM_CDS_VARNAME} foreach (units group player);
	AAM_CDS_GROUP_LOGIC setvariable ["AAM_CDS_3D_GROUPUNITS",(units group player),false];
	AAM_CDS_PLAYERGROUP = group player;
	AAM_CDS_UNITCOUNTER = (count (units AAM_CDS_PLAYERGROUP));
	{_x setvariable ["AAM_CDS_FORMATION_INDEX", [_x] call AAM_CDS_GETUNITINDEX, true];} foreach (units group player);
};


AAM_CDS_RESETDIFFICULTY = {
	AAM_CDS_OPACITY = if (difficulty <=1) then {1} else {0};
	AAM_CDS_DIFFICULTY = difficulty;
	if (difficulty <= 1) then {
		{
			_x setmarkeralpha 1;
		} foreach AAM_CDS_MARKERS;
	} else {
		{
			_x setmarkeralpha 0;
		} foreach AAM_CDS_MARKERS;
	};
};

//-- ASSIGN ALL NECESSARY DATA WHEN GROUPCOUNT CHANGES
AAM_CDS_JOIN_UNIT = {
	private ["_aliveUnits","_unitArray"];
	_aliveUnits = [];
	_unitArray = (AAM_CDS_GROUP_LOGIC getvariable "AAM_CDS_3D_GROUPUNITS");
	if (AAM_CDS_UNITCOUNTER < (count units group player)) then {
		{
			_soldier = _x;
			waituntil {alive _soldier};
			if !(_soldier in _unitArray) then {
				for "_i" from 0 to (count _unitArray) do {
					if (!alive (_unitArray select _i)) exitwith {
						[_soldier] call AAM_CDS_VARNAME;
						_unitArray set [_i,_soldier];
						_soldier setvariable ["AAM_CDS_FORMATION_INDEX", [_soldier] call AAM_CDS_GETUNITINDEX, true];
					};
					if ( _i == (count _unitArray)  ) then {
							[_soldier] call AAM_CDS_VARNAME;
							_unitArray pushback _soldier;
							_soldier setvariable ["AAM_CDS_FORMATION_INDEX", [_soldier] call AAM_CDS_GETUNITINDEX, true];
					};
				};
				AAM_CDS_UNITCOUNTER = (count (units group player));
			};
		} foreach (units group player);
	} else {
		{
			_soldier = _x;
			if !(_soldier in (units group player)) then {
				_unitArray set [_forEachIndex,objnull];
			};
		} foreach _unitArray;
		AAM_CDS_UNITCOUNTER = (count (units group player));
		AAM_CDS_GROUP_LOGIC setvariable ["AAM_CDS_3D_GROUPUNITS",_unitArray,false];
	};
};


AAM_CDS_GETUNITINDEX = {
	private ["_teamMembers","_unit"];
	_unit = _this select 0;
	_index = 2;
	_teamMembers = (AAM_CDS_GROUP_LOGIC getvariable "AAM_CDS_3D_GROUPUNITS");
	for "_i" from 0 to ((count _teamMembers) -1) do {
		if (_unit == (_teamMembers select _i)) then {_index = _i};
	};
	_index = _index + 1;
	_index;
};

//-- INITIALIZE ALL VALUES FOR ALL GROUP MEMBERS
AAM_CDS_UNIT_INIT = {
	private ["_unit"];
	_unit = _this select 0;
	_unit setvariable ["AAM_CDS_UNITMOVE",[],true];
	_unit setvariable ["AAM_CDS_UNITMOVE_TEMP",[],true];
	_unit setvariable ["AAM_CDS_CURRENTWAYPOINT_INDEX",1,true];
	_unit setvariable ["AAM_CDS_MOVE_Active",false,true];
	_unit setvariable ["AAM_CDS_SYNC_WPINDEX",0,true];
	_unit setvariable ["AAM_CDS_SYNC_ITEMS",[],true];
	_unit setvariable ["AAM_CDS_WP_LINES",[],true];
	_unit setvariable ["AAM_CDS_SUPPRESSION_TARGET",[0,false],true];
};

//-- FUNCTION TO RETURN THE FORMATION INDEX OF A UNIT
AAM_CDS_UNIT_NUMBER = {
	private ["_unit"];
	_unit = _this select 0;
	_unitnumber = 1;
	for "_i" from 0 to ((count units group player) -1) do {
		if (_unit == ((units group player) select _i)) then {
			_unitnumber = (_i + 1);
		};
	};
	_unitnumber
};

//-- simple mapclick to world coordinates function [AN: RETURNS NOTHING AND APARENTLY DEAD WEIGHT?? OTHER?]
AAM_CDS_MAPCOORDINATES = {
	_left = true;
	if (_this select 1 == 1) then {_left = false};
	_sx = _this select 2;
	_sy = _this select 3;
	_pos = ((findDisplay 6999 displayCtrl 7043) posscreentoworld [_sx,_sy]);
};


AAM_CDS_getSafePos = {
	scopeName "main";
	private ["_pos", "_minDist", "_maxDist", "_objDist", "_waterMode", "_maxGradient", "_shoreMode", "_defaultPos", "_blacklist","_newPos", "_posX", "_posY","_attempts"];
	_countThis	= count _this;
	_pos		= (_this select 0);
	_range	=  _this select 1;
	//_objDist	= _this select 2;
	_waterMode	= 0;
	_maxGradient = 0.1;
	_minDist = -1;
	_maxDist = -1;
	switch (typeName _range) do {
		case (typeName []) : {
			_minDist = _range select 0;
			_maxDist = _range select 1;
		};
		case (typeName 0) : {
			_minDist = 0;
			_maxDist = _range;
		};
		default {
			_minDist = 0;
			_maxDist = getNumber(configFile >> "CfgWorlds" >> worldName >> "safePositionRadius");
		};
	};
	_newPos = [];
	_posX = _pos select 0;
	_posY = _pos select 1;
	_attempts = 0;
	_exit = false;
	while {_attempts < 1000} do {
		private ["_newX", "_newY", "_testPos"];
		_newX = _posX + (_maxDist - (random (_maxDist * 2)));
		_newY = _posY + (_maxDist - (random (_maxDist * 2)));
		if (_attempts == 0) then {
			_newX = _posX;
			_newY = _posY;
		};
		_testPos = [_newX, _newY];
		if ( (_pos distance _testPos) >= _minDist) then {
			if ! ( count(_testPos isFlatEmpty [10,1,0.1,20,0,false]) == 0 ) then {
				_newPos = _testPos;
				_exit = true;
			};
		};
		if (_exit) exitwith {};
		_attempts = _attempts + 1;
	};
	_exit = false;
	if !( (count _newPos) == 0 ) then {
		_newPos = [(_newPos select 0),(_newPos select 1),0];
	};
	//player sidechat str _attempts;
	_newPos
};


AAM_CDS_REDUCE_SPEED = {
	_unit = (_this select 0);
	_maxspeed = _this select 1;
	_vehicle = vehicle _unit;
	_vel = velocity _vehicle;
	_dir = direction _vehicle;
	_speed = 0.1;
	while {(speed _vehicle) > _maxspeed} do {
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_vehicle setVelocity [
		(_vel select 0) - (sin _dir * _speed),
		(_vel select 1) - (cos _dir * _speed),
		(_vel select 2)
		];
		sleep 0.01;
	};
	_unit limitspeed _maxspeed;
	_vehicle limitspeed _maxspeed;
	_unit setvariable ["AAM_CDS_REDUCE_SPEED",true,true];
};



AAM_CDS_CHECK_SMOKE_GRENADES = {
	_return = false;
	_mags = ["SmokeShell","SmokeShellGreen","SmokeShellRed","SmokeShellYellow","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange"];
	if ({_soldier = _x; {_x in (magazines _soldier)} count _mags > 0} count (AAM_CDS_SELECTED_UNITS) > 0) then {_return = true};
	_return
};

AAM_CDS_MouseMoving = {
	_sx = _this select 1;
	_sy = _this select 2;
	_sPos = ((findDisplay 6999 displayCtrl 7043) posscreentoworld [_sx,_sy]);
	AAM_CDS_DUMMY setposASL [(_sPos select 0),(_sPos select 1),-1];
};

AAM_CDS_AssignVehicle = {
	_mode = _this select 0;
	_vehicle = cursortarget;
	player removeAction MCSS_ASSIGN_ACTION;
	switch (_mode) do {
		case (0): {
			unassignvehicle player;
		};
		case (1): {
			player assignAsCargo _vehicle;
		};
	};
};

AAM_CDS_THROW_VEL = {
	_unit = _this select 0;
	_targetpos = _this select 1;
	_alpha = 45;
	_range = _targetpos distance _unit;
	if (_range > 30) then {_range = 30};
	_v0 = sqrt(_range * 9.81 / sin (2 * _alpha));
	_v0x = cos _alpha * _v0;
	_v0z = sin _alpha * _v0;
	_throwDir = [_unit,_targetpos] call BIS_fnc_dirTo;
	_flyDirSin = sin _throwDir;
	_flyDirCos = cos _throwDir;
	_vel = [_flyDirSin * _v0x,_flyDirCos * _v0x, _v0z];
	_vel
};


