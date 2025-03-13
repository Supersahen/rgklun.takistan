keys_dialog = {
	
	if (!(createDialog "schluessel")) exitWith { hint "Dialog Error!";};
		
	for "_c" from 0 to ((count playerstringarray) - 1) do {
		private["_player_variable_name", "_player_variable"];
		_player_variable_name = playerstringarray select _c;
		_player_variable = missionNamespace getVariable [_player_variable_name, objNull];

		if ([_player_variable] call player_human) then {
			private["_player_name"];
			_player_name = (name _player_variable);
			if ((_player_variable distance player) > 20 ) exitWith {};
			_index = lbAdd [6, format ["%1 - (%2)", _player_variable_name, _player_name]];
			lbSetData [6, _index, _player_variable_name];
		};
	};
   
   private["_vehicles"];
    _vehicles = [player] call vehicle_list;
    {
        if (not(isnull _x)) then {
			private["_index"];
            _index = lbAdd [1, format ["%1 (%2)", typeOf _x, _x]];
            lbSetData [1, _index, format ["%1", _x]];
        };
    } forEach _vehicles;
	
	buttonSetAction [5, 
	"
        if ((lbCurSel 1) > -1) then {
			_ref = lbCurSel 1;
			_vehicle = (([player] call vehicle_list) select _ref);
			[_vehicle,(lbData [6, (lbCurSel 6)])] call keys_give;
        };
        closedialog 0;
    "];
	
    buttonSetAction [2, 
	"
        if ((lbCurSel 1) > -1) then {
            [(([player] call vehicle_list) select lbCurSel 1), lbCurSel 1] call keys_use;
        };
        closedialog 0;
    "];

    buttonSetAction [4, 
	"
        if ((lbCurSel 1) > -1) then {
			[(([player] call vehicle_list) select lbCurSel 1), lbCurSel 1] call keys_drop;
        };
        closedialog 0;
    "];

};

keys_give = {

	private["_vcl"];
	private["_player_number", "_player_variable_name", "_player_number"];

    _vcl = _this select 0;
	_player_number = _this select 1;
		
	_player_number = call compile _player_number;

    
    if (not([_player_number] call player_exists))  exitWith {
        player groupChat localize "STRS_inv_not_ingame";
    };

    if (_player_number == player)   exitWith {
        player groupChat localize "STRS_inv_inventar_uebergabe_self";
    };
	
	private["_near_players"];
	_near_players = nearestobjects [getpos player, ["LandVehicle", "Air", "Man"], 20];
    if (not(_player_number in _near_players) && (player distance _player_number > 20)) exitWith {
        player groupChat localize "STRS_inv_inventar_uebergabe_distance";
    };

    if (not(alive _vcl) or (isNull _vcl)) exitWith {};
	
	(
		format [
		"
			if (player == %1) then {
				[player, %2] call vehicle_add;
				player groupChat localize ""STRS_inv_items_uebergabe_schluessel_success""
			};
		", _player_number, _vcl] 
	) call broadcast;
            
    player groupChat localize "STRS_inv_items_uebergabe_schluessel_success_self";
};
keys_use = {
	private["_vcl"];
    _vcl = _this select 0;
	
    if (player distance _vcl < 13) then {
        if (not(locked _vcl)) then {
            format ["%1 lock true;", _vcl] call broadcast;
            player groupChat localize "STRS_inv_items_vehiclelock_locked";
        } 
		else {
            format ["%1 lock false;", _vcl] call broadcast;
            player groupChat localize "STRS_inv_items_vehiclelock_unlocked";
        };
    } 
	else {
        player groupChat localize "STRS_inv_items_vehiclelock_closer";
    };
};
keys_drop = {
	private["_vcl"];
    _vcl = _this select 0;
    [player, _vcl] call vehicle_remove;
    player groupChat localize "STRS_inv_items_weggeworfen";

};