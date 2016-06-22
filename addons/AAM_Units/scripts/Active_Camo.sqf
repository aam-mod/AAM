///Authors: XxRTEKxX, HallyG, and DreadedEntity and Monty
_Unit = _this select 0;//_player;
_id = _this select 2;
if (isDedicated) exitWith {};
WaitUntil {!isNull FindDisplay 46};
///////////////////////////////////////////////Activate ///////////////////////////////////////////////////
sotg_active_camo_activate =
{
	_source = "#particlesource" createVehiclelocal getpos /*player*/_unit;
	_source setParticleCircle [0, [0.1, 0.1, 0.1]];
	_source setParticleRandom [0, [0, 0.1, 1], [0.1, 0, 0.1], 0, 0.1, [0, 0, 0, 0.1], 0, 0];
	_source setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract", 1, 0, 1], "", "Billboard", 1, 4, [0, 0, 0], [0, 0, 0.5], 9, 10, 7.9, 0.1, [0.6, 1, 0.9, 0.8], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0, 0.1, 0.2, 0.5, 0.1, 0.1], 0, 0, "", "", /*player*/_unit];
	_source setDropInterval 0.1;
	_source attachto [/*player*/_unit,[0,0,0]];
	sleep 0.5;
	/*player*/_unit hideObjectGlobal true;
	SystemChat "SOTG A.CM Online";
	/*player*/_unit setCaptive true;
	sleep 0.5;
	//running or fireing call sotg_active_camo_temp
	//eventhandler ?
	waitUntil {inputaction "user15" >0;};
	call sotg_active_camo_deactivate
};
//////////////////////////////////////////////Deactivation/////////////////////////////////////////////////
sotg_active_camo_deactivate =
{
	deleteVehicle _source;
	/*player*/_unit hideObjectGlobal false;
	/*player*/_unit setCaptive false;
	SystemChat "SOTG A.CM Offline";
	sleep 0.5;
	[] call sotg_active_camo_holding;
};
///////////////////////////////////////////////Temp deactivate ////////////////////////////////////////////
// Timed temp deactivation.  call sotg_active_camo_activate when conditions are gone and timer is up
//
// if weapon, grenade toss etc turn off for action + .5 per round then call sotg_active_camo_holding
//
// if running, off till not running, 1 second loop, loops can add up for longer off time, once not running call holding
//
//
//
///////////////////////////////////////////////Holding ////////////////////////////////////////////////////
sotg_active_camo_holding =
{
	waitUntil {inputaction "user15" >0;};
	sleep 0.5;
	[] call sotg_active_camo_activate;
};
////////////////////////////////////////////// Run It /////////////////////////////////////////////////////
_unit removeAction _id; // remove the A.Cam action from player
//UsableUniforms = ["adf_Sotg_ACam_amcu","U_B_Protagonist_VR"];
//sleep 5;
//If ((uniform /*player*/_unit) in UsableUniforms) call sotg_active_camo_holding;
//sleep 1;
//SystemChat "You Are NOT a S.O.T.G. Ghost";
sleep 0.5;
SystemChat "SOTG A.CM Ready";
waitUntil {inputaction "user15" >0;};
[] call sotg_active_camo_activate;