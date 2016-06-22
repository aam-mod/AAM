class CfgPatches {
	class AAM_Base {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
		author = "AAF";
		projectName = "Aust AFs Australian Army Modification";
	};
};
class CfgMods
{
	class Mod_Base;
	class AAM: Mod_Base
	{
		author = "AAF";
		picture = "AAM_Base\data\AAM.paa";
		logo = "AAM_Base\data\AAM.paa";
		logoOver = "AAM_Base\data\AAM.paa";
		logoSmall = "AAM_Base\data\AAM.paa";
		dlcColor[] = {0,0,0,1};
		fieldManualTopicAndHint[] = {"AAM","AAM_Base"};
		hideName = 1;
		hidePicture = 0;
		tooltip = "AAM";
		tooltipOwned = "AAM";
		name = "AAM";
		overview = "A full arsenal of authentic ADF equipment, allowing anyone to experience combat as a member of the Australian Defense Force.";
		action = "http://www.australianarmedforces.org/";
		dir = "AAM";
	};
};
class cfgFactionClasses {
	class AAM_ADF {
		displayName = "A.D.F.";
		priority = 4;
		side = 1;
		icon = "\AAM_units\Data\cfgFactionClasses_sotg_ca.paa";
	};
};
class CfgVehicles {
	class Man;
	// Ghost Recon Style 3rd Person View adjustment
	//class CAManBase: Man {extCameraPosition[] = {0.4,-0.3,-0.6};};
};
class Extended_PreInit_EventHandlers {
	AAM_Base_init = "[] execVM '\AAM_Base\Scripts\AAMinit.sqf'";
};
class CfgFontFamilies {
	class AAMFS {
		fonts[] = {
			"\AAM_Base\Fonts\AAMFS6",
			"\AAM_Base\Fonts\AAMFS7",
			"\AAM_Base\Fonts\AAMFS8",
			"\AAM_Base\Fonts\AAMFS9",
			"\AAM_Base\Fonts\AAMFS10",
			"\AAM_Base\Fonts\AAMFS11",
			"\AAM_Base\Fonts\AAMFS12",
			"\AAM_Base\Fonts\AAMFS13",
			"\AAM_Base\Fonts\AAMFS14",
			"\AAM_Base\Fonts\AAMFS15",
			"\AAM_Base\Fonts\AAMFS16",
			"\AAM_Base\Fonts\AAMFS17",
			"\AAM_Base\Fonts\AAMFS18",
			"\AAM_Base\Fonts\AAMFS19",
			"\AAM_Base\Fonts\AAMFS20",
			"\AAM_Base\Fonts\AAMFS21",
			"\AAM_Base\Fonts\AAMFS22",
			"\AAM_Base\Fonts\AAMFS23",
			"\AAM_Base\Fonts\AAMFS24",
			"\AAM_Base\Fonts\AAMFS25",
			"\AAM_Base\Fonts\AAMFS26",
			"\AAM_Base\Fonts\AAMFS27",
			"\AAM_Base\Fonts\AAMFS28",
			"\AAM_Base\Fonts\AAMFS29",
			"\AAM_Base\Fonts\AAMFS30",
			"\AAM_Base\Fonts\AAMFS31",
			"\AAM_Base\Fonts\AAMFS34",
			"\AAM_Base\Fonts\AAMFS35",
			"\AAM_Base\Fonts\AAMFS37",
			"\AAM_Base\Fonts\AAMFS46"
		};
		spaceWidth = 0.5; //0.7
		spacing = 0.10; //0.13
	};
};