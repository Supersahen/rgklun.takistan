dev_console_open = {
	if !(createDialog "dev_console") exitWith {hint "Dialog Error"};

	for "_c" from 0 to ((count playerstringarray) - 1) do {
		_player_variable_name = playerstringarray select _c;
		_player_variable = missionNamespace getVariable [_player_variable_name, objNull];  // 	_player_variable = missionNamespace getVariable [_player_variable_name, objNull];

		if ([_player_variable] call player_exists) then { // original [_player_variable] call player_exists

			private["_player_name", "_index"];
			_player_name = (name _player_variable);
			_index = lbAdd [1500, format ["%1 - (%2)", _player_variable_name, _player_name]];
			lbSetData [1500, _index, format["%1", _player_variable]];

		};
	};
};

dev_console_exec = {
	_mode = _this select 0;
	_player = (call compile lbData [1500, lbCurSel 1500]);
	_code = ctrlText 1400;
	
	if !(isNil "_player" and _mode == "player") exitWith {
		[[_player], "mp_compile_code", [_code]] call mp_aware_me;
	};
	if (_mode == "all") exitWith {
		[[], "mp_compile_code", [_code]] call mp_aware_me;
	};
};
admin_temp_esp_activate = {

	if !(isStaff) exitWith {};
	_blu = [0,0,1,1];
	_red = [1,0,0,1];
	_green = [0,1,0,1];
	_white = [1,1,1,1];

	setGroupIconsVisible [true, true];
	esp_loop_toggle = true;
	while {esp_loop_toggle} do
	{
		{
			clearGroupIcons group _x;
			if ((alive _x) and (_x != player)) then
			{
				_color = [];
				if (side _x == west) then {_color = _blu;};
				if (side _x == east) then {_color = _red;};
				if (side _x == civilian) then {_color = _white;};
				if (side _x == resistance) then {_color = _green;};

				group _x addGroupIcon ["x_art"];
				group _x setGroupIconParams [_color, format ["[%1]-[%2m]",name _x,round(_x distance player)], 1, true];
			};
		} foreach (playableunits);
		uiSleep 0.2;
	};
};