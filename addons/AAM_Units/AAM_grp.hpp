class AAM_ADF {
	name = "Australian Defence Force";
	class Infantry {
		name = "Infantry";
		aliveCategory="Infantry";
		class AAM_ADF_infantry_sect {
			name = "Infantry Section";
			faction = "AAM_ADF";
			side=0;
			rarityGroup = 0.75;
			class Unit0 {
				side = 0;
				vehicle = "ADF_AMCU_STL";
				rank = "SERGEANT";
				position[] = {0,5,0};
			};
			class Unit1 {
				side = 0;
				vehicle = "ADF_AMCU_SCO";
				rank = "PRIVATE";
				position[] = {-5,0,0};
			};
			class Unit2 {
				side = 0;
				vehicle = "ADF_AMCU_GL";
				rank = "PRIVATE";
				position[] = {3,0,0};
			};
			class Unit3 {
				side = 0;
				vehicle = "ADF_AMCU_LSW";
				rank = "PRIVATE";
				position[] = {5,0,0};
			};
			class Unit4 {
				side = 0;
				vehicle = "ADF_AMCU_STL";
				rank = "CORPORAL";
				position[] = {7,0,0};
			};
			class Unit5 {
				side = 0;
				vehicle = "ADF_AMCU_SCO";
				rank = "PRIVATE";
				position[] = {9,0,0};
			};
			class Unit6 {
				side = 0;
				vehicle = "ADF_AMCU_AT";
				rank = "PRIVATE";
				position[] = {11,0,0};
			};
			class Unit7 {
				side = 0;
				vehicle = "ADF_AMCU_LSW";
				rank = "PRIVATE";
				position[] = {13,0,0};
			};
		};
		class AAM_ADF_fireteam {
					name = "Fireteam";
					faction = "AAM_ADF";
					side=0;
					rarityGroup = 0.75;

					class Unit0
					{
						side = 0;
						vehicle = "sub_ins_eu_tl";
						rank = "LIEUTENANT";
						position[] = {0,5,0};
					};
					class Unit1
					{
						side = 0;
						vehicle = "sub_ins_eu_mg";
						rank = "PRIVATE";
						position[] = {-5,0,0};
					};
					class Unit2
					{
						side = 0;
						vehicle = "sub_ins_eu_lat";
						rank = "PRIVATE";
						position[] = {3,0,0};
					};
					class Unit3
					{
						side = 0;
						vehicle = "sub_ins_eu_ammo";
						rank = "PRIVATE";
						position[] = {5,0,0};
					};
		};
		class AAM_ADF_hqteam {
					name = "Command group";
					faction = "AAM_ADF";
					side=0;
					rarityGroup = 0.75;

					class Unit0
					{
						side = 0;
						vehicle = "sub_ins_eu_off";
						rank = "COLONEL";
						position[] = {0,5,0};
					};
					class Unit1
					{
						side = 0;
						vehicle = "sub_ins_eu_sl";
						rank = "LIEUTENANT";
						position[] = {-5,0,0};
					};
					class Unit2
					{
						side = 0;
						vehicle = "sub_ins_eu_engineer";
						rank = "PRIVATE";
						position[] = {3,0,0};
					};
					class Unit3
					{
						side = 0;
						vehicle = "sub_ins_eu_sniper";
						rank = "PRIVATE";
						position[] = {5,0,0};
					};
		};
		class AAM_ADF_sappgroup {
					name = "Sapper group";
					faction = "sub_faction_eu_ins";
					side=0;
					rarityGroup = 0.75;

					class Unit0
					{
						side = 0;
						vehicle = "sub_ins_eu_tl";
						rank = "SERGEANT";
						position[] = {0,5,0};
					};
					class Unit1
					{
						side = 0;
						vehicle = "sub_ins_eu_engineer";
						rank = "PRIVATE";
						position[] = {-5,0,0};
					};
					class Unit2
					{
						side = 0;
						vehicle = "sub_ins_eu_exp";
						rank = "PRIVATE";
						position[] = {3,0,0};
					};
					class Unit3
					{
						side = 0;
						vehicle = "sub_ins_eu_exp";
						rank = "PRIVATE";
						position[] = {5,0,0};
					};
		};
		class AAM_ADF_marksteam {
					name = "Marksman team";
					faction = "AAM_ADF";
					side=0;
					rarityGroup = 0.75;

					class Unit0
					{
						side = 0;
						vehicle = "sub_ins_eu_tl";
						rank = "SERGEANT";
						position[] = {0,5,0};
					};
					class Unit1
					{
						side = 0;
						vehicle = "sub_ins_eu_sniper";
						rank = "PRIVATE";
						position[] = {-5,0,0};
					};
		};
	};
	class Motorized {
		name = "Motorized";
		aliveCategory="Motorized";
		class sub_group_ins_eu_motorized_squad {
					name = "Motorized Squad";
					faction = "sub_faction_eu_ins";
					side=0;
					rarityGroup = 0.75;

					class Unit0
					{
						side = 0;
						vehicle = "sub_ins_eu_sl";
						rank = "SERGEANT";
						position[] = {0,5,0};
					};
					class Unit1
					{
						side = 0;
						vehicle = "sub_ins_eu_tl";
						rank = "SERGEANT";
						position[] = {-5,0,0};
					};
					class Unit2
					{
						side = 0;
						vehicle = "sub_ins_eu_gl";
						rank = "PRIVATE";
						position[] = {3,0,0};
					};
					class Unit3
					{
						side = 0;
						vehicle = "sub_ins_eu_rifleman";
						rank = "CORPORAL";
						position[] = {5,0,0};
					};
					class Unit4
					{
						side = 0;
						vehicle = "sub_ins_eu_mg";
						rank = "PRIVATE";
						position[] = {7,0,0};
					};
					class Unit5
					{
						side = 0;
						vehicle = "sub_ins_eu_lat";
						rank = "PRIVATE";
						position[] = {9,0,0};
					};
					class Unit6
					{
						side = 0;
						vehicle = "sub_ins_eu_ammo";
						rank = "PRIVATE";
						position[] = {11,0,0};
					};
					class Unit7
					{
						side = 0;
						vehicle = "sub_ins_eu_medic";
						rank = "PRIVATE";
						position[] = {13,0,0};
					};
					class Unit8
					{
						side = 0;
						vehicle = "sub_ins_eu_van";
						rank = "PRIVATE";
						position[] = {15,0,0};
					};
		};
		class sub_group_ins_eu_patrol {
					name = "Vehicle Patrol";
					faction = "sub_faction_eu_ins";
					side=0;
					rarityGroup = 0.75;

					class Unit0
					{
						side = 0;
						vehicle = "sub_ins_eu_tl";
						rank = "LIEUTENANT";
						position[] = {0,5,0};
					};
					class Unit1
					{
						side = 0;
						vehicle = "sub_ins_eu_mg";
						rank = "PRIVATE";
						position[] = {-5,0,0};
					};
					class Unit2
					{
						side = 0;
						vehicle = "sub_ins_eu_lat";
						rank = "PRIVATE";
						position[] = {3,0,0};
					};
					class Unit3
					{
						side = 0;
						vehicle = "sub_ins_eu_ammo";
						rank = "PRIVATE";
						position[] = {5,0,0};
					};
					class Unit4
					{
						side = 0;
						vehicle = "sub_ins_eu_offroad";
						rank = "PRIVATE";
						position[] = {7,0,0};
					};
		};
		class sub_group_ins_eu_technicals {
					name = "Technicals";
					faction = "sub_faction_eu_ins";
					side=0;
					rarityGroup = 0.75;

					class Unit0
					{
						side = 0;
						vehicle = "sub_ins_eu_offroad_armed";
						rank = "LIEUTENANT";
						position[] = {0,5,0};
					};
					class Unit1
					{
						side = 0;
						vehicle = "sub_ins_eu_offroad_armed";
						rank = "PRIVATE";
						position[] = {-5,0,0};
					};
					class Unit2
					{
						side = 0;
						vehicle = "sub_ins_eu_offroad_armed";
						rank = "PRIVATE";
						position[] = {3,0,0};
					};
		};
	};
	class Mechanized {
				name = "Mechanized";
				aliveCategory="Mechanized";
				class sub_group_ins_eu_mechanized_squad
				{
					name = "BTR-60 Squad";
					faction = "sub_faction_eu_ins";
					side=0;
					rarityGroup = 0.75;

					class Unit0
					{
						side = 0;
						vehicle = "sub_ins_eu_tl";
						rank = "SERGEANT";
						position[] = {-5,0,0};
					};
					class Unit1
					{
						side = 0;
						vehicle = "sub_ins_eu_gl";
						rank = "PRIVATE";
						position[] = {3,0,0};
					};
					class Unit2
					{
						side = 0;
						vehicle = "sub_ins_eu_rifleman";
						rank = "CORPORAL";
						position[] = {5,0,0};
					};
					class Unit3
					{
						side = 0;
						vehicle = "sub_ins_eu_mg";
						rank = "PRIVATE";
						position[] = {7,0,0};
					};
					class Unit4
					{
						side = 0;
						vehicle = "sub_ins_eu_lat";
						rank = "PRIVATE";
						position[] = {9,0,0};
					};
					class Unit5
					{
						side = 0;
						vehicle = "sub_ins_eu_ammo";
						rank = "PRIVATE";
						position[] = {11,0,0};
					};
					class Unit6
					{
						side = 0;
						vehicle = "sub_ins_eu_medic";
						rank = "PRIVATE";
						position[] = {13,0,0};
					};
					class Unit7
					{
						side = 0;
						vehicle = "sub_ins_eu_btr60";
						rank = "PRIVATE";
						position[] = {15,0,0};
					};
				};
				class sub_group_ins_eu_mechanized2_squad
				{
					name = "BMP-1 Squad";
					faction = "sub_faction_eu_ins";
					side=0;
					rarityGroup = 0.75;

					class Unit0
					{
						side = 0;
						vehicle = "sub_ins_eu_tl";
						rank = "SERGEANT";
						position[] = {-5,0,0};
					};
					class Unit1
					{
						side = 0;
						vehicle = "sub_ins_eu_gl";
						rank = "PRIVATE";
						position[] = {3,0,0};
					};
					class Unit2
					{
						side = 0;
						vehicle = "sub_ins_eu_rifleman";
						rank = "CORPORAL";
						position[] = {5,0,0};
					};
					class Unit3
					{
						side = 0;
						vehicle = "sub_ins_eu_mg";
						rank = "PRIVATE";
						position[] = {7,0,0};
					};
					class Unit4
					{
						side = 0;
						vehicle = "sub_ins_eu_lat";
						rank = "PRIVATE";
						position[] = {9,0,0};
					};
					class Unit5
					{
						side = 0;
						vehicle = "sub_ins_eu_ammo";
						rank = "PRIVATE";
						position[] = {11,0,0};
					};
					class Unit6
					{
						side = 0;
						vehicle = "sub_ins_eu_medic";
						rank = "PRIVATE";
						position[] = {13,0,0};
					};
					class Unit7
					{
						side = 0;
						vehicle = "sub_ins_eu_bmp1";
						rank = "PRIVATE";
						position[] = {15,0,0};
					};
				};
	};
	class Support {
				name = "Support";
				aliveCategory="Support";
				class sub_group_ins_eu_sniperteam
				{
					name = "Mortar team";
					faction = "sub_faction_eu_ins";
					side=0;
					rarityGroup = 0.75;

					class Unit0
					{
						side = 0;
						vehicle = "sub_ins_eu_mortar";
						rank = "SERGEANT";
						position[] = {0,5,0};
					};
					class Unit1
					{
						side = 0;
						vehicle = "sub_ins_eu_rifleman";
						rank = "PRIVATE";
						position[] = {-5,0,0};
					};
				};
	};
	class Armored {
				name = "Armored";
				aliveCategory="Armored";
				class sub_group_ins_eu_t72platoon
				{
					name = "T72 Platoon";
					faction = "sub_faction_eu_ins";
					side=0;
					rarityGroup = 0.75;

					class Unit0
					{
						side = 0;
						vehicle = "sub_ins_eu_t72";
						rank = "SERGEANT";
						position[] = {0,5,0};
					};
					class Unit1
					{
						side = 0;
						vehicle = "sub_ins_eu_t72";
						rank = "PRIVATE";
						position[] = {-5,0,0};
					};
				};
				class sub_group_ins_eu_zsu23grp
				{
					name = "ZSU Group";
					faction = "sub_faction_eu_ins";
					side=0;
					rarityGroup = 0.75;

					class Unit0
					{
						side = 0;
						vehicle = "sub_ins_eu_zsu";
						rank = "SERGEANT";
						position[] = {0,5,0};
					};
				};
	};
};