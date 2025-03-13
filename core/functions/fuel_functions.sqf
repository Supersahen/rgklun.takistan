fuel_loop = {
	private ["_pumps"];
	
	{_x setFuelCargo 0} foreach (nearestobjects [getpos copbase1, ["Land_Ind_FuelStation_Feed_Ep1"], 60000]);
	while {true} do {
		
		if (vehicle player != player) then {
		
			_pumps = nearestObjects [vehicle player, ["Land_Ind_FuelStation_Feed_Ep1"], 10];
			if (count _pumps > 0) then {
				_pump = _pumps select 0;
				[_pump] call fuel_add_actions;
				fuel_vehicle = vehicle player;
			};
		};
		uiSleep 1;	
	};
};
	
fuel_add_actions = {
	_pump = _this select 0;
	if (isNil "_pump") exitWith {};
	if !(isNil "fuel_action") exitWith {};
	
	_liter_price = call shop_get_fuel_price;
	_liters_missing = round((1 - (fuel fuel_vehicle)) * 100);
	_cost = round(_liters_missing *  _liter_price);
	
	if (isNil "_cost" or isNil "_liters_missing" or isNil "_liter_price") exitWith {};
	
	fuel_pump = _pump;
	while {!isNil "fuel_pump"} do {
		
		if (isNil "fuel_action") then {
			if (vehicle player != player and  fuel_vehicle distance fuel_pump <= 5) then {
				fuel_action = fuel_vehicle addAction [format["<t color='#3d74ff'>Fill Gas Tank For $%1</t>", _cost], "noscript.sqf", format["[%1] spawn fuel_tank", _liter_price], 1];
			
			};
		} else {
			if (vehicle player != player and  fuel_vehicle distance fuel_pump > 5) then {
				fuel_vehicle removeAction fuel_action;
				fuel_action = nil;
				fuel_pump = nil;
			};
		};
		
		uiSleep 1;
	};
};

fuel_tank = {
	if (refueling) exitWith {};
	refueling = true;
	
	private ["_fuel", "_liter_price","_liters_consumed", "_refuel_cost", "fuel_vehicle","_next_cost", "_player_money"];
	_liter_price = _this select 0;
	if (isNil "_liter_price") exitWith {};
	if (typeName _liter_price != "SCALAR") exitWith {};
	
	_fuel = fuel fuel_vehicle;
	_liters_consumed = 0;
	_refuel_cost = 0;
	
	titleText ["You are refueling your vehicle. Keep the engine off and do not move the vehicle.", "PLAIN DOWN"];
	if (isEngineOn fuel_vehicle) then {fuel_vehicle engineOn false};
	
	uiSleep 1;
	
	_exit = false;
	
	while {refueling} do {
		if (isEngineOn fuel_vehicle) then {_exit = true};
		if (speed fuel_vehicle > 1) then {_exit = true};
		if (player distance fuel_vehicle > 3) then {_exit = true};
		
		if ((fuel fuel_vehicle) < 0.99) then {
			
			_next_cost = round((_liters_consumed + fuel_pump_rate) * _liter_price);
			_player_money = ([player, 'money'] call INV_GetItemAmount);
			
			if (_player_money < _next_cost ) exitWith {
				player groupChat "You don't have enough money to refuel the vehicle completely.";
				_exit = true;
			};

			fuel_vehicle setFuel ((fuel fuel_vehicle) + 0.05);
			_liters_consumed = _liters_consumed + 1;
			
			titleText [ format["Refueling %1%2 ...", round(fuel fuel_vehicle * 100), "%"], "PLAIN DOWN"];
		} else {
			_exit = true;
		};

		if (_exit) exitWith {
			if (fuel fuel_vehicle > 0.99) then {
				titleText [ "You have stopped refueling because your vehicles tank is full", "PLAIN DOWN"];
			} else {
				titleText [ "You have stopped refueling", "PLAIN DOWN"];
			};
		};
		uiSleep 2;
	};
	
	uiSleep 1;
	
	if (_liters_consumed > 0) then {
		_refuel_cost = round((_liters_consumed * _liter_price));
		_percent_refueled =  round(fuel fuel_vehicle * 100);
		titleText[format["Your total refueling cost was $%1, your vehicle is now %2%3 full.", _refuel_cost, _percent_refueled, "%"], "PLAIN DOWN"];
		[_liters_consumed] call shop_update_fuel_consumed;
		[player, 'money', -(_refuel_cost)] call INV_AddInventoryItem;
	};
	
	refueling = false;
};

[] spawn fuel_loop;
