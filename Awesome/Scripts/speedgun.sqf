SG_ON = false;

speedgun_max_speed = 200;
speedgun_db_knowledge_required = 15;

speedgun_db_knowledge_status_get =
{
	_vehicle = _this select 0;
	_knowledge = _this select 1;

	_info = "";
	_speed = round(speed _vehicle);
	if (_speed > speedgun_max_speed) then
	{
		_speed = format["Speed: +%1 kmph - Offlimit", speedgun_max_speed];
	} else 
	{
		_speed = format["Speed: %1 kmph", _speed];
	};
	
	if (_target iskindof "Air") then {
		_speed = getpos _vehicle;
		_speed = _speed select 2;
		_speed = format["Altitude: %1", round (_speed)];
	};
	
	if (_knowledge > speedgun_db_knowledge_required) then
	{
		_info = _vehicle call vehicle_get_owner;
	} else
	{
		_info = format["Looking up %1%2", round((_knowledge/speedgun_db_knowledge_required)*100),"%"];
	};
	
	format["%1 --- Registration: %2", _speed, _info]
};

speedgun_run =
{
	player groupchat "TIP: press spacebar, keep the circle on the target vehicle";
	_s = "";
	_knowledge = 0;
	while {SG_ON and (vehicle player != player) and (driver vehicle player == player)} do
	{
		_target = cursortarget;
		if ((_target iskindof "landvehicle") or (_target iskindof "Air")) then
		{
			while {_target == cursortarget} do
			{
				_knowledge = _knowledge +1;
				_s = [_target, _knowledge] call speedgun_db_knowledge_status_get;
				titletext [_s, "plain", 0.1];
				uiSleep 0.1;
			};
		};
		uiSleep 0.1;
		titletext ["No target", "plain", 0.1];
		_knowledge = 0;
	};

	SG_ON = false;
};


speedgun_db_vehicle_check =
{
	_vehicle = _this select 0;
	_player = _this select 1;
	
	((_vehicle iskindof "landvehicle") and (_player distance _vehicle < 6))
};

speedgun_db_vehicle_unreport =
{
	_vehicle = _this select 0;
	_player = _this select 1;
	
	if ((_vehicle getvariable["veh_status", ""]) == "") exitwith {player groupchat "Vehicle not wanted!";};
	_vehicle setvariable["veh_status", nil, true];
	player groupchat "Vehicle wanted status removed!";
	[[], "mp_global_chat_message", [Format["Vehicle %1 wanted status in copdatabase has been removed by %2", _vehicle, str(_player)]]] call mp_aware_me;
};
