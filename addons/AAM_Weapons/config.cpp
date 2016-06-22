#include "basicDefines_A3.hpp"
class CfgPatches {
	class AAM_Weapons {
		units[]={};
		weapons[]={};
		magazines[]={"ADF_30Rnd_556x45_B","ADF_30Rnd_556x45_T"};
		requiredVersion=1.0;
		requiredaddons[] = {"A3_Weapons_F","asdg_jointrails"};
		author = "AAF";
	};
};
class asdg_FrontSideRail;
class UnderBarrelSlot;
class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;
class Muzzleslot;
class WeaponSlotsInfo;
class asdg_OpticRail;
class asdg_OpticRail1913: asdg_OpticRail {
	class compatibleItems {
		AAM_optic_EoMAG=1;
		AAM_optic_TA648RMR=1;
		AAM_optic_TA31=1;
		AAM_optic_ElcanS=1;
		AAM_optic_ElcanC79=1;
	};
};
class CfgWeapons {
	class arifle_TRG21_F;
	class ADF_SteyrF90: arifle_TRG21_F {
		dlc = "AAM";
		scope = 2;
		author = "Gnrnr + Monty";
		displayName = "ADF F90";
		dispersion=0.00001;
		model = "\AAM_Weapons\F90.p3d";
		picture = "AAM_Weapons\inv\gear_F90_x_CA.paa";
		UiPicture = "AAM_Weapons\inv\gear_F90_x_CA.paa";
		hiddenSelections[] = {
			"zml40sight",
			"zml40sightmov",
			"zml40Tube",
			"zml40tubemov"
		};
		hiddenSelectionsTextures[] = {
			"",
			"",
			"",
			""
		};
		initSpeed = 960;
		descriptionShort = "Thales F90 AusSteyr";
		handAnim[] = {"OFP2_ManSkeleton","\A3\Weapons_F_beta\rifles\mk20\data\Anim\mk20.rtm"};
		class Library {
			libtextdesc = "Australian Defense Force F90 5.56mm Steyr Rifle";
		};
		selectionFireAnim = "muzzleFlash";
		dexterity = 1.0;
		maxRecoilSway = 0.0001;
		swayDecaySpeed = 2.00;
		inertia = 0.5;
		class WeaponSlotsInfo {
			mass = 80;
			class MuzzleSlot {
				access = 1;
				compatibleitems[] = {"muzzle_snds_M"};
				displayname = "Muzzle Slot";
				linkproxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				scope = 0;
				iconPosition[] = {0.0, 0.45}; /// position of the slot icon inside of the weapon icon, relative to top-left corner in {right, down} format
				iconScale = 0.2; /// scale of icon described in iconPicture
				iconPicture = "\A3\Weapons_F\Data\UI\attachment_muzzle.paa"; /// icon for selected slot
				iconPinpoint = "Center"; /// top, bottom, left, right, center alignment of the icon on snap point
			};
			class asdg_FrontSideRail_ADF_EF88: asdg_FrontSideRail {
				iconPosition[] = {0.20, 0.45};
				iconScale = 0.5;
			};
			class asdg_OpticRail_ADF_EF88: asdg_OpticRail1913 {
				iconPosition[] = {0.5, 0.35};
				iconScale = 0.2;
			};
		};
		magazines[] = {
			"ADF_30Rnd_556x45_B",
			"ADF_30Rnd_556x45_T"
		};
	};
	class arifle_TRG21_GL_F;
	class EGLM;
	/*class ADF_SteyrF90_GL : arifle_TRG21_GL_F{
		scope = 2;
		author = "Gnrnr + Monty";
		displayName = "ADF F90g";
		dispersion=0.00001;
		model = "\AAM_Weapons\F90.p3d";
		picture = "AAM_Weapons\inv\gear_F90g_x_CA.paa";
		UiPicture = "AAM_Weapons\inv\gear_F90g_x_CA.paa";
		hiddenSelections[] = {"zfgrip"};
		hiddenSelectionsTextures[] = {""};
		initSpeed = 960;
		descriptionShort = "Thales F90g AusSteyr";
		handAnim[] = {"OFP2_ManSkeleton","\A3\Weapons_F_beta\rifles\mk20\data\Anim\mk20G.rtm"};
		class Library {
			libtextdesc = "Australian Defense Force F90 5.56mm Steyr Rifle with ML40 40mm Grenade Launcher";
		};
		//selectionFireAnim = "muzzleFlash";
		dexterity = 1.0;
		maxRecoilSway = 0.0001;
		swayDecaySpeed = 2.00;
		inertia = 0.5;
		//muzzles[] = {"this","EGLM"};
		class WeaponSlotsInfo {
			mass = 80;
			class MuzzleSlot {
				access = 1;
				compatibleitems[] = {"muzzle_snds_M"};
				displayname = "Muzzle Slot";
				linkproxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				scope = 0;
				iconPosition[] = {0.0, 0.45}; /// position of the slot icon inside of the weapon icon, relative to top-left corner in {right, down} format
				iconScale = 0.2; /// scale of icon described in iconPicture
				iconPicture = "\A3\Weapons_F\Data\UI\attachment_muzzle.paa"; /// icon for selected slot
				iconPinpoint = "Center"; /// top, bottom, left, right, center alignment of the icon on snap point
			};
			class asdg_FrontSideRail_ADF_EF88: asdg_FrontSideRail {
				iconPosition[] = {0.20, 0.45};
				iconScale = 0.5;
			};
			class asdg_OpticRail_ADF_EF88: asdg_OpticRail1913 {
				iconPosition[] = {0.5, 0.35};
				iconScale = 0.2;
			};
		};
		magazines[] = {
			"ADF_30Rnd_556x45_B",
			"ADF_30Rnd_556x45_T"
		};
	};
	*/
	class LMG_Mk200_F;
	class ADF_Minimi : LMG_Mk200_F {
		dlc = "AAM";
		author = "Stiltman [STI] + Monty [AAF]";
		scope = 2;
		displayName = "ADF Minimi";
		picture = "\AAM_Weapons\inv\gear_Minimi_x_ca.paa";
		magazines[] = {
			"ADF_200Rnd_556x45",
			"ADF_200Rnd_556x45_Tracer",
			"ADF_100Rnd_556x45",
			"ADF_100Rnd_556x45_Tracer"
		};
		model = "\AAM_Weapons\Minimi.p3d";
		dexterity = 1.21;
		descriptionShort = "Light Machinegun <br />Cartridge: 5.56x45mm NATO<br />Action: Gas-operated, open bolt<br />Rate of fire: 600 rounds/min<br />Muzzle velocity: 915 m/s<br />Effective range: 770 m<br />Feed system: M27 linked belt, STANAG magazine";
		class Library {
			libTextDesc = "The Minimi light machine gun (LMG) is the Australian adaptation of the Belgian FN Minimi, a light machine gun manufactured by the Belgian company FN Herstal (FN).";
		};
		class GunClouds	{
			access = 0;
			cloudletaccy = 0;
			cloudletalpha = 0.3;
			cloudletanimperiod = 1;
			cloudletcolor[] = {1,1,1,0};
			cloudletduration = 0.05;
			cloudletfadein = 0;
			cloudletfadeout = 0.1;
			cloudletgrowup = 0.05;
			cloudletmaxyspeed = 100;
			cloudletminyspeed = -100;
			cloudletshape = "cloudletClouds";
			cloudletsize = 1;
			deltat = 0;
			initt = 0;
			interval = -0.02;
			size = 0.3;
			sourcesize = 0.02;
			timetolive = 0;
			class Table {
				class T0
				{
					color[] = {1,1,1,0};
					maxt = 0;
				};
			};
		};
		class ItemInfo {
			priority = 1;
			RMBhint = "ADF Minimi";
			onHoverText = "TODO Minimi DSS";
		};
		class WeaponSlotsInfo {
			mass = 67;
			allowedSlots[] = {};
			class asdg_OpticRail_Minimi : asdg_OpticRail1913 {
				iconPosition[] = {0.5, 0.35};
				iconScale = 0.2;
			};
			class asdg_FrontSideRail_Minimi : asdg_FrontSideRail {
				iconPosition[] = {0.20, 0.45};
				iconScale = 0.5;
			};
			class MuzzleSlot {
				access = 1;
				compatibleitems[] = {"muzzle_snds_H_MG"};
				displayname = "Muzzle Slot";
				linkproxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				scope = 0;
				iconPosition[] = {0.0, 0.45}; /// position of the slot icon inside of the weapon icon, relative to top-left corner in {right, down} format
				iconScale = 0.2; /// scale of icon described in iconPicture
				iconPicture = "\A3\Weapons_F\Data\UI\attachment_muzzle.paa"; /// icon for selected slot
				iconPinpoint = "Center"; /// top, bottom, left, right, center alignment of the icon on snap point
			};
			class UnderBarrelSlot: UnderBarrelSlot {
				iconPosition[] = {0.2, 0.7};
				iconScale = 0.2;
				compatibleItems[] = {"bipod_01_F_blk"};
			};
		};
		class GunParticles {
			class FirstEffect
			{
				directionname = "Konec hlavne";
				effectname = "MachineGunCloud";
				positionname = "Usti hlavne";
			};
		};
		drySound[] = {"A3\sounds_f\weapons\Other\dry_1", 0.446684, 1, 10};
		reloadMagazineSound[] = {"A3\Sounds_F\weapons\Zafir\zafir_reload_3", 1.0, 1, 10};
	};
	class ADF_Maximi: LMG_Mk200_F {
		dlc = "AAM";
		author = "Stiltman [STI] + Monty [AAF]";
		htMin = 1;
		htMax = 600;
		afMax = 0;
		mfMax = 0;
		mFact = 1;
		tBody = 100;
		displayName = "ADF Maximi";
		picture = "\AAM_Weapons\inv\gear_maximi_x_ca.paa";
		model = "\AAM_Weapons\Maximi.p3d";
		magazines[] = {
			"ADF_100Rnd_762x51",
			"ADF_100Rnd_762x51_Tracer"
		};
		dexterity = 0.67;
		descriptionShort = "Light Weight Machine Gun<br />Cartridge: 7.62x51mm NATO<br />Action: Gas-operated, open bolt<br />Rate of fire: 710 rounds/min<br />Muzzle velocity: 853 m/s<br />Effective range: 800 m<br />Feed system: Disintegrating belt (M13 link)";
		class Library {
			libtextdesc = "This is a 7.62?51mm NATO version of the Mk 46, used by SOTG when a heavier cartridge is required. It is officially classified as an LWMG (Light Weight Machine Gun) and was developed as a replacement for the Mk 43 Mod 0/1.";
		};
		class GunClouds	{
			access = 0;
			cloudletaccy = 0;
			cloudletalpha = 0.3;
			cloudletanimperiod = 1;
			cloudletcolor[] = {1,1,1,0};
			cloudletduration = 0.05;
			cloudletfadein = 0;
			cloudletfadeout = 0.1;
			cloudletgrowup = 0.05;
			cloudletmaxyspeed = 100;
			cloudletminyspeed = -100;
			cloudletshape = "cloudletClouds";
			cloudletsize = 1;
			deltat = 0;
			initt = 0;
			interval = -0.02;
			size = 0.3;
			sourcesize = 0.02;
			timetolive = 0;
			class Table
			{
				class T0
				{
					color[] = {1,1,1,0};
					maxt = 0;
				};
			};
		};
		class WeaponSlotsInfo {
			mass = 82;
			allowedSlots[] = {};
			class asdg_OpticRail_Maximi : asdg_OpticRail1913 {
				iconPosition[] = {0.5, 0.35};
				iconScale = 0.2;
			};
			class asdg_FrontSideRail_Maximi : asdg_FrontSideRail {
				iconPosition[] = {0.20, 0.45};
				iconScale = 0.5;
			};
			class MuzzleSlot {
				access = 1;
				compatibleitems[] = {"muzzle_snds_H_MG"};
				displayname = "Muzzle Slot";
				linkproxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				scope = 0;
				iconPosition[] = {0.0, 0.45};
				iconScale = 0.2;
			};
			class UnderBarrelSlot: UnderBarrelSlot
			{
				iconPosition[] = {0.2, 0.7};
				iconScale = 0.2;
				compatibleItems[] = {"bipod_01_F_blk"};
			};
		};
		class GunParticles {
			class FirstEffect
			{
				directionname = "Konec hlavne";
				effectname = "MachineGunCloud";
				positionname = "Usti hlavne";
			};
		};
	};
	class LMG_Zafir_F;
	class ADF_MAG58: LMG_Zafir_F {
		dlc = "AAM";
		author = "Stiltman [STI] + Monty [AAF]";
		htMin = 1;
		htMax = 600;
		afMax = 0;
		mfMax = 0;
		mFact = 1;
		tBody = 100;
		displayName = "ADF MAG58";
		picture = "\AAM_Weapons\inv\gear_mag58_x_ca.paa";
		model = "\AAM_Weapons\MAG58.p3d";
		handanim[] = {};
		magazines[] = {
			"ADF_100Rnd_762x51",
			"ADF_100Rnd_762x51_Tracer"
		};
		dexterity = 0.67;
		descriptionShort = "Machine Gun<br />Cartridge: 7.62x51mm NATO<br />Action: Gas-operated, open bolt<br />Rate of fire: 750-950 rounds/min<br />Muzzle velocity: 853 m/s<br />Effective range: 800 m<br />Feed system: Disintegrating belt (M13 link)";
		class Library {
			libtextdesc = "The MAG58, officially Machine Gun, 7.62mm, MAG58, is the Australian designation for the FN MAG (Mitrailleuse d'Appui G?n?ral, meaning General Purpose Machine Gun), a family of belt-fed, gas-operated medium machine guns firing the 7.62?51mm NATO cartridge.";
		};
		class GunClouds	{
			access = 0;
			cloudletaccy = 0;
			cloudletalpha = 0.3;
			cloudletanimperiod = 1;
			cloudletcolor[] = {1,1,1,0};
			cloudletduration = 0.05;
			cloudletfadein = 0;
			cloudletfadeout = 0.1;
			cloudletgrowup = 0.05;
			cloudletmaxyspeed = 100;
			cloudletminyspeed = -100;
			cloudletshape = "cloudletClouds";
			cloudletsize = 1;
			deltat = 0;
			initt = 0;
			interval = -0.02;
			size = 0.3;
			sourcesize = 0.02;
			timetolive = 0;
			class Table
			{
				class T0
				{
					color[] = {1,1,1,0};
					maxt = 0;
				};
			};
		};
		class WeaponSlotsInfo {
			mass = 109;
			allowedSlots[] = {};
			class asdg_OpticRail_Mag58 : asdg_OpticRail1913 {
				iconPosition[] = {0.5, 0.35};
				iconScale = 0.2;
			};
			class UnderBarrelSlot: UnderBarrelSlot {
				iconPosition[] = {0.2, 0.7};
				iconScale = 0.2;
				compatibleItems[] = {"bipod_01_F_blk"};
			};
		};
		class GunParticles {
			class FirstEffect
			{
				directionname = "Konec hlavne";
				effectname = "MachineGunCloud";
				positionname = "Usti hlavne";
			};
		};
	};
	//class srifle_EBR_F; // MK18 Vanilla rifle
	class srifle_DMR_03_F; // marksman NATO rifle
	class AAM_HK417: srifle_DMR_03_F {
		dlc = "AAM";
		author = "AAM";
		_generalMacro = "AAM_HK417";
		scope = 2;
		displayname = "Heckler & Koch 417";
		descriptionShort = "Heckler & Kock 417 7.62mm Marksman Rifle";
		class Library {
			libtextdesc = "The HK417 has been perfectly streamlined to maximise the ballistics of 7.62 mm x 51 NATO rounds as well as target immobilisation beyond a combat distance of 200 metres.";
		};
		selectionFireAnim = "muzzleFlash";
		htMin = 1;
		htMax = 600;
		afMax = 0;
		mfMax = 0;
		mFact = 1;
		tBody = 100;
		model = "\AAM_Weapons\hk_417.p3d";
		//picture = "AAM_Weapons\inv\gear_F90_x_CA.paa";
		//UiPicture = "AAM_Weapons\inv\gear_F90_x_CA.paa";
		class WeaponSlotsInfo {
			mass = 100;
			allowedSlots[] = {};
			class asdg_OpticRail_HK417 : asdg_OpticRail1913 {
				iconPosition[] = {0.5, 0.35};
				iconScale = 0.2;
			};
			class asdg_FrontSideRail_ADF_HK417: asdg_FrontSideRail {
				iconPosition[] = {0.20, 0.45};
				iconScale = 0.5;
			};
			class UnderBarrelSlot: UnderBarrelSlot {
				iconPosition[] = {0.2, 0.7};
				iconScale = 0.2;
				compatibleItems[] = {"bipod_01_F_blk"};
			};
		};
	};
	class ItemCore;
	class InventoryItem_Base_F;
	class InventoryOpticsItem_Base_F;
	class AAM_optic_EoMAG: ItemCore { //Normal, x3 Mag
		dlc = "AAM";
		author = "AAM";
		_generalMacro = "AAM_optic_EoMAG";
		scope = 2;
		displayName = "Eotech 522 + G33 Magnifier";
		//picture = "\A3\weapons_F\Data\UI\gear_acco_hamr_CA.paa";
		model = "\AAM_Weapons\AAM_acco_EoMag";
		descriptionShort = "Eotech 552 Holigraphic + G33 3x Magnifier";
		weaponInfoType = "RscWeaponZeroing";
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			mass = 8;
			opticType = 1;
			optics = 1;
			modelOptics = "\AAM_Weapons\AAM_Optic_EoMag.p3d";
			class OpticsModes
			{
				class EomagCollimator //3mm inside Left outer circle
				{
					opticsID = 1;
					useModelOptics = 0;
					opticsPPEffects[] = {""};
					opticsFlare = 0;
					opticsDisablePeripherialVision = 0;
					opticsZoomMin = 0.25;
					opticsZoomMax = 1.25;
					opticsZoomInit = 0.75;
					memoryPointCamera = "eye";
					visionMode[] = {};
					distanceZoomMin = 200;
					distanceZoomMax = 200;
				};
				class EomagScope
				{
					opticsID = 2;
					useModelOptics = 1;
					opticsPPEffects[] = {"OpticsCHAbera5","OpticsBlur5"};
					opticsFlare = 0; //1
					opticsDisablePeripherialVision = 1;
					opticsZoomMin = 0.083; //.125 //.249/3=.083
					opticsZoomMax = 0.083;
					opticsZoomInit = 0.083;
					memoryPointCamera = "opticView";
					visionMode[] = {};
					distanceZoomMin = 300;
					distanceZoomMax = 300;
				};
			};
		};
		inertia = 0.1;
	};
	class AAM_optic_TA648RMR: ItemCore { //Holo, x6 Mag ?
		dlc = "AAM";
		author = "AAM";
		_generalMacro = "AAM_optic_TA648RMR";
		scope = 2;
		displayName = "TA648 ACOG + RMR";
		//picture = "\A3\weapons_F\Data\UI\gear_acco_hamr_CA.paa";
		model = "\AAM_Weapons\AAM_acco_TA648RMR";
		descriptionShort = "Trijicon TA648 RMR Advanced Combat Optical Gunsight";
		weaponInfoType = "RscWeaponZeroing";
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			mass = 8;
			opticType = 1;
			optics = 1;
			modelOptics = "\AAM_Weapons\AAM_optic_TA648.p3d";
			class OpticsModes
			{
				class AAMTA648RMR // 4mm Low
				{
					opticsID = 1;
					useModelOptics = 0;
					opticsPPEffects[] = {""};
					opticsFlare = 0;
					opticsDisablePeripherialVision = 0;
					opticsZoomMin = 0.25;
					opticsZoomMax = 1.25;
					opticsZoomInit = 0.75;
					memoryPointCamera = "eye";
					visionMode[] = {};
					distanceZoomMin = 200;
					distanceZoomMax = 200;
				};
				class AAMTA648Scope
				{
					opticsID = 2;
					useModelOptics = 1;
					opticsPPEffects[] = {"OpticsCHAbera5","OpticsBlur5"};
					opticsFlare = 0; //1
					opticsDisablePeripherialVision = 1;
					opticsZoomMin = 0.0415; //.249 / 6 = .0415
					opticsZoomMax = 0.0415;
					opticsZoomInit = 0.0415;
					memoryPointCamera = "opticView";
					visionMode[] = {};
					distanceZoomMin = 300;
					distanceZoomMax = 300;
				};
			};
		};
		inertia = 0.1;
	};
	class AAM_optic_TA31: ItemCore { //Holo, x4 Mag ?
		dlc = "AAM";
		author = "AAM";
		_generalMacro = "AAM_optic_TA31";
		scope = 2;
		displayName = "TA31 ACOG";
		//picture = "\A3\weapons_F\Data\UI\gear_acco_hamr_CA.paa";
		model = "\AAM_Weapons\AAM_acco_TA31";
		descriptionShort = "Trijicon TA31 RMR Advanced Combat Optical Gunsight";
		weaponInfoType = "RscWeaponZeroing";
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			mass = 8;
			opticType = 1;
			optics = 1;
			modelOptics = "\AAM_Weapons\AAM_optic_TA31.p3d";
			class OpticsModes
			{
				class AAMTA31iron
				{
					opticsID = 1;
					useModelOptics = 0;
					opticsPPEffects[] = {""};
					opticsFlare = 0;
					opticsDisablePeripherialVision = 0;
					opticsZoomMin = 0.25;
					opticsZoomMax = 1.25;
					opticsZoomInit = 0.75;
					memoryPointCamera = "eye";
					visionMode[] = {};
					distanceZoomMin = 200;
					distanceZoomMax = 200;
				};
				class AAMTA31Scope
				{
					opticsID = 2;
					useModelOptics = 1;
					opticsPPEffects[] = {"OpticsCHAbera5","OpticsBlur5"};
					opticsFlare = 0; //1
					opticsDisablePeripherialVision = 1;
					opticsZoomMin = 0.06225; //.249 / 4 = 0.06225
					opticsZoomMax = 0.06225;
					opticsZoomInit = 0.06225;
					memoryPointCamera = "opticView";
					visionMode[] = {};
					distanceZoomMin = 300;
					distanceZoomMax = 300;
				};
			};
		};
		inertia = 0.1;
	};
	class AAM_optic_ElcanS: ItemCore { //Normal, x4 Mag ?
		dlc = "AAM";
		author = "AAM";
		_generalMacro = "AAM_optic_ElcanS";
		scope = 2;
		displayName = "Elcan Spectre";
		//picture = "\A3\weapons_F\Data\UI\gear_acco_hamr_CA.paa";
		model = "\AAM_Weapons\AAM_acco_ElcanS";
		descriptionShort = "Elcan Spectre x4 rifle and machinegun magnified scope";
		weaponInfoType = "RscWeaponZeroing";
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			mass = 8;
			opticType = 1;
			optics = 1;
			modelOptics = "\AAM_Weapons\AAM_optic_ElcanS.p3d";
			class OpticsModes
			{
				class AAMElcanIron //RE-DO, lower
				{
					opticsID = 1;
					useModelOptics = 0;
					opticsPPEffects[] = {""};
					opticsFlare = 0;
					opticsDisablePeripherialVision = 0;
					opticsZoomMin = 0.25;
					opticsZoomMax = 1.25;
					opticsZoomInit = 0.75;
					memoryPointCamera = "eye";
					visionMode[] = {};
					distanceZoomMin = 200;
					distanceZoomMax = 200;
				};
				class AAMElcanScope
				{
					opticsID = 2;
					useModelOptics = 1;
					opticsPPEffects[] = {"OpticsCHAbera5","OpticsBlur5"};
					opticsFlare = 0; //1
					opticsDisablePeripherialVision = 1;
					opticsZoomMin = 0.073; //.249 / 3.4 = .073
					opticsZoomMax = 0.073;
					opticsZoomInit = 0.073;
					memoryPointCamera = "opticView";
					visionMode[] = {};
					distanceZoomMin = 300;
					distanceZoomMax = 300;
				};
			};
		};
		inertia = 0.1;
	};
	class AAM_optic_ElcanC79: ItemCore { //Normal, x3.4 Mag
		dlc = "AAM";
		author = "AAM";
		_generalMacro = "AAM_optic_ElcanC79";
		scope = 2;
		displayName = "Elcan C79 Wildcat";
		//picture = "\A3\weapons_F\Data\UI\gear_acco_hamr_CA.paa";
		model = "\AAM_Weapons\AAM_acco_ElcanC79";
		descriptionShort = "Elcan Spectre x4 rifle and machinegun magnified scope";
		weaponInfoType = "RscWeaponZeroing";
		class ItemInfo: InventoryOpticsItem_Base_F
		{
			mass = 8;
			opticType = 1;
			optics = 1;
			modelOptics = "\AAM_Weapons\AAM_optic_ElcanC79.p3d";
			class OpticsModes
			{
				class AAMElcanIron
				{
					opticsID = 1;
					useModelOptics = 0;
					opticsPPEffects[] = {""};
					opticsFlare = 0;
					opticsDisablePeripherialVision = 0;
					opticsZoomMin = 0.25;
					opticsZoomMax = 1.25;
					opticsZoomInit = 0.75;
					memoryPointCamera = "eye";
					visionMode[] = {};
					distanceZoomMin = 200;
					distanceZoomMax = 200;
				};
				class AAMElcanScope
				{
					opticsID = 2;
					useModelOptics = 1;
					opticsPPEffects[] = {"OpticsCHAbera5","OpticsBlur5"};
					opticsFlare = 0; //1
					opticsDisablePeripherialVision = 1;
					opticsZoomMin = 0.073; //.249 / 3.4 = .073
					opticsZoomMax = 0.073;
					opticsZoomInit = 0.073;
					memoryPointCamera = "opticView";
					visionMode[] = {};
					distanceZoomMin = 300;
					distanceZoomMax = 300;
				};
			};
		};
	};
};
class CfgAmmo {
	class BulletBase;
	class AAF_ADF_556x45_Ball: BulletBase {
		hit = 16; //8
		indirecthit = 0;
		indirecthitrange = 0;
		cartridge = "FxCartridge_762";
		visibleFire = 4;
		audibleFire = 6;
		cost = 1;
		airLock = 1;
		typicalspeed = 960;
		caliber = 1.6; //0.7  5.56 didnt seem to work ? 1.6 is 7.62 value ?
		model = "\A3\Weapons_f\Data\bullettracer\tracer_white";
		tracerscale = 1;
		tracerstarttime = 0.05;
		tracerendtime = 5;
		airfriction = -0.00001;
		class CamShakeExplode {
			power = "(8^0.5)";
			duration = "((round (8^0.5))*0.2 max 0.2)";
			frequency = 20;
			distance = "((8^0.5)*3)";
		};
		class CamShakeHit {
			power = 5;
			duration = "((round (5^0.25))*0.2 max 0.2)";
			frequency = 20;
			distance = 1;
		};
	};
	class ADF_762_Ball: BulletBase	{
		hit = 16;
		indirectHit = 0;
		indirectHitRange = 0;
		cartridge = "FxCartridge_762";
		visibleFire = 6;
		audibleFire = 9;
		cost = 1.6;
		airLock = true;
		typicalSpeed = 957;
		caliber = 1.6; /// caliber 1 equals 6.5mm round
		model = "\A3\Weapons_f\Data\bullettracer\tracer_red";
		tracerScale = 1.0;
		tracerStartTime = 0.05;
		tracerEndTime = 1;
		airFriction = -0.00096;
		dangerRadiusBulletClose = 8;	/// defines how far the AI gets alerted by the projectile's impact or explosion. Default value -1 makes this distance be automatically derived from the hit and indirectHit properties.
		dangerRadiusHit = 12;	/// defines how far the AI gets alerted by the bullet's pass. Default value -1 disables the detection. (works only for bullets, no other projectiles)
		suppressionRadiusBulletClose= 6;	/// defines the max. distance at which the AI becomes suppressed by the projectile's impact or explosion. Default value -1 disables the suppressive effect
		suppressionRadiusHit = 8;	/// defines the max. distance at which the AI becomes suppressed by the bullet's pass. Default value -1 disables the suppressive effect (works only for bullets, no other projectiles)
		shootDistraction = 10;	/// -1 by default to be computed from visibleFire and audibleFire, describes how much does the shoot distract the shooter
		class CamShakeFire {
			power = 0;
			duration = 0;
			frequency = 0;
			distance = 0;
		};
		class CamShakePlayerFire {
			power = 0;
			duration = 0;
			frequency = 0;
			distance = 0;
		};
	};
	class Rocketbase;
	class R_66mmM72: RocketBase {
		model = "\A3\weapons_f\launchers\RPG32\pg32v_rocket.p3d";
		hit = 600;
		indirectHit = 16;
		indirectHitRange = 4;
		explosive = 0.8;
		cost = 500;
		airFriction = 0.075;
		sideAirFriction = 0.075;
		maxSpeed = 140;
		initTime = 0;
		thrustTime = 0.1;
		thrust = 0.1;
		fuseDistance = 15;
		CraterEffects = "ATMissileCrater";
		explosionEffects = "ATMissileExplosion";
		effectsMissileInit = "";
		effectsMissile = "EmptyEffect";
		simulationStep = 0.02;
		airLock = 0;
		aiAmmoUsageFlags = 128;
		irLock = 0;
		timeToLive = 10;
		maneuvrability = 0;
		allowAgainstInfantry = 0;
		soundHit[] = {"A3\Sounds_F\arsenal\weapons\Launchers\RPG32\RPG32_Hit",3.1622777,1,1800};
		class CamShakeExplode {
			power = "(55*0.2)";
			duration = "((round (55^0.5))*0.2 max 0.2)";
			frequency = 20;
			distance = "((5 + 55^0.5)*8)";
		};
		class CamShakeHit {
			power = 110;
			duration = "((round (110^0.25))*0.2 max 0.2)";
			frequency = 20;
			distance = 1;
		};
		class CamShakeFire {
			power = "(20^0.25)";
			duration = "((round (20^0.5))*0.2 max 0.2)";
			frequency = 20;
			distance = "((20^0.5)*8)";
		};
		class CamShakePlayerFire {
			power = 1;
			duration = 0.1;
			frequency = 20;
			distance = 1;
		};
	};
	//.50 High pen, High damage, Cam shake, Suppression like bullshit
};
class CfgMagazines {
	class CA_Magazine;
	class 30rnd_556x45_Stanag;
	class 30Rnd_556x45_Stanag_Tracer_Red;
	class ADF_30Rnd_556x45_B: 30rnd_556x45_Stanag {
		dlc = "AAM";
		author = "AAF";
		ammo = "AAF_ADF_556x45_Ball";
		count = 30;
		initSpeed = 960;
		descriptionshort = "Caliber: 5.56x45mm B9 <br />Rounds: 30<br />Used in: F88, F88SA2, F90 AUSSteyr";
		displayname = "5.56mm 30rnd Steyr Mag";
		lastroundstracer = 4;
		picture = "\AAM_Weapons\inv\m_30rnd_F90ball_ca.paa";
		scope = 2;
		mass = 2;
		tracersevery = 0;
	};
	class ADF_30Rnd_556x45_T : 30Rnd_556x45_Stanag_Tracer_Red {
		dlc = "AAM";
		scope = 1;
		author = "AAF";
		ammo = "B_556x45_Ball_Tracer_Green";
		count = 30;
		initSpeed = 960;
		mass = 2;
		descriptionshort = "Caliber: 5.56x45mm B9 Tracers - Red<br />Rounds: 30<br />Used in: F88, F88SA2, F90 AUSSteyr";
		displayname = "5.56mm 30rnd Tracer (Red) Mag";
		displaynameshort = "Tracer";
		picture = "\AAM_Weapons\inv\m_30rnd_F90Trace_ca.paa";
	};
	class ADF_200Rnd_556x45 : 30Rnd_556x45_Stanag {
		dlc = "AAM";
		ammo = "B_556x45_Ball_Tracer_Red";
		count = 200;
		displayName = "ADF 5.56mm 200Rnd Box";
		descriptionShort = "Caliber: 5.56x45 mm F1A1<br />Rounds: 200<br />Used in: Minimi";
		modelSpecial = "";
		picture = "\AAM_Weapons\inv\m_200rnd_556x45_ca.paa";
		initSpeed = 960;
		mass = 30;
		maxLeadSpeed = 30;
		maxThrowHoldTime = 2;
		maxThrowIntensityCoef = 1.4;
		minThrowIntensityCoef = 0.3;
		nameSound = "magazine";
		quickReload = 0;
		reloadAction = "";
		selectionFireAnim = "zasleh";
		simulation = "ProxyMagazines";
		tracersEvery = 4;
		lastRoundsTracer = 0;
		type = 256;
		scope = 2;
		useAction = 0;
		useActionTitle = "";
		value = 1;
		weaponpoolavailable = 1;
		weight = 0;
		allowedSlots[] = {"701","901"};
		class Library {
			libTextDesc = "5.56mm Minimi collapsable box magazine";
		};
	};
	class ADF_200Rnd_556x45_Tracer : ADF_200Rnd_556x45 {
		dlc = "AAM";
		displayName = "ADF 5.56mm 200Rnd Box Tracer";
		tracersEvery = 1;
		picture = "\AAM_Weapons\inv\m_200rnd_556x45_t_ca.paa";
	};
	class ADF_100Rnd_556x45 : ADF_200Rnd_556x45 {
		count = 100;
		displayName = "ADF 5.56mm 100Rnd Box";
		descriptionShort = "Caliber: 5.56x45 mm F1A1<br />Rounds: 100<br/>Used in: Minimi";
		picture = "\AAM_Weapons\inv\m_100rnd_556x45_ca.paa";
		mass = 15;
	};
	class ADF_100Rnd_556x45_Tracer : ADF_100Rnd_556x45 {
		displayName = "ADF 5.56mm 100Rnd Box Tracer";
		tracersEvery = 1;
		picture = "\AAM_Weapons\inv\m_100rnd_556x45_t_ca.paa";
	};
	class ADF_100Rnd_762x51: CA_Magazine {
        ammo = "B_762x51_Tracer_Red";
        count = 100;
        descriptionshort = "Caliber: 7.62x51mm F4<br/>Rounds: 100<br/>Used in: MAG58, Maximi";
        displayname = "ADF 7.62mm 100Rnd Box";
        initspeed = 900;
        mass = 22;
        lastroundstracer = 4;
		namesound = "mgun";
		picture = "\AAM_Weapons\inv\m_100rnd_762x51_ca.paa";
        scope = 2;
		tracersevery = 4;
		type = "2* 256";
		allowedSlots[] = {"701","901"};
    };
	class ADF_100Rnd_762x51_Tracer: ADF_100Rnd_762x51 {
        displayname = "ADF 7.62mm 100Rnd Box Tracer";
		tracersEvery = 1;
		picture = "\AAM_Weapons\inv\m_100rnd_762x51_t_ca.paa";
    };
    class ADF_20Rnd_762_Mag: CA_Magazine {
		author = "AAF";
		ammo = "ADF_762_Ball";
		count = 20;
		initSpeed = 957; /// standard muzzle speed
		descriptionShort = "ADF Match-grade round specifically designed for long-range marksmanship.";
		displayName = "20 Rnd 7.62mm HK417 Mag";
		lastroundstracer = 0;
		picture = "\A3\Weapons_F\inv\m_20rnd_hk417_ca.paa";
		scope = 2;
		mass = 2;
		tracersevery = 0;
	};
	//.50 600rnd+400mag = 1kg so mass 26, 5 rounds,
};


