
class CfgPatches {
	class AAM_Armour {
		units[] = {"AAAM_ASLAV25"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"aam_weapons","aam_base","aam_units"};
		magazines[] = {};
		ammo[] = {};
	};
};
class CfgMovesBasic {
	class DefaultDie;
	class ManActions {
		LAV25_Driver = "LAV25_Driver";
		LAV25_Gunner = "LAV25_Gunner";
		LAV25_Commander = "LAV25_Commander_out";
		LAV25_Driver_out = "LAV25_Driver_out";
		LAV25_Gunner_out = "LAV25_Gunner_out";
		LAV25_Commander_out = "LAV25_Commander_out";
		LAV25_Commander_out_mg = "LAV25_Commander_out_mg";
		LAV25_Gunner2 = "LAV25_Gunner2";
	};
};
class CfgMovesMaleSdr: CfgMovesBasic {
	class States {
		class Crew;
		class KIA_LAV25_Driver: DefaultDie {
			actions = "DeadActions";
			file = "\AAM_Armour\data\anim\kia_lav25_driver.rtm";
			speed = 0.5;
			looped = 0;
			terminal = 1;
			soundEnabled = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class LAV25_Driver: Crew {
			file = "\AAM_Armour\Data\Anim\lav25_driver.rtm";
			interpolateTo[] = {"KIA_LAV25_Driver",1};
		};
		class LAV25_Driver_out: Crew {
			file = "\AAM_Armour\Data\Anim\lav25_driver_turnout.rtm";
			interpolateTo[] = {"KIA_LAV25_Driver",1};
		};
		class KIA_LAV25_Gunner: DefaultDie {
			actions = "DeadActions";
			file = "\AAM_Armour\DATA\anim\kia_lav25_Gunner.rtm";
			speed = 0.5;
			looped = 0;
			terminal = 1;
			soundEnabled = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class LAV25_Gunner: Crew {
			file = "\AAM_Armour\Data\Anim\lav25_Gunner.rtm";
			interpolateTo[] = {"KIA_LAV25_Gunner",1};
		};
		class LAV25_Gunner_out: Crew {
			file = "\AAM_Armour\Data\Anim\lav25_gunner_turnout.rtm";
			interpolateTo[] = {"KIA_LAV25_Gunner",1};
		};
		class KIA_LAV25_Gunner2: KIA_LAV25_Gunner {
			file = "\AAM_Armour\Data\Anim\KIA_Abrams_CommanderOut.rtm";
		};
		class LAV25_Gunner2: Crew {
			file = "\AAM_Armour\Data\Anim\Abrams_CommanderOut.rtm";
			interpolateTo[] = {"KIA_LAV25_Gunner2",1};
		};
		class KIA_LAV25_commander: DefaultDie {
			actions = "DeadActions";
			file = "\AAM_Armour\DATA\anim\kia_lav25_commander.rtm";
			speed = 0.5;
			looped = 0;
			terminal = 1;
			soundEnabled = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class LAV25_commander: Crew {
			file = "\AAM_Armour\Data\Anim\lav25_commander.rtm";
			interpolateTo[] = {"KIA_LAV25_commander",1};
		};
		class LAV25_commander_out: Crew {
			file = "\AAM_Armour\Data\Anim\lav25_commander_turnout.rtm";
			interpolateTo[] = {"KIA_LAV25_commander",1};
		};
		class LAV25_commander_out_mg: Crew {
			file = "\AAM_Armour\Data\Anim\lav25_commander_turnout_mg.rtm";
			interpolateTo[] = {"KIA_LAV25_commander",1};
		};
	};
};
class CfgAmmo {
	class B_30mm_HE_Tracer_red;
		//class B_30mm_HE_Tracer_Red: B_30mm_HE
		//{
		//	model = "\A3\Weapons_f\Data\bullettracer\tracer_red";
		//};
	class AAM_25mm_HEI_T: B_30mm_HE_Tracer_red {
		explosive = 0.75;
		hit = 50;
		indirectHit = 12;
		indirectHitRange = 1.5;
	};
	class B_30mm_APFSDS_Tracer_Red;
		//class B_30mm_APFSDS_Tracer_Red: B_30mm_APFSDS
		//{
			//model = "\A3\Weapons_f\Data\bullettracer\tracer_red";
		//};
	class AAM_25mm_APFSDS_T: B_30mm_APFSDS_Tracer_Red {
		hit = 125;
		indirectHit = 0;
		indirectHitRange = 0;
		explosive = 0;
		caliber = 12;
	};
};
class CfgMagazines {
	class 200rnd_762x51_Belt_Red;
	class AAM_200rnd_762x51_Belt_M240: 200rnd_762x51_Belt_Red {
		scope = 2;
		displayName = "M240 200Rnd Belt";
	};
	class 2000rnd_762x51_Belt_Red;
	class AAM_2000rnd_762x51_Belt_M240: 2000rnd_762x51_Belt_Red {
		scope = 2;
		displayName = "M240 2000Rnd Belt";
	};
	class 250Rnd_30mm_HE_shells;
	class AAM_210Rnd_25mm_HEI_T: 250Rnd_30mm_HE_shells {
		scope = 2;
		ammo = "AAM_25mm_HEI_T";
		initSpeed = 1100;
		count = 210;
		displayName = "HEI-T";
		displayNameShort = "HEI-T";
		tracersEvery = 1;
	};
	class 250Rnd_30mm_APDS_shells;
	class AAM_210Rnd_25mm_APFSDS_T: 250Rnd_30mm_APDS_shells {
		count = 210;
		initSpeed = 1100;
		ammo = "AAM_25mm_APFSDS_T";
		displayName = "APFSDS-T";
		displayNameShort = "APFSDS-T";
		tracersEvery = 1;
	};
};
class Mode_SemiAuto;
class Mode_FullAuto;
class CfgWeapons {
	class LMG_Coax;
	class AAM_M240_Coax: LMG_Coax {
		displayName = "M240 7.62 Coax";
		magazines[] = {"AAM_200rnd_762x51_Belt_M240","AAM_2000rnd_762x51_Belt_M240"};
		class GunParticles {
			class Effect {
				effectName = "MachineGun1";
				positionName = "Konec hlavne2";
				directionName = "Usti hlavne2";
			};
		};
	};
	class AAM_M240_Pintle: AAM_M240_Coax {
		autoReload = 0;
		displayName = "M240 7.62 Pintle Mount";
		class GunParticles {
			class Effect {
				effectName = "MachineGun1";
				positionName = "Usti hlavne";
				directionName = "Usti hlavne";
			};
		};
	};
	class AAM_M240_Pintle_2: AAM_M240_Coax {
		autoReload = 0;
		displayName = "M240 7.62 Pintle Mount";
		class GunParticles {
			class Effect {
				effectName = "MachineGun1";
				positionName = "Usti hlavne3";
				directionName = "Usti hlavne3";
			};
		};
		muzzlePos = "usti hlavne3";
		muzzleEnd = "konec hlavne3";
	};
	class autocannon_30mm_CTWS;
	class autocannon_40mm_CTWS;
	class AAM_M242_25mm_autocannon_base: autocannon_30mm_CTWS {
		displayName = "M242 Bushmaster";
		aidispersioncoefx = "3*2";
		aidispersioncoefy = "3*2";
		airateoffire = 1;
		airateoffiredistance = 1000;
		scope = 1;
		nameSound = "cannon";
		sound[] = {"A3\sounds_f\dummysound",2.5118864,1,1800}; //?
		soundContinuous = 0; //?
		burst = 5;
		reloadTime = 0.02;
		autoFire = 1;
		canLock = 0;
		magazines[] = {"AAM_210Rnd_25mm_HEI_T","AAM_210Rnd_25mm_APFSDS_T"};
		modes[] = {"Single", "LowROF", "HighROF"};
		magazineReloadTime = 0.12;
		cursor = "EmptyCursor";
		cursorAim = "mg";
		cursorSize = 1;
		ballisticsComputer = 3;
		shotFromTurret = 1;
		showAimCursorInternal = 0;
		class GunParticles {
			class Effect {
				effectName = "AutoCannonFired";
				positionName = "chamber_1";//"Usti hlavne";
				directionName = "muzzle_1"; //"Konec hlavne";
			};
			class Shell {
				positionName = "shell_eject_pos";
				directionName = "shell_eject_dir";
				effectName = "HeavyGunCartridge1";
			};
		};
		class Single : Mode_SemiAuto {
			displayName = "M242 Bushmaster Semi-auto";
			displayNameShort = "M242 Semi-auto";
			reloadTime = 0.5;
			sounds[] = {"StandardSound"};
			class StandardSound {
				begin1[] = {"A3\Sounds_F\arsenal\weapons_vehicles\cannon_30mm\autocannon_30mm_01",1.9952624,1,1500};
				begin2[] = {"A3\Sounds_F\arsenal\weapons_vehicles\cannon_30mm\autocannon_30mm_02",1.9952624,1,1500};
				begin3[] = {"A3\Sounds_F\arsenal\weapons_vehicles\cannon_30mm\autocannon_30mm_03",1.9952624,1,1500};
				soundBegin[] = {"begin1",0.33,"begin2",0.33,"begin3",0.34};
			};
			soundContinuous = 0;
			//flash = "gunfire";
			flashSize = 0.1;
			recoil = "Empty";
			aiDispersionCoefX = 6;
			aiDispersionCoefY = 6;
			ffMagnitude = 0.5;
			ffFrequency = 11;
			ffCount = 6;
			minRange = 1;
			minRangeProbab = 0.06;
			midRange = 2;
			midRangeProbab = 0.06;
			maxRange = 3;
			maxRangeProbab = 0.004;
			dispersion = 0.00029;
			textureType = "semi";
		};
		class LowROF: Mode_FullAuto {
			displayName = "M242 Bushmaster 2 HP";
			displayNameShort = "M242 2 HP";
			reloadTime = 0.3;
			sounds[] = {"StandardSound"};
			class StandardSound {
				begin1[] = {"A3\Sounds_F\arsenal\weapons_vehicles\cannon_30mm\autocannon_30mm_01",1.9952624,1,1500};
				begin2[] = {"A3\Sounds_F\arsenal\weapons_vehicles\cannon_30mm\autocannon_30mm_02",1.9952624,1,1500};
				begin3[] = {"A3\Sounds_F\arsenal\weapons_vehicles\cannon_30mm\autocannon_30mm_03",1.9952624,1,1500};
				soundBegin[] = {"begin1",0.33,"begin2",0.33,"begin3",0.34};
			};

