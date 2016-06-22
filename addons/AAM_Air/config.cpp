//////////////////
//
//	ADF Helos by Gnrnr (AKA Gunnrunner)
//	Collaborators:
//		-Kimi
//		-87th_Neptune
//		-CptDavo
//		-LordJarhead
//		-Shadow_FO
//		-Monty
//		-Omega
//////////////////
#include "basicdefines_A3.hpp"
class CfgPatches {
	class AAM_Air {
		units[]= {"ADF_S70_E","ADF_S70_T"};
		weapons[]={};
		requiredVersion=0.0099999998;
		requiredAddons[]= {"AAM_Base","AAM_Units","A3_Air_F","A3_Weapons_F","CBA_Extended_EventHandlers","cba_main"};
	};
};
class CfgVehicles {
	class air;
	class Helicopter: Air {
		class Hitpoints;
		class Turrets {
			class Mainturret;
		};
	};
	class Helicopter_Base_F: Helicopter {
		class HitPoints: HitPoints {
			class HitHull;
			class HitFuel;
			class HitAvionics;
			class HitMissiles;
			class HitEngine;
			class HitHRotor;
			class HitVRotor;
			//class HitGlass1;
			//class HitGlass2;
			//class HitGlass3;
			//class HitGlass4;
			//class HitGlass5;
			//class HitGlass6;
		};
		class Turrets {
			class Mainturret;
		};
		class AnimationSources;
		class Eventhandlers;
		class ViewOptics;
		class ViewPilot;
	};
	class Helicopter_Base_H: Helicopter_Base_F {
		class Turrets: Turrets {
			class CopilotTurret;
		};
		class HitPoints: HitPoints {
			class HitHull;
			class HitFuel;
			class HitAvionics;
			class HitMissiles;
			class HitEngine;
			class HitHRotor;
			class HitVRotor;
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
			class HitGlass6;
		};
		class AnimationSources;
		class Eventhandlers;
		class Viewoptics;
		class ViewPilot;
		class Reflectors;
		class RotorLibHelicopterProperties;
	};
	class HelicopterWreck;
	class S70_base: Helicopter_Base_H //UH60 Base EVERYTHING
	{
		scope=0;
		model="\AAM_Air\UH60M.p3d";
		destrType="DestructWreck";
		picture="\AAM_Air\UI\Picture_uh60m_CA.paa";
		icon="\AAM_Air\UI\Icon_uh60m_CA.paa";
		mapSize=17;
		accuracy=1.5;
		faction = "AAM_ADF";
		vehicleClass="Air";

		//Crew Setup
		commanderCanSee="1 + 2 + 4 + 8 + 16";
		gunnerCanSee="1 + 2 + 4 + 8 + 16";
		driverCanSee="1 + 2 + 4 + 8 + 16";
		codriverCanSee="1 + 2 + 4 + 8 + 16";
		class MFD {};
		cargoCanEject=1;
		driverCanEject=0;
		helmetMountedDisplay=0;
		crew = "B_Helipilot_F";
		typicalCargo[]= { "B_Helipilot_F","B_Helipilot_F" };
		gunnerinAction="pilot_Heli_Transport_01";
		usePreciseGetInAction = 1;
		cargogetinaction[] = {"GetInHeli_Transport_01Cargo"};
		cargogetoutaction[] = {"GetOutLow"};
		getinaction = "ChopperLight_R_In_H";
		getoutaction = "GetOutLow";
		driverInAction="ChopperLight_R_In_H";
		driveraction = "pilot_Heli_Transport_01";
		cargoaction[] = {
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
			"passenger_mantisrear"
		};
		transportSoldier=12;
		memoryPointsGetInGunner="pos gunner";
		memoryPointsGetInGunnerDir="pos gunner dir";
		memoryPointsGetInCargo[]= {"pos cargo"};
		memoryPointsGetInCargoDir[]= {"pos cargo dir"};
		cargoIsCoDriver[]= {"False","false","False","false","False","false","False","false","False","false","False","false"};
		copilotHasFlares = 1;
		weapons[]= { "CMFlareLauncher" };
		magazines[]= { "168Rnd_CMFlare_Chaff_Magazine" };
		memoryPointCM[]= { "flare_launcher1","flare_launcher2" };
		memoryPointCMDir[]= { "flare_launcher1_dir","flare_launcher2_dir" };
		LockDetectionSystem="2 + 8 + 4";
		incomingMissileDetectionSystem = [0,16];
		radarType=4;

