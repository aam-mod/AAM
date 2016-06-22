
class CfgPatches
{
	class AAM_CDS//TPW_MODS
	{
		units[] = { };
		weapons[] = { };
		requiredAddons[] = {"CBA_Extended_EventHandlers","A3_Characters_F_BLUFOR"};
		version = "20151230";
		versionStr = "20151230";
		versionDesc= "AAM CDS";//"TPW MODS";
		versionAr[] = {201,02,01};
		author[] = {"AAF"};
	};
};
///////////SL ICONS IMPORT///////
class CfgFunctions { 	//#include "aam_cds\Functions\functions.hpp"
	class SLMD {
		class SLMarkierungsdienst {
			class initMod {
				file = "\AAM_CDS\SLMD_initServer.sqf";
				postInit = 1;
			};
			file = "\AAM_CDS\Functions\SLMarkierungsdienst";
			class init			{};
			class sideChange	{};
			class units			{};
		};
	};
};
/*
class CfgWeapons {
	class NVGoggles;
	class ADF_SOTGMask_CDS_Standard: NVGoggles //ADF_SOTG_CDS - AJ_Mask_Tan
	{
		Scope=2;
		displayName="SOTG Mask (tan)";
		modelOptics="\AAM_CDS\Mask_optics";
		model="\AAM_CDS\AJ_Mask_2_std";
		identityTypes[] = {"G_NATO_default", 0, "G_NATO_casual", 0, "G_NATO_pilot", 0, "G_NATO_recon", 0, G_NATO_SF, 0, "G_NATO_sniper", 0, "G_NATO_diver", 0, "G_IRAN_default", 0, "G_IRAN_diver", 0, "G_GUERIL_default", 0, "G_HAF_default", 0, "G_CIVIL_female", 0, "G_CIVIL_male", 0};
		descriptionShort="CDS Mask With Night vision function";

		visionMode[] = {"Normal","NVG","TI"};
		thermalMode[] = {0, 4}; //4 red hot

		class ItemInfo {
			type=616;
			hmdType=0;
			uniformModel="\AAM_CDS\ajmask\AJ_Mask_2_std.p3d";
			modelOff="\AAM_CDS\AJ_Mask_2_std_off"; // Flip up ?
			mass=20;
		};
	};
	class AJ_Mask_Tan_teamlead: NVGoggles
	{
		Scope=2;
		displayName="SOTG Mask (tan) - teamlead";
		modelOptics="\AAM_CDS\Mask_optics";
		model="\AAM_CDS\AJ_Mask_2";
		hiddenSelections[] = {"Camo", "Glass"};
		hiddenSelectionsTextures[] = {"\AAM_CDS\data\Mask_blk_Teamlead_co.paa", "\AAM_CDS\data\Mask_Blk_Teamlead_co.paa"};
		identityTypes[] = {"G_NATO_default", 0, "G_NATO_casual", 0, "G_NATO_pilot", 0, "G_NATO_recon", 0, G_NATO_SF, 0, "G_NATO_sniper", 0, "G_NATO_diver", 0, "G_IRAN_default", 0, "G_IRAN_diver", 0, "G_GUERIL_default", 0, "G_HAF_default", 0, "G_CIVIL_female", 0, "G_CIVIL_male", 0};
		descriptionShort="Mask With Night vision function";
		class ItemInfo
		{
			type=616;
			hmdType=0;
			uniformModel="\AAM_CDS\AJ_Mask_2";
			modelOff="\AAM_CDS\AJ_Mask_2_off";
			mass=20;
		};
	};
};
*/
class CfgGlasses {
	class None;	// External class reference
	class G_Bandanna_shades;
	class ADF_Wrap_CDS: G_Bandanna_shades {
		dlc = "AAM";
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
	class ADF_SOTGMask_Standard : None { //AJ_Mask_Standard
		dlc = "AAM";
		author = "Zeelix + AAF";
		displayname = "ADF SOTG Mask -Tan";
		model = "\AAM_CDS\AJMask\AJ_Mask_2.p3d";
		hiddenSelections[] = {"Camo", "Glass"};
		hiddenSelectionsTextures[] = {"\AAM_CDS\ajmask\data\Mask_std_co.paa", "\AAM_CDS\ajmask\data\Mask_std_co.paa"};
		identityTypes[] = {"G_NATO_default", 0, "G_NATO_casual", 0, "G_NATO_pilot", 0, "G_NATO_recon", 0, G_NATO_SF, 0, "G_NATO_sniper", 0, "G_NATO_diver", 0, "G_IRAN_default", 0, "G_IRAN_diver", 0, "G_GUERIL_default", 0, "G_HAF_default", 0, "G_CIVIL_female", 0, "G_CIVIL_male", 0};
	};
	class ADF_SOTGMask_black_Standard : None { //AJ_Mask_black_Standard
		dlc = "AAM";
		author = "Zeelix + AAF";
		displayname = "ADF SOTG Mask -black";
		model = "\AAM_CDS\AJMask\AJ_Mask_2.p3d";
		hiddenSelections[] = {"Camo", "Glass"};
		hiddenSelectionsTextures[] = {"\AAM_CDS\ajmask\data\Mask_blk_co.paa", "\AAM_CDS\ajmask\data\Mask_blk_co.paa"};
		identityTypes[] = {"G_NATO_default", 0, "G_NATO_casual", 0, "G_NATO_pilot", 0, "G_NATO_recon", 0, G_NATO_SF, 0, "G_NATO_sniper", 0, "G_NATO_diver", 0, "G_IRAN_default", 0, "G_IRAN_diver", 0, "G_GUERIL_default", 0, "G_HAF_default", 0, "G_CIVIL_female", 0, "G_CIVIL_male", 0};
		visionMode[] = {"Normal","NVG","TI"};
		thermalMode[] = {0, 4}; //4 red hot
	};
	/*
	class ADF_SOTGMask_Teamlead : None { // AJ_Mask_Teamlead
		dlc = "AAM";
		author = "Zeelix + AAF";
		displayname = "ADF SOTG Mask -Tan (Teeth)";
		model = "\AAM_CDS\AJMask\AJ_Mask_2.p3d";
		hiddenSelections[] = {"Camo", "Glass"};
		hiddenSelectionsTextures[] = {"\AAM_CDS\ajmask\data\Mask_Teamlead_co.paa", "\AAM_CDS\ajmask\data\Mask_Teamlead_co.paa"};
		identityTypes[] = {"G_NATO_default", 0, "G_NATO_casual", 0, "G_NATO_pilot", 0, "G_NATO_recon", 0, G_NATO_SF, 0, "G_NATO_sniper", 0, "G_NATO_diver", 0, "G_IRAN_default", 0, "G_IRAN_diver", 0, "G_GUERIL_default", 0, "G_HAF_default", 0, "G_CIVIL_female", 0, "G_CIVIL_male", 0};
	};
	class ADF_SOTGMask_Black_Teamlead : None { //AJ_Mask_Black_Teamlead
		dlc = "AAM";
		author = "Zeelix + AAF";
		displayname = "ADF SOTG Mask -Black (Teeth)";
		model = "\AAM_CDS\AJMask\AJ_Mask_2.p3d";
		hiddenSelections[] = {"Camo", "Glass"};
		hiddenSelectionsTextures[] = {"\AAM_CDS\dajmask\ata\Mask_blk_Teamlead_co.paa", "\AAM_CDS\ajmask\data\Mask_Blk_Teamlead_co.paa"};
		identityTypes[] = {"G_NATO_default", 0, "G_NATO_casual", 0, "G_NATO_pilot", 0, "G_NATO_recon", 0, G_NATO_SF, 0, "G_NATO_sniper", 0, "G_NATO_diver", 0, "G_IRAN_default", 0, "G_IRAN_diver", 0, "G_GUERIL_default", 0, "G_HAF_default", 0, "G_CIVIL_female", 0, "G_CIVIL_male", 0};
	};
	*/
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
/////////////////////////////////////////////////////////////NEW
class RscTitles
	{
	class TPW_HUD_TXT
	{
		type = 13;
		idc = -1;
		style=0x00;
		colorbackground[] = {0.1,0.1,0.1,0.8};//{0,0,0,0};
		colortext[] = {0,1,0,0.5};
		size = "0.03 / (getResolution select 5)";
		h = 0.5;
		w = 0.5;
		text = "";
		class Attributes
		{
			font = AAMFS;//etelkamonospacepro;
			color = "#000000";
			align = "left";
			valign = "middle";
			shadow = false;
			shadowColor = "#ff0000";
			size = "1";
		};
	};
	class TPW_HUD_DIALOG
	{
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
		controls[] =
		{
			TPW_HUD_TXT_1,
			TPW_HUD_TXT_2,
			TPW_HUD_TXT_3,
			TPW_HUD_TXT_4,
			//TPW_HUD_TXT_5,
			//TPW_HUD_TXT_6,
			TPW_HUD_TXT_7 //,
			//TPW_HUD_TXT_8,
			//TPW_HUD_TXT_9
		};
		class TPW_HUD_TXT_1 : TPW_HUD_TXT //ASL
		{
			idc = 100001;
			x = 0;//0.38 * safezoneW + safezoneX;
			y = 0;//0.4 * safezoneW + safezoneX;
			h = 0.1;
			w = 0.09;
			text = "";
		};
		class TPW_HUD_TXT_2 : TPW_HUD_TXT //AZT
		{
			idc = 100002;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.4 * safezoneW + safezoneX;
			text = "";
			h = 0.11;
			w = 0.12;
		};
		class TPW_HUD_TXT_3 : TPW_HUD_TXT //GRD
		{
			idc = 100003;
			x = 0.58 * safezoneW + safezoneX;
			y = 0.4 * safezoneW + safezoneX;
			text = "";
			h = 0.1;
			w = 0.2;
		};
		class TPW_HUD_TXT_4 : TPW_HUD_TXT// LMT
		{
			idc = 100004;
			x = 0.38 * safezoneW + safezoneX;
			y = 0.5 * safezoneW + safezoneX;
			text = "";
			h = 0.05;
			w = 0.15;
		};
		class TPW_HUD_TXT_5 : TPW_HUD_TXT
		{
			idc = 100005;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.5 * safezoneW + safezoneX;
			text = "";
		};
		class TPW_HUD_TXT_6 : TPW_HUD_TXT
		{
			idc = 100006;
			x = 0.58 * safezoneW + safezoneX;
			y = 0.5 * safezoneW + safezoneX;
			text = "";
		};
		class TPW_HUD_TXT_7 : TPW_HUD_TXT // HLT
		{
			idc = 100007;
			x = 0.38 * safezoneW + safezoneX;
			y = 0.6 * safezoneW + safezoneX;
			text = "";
			h = 0.3;
			w = 0.11;
		};
		class TPW_HUD_TXT_8 : TPW_HUD_TXT
		{
			idc = 100008;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.6 * safezoneW + safezoneX;
			text = "";
		};
		class TPW_HUD_TXT_9 : TPW_HUD_TXT
		{
			idc = 100009;
			x = 0.58 * safezoneW + safezoneX;
			y = 0.6 * safezoneW + safezoneX;
			text = "";
		};
	};
};
///MODIFIED
/*
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
	titles[] = {"AAM_lens, AAM_clear","tpw_hud_dialog"};
	/*class AAM_lens { // basic data
		idd = -1;
		duration = 100000;
		fadein = 0;
		fadeout = 0;
		name="AAM_Lens";
		//onLoad = "uiNamespace setVariable ['Glasses_basic_data', _this select 0]";
		controls[] = {
			//Ghost,
			//Hudframe
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
			text = "";
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
		style=ST_HUD_BACKGROUND;//0x00;
		colorbackground[] = {0.1,0.1,0.1,0.8};
		colortext[] = {0,1,0,0.5};
		font = AAMFS;
		size = "0.03 / (getResolution select 5)";
		h = 0.15;
		w = 0.15;
		text = "";
		class Attributes {
			font = AAMFS;
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
		controls[] = {TPW_HUD_TXT_1,TPW_HUD_TXT_2,TPW_HUD_TXT_3,TPW_HUD_TXT_4,TPW_HUD_TXT_5,TPW_HUD_TXT_6,TPW_HUD_TXT_7,TPW_HUD_TXT_8,TPW_HUD_TXT_9};
		class TPW_HUD_TXT_1 : TPW_HUD_TXT { //ASL
			idc = 100001;
			x = 0; //safezoneW + safezoneX; .38
			y = 0; //safezoneW + safezoneX; //0.4
			h = 0.1;
			w = 0.09;
			text = "";
		};
		class TPW_HUD_TXT_2 : TPW_HUD_TXT { //AZT
			idc = 100002;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.4 * safezoneW + safezoneX;
			h = 0.11;
			w = 0.12;
			text = "";
		};
		class TPW_HUD_TXT_3 : TPW_HUD_TXT { //GRD
			idc = 100003;
			x = 0.58 * safezoneW + safezoneX;
			y = 0.4 * safezoneW + safezoneX;
			h = 0.1;
			w = 0.2;
			text = "";
		};
		class TPW_HUD_TXT_4 : TPW_HUD_TXT { //LMT
			idc = 100004;
			x = 0.38 * safezoneW + safezoneX;
			y = 0.5 * safezoneW + safezoneX;
			text = "";
			h = 0.05;
			w = 0.15;
		};
		class TPW_HUD_TXT_5 : TPW_HUD_TXT { //CTR ===========
			idc = 100005;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.5 * safezoneW + safezoneX;
			text = "";
			colorbackground[] = {0,0,0,0};
		};
		class TPW_HUD_TXT_6 : TPW_HUD_TXT {//TMP==============
			idc = 100006;
			x = 0.58 * safezoneW + safezoneX;
			y = 0.5 * safezoneW + safezoneX;
			text = "";
			colorbackground[] = {0,0,0,0};
		};
		class TPW_HUD_TXT_7 : TPW_HUD_TXT {//HLT
			idc = 100007;
			x = 0.38 * safezoneW + safezoneX;
			y = 0.6 * safezoneW + safezoneX;
			text = "";
			h = 0.3;
			w = 0.11;
		};
		class TPW_HUD_TXT_8 : TPW_HUD_TXT {//RNG===============
			idc = 100008;
			x = 0.48 * safezoneW + safezoneX;
			y = 0.6 * safezoneW + safezoneX;
			text = "";
			colorbackground[] = {0,0,0,0};
		};
		class TPW_HUD_TXT_9 : TPW_HUD_TXT {//VEL================
			idc = 100009;
			x = 0.58 * safezoneW + safezoneX;
			y = 0.6 * safezoneW + safezoneX;
			text = "";
			colorbackground[] = {0,0,0,0};
		};
	};
};
*/


class Extended_PostInit_EventHandlers {
	AAM_CDS_init = "call compile preprocessFileLineNumbers '\AAM_CDS\CDS_ADDON.sqf';";
	//AAM_CDS_Mask = execVM "\AAM_CDS\AAM_CDS_Hud.sqf";
};