			soundContinuous = 0;
			flash = "gunfire";
			flashSize = 0.1;
			recoil = "Empty";
			aiDispersionCoefX = 6;
			aiDispersionCoefY = 6;
			ffMagnitude = 0.5;
			ffFrequency = 11;
			ffCount = 6;
			minRange = 1;
			minRangeProbab = 0.06;
			midRange = 2;
			midRangeProbab = 0.06;
			maxRange = 3;
			maxRangeProbab = 0.004;
			dispersion = 0.00087;
			textureType = "burst";
		};
		class HighROF: LowROF {
			displayName = "M242 Bushmaster 5 HP";
			displayNameShort = "M242 5 HP";
			reloadTime = 0.12;
			sounds[] = {"StandardSound"};
			class StandardSound {
				begin1[] = {"A3\Sounds_F\arsenal\weapons_vehicles\cannon_30mm\autocannon_30mm_01",1.9952624,1,1500};
				begin2[] = {"A3\Sounds_F\arsenal\weapons_vehicles\cannon_30mm\autocannon_30mm_02",1.9952624,1,1500};
				begin3[] = {"A3\Sounds_F\arsenal\weapons_vehicles\cannon_30mm\autocannon_30mm_03",1.9952624,1,1500};
				soundBegin[] = {"begin1",0.33,"begin2",0.33,"begin3",0.34};
			};

