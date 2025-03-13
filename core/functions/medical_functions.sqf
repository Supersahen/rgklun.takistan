medical_default_vars = {
	medical_allow_respawn = false;
	medical_timer = 0;
	medical_timer_minimum = 150;
	medical_timer_maximum = 300;
	esu_reviving = false;
	
	
	head_hit = 0;
	body_hit = 0;
	hands_hit = 0;
	legs_hit = 0;
	
	// Death Animations
	medical_primary_killed =[
		"AdthPercMstpSlowWrflDnon_1","AdthPercMstpSlowWrflDnon_2","AdthPercMstpSlowWrflDnon_4","AdthPercMstpSlowWrflDnon_8",
		"AdthPercMstpSlowWrflDnon_16","AdthPercMstpSlowWrflDnon_32","AdthPercMstpSrasWrflDnon_1","AdthPercMstpSrasWrflDnon_2","AdthPercMstpSrasWrflDnon_4",
		"AdthPercMstpSrasWrflDnon_8","AdthPercMstpSrasWrflDnon_16","AdthPercMstpSrasWrflDnon_32"
	];
	medical_primary_killed_running = [
		"AdthPercMrunSlowWrflDf_A1short","AdthPercMrunSlowWrflDfl_A1short",
		"AdthPercMrunSlowWrflDfr_A1short","AdthPercMrunSlowWrflDf_A2short","AdthPercMrunSlowWrflDfl_A2short",
		"AdthPercMrunSlowWrflDfr_A2short","AdthPercMrunSlowWrflDf_A3short","AdthPercMrunSlowWrflDfl_A3short","AdthPercMrunSlowWrflDfr_A3short",
		"AdthPercMrunSlowWrflDfr_A4short","AdthPercMrunSlowWrflDfl_A4short"
	];
	
	medical_secondary_killed = [
		"AdthPercMstpSrasWpstDnon_1","AdthPercMstpSrasWpstDnon_3","AdthPercMstpSrasWpstDnon_5","AdthPercMstpSrasWpstDf_2",
		"AdthPercMstpSrasWpstDf_6","AdthPercMstpSrasWpstDf_7","AdthPercMstpSrasWpstDb_8","AdthPercMstpSrasWpstDb_9"
	];
	
	medical_unarmed_killed = [
		"AdthPercMstpSnonWnonDnon_1","AdthPercMstpSnonWnonDnon_2","AdthPercMstpSnonWnonDnon_3","AdthPercMstpSnonWnonDnon_A1",
		"AdthPercMstpSnonWnonDnon_A2","AdthPercMstpSnonWnonDnon_A3","AdthPercMstpSnonWnonDnon_A4","AdthPercMstpSnonWnonDnon_A5"
	];
	
};
[] call medical_default_vars;

medical_system_heal = {
	_target = _this select 0;
	if (isNil "_target") exitWith {};
	
	if (_target == player) then {
		head_hit = 0;
		body_hit = 0;
		hands_hit = 0;
		legs_hit = 0;
		_target setDamage 0;
	
	} else {
		[[_target],"medical_system_heal",[_target]] call mp_aware_me;
	};
};

esu_revive_player = {
	_victim = _this select 0;
	if (isNil "_victim") exitWith {};
	
	if (esu_reviving) exitWith {};
	esu_reviving = true;
	_victim setVariable ["reviving",true,true];
	if !(_victim getVariable "downed") exitWith {player groupChat "He is not downed"};
	if (player distance _victim > 2) exitWith {player groupChat "You are too far away. Get closer"};

	[[], "mp_anim_sync",[_victim,"switchmove","AinjPpneMstpSnonWrflDnon"]] call mp_aware_me;
	uiSleep 0.5;
	player attachto [_victim,[-0.73,0.2,0]];
	player setdir 90;

	[[], "mp_anim_sync",[player,"playmove","AinvPknlMstpSnonWrflDnon_medic"]] call mp_aware_me;
	uiSleep 3;
	[[], "mp_anim_sync",[player,"switchMove","AinvPknlMstpSnonWrflDr_medic0"]] call mp_aware_me;
	uiSleep 5;
	[[], "mp_anim_sync",[player,"switchMove","AinvPknlMstpSnonWrflDnon_medic0"]] call mp_aware_me;
	uiSleep 5;
	[[], "mp_anim_sync",[player,"switchMove","AinvPknlMstpSnonWrflDnon_medic1"]] call mp_aware_me;
	uiSleep 5;
	[[], "mp_anim_sync",[player,"switchMove","AinvPknlMstpSnonWrflDnon_medic2"]] call mp_aware_me;
	uiSleep 5;
	[[], "mp_anim_sync",[player,"switchMove","AinvPknlMstpSnonWrflDnon_medic3"]] call mp_aware_me;
	uiSleep 5;
	[[], "mp_anim_sync",[player,"playmove","AinvPknlMstpSnonWrflDr_medic0"]] call mp_aware_me;
	uiSleep 5;
	[[], "mp_anim_sync",[player,"playmove","AinvPknlMstpSnonWrflDnon_medicEnd"]] call mp_aware_me;
	detach player;
	
	[player] call medical_system_heal;
	
	[[], "mp_anim_sync",[_victim,"switchmove","AinjPpneMstpSnonWrflDnon_rolltofront"]] call mp_aware_me;
	uiSleep 4;
	[[], "mp_anim_sync",[_victim,"switchmove","amovppnemstpsnonwnondnon"]] call mp_aware_me;
		
		
	_victim setVariable ["reviving",false,true];
	_victim setVariable ["downed",false,true];
	_victim setVariable ["alive",true,true];
	
	esu_reviving = false;
};

