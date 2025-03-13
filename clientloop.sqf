#include "Awesome\Functions\macro.h"
if (not(isNil "client_loop_functions_defined")) exitWith {};

bank_monitor_threshold = 1000000;

monitor_bank_account = {
	private ["_new","_old","_diff","_message"];
	
	waitUntil {!isNil "stats_loaded"};
	
	while {true} do {
		_old = [player] call get_dynamiccuntflap;		
		waitUntil {([player] call get_dynamiccuntflap != _old)};
		_new = [player] call get_dynamiccuntflap;		
		_diff = _new - _old;
		if (_diff >= bank_monitor_threshold) then {
			_message = format ["%1 has aquired money in difference greater than %2 in their bank account. Their balance is now %3",name player,strM(bank_monitor_threshold),strM(_new)];
			[_message, "Money Monitor"] call mp_log;
		};
	};
};


check_armed_player = {
	private["_player"];
	_player = _this select 0;

	if ((primaryWeapon _player) != "") exitWith {true};
	if ((secondaryWeapon _player) != "") exitWith {true};
	
	//check if player is gunner
	private["_vehicle", "_in_vehicle", "_is_commander", "_is_driver", "_is_gunner"];
	_vehicle = (vehicle _player);
	_is_driver = (driver(_vehicle) == _player);
	_in_vehicle = (_vehicle != _player);
	_is_commander = (commander(_vehicle) == _player) && not(_is_driver);
	_is_gunner = (gunner(_vehicle) == _player);
	if (_in_vehicle && (_is_gunner || _is_commander))  exitWith { true };
	
	//Check if player has a suicide vest or similar bomb
	private["_armed_items"];
	//Remote bomb, timed bomb, activated bomb (ied), speed bomb, suicide vest, lighter
	_armed_items = ["selbstmordbombe", "lighter"];
	if([_player, _armed_items] call INV_HasItem) exitWith { true };
	
	//check if player has pistol
	private["_weapon"];
	_weapon = (currentWeapon _player);
	if ([_weapon, "GrenadeLauncher"] call shop_weapon_inherits_from) exitWith { true }; //Throw (Grenades), Put (IEDs)
	if ([_weapon, "PistolCore"] call shop_weapon_inherits_from) exitWith { true };
	if (call holster_pistol_in_inventory) exitWith { true };
	false;
};


compare_array = {
	private["_a", "_b"];
	_a = _this select 0;
	_b = _this select 1;
	if (isNil "_a") exitWith { false };
	if (isNil "_b") exitWith { false };
	if (typeName _a != "ARRAY") exitWith {false};
	if (typeName _b != "ARRAY") exitWith {false};
	if (count _a != count _b) exitWith {false};
	
	private["_i"];
	_i = (count _a) - 1;
	while {_i >= 0} do {
		if (str(_a select _i) != str(_b select _i)) exitWith { false };
		_i = _i - 1;
	};
	
	(_i == -1)
};


check_mobile = {
	private["_player"];
	_player = player;
	if (([_player, "handy"] call INV_GetItemAmount) == 1) exitWith {};	
	[_player, "handy", 1] call INV_SetItemAmount;
};

check_keychain = {
	private["_player"];
	_player = player;
	if (([_player, "keychain"] call INV_GetItemAmount) == 1) exitWith {};	
	[_player, "keychain", 1] call INV_SetItemAmount;
};


check_treefixer = {
	private["_player"];
	_player = player;
	if (([_player, "treefixer"] call INV_GetItemAmount) == 1) exitWith {};	
	[_player, "treefixer", 1] call INV_SetItemAmount;
};

check_inventory = {
	if (not(alive player)) exitWith {};
	
	private["_player"];
	_player = player;
	
	call check_mobile;
	call check_keychain;
	call check_treefixer;
};


cop_stun_gun_modify = {
	if ((!iscop) and (!isopf)) exitWith {};
	//if (isNil "weaponsloaded") exitWith {};
	//if (not(weaponsloaded)) exitWith {};
	if((player ammo (currentWeapon player)) <= 0) exitWith {};
	if (not(alive player)) exitWith {};
	
	if ((((currentWeapon player) == "M9" || (currentWeapon player) == "M9SD")) && ((currentMagazine player) == ("15Rnd_9x19_M9SD"))) then {	
		_magazines = magazines player;
		_magazines_count = {_x == "15Rnd_9x19_M9SD"} count (_magazines);
		_ammo = player ammo (currentWeapon player);
				
		if (_ammo > stunshotsmax) then {
			{
				if (_x == "15Rnd_9x19_M9SD") then {
					player removeMagazine _x;
				};
			} forEach _magazines;
						
			for "_c" from 0 to ((_magazines_count) -1 ) do {
				player addMagazine ["15Rnd_9x19_M9SD", stunshotsmax];
			};
		};
	};	
};

