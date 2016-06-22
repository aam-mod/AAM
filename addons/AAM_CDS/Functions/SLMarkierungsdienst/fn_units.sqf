private
[
		"_unitsReady", "_units", "_side", "_icon", "_iconPath", "_unitMan", "_alphaIcon", "_kdayNight", "_kfog", "_krain", "_sizeIcon", "_alphaName",
		"_distance", "_zoom", "_knightVision",	"_visionMode",	"_kthermal", "_kcdscheck", "_start", "_stop", "_runTime", "_scriptHandle", "_zoomRevision"
];

while{true} do
{
	//---TIMESTAMP ON LOOP START
	_start = diag_tickTime;

	scopeName "main";

	//MASK CHECK WORKS !!
		if ((goggles player) in ["G_Tactical_Black", "G_Tactical_Clear","G_Goggles_VR","ADF_Wrap_CDS","ADF_SOTGMask_Standard","ADF_SOTGMask_black_Standard"]) then {_kcdscheck = 1;} else{_kcdscheck = 0;};

	//---THERMAL ON (NO MARKER)
	if(currentVisionMode player == 2) then{_kthermal = 0;} else{_kthermal = 1;};

	//---ADVANTAGE/DISADVANTAGE IF NIGHTVISION IS ON
	if(currentVisionMode player == 1) then
	{
		if(sunOrMoon == 1) then
		{
			_knightVision = 0;
		}else
		{
			_knightVision = 1.5;
		};
	}else
	{
		_knightVision = 1;
	};

	//---ZOOMFACTOR (THANKS KILLZONEKID)
	_zoom = round(([0.5,0.5] distance worldToScreen positionCameraToWorld [0,1.05,1]) * (getResolution select 5));

	//---ZOOM CAN'T HELP YOU, IF YOU LOOK IN THE DARK
	if(fog > 0.6) then{_zoomRevision = _zoom;} else{_zoomRevision = 1;};

	//---FACTOR FOR DAY/NIGHT HANDICAP
	_kdayNight 	= ((1 - 0.25) * sunOrMoon) + 0.25;

	//---FACTOR FOR FOG HANDICAP
	_kfog 		= ((0.08 - 1) * fog) + 1;

	//---FACTOR FOR RAIN HANDICAP
	_krain 		= ((0.7 - 1) * rain) + 1;

	//---CALCULATION OF THE MAX VIEW DISTANCE (1000 IS THE MAX DISTANCE WHERE YOU KNOW, THERE IS SOMTHING)
	_distance = 1000 * _kdayNight * _kfog * _krain * _kthermal * _kcdscheck * _knightVision * _zoom;

	//---IF PLAYERSIDE HAVE CHANGED THE ARRAY SLMD_SIDE IS SET WITH THE NEW SIDE
	if(SLMD_side select 0 != side player) then
	{
		_scriptHandle = [] spawn SLMD_fnc_sideChange;
		waitUntil {scriptDone _scriptHandle};
	};

	//---CREATE AN ARRAY WITH OBJECTS OF INTEREST
	_units = (position player) nearEntities [[SLMD_side select 2, "LandVehicle", "Air", "Ship"], _distance];

	//---THE PLAYER WILL BE FIND TOO FROM NEARESTOBJECTS SO HE HAS TO BE DELETED
	if((_units select 0) == player) then
	{
		_units deleteAt 0;
	};

	//---IF THE ARRAY HOLD NOTHING, RETURN TO SCOPE MAIN
	if(count _units == 0) then{sleep 0.04; breakTo "main";};

	_unitsReady = [];

	{
		//---SIDE OF OBJECT FROM _UNITS-ARRAY (IT IS NOT EAST, WEST,.... IT IS A NUMBER)
		_side = getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "side");

		//---ICON SIZE OF THE OBJECT
		if((player distance _x) > 0) then
		{
			_sizeIcon = (rad(2 * atan((0.422793 * 30) / (player distance _x)))) * _zoom;
		}else
		{
		 _sizeIcon = 0.8;
		};

		//---IF YOU ARE CLOSE ENOUGH THE ICONSIZE CAN GET HIHGER THEN 0.8
		if(_sizeIcon > 0.8) then
		{
			_sizeIcon = 0.8;
		};

		//---TRANSPARENCY IN RELATION TO OBJECT DISTANCE FROM PLAYER
		_alphaIcon = linearConversion[0, _distance, player distance _x, 1, 0, true];

		//---IF THE OBJECT IS A SOLDIER
		if((typeOf _x) isKindOf "Man" && alive _x && _side == SLMD_side select 1 && _x != player) then
		{
			//---GET THE PATH OF THE ICON OF THE SOLDIER
			_icon = getText (configFile >> "CfgVehicles" >> typeOf _x >> "icon");
			_iconPath = (getText (configfile >> "CfgVehicleIcons" >> _icon));

			//---IF THE SOLDIER IS A HUMAN PLAYER
			if(isPlayer _x) then
			{
				//---TRANSPARENCY FOR THE NAMEICON OF THE SOLDIER
				_alphaName = linearConversion[5, 30, player distance _x, 1, 0, true];

				//---SET THE PARAMAETER ARRAY FOR THE GIVIN SOLDIER AND STORE IT IN THE _UNITSREADY ARRAY
				_unitsReady pushBack [_x, player distance _x, _iconPath, 1, _alphaIcon, _sizeIcon];//, _alphaName];
			}else
			{
				//---SET THE PARAMAETER ARRAY FOR THE GIVIN SOLDIER AND STORE IT IN THE _UNITSREADY ARRAY
				_unitsReady pushBack [_x, player distance _x, _iconPath, 1, _alphaIcon, _sizeIcon];
			};

		};

		//---IF THE OBJECT IS A VEHICLE
		if(((typeOf _x) isKindOf "LandVehicle" || !(typeOf _x isKindOf "Land")) && alive _x && side ((crew _x) select 0) == SLMD_side select 0 && count (crew _x) > 0 && !(player in (crew _x))) then
		{
			//---GET THE PATH OF THE ICON OF THE VEHICLE
			_iconPath = getText (configFile >> "CfgVehicles" >> typeOf _x >> "picture");

			//---SET THE PARAMAETER ARRAY FOR THE GIVIN VEHICLE AND STORE IT IN THE _UNITSREADY ARRAY
			_unitsReady pushBack [_x, player distance _x, _iconPath, 2, _alphaIcon, _sizeIcon];
		};
	}forEach _units;

	//---COPY THE LOCAL _UNITSREADY ARRAY IN THE GLOBAL SLMD_UNITS ARRAY
	SLMD_units = +_unitsReady;

	//---TIMESTAMP ON LOOP END
	_stop = diag_tickTime;

	//---RUNTIME CODE
	_runTime = _stop - _start;

	//---IF THE LOOP IS FINISCHED IN LESS THEN 0.04 SECONDS, A SLEEP IS SET SO THE RUNTIME IS 0.04 SECONDS
	if(_runTime < 0.04) then
	{
		sleep (0.04 - _runTime);
	};
};