		//Helicopter Setup/ Physics etc
		selectionhrotormove = "velka vrtule blur";
		selectionhrotorstill = "velka vrtule staticka";
		selectionvrotormove = "mala vrtule blur";
		selectionvrotorstill = "mala vrtule staticka";
		fuelCapacity=600;
		maxSpeed=295;
		mainRotorSpeed=1.2;
		backRotorSpeed=6.0999999;
		maxMainRotorDive=7;
		minMainRotorDive=-7;
		neutralMainRotorDive=0;
		availableForSupportTypes[] = {"Drop","Transport"};
		threat[]={0.80000001,0.1,0.30000001};
		simulation="helicopterRTD";
		bodyFrictionCoef=0.89999998;
		liftForceCoef = 1.5;
		cyclicAsideForceCoef = 1;
		cyclicForwardForceCoef = 1;
		backRotorForceCoef = 1;
		driveOnComponent[] = {"Wheels"};
		class RotorLibHelicopterProperties: RotorLibHelicopterProperties {
			RTDconfig = "AAM_Air\RTD_UH60M.xml";
			autoHoverCorrection[] = {3,2.45,0};
			defaultCollective = 0.625;
			horizontalWingsAngleCollMax = 0;
			horizontalWingsAngleCollMin = 0;
			maxHorizontalStabilizerLeftStress = 10000;
			maxHorizontalStabilizerRightStress = 10000;
			maxMainRotorStress = 200000;
			maxTailRotorStress = 25000;
			maxTorque = 1100;
			maxVerticalStabilizerStress = 10000;
			retreatBladeStallWarningSpeed = 85.556;
			stressDamagePerSec = 0.0033333332;
		};
		// Sling
		maximumLoad = 10660;
		slingloadmaxcargomass = 4100;
		slingloadmemorypoint = "slingLoad0";
		slingloadoperator=0;
		class Turrets: Turrets {
			class CopilotTurret: CopilotTurret {
				caneject = 0;
				isCopilot=1;
				gunneraction = "pilot_Heli_Transport_01"; //"Chopperlight_R_Static_H";
				gunnergetinaction = "Chopperlight_R_In_H";
				gunnergetoutaction = "GetOutLow";
				gunnerinaction = "pilot_Heli_Transport_01";//"Chopperlight_R_Static_H";
				magazines[] = {};
				memoryPointsGetInCargo = "pos copilot";				/// what is the position of get in action
				memoryPointsGetInCargoDir = "pos copilot dir";		/// what is the direction of get in action
				memorypointsgetingunnerprecise = "GetIn_Turret";
				precisegetinout = 0;
				proxyIndex=3;
				weapons[] = {};
			};
			class MainTurret: MainTurret
			{
				CanEject = 1;
				isCopilot = 0;
				body = "mainTurret";
				gun = "mainGun";
				gunnerType = "B_helicrew_F";
				minElev = -50;
				maxElev = 5;
				initElev = "--15";
				minTurn = 15;
				maxTurn = 160;
				initTurn = 90;
				animationSourceHatch = "";
				animationSourceBody = "mainTurret";
				animationSourceGun = "mainGun";
				stabilizedInAxes = 0;
				gunBeg = "muzzle_1";
				gunEnd = "chamber_1";
				gunnerName = "Crew Chief";
				gunnerOutOpticsShowCursor = 1;
				gunnerOpticsShowCursor = 0; //1
				memoryPointGunnerOptics = "gunnerview";
				gunnerAction = "gunner_Heli_Transport_01";
				gunnerInAction = "gunner_Heli_Transport_01";
				gunnerOpticsModel="\A3\weapons_f\reticle\optics_empty";
				weapons[] = {"ADF_MAG58"};//{"LMG_Minigun_Transport"};
				magazines[] = {
								"ADF_100Rnd_762x51_Tracer",
								"ADF_100Rnd_762x51_Tracer",
								"ADF_100Rnd_762x51_Tracer",
								"ADF_100Rnd_762x51_Tracer",
								"ADF_100Rnd_762x51_Tracer",
								"ADF_100Rnd_762x51_Tracer",
								"ADF_100Rnd_762x51_Tracer",
								"ADF_100Rnd_762x51_Tracer",
								"ADF_100Rnd_762x51_Tracer",
								"ADF_100Rnd_762x51_Tracer"
								};//{"2000Rnd_65x39_Belt_Tracer_Red"};
				commanding = -2;
				primaryGunner = 1;
				class ViewOptics {
					initAngleX = 0;
					minAngleX = -30;
					maxAngleX = 30;
					initAngleY = 0;
					minAngleY = -100;
					maxAngleY = 100;
					minFov = 0.25;
					maxFov = 1.25;
					initFov = 0.75;
				};
				gunnerCompartments = "Compartment2";
				memoryPointsGetInGunner = "pos gunner_l";
				memoryPointsGetInGunnerDir = "pos gunner_dir_l";
				proxyIndex = 1;
				LODTurnedIn = 1000;
				LODTurnedOut = 1000;
				gunnerLeftHandAnimName = "";
				gunnerRightHandAnimName = "";
				castGunnerShadow = 1;
				viewGunnerShadow = 1;
				gunnerDoor = "";
				playerPosition = 3;
				soundAttenuationTurret = "HeliAttenuationGunner";
				disableSoundAttenuation = 0;
			};
			class RightDoorGun: MainTurret
			{
				minTurn = -160;
				maxTurn = -15;
				initTurn = -90;
				body = "Turret_2";
				gun = "Gun_2";
				animationSourceBody = "Turret_2";
				animationSourceGun = "Gun_2";
				selectionFireAnim = "zasleh_1";
				proxyIndex = 2;
				gunnerName = "Door Gunner";
				weapons[] = {"ADF_MAG58"};//{"LMG_Minigun_Transport2"};
				commanding = -3;
				gunBeg = "muzzle_2";
				gunEnd = "chamber_2";
				primaryGunner = 0;
				memoryPointGun="machinegun_1";
				memoryPointGunnerOptics = "gunnerview_2";
				gunnerCompartments = "Compartment2";
				memoryPointsGetInGunner = "pos gunner_r";
				memoryPointsGetInGunnerDir = "pos gunner_dir_r";
				gunnerDoor = "";
				turretCanSee = "1 + 2 + 4 + 8 + 16";
			};