/*
class AAM_M72: Launcher
	{
		scope = 2;
		displayName="M-72 LAW";
		model = "\ca\weapons\m136_launcher"; //collapsed M72
		// modelSpecial=[.p3d]"" 			// extended M72
		handAnim[]={"OFP2_ManSkeleton","\Ca\weapons\Data\Anim\m136.rtm"};
		modelOptics = "-";
		magazines[]={AAM_M72};
		sound[]={"\Ca\sounds\Weapons\rockets\Javelin_fire_v3_A",db20,1,1400};
		drySound[]={"\Ca\sounds\Weapons\rockets\dry",db-80,1,10};
		reloadMagazineSound[]={"\Ca\sounds\Weapons\rockets\flare_reload",db-70,1,20};
		soundFly[]={"\Ca\sounds\Weapons\rockets\rocket_fly1",db40,1.5,700};
		picture="\CA\weapons\data\equip\W_m136_launcher_CA.paa";
		UiPicture="\CA\weapons\data\Ico\i_at_CA.paa";
		recoil=launcherBase;

		minRange = 10;
		midRange = 200;
		maxRange = 300;

		aiRateOfFire=10.0;
		aiRateOfFireDistance=250;

		class Library {libTextDesc = "M72A6 66mm Light Anti Tank Unguided Rocket Launcher";};
		descriptionShort = "M72A6 LAW";
	};

class AAM_M136: CA_LauncherMagazine
	{
		scope = public;
		displayName = $STR_MN_M136;
		ammo= R_M136_AT;
		type = 6 * WeaponSlotItem; //workaround for single shot weapon
		picture="\CA\weapons\data\equip\m_M136_ca.paa";
		modelSpecial = "\ca\weapons\m136_launcher_loaded";
		model = "\ca\weapons\M136_ammo";
		initSpeed = 285;
		descriptionShort = $STR_DSS_1Rnd_M136;
	};