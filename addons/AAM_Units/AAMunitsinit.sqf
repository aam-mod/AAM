if (hasinterface) then {
	//["Preload"] call BIS_fnc_arsenal;
	waitUntil{!isNil "BIS_fnc_init"};
	waituntil {!(IsNull (findDisplay 46))};
	//uiSleep 0.5;
	player addAction ["SOTG A.CM", "\AAM_Units\scripts\Active_Camo.sqf", [], 5, false, true, "",
	"(uniform player) in[""adf_Sotg_ACam_amcu"",""U_B_Protagonist_VR""]"];
};
