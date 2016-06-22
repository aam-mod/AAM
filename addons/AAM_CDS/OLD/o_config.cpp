class CfgPatches {
	class AAM_CDS {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Characters_F_BLUFOR","CBA_Extended_EventHandlers","cba_main","A3_Modules_F"};
		author = "AAF";
		projectName = "AAM's CDS + A.CM";
	};
};
class CfgGlasses {
	class G_Bandanna_shades;
	class ADF_Wrap_CDS: G_Bandanna_shades {
		author = "Monty + AAF";
		displayName = "ADF SOTG CDS + A.CM Wrap";
		model = "\A3\Characters_F_Bootcamp\Guerrilla\g_bandana_shades.p3d";
		picture = "\A3\Characters_F_Bootcamp\Data\UI\icon_G_Bandana_shades_ca.paa";
		mass = 6;
		hiddenSelections[] = {"camo1"}; //"camo2"
		hiddenSelectionsTextures[] = {"\AAM_CDS\data\reconwrap_co.paa"};
		//ace_color[] = {0, 0, -1};  // Post-proccess color
		//ace_tintAmount = 8;  // Amount of tint applied to the color
		//ace_resistance = 2;
		//ace_protection = 1;
		//ace_overlay = "AAM_CDS\Data\CDS_glasses.paa";
		//ace_overlayCracked = "AM_CDS\Data\CDS_glasses_crackeded.paa";  // (Optional) Cracked overlay image path
		//ace_overlayDirt = "A3\Ui_f\data\igui\rsctitles\HealthTextures\dust_upper_ca.paa";  // (Optional) Dirt overlay image path == LEAVE ?
		//ace_dustPath = "mod\textures\fx\dust\dust1.paa";  // (Optional) Dust overlay image path == LEAVE ?
		//ace hearing protection as well ?
	};
};
class CfgSounds {
	class AAM_CDS_FireInTheHole {
		name = "Fire in the hole";
		sound[] = {"a3\dubbing_radio_f\data\eng\Male01ENG\RadioProtocolENG\Combat\200_CombatShouts\ThrowingGrenadeE_1.ogg",0.8,1};
		titles[] = {0,""};
	};
	class AAM_CDS_ThrowingSmoke
	{
		name = "Throwing Smoke";
		sound[] = {"a3\dubbing_radio_f\data\eng\Male01ENG\RadioProtocolENG\Combat\200_CombatShouts\ThrowingSmokeE_1.ogg",0.8,1};
		titles[] = {0,""};
	};
};
class CfgMusicClasses {
	class AAM {
		displayName = "AAM";
	};
};
class CfgMusic {
	tracks[]={Invaders};
	class Invaders
	{
		name = "Invaders";
		sound[] = {"AAM_CDS\sound\invadersintro.ogg", db+0, 1.0};
		theme = "Lead";
		duration = "218";
		musicClass = "AAM";
	};
	class ActofValor
	{
		name = "Act Of Valor";
		sound[] = {"AAM_CDS\sound\ActofValor.ogg", db+0, 1.0};
		theme = "Lead";
		duration = "218";
		musicClass = "AAM";
	};
	class GodsGonna
	{
		name = "Gods Gonna Cut You Down";
		sound[] = {"AAM_CDS\sound\GodsGonnaCutYouDown.ogg", db+0, 1.0};
		theme = "Lead";
		duration = "218";
		musicClass = "AAM";
	};
	class One
	{
		name = "One";
		sound[] = {"AAM_CDS\sound\One.ogg", db+0, 1.0};
		theme = "Lead";
		duration = "218";
		musicClass = "AAM";
	};
	class FMJPrayer
	{
		name = "F.M.J. Prayer";
		sound[] = {"AAM_CDS\sound\Prayer.ogg", db+0, 1.0};
		theme = "Lead";
		duration = "218";
		musicClass = "AAM";
	};
	class WantedIntro
	{
		name = "Wanted";
		sound[] = {"AAM_CDS\sound\WantedintroAAF.ogg", db+0, 1.0};
		theme = "Lead";
		duration = "218";
		musicClass = "AAM";
	};
	class Welcometothe
	{
		name = "Welcometothejungle";
		sound[] = {"AAM_CDS\sound\WelcomeToTheJungleIntro.ogg", db+0, 1.0};
		theme = "Lead";
		duration = "218";
		musicClass = "AAM";
	};
};

