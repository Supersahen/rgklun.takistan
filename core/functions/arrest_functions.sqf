#include "macro.h"
interact_arrest_handler = {
	private ["_player","_victim","_time","_bail"];
	_player = _this select 0;
	_victim = _this select 1;
	_time =  [] call arrest_calculate_time;
	_bail = 50;
	
	if ([_victim] call player_insurgent and _time > 25) then {
		_time = 25;
	};
	
	if (isNil "_player") exitWith {};
	if (isNil "_victim") exitWith {};
	if (isNil "_time") exitWith {};
	if (isNil "_bail") exitWith {};
	
	if (not([_player] call player_human)) exitWith {};
	if (not([_victim] call player_human)) exitWith {};
	
	if (not( ([_victim, "restrained"] call player_get_bool) or ([_victim, "ziptied"] call player_get_bool))) exitWith {
		player groupChat format["%1-%2 is not restrained!", _victim, (name _victim)];
	};
	if ([_victim] call player_get_arrest) exitWith {
		player groupChat format["%1 is already under arrest!", _victim];
	};
	
	if ([_player] call player_cop) exitWith {
		if (_player distance (getmarkerpos "prisonspawn") < 50) then {
			[_player,_victim,_time,_bail] call interact_arrest_player;
			_victim setVariable ["north_prisoner",true,true];
		} else {
			player groupChat "You need to be within 50 meters of the jail to make an arrest";
		};
	};	
	if ([_player] call player_opfor) exitWith {
		[_player,_victim,_time,_bail] call interact_arrest_player;
		_victim setVariable ["north_prisoner",false,true];
	};
};
arrest_add_charge = {
	
	_string = _this select 0;
	if (typeName _string != "STRING" or isNil "_string" or _string == "") exitWith {player groupChat format ["No Charge was selected."];};
	
	_present = false;
	for "_i" from 0 to (count arrest_charges - 1) do {
		_charge = arrest_charges select _i;
		
		if (_string == _charge select 0) then {
			_count = (_charge select 1) + 1;
			_charge = [_charge select 0,_count];
			arrest_charges set [_i,_charge];
			_present = true;
		};
	};
	
	if !(_present) then {
		arrest_charges = arrest_charges + [[_string,1]];
	};
	
	["police_arrest_update"] call dialog_handler;
};

arrest_remove_charge = {

	_string = _this select 0;
	if (typeName _string != "STRING" or isNil "_string" or _string == "") exitWith {player groupChat format ["No Charge was selected."];};
	
	_present = false;
	for "_i" from 0 to (count arrest_charges - 1) do {
		_charge = arrest_charges select _i;
		
		if (_string == _charge select 0) then {
			_count = (_charge select 1) - 1;
			_charge = [_charge select 0,_count];
			arrest_charges set [_i,_charge];
			
			if (_count <= 0) then {
				_charge = 0;
				arrest_charges set [_i,_charge];
				arrest_charges = arrest_charges - [0];
			};
		};
	};
	
	["police_arrest_update"] call dialog_handler;
};
arrest_calculate_time = {
	_time = 0;
	max_jailtime = 60;
	victim_jailtime = 0;
	for "_i" from 0 to (count arrest_charges - 1) do {
		_charge = arrest_charges select _i;
		_string = _charge select 0;
		_counts = _charge select 1;
		_charge_time = [_string] call arrest_get_charge_time;
		_charge_time = _charge_time * _counts;
		victim_jailtime = victim_jailtime + _charge_time;
	};	
	
	if (victim_jailtime > max_jailtime) then {victim_jailtime = max_jailtime};
	victim_jailtime
};

arrest_get_charge_time = {
	_string = _this select 0;
	
	_time = 0;
	
	for "_i" from 0 to (count arrestable_charges - 1) do {
		_charge = arrestable_charges select _i;
		
		if (_string == (_charge select 0)) then {
			_time = (_charge select 1);
		};
	};
	_time
};

player_prison_time = {
	private["_player", "_minutes"];
	_player = _this select 0;
	_minutes = _this select 1;

	if (isNil "_player") exitWith {};
	if (_player != player) exitWith {};

	if (isNil "_minutes") exitWith {};
	if (typeName _minutes != "SCALAR") exitWith {};
	if (_minutes <= 0) exitWith {};

	private["_seconds"];
	_seconds = round(_minutes) * 60;
	player_jailtime = _seconds;
	
	_message = format ["%1 was arrested for %2 minutes.",name _player, _minutes];
	[[],"mp_global_chat_message",[_message]] call mp_aware_me;
	
	_seconds
};

