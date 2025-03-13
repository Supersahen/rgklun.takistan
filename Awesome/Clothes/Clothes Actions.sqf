
C_change_original = {
	if (!(C_haschanged)) exitwith {player groupchat "You are already in your original clothes";};
	private ["_class"];

	_class = C_original_c;
	[player, _class, false] spawn C_change;
	closeDialog 0;
};

// Called for just buying the clothes instead of buying and switching
C_shop_buy = {
	private ["_c_array", "_money", "_side", "_exit", "_c_name", "_c_class", "_c_display", "_c_side", "_c_fac", "_c_bool", "_c_cost", "_c_lic", "_i", "_license", "_haslic_i"];


	_c_array = _this select 0;

	_money = [player, "money"] call INV_GetItemAmount;
	_side = C_Side;
	_exit = false;
	C_change_fail = false;

	_c_name 	= _c_array select 0;
	_c_class	= _c_array select 1;
	_c_display 	= _c_array select 2;
	_c_side 	= _c_array select 3;
	_c_fac		= _c_array select 4;
	_c_bool 	= _c_array select 5;
	_c_cost 	= _c_array select 6;
	_c_lic 		= _c_array select 7;

	if (!((C_Side == _c_side) && (_c_bool))) then {
		player groupchat "C shop buy 1";
		player groupchat format["These clothes are not for your side: %1", C_Side];
		_exit = true;
	};

	for "_i" from 0 to (count _c_lic) do {
	/*for [{_i = 0}, {_i < count _c_lic}, {_i = _i + 1}] do {*/
		_license = (_c_lic select _i);
		_haslic_i = _license call INV_HasLicense;

		if (!(_haslic_i)) then {
			player groupchat format ['You require the license: %1',(_license call INV_GetLicenseName)];
			_exit = true;
		};
	};


	if (_money < _c_cost) then {
		_exit = true;
		call compile format ['player groupchat "You do not have enough shekels (Required: $%1)";', _c_cost];
	} else { if (!(_exit)) then {
		[player, "money", -(_c_cost)] call INV_AddInventoryItem;
		player groupchat format ['You bought: %1 for $%2', _c_display, _c_cost];
	};};

	if (_exit) exitwith {};

	if (not(_c_name in C_storage)) then {
		C_storage set [count C_storage, _c_name];
		call compile format ['C_storage_%1 set [count C_storage_%1, _c_name];', _side];
	};

};

// called for the switch from a shop action, sets up everything then calls the C_change function
C_change_shop = {
	private ["_c_array", "_shopnum", "_money", "_side", "_exit", "_c_name", "_c_class", "_c_display", "_c_side", "_c_fac", "_c_bool", "_c_cost", "_c_lic", "_i", "_license", "_haslic_i"];


	_c_array = _this select 0;
	_shopnum = C_shopnum;

	_money = [player, "money"] call INV_GetItemAmount;
	_side = C_Side;
	_exit = false;
	C_change_fail = false;

	_c_name 	= _c_array select 0;
	_c_class	= _c_array select 1;
	_c_display 	= _c_array select 2;
	_c_side 	= _c_array select 3;
	_c_fac		= _c_array select 4;
	_c_bool 	= _c_array select 5;
	_c_cost 	= _c_array select 6;
	_c_lic 		= _c_array select 7;

	//player groupChat format["_c_cost = %1", _c_cost];


	if (not((C_Side == _c_side) && (_c_bool))) then {
		player groupchat format["These clothes are not for your side: %1", C_Side];
		_exit = true;
	};

	for "_i" from 0 to (count _c_lic) do {
	/*for [{_i = 0}, {_i < count _c_lic}, {_i = _i + 1}] do {*/
		_license = (_c_lic select _i);
		_haslic_i = _license call INV_HasLicense;

		if (!(_haslic_i)) then {
			player groupchat format ['You require the license: %1',(_license call INV_GetLicenseName)];
			_exit = true;
		};
	};


	if (_money < _c_cost) then {
		_exit = true;
		call compile format ['player groupchat "You do not have enough money (Required: $%1)";', _c_cost];
	} else { if (!(_exit)) then {
		[player, "money", -(_c_cost)] call INV_AddInventoryItem;
		player groupchat format ['You bought: %1 for $%2', _c_display, _c_cost];
	};};


	if (_exit) exitwith {};


	if (!(_c_name in C_storage)) then {
		C_storage set [count C_storage, _c_name];
		call compile format ['C_storage_%1 set [count C_storage_%1, _c_name];', _side];
	};

	closeDialog 0;
	[player, _c_class, false] spawn C_change;

	uiSleep 3;
	if (C_change_fail) then {
		player groupchat "Switch failed, check your storage to attempt to switch again";
	};
};

