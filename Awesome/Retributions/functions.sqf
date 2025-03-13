//if (isServer && !isDedicated) exitWith {};
#define kvlist 5003

if (not(isNil "retribution_functions_defined")) exitWith {};

setablaze_player = {
	[] spawn {
		if (!(alive player)) exitWith {};

		private ["_damage"];
		format["[%1, 5, time, false,false] spawn BIS_Effects_Burn;", player] call broadcast;
		_damage = damage player;
		if (isNil "_damage" || typeName _damage != "SCALAR" || _damage < 0) then { _damage = 0;};
		while { _damage < 1 } do {
			format["[%1, player] say3D ""wilhelm"";", player] call broadcast;
			_damage = _damage + 0.1;
			player setDamage _damage;
			uiSleep 6;
		};
	};
};

get_near_vehicle_driver =  {
	private["_driver", "_near_vehicles"];
	_driver = nil;
	_near_vehicles = nearestObjects [getpos player, ["LandVehicle"], 20];
	//player groupChat format["Near VEHS: %1", _near_vehicles];
	{
		if ((speed _x > 10) and (not(isNull(driver _x)))) exitWith {
			_driver	= driver _x;
		};
	} forEach _near_vehicles;
	_driver
};

//INDEXES FOR DEATH-PARAMETERS DATA STRUCTURE
dp_killer = 0;
dp_victim  = 1;
dp_victim_side = 2;
dp_killer_side = 3;
dp_is_victim_armed = 4;
dp_victim_bounty = 5;
dp_is_victim_criminal = 6;
dp_is_teamkill = 7;
dp_justified = 8;
dp_is_suicide = 9;
dp_killer_name = 10;
dp_victim_name = 11;
dp_is_roadkill = 12;
dp_enemies = 13;
dp_killer_uid = 14;
dp_victim_uid = 15;

compute_death_parameters = {
	private["_killer", "_near_driver", "_killer_name", "_victim_name", "_roadkill", "_is_driver_near", "_suicide"];
	_killer = _this select 0;
	_near_driver =  [] call get_near_vehicle_driver;

	_killer_name = (name _killer);
	_victim_name = (name player);

	_roadkill = false;
	_is_driver_near = not(isNil "_near_driver");
	_suicide = (_killer_name == _victim_name);


	if (_suicide && _is_driver_near ) then {
		_killer = _near_driver;
		_killer_name = (name _near_driver);
		_roadkill = true;
		_suicide = false;
	};

	private["_victim_armed", "_victim_side", "_killer_side", "_victim_bounty", "_victim_criminal", "_teamkill", "_justified", "_enemies", "_killer_uid", "_victim_uid"];
	_victim_armed = [player] call check_armed_player;
	_victim_side = [player] call stats_get_faction;
	_killer_side = [_killer] call stats_get_faction;
	_victim_bounty = [player] call player_get_bounty;
	_victim_criminal =  (_victim_bounty > 0);
	_teamkill = (_victim_side == _killer_side) && (_victim_side != "Civilian");
	_justified = (_victim_armed || _victim_criminal);
	_enemies = ((_killer_side != _victim_side) && not((_victim_side == "Civilian") || (_killer_side == "Civilian")));
	_killer_uid = getPlayerUID _killer;
	_victim_uid = getPlayerUID player;

	private["_result"];
	_result = [];
	_result set [dp_killer, _killer];
	_result set [dp_victim, player];
	_result set [dp_victim_side, _victim_side];
	_result set [dp_killer_side, _killer_side];
	_result set [dp_is_victim_armed,  _victim_armed];
	_result set [dp_victim_bounty, _victim_bounty];
	_result set [dp_is_victim_criminal, _victim_criminal];
	_result set [dp_is_teamkill, _teamkill];
	_result set [dp_justified, _justified];
	_result set [dp_is_suicide, _suicide];
	_result set [dp_victim_name, _victim_name];
	_result set [dp_killer_name, _killer_name];
	_result set [dp_is_roadkill, _roadkill];
	_result set [dp_enemies, _enemies];
	_result set [dp_killer_uid, _killer_uid];
	_result set [dp_victim_uid, _victim_uid];

	//player groupChat format["RES: %1", _result];

	_result
};