			/*class CargoTurret_01: CargoTurret 						/// position for Firing from Vehicles
			{
				gunnerAction 				= "passenger_inside_1";	/// generic animation for sitting inside with rifle ready
				gunnerCompartments 			= "Compartment2";		/// gunner is not able to switch seats
				memoryPointsGetInGunner 	= "pos cargo L";		/// specific memory points to allow choice of position
				memoryPointsGetInGunnerDir 	= "pos cargo L dir";	/// direction of get in action
				gunnerName 					= "Passenger (left door)";	/// name of the position in the Action menu
				proxyIndex 					= 8;					/// what cargo proxy is used according to index in the model
				maxElev 					= 15;					/// what is the highest possible elevation of the turret
				minElev 					= -25;					/// what is the lowest possible elevation of the turret
				maxTurn 					= 45;					/// what is the left-most possible turn of the turret
				minTurn 					= -15;					/// what is the right-most possible turn of the turret
				isPersonTurret 				= 1;					/// enables firing from vehicle functionality
				ejectDeadGunner 			= 0;					/// seatbelts included
				enabledByAnimationSource 	= "Doors";				/// doesn't work unless the said animation source is 1
			};*/
		};
		///// CARGO
			class TransportBackpacks {
				class _xx_B_Parachute {
					backpack="B_Parachute";
					count=8;
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
					count=6;
				};
			};
			class TransportWeapons {
				class _xx_arifle_MXC_F {
					weapon="arifle_MXC_F";
					count=2;
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
			};
		///// END CARGO
		#include "soundsUH60.hpp"
		class Exhausts {
			class Exhaust1 {
				position="exhaust1";
				direction="exhaust1_dir";
				effect="ExhaustsEffectHeliCom";
			};
			class Exhaust2 {
				position="exhaust2";
				direction="exhaust2_dir";
				effect="ExhaustsEffectHeliCom";
			};
		};
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
				position="L svetlo";
				direction="konec L svetla";
				hitpoint="L svetlo";
				selection="L svetlo";
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
		//https://community.bistudio.com/wiki/Config_Properties_Megalist#class_HitPoints
		armor = 60;
		damageResistance = 0.00555;
		class HitPoints: HitPoints {
			class HitHull: Hithull {
				armor = 1; //999
				//depends = "Total";
				//material = 51;
				minimalHit = 0.05;
				name = "hitbody"; //trup Hitpoints LOD verts
				visual = "hitbody"; //trup
				passThrough = 1;
				//radius = 0.01;
			};
			class HitFuel: HitFuel {
				armor = 0.7;
				radius = 0.25;
				minimalHit = 0.05;
				explosionShielding = 2;
			};
			class HitEngine: HitEngine {
				armor = 0.7;
				explosionShielding = 3;
				minimalHit = 0.1;
				//material = 51;
				name = "hitengine";
				visual = "hitengine";
				passThrough = 1;
			};
			class HitVRotor: HitVRotor {
				armor = 1.3;
				//material = 51;
				minimalHit = 0.05;
				name = "mala vrtule";
				visual = "mala vrtule staticka";
				passThrough = 0.3;
				explosionShielding = 6;
			};
			class HitHRotor: HitHRotor {
				armor = 2.6;
				//material = 51;
				name = "velka vrtule";
				visual = "velka vrtule staticka";
				passThrough = 0.1;
				minimalHit = 0.09;
				explosionShielding = 2.5;
			};
			class HitGlass1 {
				armor = 1.3;
				material = -1;
				name = "glass1";
				visual = "glass1";
				passThrough = 0;
				explosionShielding = 6;
			};
			class HitGlass2 {
				armor = 1.2;
				material = -1;
				name = "glass2";
				visual = "glass2";
				passThrough = 0;
				explosionShielding = 6;
			};
			class HitGlass3 {
				armor = 1.2;
				material = -1;
				name = "glass3";
				visual = "glass3";
				passThrough = 0;
				explosionShielding = 6;
			};
			class HitGlass4 {
				armor = 1.2;
				material = -1;
				name = "glass4";
				visual = "glass4";
				passThrough = 0;
				explosionShielding = 6;
			};
			/*class door_l {
				armor = 1;
				material = 50;
				minimalHit = 0.05;
				name = "door_l";
				visual = "door_l";
				passThrough = 0;
				radius = 0.1;
			};
			class door_r {
				armor = 1; //999
				material = -1;
				minimalHit = 0.05;
				name = "door_r";
				visual = "door_r";
				passThrough = 1;
				//radius = 0.01;
			};
			class Glassld {
				armor = 1.2;
				material = 50;
				name = "glassld";
				visual = "glassld";
				passThrough = 0;
				explosionShielding = 6;
				radius = 0.283;
			};
			class Glassrd {
				armor = 1.2;
				material = -1;
				name = "glassrd";
				visual = "glassrd";
				passThrough = 0;
				explosionShielding = 6;
			};*/
			//Landing gear
		};
		class Damage {
			tex[]={};
			mat[]= {
				"AAM_Air\data\uh60m_dust_filter.rvmat",
				"AAM_Air\data\uh60m_dust_filter_damage.rvmat",
				"AAM_Air\data\uh60m_dust_filter_destruct.rvmat",

				"AAM_Air\data\uh60m_engine.rvmat",
				"AAM_Air\data\uh60m_engine_damage.rvmat",
				"AAM_Air\data\uh60m_engine_destruct.rvmat",

				"AAM_Air\data\uh60m_fuselage.rvmat",
				"AAM_Air\data\uh60m_fuselage_damage.rvmat",
				"AAM_Air\data\uh60m_fuselage_destruct.rvmat",

				"AAM_Air\data\uh60m_interior.rvmat",
				"AAM_Air\data\uh60m_interior_damage.rvmat",
				"AAM_Air\data\uh60m_interior_destruct.rvmat",

				"AAM_Air\data\uh60m_navijak.rvmat",
				"AAM_Air\data\uh60m_navijak_damage.rvmat",
				"AAM_Air\data\uh60m_navijak_destruct.rvmat",

				"AAM_Air\data\uh60m_glass.rvmat",
				"AAM_Air\data\uh60m_glass_damage.rvmat",
				"AAM_Air\data\uh60m_glass_damage.rvmat",

				"AAM_Air\data\default.rvmat",
				"AAM_Air\data\default_destruct.rvmat",
				"AAM_Air\data\default_destruct.rvmat", // Destroyed state ?  or hidden

				"AAM_Air\data\uh60m_engine_MEV.rvmat",
				"AAM_Air\data\uh60m_engine_MEV_damage.rvmat",
				"AAM_Air\data\uh60m_engine_MEV_destruct.rvmat",

				"AAM_Air\data\uh60m_fuselage_MEV.rvmat",
				"AAM_Air\data\uh60m_fuselage_MEV_damage.rvmat",
				"AAM_Air\data\uh60m_fuselage_MEV_destruct.rvmat",

				"AAM_Air\data\default.rvmat",
				"AAM_Air\data\default.rvmat",
				"AAM_Air\data\default_destruct.rvmat"
			};
		};
		class UserActions
		{
			class DoorL1_Open
			{
				displayName = "Close Left Door";
				radius = 2.5;
				radiusView = 0.2;
				//available = 4;
				priority = 0.5;
				position = "door_l";
				showWindow = 0;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "((this animationPhase 'door_L') == 0) AND Alive(this)";
				statement = "this animate ['door_L', 1]";
			};
			class DoorR1_Open: DoorL1_Open
			{
				displayName = "Close Right Door";
				position = "door_r";
				condition = "((this animationPhase 'door_R') == 0) AND Alive(this)";
				statement = "this animate ['door_R', 1]";
			};
			class DoorL1_Close: DoorL1_Open
			{
				displayName = "Open Left Door";
				condition = "((this animationPhase 'door_L') > 0) AND Alive(this)";
				statement = "this animate ['door_L', 0]";
			};
			class DoorR1_Close: DoorL1_Close
			{
				userActionID = 54;
				displayName = "Open Right Door";
				position = "door_R";
				condition = "((this animationPhase 'door_R') > 0) AND Alive(this)";
				statement = "this animate ['door_R', 0]";
			};
			/*class Door_Open
			{
				userActionID 		= 60;				/// ID for some scripts
				displayName 		= "Open door";		/// what is displayed in action menu
				displayNameDefault 	= "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />"; /// what is displayed under the cursor (icon in this case)
				position 			= "";				/// start of radius where action is available
				condition 			= "this doorPhase ""Doors"" < 0.5 AND Alive(this) AND (player in crew this)"; /// only openable from inside and when closed
				statement 			= "this animateDoor ['Doors', 1]";	/// sets animation source Doors to 1 via interpolation
				priority 			= 1.5;				/// higher priority means higher in the Action menu
				radius 				= 1.5;				/// how far from position is the action available
				showWindow 			= 0;				/// 0 means that it is not a default action when entering the vehicle
				onlyForPlayer 		= 1;				/// AI doesn't use this one
				shortcut 			= "";				/// there's no shortcut for this action
			};

			class Door_Close: Door_Open
			{
				userActionID 		= 61;
				displayName 		= "Close door";
				textToolTip 		= "Close door";
				condition	 		= "this doorPhase ""Doors"" > 0.5 AND Alive(this) AND (player in crew this)";
				statement 			= "this animateDoor ['Doors', 0]";
			};*/
		};
		class AnimationSources: AnimationSources {
			/*class Doors				/// the class name is later used in model.cfg
			{
				source = door;		/// door source means it is used by animateDoor script command
				animPeriod = 1;		/// how long does it take to change value from 0 to 1 (or vice versa)
				initPhase = 0;		/// what value does it have while creating the vehicle
			};*/
			class Door_L
			{
				source = "user";//door ?
				animPeriod = 1.6;
			};
			class Door_R
			{
				source = "user";//door ?
				animPeriod = 1.6;
			};
		};
	};