// called for the switch from a storage action, sets up everything then calls the C_change function
C_change_storage = {
	private ["_c_array", "_side", "_exit", "_c_name", "_c_class", "_c_side", "_c_fac", "_c_bool", "_c_cost", "_c_lic","_i", "_license", "_haslic_i"];

	_c_array = _this select 0;

	_side = C_Side;
	_exit = false;

	_c_name = _c_array select 0;
	_c_class = _c_array select 1;
	_c_side = _c_array select 3;
	_c_fac = _c_array select 4;
	_c_bool = _c_array select 5;
	_c_cost = _c_array select 6;
	_c_lic = _c_array select 7;


	if (!((C_Side == _c_side) && (_c_bool))) then {
		player groupchat format["These clothes are not for your side: %1", C_Side];
		_exit = true;
	};

	for "_i" from 0 to (count _c_lic) do {
	/*for [{_i = 0}, {_i < count _c_lic}, {_i = _i + 1}] do {*/
		_license = (_c_lic select _i);
		_haslic_i = _license call INV_HasLicense;

		if (!(_haslic_i)) then {
			player groupchat format ['You require the license: %1',(_license call INV_GetLicenseName)];
			_exit = true;
		};
	};

	if ( (!(_c_name in C_storage)) && (_c_class != C_original_c) ) then {
		player groupchat "These clothes are not in your storage";
		_exit = true;
	};

	if (_exit) exitwith {};

	[player, _c_class, false] spawn C_change;
	closeDialog 0;
};

// Called on load
C_change_load = {
	private ["_class", "_side"];
	_side = C_Side;
	_class = _this select 0;
	([player, _class, true] call C_change)
};

// Transfers damage from old to new unit
C_transferDamage = {
	private["_old", "_new"];
	_old = _this select 0;
	_new = _this select 1;

	_new setDamage (damage _old);
};


