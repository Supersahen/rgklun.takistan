bomb_active = false;
bomb_type = "";
bomb_target = nil;
// Make sure to create BOMB Detonator Item and EOD Kit Item 
 
 /*
	Sample Code
	["place",["dirty"]] call bomb_handler;
	["place",["car"]] call bomb_handler;
	["place",["suitcase"]] call bomb_handler;
	
	["activate",[]] call bomb_handler;
	["disarm",[]] call bomb_handler;
	
 */

bomb_handler = {
	private ["_mode"];
	_mode = _this select 0;
	_arguments = _this select 1;
	if (isNil "_mode" or isNil "_arguments") exitWith {diag_log "DEBUG: BOMB HANDLER: Nil mode or arguments"};
	
	switch (_mode) do {
		case "activate"  : {_arguments call bomb_activate};
		case "place" 	 : {_arguments call bomb_place};
		case "disarm"	 : {_arguments call bomb_disarm};
	};
};

bomb_disarm = {
	if (isNil "bomb_target") exitWith {player groupChat "You have no active bombs"};
	deleteVehicle bomb_target;
	bomb_active = false;
	bomb_target = nil;
	bomb_type = "";
	[player, "bomb_detonator",0] call INV_SetItemAmount;
	player groupChat "You have disarmed your bomb";
};

bomb_place = {
	private ["_type","_target","_exit"];
	if (bomb_active) exitWith {player groupChat "You may only have 1 armed bomb at a time."};
	_type = _this select 0;
	_exit = false;
	if (isNil "_type") exitWith {};
	
	switch (_type) do {
		case "car"  : {
			if (vehicle player == player) exitWith {_exit = true; player groupChat "You must be inside a car to place the bomb"};
			_target = vehicle player;
		};
		case "dirty" 	 : {
			if !(vehicle player == player) exitWith {_exit = true; player groupChat "You must be on foot to place this bomb;"};
			[] call shop_play_animation;
			_target = "Barrel5" createVehicle (getpos player);
		};
		case "suitcase"	 : {
			if !(vehicle player == player) exitWith {_exit = true; player groupChat "You must be on foot to place this bomb;"};
			[] call shop_play_animation;
			_target = "Suitcase" createVehicle (getpos player);
		};
	};
	
	if (_exit) exitWith {};
	bomb_type = _type;
	bomb_target = _target;
	
	player groupChat format ["You have armed a %1 bomb. Stay within 150 meters to detonate it.",_type];
	[player, "bomb_detonator",1] call INV_SetItemAmount;
	
	bomb_target setVariable ["bombarmed",true,true];
	bomb_active = true;
};

bomb_monitor = {
	private ["_target"];
	_target = _this select 0;
	
	waitUntil {((isNull _target) or !(_target getVariable "bombarmed") or !(alive player))};
	bomb_active = false;
};

bomb_effect = {
	if (isNil "bomb_type" or isNil "bomb_target") exitWith {diag_log "DEBUG: BOMB EFFECT: Nil Bomb Type or Nil Bomb Target"};
	
	if (bomb_type == "dirty") then {
		"bo_gbu12_lgb" createVehicle (getpos bomb_target);
		for "_i" from 0 to 20 do {
			_smoke = createVehicle ["SmokeShellOrange", [bomb_target] call FNC_getpos, [], 10, "CAN_COLLIDE"];
		};
		deleteVehicle bomb_target;
	};
	
	if (bomb_type == "car") then {
		"bo_gbu12_lgb" createVehicle (getpos bomb_target);
	};
	
	if (bomb_type == "suitcase") then {
		"grenade" createVehicle (getpos bomb_target);
		deleteVehicle bomb_target;	
	};
	
	[player, "bomb_detonator",1] call INV_SetItemAmount;
	bomb_active = false;
};

bomb_activate = {
	if !(bomb_active) exitWith {player groupChat "No bomb to detonate"};
	if (isNil "bomb_type" or isNil "bomb_target") exitWith {player groupChat "Something went horribly wrong"};
	if (vehicle player == bomb_target) exitWith {player groupChat "You cannot detonate a bomb while in the target vehicle"};
	if (player distance bomb_target > 150) exitWith {player groupChat "You are not within range to detonate your bomb"};
	if !(bomb_target getVariable "bombarmed") exitWith {player groupChat "Your bomb was defused."; };
	
	[bomb_type,bomb_target] call bomb_effect;
	[player, "bomb_detonator",0] call INV_SetItemAmount;
	player groupChat "You have detonated a bomb of yours";
};