			soundContinuous = 0;
			minRange = 1;
			minRangeProbab = 0.08;
			midRange = 2;
			midRangeProbab = 0.058;
			maxRange = 3;
			maxRangeProbab = 0.004;
			dispersion = "0.00174";
			textureType = "fullAuto";
		};
	};
	class AAM_M242_25mm_autocannon: AAM_M242_25mm_autocannon_base {
		muzzles[] = {"M242"};
		class M242: AAM_M242_25mm_autocannon_base{};
	};
};
class RCWSOptics;
class DefaultEventHandlers;
class WeaponFireGun;
class WeaponCloudsGun;
class WeaponFireMGun;
class WeaponCloudsMGun;
class CfgVehicles {
	class Car;
	class Car_F: Car {
		class Sounds;
		class HitPoints {
			class HitLFWheel;
			class HitLBWheel;
			class HitLMWheel;
			class HitLF2Wheel;
			class HitRFWheel;
			class HitRBWheel;
			class HitRMWheel;
			class HitRF2Wheel;
			class HitBody;
		};
		class NewTurret;
		class Turrets {
			class MainTurret: NewTurret
			{
				class HitPoints;
			};
		};
		class ViewPilot;
	};
	class Wheeled_APC_F: Car_F {
		class Sounds: Sounds {
			class Engine;
			class Movement;
		};
		class AnimationSources;
		class EventHandlers;
	};
	class AAM_ASLAV25_Base: Wheeled_APC_F {
		scope = 0;
		model = "\AAM_Armour\ASLAV";
		attenuationEffectType = "TankAttenuation";
		//class Library {libTextDesc = "$STR_LIB_LAV25"; };
		vehicleClass = "Armored";
		picture = "\AAM_Armour\Data\UI\Picture_ASLAV_CA.paa";
		Icon = "\AAM_Armour\Data\UI\Icon_ASLAV_CA.paa";
		mapSize = 7;
		radarType = 8;
		canFloat = 1;
		waterangulardampingcoef = 5.0;
		waterresistance = 5;
		waterPPInVehicle = 0;
		waterResistanceCoef = 0.1;
		waterLinearDampingCoefX = 2.5;
		waterLinearDampingCoefY = 1.5;
		engineShiftY = 1.05;
		armorLights = 0.1;
		armorStructural = 12;
		fuelCapacity = 300;
		unitInfoType = "RscUnitInfoTank";
		hideProxyInCombat = 1;
		threat[] = {0.5,0.5,0.5};
		armor = 100;
		damageResistance = 0.02432;
		slingLoadCargoMemoryPoints[] = {"SlingLoadCargo1","SlingLoadCargo2","SlingLoadCargo3","SlingLoadCargo4"};
		class HitPoints: HitPoints {
			class HitBody {
				armor = 1;
				material = -1;
				name = "zbytek";
				visual = "zbytek";
				minimalHit = 0.4;
				passThrough = 1;
			};
			class HitEngine {
				armor = 2;
				material = -1;
				name = "motor";
				visual = "zbytek";
				passThrough = 0.5;
			};
			class HitFuel
			{
				armor = 1;
				material = -1;
				name = "palivo";
				visual = "zbytek";
				passThrough = 0;
			};
			class HitLFWheel: HitLFWheel
			{
				armor = 0.7;
				minimalHit = 0.02;
				explosionShielding = 4;
				radius = 0.25;
			};
			class HitLBWheel: HitLBWheel
			{
				armor = 0.7;
				minimalHit = 0.02;
				explosionShielding = 4;
				radius = 0.25;
			};
			class HitLMWheel: HitLMWheel
			{
				armor = 0.7;
				minimalHit = 0.02;
				explosionShielding = 4;
				radius = 0.25;
			};
			class HitLF2Wheel: HitLF2Wheel
			{
				armor = 0.7;
				minimalHit = 0.02;
				explosionShielding = 4;
				radius = 0.25;
			};
			class HitRFWheel: HitRFWheel
			{
				armor = 0.7;
				minimalHit = 0.02;
				explosionShielding = 4;
				radius = 0.25;
			};
			class HitRBWheel: HitRBWheel
			{
				armor = 0.7;
				minimalHit = 0.02;
				explosionShielding = 4;
				radius = 0.25;
			};
			class HitRMWheel: HitRMWheel
			{
				armor = 0.7;
				minimalHit = 0.02;
				explosionShielding = 4;
				radius = 0.25;
			};
			class HitRF2Wheel: HitRF2Wheel
			{
				armor = 0.7;
				minimalHit = 0.02;
				explosionShielding = 4;
				radius = 0.25;
			};
		};
		class Damage {
			tex[] = {};
			mat[] = {"\AAM_Armour\Data\lavalfa.rvmat","\AAM_Armour\Data\lavalfa_damage.rvmat","\AAM_Armour\Data\lavalfa_destruct.rvmat","\AAM_Armour\Data\lavbody.rvmat","\AAM_Armour\Data\lavbody_damage.rvmat","\AAM_Armour\Data\lavbody_destruct.rvmat","\AAM_Armour\Data\lavbody2.rvmat","\AAM_Armour\Data\lavbody2_damage.rvmat","\AAM_Armour\Data\lavbody2_destruct.rvmat","\AAM_Armour\Data\lav_glass_green.rvmat","\AAM_Armour\Data\lav_glass_green_damage.rvmat","\AAM_Armour\Data\lav_glass_green_destruct.rvmat","\AAM_Armour\Data\lav_glass_red.rvmat","\AAM_Armour\Data\lav_glass_red_damage.rvmat","\AAM_Armour\Data\lav_glass_red_destruct.rvmat","\AAM_Armour\Data\lav_hq.rvmat","\AAM_Armour\Data\lav_hq_damage.rvmat","\AAM_Armour\Data\lav_hq_destruct.rvmat","\AAM_Armour\Data\lav_int_0.rvmat","\AAM_Armour\Data\lav_int_0_damage.rvmat","\AAM_Armour\Data\lav_int_0_destruct.rvmat","\AAM_Armour\Data\lav_int_1.rvmat","\AAM_Armour\Data\lav_int_1_damage.rvmat","\AAM_Armour\Data\lav_int_1_destruct.rvmat","\AAM_Armour\Data\lav_int_2.rvmat","\AAM_Armour\Data\lav_int_2_damage.rvmat","\AAM_Armour\Data\lav_int_2_destruct.rvmat"};
		};
		hiddenSelections[] = {"Camo1","Camo2","clan","clan_sign"};
		hiddenSelectionsTextures[] = {"\AAM_Armour\data\lavbody_co.paa","\AAM_Armour\data\lavbody2_co.paa","",""};
		insideSoundCoef = 0.9;
		#include "ASLAVsounds.hpp"
		waterLeakiness = 2.5;
		turnCoef = 4.0;
		steerAheadSimul = 0.6;
		steerAheadPlan = 0.4;
		enableGPS = 1;
		commanderCanSee = 31;
		gunnerCanSee = 30;
		driverCanSee = 31;
		forceHideDriver = 0;
		gunnerHasFlares = 1;
		weapons[] = {"TruckHorn3"};
		magazines[] = {};
		driverForceOptics = 1;
		driverOpticsModel = "\a3\weapons_f\reticle\Optics_Driver_01_F";
		memoryPointdriverOptics = "driverview";
		class ViewOptics {
			visionMode[] = {"Normal","NVG"};
			initAngleX = 0;
			minAngleX = -30;
			maxAngleX = "+30";
			initAngleY = 0;
			minAngleY = -100;
			maxAngleY = "+100";
			initFov = 0.466;
			minFov = 0.466;
			maxFov = 0.466;
		};
		class ViewPilot {
			initAngleX = 10;
			minAngleX = -65;
			maxAngleX = "+85";
			initAngleY = 20;
			minAngleY = -150;
			maxAngleY = "+150";
			initFov = 0.7;
			minFov = 0.25;
			maxFov = 1.4;
		};
		class Turrets: Turrets {
			class MainTurret: MainTurret { ////  MAIN TURRET
				weapons[] = {"AAM_M242_25mm_autocannon","AAM_M240_Coax"};
				magazines[] = {"AAM_210Rnd_25mm_HEI_T","AAM_210Rnd_25mm_APFSDS_T","AAM_2000rnd_762x51_Belt_M240"};
				soundServo[] = {"A3\sounds_f\dummysound","db-35",1.0,15};
				minElev = -8;
				maxElev = "+50";
				initElev = 0;
				minTurn = -360;
				maxTurn = "+360";
				initTurn = 0;
				gunnerAction = "LAV25_Gunner_out";
				gunnerInAction = "LAV25_Gunner";
				forceHideGunner = 0;
				gunnerOpticsModel = "\A3\weapons_f\reticle\Optics_Gunner_02_F";
				discreteDistance[] = {100,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400,1500};
				discreteDistanceInitIndex = 2;
				//turretInfoType = "RscWeaponRangeZeroing";
				turretInfoType = "RscOptics_APC_Wheeled_03_gunner";
				gunnerOutOpticsModel = "";
				memoryPointGun = "muzzle_1";
				selectionFireAnim = "zasleh_2";
				gunBeg = "muzzle_1";
				gunEnd = "chamber_1";
				body = "MainTurret";
				gun = "MainGun";
				animationSourceBody = "MainTurret";
				animationSourceGun = "MainGun";
				gunnerForceOptics = 1;
				outGunnerMayFire = 0;
				startEngine = 1;
				primaryGunner = 4;
				stabilizedInAxes = StabilizedInAxesBoth;
				class ViewOptics: RCWSOptics {
					visionMode[] = {"Normal","TI"};
					thermalMode[] = {2,3};
					initAngleX = 0;
					minAngleX = -30;
					maxAngleX = "+30";
					initAngleY = 0;
					minAngleY = -100;
					maxAngleY = "+100";
					initFov = 0.2;
					minFov = 0.05;
					maxFov = 0.2;
				};
				class OpticsIn {
					class Wide: ViewOptics {
						initFov = 0.234;
						minFov = 0.234;
						maxFov = 0.234;
						gunnerOpticsModel = "\a3\weapons_f\reticle\Optics_Gunner_01_wide_F";
					};
					class Narrow: Wide {
						initFov = 0.07;
						minFov = 0.07;
						maxFov = 0.07;
						gunnerOpticsModel = "\a3\weapons_f\reticle\Optics_Gunner_01_narrow_F";
					};
				};
				class HitPoints: HitPoints {
					class HitTurret {
						armor = 0.8;
						material = -1;
						name = "otocvez";
						visual = "otocvez";
						passThrough = 1;
					};
				};
				class ViewGunner {
					initAngleX = 5;
					minAngleX = -65;
					maxAngleX = "+85";
					initAngleY = 0;
					minAngleY = -150;
					maxAngleY = "+150";
					initFov = 0.7;
					minFov = 0.25;
					maxFov = 1.1;
				};
				class Turrets { //// COMMANDERS TURRET
					class CommanderOptics: NewTurret {
						proxyType = "CPCommander";
						proxyIndex = 1;
						gunnerName = "$STR_POSITION_COMMANDER";
						primaryGunner = 0;
						primaryObserver = 1;
						gunnerOpticsShowCursor = 0;
						//memoryPointGun = "muzzle_1";/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
						//selectionFireAnim = "zasleh_2";//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
						gunBeg = "";///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
						gunEnd = "";///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
						body = "obsTurret";
						gun = "obsGun";
						animationSourceBody = "obsTurret";
						animationSourceGun = "obsGun";
						animationSourceHatch = "hatchCommander";
						soundServo[] = {"","db-50",1.0};
						startEngine = 0;
						minElev = -4;
						maxElev = "+20";
						initElev = 0;
						minTurn = -360;
						maxTurn = "+360";
						initTurn = 0;
						commanding = 2;
						viewGunnerInExternal = 0;
						gunnerOpticsModel = "\A3\weapons_f\reticle\Optics_Commander_02_F";
						gunnerOutOpticsModel = "";
						gunnerOutOpticsColor[] = {0,0,0,1};
						gunnerOutForceOptics = 0;
						gunnerOutOpticsShowCursor = 0;
						memoryPointGunnerOutOptics = "commander_weapon_view";
						memoryPointGunnerOptics = "commanderview";
						memoryPointsGetInGunner = "pos driver";
						memoryPointsGetInGunnerDir = "pos driver dir";
						class ViewGunner {
							visionMode[] = {"Normal","NVG","TI"};
							thermalMode[] = {2,3};
							initAngleX = 5;
							minAngleX = -65;
							maxAngleX = "+85";
							initAngleY = 0;
							minAngleY = -150;
							maxAngleY = "+150";
							initFov = 0.7;
							minFov = 0.25;
							maxFov = 1.1;
						};
						gunnerOpticsEffect[] = {"TankGunnerOptics2","OpticsBlur1","OpticsCHAbera1"};
						class ViewOptics {
							initAngleX = 0;
							minAngleX = -30;
							maxAngleX = "+30";
							initAngleY = 0;
							minAngleY = -100;
							maxAngleY = "+100";
							initFov = 0.3;
							minFov = 0.025;
							maxFov = 0.3;
						};
						gunnerInAction = "LAV25_Commander";
						gunnerAction = "LAV25_Commander_out_mg";///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
						outGunnerMayFire = 1;
						weapons[] = {"AAM_M240_Pintle","SmokeLauncher"};
						magazines[] = {"AAM_2000rnd_762x51_Belt_M240","SmokeLauncherMag","SmokeLauncherMag"};
						stabilizedInAxes = 3;
					};
				};
			};
		};
		crew = "ADF_AMCU_RFL";
		transportSoldier = 6;
		cargoProxyIndexes[] = {1,2,3,4,5,6};
		typicalCargo[] = {"ADF_AMCU_RFL","ADF_AMCU_RFL","ADF_AMCU_RFL"};
		DriverAction = "LAV25_Driver_OUT";
		driverInAction = "LAV25_Driver_OUT";
		cargoAction[] = {
			"passenger_apc_narrow_generic02",
			"passenger_apc_narrow_generic01",
			"passenger_apc_narrow_generic03",
			"passenger_apc_generic03",
			"passenger_apc_generic02",
			"passenger_generic01_foldhands",
			"passenger_apc_narrow_generic01",
			"passenger_apc_narrow_generic02"
		};
		viewCargoShadow = 1;
		viewCargoShadowDiff = 0.05;
		viewDriverShadowDiff = 0.05;
		viewGunnerShadowDiff = 0.05;
		transportAmmo = 100;
		supplyRadius = 1.7;
		transportMaxMagazines = 100;
		transportMaxWeapons = 10;
		smokeLauncherGrenadeCount = 4;
		smokeLauncherVelocity = 14;
		smokeLauncherOnTurret = 1;
		smokeLauncherAngle = 90;
		class Reflectors {
			class Left {
				color[] = {0.9,0.8,0.8,1.0};
				ambient[] = {0.1,0.1,0.1,1.0};
				coneFadeCoef = 10;
				dayLight = 0;
				flareSize = 1;
				innerAngle = 100;
				intensity = 1000;
				outerAngle = 140;
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				brightness = 0.5;
				useFlare = 1;
				class Attenuation {
					constant = 0;
					hardLimitEnd = 60;
					hardLimitStart = 30;
					linear = 0;
					quadratic = 0.25;
					start = 1.0;
				};
			};
			class Right: Left {
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
			};
		};
		aggregateReflectors[] = {};
		class Exhausts {
			class Exhaust1 {
				position = "vyfuk start";
				direction = "vyfuk konec";
				effect = "ExhaustsEffectAMV";
			};
		};
		simulation = "carX";
		maxSpeed = 120;
		wheelCircumference = 3.277;
		dampersBumpCoef = 5;
		differentialType = "all_limited";
		frontRearSplit = 0.5;
		frontBias = 1.3;
		rearBias = 1.3;
		centreBias = 1.3;
		clutchStrength = 35.0;
		changeGearMinEffectivity[] = {0.5,0.15,0.97,0.97,0.97,0.97,0.97,0.985};
		switchTime = 0.1;
		latency = 1.4;
		enginePower = 295;
		maxOmega = 245;
		peakTorque = 2217;
		damperSize = 0.2;
		damperForce = 1;
		damperDamping = 1;
		dampingRateFullThrottle = 0.08;
		dampingRateZeroThrottleClutchEngaged = 0.35;
		dampingRateZeroThrottleClutchDisengaged = 0.35;
		torqueCurve[] = {{ 0,0 },{ "(1600/2640)","(2650/2850)" },{ "(1800/2640)","(2800/2850)" },{ "(1900/2640)","(2850/2850)" },{ "(2000/2640)","(2800/2850)" },{ "(2200/2640)","(2750/2850)" },{ "(2400/2640)","(2600/2850)" },{ "(2640/2640)","(2350/2850)" }};
		class wheels {
			class L1 {
				boneName = "wheel_1_1_damper";
				steering = 1;
				side = "left";
				center = "wheel_1_1_axis";
				boundary = "wheel_1_1_bound";
				width = "0.2";
				mass = 100;
				MOI = 60;
				dampingRate = 0.1;
				dampingRateDamaged = 1.0;
				dampingRateDestroyed = 1000.0;
				maxBrakeTorque = 15000;
				maxHandBrakeTorque = 0;
				suspTravelDirection[] = {0,-1,0};
				suspForceAppPointOffset = "wheel_1_1_axis";
				tireForceAppPointOffset = "wheel_1_1_axis";
				maxCompression = 0.2;
				mMaxDroop = 0.2;
				sprungMass = 1600;
				springStrength = 80000;
				springDamperRate = 18000;
				longitudinalStiffnessPerUnitGravity = 10000;
				latStiffX = 25;
				latStiffY = 180;
				frictionVsSlipGraph[] = {{ 0,1 },{ 0.5,1 },{ 1,1 }};
			};
			class L2: L1 {
				boneName = "wheel_1_2_damper";
				steering = 1;
				center = "wheel_1_2_axis";
				boundary = "wheel_1_2_bound";
				suspForceAppPointOffset = "wheel_1_2_axis";
				tireForceAppPointOffset = "wheel_1_2_axis";
			};
			class L3: L1 {
				boneName = "wheel_1_3_damper";
				steering = 0;
				center = "wheel_1_3_axis";
				boundary = "wheel_1_3_bound";
				suspForceAppPointOffset = "wheel_1_3_axis";
				tireForceAppPointOffset = "wheel_1_3_axis";
				maxHandBrakeTorque = 300000;
			};
			class L4: L1 {
				boneName = "wheel_1_4_damper";
				steering = 0;
				center = "wheel_1_4_axis";
				boundary = "wheel_1_4_bound";
				suspForceAppPointOffset = "wheel_1_4_axis";
				tireForceAppPointOffset = "wheel_1_4_axis";
				maxHandBrakeTorque = 300000;
			};
			class R1: L1 {
				boneName = "wheel_2_1_damper";
				center = "wheel_2_1_axis";
				boundary = "wheel_2_1_bound";
				suspForceAppPointOffset = "wheel_2_1_axis";
				tireForceAppPointOffset = "wheel_2_1_axis";
				steering = 1;
				side = "right";
			};
			class R2: R1 {
				boneName = "wheel_2_2_damper";
				steering = 1;
				center = "wheel_2_2_axis";
				boundary = "wheel_2_2_bound";
				suspForceAppPointOffset = "wheel_2_2_axis";
				tireForceAppPointOffset = "wheel_2_2_axis";
			};
			class R3: R1 {
				boneName = "wheel_2_3_damper";
				steering = 0;
				center = "wheel_2_3_axis";
				boundary = "wheel_2_3_bound";
				suspForceAppPointOffset = "wheel_2_3_axis";
				tireForceAppPointOffset = "wheel_2_3_axis";
				maxHandBrakeTorque = 300000;
			};
			class R4: R1 {
				boneName = "wheel_2_4_damper";
				steering = 0;
				center = "wheel_2_4_axis";
				boundary = "wheel_2_4_bound";
				suspForceAppPointOffset = "wheel_2_4_axis";
				tireForceAppPointOffset = "wheel_2_4_axis";
				maxHandBrakeTorque = 300000;
			};
		};
		thrustDelay = 0.35;
		brakeIdleSpeed = 1.78;
		idleRpm = 280;
		redRpm = 2500;
		antiRollbarForceCoef = 24;
		antiRollbarForceLimit = 30;
		antiRollbarSpeedMin = 15;
		antiRollbarSpeedMax = 65;
		class complexGearbox {
			GearboxRatios[] = {"R1",-4.84,"N",0,"D1",3.43,"D2",2.01,"D3",1.42,"D4",1,"D5",0.83,"D6",0.59};
			TransmissionRatios[] = {"High",8};
			gearBoxMode = "auto";
			moveOffGear = 1;
			driveString = "D";
			neutralString = "N";
			reverseString = "R";
		};
		class AnimationSources: AnimationSources {
			class front_panel_anim {
				source = "user";
				animperiod = 2;
				initPhase = 0;
			};
			class recoil_source {
				source = "reload";
				weapon = "autocannon_40mm_CTWS";
			};
			class HitLFWheel {
				source = "Hit";
				hitpoint = "HitLFWheel";
				raw = 1;
			};
			class HitLF2Wheel {
				source = "Hit";
				hitpoint = "HitLBWheel";
				raw = 1;
			};
			class HitLMWheel {
				source = "Hit";
				hitpoint = "HitLMWheel";
				raw = 1;
			};
			class HitLBWheel {
				source = "Hit";
				hitpoint = "HitLF2Wheel";
				raw = 1;
			};
			class HitRFWheel {
				source = "Hit";
				hitpoint = "HitRFWheel";
				raw = 1;
			};
			class HitRF2Wheel {
				source = "Hit";
				hitpoint = "HitRBWheel";
				raw = 1;
			};
			class HitRMWheel {
				source = "Hit";
				hitpoint = "HitRMWheel";
				raw = 1;
			};
			class HitRBWheel {
				source = "Hit";
				hitpoint = "HitRF2Wheel";
				raw = 1;
			};
		};
		class EventHandlers: DefaultEventhandlers {
			init = "_this execVM ""\AAM_Armour\scripts\init.sqf""";
		};
	};
	class AAM_ASLAV25: AAM_ASLAV25_Base {
		scope = 2;
		side = 1;
		faction = "AAM_ADF";
		displayName = "ASLAV-25";
		author = "AAM Team";
		class AnimationSources: AnimationSources {
			class recoil_source {
				source = "reload";
				weapon = "AAM_M242_25mm_autocannon";
			};
		};
		//AGM_FCSEnabled = 1;
	};
};