// Replacing unit with new class
C_change = {
	private["_dynamiccuntflap", "_OldLicenses", "_inventory"];
	_dynamiccuntflap = [player] call get_dynamiccuntflap;
	_OldLicenses = INV_LicenseOwner;
	_inventory = [player] call player_get_inventory;
	_p_storage = [player, "private_storage"] call player_get_array;
	_f1_storage = [player, "Fabrikablage1"] call player_get_array;
	_f2_storage = [player, "AircraftFactory1"] call player_get_array;
	_f3_storage = [player, "Fabrikablage3"] call player_get_array;
	_f4_storage = [player, "Fabrikablage4"] call player_get_array;
	_f5_storage = [player, "Fabrikablage6"] call player_get_array;
	_f6_storage = [player, "Fabrikablage7"] call player_get_array;
	_f7_storage = [player, "Fabrikablage9"] call player_get_array;
	_f8_storage = [player, "Fabrikablage10"] call player_get_array;
	
	_reasons = [player] call player_get_reason; 
	_bounty = [player] call player_get_bounty;
	
	["player_rejoin_camera_complete"] call player_wait;

	if (C_changing) exitwith {player groupchat "C ERROR: already changing";};
	C_changing = true;

	private ["_class", "_oldUnit", "_rating", "_score", "_rank", "_damage", "_dummyUnit", "_newUnit", "_Gleader", "_x", "_c", "_uid", "_exit", "_sarmor", "_mask"];

	private["_first_time"];
	_oldUnit = _this select 0;
	_class = _this select 1;
	_first_time = _this select 2;

	if (not(_first_time)) then {
		titleText ["Changing Clothes", "BLACK OUT", 1];
		uiSleep 1.5;
	};

	private["_gear", "_inventory"];
	_gear = [_oldUnit] call player_get_gear;
	_inventory = [_oldUnit] call player_get_inventory;

	private["_position_atl", "_direction"];
	_position_atl = getPosATL _oldUnit;
	_direction = getDir _oldUnit;

	private["_failed_change"];
	_failed_change = {
		C_changing = false;
		C_change_fail = true;
		titleText ["Clothes - Failed", "BLACK IN", 0];
	};

	if (not([_oldUnit] call player_human)) exitWith { [] call _failed_change;};

	if ((_class in pmc_skin_list) && not(pmc)) exitWith {
		player groupchat "You cannot access PMC Shops: You are no in the whitelist";
		[] call _failed_change;
	};


	_score = score _oldUnit;
	_rank = rank _oldUnit;
	_sarmor = _oldUnit getVariable ["stun_armor", "none"];
	_mask = _oldUnit getVariable ["gasmask", false];

	_oldUnit switchCamera "INTERNAL";

	private["_temp_group"];
	_temp_group = (group server);
	if (isNull _temp_group) exitWith {
		player groupChat format["ERROR: Cannot change clothes, temporary group is null"];
		[] call _failed_change;
	};

	private["_group"];
	_group = (group _oldUnit);
	_newUnit = _group createUnit [_class, C_spawn, [], 0, "NONE"];

	if (isNull _newUnit) exitWith {
		player groupchat "ERROR: Cannot change clothes, could not create new unit";
		[] call _failed_change;
	};
	[_oldUnit, _newUnit] call stats_copy_variables;

	private["_var_name"];
	_var_name = vehicleVarName _oldUnit;
	clearVehicleInit _oldUnit;
	_oldUnit setVehicleVarName format["old_%1", _var_name];
	_newUnit setVehicleInit format['this setVehicleVarName "%1"; %1 = this;', _var_name];
	processInitCommands;

	[_newUnit] joinSilent _group;
	addSwitchableUnit _newUnit;
	selectPlayer _newUnit;
	_group selectLeader _newUnit;

	[_oldUnit, _newUnit] call C_transferDamage;

	[_oldUnit] call C_delete;

	_newUnit setRank _rank;
	_newUnit addscore _score;

	[_newUnit] call player_reset_gear;
	[_newUnit] call player_reset_side_inventory;
	[_newUnit, _gear] call player_set_gear;
	[_newUnit, _inventory] call player_set_inventory;


	[_newUnit, "private_storage",_p_storage] call player_set_array;
	[_newUnit, "Fabrikablage1",_f1_storage] call player_set_array;
	[_newUnit, "AircraftFactory1",_f2_storage] call player_set_array;
	[_newUnit, "Fabrikablage3",_f3_storage] call player_set_array;
	[_newUnit, "Fabrikablage4",_f4_storage] call player_set_array;
	[_newUnit, "Fabrikablage6",_f5_storage] call player_set_array;
	[_newUnit, "Fabrikablage7",_f6_storage] call player_set_array;
	[_newUnit, "Fabrikablage9",_f7_storage] call player_set_array;
	[_newUnit, "Fabrikablage10",_f8_storage] call player_set_array;

	_newUnit setVariable ["faction_rank",player_rank,true];
	
	_newUnit setVariable ["iscop",iscop,true];
	_newUnit setVariable ["isciv",isciv,true];
	_newUnit setVariable ["isesu",isesu,true];
	_newUnit setVariable ["isins",isins,true];
	_newUnit setVariable ["isopf",isopf,true];


	_newUnit setPosATL _position_atl;
	_newUnit setDir _direction;

	if (_class == C_original_c) then {
		C_haschanged = false;
		C_haschanged_c = _class;
	} else {
		C_haschanged = true;
		C_haschanged_c = _class;
	};

	[] spawn C_save;
	C_changing = false;

	role = _newUnit;

	_newUnit addEventHandler ["fired", {_this call A_fnc_EH_hFired}];
	_newUnit addEventHandler ["handleDamage", {_this call A_fnc_EH_hDamage}];
	_newUnit addEventHandler ["WeaponAssembled", {_this call A_fnc_EH_hWepasm}];
	_newUnit addEventHandler ["Killed", { _this call player_handle_mpkilled }];
	_newUnit addEventHandler ["Respawn", { _this call player_handle_mprespawn }];
	_newUnit setVariable ["stun_armor", _sarmor, true];
	_newUnit setVariable ["gasmask", _mask, true];
	[_newUnit, "isstunned", false] call player_set_bool;


	if (!(_first_time)) then {
		titleText ["Changing Clothes", "BLACK IN", 1];
		uiSleep 0.5;
	};
	
	
	
	_message = format ["%1 changed skins.",name player];
	[_message, "Skin Change"] call mp_log;
	
	[player,_reasons] call player_set_reason; 
	[player,_bounty] call player_get_bounty;
	
	[_newUnit, _dynamiccuntflap] call set_dynamiccuntflap;
	["all"] call RG_fnc_iSave;
	
	[_newUnit] call C_Change_Color;
	
	(_newUnit)
};

C_Change_Color = {
	private ["_unit","_class"];
	_unit = _this select 0;
	_class = typeOf _unit;
	
	if (_class == "BAF_crewman_DDPM") then {
	
		_unit setVehicleInit ' this setObjectTexture [0, "#(argb,8,8,3)color(0.2,0.2,0.22,0.7,ca)"]';
		_unit setVehicleInit ' this setObjectTexture [1, "#(argb,8,8,3)color(0.2,0.2,0.2,0.5,ca)"]';
		processInitCommands;
	};
	
	if (_class == "SchoolTeacher" and iscop) then {
		_unit setVehicleInit ' this setObjectTexture [0, "#(argb,8,8,3)color(0.1,0.1,0.1,0.5,ca)"]';
		processInitCommands;
	};
	
	if (_class == "USMC_LHD_Crew_Red") then {
		_unit setVehicleInit 'this setObjectTexture [0, "resources\images\admin_skin_jacket.jpg"]';
		_unit setVehicleInit 'this setObjectTexture [1, "resources\images\admin_skin_helmet.jpg"]';
		processInitCommands;
	};
};


// Deletes a unit
C_delete = { _this spawn {
	private ["_unit"];
	_unit = _this select 0;
	//if (not([_unit] call player_exists)) exitWith {};
	//_unit setPosATL [-1, -1, 0];
	//_unit setDamage 1;

	deleteVehicle _unit;
};};