player_prison_bail = {
	private["_player", "_percent"];
	_player = _this select 0;
	_percent = _this select 1;

	if (isNil "_player") exitWith {};
	if (_player != player) exitWith {};

	if (isNil "_percent") exitWith {};
	if (typeName _percent != "SCALAR") exitWith {};
	if (_percent <= 0) exitWith {};

	_percent = _percent / 100;

	private["_bail", "_money"];
	_money =  [_player] call player_get_total_money;
	_bail = round(_percent * _money);
	_bail = if (_bail <= 0) then { 100000 } else { _bail };
	[_player, _bail] call player_set_bail;
	private["_message"];
	_message = format["%1-%2 has a bail set at $%3", _player, (name _player), strM(_bail)];
	[[], "mp_global_chat_message", [_message]] call mp_aware_me;
	_bail
};
player_update_bail = {
	private["_player", "_bail"];
	_player = _this select 0;
	_bail = _this select 1;

	private["_current_bail"];

	_current_bail = [_player] call player_get_bail;
	private["_new_bail"];
	_new_bail = (_current_bail + _bail);
	_new_bail = if (_new_bail < 0) then {0} else {_new_bail};

	[_player, _new_bail] call player_set_bail;
};

player_set_bail = {
	private["_player", "_bail"];
	_player = _this select 0;
	_bail = _this select 1;

	if (isNil "_player") exitWith {};
    if (isNil "_bail") exitWith {};

	if (typeName _bail != "SCALAR") exitWith {};
	_bail = if (_bail < 0) then {0} else {_bail};
	_bail = round(_bail);

	private["_bail_variable_name"];
	_bail_variable_name = format["bail"];

	_player setVariable [_bail_variable_name, _bail, true];
	[_player, _bail_variable_name, _bail] call stats_player_save;
};


player_get_bail = {
	private["_player"];
	_player = _this select 0;

	if (isNil "_player") exitWith {};

	private["_bail_variable_name"];
	_bail_variable_name = format["bail"];

	private["_bail_variable"];
	_bail_variable = _player getVariable _bail_variable_name;
	_bail_variable = if (isNil "_bail_variable") then { 0 } else { _bail_variable };
	_bail_variable = if (typeName _bail_variable != "SCALAR") then { 0 } else {_bail_variable };
	_bail_variable
};

player_prison_strip = {
	private["_player"];
	_player = _this select 0;

	if (isNil "_player") exitWith {};
	if (_player != player) exitWith {};
	if (not([_player] call player_human)) exitWith {};

	//remove stolen cash, and illlal items
	[_player] call INV_RemoveIllegal;
	if (stolencash > 0) then {
		[_player, stolencash] call player_lose_money;
		private["_message"];
		_message = format["%1-%2 was a bank robber, and has been charged $%3!", _player, (name _player), stolencash];
		[[], "mp_global_chat_message", [_message]] call mp_aware_me;
	};
	stolencash = 0;
};

