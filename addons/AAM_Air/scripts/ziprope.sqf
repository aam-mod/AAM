/*
	Taw_Jarhead
	Zip rope script v1
	5/23/2014

	This is a simple zip rope script i put together as a future fastropeing option
	its made to make easy and quick insert into enemy territory.

	usage:
		this addaction ["<t color='#00FFFF'>Zip-Rope</t>", "ziprope.sqf"] // put this into the init field of any helo

	insipired by:
	https://www.youtube.com/watch?v=vw61gCe2oqI <<< edge of tomrow trailer
	https://www.youtube.com/watch?v=MaNs64k_2xw <<< gi joe trailer

*/




_vehicle = (_this select 0); // selects the object with the action on it
_actor = (_this select 1); // selects the player who activated the action on the object
_altitude = (position _vehicle) select 2;
_height = (position _actor) select 2;
_myvariable = 0;

_actor action ["eject", _vehicle];
_objectTT = "Land_MetalBarrel_F" createvehiclelocal position _actor;
_objectTT enablesimulation false;
_objectTT setpos [(getpos _objectTT select 0), ((getpos _objectTT select 1)),_height];
hideObject _objectTT;

_rope = createVehicle ["land_rope_f", [0,0,0], [], 0, "CAN_COLLIDE"];
_rope attachto [_actor, [0,0,0], "Pelivs"];



while {alive _actor and (getpos _actor select 2) > 1} do {

		playsound "zipper";
		 _actor attachto [_objectTT, [0,0,_myvariable]];
		 _myvariable = _myvariable - 2;
		sleep 0.1;
	};


detach _rope;
deletevehicle _rope;
deletevehicle _objectTT;
detach _actor;