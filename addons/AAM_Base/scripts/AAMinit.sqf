if (hasinterface) then {

	["Preload"] call BIS_fnc_arsenal;
	waitUntil{!isNil "BIS_fnc_init"};
	waituntil {!(IsNull (findDisplay 46))};
	uiSleep 0.5;
	if ((getPlayerUID player) in [
		"76561197990250291", //Romm
		"76561198042731035", //Az
		"76561198010877383", //Gnrnr
		"76561198000746503", //Monty
		"76561198037303919", //Retra
		"76561198021103627", //Corny
		"76561198194665570", //Stefan
		"_SP_PLAYER_"]) then {
	private "_keyDown";
	_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 24) then {['Open', true] call BIS_fnc_arsenal;}"];
	};
};