substr = {
	private["_string"];
	_string = _this select 0;
	_offset = _this select 1;
	_length = _this select 2;

	if (isNil "_string") exitWith {""};
	if (typeName _string != "STRING") exitWith {""};

	if (isNil "_offset") exitWith {""};
	if (typeName _offset != "SCALAR") exitWith {""};
	if (isNil "_length") exitWith {""};
	if (typeName _length != "SCALAR") exitWith {""};

	private["_array", "_sub_array"];
	_array = toArray _string;

	private["_i", "_count"];
	_count = (count _array);
	_sub_array = [];

	_i = _offset;
	while { (_i < _count) &&  (_length > 0) } do {
		_sub_array = _sub_array + [ (_array select _i)];
		_i = _i + 1;
		_length = _length - 1;
	};

	if ((count _sub_array) == 0) exitWith {""};

	toString _sub_array
};


criminal_reward = {
	private["_player", "_bounty"];

	_player = _this select 0;
	_bounty = _this select 1;

	if (isNil "_player") exitWith {};
	if (isNil "_bounty") exitWith {};
	if (typeName _bounty != "SCALAR") exitWith {};

	if (_player != player) exitWith {};

	private["_reward"];
	_reward = floor(_bounty/3);
	[_player, _reward] call transaction_dynamiccuntflap;
	player groupChat format["You got 1/3 of the civs bounty totaling $%1", _reward];
};

collect_criminal_reward = {
	private["_dp"];
	_dp = _this select 0;

	private["_bounty", "_killer"];
	_bounty = _dp select dp_victim_bounty;
	_killer = _dp select dp_killer;

	if (_bounty <= 0) exitWith {};
	format["[%1, %2] call criminal_reward;", _killer, _bounty] call broadcast;
};

faction_reward = {
	private["_player", "_reward"];

	_player = _this select 0;
	_reward = _this select 1;

	if (isNil "_player") exitWith {};
	if (isNil "_reward") exitWith {};
	if (typeName _reward != "SCALAR") exitWith {};

	if (_player != player) exitWith {};

	[_player, _reward] call transaction_dynamiccuntflap;
	player groupChat format["You have received a reward of $%1 for killing an enemy", _reward];
	
	[[_player], "player_increase_rank", [_player,5]] call mp_aware_me;
};

collect_faction_reward = {
	private["_dp"];
	_dp = _this select 0;

	private["_reward", "_killer"];
	_killer = _dp select dp_killer;
	_reward = 30000;

	format["[%1, %2] call faction_reward;", _killer, _reward] call broadcast;
};

death_set_wanted = {
	private["_dp", "_reason", "_bounty"];
	_dp = _this select 0;
	_reason = _this select 1;
	_bounty = _this select 2;

	private["_roadkill", "_killer_side", "_victim_side", "_victim_name", "_killer"];
	_roadkill = _dp select dp_is_roadkill;
	_killer_side = _dp select dp_killer_side;
	_victim_side = _dp select dp_victim_side;
	_victim_name = _dp select dp_victim_name;
	_killer = _dp select dp_killer;

	if (_killer_side == "Cop") exitWith {};

	private["_vehicle_str"];
	_vehicle_str = if (_roadkill) then { ", vehicle" } else {""};

	private["_wanted_str"];
	_wanted_str = format["(%1, %2-%3%4)", _reason, _victim_side, _victim_name, _vehicle_str];
	//player groupChat format["Setting %1 wanted for %2", _killer, _wanted_str];
	[_killer, _wanted_str, _bounty] call player_update_warrants;
};