interact_arrest_player = {
	private ["_player","_victim","_time","_bail"];
	_player = _this select 0;
	_victim = _this select 1;
	_time = _this select 2;
	_bail = _this select 3;
	
	if (count arrest_charges == 0) exitWith {
		player groupChat format ["You must specify charges for arresting this individual"];
		hint format ["You must specify charges for arresting this individual"];
	};
	
	detach _victim;
	format['[%1, %2] call player_prison_time;', _victim, _time] call broadcast;
	format['[%1, %2] call player_prison_bail;', _victim, _bail] call broadcast;
	format['[%1,%2] call player_prison_convict;', _victim,_player] call broadcast;
	
	_message = format["%1-%2 was arrested by %3-%4", _victim, (name _victim), _player, (name _player)];
	[[], "mp_global_chat_message", [_message]] call mp_aware_me;
	
	[_message,"Arrest"] call mp_log;
	
	[_player, "arrestsmade", 1] call player_update_scalar;

	_bounty = [_victim] call player_get_bounty;
	if (_bounty > 0) then {
		player groupChat format["%1-%2 had a bounty of $%3. You got that bounty!", _victim, (name _victim), _bounty];
		[player,10] call player_increase_rank;
		[_player, _bounty] call transaction_dynamiccuntflap;
		[_victim, 0] call player_set_bounty;

	};
	
	if (([player] call player_cop or [player] call player_opfor) and ([player] call player_insurgent)) then {
		[player,20] call player_increase_rank;
	};
	
	_charges = ": ";
	for "_i" from 0 to (count arrest_charges - 1) do {
		_charge = arrest_charges select _i;
		_string = _charge select 0;
		_count = _charge select 1;
		
		if (_i == (count arrest_charges - 1)) then {
			_charges = _charges + format ["%1 x%2",_string,_count];
		} else {
			_charges = _charges + format ["%1 x%2, ",_string,_count];
		};
	};
	
	_message = format ["%1 was arrested for %2", name _victim, _charges];
	[_message,"Arrest Reasons"] call mp_log;
	arrest_charges = [];
	[[], "mp_global_chat_message", [_message]] call mp_aware_me;
};
player_prison_persistence = {
	
	private ["_value","_time"];	
	_return = false;
	if (isNil "player_jailtime") exitWith {false};
	
	if (typename player_jailtime == "STRING") then {
		player_jailtime = parseNumber player_jailtime;
	};
	if (player_jailtime > 60) then {
		_time = player_jailtime / 60;
		_time = round _time;
		_message = format["%1-%2 has been sent to prison for %3 minute(s) to complete a sentence he was serving when he died/disconnected", player, (name player),_time];
		[[], "mp_global_chat_message", [_message]] call mp_aware_me;
		
		[player, _time] call player_prison_time;
		[player, 100] call player_prison_bail;
		[player,player] call player_prison_convict;
		_return = true;
	}; 
	_return
};
player_prison_convict = {
		private["_player", "_bail_left","_logic_pos","_marker_pos"];
		_victim = _this select 0;
		_player = _this select 1;
		if (isNil "_victim") exitWith {};
		if (_victim != player) exitWith {};
		if (not([_victim] call player_human)) exitWith {};	
		
		if (isNil "_player") exitWith {};
		if (not([_player] call player_human)) exitWith {};
		
		_bail_left = [_victim] call player_get_bail;
		[_victim,false] call player_set_arrest;
		
		if (not(player_jailtime > 0 && _bail_left > 0)) exitWith {};
		[_victim] call player_prison_strip;
		if (([_player] call player_cop) or ([_player] call player_civilian) or ([_player] call player_insurgent) or ([_player] call player_esu)) then {
			_logic_pos = getmarkerpos  "prisonspawn";
			_free_marker = getmarkerpos "jail_freemarker";
			[_victim, player_jailtime, _bail_left,_logic_pos,_free_marker] call prison_loop;
		};	
		if ([_player] call player_opfor) then {
			_logic_pos = getmarkerpos "prisonspawn_opf";
			_free_marker = getmarkerpos "jail_freemarker_opf";
			[_victim, player_jailtime, _bail_left,_logic_pos,_free_marker] call prison_loop;
		};
};

player_update_jail = {
	private ["_player"];
	_player = _this select 0;
	[format ["%1_persistent",getPlayerUID player], format ["%1_persistent",getPlayerUID player] , "JailTime",player_jailtime] call fn_SaveToServer;
};


