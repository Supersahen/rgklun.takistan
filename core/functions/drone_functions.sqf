
taki_drone_deploy = {
	
	removebackpack player;
	drone_deployed = true;
	taki_drone_height = 500;
	player groupChat "Preparing drone for takeoff";
	_location = [(getPos player select 0) + (1 * sin (getDir player)), (getPos player select 1) + (0.3 * cos (getDir player)),0];
	_logic_location =  getpos civ_logicunit;
	_pilot_name = format ["player_drone_pilot_%1", round (random 1000)];
	_gunner_name = format ["player_drone_gunner_%1", round (random 1000)];
	call compile format ["'FR_Light' createUnit [ %2, group player, 'this setVehicleVarName %1; %1 = this']; processInitCommands",_pilot_name,_logic_location];
	call compile format ["'FR_Light' createUnit [ %2, group player, 'this setVehicleVarName %1; %1 = this']; processInitCommands",_gunner_name,_logic_location];
	uiSleep 1;
	drone_pilot = (nearestObjects [getpos civ_logicunit , ["FR_Light"], 50]) select 0;
	drone_gunner = (nearestObjects [getpos civ_logicunit , ["FR_Light"], 50]) select 1;
		
	player_drone = "Pchela1T" createvehicle _location;
	player_drone setVariable ["isPlayerVehicle", true, true];
	
	drone_pilot moveInDriver player_drone;	
	drone_gunner moveInGunner player_drone;	
	
	player_drone setDir getdir player;
	
	
	drone_pilot stop true;
	player_drone lock true;

	if (isNil "drone_pilot" or isNil "drone_gunner" or isNil "player_drone") exitWith {systemChat "Drone failed to create"};
	player groupChat "Your drone is ready to become airborn";
	
	waitUntil {!(alive player_drone) or !(alive player) or !(alive drone_pilot) or !(alive drone_gunner)};
	
	objNull remoteControl drone_pilot;
	objNull remoteControl drone_gunner;
	vehicle player switchcamera "external";
	
	uiSleep 0.5;
	
	[] call taki_drone_destroy;
	player groupChat "DRONE: You have lost connections to your drone.";
	if !(isNil "drone_pilot") then {deleteVehicle drone_pilot};
	if !(isNil "drone_gunner") then {deleteVehicle drone_gunner};
	if !(isNil "player_drone") then {deleteVehicle player_drone};
	drone_deployed = false;
};
taki_drone_control_handle = {
	if (taki_drone_control_pos == 1) then {
		[2] call taki_drone_control;
		player groupChat "Now controlling drone gunner";
	} else {
		[1] call taki_drone_control;
		player groupChat "Now controlling drone pilot";
	};
};

taki_drone_alt = {
	
	_position = getposATL player_drone;
	_alt = _position select 2;
	player_drone flyInHeight _alt;
	drone_pilot action ["flapsUp", player_drone];
	player groupChat format ["DRONE: Minimum height changed to %1",_alt];
};

taki_drone_control = {
	private ["_mode"];
	_mode = _this select 0;
	if (isNil "player_drone" or isNil "drone_pilot" or isNil "drone_gunner") exitWith {systemChat "No drone pilot or drone to control"};
	
	if (isNil "drone_switch") then {
		drone_switch = player_drone addaction ["Switch Control","noscript.sqf","[] call taki_drone_control_handle",11,true,true,"",'drone_deployed'];
	};	
	if (isNil "drone_height_action") then {
		drone_height_action = player_drone addaction ["Set Height","noscript.sqf","[] call taki_drone_alt",11,true,true,"",'drone_deployed'];
	};
	if (isNil "drone_leave") then {
		drone_leave = player_drone addaction ["Leave Drone","noscript.sqf","[3] call taki_drone_control",11,true,true,"",'drone_deployed'];
	};
	
	switch (_mode) do {
		case 1 : {
			objNull remoteControl drone_pilot;
			objNull remoteControl drone_gunner;
			drone_pilot action ["flapsUp", player_drone];
			player remoteControl drone_pilot;
			player_drone switchCamera "EXTERNAL";
			taki_drone_control_pos = 1;
		};		
		
		case 2: {
			objNull remoteControl drone_pilot;
			objNull remoteControl drone_gunner;
			drone_pilot action ["flapsUp", player_drone];
			gunner player_drone removeweapon "nvgoggles";
			player_drone switchcamera "internal";
			player remoteControl gunner player_drone;
			_locked = locked player_drone;
			player_drone lock true;
			player_drone selectweapon (weapons player_drone select 0);
			enableteamswitch false;
			titletext ["","black in"];
			taki_drone_control_pos = 2;
		};		
		case 3 : {
			drone_pilot action ["flapsUp", player_drone];
			objNull remoteControl drone_pilot;
			objNull remoteControl drone_gunner;
			player switchCamera "EXTERNAL";
			taki_drone_control_pos = 3;
			drone_gunner stop true;
		};
	};
};

taki_drone_destroy = {
	drone_pilot setDamage 1;
	drone_switch = nil;
	drone_leave = nil;
	drone_height_action = nil;
	drone_gunner setDamage 1;
	drone_deployed = false;
};