remove_vehicle_licenses = {
	private["_player"];
	_player = _this select 0;
	if (isNil "_player") exitWith {};

	if (_player != player) exitWith {};

	player groupchat "You have lost your vehicle licenses for reckless driving!";
	INV_LicenseOwner = INV_LicenseOwner - ["car","truck"];
	["licenses"] call RG_fnc_iSave;
};

remove_weapon_licenses = {
	private["_player"];
	_player = _this select 0;
	if (isNil "_player") exitWith {};
	if (_player != player) exitWith {};

	player groupchat "You are now wanted, and lost your gun licenses!";
	INV_LicenseOwner = INV_LicenseOwner - ["pistollicense","riflelicense","automatic","highcaliberrifle"];
	["licenses"] call RG_fnc_iSave;
};

remove_licenses = {
	private["_dp"];
	_dp = _this select 0;

	private["_killer_side", "_roadkill", "_killer"];
	_killer_side = _dp select dp_killer_side;
	_roadkill = _dp select dp_is_roadkill;
	_killer = _dp select dp_killer;

	if (_killer_side == "Cop") exitWith{};

	if (_roadkill) then {
		format["[%1] call remove_vehicle_licenses;", _killer] call broadcast;
	}
	else {
		format["[%1] call remove_weapon_licenses;", _killer] call broadcast;
	};
};


update_killer_stats = {
	private["_dp"];
	_dp = _this select 0;

	private["_suicide", "_victim_side", "_killer"];
	_suicide = _dp select dp_is_suicide;
	_victim_side = _dp select dp_victim_side;
	_killer = _dp select dp_killer;

	if (_suicide) exitWith {
		[_killer, "selfkilled", 1] call player_update_scalar;
	};

	if (_victim_side == "Civilian") exitWith {
		[_killer, "civskilled", 1] call player_update_scalar;
	};

	if (_victim_side == "Cop") exitWith {
		[_killer, "copskilled", 1] call player_update_scalar;
	};
};

tk_jail_cop = {
	private["_killer", "_victim"];
	_killer = _this select 0;
	_victim = _this select 1;

	if (isNil "_killer") exitWith {};
	if (isNil "_killer") exitWith {};

	if (_killer != player) exitWith{};

	[_killer, "roeprisontime", CopInPrisonTime] call player_set_scalar;
	[_killer] call player_prison_roe;
};


tk_penalty = {
	private["_dp"];
	_dp = _this select 0;

	private["_killer_side", "_killer", "_victim"];
	_killer_side = _dp select dp_killer_side;
	_killer = _dp select dp_killer;
	_victim = player;
	if !(_killer_side == "Cop") exitWith {};

	format['[%1, %2] call tk_jail_cop;', _killer, _victim] call broadcast;
};

time_penalty = {
	private["_dp"];
	_dp = _this select 0;
	private["_killer", "_killed_uid"];
	_killer = _dp select dp_killer;
	_killer_uid = getPlayerUID _killer;
	[_killer, "extradeadtime", 30] call player_update_scalar;
};

