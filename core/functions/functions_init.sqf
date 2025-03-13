


if (isServer) then {
	_h = [] execvm "core\functions\cleaner_functions.sqf"; waitUntil {scriptdone _h};
};

if (isClient) then {

	_h = [] execvm "core\functions\dialog_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\item_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\admin_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\inventory_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\medical_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\phone_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\interaction_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\key_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\arrest_functions.sqf"; waitUntil {scriptdone _h};


	_h = [] execvm "core\functions\drone_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\refinery_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\dog_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\dispatch_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\contracting_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\blindfold_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\animal_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\storage_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\bomb_functions.sqf"; waitUntil {scriptdone _h};
	_h = [] execvm "core\functions\vehiclemod_functions.sqf"; waitUntil {scriptdone _h};
};




_h = [] execvm "core\functions\stock_functions.sqf"; waitUntil {scriptdone _h};
//_h = [] execvm "core\functions\fuel_functions.sqf"; waitUntil {scriptdone _h};
//_h = [] execvm "core\functions\ranking_functions.sqf"; waitUntil {scriptdone _h};






functions_init_finished = true;