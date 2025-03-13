/*




*/

bait_activate = {
	_vehicle = bait_car;



	(format['

		%1 lock true;
		%1 setHit ["wheel_1_1_steering", 1];
		%1 setHit ["wheel_1_2_steering", 1];
	'
	,_vehicle]) call broadcast;
};

bait_deactivate = {
	_vehicle = bait_car;
	
	(format['
		%1 lock false;
		%1 setHit ["wheel_1_1_steering", 0];
		%1 setHit ["wheel_1_2_steering", 0];
	'
	,_vehicle]) call broadcast;};


bait_cut = {
	[] call item_tracking_chip_disable;
	bait_car = nil;
};


bait_install = {

	_inVehicle = (vehicle player != player);
	_amount = [player,"bait"] call INV_GetItemAmount;
	if(_amount < 1) exitWith {player groupChat "You need a baitcar kit to use this function"};
	if !(_inVehicle) exitWith {player groupChat "You must install the bait car kit in the driver seat of a vehicle."};
	
	bait_car = (vehicle player);
	
	_name = (name vehicle player) + "'s vehicle";
	_id = str(random 50000);
	
	
	_id = createMarkerLocal [_id, (getpos bait_car)];
	_id setMarkerShapeLocal "ICON";
	_id setMarkerTypeLocal "DOT";
	_id setMarkerColorlocal "ColorRed";
	_id setMarkerTextlocal _name;
	trackers_arr = trackers_arr + [[_id, bait_car, _name]];
	
	if !(trackers_active) then
	{
		trackers_active = true;
		[] spawn start_tracker_loop;
	};
	
	[player, "bait", -1] call INV_AddInventoryItem;
	player groupChat "You have placed a bait car kit in this vehicle and fitted it with a GPS tracking chip.";
	
};

