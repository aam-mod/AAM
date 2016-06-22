class CfgPatches {
	class AAM_Units {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Characters_F_BLUFOR","CBA_Extended_EventHandlers","cba_main","AAM_Base","AAM_Weapons"};
		author = "AAF";
		projectName = "AAMs ADF units";
	};
};
class CfgGroups
{
	class West
	{
		#include "AAM_grp.hpp"
	};
};
class CfgVehicles {
	class Man;
	class B_Soldier_base_F;
	//Base Soldier
	class ADF_Soldier_AMCU : B_Soldier_base_F {
		author = "AAF";
		_generalMacro = "ADF_Soldier_AMCU"; //unsure what this does
		side = 1;
		scope = 1;
		faction = AAM_ADF;
		vehicleClass = Men;
		displayName = "ADF Rifleman";
		nakedUniform = "U_BasicBody";
		uniformClass = "adf_CombatUniform_amcu"; //the uniform item
		hiddenSelections[] = {"Camo"};
		hiddenSelectionsTextures[] = {"\AAM_units\data\uniform_amp_co.paa"};
		accuracy = 2.3;	//2.3 accuracy needed to recognize type of this target
		camouflage = 0.5;	//1.4 old - how dificult to spot - bigger - better spotable
		};
	class ADF_Soldier_ACMU_Tee: B_Soldier_base_F {
		author = "AAF";
		_generalMacro = "ADF_Soldier_ACMU_Tee";
		side = 1;
		scope = 1;
		faction = AAM_ADF;
		vehicleclass = Men;
		displayName = "ADF Rifleman T";
		nakedUniform = "U_BasicBody";
		uniformClass = "ADF_CombatUniform_acmu_Tee";
		hiddenSelections[] = {"Camo"};
		hiddenSelectionsTextures[] = {"\AAM_units\data\uniform_amp_co.paa"};
		model = "\A3\characters_F\BLUFOR\b_soldier_02.p3d";
		camouflage = 0.5;
		};
	//class ADF_AMCU_STL
	//class ADF_AMCU_SCO
	//class ADF_AMCU_GL
	//class ADF_AMCU_AT
	//class ADF_AMCU_LSW
	class ADF_AMCU_DM: ADF_Soldier_AMCU {
		scope = 2;
		displayname = "ADF Marksman";
		linkeditems[] = {"ADF_PlateCarrier_R","ADF_Helmet_ECH","Nato_NVG","ItemMap","ItemCompass","ItemWatch","ItemRadio","NVGoggles" };
		respawnLinkedItems[] = {"ADF_PlateCarrier_R","ADF_Helmet_ECH","Nato_NVG","ItemMap","ItemCompass","ItemWatch","ItemRadio","NVGoggles" };
		weapons[] = {"ADF_SteyrF90","Throw","Put"};
		respawnweapons[] = {"ADF_SteyrF90","Throw","Put"};
		magazines[]={};
		//backpack = "rhsusf_assault_eagleaiii_ucp";
		};