medical_calculate_damage = {
	_unit = _this select 0;
	_source = _this select 1;
	_select = _this select 2;
	_damage = _this select 3;
	
	switch (_select) do {
		case "head_hit": { head_hit = head_hit + _damage; };
		case "body": { body_hit = body_hit + _damage; };
		case "hands": { hands_hit = hands_hit + _damage; };
		case "legs": { legs_hit = legs_hit + _damage; };
	};

	_should_die = (head_hit > 0.99 or body_hit > 0.99);

	if (medical_system_enabled and _should_die) then {
		_damage = 0;
		[_unit,_source] spawn medical_system_killed; 
	};
	_damage
};

medical_fnc_timetoString = {
	private ["_in", "_format", "_min", "_hour", "_sec", "_msec"];
	_in = _this select 0;
	_min = _in mod 1;
	_sec = (60 * _min) mod 1;

	_min = (60 * _min) - ((60 * _min) mod 1);
	_min = (if (_min <= 9) then {"0"} else {""}) + str _min;

	_sec = (60 * _sec) - ((60 * _sec) mod 1);
	_sec = (if (_sec <= 9) then {"0"} else {""}) + str _sec;

	format["%1:%2",_min,_sec]
};
medical_system_killed = {
	_unit = _this select 0;
	_source = _this select 1;
	
	if !(player getVariable "alive") exitWith {};
	if (vehicle player != player) then {
		player action ["Eject", vehicle player];
	};
	
	player setVariable ["downed",true,true];
	player setVariable ["reviving",false,true];
	player setVariable ["alive",false,true];
	if (primaryWeapon player != "") then {
		_animation = medical_primary_killed select round random (count medical_primary_killed - 1);
		[[], "mp_anim_sync",[player,"switchMove",_animation]] call mp_aware_me;
	};		
	
	if (primaryWeapon player != "" and speed player >= 15) then {
		_animation = medical_primary_killed_running select round random (count medical_primary_killed_running - 1);
		[[], "mp_anim_sync",[player,"switchMove",_animation]] call mp_aware_me;
	};	
	
	if (currentWeapon player != "" and currentWeapon player != primaryWeapon player and currentWeapon player != "") then {
		_animation = medical_secondary_killed select round random (count medical_secondary_killed - 1);
		[[], "mp_anim_sync",[player,"switchMove",_animation]] call mp_aware_me;
	};
	
	if (currentWeapon player == "" and primaryWeapon player == "") then {
		_animation = medical_unarmed_killed select round random (count medical_unarmed_killed - 1);
		[[], "mp_anim_sync",[player,"switchMove",_animation]] call mp_aware_me;
	};
	
	uiSleep 1;
	
	medical_timer = medical_timer_maximum;
	//[] spawn medical_respawn_camera;
	
	_message = format ["(%1 - %2) was downed by (%3 - %4)",name _unit,[_unit] call stats_get_faction,name _source,[_source] call stats_get_faction];
	[[],"mp_global_chat_message",[_message]] call mp_aware_me;
	
	waitUntil {player getVariable "alive" or !player getVariable "downed"};

	player setVariable ["downed",false,true];
	player setVariable ["reviving",false,true];
};

medical_respawn_camera = {
	disableSerialization;
	if !(createDialog "medical_respawn_dialog") exitWith {hint "dialog_error"};

	_dialog = findDisplay 1200;
	_dialog displaySetEventHandler ["keyDown","_this call display_keypress"];
	_text =  _dialog displayCtrl 1201;
	_esu = _dialog displayCtrl 1202;
	_esu_dst = _dialog displayCtrl 1203;

	_esu_text = "ESU Online: 0";
	_esu_dst_text = "ESU DST: No ESU";

	while {medical_timer >= 0} do {
	
		medical_timer = medical_timer - 1;
		_time = [medical_timer/60/60] call medical_fnc_timetoString;
		_text ctrlSetStructuredText parseText format["<t align='center' font='Zeppelin32' size='2'>%1</t>",_time];
		_esu ctrlSetText format["%1",_esu_text];
		_esu_dst ctrlSetText format["%1",_esu_dst_text];
		if (medical_timer <= 0) then {player setVariable ["downed",false,true]; player setDamage 1;};
		uiSleep 1;
	};
	
	closeDialog 1200;
};

