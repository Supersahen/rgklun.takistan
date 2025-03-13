if (not(isNil "holster_functions_defined")) exitWith {};

holster_actions = [];

holster_pistol_in_hands = {
	([(currentWeapon player), "PistolCore"] call shop_weapon_inherits_from)
};
holster_smg_in_hands = {
	_weaponClass = currentWeapon player; 
	if !( _weaponClass in smg_array ) exitWith {false};
	true
};

holster_pistol_in_inventory =  {
	(([player, "pistol"] call INV_GetItemAmount) > 0)
};
holster_smg_in_inventory =  {
	(([player, "smg"] call INV_GetItemAmount) > 0)
};

holster_add_actions = {
	_player = _this select 0;
	if (isNil "_player") exitWith {};

	private["_holster_action", "_unholster_action"];
	
	_holster_action = _player addAction ["Holster pistol", "noscript.sqf", format['[%1] call holster_hide_weapon;', _player], 10, false, true,"", '_in_hands = (call holster_pistol_in_hands); _in_inv = (call holster_pistol_in_inventory); _in_hands && not(_in_inv)'];
	_unholster_action = _player addAction ["Unholster pistol", "noscript.sqf", format['[%1] call holster_show_weapon;', _player], 10, false, true,"", '_in_hands = (call holster_pistol_in_hands); _in_inv = (call holster_pistol_in_inventory); not(_in_hands) && _in_inv'];
	
	// SMG
	_holster_action_smg = _player addAction ["Holster SMG", "noscript.sqf", format['[%1] call holster_hide_weapon_smg;', _player], 10, false, true,"", '_in_hands = (call holster_smg_in_hands); _in_inv = (call holster_smg_in_inventory); _in_hands && not(_in_inv)'];
	_unholster_action_smg = _player addAction ["Unholster SMG", "noscript.sqf", format['[%1] call holster_show_weapon_smg;', _player], 10, false, true,"", '_in_hands = (call holster_smg_in_hands); _in_inv = (call holster_smg_in_inventory); not(_in_hands) && _in_inv'];

	
	holster_actions = [_holster_action, _unholster_action,_unholster_action_smg,_holster_action_smg];
};


holster_remove_actions = {
	private["_player"];
	_player = _this select 0;
	
	{	
		private["_action_id"];
		_action_id = _x;
		_player removeAction _action_id;
	} forEach holster_actions;
};

holster_hide_weapon = {
	private["_player"];
	_player = _this select 0;
	
	if (not(call holster_pistol_in_hands)) exitWith {
		player groupChat format["You have no pistol in your hands to holster"];
	};
	
	if ((call holster_pistol_in_inventory)) exitWith {
		player groupChat format["You already have a pistol in your inventory"];
	};
	
	INV_InventarPistol = currentWeapon(_player);
	player removeWeapon INV_InventarPistol;
	[_player, 'pistol', 1] call INV_SetItemAmount;
};
holster_hide_weapon_smg = {
	private["_player"];
	_player = _this select 0;
	
	if (not(call holster_smg_in_hands)) exitWith {
		player groupChat format["You have no smgs in your hands to holster"];
	};
	
	if ((call holster_smg_in_inventory)) exitWith {
		player groupChat format["You already have a pistol in your inventory"];
	};
	
	INV_InventarSmg = currentWeapon(_player);
	player removeWeapon INV_InventarSmg;
	[_player, 'smg', 1] call INV_SetItemAmount;
};


holster_show_weapon = {
	private["_player"];
	_player = _this select 0;
	if (not(call holster_pistol_in_inventory)) exitWith {
		_player groupChat format["You have no pistol in your inventory"];
		INV_InventarPistol = nil;
	};
	
	if (call holster_pistol_in_hands) exitWith {
		_player groupChat format["Cannot unholster inventory pistol, you already have a pistol in your hands"];
	};

	/*
	if (isNil "INV_InventarPistol") exitWith {
		_player groupChat format["The type of pistol in your inventory is unknown, removing it"];
		[_player, 'pistol', 0] call INV_SetItemAmount;
	};
	*/
	
	_player addWeapon INV_InventarPistol;
	_player selectWeapon INV_InventarPistol;
	[_player, 'pistol', 0] call INV_SetItemAmount;
	INV_InventarPistol = nil;
	_player action ["switchweapon", _player, _player, 0];
	
};
holster_show_weapon_smg = {
	private["_player"];
	_player = _this select 0;
	if (not(call holster_smg_in_inventory)) exitWith {
		_player groupChat format["You have no smg in your inventory"];
		INV_InventarSmg = nil;
	};
	
	if (call holster_smg_in_hands) exitWith {
		_player groupChat format["Cannot unholster inventory smg, you already have a smg in your hands"];
	};

	/*
	if (isNil "INV_InventarSmg") exitWith {
		_player groupChat format["The type of pistol in your inventory is unknown, removing it"];
		[_player, 'smg', 0] call INV_SetItemAmount;
	};
	*/
	
	_player addWeapon INV_InventarSmg;
	_player selectWeapon INV_InventarSmg;
	[_player, 'smg', 0] call INV_SetItemAmount;
	INV_InventarSmg = nil;
	_player action ["switchweapon", _player, _player, 0];
	
};


holster_functions_defined = false;