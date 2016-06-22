if (isDedicated) exitwith {};
waituntil {alive player};

MCSS_C2_GROUP_LOGIC = "logic" createVehicleLocal [0,0,0];


//--------------------  S H A R E D   V A L U E S   A N D   A R R A Y S  ----------------------------
//---------------------------------------------------------------------------------------------------
MCSS_C2_UNITCOUNTER = (count (units group player));


//------------------------- D I A L O G  T R I G G E R S ---------------------------------------
//----------------------------------------------------------------------------------------------
/*
	MCSS_C2_PLAYERGROUP = group player;

	//-- create trigger to detect if player's group count changes
	MCSS_C2_3D_GROUPTRIG=createTrigger["EmptyDetector",[0,0,0],false]; MCSS_C2_3D_GROUPTRIG setTriggerArea [0,0,0,false];
	MCSS_C2_3D_GROUPTRIG setTriggerActivation["Any","PRESENT",true];
	MCSS_C2_3D_GROUPTRIG setTriggerStatements["!( MCSS_C2_UNITCOUNTER == (count (units MCSS_C2_PLAYERGROUP)) )", "[]  spawn {sleep 0.3;  [] call MCSS_C2_JOIN_UNIT}", ""];

	//-- create trigger to detect changes in difficulty / change Mapdata opacity
	MCSS_C2_3D_GROUPTRIG=createTrigger["EmptyDetector",[0,0,0],false]; MCSS_C2_3D_GROUPTRIG setTriggerArea [0,0,0,false];
	MCSS_C2_3D_GROUPTRIG setTriggerActivation["Any","PRESENT",true];
	MCSS_C2_3D_GROUPTRIG setTriggerStatements["MCSS_C2_DIFFICULTY != difficulty", "[] spawn {sleep 0.03; [] call MCSS_C2_RESETDIFFICULTY}", ""];

	//-- assign necessary data and variables to all units
	MCSS_C2_GROUP_LOGIC setvariable ["MCSS_C2_3D_GROUPUNITS",(units group player),false];
	player setvariable ["MCSS_C2_FORMATION_INDEX", 1, true];
	{[_x] call MCSS_C2_VARNAME} foreach (units group player);
	{_x setvariable ["MCSS_C2_FORMATION_INDEX", [_x] call MCSS_C2_GETUNITINDEX, true]} foreach units group player;

	//-- create trigger to detect if player has switched group
	MCSS_C2_3D_GSTRIG=createTrigger["EmptyDetector",[0,0,0],false]; MCSS_C2_3D_GROUPTRIG setTriggerArea [0,0,0,false];
	MCSS_C2_3D_GSTRIG setTriggerActivation["Any","PRESENT",true];
	MCSS_C2_3D_GSTRIG setTriggerStatements["((alive player) && !(player in units MCSS_C2_PLAYERGROUP))", "[]  spawn {sleep 0.3;  [] call MCSS_C2_Teamswitch}", ""];


	(findDisplay 6999 displayCtrl 7043) ctrlMapCursor ["Track","HC_overFriendly"];

*/
//------------------------Main Eventhandler-----------------------------------------------------
//----------------------------------------------------------------------------------------------
/*
MCSS_C2_KILLED_EVH = {
	_body = _this select 0;
	_groupUnits = (MCSS_C2_GROUP_LOGIC getvariable "MCSS_C2_3D_GROUPUNITS");
	_gpShuffleUnits = [];
	if !(_body == MCSS_C2_ZEUS_UNIT) exitwith {
		selectplayer MCSS_C2_ZEUS_UNIT;
	};
	waituntil {alive player};
	if !(player == _body) then {
		if (player in _groupUnits) then {
			//player sidechat "group respawn";
			_groupUnits set [0,player];
			if !(player == (leader group player)) then {
				if !(isPlayer (leader group player)) then {
					selectPLayer (leader group player);
					_gpShuffleUnits = ((units group player) - [player]);
					{[_x] join grpnull} foreach _gpShuffleUnits;
					{[_x] joinSilent (group player)} foreach _gpShuffleUnits;
					_groupUnits = (units group player);
				};
			};

			MCSS_C2_GROUP_LOGIC setvariable ["MCSS_C2_3D_GROUPUNITS",_groupUnits,false];

		} else {
			//player sidechat "spawned as new unit";
			_groupUnits set [0,player];
			if !(player == (leader group player)) then {
				if !(isPlayer (leader group player)) then {
					(group player) selectLeader player;
				};
			};
			MCSS_C2_GROUP_LOGIC setvariable ["MCSS_C2_3D_GROUPUNITS",_groupUnits,false];

		};

		MCSS_C2_KILLED = player addEventHandler ["killed",{[_this select 0] spawn MCSS_C2_KILLED_EVH}];
	} else {
		//player sidechat "spawned as same unit";
	};
	//-- Detect if player is connected to Zeus module
	MCSS_C2_ZEUS_UNIT = player;
	{
		if ((typeOf _x) == "ModuleCurator_F") then {
			MCSS_C2_ZEUS_UNIT = player;
			publicvariable "MCSS_C2_ZEUS_UNIT";
			[player,_x] execFSM "CCOREM\MCSS_C2_ZEUS.fsm";
		};
	} foreach (synchronizedObjects player);
*/
/*
};
MCSS_C2_KILLED = player addEventHandler ["killed",{[_this select 0] spawn MCSS_C2_KILLED_EVH}];
*/
{
	_x setvariable ["MCSS_C2_3D_DATA",[],true];
	player groupSelectUnit [_x, false];
} foreach units group player;

// Runner
0 spawn
{
	while {true} do {
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

		[] call tpw_hud_fnc_reset;
		sleep 60;
	};

};