prison_loop = {	
	_this spawn {
		private ["_player","_time_left","_time_original","_logic_pos","_free_marker"];
		_player = _this select 0;
		if ([_player] call player_get_arrest) exitWith {};
		_time_left = _this select 1;
		player_bail = _this select 2;
		_logic_pos = _this select 3;
		_free_marker = _this select 4;
		_time_original = _time_left;
	
		if (isNil "_player") exitWith {};
		if (isNil "_time_left") exitWith {};
		if (isNil "player_bail") exitWith {};
		if (isNil "_logic_pos") exitWith {};
		if (isNil "_free_marker") exitWith {};
		
		
		[_player] call player_reset_warrants;
		[_player, true] call player_set_arrest;
		[_player, "restrained", false] call player_set_bool;
		[_player, "ziptied", false] call player_set_bool;
		[_player, "stunned", false] call player_set_bool;
		INV_CanUseInventory = false;
		
		
		_player setpos _logic_pos;
		_player setDamage 0;
		[_player] call medical_system_heal;
		
		_bail_original = player_bail;
		_bail_increment = (player_bail / _time_original);
		_bail_increment = round _bail_increment;
		
		while {true} do {
		
			player_bail = player_bail - _bail_increment;

			if ((_time_left % 15) == 0) then {
				[_player, player_bail] call player_set_bail;
				player_jailtime = _time_left;
				[_player] call player_update_jail;
			};
			
			if (_time_left <= 0) exitWith {
				format ['server globalChat "%1 has served his full sentence and is now free.";',name _player] call broadcast;
				[_player] call player_prison_reset;
				player_jailtime = 0;
				[_player,_free_marker] call player_prison_release;
				[_player] call player_update_jail;
			};
			
			if (player_bail <= 0) exitWith {
				format ['server globalChat "%1 has posted bail and is now free.";',name _player]call broadcast;
				[_player] call player_prison_reset;
				[_player,_free_marker] call player_prison_release;
				[_player] call player_update_jail;
			};
			if !(alive _player) exitWith {
				format ['server globalChat "%1 has been shanked while in jail.";',name _player] call broadcast;
				[_player, player_bail] call player_set_bail;
				[_player,true] call player_set_arrest;
				[_player] call player_update_jail;
			};
			if !([_player] call player_get_arrest) exitWith {
				format ['server globalChat "%1 has been released from jail.";',name _player] call broadcast;
				[_player] call player_prison_reset;
				[_player,_free_marker] call player_prison_release;
				[_player] call player_update_jail;
			};
			
			
			if (_player distance _logic_pos >= 100) exitWith {
				format ['server globalChat "%1 has escaped from prison.";',name _player] call broadcast;
				INV_CanUseInventory = true; 
				[_player, false] call player_set_arrest;
				player_jailtime = 0;
				[_player, 0] call player_set_bail;
				[_player, "(prison-break)", 100000] call player_update_warrants;
				[_player] call player_update_jail;
			};
			hintsilent format ["Time Left:%1 Sec(s) \n Bail Left: $%2",_time_left,[ player_bail ,","] call format_integer];
			_time_left = _time_left - 1;
			uiSleep 1;
		};
	};
};
player_prison_release = {
	private["_player","_pos"];
	_player = _this select 0;
	_pos = _this select 1;
	
	if (isNil "_player") exitWith {};
	if (isNil "_pos") exitWith {};
	
	if ([_player] call player_civilian) then {
		_player setpos _pos;
	};	
	if ([_player] call player_cop) then {
		_player setpos (getMarkerPos "cop_base_spawn");
	};	
	if ([_player] call player_insurgent) then {
		_player setpos (getMarkerPos "ind_base_spawn");
	};
	if ([_player] call player_opfor) then {
		_player setpos (getMarkerPos "opf_base_spawn");
	};
	
	INV_CanUseInventory = true;
	_player setdamage 0;
};

player_prison_reset = {
	private["_player"];
	_player = _this select 0;
	[_player, false] call player_set_arrest;
	[_player, false] call player_set_mp_arrest;
	[_player,"adminjail", false] call player_set_bool;
	INV_CanUseInventory = true;
	_player setVariable ["north_prisoner",false,true];
	[_player, 0] call player_set_bail;
	[_player] call player_reset_warrants;
	player_jailtime = 0;
};

player_set_arrest = {
	private["_player", "_arrest"];
	_player = _this select 0;
	_arrest = _this select 1;

	if (isNil "_player") exitWith {};
	if (isNil "_arrest") exitWith {};

	if (typeName _arrest != "BOOL") exitWith {};

	private["_arrest_variable_name"];
	_arrest_variable_name = format["arrest"];

	_player setVariable [_arrest_variable_name, _arrest, true];
	[_player, _arrest_variable_name, _arrest] call stats_player_save;
};
player_set_mp_arrest = {
	private["_player", "_arrest"];
	_player = _this select 0;
	_arrest = _this select 1;

	if (isNil "_player") exitWith {};
	if (isNil "_arrest") exitWith {};

	if (typeName _arrest != "BOOL") exitWith {};

	private["_arrest_variable_name"];
	_arrest_variable_name = format["mparrest"];

	_player setVariable [_arrest_variable_name, _arrest, true];
	[_player, _arrest_variable_name, _arrest] call stats_player_save;
};
player_get_mp_arrest = {
	private["_player"];
	_player = _this select 0;

	if (isNil "_player") exitWith {};

	private["_arrest_variable_name"];
	_arrest_variable_name = format["mparrest", _player];

	private["_arrest_variable"];
	_arrest_variable = _player getVariable _arrest_variable_name;
	_arrest_variable = if (isNil "_arrest_variable") then {false} else {_arrest_variable};
	_arrest_variable = if (typeName _arrest_variable != "BOOL") then {false} else {_arrest_variable};
	_arrest_variable
};

player_get_arrest = {
	private["_player"];
	_player = _this select 0;

	if (isNil "_player") exitWith {};

	private["_arrest_variable_name"];
	_arrest_variable_name = format["arrest", _player];

	private["_arrest_variable"];
	_arrest_variable = _player getVariable _arrest_variable_name;
	_arrest_variable = if (isNil "_arrest_variable") then {false} else {_arrest_variable};
	_arrest_variable = if (typeName _arrest_variable != "BOOL") then {false} else {_arrest_variable};
	_arrest_variable
};