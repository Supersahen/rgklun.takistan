fuel_max_reserve        = 10000; //(how many liters in reserve)
fuel_per_barrel         = 100; //(how many liters in 1 barrel)
fuel_pump_rate          = 3; //(how fast in liters/second fuel is dispensed)
fuel_base_price         = 1; //(price of 1 liter of fuel)

waitUntil {!isNil "shop_set_fuel_consumed"};

if (isServer) then {
	[0] call shop_set_fuel_consumed; 
};