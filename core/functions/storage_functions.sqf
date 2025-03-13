lock_vehicle_storage = {
	private ["_vehicle","_content","_locked","_weapons","_magazines"];
	_vehicle = nearestObjects [player,["Car","Air"],5];
	_vehicle = _vehicle select 0;
	if !([player,_vehicle] call vehicle_owner) exitWith {player groupChat "You must own this vehicle to lock the storage"};
		
	_locked =  _vehicle getVariable ["storage_lock",false];
	if (_locked) exitWith {player groupChat format ["Your vehicle's storage is already locked, unlock it."];};
	
	_content = [[],[],[]];
	_weapons =  getWeaponCargo _vehicle;
	_magazines = getMagazineCargo _vehicle;
	_packs = getBackpackCargo _vehicle;
	_content set [0,_weapons];
	_content set [1,_magazines];
	_content set [2,_packs];
	
	clearMagazineCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;
	
	
	_vehicle setVariable ["storage_lock",true,true];
	_vehicle setVariable ["storage_content",_content,true];
	player groupChat "You have locked your vehicles storage";
};

lock_backpack_storage = {
	if (backpack_locked) exitWith {player groupChat format ["Your backpack's storage is already locked, unlock it."];};
	backpack_gear = [player] call player_get_backpack_gear;
	
	clearMagazineCargoGlobal (unitbackpack player);
	clearWeaponCargoGlobal (unitbackpack player);
	
	backpack_locked = true;
	player groupChat "You have locked your backpacks storage";
};
unlock_backpack_storage = {
	if !(backpack_locked) exitWith {player groupChat format ["Your backpack's storage is already unlocked, lock it."];};
	
	
	clearMagazineCargoGlobal (unitbackpack player);
	clearWeaponCargoGlobal (unitbackpack player);
	removeBackpack player;
	
	[player,backpack_gear] call player_set_backpack_gear;
	backpack_gear = [];
	
	backpack_locked = false;
	player groupChat "You have unlocked your backpacks storage";
};

unlock_vehicle_storage = {
	private ["_vehicle","_content","_locked","_weapons","_magazines","_i","_count","_type","_number"];
	_vehicle = nearestObjects [player,["Car","Air"],5];
	_vehicle = _vehicle select 0;
	if !([player,_vehicle] call vehicle_owner) exitWith {player groupChat "You must own this vehicle to unlock the storage"};

	_locked =  _vehicle getVariable ["storage_lock",false];
	if !(_locked) exitWith {player groupChat format ["Your vehicle's storage is already unlocked, lock it."];};
	
	_content = _vehicle getVariable "storage_content";
	if (isNil "_content" or typeName _content != "ARRAY") exitWith {};
	
	_weapons = _content select 0;
	_magazines = _content select 1;
	_packs = _content select 2;
	
	_count = (count (_weapons select 0)) -1;
	for "_i" from 0 to _count do {
		_type = (_weapons select 0) select _i;
		_number = (_weapons select 1) select _i;
		_vehicle addWeaponCargoGlobal [_type,_number];
	};	
	
	_count = (count (_packs select 0)) -1;
	for "_i" from 0 to _count do {
		_type = (_packs select 0) select _i;
		_number = (_packs select 1) select _i;
		_vehicle addBackpackCargoGlobal [_type,_number];
	};	
	
	_count = (count (_magazines select 0)) -1;
	for "_i" from 0 to _count do {
		_type = (_magazines select 0) select _i;
		_number = (_magazines select 1) select _i;
		
		if !(_type == "") then {
			_vehicle addMagazineCargoGlobal [_type,_number];
		};
	};
	_content = [[[],[]],[[],[]],[[],[]]];
	_vehicle setVariable ["storage_lock",false,true];
	_vehicle setVariable ["storage_content",_content,true];
	player groupChat "You have unlocked your vehicles storage";
};

lock_crate_storage = {
	private ["_vehicle","_content","_locked","_weapons","_magazines"];
	_vehicle = nearestObjects [player,["GuerillaCacheBox_EP1"],5];
	_vehicle = _vehicle select 0;
		
	_locked =  _vehicle getVariable ["storage_lock",false];
	if (_locked) exitWith {player groupChat format ["Your crates storage is already locked, unlock it."];};
	
	_content = [[],[],[]];
	_weapons =  getWeaponCargo _vehicle;
	_magazines = getMagazineCargo _vehicle;
	_packs = getBackpackCargo _vehicle;
	_content set [0,_weapons];
	_content set [1,_magazines];
	_content set [2,_packs];
	
	clearMagazineCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;
	
	
	_vehicle setVariable ["storage_lock",true,true];
	_vehicle setVariable ["storage_content",_content,true];
	player groupChat "You have locked your crates storage";
};

unlock_crate_storage = {
	private ["_vehicle","_content","_locked","_weapons","_magazines","_i","_count","_type","_number","_packs"];
	_vehicle = nearestObjects [player,["GuerillaCacheBox_EP1"],5];
	_vehicle = _vehicle select 0;
	//if !([player,_vehicle] call vehicle_owner) exitWith {player groupChat "You must own this vehicle to unlock the storage"};
	_locked =  _vehicle getVariable ["storage_lock",false];

	if !(_locked) exitWith {player groupChat format ["Your crates storage is already unlocked, lock it."];};
	
	_content = _vehicle getVariable "storage_content";
	if (isNil "_content" or typeName _content != "ARRAY") exitWith {};
	
	_weapons = _content select 0;
	_magazines = _content select 1;
	_packs = _content select 2;
	
	_count = (count (_weapons select 0)) -1;
	for "_i" from 0 to _count do {
		_type = (_weapons select 0) select _i;
		_number = (_weapons select 1) select _i;
		_vehicle addWeaponCargoGlobal [_type,_number];
	};		
	
	_count = (count (_packs select 0)) -1;
	for "_i" from 0 to _count do {
		_type = (_packs select 0) select _i;
		_number = (_packs select 1) select _i;
		_vehicle addBackpackCargoGlobal [_type,_number];
	};	
	
	_count = (count (_magazines select 0)) -1;
	for "_i" from 0 to _count do {
		_type = (_magazines select 0) select _i;
		_number = (_magazines select 1) select _i;
		
		if !(_type == "") then {
			_vehicle addMagazineCargoGlobal [_type,_number];
		};
	};
	_content = [[[],[]],[[],[]],[[],[]]];
	_vehicle setVariable ["storage_lock",false,true];
	_vehicle setVariable ["storage_content",_content,true];
	player groupChat "You have unlocked your crates storage";
};