	//class ADF_AMCU_SAP
};
class cfgWeapons {
	class Uniform_Base;
	class UniformItem;
	class U_B_CombatUniform_mcam_tshirt;
	class adf_CombatUniform_amcu : Uniform_Base {
		author = "AAF";
		scope = 2;
		displayName = "ADF uniform (AMCU)";
		picture = "\A3\characters_f\data\ui\icon_U_B_CombatUniform_mcam_ca.paa";
		model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver";
		class ItemInfo : UniformItem {
			armor = "5*0.5";
			passThrough = 0.1;
			uniformModel = "-";
			uniformClass = "ADF_Soldier_AMCU";
			containerClass = "Supply50";
			mass = 5;
		};
	};
	class adf_Sotg_ACam_amcu : adf_CombatUniform_amcu { displayName = "ADF Sotg Ghost uniform"; };
	class ADF_CombatUniform_acmu_Tee: U_B_CombatUniform_mcam_tshirt {
		author = "AAF";
		scope = 2;
		displayName = "ADF uniform (AMCU) Tee";
		picture = "\A3\characters_f\data\ui\icon_U_B_CombatUniform_mcam_ca.paa";
		model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver";
		class ItemInfo: UniformItem {
			armor = "5*0.5";
			passThrough = 0.1;
			uniformModel = "-";
			uniformClass = "ADF_Soldier_ACMU_Tee";
			containerClass = "Supply50";
			mass = 5;
		};
	};
	class ItemCore;
	class ItemInfo;
	class HeadgearItem;
	class ADF_Helmet_ECH : ItemCore {
		author = "AAF";
		scope = 2;
		weaponPoolAvailable = 1;
		displayName = "ADF ECH AMCU";
		picture = "\A3\characters_f\Data\UI\icon_H_HelmetB_CA.paa";
		model = "\A3\Characters_F\BLUFOR\headgear_b_helmet_ballistic";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\AAM_units\data\equip1_amp_co.paa"};
		class ItemInfo : HeadGearItem {
			mass = 50;
			uniformModel = "\A3\Characters_F\BLUFOR\headgear_b_helmet_ballistic";
			modelSides[] = {3, 1};
			armor = 7;
			passThrough = 0.1;
			hiddenSelections[] = {"camo"};
		};
	};
	class ADF_Helmet_ECH_Light : ItemCore {
		author = "AAF";
		scope = 2;
		weaponPoolAvailable = 1;
		displayName = "ADF ECH AMCU Light";
		picture = "\A3\characters_f\Data\UI\icon_H_HelmetB_CA.paa";
		model = "\A3\Characters_F\BLUFOR\headgear_b_helmet_light";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\AAM_units\data\equip1_amp_co.paa"};
		class ItemInfo : HeadGearItem {
			mass = 50;
			uniformModel = "\A3\Characters_F\BLUFOR\headgear_b_helmet_light";
			modelSides[] = {3, 1};
			armor = 5;
			passThrough = 0.1;
			hiddenSelections[] = {"camo"};
		};
	};
	class H_HelmetB;
	class VestItem;
	class V_PlateCarrier1_rgr;
	class V_PlateCarrier3_rgr;
	class ADF_PlateCarrier_R : V_PlateCarrier3_rgr {
		author = "AAF";
		displayName = "ADF Carrier Rig (AMCU)";
		model = "\A3\Characters_F\BLUFOR\equip_b_vest01.p3d";
		picture = "\A3\characters_f\Data\UI\icon_V_plate_carrier_2_CA.paa";
		scope = 2;
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\AAM_units\data\vests_amp_co.paa"};
		class ItemInfo : VestItem {
			armor = 40;
			passThrough = 0.1;
			containerClass = "Supply140";
			mass = 50;
			uniformModel = "\A3\Characters_F\BLUFOR\equip_b_vest01";
			hiddenSelections[] = {"camo"};
		};
	};
	class ADF_PlateCarrier_Lite : V_PlateCarrier1_rgr {
		author = "AAF";
		displayName = "ADF Plate Carrier (AMCU)";
		model = "\A3\Characters_F\BLUFOR\equip_b_vest02.p3d";
		picture = "\A3\characters_f\Data\UI\icon_V_plate_carrier_1_CA.paa";
		scope = 2;
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\AAM_units\data\vests_amp_co.paa"};
		class ItemInfo : VestItem {
			armor = 20;
			passThrough = 0.1;
			containerClass = "Supply140";
			mass = 30;
			uniformModel = "\A3\Characters_F\BLUFOR\equip_b_vest02";
			hiddenSelections[] = {"camo"};
		};
	};
};
class Extended_PreInit_EventHandlers {
	//A.CM action
	sotg_ghost_init = "[] execVM '\AAM_units\AAMunitsinit.sqf'";
};
//==========================================================================================================
	/*
	class ADF_SAS_Beret : H_HelmetB {
		displayName = "ADF SAS Beret";
		picture = "\A3\characters_f\Data\UI\icon_H_Beret_blk_CA.paa";
		hiddenSelectionsTextures[] = {"\AAM_units\data\sas_beret_co.paa"};
		model = "\A3\characters_f_epb\BLUFOR\headgear_beret02";
		class ItemInfo : ItemInfo {
			mass = 6;
			allowedSlots[] = {801, 901, 701, 605};
			uniformModel = "\A3\characters_f_epb\BLUFOR\headgear_beret02";
			modelSides[] = {6};
			armor = 0;
			passThrough = true;
		};  };
	class ADF_CDO_Beret : H_HelmetB {
		displayName = "ADF 2 Commando Beret";
		picture = "\A3\characters_f\Data\UI\icon_H_Beret_blk_CA.paa";
		hiddenSelectionsTextures[] = {"\AAM_units\data\2commando_beret_co.paa"};
		model = "\A3\characters_f_epb\BLUFOR\headgear_beret02";
		class ItemInfo : ItemInfo {
			mass = 6;
			allowedSlots[] = {801, 901, 701, 605};
			uniformModel = "\A3\characters_f_epb\BLUFOR\headgear_beret02";
			modelSides[] = {6};
			armor = 0;
			passThrough = true;
		};  };
	HATS, Currently buggered ....
		class SOTG_Cap_Combo: ItemCore {
		author = "AAF";
		scope = 2;
		weaponPoolAvailable = 1;
		displayName = "ADF SOTG Cap Combo (MC)";
		//picture = ".paa";
		model = "\AAM_units\cap_patch.p3d";
		hiddenSelections[] = {"camo1", "camo2"};
		hiddenSelectionsTextures[] = {"\AAM_units\data\capb_au_mc_co.paa", "\AAM_units\data\Flagpatch_combination_flag_co.paa"};
		class ItemInfo: HeadgearItem {
			mass = 3;
			uniformModel = "\AAM_units\cap_patch.p3d";
			modelSides[] = {6};
			armor = 0;
			passThrough = 1;
			allowedSlots[] = {801,901,701,605};
			hiddenSelections[] = {"camo1","camo2"};
			hiddenSelectionsTextures[] = {"\AAM_units\data\capb_au_mc_co.paa","\AAM_units\data\Flagpatch_combination_flag_co.paa"};
		};
		};
		class SOTG_Cap_AU: ItemCore {
		author = "AAAF";
		scope = 2;
		weaponPoolAvailable = 1;
		displayName = "ADF SOTG Cap (MC)";
		//picture = ".paa";
		model = "\AAM_units\cap_patch.p3d";
		hiddenSelections[] = {"camo1","camo2"};
		hiddenSelectionsTextures[] = {"\AAM_units\data\capb_au_mc_co.paa","\AAM_units\data\Flagpatch_au_co.paa"};
		class ItemInfo: HeadgearItem {
			mass = 3;
			modelSides[] = {6};
			armor = 0;
			passThrough = 1;
			allowedSlots[] = {801,901,701,605};
			hiddenSelections[] = {"camo1","camo2"};
		};
		};
		class SOTG_Cap_Delta: ItemCore {
		scope = 2;
		weaponPoolAvailable = 1;
		displayName = "ADF SOTG Cap Delta (MC)";
		//Picture = "*.paa";
		model = "\AAM_units\cap_patch.p3d";
		hiddenSelections[] = {"camo1","camo2"};
		hiddenSelectionsTextures[] = {"\AAM_units\data\capb_au_mc_co.paa","\AAM_units\data\Flagpatch_delta_squadron_co.paa"};
		class ItemInfo: HeadgearItem {
			mass = 3;
			uniformModel = "\AAM_units\cap_patch.p3d";
			hiddenSelections[] = {"camo1","camo2"};
			allowedSlots[] = {801,901,701,605};
			modelSides[] = {6};
			armor = 0;
			passThrough = 1;
		};
		};
		class SOTG_Cap_Echo: ItemCore {
			scope = 2;
			weaponPoolAvailable = 1;
			displayName = "ADF SOTG Cap Echo (MC)";
			model = "\AAM_units\cap_patch.p3d";
			hiddenSelections[] = {"camo1","camo2"};
			hiddenSelectionsTextures[] = {"\AAM_units\data\capb_au_mc_co.paa","\AAM_units\data\Flagpatch_e_squadron_co.paa"};
			class ItemInfo: HeadgearItem {
				mass = 3;
				uniformModel = "\AAM_units\cap_patch.p3d";
				//hiddenSelections[] = {"camo1","camo2"};
				allowedSlots[] = {801,901,701,605};
				modelSides[] = {6};
				armor = 0;
				passThrough = 1;
			};
		};
		class SOTG_Cap_TF66: ItemCore {
		scope = 2;
		weaponPoolAvailable = 1;
		displayName = "ADF SOTG Cap TF66 (MC)";
		model = "\AAM_units\cap_patch.p3d";
		hiddenSelections[] = {"camo1","camo2"};
		hiddenSelectionsTextures[] = {"\AAM_units\data\capb_au_mc_co.paa","\AAM_units\data\Flagpatch_sotg_co.paa"};
		class ItemInfo: HeadgearItem {
			mass = 3;
			uniformModel = "\AAM_units\cap_patch.p3d";
			//hiddenSelections[] = {"camo1","camo2"};
			allowedSlots[] = {801,901,701,605};
			modelSides[] = {6};
			armor = 0;
			passThrough = 1;
		};
		};
		class SOTG_Cap_Combo_D: ItemCore {
		scope = 2;
		weaponPoolAvailable = 1;
		displayName = "ADF SOTG Cap Combo (Desert)";
		model = "\AAM_units\cap_patch.p3d";
		hiddenSelections[] = {"camo1","camo2"};
		hiddenSelectionsTextures[] = {"\AAM_units\data\capb_au_desert_co.paa","\AAM_units\data\Flagpatch_combination_flag_co.paa"};
		class ItemInfo: HeadgearItem {
			mass = 3;
			uniformModel = "\AAM_units\cap_patch.p3d";
			//hiddenSelections[] = {"camo1","camo2"};
			allowedSlots[] = {801,901,701,605};
			modelSides[] = {6};
			armor = 0;
			passThrough = 1;
		};
		};
		class SOTG_Cap_AU_D: ItemCore {
		scope = 2;
		weaponPoolAvailable = 1;
		displayName = "ADF SOTG Cap (Desert)";
		model = "\AAM_units\cap_patch.p3d";
		hiddenSelections[] = {"camo1","camo2"};
		hiddenSelectionsTextures[] = {"\AAM_units\data\capb_au_desert_co.paa","\AAM_units\data\Flagpatch_au_co.paa"};
		class ItemInfo: HeadgearItem {
			mass = 3;
			uniformModel = "\AAM_units\cap_patch.p3d";
			//hiddenSelections[] = {"camo1","camo2"};
			allowedSlots[] = {801,901,701,605};
			modelSides[] = {6};
			armor = 0;
			passThrough = 1;
		};
		};
		class SOTG_Cap_Delta_D: ItemCore {
		scope = 2;
		weaponPoolAvailable = 1;
		displayName = "ADF SOTG Cap Delta (Desert)";
		model = "\AAM_units\cap_patch.p3d";
		hiddenSelections[] = {"camo1","camo2"};
		hiddenSelectionsTextures[] = {"\AAM_units\data\capb_au_desert_co.paa","\AAM_units\data\Flagpatch_delta_squadron_co.paa"};
		class ItemInfo: HeadgearItem {
			mass = 3;
			uniformModel = "\AAM_units\cap_patch.p3d";
			//hiddenSelections[] = {"camo1","camo2"};
			allowedSlots[] = {801,901,701,605};
			modelSides[] = {6};
			armor = 0;
			passThrough = 1;
		};
		};
		class SOTG_Cap_Echo_D: ItemCore {
		scope = 2;
		weaponPoolAvailable = 1;
		displayName = "ADF SOTG Cap Echo (Desert)";
		model = "\AAM_units\cap_patch.p3d";
		hiddenSelections[] = {"camo1","camo2"};
		hiddenSelectionsTextures[] = {"\AAM_units\data\capb_au_desert_co.paa","\AAM_units\data\Flagpatch_e_squadron_co.paa"};
		class ItemInfo: HeadgearItem {
			mass = 3;
			uniformModel = "\AAM_units\cap_patch.p3d";
			//hiddenSelections[] = {"camo1","camo2"};
			allowedSlots[] = {801,901,701,605};
			modelSides[] = {6};
			armor = 0;
			passThrough = 1;
		};
		};
		class SOTG_Cap_TF66_D: ItemCore {
		scope = 2;
		weaponPoolAvailable = 1;
		displayName = "ADF SOTG Cap TF66 (Desert)";
		model = "\AAM_units\cap_patch.p3d";
		hiddenSelections[] = {"camo1","camo2"};
		hiddenSelectionsTextures[] = {"\AAM_units\data\capb_au_desert_co.paa","\AAM_units\data\Flagpatch_sotg_co.paa"};
		class ItemInfo: HeadgearItem {
			mass = 3;
			uniformModel = "\AAM_units\cap_patch.p3d";
			//hiddenSelections[] = {"camo1","camo2"};
			allowedSlots[] = {801,901,701,605};
			modelSides[] = {6};
			armor = 0;
			passThrough = 1;
		};
		};
	class ADF_MICH_2001 : ItemCore {
		author = "AAF";
		scope = 2;
		weaponPoolAvailable = 1;
		displayName = "ADF MICH 2001";
		picture = "\A3\characters_f\Data\UI\icon_H_HelmetB_CA.paa";
		model = "\AAM_units\mich2001";
		class ItemInfo : HeadgearItem {
			mass = 50;
			uniformModel = "AAM_units\mich2001";
			modelSides[] = {3, 1};
			armor = 7;
			passThrough = 0.01;
		};  };
		*/