track_death = {
	private["_dp"];
	_dp = _this select 0;

	private["_victim", "_killer", "_suidice", "_victim_criminal", "_victim_armed", "_victim_side", "_killer_side", "_teamkill", "_enemies"];
	_victim = player;
	_killer = _dp select dp_killer;
	_suicide = _dp select dp_is_suicide;
	_victim_criminal = _dp select dp_is_victim_criminal;
	_victim_armed = _dp select dp_is_victim_armed;
	_victim_side = _dp select dp_victim_side;
	_killer_side = _dp select dp_killer_side;
	_teamkill = _dp select dp_is_teamkill;
	_enemies = _dp select dp_enemies;

	[_dp] call update_killer_stats;

	private["_bounty"];
	_bounty = 30000;

	suicided = _suicide;
	if (_suicide) exitWith {
		//no punishment here for suicide
	};

	if (_killer_side == "Cop") then {
		[_victim] call player_reset_warrants;
	};

	private["_armed_str"];
	_armed_str = if (_victim_armed) then { ", armed" } else {", unarmed"};

	private["_criminal_str"];
	_criminal_str = if (_victim_criminal) then { ", criminal" } else {", innocent"};

	private["_qualifier"];
	_qualifier = format["%1%2", _armed_str, _criminal_str];


	if ((_victim_side == "Civilian") and not(_victim_armed or _victim_criminal)) exitWith {
		[_dp] call time_penalty;
		[_dp] call remove_licenses;
		[_dp, format["aggravated-crime%1", _qualifier], _bounty] call death_set_wanted;
	};	
	if ((_victim_side == "ESU") and not(_victim_armed or _victim_criminal)) exitWith {
		[_dp] call time_penalty;
		[_dp] call remove_licenses;
		[_dp, format["aggravated-crime%1", _qualifier], _bounty] call death_set_wanted;
	};

	if ((_victim_side == "Insurgent") and (_killer_side == "Cop")) exitWith {
		[_dp] call collect_faction_reward;
	};	if ((_victim_side == "Cop") and (_killer_side == "Insurgent")) exitWith {
		[_dp] call collect_faction_reward;
	};

	if (_teamkill) exitWith {
		[_dp] call tk_penalty;
	};

	if (_victim_criminal and (_killer_side == "Cop")) then {
		[_dp] call collect_criminal_reward;
	};


	if ((_enemies) and (_victim_armed)) then {
		[_dp] call collect_faction_reward;
	}

	else { if (_killer_side == "Civilian" and _victim_side == "Civilian" and not(_victim_criminal) && _victim_armed) then {
		[_dp] call time_penalty;
		[_dp] call remove_licenses;
		[_dp, format["homicide%1", _qualifier], _bounty] call death_set_wanted;
	}
	else { if (_killer_side == "Civilian" and _victim_side == "Civilian" and _victim_criminal && not(_victim_armed)) then {
		[_dp] call time_penalty;
		[_dp, format["homicide%1", _qualifier], _bounty] call death_set_wanted;
	}
	else { if (_killer_side == "Civilian" and _victim_side == "Civilian" and _victim_criminal && _victim_armed) then {
		[_dp, format["homicide%1", _qualifier], _bounty] call death_set_wanted;
	}
	/*
	else { if (_killer_side == "Civilian" and _killerIsPMC and _victim_side == "Civilian" and _victim_criminal && _victim_armed) then {
		[_dp] call time_penalty;
	}
	*/
	else { if (_killer_side == "Civilian" and (_victim_side == "Opfor" or _victim_side == "Insurgent")) then {
		[_dp, format["vigilante-crime%1", _qualifier], 0] call death_set_wanted;
	}
	else { if (_killer_side == "Civilian" and (_victim_side == "Cop" or _victim_side == "ESU")) then {
		[_dp] call time_penalty;
		[_dp] call remove_licenses;
		[_dp, format["federal-crime%1", _qualifier], _bounty] call death_set_wanted;
	}

	else { if (_killer_side == "Opfor" and _victim_side == "Civilian") then {
		[_dp] call time_penalty;
		[_dp] call remove_licenses;
		[_dp, format["war-crime%1", _qualifier], _bounty] call death_set_wanted;
	}


	else { if (_killer_side == "Cop" and (_victim_side == "Civilian" or _victim_side == "ESU")) then {
		[_dp] call time_penalty;
	};};};};};};};};
};



