	//====================================================== CHINOOK =====================================================
	class CH_47F_base: Helicopter_Base_H {
		author="Bohemia Interactive, Aplion, Kimi, Gnrnr";
		destrType="DestructWreck";
		scope=0;
		displayName="CH-47F Chinook";
		//side=1;
		//faction="AAM_ADF";
		class MFD {};
		simulation = "helicopterrtd";
		mainBladeRadius=9.1999998;
		liftForceCoef=1.5;
		cyclicAsideForceCoef=0.4;
		cyclicForwardForceCoef=1;
		backRotorForceCoef = 0.5;
		bodyFrictionCoef=0.89999998;
		class RotorLibHelicopterProperties: RotorLibHelicopterProperties {
			RTDconfig = "A3\Air_F_heli\Heli_Transport_03\RTD_Heli_Transport_03.xml";
			autoHoverCorrection[] = {6.5,3.8,0};
			defaultCollective = 0.665;
			retreatBladeStallWarningSpeed = 92.583;
			maxTorque = 4032;
			stressDamagePerSec = 0.0033333332;
			maxHorizontalStabilizerLeftStress = 10000;
			maxHorizontalStabilizerRightStress = 10000;
			maxVerticalStabilizerStress = 10000;
			horizontalWingsAngleCollMin = 0;
			horizontalWingsAngleCollMax = 0;
			maxMainRotorStress = 350000;
			maxTailRotorStress = 350000;
		};
		class Library {
			libTextDesc="CH-47F";
		};
		copilotHasFlares = 1;
		vehicleClass="Air";
		crew="B_Helipilot_F";
		availableForSupportTypes[]=	{
			"Drop",
			"Transport"
		};
		//driveOnComponent[] = {"wheel_1_1","wheel_2_1","wheel_1_2","wheel_2_2"};
		driveOnComponent[] = {"gear_1_1_wheels","gear_2_1_wheels","gear_1_2_wheel","gear_2_2_wheel"};  //Comes from Huron
		accuracy=0.5;
		mainRotorSpeed=1;
		backRotorSpeed=1;
		gearRetracting=1;
		gearUpTime=1;
		gearDownTime=1;
		armor=30;
		damageResistance=0.001;
		fuelcapacity = 1360;
		fuelconsumptionrate = 0.126;
		fuelexplosionpower = 5;
		driverInAction="ChopperLight_L_In_H";
		driveraction = "pilot_Heli_Transport_01";
		driverLeftHandAnimName="lever_pilot";
		driverRightHandAnimName="stick_pilot";
		cargogetinaction[] = {"GetInHeli_Transport_01Cargo"};
		cargogetoutaction[] = {"GetOutLow"};
		getinaction = "ChopperLight_L_In_H";
		getoutaction = "GetOutLow";
		selectionhrotormove = "velka vrtule blur";
		selectionhrotorstill = "velka vrtule staticka";
		selectionvrotormove = "mala vrtule blur";
		selectionvrotorstill = "mala vrtule staticka";
		//slingloadcargomemorypoints[] = {};  //Should only be needed for items that can be picked up when sling loading.
		//slingloadcargomemorypointsdir[] = {};  //Should only be needed for items that can be picked up when sling loading.
		memoryPointsGetInCargo[]= {"pos cargo"};
		memoryPointsGetInCargoDir[]={"pos cargo dir"};
		cargoAction[]= {
			"passenger_low01",
			"passenger_generic01_leanleft",
			"passenger_generic01_leanleft",
			"passenger_generic01_leanright",
			"passenger_generic01_foldhands",
			"passenger_mantisrear",
			"passenger_low01",
			"passenger_generic01_leanleft",
			"passenger_generic01_leanleft",
			"passenger_generic01_leanright",
			"passenger_generic01_foldhands",
			"passenger_inside_1",
			"passenger_low01",
			"passenger_generic01_leanleft",
			"passenger_generic01_leanleft",
			"passenger_generic01_leanright",
			"passenger_generic01_foldhands",
			"passenger_mantisrear",
			"passenger_low01",
			"passenger_inside_1",
			"passenger_generic01_leanleft",
			"passenger_generic01_leanleft",
			"passenger_generic01_leanright",
			"passenger_generic01_foldhands"
		};
		cargoIsCoDriver[]= {
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false",
			"false"
		};
		transportSoldier=24;
		hideWeaponsCargo = 1;						/// this makes the poses easier and adds some performance gain because the proxies don't need to be drawn
		cargoProxyIndexes[] = {1,2,3,4,5,6,7,8,9,10,11,13,14,15,16,17,18,19,21,22,23,24};  /// 12 and 20 are cargo turret positions for firing from heli
		transportMaxBackpacks=10;
		weapons[]= {
			"CMFlareLauncher"
		};
		magazines[]= {
			"168Rnd_CMFlare_Chaff_Magazine"
		};
		memoryPointCM[]= {
			"flare_launcher1",
			"flare_launcher2"
		};
		memoryPointCMDir[]= {
			"flare_launcher1_dir",
			"flare_launcher2_dir"
		};
		LockDetectionSystem="2 + 8 + 4";
		incomingMissileDetectionSystem=16;
		radarType=4;
		enableManualFire=0;
		maxFordingDepth=0.55000001;
		threat[]={0.80000001,1,0.60000002};
		helmetMountedDisplay=0;
		cargoCanEject=1;
		driverCanEject=0;
		maximumLoad = 22680;
		slingloadmaxcargomass = 12000;
		slingloadmemorypoint = "slingLoad0";
		slingloadoperator=0;
		/*class TransportBackpacks {
			class _xx_B_Parachute {
				backpack="B_Parachute";
				count=28;
			};
		};
		class TransportMagazines {
			class _xx_SmokeShell {
				magazine="SmokeShell";
				count=2;
			};
			class _xx_SmokeShellBlue {
				magazine="SmokeShellBlue";
				count=2;
			};
			class _xx_30Rnd_65x39_caseless_mag {
				magazine="30Rnd_65x39_caseless_mag";
				count=15;
			};
		};
		class TransportWeapons {
			class _xx_arifle_MXC_F {
				weapon="arifle_MXC_F";
				count=5;
			};
		};
		class TransportItems {
			class _xx_FirstAidKit {
				name="FirstAidKit";
				count=8;
			};
			class _xx_Toolkit {
				name="Toolkit";
				count=1;
			};
			class _xx_Medikit {
				name="Medikit";
				count=1;
			};
			class _xx_ItemGPS {
				name="ItemGPS";
				count=2;
			};
		};*/
		class HitPoints: HitPoints { //https://community.bistudio.com/wiki/Config_Properties_Megalist#class_HitPoints
			class HitVRotor {
				armor=1;
				material=51;
				name="mala vrtule";
				visual="mala vrtule staticka";// for textures ?
				passThrough=0.5;
			};
			class HitHRotor {
				armor=1;
				material=51;
				name="velka vrtule";
				visual="velka vrtule staticka";// for textures ?
				passThrough=0.5;
			};
			class HitHull: HitHull {
				armor = 999; //% of total health on this LOC
				depends = "Total"; // transfers damage to this loc  -- depends = "5 * HitTurret"; x5 dam to hitturret
				// explosionShielding = 0 indirect hit does NOTHING
				//material
				// name = model selection for this hit location
				//passThrough = 0 Loca can be destroyed without effecting behicle health
				radius = 0.01; // size around each vert that counts as this LOC
				isual = "zbytek"; //CFG models section for texture damage
			};
			class HitFuel: HitFuel {
				armor = 1;
				radius = 0.25;
				minimalHit = 0.05;
			};
			class HitAvionics: HitAvionics {
				armor = 2;
				radius = 0.4;
				minimalHit = 0.05;
			};
			class HitEngine1: HitEngine {
				armor = 0.7;
				radius = 0.4;
				explosionShielding = 3;
				minimalHit = 0.1;
				name = "engine_1_hit";
				convexComponent = "engine_1_hit";
			};
			class HitEngine2: HitEngine1 {
				name = "engine_2_hit";
				convexComponent = "engine_2_hit";
			};
			class HitEngine: HitEngine2 {
				armor = 999;
				name = "engine_hit";
				convexComponent = "engine_hit";
				depends = "0.5 * (HitEngine1 + HitEngine2)";
			};
		};
		//#include "soundsCH47.hpp"
		class MarkerLights {
			class WhiteStill {
				name="bily pozicni";
				color[]={1,1,1};
				ambient[]={0.1,0.1,0.1};
				blinking=1;
				intensity=75;
				blinkingPattern[]={0.1,0.89999998};
				blinkingPatternGuarantee=0;
				drawLightSize=0.2;
				drawLightCenterSize=0.039999999;
			};
			class RedStill {
				name="cerveny pozicni";
				color[]={0.80000001,0,0};
				ambient[]={0.079999998,0,0};
				intensity=75;
				drawLight=1;
				drawLightSize=0.15000001;
				drawLightCenterSize=0.039999999;
				activeLight=0;
				blinking=0;
				dayLight=0;
				useFlare=0;
			};
			class GreenStill {
				name="zeleny pozicni";
				color[]={0,0.80000001,0};
				ambient[]={0,0.079999998,0};
				intensity=75;
				drawLight=1;
				drawLightSize=0.15000001;
				drawLightCenterSize=0.039999999;
				activeLight=0;
				blinking=0;
				dayLight=0;
				useFlare=0;
			};
			class RedBlinking {
				name="bily pozicni blik";
				color[]={0.89999998,0.15000001,0.1};
				ambient[]={0.090000004,0.015,0.0099999998};
				intensity=75;
				blinking=1;
				blinkingPattern[]={0.1,0.89999998};
				blinkingPatternGuarantee=0;
				drawLightSize=0.2;
				drawLightCenterSize=0.039999999;
			};
			class WhiteBlinking {
				name="cerveny pozicni blik";
				color[]={0.89999998,0.15000001,0.1};
				intensity=75;
				ambient[]={0.090000004,0.015,0.0099999998};
				blinking=1;
				blinkingPattern[]={0.2,1.3};
				blinkingPatternGuarantee=0;
				drawLightSize=0.25;
				drawLightCenterSize=0.079999998;
			};
		};
		class Reflectors {
			class Middle {
				color[]={7000,7500,10000,1};
				ambient[]={100,100,100,0};
				position="svetlo";
				direction="svetlo konec";
				hitpoint="svetlo";
				selection="svetlo";
				size=1;
				innerAngle=20;
				outerAngle=60;
				coneFadeCoef=10;
				intensity=50;
				useFlare=1;
				dayLight=0;
				FlareSize=6;
				class Attenuation {
					start=1;
					constant=0;
					linear=0;
					quadratic=4;
				};
			};
		};
		class Exhausts {
			class Exhaust1 {
				direction="exhaust1_dir";
				effect="ExhaustEffectHeli";
				position="exhaust1";
			};
			class Exhaust2 {
				direction="exhaust2_dir";
				effect="ExhaustEffectHeli";
				position="exhaust2";
			};
		};
		class Damage {
			tex[]={};
			mat[]= {
				"AAM_Air\data\ch47_1.rvmat",
				"AAM_Air\data\ch47_1_damage.rvmat",
				"AAM_Air\data\ch47_1_destruct.rvmat",
				"AAM_Air\data\ch47_2.rvmat",
				"AAM_Air\data\ch47_2_damage.rvmat",
				"AAM_Air\data\ch47_2_destruct.rvmat",
				"AAM_Air\data\ch47_1_int.rvmat",
				"AAM_Air\data\ch47_1_int.rvmat",
				"AAM_Air\data\ch47_1_int_destruct.rvmat",
				"AAM_Air\data\ch47_2_int.rvmat",
				"AAM_Air\data\ch47_2_int.rvmat",
				"AAM_Air\data\ch47_2_int_destruct.rvmat",
				"AAM_Air\data\ch47_sklo_in.rvmat",
				"AAM_Air\data\ch47_sklo_in_damage.rvmat",
				"AAM_Air\data\ch47_sklo_in_damage.rvmat",
				"AAM_Air\data\ch47_sklo.rvmat",
				"AAM_Air\data\ch47_sklo_damage.rvmat",
				"AAM_Air\data\ch47_sklo_damage.rvmat",
				"AAM_Air\data\default.rvmat",
				"AAM_Air\data\default.rvmat",
				"AAM_Air\data\default_destruct.rvmat"
			};
		};
		irScanRangeMin=0;
		irScanRangeMax=1000;
		irScanToEyeFactor=2;
		driverCanSee="2 + 4 + 8 + 16";
		gunnerCanSee="2 + 4 + 8 + 16";
		hiddenSelections[]=	{
			"camo1",
			"camo2"
		};
	};
	class CH_47F: CH_47F_base {
		displayname="CH-47F Chinook";
		scope=0;
		maxSpeed = 315;
		bodyFrictionCoef=0.89999998;
		commanderCanSee="1 + 2 + 4 + 8 + 16";
		gunnerCanSee="1 + 2 + 4 + 8 + 16";
		driverCanSee="1 + 2 + 4 + 8 + 16";
		codriverCanSee="1 + 2 + 4 + 8 + 16";
		accuracy=1000;
		model="AAM_Air\CH_47F.p3d";
		nameSound="veh_helicopter";
		picture="\AAM_Air\UI\Picture_ch47f_CA.paa";
		icon="\AAM_Air\UI\Icon_ch47f_CA.paa";
		mapSize=25;
		crew="B_Helipilot_F";
		typicalCargo[]=	{
			"B_Helipilot_F",
			"B_Helipilot_F"
		};
		LockDetectionSystem="2 + 8 + 4";
		incomingMissileDetectionSystem=16;
		class CargoTurret;
		class Turrets: Turrets {
			class CopilotTurret: CopilotTurret {
				caneject = 0;
				gunneraction = "Chopperlight_R_Static_H";
				gunnergetinaction = "Chopperlight_R_In_H";
				gunnergetoutaction = "GetOutLow";
				gunnerinaction = "Chopperlight_R_Static_H";
				magazines[] = {};
				memoryPointsGetInCargo = "pos copilot";				/// what is the position of get in action
				memoryPointsGetInCargoDir = "pos copilot dir";		/// what is the direction of get in action
				memorypointsgetingunnerprecise = "GetIn_Turret";
				gunnerCompartments="Compartment1";
				precisegetinout = 0;
				proxyIndex=3;
				weapons[] = {};
			};
			class MainTurret: MainTurret {
				isCopilot=0;
				body="mainTurret";
				gun="mainGun";
				minElev=-50;
				maxElev=30;
				initElev=-30;
				minTurn=-3;
				maxTurn=173;
				initTurn=0;
				soundServo[]= {"",0.0099999998,1};
				memoryPointGunnerOptics="gunnerview";
				memoryPointGun="machinegun_1";
				animationSourceHatch="";
				stabilizedInAxes="StabilizedInAxesNone";
				selectionFireAnim="zasleh";
				animationSourceBody="MainTurret";
				animationSourceGun="MainGun";
				gunBeg="muzzle_1";
				gunEnd="chamber_1";
				weapons[]= {
					"M134_Minigun"
				};
				magazines[]= {
					"5000Rnd_762x51_Belt"
				};
				gunnerName="Crew Chief";
				gunnerOpticsModel="\A3\weapons_f\reticle\optics_empty";
				gunnerOutOpticsShowCursor=1;
				gunnerOpticsShowCursor=1;
				gunnerAction="gunner_standup01";
				gunnerInAction="gunner_standup01";
				gunnerForceOptics=1;
				commanding=-1;
				primaryGunner=1;
				outGunnerMayFire=1;
				class ViewOptics {
					initAngleX=0;
					minAngleX=-30;
					maxAngleX=30;
					initAngleY=0;
					minAngleY=-100;
					maxAngleY=100;
					initFov=0.69999999;
					minFov=0.25;
					maxFov=1.1;
				};
				gunnerCompartments="Compartment2";
				memoryPointsGetInGunner="pos gunner";
				memoryPointsGetInGunnerDir="pos gunner dir";
			};
			class RightDoorGun: MainTurret {
				isCopilot=0;
				body="Turret_2";
				gun="Gun_2";
				minElev=-60;
				maxElev=30;
				initElev=-30;
				minTurn=-173;
				maxTurn=3;
				initTurn=0;
				animationSourceBody="Turret_2";
				animationSourceGun="Gun_2";
				stabilizedInAxes="StabilizedInAxesNone";
				selectionFireAnim="zasleh_1";
				proxyIndex=2;
				weapons[]= {
					"M134_minigun"
				};
				magazines[]= {
					"5000Rnd_762x51_Belt"
				};
				gunnerOpticsModel="\A3\weapons_f\reticle\optics_empty";
				gunnerOutOpticsShowCursor=1;
				gunnerOpticsShowCursor=1;
				gunnerName="Door Gunner";
				commanding=-2;
				gunBeg="muzzle_2";
				gunEnd="chamber_2";
				primaryGunner=0;
				preciseGetInOut=1;
				memoryPointGun="machinegun_2";
				memoryPointGunnerOptics="gunnerview_2";
				gunnerCompartments="Compartment2";
				memoryPointsGetInGunner="pos gunner";
				memoryPointsGetInGunnerDir="pos gunner dir";
			};
			class CargoTurret01: CargoTurret { 									/// position for Firing from Vehicles
				gunnerAction 				= "passenger_inside_1";	/// generic animation for sitting inside with rifle ready
				gunnerCompartments 			= "Compartment3";		/// gunner is not able to switch seats
				memoryPointsGetInGunner 	= "pos cargo R";		/// specific memory points to allow choice of position
				memoryPointsGetInGunnerDir 	= "pos cargo R dir";	/// direction of get in action
				gunnerName 					= "Passenger (Rear door Right)";	/// name of the position in the Action menu
				proxyIndex 					= 12;					/// what cargo proxy is used according to index in the model
				maxElev 					= 15;					/// what is the highest possible elevation of the turret
				minElev 					= -25;					/// what is the lowest possible elevation of the turret
				maxTurn 					= 88;					/// what is the left-most possible turn of the turret
				minTurn 					= 35;					/// what is the right-most possible turn of the turret
				isPersonTurret 				= 1;					/// enables firing from vehicle functionality
				ejectDeadGunner 			= 0;					/// seatbelts included
				enabledByAnimationSource 	= "CargoDoor";				/// doesn't work unless the said animation source is 1
				class dynamicViewLimits{};
				class ViewOptics {
					initAngleX=0;
					minAngleX=-30;
					maxAngleX=30;
					initAngleY=0;
					minAngleY=-100;
					maxAngleY=100;
					initFov=0.69999999;
					minFov=0.25;
					maxFov=1.1;
				};
			};
			class CargoTurret02: CargoTurret01 { 						/// position for Firing from Vehicles
				gunnerAction 				= "passenger_inside_1";	/// generic animation for sitting inside with rifle ready
				gunnerCompartments 			= "Compartment3";		/// gunner is not able to switch seats
				memoryPointsGetInGunner 	= "pos cargo L";		/// specific memory points to allow choice of position
				memoryPointsGetInGunnerDir 	= "pos cargo L dir";	/// direction of get in action
				gunnerName 					= "Passenger (Rear door Left)";	/// name of the position in the Action menu
				proxyIndex 					= 20;					/// what cargo proxy is used according to index in the model
				maxElev 					= 15;					/// what is the highest possible elevation of the turret
				minElev 					= -25;					/// what is the lowest possible elevation of the turret
				maxTurn 					= -35;					/// what is the left-most possible turn of the turret
				minTurn 					= -88;					/// what is the right-most possible turn of the turret
				isPersonTurret 				= 1;					/// enables firing from vehicle functionality
				ejectDeadGunner 			= 0;					/// seatbelts included
				enabledByAnimationSource 	= "CargoDoor";				/// doesn't work unless the said animation source is 1
				class ViewOptics {
					initAngleX=0;
					minAngleX=-30;
					maxAngleX=30;
					initAngleY=0;
					minAngleY=-100;
					maxAngleY=100;
					initFov=0.69999999;
					minFov=0.25;
					maxFov=1.1;
				};
			};
		};
		class AnimationSources: AnimationSources {
			class Gatling_1	{
				source="revolving";
				weapon="M134_minigun";
			};
			class Gatling_2	{
				source="revolving";
				weapon="M134_minigun";
			};
			class CargoDoor	{
				source="user";
				animPeriod=5;
				initPhase=0;
			};
		};
		class UserActions {
			class OpenCargoDoor {
				displayName="Open Ramp";
				position="actions";  //was "crewactions"
				radius=15;
				showwindow=0;
				condition="this animationPhase ""Ramp"" == 0 and (alive this);"; //and player == driver this
				statement="this animate [""Ramp"", 1];";
				onlyforplayer=1;
			};
			class CloseCargoDoor {
				displayName="Close Ramp";
				position="actions";  //was "crewactions"
				radius=15;
				showwindow=0;
				condition="this animationPhase ""Ramp"" > 0 and (alive this);"; //and player == driver this
				statement="this animate [""Ramp"", 0];";
				onlyforplayer=1;
			};
		};
		/*hiddenSelectionsTextures[]=	{
			"\AAM_Air\Data\ch47_ext_1_co.paa",
			"\AAM_Air\Data\ch47_ext_2_co.paa"
		};*/
	};
	class ADF_CH_47F: CH_47F{
		author="Bohemia Interactive, CptDavo, Kimi, Gnrnr";
		side=1;
		scope=2;
		faction	= "AAM_ADF";
		displayName="ADF CH-47F Chinook";
	};
	class CH_47FWreck: HelicopterWreck {
		scope=1;
		class Armory { disabled=1; };
		model="AAM_Air\CH_47FWreck.p3d";
		typicalCargo[]={};
		irTarget=0;
		transportAmmo=0;
		transportRepair=0;
		transportFuel=0;
		transportSoldier=0;
		class Eventhandlers	{};
	};