 //	@file Version: 1.0
//	@file Name: playerHud.sqf
//  @fie Author: [403] 5rockhopper4 <3
//	@original file Author: [404] Deadbeat
//	@file Created: 11/09/2012 04:23
//	@file Args:
//  @modified by: Ignace, Jim, and Sp3ctr3 of [RISE] Gaming

create_hud =
{
	hud_active = true;
	[] spawn hud_values;
	[] spawn hud_display;
};

fnc_timeToString = {
	private ["_in", "_format", "_min", "_hour", "_sec", "_msec"];
	_in = _this select 0;

	if (count _this > 1) then 
	{
		_format = _this select 1
	} else
	{
		_format = "HH:MM:SS"
	};

	_min = _in mod 1;
	_hour = _in - _min;
	_sec = (60 * _min) mod 1;
	_msec = (60 * _sec) mod 1;

	_hour = (if (_hour <= 9) then {"0"} else {""}) + str _hour;

	_min = (60 * _min) - ((60 * _min) mod 1);
	_min = (if (_min <= 9) then {"0"} else {""}) + str _min;

	_sec = (60 * _sec) - ((60 * _sec) mod 1);
	_sec = (if (_sec <= 9) then {"0"} else {""}) + str _sec;

	_msec = (60 * _msec) - ((60 * _msec) mod 1);
	_msec = (if (_msec <= 9) then {"0"} else {""}) + str _msec;

	switch _format do
	{
		case "HH": {format["%1",_hour]};
		case "HH:MM": {format["%1:%2",_hour,_min]};
		case "MM:SS": {format["%1:%2",_min,_sec]};
		case "HH:MM:SS": {format["%1:%2:%3",_hour,_min,_sec]};
		case "HH:MM:SS:MM": {format["%1:%2:%3:%4",_hour,_min,_sec,_msec]};
		case "ARRAY": {[_hour,_min,_sec,_msec]};
	};
};

hud_display =
{
	disableSerialization;
	uiSleep 3;
	1000 cutRsc ["RGHud","PLAIN DOWN",21600];
	while {hud_active} do
	{
		_ui = uiNameSpace getVariable "RGHud";
		_vitals = _ui displayCtrl 3600;
		_hudVehicle = _ui displayCtrl 3601;
		_missionUptimeText = _ui displayCtrl 3402;
		if (isNil "player_playtime") then {
			player_playtime = 0;
		} else {
			player_playtime = player_playtime + 1;
			player_total_playtime = player_total_playtime + 1;
		};		

		_timeText = [time/60/60] call fnc_timeToString;
		_missionUptimeText ctrlSetStructuredText parseText format["<t align='center' color='#990000' font='Zeppelin32' shadow='2' shadowColor='#000000' size='1'>Server Uptime: </t><t align='center' color='#FFFFFF' font='Zeppelin32' shadow='2' shadowColor='#000000' size='1'>%1</t>
		<t align='right' color='#990000' font='Zeppelin32' size='1'>Website: </t><t align='right' color='#FFFFFF' font='Zeppelin32' shadow='2' shadowColor='#000000' size='1'>www.rise-gaming.com</t>
		<br/>
		<t align='right' color='#990000' font='Zeppelin32' size='1'>TeamSpeak 3: </t><t align='right' color='#ffffff' font='Zeppelin32' shadow='2' shadowColor='#000000' size='1'>ts3.rise-gaming.com</t>", _timeText];

		_vitals ctrlSetStructuredText parseText format ["
				%1 <img size='0.8' image='resources\images\health.paa'/><br/>
				$%2 <img size='0.8' image='resources\images\wallet.paa'/><br/>
				$%3 <img size='0.8' image='resources\images\bank.paa'/><br/>
				%8 <img size='0.8' image='resources\images\armor.paa'/><br/>
				   <t size='0.9' color='#990000'>%4/%5</t> <t size='0.9' color='#ffffff'>:Weight</t><br/>
				   <t size='0.9' color='#990000'>RANK:</t> <t size='0.9' color='#ffffff'>%7</t><br/>
				   <t size='0.9' color='#ffffff'>%6</t><br/>
				   <t size='0.9' color='#ffffff'>%9</t><br/>
				   <t size='0.9' color='#ffffff'>%10</t><br/>
				   <t size='0.9' color='#ffffff'>%11</t>",
				   hud_health, [hud_invmoney,","] call format_integer, [hud_bankmoney,","] call format_integer, round(hud_weight), hud_maxWeight, hud_playerdesc,hud_player_rank,round hud_player_armor,hud_martiallawstatus,hud_warfarestatus,hud_jointopsstatus];

		if(player != vehicle player) then
		{
			_tempString = "";
			_yOffset = 0.80;
			_vehicle = assignedVehicle player;

			{
				if((driver _vehicle == _x) || (gunner _vehicle == _x)) then
				{
					if(driver _vehicle == _x) then
					{
						_tempString = format ["%1 %2 <img size='0.8' image='resources\images\driver.paa'/><br/>",_tempString, (name _x)];
						_yOffset = _yOffset + 0.04;
					}
					else
					{
						_tempString = format ["%1 %2 <img size='0.8' image='resources\images\gunner.paa'/><br/>",_tempString, (name _x)];
						_yOffset = _yOffset + 0.04;
					};
				}
				else
				{
					_tempString = format ["%1 %2 <img size='0.8' image='resources\images\cargo.paa'/><br/>",_tempString, (name _x)];
					_yOffset = _yOffset + 0.04;
				};
			} forEach crew _vehicle;

			_hudVehicle ctrlSetStructuredText parseText _tempString;
			_x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
			_y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
			_hudVehicle ctrlSetPosition [_x, _y, 0.4, 0.65];
			_hudVehicle ctrlCommit 0;
		};
		uisleep 1;
	};
};

hud_values =
{
	while {hud_active} do
	{
		hud_health = 100-(round((damage player) * 100));
		hud_invmoney = [player,"money"] call INV_GetItemAmount;
		hud_bankmoney = [player,"dynamiccuntflap"] call get_dynamiccuntflap;
		hud_weight = [] call INV_GetOwnWeight;
		hud_maxWeight = INV_CarryingCapacity;
		hud_playerdesc = STR player;
		if !([player] call player_civilian) then {hud_player_rank = [player] call player_get_rank_string};
		if (isciv) then {hud_player_rank = "No Rank"};
		hud_player_armor = player getVariable ["bodyarmor",0];
		hud_criminalstatus = [player] call player_get_wanted;
		
		if (warfare) then {hud_warfarestatus = "At War"} else {hud_warfarestatus = "Not At War"};
		if (martiallaw) then {hud_martiallawstatus = "Martial Law"} else {hud_martiallawstatus = "Not Martial Law"};
		
		if (hud_criminalstatus) then {hud_criminalstatus = "Wanted"} else {hud_criminalstatus = "Not Wanted"};
		uiSleep 1;
	};
};


hud_key_handle =
{
	hud_active = !hud_active;
	if (hud_active) then {[] spawn create_hud};
	true
};


[] call create_hud;