victim = {
	private["_killer", "_victim"];
	//player groupChat format["In VICTIM!, _this = %1", _this];

	_killer = _this select 0;
	_victim = _this select 1;

	if (isNil "_killer") exitWith {};
	if (isNil "_victim") exitWith {};
	if (_victim != player) exitWith {};

	if([_victim] call player_get_dead) exitWith {};
	[_victim, true] call player_set_dead;

	if (not([_killer] call player_exists)) then {
		//hmm, do nothing ...
	}
	else { if (not([_killer] call player_human)) then {
		[_victim] call player_reset_warrants;

		private["_message", "_victim_name"];
		_victim_name = (name _victim);
		_message = nil;

		if([_killer] call player_opfor) exitWith {
			_message = format["%1 was killed by the South Takistan Liberation Army!", _victim_name];
		};

		if([_killer] call player_cop) exitWith {
			_message = format["%1 was killed by the UN Stabilization Forces!", _victim_name];
		};

		if([_killer] call player_insurgent) exitWith {
			_message = format["%1 was killed by the Insurgents!", _victim_name];
		};

		if (not(isNil "_message")) then {
			format['server globalChat (toString %1);', (toArray _message)] call broadcast;
		};
	}
	else {
		//player killed by human

		private ["_dp"];
		_dp = [_killer] call compute_death_parameters;
		format['["Died", "%1"] call Isse_AddCrimeLogEntry', player] call broadcast;
		format['server globalChat "%1";', ([_dp] call get_death_message)] call broadcast;

		//[_dp] call track_retributions;
		[_dp] call track_death;
	};};
};

get_death_message = {
	private["_dp"];
	_dp = _this select 0;

	private["_killer","_victim", "_suicide", "_victim_armed", "_victim_criminal", "_roadkill", "_victim_side", "_killer_side", "_victim_name", "_killer_name", "_teamkill", "_justified"];
	_killer = _dp select dp_killer;
	_victim = _dp select dp_victim;
	_suicide = _dp select dp_is_suicide;
	_victim_armed = _dp select dp_is_victim_armed;
	_victim_criminal = _dp select dp_is_victim_criminal;
	_roadkill = _dp select dp_is_roadkill;
	_victim_side = _dp select dp_victim_side;
	_killer_side = _dp select dp_killer_side;
	_victim_name = _dp select dp_victim_name;
	_killer_name = _dp select dp_killer_name;
	_teamkill = _dp select dp_is_teamkill;
	_justified = _dp select dp_justified;



	if (respawnButtonPressed) exitWith {
		_message = format["%1 commited suicide, by clicking on respawn", _victim_name];
		[_message, "Death"] call mp_log;
		_message
	};

	if (_suicide) exitWith {
		_message = format["%1 committed suicide", _victim_name];
		[_message, "Death"] call mp_log;
		_message
	};


	private ["_message", "_armed_str", "_vehicle_str", "_criminal_str"];

	_armed_str = "Unarmed";
	if (_victim_armed) then { _armed_str = "Armed";};

	_criminal_str = "";
	if (_victim_criminal) then { _criminal_str = "-Criminal";};

	_vehicle_str = "";
	if (_roadkill) then { _vehicle_str = " with a vehicle"; };

	if (((_victim_side == "Cop") and (_killer_side == "Opfor") and (jointops)) or ((_victim_side == "Opfor") and (_killer_side == "Cop") and (jointops))) exitWith {
		_message = format["(%1 - %7) killed %2 (%3%6 %4)%5 DURING JOINT OPS!", _killer_name, _victim_name, _armed_str, _victim_side, _vehicle_str, _criminal_str,_killer_side];
		[_message, "Death"] call mp_log;
		_message
	};

	if (_teamkill) exitWith {
		_message = format["%1 team-killed %2 (%3%6 %4)%5", _killer_name, _victim_name, _armed_str, _victim_side, _vehicle_str, _criminal_str];
		[_message, "Death"] call mp_log;
		_message

	};

	_message = format["(%1 - %7) murdered %2 (%3%6 %4)%5", _killer_name, _victim_name, _armed_str, _victim_side, _vehicle_str, _criminal_str,_killer_side];

	[_message, "Death"] call mp_log;

	_message
};

retribution_functions_defined = false;