	class ADF_S70: S70_Base { // Weapons, No ESSSx
		scope= public;
		scopeCurator = public;
		forceInGarage=1;
		dlc = "AAM";
		author="BI, CptDavo, Kimi, Gnrnr, Monty, Omega";
		side= 1;
		faction	= "AAM_ADF";
		displayName="S-70A-9 Black Hawk (T-A)";
		class Library { libTextDesc="S-70A-9 Armed"; };
		accuracy = 1.50;
		fuelCapacity=1000;
		class Turrets: Turrets {
			class CopilotTurret: CopilotTurret {};
			class MainTurret: MainTurret {};
			class RightDoorGun: RightdoorGun {};//MainTurret {};
		};
		class AnimationSources: AnimationSources {
			class HideEsssx //HIDE 1, SHOW 0
			{
				source = "user";
				animPeriod = 0.1;
				initPhase = 1;
			};
			class Door_L: Door_L
			{
				initPhase= 0;
			};
			class Door_R: Door_R
			{
				initPhase= 0;
			};
			class Hideweapons // Hide 1, Show 0
			{
				source = "user";
				animPeriod = 0.1;
				initPhase = 0;
			};
			class hidewindows // Hide 1, Show 0
			{
				source = "user";
				animPeriod = 0.1;
				initphase = 1;
			};
			cost = 900000;	/// we need some high cost for such vehicles to be prioritized by AA defences
		};
	};
	class ADF_S70_T: S70_Base { // no weapons, No Esssx
		scope= public;
		scopeCurator = public;
		forceInGarage=1;
		dlc = "AAM";
		author="BI, CptDavo, Kimi, Gnrnr, Monty, Omega";
		side= 1;
		faction	= "AAM_ADF";
		displayName="S-70A-9 Black Hawk (T)";
		class Library { libTextDesc="S-70A-9 Un-Armed Transport"; };
		accuracy = 1.50;
		fuelCapacity=1000;
		class Turrets: Turrets {
			class CopilotTurret: CopilotTurret {};
		};
		class AnimationSources: AnimationSources {
			class Hideweapons // Hide 1, Show 0
			{
				source = "user";
				animPeriod = 0.1;
				initPhase = 1;
			};
			class HideEsssx //HIDE 1, SHOW 0
			{
				source = "user";
				animPeriod = 0.1;
				initPhase = 1;
			};
			class Door_L: Door_L
			{
				initPhase= 1;
			};
			class Door_R: Door_R
			{
				initPhase= 1;
			};
			class hidewind_f //HIDE 1, SHOW 0
			{
				source = "user";
				animPeriod = 0.1;
				initphase=0;
			};