check_money = {
	private ["_player", "_money"];
	_player = player;
	
	_money = [player, 'money'] call INV_GetItemAmount;
	if (_money < 0) then {
		[_player, 'money', 0] call INV_SetItemAmount; 
		_money = 0;
	};
		
	if (_money > money_limit) then {
		[_player, 'money', money_limit] call INV_SetItemAmount; 
		player groupChat format["You can't carry more than $%1 in your inventory. Shekels were removed.", strM(money_limit)];
	}; 
};

check_bank = {
	private ["_bank_account", "_player"];
	_player = player;
	_bank_account = [_player] call get_dynamiccuntflap;
	
	if (_bank_account > bank_limit) exitWith {
		[_player, bank_limit] call set_dynamiccuntflap; 
		player groupChat format["You can't have more than $%1 in your bank account. Shekels were removed.", strM(bank_limit)];
	};
	if (_bank_account < 0) then {
		[_player, 0] call set_dynamiccuntflap;
	};
};

check_actions = {
	private["_vehicle"];
	_vehicle = (vehicle player);
	_in_vehicle = (_vehicle != player);
	if (not(_in_vehicle)) exitWith {};
		
	if ((typeOf _vehicle == "ArmoredSUV_PMC")) then {
		[_vehicle] call armored_suv_add_actions;
	};
	
	if (_vehicle isKindOf "Air") then {
		[_vehicle] call halo_jump_add_actions;
	};
	
	if (_vehicle isKindOf "Helicopter") then {
		//[_vehicle] call halo_jump_add_actions;
	};
	
};


check_factory_actions = {
	if (isCop or isopf) exitwith{};
	private["_player"];
	_player = player;
	private["_vehicle", "_in_vehicle"];
	_vehicle = (vehicle _player);
	_in_vehicle = (_vehicle != _player);
	
	private["_factory"];
	_factory = [_player, 5] call factory_player_near;
	if (isNil "_factory" || not(INV_shortcuts) || _in_vehicle || not(alive _player)) exitWith {
		[_player] call factory_remove_actions;
	};
	
	private["_factory_id"];
	_factory_id = _factory select factory_id;
	
	[_player, _factory_id] call factory_add_actions;
};



logics_check_object = 0;
logics_check_warn_distance = 1;
logics_check_teleport_distance = 2;

logics_checks = [
	[impoundarea1, 400, 100],
	[A_BIS_LOGIC, 1000, 1500]
];

check_logics = {
	private["_alive"];
	_alive = alive player;
	
	if (not(_alive)) exitWith {};

	{
		private["_entry", "_cdistance", "_logic", "_warn_distance", "_teleport_distance"];
		_entry = _x;
		
		_warn_distance = _entry select logics_check_warn_distance;
		_teleport_distance = _entry select logics_check_teleport_distance;
		_logic = _entry select logics_check_object;
		_distance = player distance _logic;
		
		
		if (_distance <= _teleport_distance) exitWith {
			[player] call player_teleport_spawn;
			player groupChat format["You have been teleported out of a restricted zone"];
		};
		
		if (_distance < _warn_distance) exitWith {
			titleText ["You are entering a restricted zone. Turn around!", "PLAIN DOWN"]
		};
		
	} forEach logics_checks;
};






check_static_weapons = {
	private["_vehicle","_isStatic"];
	_vehicle = (vehicle player);
	_isStatic = (_vehicle isKindOf "StaticWeapon");
	if (not(_isStatic)) exitWith {};
	
	_vehicle lock false;
};

iactionarr = [];

