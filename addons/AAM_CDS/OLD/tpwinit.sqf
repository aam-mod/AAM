// TPW MODS INITIALISATION
// GRABS CONFIG VALUES AND THEN SPAWNS EACH MOD
// THANKS TO KILLZONE FOR THE CONCEPT OF MOD SPAWNING TO SURVIVE SAVE GAME RELOADS

// CORE FUNCTIONS
[] spawn
	{
	waitUntil {!isNil "BIS_fnc_init"};
	while {true} do
		{
		_core = [] execvm "\AAM_CDS\tpw_core.sqf";//"\TPW_MODS\tpw_core.sqf";
		waitUntil {sleep 10; scriptDone _core};
		};
	};
/*		// AIR
		_airactive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_air_active");
		if (_airactive == 1) then
			{
			[] spawn
				{
				_airdelay = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_air_delay");
				_airtime = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_air_time");
				_airmax = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_air_max");
				_airheights = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_air_heights");
				_airexc = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_air_exclude");
				waitUntil {!isNil "BIS_fnc_init"};
				while {true} do
					{
					_air = [_airdelay,_airtime,_airmax,_airheights,_airexc] execvm "\TPW_MODS\tpw_air.sqf";
					waitUntil {sleep 10; scriptDone _air};
					};
				};
			};

		// ANIMALS
		_animalactive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_animal_active");
		if (_animalactive == 1) then
			{
			[] spawn
				{
				_animaldelay = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_animal_delay");
				_animalnum = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_animal_max");
				_animalmaxradius = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_animal_maxradius");
				_animalminradius = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_animal_minradius");
				_animalnoisetime = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_animal_noisetime");
				waitUntil {!isNil "BIS_fnc_init"};
				while {true} do
					{
					_animal = [_animaldelay,_animalnum,_animalmaxradius,_animalminradius,_animalnoisetime] execvm "\TPW_MODS\tpw_animals.sqf";
					waitUntil {sleep 10; scriptDone _animal};
					};
				};
			};

		// BLEEDOUT
		_bleedoutactive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_bleedout_active");
		if (_bleedoutactive == 1) then
			{
			[] spawn
				{
				_bleedoutinc = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_bleedout_inc");
				_bleedoutcthresh = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_bleedout_cthresh");
				_bleedoutpthresh = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_bleedout_pthresh");
				_bleedoutithresh = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_bleedout_ithresh");
				_bleedoutheartbeat = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_bleedout_heartbeat");
				_bleedoutselfheal = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_bleedout_selfheal");
				waitUntil {!isNil "BIS_fnc_init"};
				while {true} do
					{
					_bleed = [_bleedoutinc,_bleedoutcthresh,_bleedoutpthresh,_bleedoutithresh,_bleedoutheartbeat,_bleedoutselfheal] execvm "\TPW_MODS\tpw_bleedout.sqf";
					waitUntil {sleep 10; scriptDone _bleed};
					};
				};
			};

		// BOATS
		_boatactive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_boat_active");
		if (_boatactive == 1) then
			{
			[] spawn
				{
				_boatdelay = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_boat_delay");
				_boatradius = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_boat_radius");
				_boatwaypoints = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_boat_waypoints");
				_boatnumber = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_boat_num");
				waitUntil {!isNil "BIS_fnc_init"};
				while {true} do
					{
					_boat = [_boatdelay,_boatradius,_boatwaypoints,_boatnumber] execvm "\TPW_MODS\tpw_boats.sqf";
					waitUntil {sleep 10; scriptDone _boat};
					};
				};
			};

		// CARS
		_caractive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_car_active");
		if (_caractive == 1) then
			{
			[] spawn
				{
				_cardelay = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_car_delay");
				_carradius = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_car_radius");
				_carwaypoints = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_car_waypoints");
				_carnumber = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_car_num");
				_carnocombatspawn = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_car_nocombatspawn");
				waitUntil {!isNil "BIS_fnc_init"};
				while {true} do
					{
					_car = [_cardelay,_carradius,_carwaypoints,_carnumber,_carnocombatspawn] execvm "\TPW_MODS\tpw_cars.sqf";
					waitUntil {sleep 10; scriptDone _car};
					};
				};
			};

		// CIVS
		_civactive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_civ_active");
		if (_civactive == 1) then
			{
			[] spawn
				{
				_civdelay = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_civ_delay");
				_civradius = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_civ_radius");
				_civwaypoints = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_civ_waypoints");
				_civdensity = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_civ_density");
				_civsquadcas = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_civ_maxsquadcas");
				_civallcas = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_civ_maxallcas");
				_civcasdisplay = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_civ_casdisplay");
				_civmax = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_civ_maxciv");
				_civinteract = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_civ_interact");
				_civnocombatspawn = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_civ_nocombatspawn");
				waitUntil {!isNil "BIS_fnc_init"};
				while {true} do
					{
					_civ = [_civdelay,_civradius,_civwaypoints,_civdensity,_civsquadcas,_civallcas,_civcasdisplay,_civmax,_civinteract,_civnocombatspawn] execvm "\TPW_MODS\tpw_civs.sqf";
					waitUntil {sleep 10; scriptDone _civ};
					};
				};
			};

		// EBS
		_ebsactive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_ebs_active");
		if (_ebsactive  == 1) then
			{
			[] spawn
				{
				_ebsthresh = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_ebs_thresh");
				_ebsdelay = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_ebs_delay");
				_ebsdebug = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_ebs_debug");
				_ebsradius = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_ebs_radius");
				_ebsplayersup = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_ebs_playersup");
				_ebsaisup = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_ebs_aisup");
				_ebsfindcover = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_ebs_findcover");
				_ebssuptype = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_ebs_suptype");
				waitUntil {!isNil "BIS_fnc_init"};
				while {true} do
					{
					_ebs = [_ebsthresh,_ebsdelay,_ebsdebug,_ebsradius,_ebsplayersup,_ebsaisup,_ebsfindcover,_ebssuptype] execvm "\TPW_MODS\tpw_ebs.sqf";
					waitUntil {sleep 10; scriptDone _ebs};
					};
				};
			};

		// FALL
		_fallactive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_fall_active");
		if (_fallactive  == 1) then
			{
			[] spawn
				{
				_fallsens = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_fall_sensitivity");
				_fallthresh = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_fall_threshold");
				_falldelay = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_fall_delay");
				_fallragdoll = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_fall_ragdoll");
				_falltime = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_fall_falltime");
				_fallplayer = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_fall_player");
				_fallbullet = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_fall_bullet");
				waitUntil {!isNil "BIS_fnc_init"};
				while {true} do
					{
					_fall = [_fallsens,_fallthresh,_falldelay,_fallragdoll,_falltime,_fallplayer,_fallbullet] execvm "\TPW_MODS\tpw_fall.sqf";
					waitUntil {sleep 10; scriptDone _fall};
					};
				};
			};

		// FOG
		_fogactive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_fog_active");
		if (_fogactive  == 1) then
			{
			[] spawn
				{
				_fogradius = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_fog_radius");
				_fogdelay = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_fog_delay");
				_fogbreath = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_fog_breath");
				_fogground = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_fog_groundfog");
				_fograin = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_fog_rainfog");
				_foghaze = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_fog_heathaze");
				_fogsnow = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_fog_cansnow");
				waitUntil {!isNil "BIS_fnc_init"};
				while {true} do
					{
					_fog = [_fogradius,_fogdelay,_fogbreath,_fogground,_fograin,_foghaze,_fogsnow] execvm "\TPW_MODS\tpw_fog.sqf";
					waitUntil {sleep 10; scriptDone _fog};
					};
				};
			};

		// HOUSELIGHTS
		_houselightsactive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_houselights_active");
		if (_houselightsactive == 1) then
			{
			[] spawn
				{
				_houselightsdelay = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_houselights_delay");
				waitUntil {!isNil "BIS_fnc_init"};
				while {true} do
					{
					_house = [_houselightsdelay] execvm "\TPW_MODS\tpw_houselights.sqf";
					waitUntil {sleep 10; scriptDone _house};
					};
				};
			};
*/
// HUD
_hudactive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_active");
if (_hudactive == 1) then
	{
	[] spawn
		{
		_hudrange = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_range");
		_hudcolour = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_colour");
		_hudfriendlycolour = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_friendlycolour");
		_hudenemycolour = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_enemycolour");
		_hudcivcolour = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_civcolour");
		_hudsquadcolour = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_squadcolour");
		_hudalpha = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_alpha");
		_hudasl = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_asl");
		_hudazt = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_azt");
		_hudgrd = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_grd");
		_hudlmt = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_lmt");
		_hudtmp = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_tmp");
		_hudhlt = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_hlt");
		_hudrng = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_rng");
		_hudvel = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_vel");
		_hudprx = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_prx");
		_hudunit = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_unit");
		_hudoffset = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_offset");
		_hudscale = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_scale");
		_hudtextscale = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_textscale");
		_huddegrade = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_degradation");
		_hudthird = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_thirdperson");
		_hudtac = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_addtac");
		_hudicons = getarray (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_icons");
		_hudvehfac = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_vehiclefactor");
		_hudaudible = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hud_audible");
		waitUntil {!isNil "BIS_fnc_init"};
		while {true} do
			{
			_hud = [_hudrange,_hudcolour,_hudfriendlycolour,_hudenemycolour,_hudcivcolour,_hudsquadcolour,_hudalpha,_hudasl,_hudazt,_hudgrd,_hudlmt,_hudtmp,_hudhlt,_hudrng,_hudvel,_hudprx,_hudunit,_hudoffset,_hudscale,_hudtextscale,_huddegrade,_hudthird,_hudtac,_hudicons,_hudvehfac,_hudaudible] execvm "\TPW_MODS\tpw_hud.sqf";
			waitUntil {sleep 10; scriptDone _hud};
			};
		};
	};
/*  QNNOTATED VALUES FOR ABOVE
	// HUD
	tpw_hud_active = 1; // 0 = inactive
	tpw_hud_range[] = {25,500}; // effective minimum and maximum range of goggles to scan for units
	tpw_hud_vehiclefactor = 1.5; // Detection range multiplication factor for vehicles (eg 1.5 = 750m max detection range for vehicles vs 500m for units)
	tpw_hud_colour[] = {1,1,1}; // HUD colour
	tpw_hud_friendlycolour[] = {0,1,1}; // friendly colour
	tpw_hud_civcolour[] = {1,1,1}; // civ colour
	tpw_hud_enemycolour[] = {1,0.5,0}; // enemy colour
	tpw_hud_squadcolour[] = {0.5,1,0}; // squad and marker colour
	tpw_hud_alpha = 0.6; // initial transparency of HUD. 0 = invisible, 1 = opaque
	tpw_hud_asl[] =	{1,0.6,0.456,1}; // ASL = height above sea level. [1 = active ( 0 = inactive), 0.6 = X position, 0.45 = Y position, 1 = text size]
	tpw_hud_azt[] =	{1,0.5,0.452,1}; // AZT = azimuth (direction of gaze).
	tpw_hud_grd[] =	{1,0.4,0.45,1}; // GRD = GPS grid coordinates.
	tpw_hud_lmt[] =	{1,0.4,0.5,1}; // LMT = local mean time.
	tpw_hud_tmp[] =	{1,0.6,0.51,1}; // TMP = temperature (from TPW FOG) .
	tpw_hud_hlt[] =	{1,0.4,0.55,1}; // HLT= health.
	tpw_hud_rng[] =	{1,0.5,0.56,1}; // RNG = range to centre of player's gaze.
	tpw_hud_vel[] =	{1,0.6,0.57,1}; // VEL = speed of player (or player's vehicle).
	tpw_hud_prx[] = {1,0.5,0.505,1}; // PRX = display numbers of nearby units.
	tpw_hud_unit[] = {1,1,0.25,0.75}; // UNITS/MARKERS displayed on HUD, where 1 = active ( 0 = inactive), 1 = icon max size, 0.25 = icon min size, 0.75 = text size ( 1 = same size as HUD text).
	tpw_hud_offset[] = {0.34,0.26}; //HUD offset. [x,y] -0.5 to 0.5
	tpw_hud_scale = 0.9; // HUD scale. > 1 = larger
	tpw_hud_textscale = 1; // HUD text scale. > 1 = larger
	tpw_hud_degradation = 1; // HUD performance reduced with distance. 0 = no degradation
	tpw_hud_thirdperson = 0; // no HUD in 3rd person. 1 = HUD in 3rd person
	tpw_hud_addtac = 1; // automatically add tactical glasses to the player's inventory if they are not already carrying/wearing them. 0 = don't add glasses
	tpw_hud_audible = 1; // audible warning when enemies detected. 0 = no audible warning.
	tpw_hud_icons[] = {24,23,30,29,24,23,30,29,22,20}; // HUD icon types, see key below
	/*ICONS
	{unit,hidden unit,vehicle, hidden vehicle, enemy unit, hidden enemy unit, enemy vehicle, hidden enemy vehicle,marker, predictor}
	0: empty
	1: 2px_cross
	2: 2px_cross_open
	3: 2px_cross_small
	4: 2px_diamond
	5: 2px_diamond_half
	6: 2px_diamond_open
	7: 2px_dot
	8: 2px_line
	9: 2px_line_open
	10: 2px_square
	11: 2px_square_half
	12: 2px_square_open
	13: 2px_x
	14: 2px_x_open
	15: 2px_x_small
	16: 3px_circle
	17: 3px_circle_half
	18: 3px_circle_open
	19: 3px_cross
	20: 3px_cross_open
	21: 3px_cross_small
	22: 3px_diamond
	23: 3px_diamond_half
	24: 3px_diamond_open
	25: 3px_dot
	26: 3px_line
	27: 3px_line_open
	28: 3px_square
	29: 3px_square_half
	30: 3px_square_open
	31: 3px_x
	32: 3px_x_open
	33: 3px_x_small

	// HUD LAYOUT - ONLY EDIT THESE IF YOU KNOW WHAT YOU'RE DOING WITH STRUCTURED TEXT
	tpw_hud_asl_txt = "%1<t size='0.5'><br />ASL</t>"; // ASL
	tpw_hud_azt_txt = "%1<t size='0.5'><br />AZT %2</t>"; // AZT
	tpw_hud_grd_txt = "%1<t size='0.5'><br />GRD</t>"; // GRD
	tpw_hud_lmt_txt = "%1%2<t size='0.5'><br />LMT</t>"; // LMT
	tpw_hud_tmp_txt = "%1<t size='0.5'><br />TMP</t>"; // TMP
	tpw_hud_hlt_txt = "%2<t size='0.5'><br />BPM %1</t>"; // HLT
	tpw_hud_rng_txt = "%1<t size='0.5'><br />RNG</t>"; // RNG
	tpw_hud_vel_txt = "%1<t size='0.5'><br />VEL</t>"; // VEL
	tpw_hud_airvel_txt = "%1<t size='0.5'><br />VEL KTS</t>"; // VEL IN AIRCRAFT
	tpw_hud_prx_txt = "<t color='%5'>%1</t> <t color='%6'>%2</t> <t color='%7'>%3</t> <t color='%8'>%4</t><t size='0.5'><br />PRX</t>"; // PRX
	//><

*/

/*	// LOS
	_losactive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_los_active");
	if (_losactive == 1) then
		{
		[] spawn
			{
		_losdebug = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_los_debug");
		_losmax = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_los_maxdist");
		_losmin = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_los_mindist");
		_losdelay = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_los_delay");
			waitUntil {!isNil "BIS_fnc_init"};
			while {true} do
				{
				_los = [_losdebug,_losmax,_losmin,_losdelay] execvm "\TPW_MODS\tpw_los.sqf";
				waitUntil {sleep 10; scriptDone _los};
				};
			};
		};

	// PARK
	_parkactive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_park_active");
	if (_parkactive == 1) then
		{
		[] spawn
			{
			_parkperc = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_park_perc");
			_parkcreatedist = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_park_createdist");
			_parkhidedist = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_park_hidedist");
			_parksimdist = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_park_simdist");
			_parkmaxcar = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_park_max");
			waitUntil {!isNil "BIS_fnc_init"};
			while {true} do
				{
				_park = [_parkperc,_parkcreatedist,_parkhidedist,_parksimdist,_parkmaxcar] execvm "\TPW_MODS\tpw_park.sqf";
				waitUntil {sleep 10; scriptDone _park};
				};
			};
		};

	// RADIO
	_radioactive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_radio_active");
	if (_radioactive == 1) then
		{
		[] spawn
			{
			_radiohouse = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_radio_house");
			_radiocar = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_radio_car");
			_radiotime = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_radio_time");
			waitUntil {!isNil "BIS_fnc_init"};
			while {true} do
				{
				_radio = [_radiohouse,_radiocar,_radiotime] execvm "\TPW_MODS\tpw_radio.sqf";
				waitUntil {sleep 10; scriptDone _radio};
				};
			};
		};


	// RAIN FX
	_rainactive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_rain_active");
	if (_rainactive == 1) then
		{
		[] spawn
			{
			waitUntil {!isNil "BIS_fnc_init"};
			while {true} do
				{
				_rain = [] execvm "\TPW_MODS\tpw_rainfx.sqf";
				waitUntil {sleep 10; scriptDone _rain};
				};
			};
		};

	// SKIRMISH
	_skirmishactive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_skirmish_active");
	if (_skirmishactive == 1) then
		{
		[] spawn
			{
			_skirmensquadmax = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_skirmish_enemysquad_max");
			_skirmencarmax = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_skirmish_enemyvehicles_max");
			_skirmfrsquadmax = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_skirmish_friendlysquad_max");
			_skirmfrcarmax = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_skirmish_friendlyvehicles_max");
			_skirmminspawn = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_skirmish_minspawnradius");
			_skirmmaxspawn = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_skirmish_maxspawnradius");
			_skirmsup = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_skirmish_support");
			_skirmfrtype = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_skirmish_friendlytype");
			_skirmentype = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_skirmish_enemytype");
			_skirmtime = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_skirmish_spawntime");
			_skirmfrstring = gettext (configfile >> "TPW_MODS_Key_Setting" >> "tpw_skirmish_friendlyunitstring");
			_skirmfrvstring = gettext (configfile >> "TPW_MODS_Key_Setting" >> "tpw_skirmish_friendlyvehiclestring");
			_skirmenstring = gettext (configfile >> "TPW_MODS_Key_Setting" >> "tpw_skirmish_enemyunitstring");
			_skirmenvstring = gettext (configfile >> "TPW_MODS_Key_Setting" >> "tpw_skirmish_enemyvehiclestring");
			waitUntil {!isNil "BIS_fnc_init"};
			while {true} do
				{
				_skirmish = [_skirmensquadmax,_skirmencarmax,_skirmfrsquadmax,_skirmfrcarmax,_skirmminspawn,_skirmmaxspawn,_skirmsup,_skirmfrtype,
			_skirmentype,_skirmtime,_skirmfrstring,_skirmfrvstring,_skirmenstring,_skirmenvstring] execvm "\TPW_MODS\tpw_skirmish.sqf";
				waitUntil {sleep 10; scriptDone _skirmish};
				};
			};
		};

	// STREETLIGHTS
	_streetlightsactive = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_streetlights_active");
	if (_streetlightsactive == 1) then
		{
		[] spawn
			{
			_streetlightfactor = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_streetlights_factor");
			_streetlightrange = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_streetlights_range");
			_streetlightcolour = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_streetlights_colour");
			_streetlightmoths = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_streetlights_moths");
			waitUntil {!isNil "BIS_fnc_init"};
			while {true} do
				{
				_street = [_streetlightfactor,_streetlightrange,_streetlightcolour,_streetlightmoths] execvm "\TPW_MODS\tpw_streetlights.sqf";
				waitUntil {sleep 10; scriptDone _street};
				};
			};
		};

	// HINT
	_hint = getnumber (configfile >> "TPW_MODS_Key_Setting" >> "tpw_hint_active");
	if (_hint == 1) then
		{
		[] spawn
			{
			waitUntil {!isNil "BIS_fnc_init"};
			while {true} do
				{
				_hint = [] execvm "\TPW_MODS\tpw_hint.sqf";
				waitUntil {sleep 10; scriptDone _hint};
				};
			};
		};
*/