class RscText;
class RSCPicture;
class RscPic {
	access = 0;
	type = CT_STATIC;
	idc = -1;
	style = 48;//ST_PICTURE
	colorBackground[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
};
class RscTitles {
	titles[] = {"AAM_lens, AAM_clear"};
	class AAM_lens { // basic data
		idd = -1;
		duration = 100000;
		fadein = 0;
		fadeout = 0;
		name="AAM_Lens";
		//onLoad = "uiNamespace setVariable ['Glasses_basic_data', _this select 0]";
		controls[] = {
			Ghost,
			Hudframe
		};
		class alti: RscText { //top right
			idc = 1006;
			style = 0;
			colorBackground[] = {0.17, 0.17, 0.17, 0.65 };
			text = "";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 55)/ (getResolution select 5) )";
			x = (0.6 - 0.01) * safezoneW + safezoneX;
			y = (0.45 + 0.29) * safezoneW + safezoneX; //safezoneH + safezoneY;
			w = 0.0825;//0.165;
			h = 0.0825;
		};
		class azu: RscText { //top middle
			idc = 1007;
			style = 0;
			colorBackground[] = {0.17, 0.17, 0.17, 0.65 };
			text = ""; //or picture ?  text = "CCOREM\MENU\Core.paa";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 55)/ (getResolution select 5) )";
			x = (0.5 - 0.01) * safezoneW + safezoneX;
			y = (0.45 + 0.29) * safezoneW + safezoneX; //safezoneH + safezoneY;
			w = 0.12375; //0.165;
			h = 0.0825;
		};
		class grid: RscText { //top left
			idc = 1008;
			style = 0;
			colorBackground[] = {1, 1, 1, 1 };
			text = "";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 55)/ (getResolution select 5) )";
			x = (0.4 - 0.01) * safezoneW + safezoneX;
			y = (0.45 + 0.29) * safezoneW + safezoneX; //safezoneH + safezoneY;
			w = 0.165;
			h = 0.0825;
		};
		class HLT: RscText { //middle left
			idc = 1009;
			style = 0;
			colorBackground[] = {0.17, 0.17, 0.17, 0.65 };
			text = "";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 55)/ (getResolution select 5) )";
			x = (0.4 - 0.01) * safezoneW + safezoneX;
			y = (0.5 + 0.29) * safezoneW + safezoneX; //safezoneH + safezoneY;
			w = 0.11;//0.165;
			h = 0.0825;
		};
		class LMT: RscText { //Low left
			idc = 1010;
			style = 0;
			colorBackground[] = {0.17, 0.17, 0.17, 0.65 };
			text = "";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 55)/ (getResolution select 5) )";
			x = (0.4 - 0.01) * safezoneW + safezoneX;
			y = (0.55 + 0.29) * safezoneW + safezoneX; //safezoneH + safezoneY;
			w = 0.11;//0.165;
			h = 0.0825;
		};
		class Ghost: RscPicture { //RscPic
			idc = 1011;
			colorBackground[] = {0.17, 0.17, 0.17, 0.65 };
			text = "\AAM_CDS\data\ghost_i.paa";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 55)/ (getResolution select 5) )";
			x = 0 * safezoneW + safezoneX;
			y = 0.79 * safezoneW + safezoneX; //safezoneH + safezoneY;
			w = 0.2;
			h = 0.2;
		};
		class Hudframe: RscPicture {
			idc = 1012;
			text = "\AAM_CDS\data\hud\hud2.paa";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 55)/ (getResolution select 5) )";
			x = 0.28 * safezoneW + safezoneX;
			y = 0.74 * safezoneW + safezoneX;
			w = 1.1;
			h = 0.45;
		};
	};
	class AAM_clear {
		idd = -1;
		fadein = 0;
		fadeout = 0;
		duration = 0;
		name="AAM_clear";
	};
	class TPW_HUD_TXT {
		type = 13;
		idc = -1;
		style=0x00;
		colorbackground[] = {0,0,0,0};
		colortext[] = {0,1,0,0.5};
		size = "0.03 / (getResolution select 5)";
		h = 0.5;
		w = 0.5;
		text = "";
		class Attributes {
			font = PuristaSemibold;
			color = "#000000";
			align = "left";
			valign = "middle";
			shadow = false;
			shadowColor = "#ff0000";
			size = "1";
		};
	};
	class TPW_HUD_DIALOG {
		onLoad = "uiNamespace setVariable ['TPW_HUD_DISPLAY', _this select 0];";
		idd = -1;
		movingenable = 0;
		enablesimulation = 1;
		controlsbackground[] = {};
		access = 0;
		duration = 1e+1000;
		fadeIn = 0;
		fadeOut = 0;
		objects[] = {};
		controls[] = {
			TPW_HUD_TXT_1,
			TPW_HUD_TXT_2,
			TPW_HUD_TXT_3,
			TPW_HUD_TXT_4,
			TPW_HUD_TXT_5,
			TPW_HUD_TXT_6,
			TPW_HUD_TXT_7,
			TPW_HUD_TXT_8,
			TPW_HUD_TXT_9
		};
		class TPW_HUD_TXT_1 : TPW_HUD_TXT {
			idc = 100001;
			x = 0.58 * safezoneW + safezoneX; //.38
			y = 0.4 * safezoneW + safezoneX;
			text = "";
		};
		class TPW_HUD_TXT_2 : TPW_HUD_TXT {
			idc = 100002;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.4 * safezoneW + safezoneX;
			text = "";
		};
		class TPW_HUD_TXT_3 : TPW_HUD_TXT {
			idc = 100003;
			x = 0.58 * safezoneW + safezoneX;
			y = 0.4 * safezoneW + safezoneX;
			text = "";
		};
		class TPW_HUD_TXT_4 : TPW_HUD_TXT {
			idc = 100004;
			x = 0.38 * safezoneW + safezoneX;
			y = 0.5 * safezoneW + safezoneX;
			text = "";
		};
		class TPW_HUD_TXT_5 : TPW_HUD_TXT {
			idc = 100005;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.5 * safezoneW + safezoneX;
			text = "";
		};
		class TPW_HUD_TXT_6 : TPW_HUD_TXT {
			idc = 100006;
			x = 0.58 * safezoneW + safezoneX;
			y = 0.5 * safezoneW + safezoneX;
			text = "";
		};
		class TPW_HUD_TXT_7 : TPW_HUD_TXT {
			idc = 100007;
			x = 0.38 * safezoneW + safezoneX;
			y = 0.6 * safezoneW + safezoneX;
			text = "";
		};
		class TPW_HUD_TXT_8 : TPW_HUD_TXT {
			idc = 100008;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.6 * safezoneW + safezoneX;
			text = "";
		};
		class TPW_HUD_TXT_9 : TPW_HUD_TXT {
			idc = 100009;
			x = 0.58 * safezoneW + safezoneX;
			y = 0.6 * safezoneW + safezoneX;
			text = "";
		};
	};
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Extended_PreInit_EventHandlers {
	AAM_CDS_init = "call compile preprocessFileLineNumbers '\AAM_CDS\CDS_ADDON.sqf';";
	//AAM_CDS_init = "[] execVM '\AAM_CDS\CDSinit.sqf'";
};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////