check_droppable_items = {
	private["_objects"];

	_objects = nearestobjects [getpos player, droppableitems, 5];
	
	{
		private ["_exit", "_i", "_array", "_object"];
		_exit = false;
		_object = _x;
		
		for "_i" from 0 to (count iactionarr) do {
			_array = iactionarr select _i;
			if !(isNil "_array") then {
				if(_object in _array) exitWith{ 
					_exit = true;
				};
			};
		};

		if(_exit) exitWith {};
		
		private["_near_players", "_near_players_count"];
		_near_players = [_object, 3] call players_object_near;
		_near_players_count = (count _near_players);
		//player groupChat format["_near_players = %1", _near_players];
		
		if (((_object distance player) < 3) && (_near_players_count < 2)) then {
			private["_amount", "_item", "_infos", "_name", "_action"];
			_array	= _object getvariable "droparray";
			if(isNil "_array") exitWith {};
			
			_amount	= [_array select 0] call decode_number;
			_item 	= _array select 1;
			_infos	= _item call INV_GetItemArray;
			_name	= _infos call INV_GetItemName;
			
			_action = player addaction [format["Pickup %1 (%2)", _name, _amount], "pickup.sqf", [_object, _item, ([_amount] call encode_number)]];
			iactionarr = iactionarr + [[_object, _action]];
		};	
	} foreach _objects;

	for [{_i=0}, {_i < (count iactionarr)}, {_i=_i+1}] do {
		private["_object", "_action", "_variable"];
		_array	= iactionarr select _i;
		_object    = _array select 0;
		_action = _array select 1;
		_variable	= _object getvariable "droparray";

		private["_near_players", "_near_players_count"];
		_near_players = [_object, 3] call players_object_near;
		_near_players_count = (count _near_players);
		if(isnull _object or _object distance player > 2 or (isnil "_variable") || _near_players_count > 1) then {	
			player removeAction _action;
			iactionarr set [_i, 0];
			iactionarr = iactionarr - [0];
		};
	};
};

check_restrains = {
	if (not(alive player)) exitWith {};
	
	if (testing) exitWith {};
	
	
	private["_physicallyRestrained", "_logicallyRestrained"];
	_physicallyRestrained = ((animationState player) ==  "civillying01");
	_logicallyRestrained = [player, "restrained"] call player_get_bool;
	_inVehicle = (vehicle player != player);
	
	if (_logicallyRestrained) then {
		if ((player == driver vehicle player) or (player == gunner vehicle player)) then {player action ["Eject", (vehicle player)];};
	};
	
	if(_inVehicle) exitWith {};
	
	if (_logicallyRestrained && not(_physicallyRestrained)) then {
		[[], "mp_anim_sync", [player,"switchmove","civillying01"]] call mp_aware_me;
		
	}
	else { if (not(_logicallyRestrained) && _physicallyRestrained) then {
		[[], "mp_anim_sync", [player,"switchmove","amovppnemstpsnonwnondnon"]] call mp_aware_me;
		[player, "isstunned", false] call player_set_bool;
		StunActiveTime=0;
	}
	else { if (_logicallyRestrained && _physicallyRestrained) then {
		if (not(([player, 50] call player_near_cops) or ([player, 50] call player_near_opf) or ([player, 50] call player_near_un))) then {
			[player, "restrained", false] call player_set_bool;
			player groupChat format["You have managed to unrestrain yourself!"];
		};
	};};};
};

check_zipties = {
	if (not(alive player)) exitWith {};
	
	private["_physicallyRestrained", "_logicallyRestrained"];
	_physicallyRestrained = ((animationState player) in player_ziptied_states);
	_logicallyRestrained = [player, "ziptied"] call player_get_bool;
	_inVehicle = (vehicle player != player);
	
	if (_logicallyRestrained) then {
		if ((player == driver vehicle player) or (player == gunner vehicle player)) then {player action ["Eject", (vehicle player)];};
	};
	
	if(_inVehicle) exitWith {};
	
	
	if (_logicallyRestrained && not(_physicallyRestrained)) then {
	
		[[], "mp_anim_sync", [player,"switchmove","civilsitting"]] call mp_aware_me;
		
	}
	else { if (not(_logicallyRestrained) && _physicallyRestrained) then {
		if (not(([player, 50] call player_near_cops) or ([player, 50] call player_near_opf) or ([player, 50] call player_near_civilians) or ([player, 50] call player_near_un))) then {
			[player, "ziptied", false] call player_set_bool;
			player groupChat format["You have managed to get out of the zipties!"];
		};
		[[], "mp_anim_sync", [player,"switchmove","boundCaptive_unaErc"]] call mp_aware_me;
		[player, "isstunned", false] call player_set_bool;
		StunActiveTime=0;
	}
	else { if (_logicallyRestrained && _physicallyRestrained) then {
	};};};
};
check_weapons = {
	
	_return = false;
	_weapon = currentWeapon player;
	
	if ((_weapon in vip_weapons_array) and (!isvip)) then {
	
		player removeWeapon _weapon;
		player groupChat "You were using a VIP Weapon as a non vip donator,It was deleted";
		_return = true;
	};
	
	_return
};



