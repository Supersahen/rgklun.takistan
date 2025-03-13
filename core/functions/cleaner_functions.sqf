
cleaner_max_vehicles = 100;
cleaner_max_items = 20;


cleaner_carmagedon = {
	private ["_time","_distance","_message","_var"];
	carmagedon = true;
	_message = format ["AUTO CARMAGEDON: The server has initiated a carmagedon due to an excessive amount of vehicles."];
	diag_log format ["Cleaner Loop: Carmagedon Started",_count];
	
	_time = 300;
	while {carmagedon} do {
		
		if (_time == 240) then {_message = format ["AUTO CARMAGEDON: You have 4 minute(s) to occupy your vehicle or it will be removed!"];};
		if (_time == 180) then {_message = format["AUTO CARMAGEDON: You have 3 minute(s) to occupy your vehicle or it will be removed!"];};
		if (_time == 120) then {_message = format ["AUTO CARMAGEDON: You have 2 minute(s) to occupy your vehicle or it will be removed!"];};
		if (_time == 60) then {_message = format ["AUTO CARMAGEDON: You have 1 minute(s) to occupy your vehicle or it will be removed!"];};
		if (_time == 30) then {_message = format ["AUTO CARMAGEDON: You have 30 second(s) to occupy your vehicle or it will be removed!"];};
		if (_time == 15) then {_message = format ["AUTO CARMAGEDON: You have 15 second(s) to occupy your vehicle or it will be removed!"];};
		if (_time == 0) then {
			carmagedon = false;
			_distance = 30000;
			_count = 0;
			{
				{
					if ({alive _x} count crew _x == 0) then {
						_var = _x getVariable "car_save";
						if (_var) exitWith {};
						deletevehicle _x;
						_count = _count + 1;
					};
				} foreach((getmarkerpos "civ_spawnpoint_northcivspawn") nearObjects [_x, _distance]);
				
			} forEach (droppableitems + ["LandVehicle", "Air", "Car", "Motorcycle", "CraterLong", "Bicycle", "UAV", "Wreck", "Wreck_Base", "HelicopterWreck", "UH1Wreck", "UH1_Base", "UH1H_base", "AH6_Base_EP1","CraterLong", "Ka60_Base_PMC", "Ka137_Base_PMC", "A10"]);
			_message = format ["AUTO CARMAGEDON: It is safe to leave your vehicles. Carmagedon is over. %1 vehicles were removed",_count];
			diag_log format ["Cleaner Loop: Carmagedon Ended",_count];
		};
	
		if !(isNil "_message") then {
			[[], "mp_global_chat_message", _message] call mp_aware_me;
			diag_log _message;
		};
		_message = nil;
		_time = _time - 1;
		uiSleep 1;
	};
};

cleaner_check_vehicles = {
	private ["_count","_owner","_vehicles"];
	_vehicles = nearestObjects [[0,0,0], ["Air","Car","Truck"], 100000];
	_count = count _vehicles;
	
	diag_log format ["Cleaner Loop: %1 vehicles were counted",_count];
	if (_count >= cleaner_max_vehicles) then {
		//[] spawn cleaner_carmagedon;
	};
	
	
	{
		//_owner = _x call vehicle_get_owner;
		//_owner = [_owner] call player_get_player_by_name;
		if (format ["%1",_x] == "convoytruck") exitWith {};
		if !([_x] call INV_IsPlayerVehicle) then {
			deletevehicle _x;
		};
	} foreach _vehicles;
};



cleaner_loop = {
	cleaner_loop_run = true;
	
	diag_log format ["Cleaner Loop: Loop Started"];
	while {cleaner_loop_run} do {
		uiSleep 360;
		[] call cleaner_check_vehicles;
		//[] call cleaner_check_ai;
		//[] call cleaner_check_items;
	};
};

[] spawn cleaner_loop;