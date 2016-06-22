//------------------------------  CDS HUD CBA ADDITIONALS  ------------------------------------------
//---------------------------------------------------------------------------------------------------

if (isDedicated) exitwith {};
/*
tpw_hud_fnc_brightness = {
	(findDisplay 46) displayAddEventHandler ["keyDown", "_this call tpw_hud_fnc_keydown"];
	tpw_hud_lastchange = time;
	tpw_hud_fnc_keydown = {
		private["_ctrl","_key"];
		_key = _this select 1;
		_ctrl = _this select 3;
		_alt = _this select 4;
	};
};
*/

// HUD NV ============================================================================EMMITER GLOW ON MODEL PREHAPS ?
//if ((_ctrl) && (_alt) && (_key == 35) && {time > tpw_hud_lastchange} ) exitwith {
AAM_CDS_HUD_NV = {
		if (tpw_hud_nv=true) then {
			ppEffectDestroy tpw_hud_nvgrain;
			ppEffectDestroy tpw_hud_nvblur;
			titleCut ["", "BLACK IN", 4];
			setaperture -1;
			tpw_hud_nv=false;
		}; else {
			call tpw_hud_fnc_nv;
		};
	};
// HUD NV ============================================================================================================
tpw_hud_fnc_nv = {
	// If NV is on, what conditions should switch it off
	if (tpw_hud_nv) then {
		if ((tpw_hud_thirdperson == 0 && cameraview == "external") ||
		(player getvariable ["tpw_hud_goggles",0] == 0) ||
		(!tpw_hud_nvflag)) then {
			ppEffectDestroy tpw_hud_nvgrain;
			ppEffectDestroy tpw_hud_nvblur;
			titleCut ["", "BLACK IN", 4];
			setaperture -1;
			tpw_hud_nv=false;
		};
	} else {
		// If NV is off, what conditions should switch it on
		if (!(tpw_hud_thirdperson == 0 && cameraview == "external") &&
		{player getvariable ["tpw_hud_goggles",0] == 1} &&
		{tpw_hud_nvflag}) then {
			player say "readoutclick";
			tpw_hud_lastchange = time + 0.2;
			player action ["nvGogglesOff", player];
			//setaperture 0.65;
			setaperture (tpw_nv_brightness select tpw_nv_fac);
			tpw_hud_nvgrain = ppEffectCreate ["filmgrain", 2050];
			tpw_hud_nvgrain ppEffectEnable true;
			tpw_hud_nvgrain ppEffectAdjust [1,1,1,0.1,0.1,false];
			tpw_hud_nvgrain ppEffectCommit 0;
			tpw_hud_nvblur = ppEffectCreate ["dynamicblur", 450];
			tpw_hud_nvblur ppEffectEnable true;
			tpw_hud_nvblur ppEffectAdjust [0.2];
			tpw_hud_nvblur ppEffectCommit 0;
			tpw_hud_nv=true;
		};
	};
};

// HUD NV BRIGHTNESS ================================================================= HUD VISIABLE NV BRIGHTNESS ICONS
//if ((_ctrl) && (_alt) && (_key == 48) && {time > tpw_hud_lastchange} && tpw_hud_nvflag) exitwith {
/*AAM_CDS_Hud_NVBright = {
	if (tpw_hud_nv=true) then {
		player say "readoutclick";
		tpw_hud_lastchange = time + 0.2;
		tpw_nv_fac = tpw_nv_fac + 1;
		if (tpw_nv_fac > 5) then { tpw_nv_fac = 0; };
		player action ["nvGogglesOff", player];
		setaperture (tpw_nv_brightness select tpw_nv_fac);
		tpw_hud_nvgrain = ppEffectCreate ["filmgrain", 2050];
		tpw_hud_nvgrain ppEffectEnable true;
		tpw_hud_nvgrain ppEffectAdjust [1,1,1,0.1,0.1,false];
		tpw_hud_nvgrain ppEffectCommit 0;
		tpw_hud_nvblur = ppEffectCreate ["dynamicblur", 450];
		tpw_hud_nvblur ppEffectEnable true;
		tpw_hud_nvblur ppEffectAdjust [0.2];
		tpw_hud_nvblur ppEffectCommit 0;
		tpw_hud_nv=true; } else {};
};*/

// HUD brightness========================================================================= WORKS BRIGHTNESS ADJ ========
//if ((_ctrl) && (_key == 35) && {time > tpw_hud_lastchange}) exitwith {
AAM_CDS_Hud_Bright = {
	player say "readoutclick";
	tpw_hud_lastchange = time + 0.2;
	tpw_hud_alpha = tpw_hud_alpha + 0.1;
	if (tpw_hud_alpha > 1) then { tpw_hud_alpha = 0; };
	[] call tpw_hud_fnc_reset;
};