check_respawn_time = {
	if (not(alive player)) exitWith {};
	private["_interval"];
	_interval = 30;
	if (not((time % _interval) == 0)) exitWith {};
	[player, "extradeadtime", -(_interval)] call player_update_scalar;
	
};

reskin_unit = {

	private ["_player","_class"];
	_player = _this select 0;
	_class = typeof vehicle player;
	
	if ((_class == "RU_Soldier_Sniper") and osf) then {
		_player setVehicleInit ' this setObjectTexture [0, "#(argb,8,8,3)color(0.5412,0.5178,0.456,1,ca)"]';
		processInitCommands;
	};		
	
	if (_class == "Soldier_Crew_PMC" and iscop) then {
		_player setVehicleInit ' this setObjectTexture [0, "resources\images\police_skin.paa"]';
		processInitCommands;
	};		
	
	if (_class == "TK_CIV_Worker02_EP1" and isesu) then {
		_player setVehicleInit ' this setObjectTexture [0, "resources\images\medic.jpg"]';
		processInitCommands;
	};	
	
	if (_class == "SchoolTeacher" and iscop) then {
		_player setVehicleInit ' this setObjectTexture [0, "#(argb,8,8,3)color(0.1,0.1,0.1,0.5,ca)"]';
		processInitCommands;
	};		
	
	if (_class == "BAF_crewman_DDPM" and iscop) then {
		_player setVehicleInit ' this setObjectTexture [0, "#(argb,8,8,3)color(0.2,0.2,0.22,0.7,ca)"]';
		_player setVehicleInit ' this setObjectTexture [1, "#(argb,8,8,3)color(0.2,0.2,0.2,0.5,ca)"]';
		processInitCommands;
	};	
};

check_hacks = {
	
	if !(hacking_bitch) then {
		_alert = false;
		
		if !(isNil "LOKI_GUI_Key_Color") then {_alert = true};
		if !(isNil "LDL_initDone") then {_alert = true};
		if !(isNil "LDL_init") then {_alert = true};
		if !(isNil "LDL_options") then {_alert = true};
		if !(isNil "Request") then {_alert = true};
		if !(isNil "Request2") then {_alert = true};
		if !(isNil "LN_ListBoxSel") then {_alert = true};
		if !(isNil "LN_ListBoxSel") then {_alert = true};
		if !(isNil "keyhandler") then {_alert = true};
		if !(isNil "igodok") then {_alert = true};
		if !(isNil "ammunition") then {_alert = true};
		if !(isNil "frezok") then {_alert = true};
		if !(isNil "ZargabadDialog") then {_alert = true};
		if !(isNil "zargaCmb") then {_alert = true};
		if !(isNil "NEW_CALL_CODE") then {_alert = true};
		if !(isNil "cpLoopsDelay") then {_alert = true};
		if !(isNil "RAINBOWREMEXECVEH") then {_alert = true};
		if !(isNil "Rustler_Ride") then {_alert = true};
		if !(isNil "Dwarden") then {_alert = true};
		if !(isNil "i_n_f_i_S_T_A_R") then {_alert = true};
		if !(isNil "HarknessHaX") then {_alert = true};
		if !(isNil "executeglobal") then {_alert = true};
		if !(isNil "igodok") then {_alert = true};
	
		
		if (_alert) then {
			hacking_bitch = true;
			[[], "mp_screen_message", [format ["%1 is using loki lost key. You should report him to an admin immediately", name player]]] call mp_aware_me;
			_message = format ["%1 is using loki lost key. You should report him to an admin immediately", name player];
			[_message, "Anti Hack"] call mp_log;
		
		};
	};
};

client_loop = {
	
	client_loop_run = true;
	
	while {client_loop_run} do {
		call check_droppable_items;
		call check_factory_actions;
		call check_zipties;
		call check_restrains;
		call cop_stun_gun_modify;
		call check_inventory;
		call check_actions;
		call check_logics;
		call check_static_weapons;
		call check_respawn_time;
		call check_hacks;
		disableuserinput false;
		uiSleep 1;
	};
};

[] spawn client_loop;
[] spawn monitor_bank_account;

client_loop_functions_defined = true;