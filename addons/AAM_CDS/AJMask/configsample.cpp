enum {
     //  = 2,    // Error parsing: Empty enum name
    DESTRUCTENGINE = 2,
    DESTRUCTDEFAULT = 6,
    DESTRUCTWRECK = 7,
    DESTRUCTTREE = 3,
    DESTRUCTTENT = 4,
    STABILIZEDINAXISX = 1,
    STABILIZEDINAXESXYZ = 4,
    STABILIZEDINAXISY = 2,
    STABILIZEDINAXESBOTH = 3,
    DESTRUCTNO = 0,
    STABILIZEDINAXESNONE = 0,
    DESTRUCTMAN = 5,
    DESTRUCTBUILDING = 1,
};

class CfgPatches {
    class Zee_Glasses {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {"A3_Characters_F_BLUFOR"};
    };
};

class CfgWeapons {
	class NVGoggles;

class AJ_Mask_Tan: NVGoggles
{
	Scope=2;

	displayName="Mask_tan";

	modelOptics="\Zee_Glasses\Mask_optics";
	model="\Zee_Glasses\AJ_Mask_2_std";
        identityTypes[] = {"G_NATO_default", 0, "G_NATO_casual", 0, "G_NATO_pilot", 0, "G_NATO_recon", 0, G_NATO_SF, 0, "G_NATO_sniper", 0, "G_NATO_diver", 0, "G_IRAN_default", 0, "G_IRAN_diver", 0, "G_GUERIL_default", 0, "G_HAF_default", 0, "G_CIVIL_female", 0, "G_CIVIL_male", 0};

	descriptionShort="Mask With Night vision function";

	class ItemInfo
	{
		type=616;
		hmdType=0;
		uniformModel="\Zee_Glasses\AJ_Mask_2_std";
		modelOff="\Zee_Glasses\AJ_Mask_2_std_off";
		mass=20;
	};
};

class AJ_Mask_Tan_teamlead: NVGoggles
{
	Scope=2;

	displayName="Mask_tan_teamlead";

	modelOptics="\Zee_Glasses\Mask_optics";
	model="\Zee_Glasses\AJ_Mask_2";
	hiddenSelections[] = {"Camo", "Glass"};
    hiddenSelectionsTextures[] = {"\Zee_Glasses\data\Mask_blk_Teamlead_co.paa", "\Zee_Glasses\data\Mask_Blk_Teamlead_co.paa"};
    identityTypes[] = {"G_NATO_default", 0, "G_NATO_casual", 0, "G_NATO_pilot", 0, "G_NATO_recon", 0, G_NATO_SF, 0, "G_NATO_sniper", 0, "G_NATO_diver", 0, "G_IRAN_default", 0, "G_IRAN_diver", 0, "G_GUERIL_default", 0, "G_HAF_default", 0, "G_CIVIL_female", 0, "G_CIVIL_male", 0};

	descriptionShort="Mask With Night vision function";

	class ItemInfo
	{
		type=616;
		hmdType=0;
		uniformModel="\Zee_Glasses\AJ_Mask_2";
		modelOff="\Zee_Glasses\AJ_Mask_2_off";
		mass=20;
	};
};
};

class CfgGlasses {
	class None;	// External class reference
	
class AJ_Mask_Standard : None {
		displayname = "Mask -Tan";
		model = "\Zee_Glasses\AJ_Mask_2.p3d";
		hiddenSelections[] = {"Camo", "Glass"};
		hiddenSelectionsTextures[] = {"\Zee_Glasses\data\Mask_std_co.paa", "\Zee_Glasses\data\Mask_std_co.paa"};
		identityTypes[] = {"G_NATO_default", 0, "G_NATO_casual", 0, "G_NATO_pilot", 0, "G_NATO_recon", 0, G_NATO_SF, 0, "G_NATO_sniper", 0, "G_NATO_diver", 0, "G_IRAN_default", 0, "G_IRAN_diver", 0, "G_GUERIL_default", 0, "G_HAF_default", 0, "G_CIVIL_female", 0, "G_CIVIL_male", 0};
};

class AJ_Mask_black_Standard : None {
		displayname = "Mask -black";
		model = "\Zee_Glasses\AJ_Mask_2.p3d";
		hiddenSelections[] = {"Camo", "Glass"};
		hiddenSelectionsTextures[] = {"\Zee_Glasses\data\Mask_blk_co.paa", "\Zee_Glasses\data\Mask_blk_co.paa"};
		identityTypes[] = {"G_NATO_default", 0, "G_NATO_casual", 0, "G_NATO_pilot", 0, "G_NATO_recon", 0, G_NATO_SF, 0, "G_NATO_sniper", 0, "G_NATO_diver", 0, "G_IRAN_default", 0, "G_IRAN_diver", 0, "G_GUERIL_default", 0, "G_HAF_default", 0, "G_CIVIL_female", 0, "G_CIVIL_male", 0};
};
	class AJ_Mask_Teamlead : None {
		displayname = "Mask -Tan (Teeth)";
		model = "\Zee_Glasses\AJ_Mask_2.p3d";
		hiddenSelections[] = {"Camo", "Glass"};
		hiddenSelectionsTextures[] = {"\Zee_Glasses\data\Mask_Teamlead_co.paa", "\Zee_Glasses\data\Mask_Teamlead_co.paa"};
		identityTypes[] = {"G_NATO_default", 0, "G_NATO_casual", 0, "G_NATO_pilot", 0, "G_NATO_recon", 0, G_NATO_SF, 0, "G_NATO_sniper", 0, "G_NATO_diver", 0, "G_IRAN_default", 0, "G_IRAN_diver", 0, "G_GUERIL_default", 0, "G_HAF_default", 0, "G_CIVIL_female", 0, "G_CIVIL_male", 0};
                                  };

	class AJ_Mask_Black_Teamlead : None {
		displayname = "Mask -Black (Teeth)";
		model = "\Zee_Glasses\AJ_Mask_2.p3d";
		hiddenSelections[] = {"Camo", "Glass"};
		hiddenSelectionsTextures[] = {"\Zee_Glasses\data\Mask_blk_Teamlead_co.paa", "\Zee_Glasses\data\Mask_Blk_Teamlead_co.paa"};
		identityTypes[] = {"G_NATO_default", 0, "G_NATO_casual", 0, "G_NATO_pilot", 0, "G_NATO_recon", 0, G_NATO_SF, 0, "G_NATO_sniper", 0, "G_NATO_diver", 0, "G_IRAN_default", 0, "G_IRAN_diver", 0, "G_GUERIL_default", 0, "G_HAF_default", 0, "G_CIVIL_female", 0, "G_CIVIL_male", 0};
                                         };
  };