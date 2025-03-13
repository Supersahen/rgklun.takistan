	
	titleText ["Preparing Client","PLAIN"]; // Displays text
	diag_log "Taki Life Init - Client Loading";
	
	[] execvm "mpframework\rise_framework_init.sqf"; 
	waitUntil {!isNil "rise_framework_initialized"};
	 
	[] execVM "briefing.sqf";
	[] execVM "Awesome\Functions\holster.sqf";
	[] execVM "clientloop.sqf";
	[] execVM "Scripts\gangs\gang_functions.sqf";
	[] execVM "respawn.sqf";
	[] execVM "Awesome\Functions\markers.sqf";
	[] execVM "Awesome\Functions\salary.sqf";
	[] ExecVM "Awesome\MountedSlots\functions.sqf";
	["client"] execVM "bombs.sqf";
	[] execvm "core\functions\fuel_functions.sqf";
	[] execVM "Awesome\Functions\factory_functions.sqf";
	player addEventHandler ["fired", {_this call A_fnc_EH_hFired}];
	player addEventHandler ["handleDamage", {_this call A_fnc_EH_hDamage}];
	player addEventHandler ["WeaponAssembled", {_this call A_fnc_EH_hWepasm}];
	[] execVM "onKeyPress.sqf";
	[] execVM "resources\dialogs\bait_actions.sqf";
	[] execvm "Scripts\gps_loop.sqf";
	[] execVM "resources\dialogs\hud\playerHud.sqf";
	[] execVM "core\functions\ranking_functions.sqf";
	[] execVM "nametags.sqf";
	[] execVM "RG\cLoad.sqf";
	//[] execvm "snow_effect.sqf";
	[] spawn {
		waitUntil {!isNil "bis_fnc_customGPS"};
		["ca\missions_pmc\data\ui_gps_ca.paa",-0.05,-0.2] call bis_fnc_customGPS;
	};
	[] execVM "Scripts\noafk.sqf";
	[] execVM "BTK\Cargo Drop\Start.sqf";
	
	diag_log "Taki Life Init - Client Loaded";
	titleText ["Client Initalized","PLAIN"];
	
	[] call mosque_remove;
	
	if (iscop) then {[] execvm "core\missions\coppatrol.sqf"};

	