			cost = 900000;	/// we need some high cost for such vehicles to be prioritized by AA defences
		};
	};
	class ADF_S70_E: S70_base { // no weapons, ESSSX
		scope= public;
		scopeCurator = public;
		forceInGarage=1;
		dlc = "AAM";
		author="BIe, CptDavo, Kimi, Gnrnr, Monty, Omega";
		side= 1;
		faction	= "AAM_ADF";
		displayName="S-70A-9 Black Hawk (LR)";
		class Library { libTextDesc="S-70A-9 Unarmed w/ Esssx pylons and external fuel Tanks"; };
		accuracy = 1.50;
		fuelCapacity=1000;
		class Turrets: Turrets {
			class CopilotTurret: CopilotTurret {};
		};
		class AnimationSources: AnimationSources {
			class Hideweapons // Hide 1, Show 0
			{
				source = "user";
				animPeriod = 0.1;
				initPhase = 1;
			};
			class HideEsssx //HIDE 1, SHOW 0
			{
				source = "user";
				animPeriod = 0.1;
				initPhase = 0;
			};
			class Door_L: Door_L
			{
				initPhase= 1;
			};
			class Door_R: Door_R
			{
				initPhase= 1;
			};
			class hidewind_f
			{
				source = "user";
				animPeriod = 0.1;
				initphase=0;
			};
			cost = 900000;	/// we need some high cost for such vehicles to be prioritized by AA defences
		};
	};

	class UH60MWreck: HelicopterWreck {
		dlc = "AAM";
		scope=1;
		class Armory {
			disabled=1;
		};
		model="AAM_Air\MH_60Wreck.p3d";
		typicalCargo[]={};
		irTarget=0;
		transportAmmo=0;
		transportRepair=0;
		transportFuel=0;
		transportSoldier=0;
		class Eventhandlers	{};
	};
};