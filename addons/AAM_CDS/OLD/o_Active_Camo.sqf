///Authors: XxRTEKxX, HallyG, and DreadedEntity and heavily modified by Monty
waituntil {alive player};
_Unit = _this select 0;//_player;
_id = _this select 2;
if (isDedicated) exitWith {};
WaitUntil {!isNull FindDisplay 46};
/*/////////////////////////////////////////////GLOBAL VIEWING//////////////////////////////////////////////
private ["_ctg","_nearunits"];
		//search thru all nearby units
_nearunits = (getpos player) nearentities [["camanbase"],tpw_hud_maxrange ]; // infantry

		//find units with ACM_ON > 0
for "_ctg" from 0 to (count _nearunits - 1) do {
	_unit = _nearunits select _ctg;
	if (_unit getVariable ACM_ON == 1) then {

	//	acm on there LOC

	}; else {};



run  activate on them but instead of _unit, its to be THE OTHER UNITS location
*/
///////////////////////////////////////////////Activate ///////////////////////////////////////////////////
sotg_active_camo_activate =
{
	ACM_ON = 1;
	_source = "#particlesource" createVehiclelocal getpos /*player*/_unit;
	_source setParticleCircle [0, [0.1, 0.1, 0.1]];
	_source setParticleRandom [0, [0, 0.1, 1], [0.1, 0, 0.1], 0, 0.1, [0, 0, 0, 0.1], 0, 0];
	_source setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract", 1, 0, 1], "", "Billboard", 1, 4, [0, 0, 0], [0, 0, 0.5], 9, 10, 7.9, 0.1, [0.6, 1, 0.9, 0.8], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0, 0.1, 0.2, 0.5, 0.1, 0.1], 0, 0, "", "", /*player*/_unit];
	_source setDropInterval 0.1;
	_source attachto [/*player*/_unit,[0,0,0]];
	sleep 0.5;
	/*player*/_unit hideObjectGlobal true;
	SystemChat "A.CM Online"; //ICON SHOW ON CDS ?
	/*player*/_unit setCaptive true;
	sleep 0.5;
	//wait until deactivation event waituntil (sdafliuhfds||sdfsdf||sdfsdf||sdfdsfsd) exitwith call deactivate
};
//////////////////////////////////////////////Deactivate/////////////////////////////////////////////////
sotg_active_camo_deactivate =
{
	ACM_ON = 0;
	deleteVehicle _source;
	/*player*/_unit hideObjectGlobal false;
	/*player*/_unit setCaptive false;
	SystemChat "A.CM Offline"; //Icon show / hide on CDS ?
	sleep 1;
};
///////////////////////////////////////////////Temp deactivate ////////////////////////////////////////////
// Timed temp deactivation.  call sotg_active_camo_avaliable when conditions are gone and timer is up
/*
while {true} do {
   if (_unit speed > 2) then {false}; //moveing to fast

   if (stance player == "STAND") then {false};
   if (stance player == "UNDEFINED") then {false};

   if (_timer == 60) then {false}; //time elapsed

   sleep 1;  // checks all conditions every second, adjust downwards to fex 0.1 for faster response

   timer = timer + 1;
};
*/
///////////////////////////////////////////////Holding ////////////////////////////////////////////////////
sotg_active_camo_holding =
{
	waitUntil {inputaction "user15" >0;};
	sleep 0.5;
	[] call sotg_active_camo_activate;
};
////////////////////////////////////////////// Run It /////////////////////////////////////////////////////
//Now CBA keybinding
//check uniform n equipment
//if no, print "Not correct EQ"
//if yes, call sotg_active_camo_activate

//_unit removeAction _id; // remove the A.Cam action from player
//UsableUniforms = ["adf_Sotg_ACam_amcu","U_B_Protagonist_VR"];
//sleep 5;
//If ((uniform /*player*/_unit) in UsableUniforms) call sotg_active_camo_holding;
//sleep 1;
//SystemChat "You Are NOT a S.O.T.G. Ghost";
/*
sleep 0.5;
SystemChat "SOTG A.CM Ready";
waitUntil {inputaction "user15" >0;};
[] call sotg_active_camo_activate;
*/