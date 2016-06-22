/*
	CONTENT OF _X

	PARAMETER(S):
	0:	OBJECT
	1:	DISTANCE TO PLAYER
	2:	ICONPATH FROM CFG
	3:	WIDTH MULTIPLIER (VEHICLE PICTURE IS 2:1)
	4:	VALUE ALPHA  (ICON)
	5:	ICON SIZE	(1:1)
	6:	VALUE ALPHA  (PLAYERNAME)
*/
if(isDedicated) exitWith {"NOT ALLOWED ON DEDICATED SERVER" call BIS_fnc_log;};										// no player unit controlled on a dedicated server
if(!isDedicated && !hasInterface) exitWith {"NOT ALLOWED ON HEADLESSCLIENT" call BIS_fnc_log;};						// no headless client
if(player getVariable ["SLMD_init", false]) exitWith {"SLMD_INIT HAVE STARTED MORE THEN ONCE" call BIS_fnc_log;};	// prevent that a unit run the init twice

player setVariable ["SLMD_init", true];

SLMD_units = [];

//---RECOGNIZE PLAYER SIDE
_scripthandle = [] spawn SLMD_fnc_sideChange;
waitUntil{scriptDone _scriptHandle};

//---FUNCTION CALCULATE ALL PARAMETERS
[] spawn SLMD_fnc_units;

addMissionEventhandler
[
	"Draw3D",
	{
		{
			//---ICON ABOVE OBJECTS
			drawIcon3D
			[
				_x select 2,
				[SLMD_color select 0, SLMD_color select 1, SLMD_color select 2, (SLMD_color select 3) * (_x select 4)],
				(_x select 0) modelToWorldVisual [0, 0, 2],  //2.25 last value -- for ICON size
				(_x select 5) * (_x select 3),
				(_x select 5),
				0
			];

			//---NAME OF PLAYERS
			if(count _x == 7) then
			{
				drawIcon3D ["", [1,1,1,1 * (_x select 6)], (_x select 0) modelToWorldVisual [0, 0, 1.25], 0, 0, 0, format["%1", name (_x select 0)],0,0.03];
			};

		}forEach SLMD_units;
	}
];

waitUntil{!isNull (findDisplay 46)};
systemchat "SL marking service connected"; //Markierungsdienst: Verbunden";