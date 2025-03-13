dispatch_locations = [
	["dispatch_rasman","Rasman"],
	["dispatch_truckstop","Truck Shop"],
	["dispatch_vehfactory","Vehicle Factory"],
	["dispatch_copbase","Cop Base"],
	["dispatch_atc","North ATC"],
	["dispatch_bank","Bank"],
	["dispatch_rubies","Ruby Mine"],
	["dispatch_gunshop","Gun Store"],
	["dispatch_civspawn","Civ Spawn"],
	["dispatch_refinery","Resource Refinery"],
	["dispatch_gs1","Gas Station 1"]
];


dispatch_crimes = [
	"Assault",
	"Kidnapping",
	"Robbery",
	"Man With Gun",
	"Domestic",
	"Vehicle Theft",
	"Drugs"
];


dispatch_urgency = [
	"Urgent",
	"Medium",
	"Low Priority"
];


dispatch_report = {
	private ["_location","_type","_urgency","_callername"];
	_location = getpos player;
	_type = _this select 0;
	_urgency = _this select 1;
	_callername = name player;
	_location_string = [_location] call dispatch_get_location;
	if (isins) exitWith {};


	if (isNil "_type") exitWith {player groupChat format ["Please describe the crime"]};
	if (isNil "_urgency") then {_urgency = "low"};
	if (isNil "_callername") exitWith {};
	
	if (dispatch_cooldown) exitWith {systemChat "You can only file a police report once every minute."};
	
	dispatch_cooldown = true;

	format ['
		if (iscop) then {
			[%1,%2,%3,%4] spawn dispatch_receive;
		};
	',_location,str(_type),str(_urgency),str(_callername)] call broadcast;

	_data = [_location_string,_type,_urgency,_callername];
	[_data] call dispatch_add_database_entry;

	player sideChat "You have called the police.";
	
	uisleep 60;
	dispatch_cooldown = false;
};
dispatch_add_database_entry = {
	_data = _this select 0;
	_database = dispatch_database;
	if (isNil "_data") exitWith {};
	dispatch_database = dispatch_database + [_data];
	publicvariable "dispatch_database";

};
dispatch_accept = {
	dispatch_response = true;
};

dispatch_receive = {

	private ["_location","_type","_urgency","_callername","_caller"];
	if !(iscop) exitWith {};

	_location = _this select 0;
	_location_string = [_location] call dispatch_get_location;
	_type = _this select 1;
	_urgency = _this select 2;
	_callername = _this select 3;



	if (isNil "_location") exitWith {};
	if (isNil "_type") exitWith {};
	if (isNil "_urgency") exitWith {};
	if (isNil "_callername") exitWith {};

	dispatch_response = false;
	dispatch_active = true;

	hint parseText format["
		<img size='7' image='resources\images\dispatch.paa'/>
		<br/>
		<br/>
		<t align='center' size='1' font='Zeppelin32' color='#ffffff'>Caller Name: %4 </t><br/>
		<t align='center' size='1' font='Zeppelin32' color='#ffffff'>Crime Reported: %2 </t><br/>
		<t align='center' size='1' font='Zeppelin32' color='#ffffff'>Urgency: %3 </t><br/>
		<t align='center' size='1' font='Zeppelin32' color='#ffffff'>Location: %1 </t><br/>

		", _location_string,_type,_urgency,_callername];

		player say ["dispatchsound", 1];

	uiSleep 8;
	if (dispatch_response) then {

			dispatch_call = true;
			deleteMarkerLocal "dispatch_marker";
			deleteMarkerLocal "dispatch_flash";
			deleteWaypoint [(group player),0];

			_caller = [_callername] call player_get_player_by_name;
			if (isNil "_caller") exitWith {};

			_dispatch_marker = createMarkerLocal [ "dispatch_marker" , _location ];
			"dispatch_marker" setMarkerShapeLocal "ICON";
			"dispatch_marker" setMarkerTypeLocal "warning";
			"dispatch_marker" setMarkerColorLocal "ColorRed";
			"dispatch_marker" setMarkerTextLocal "911 Caller";

			_dispatch_flash = createMarkerLocal [ "dispatch_flash" , _location ];
			"dispatch_flash" setMarkerShapeLocal "ELLIPSE";
			"dispatch_flash" setMarkerColorLocal "ColorRed";
			"dispatch_flash" setMarkerSizeLocal [75, 75];
			player sideChat "You are responding to the call";
			
			//[] spawn dispatch_marker_flash;
	};

	dispatch_active = false;
};

dispatch_remove = {

	deleteMarkerLocal "dispatch_marker";
	deleteMarkerLocal "dispatch_flash";
	deleteWaypoint [(group player),0];
	player sideChat "You have ended the call you were on";
};

dispatch_marker_flash = {
	while {true} do {

		"dispatch_flash" setMarkerColorLocal "ColorBlue";
		uiSleep 0.7;
		"dispatch_flash" setMarkerColorLocal "ColorRed";

	};
};


dispatch_get_location = {
	private ["_location","_data","_return","_marker","_string"];
	_location = _this select 0;
	_return = nil;
	{
		_data = _x;
		_marker = _data select 0;
		_string = _data select 1;

		if ((_location distance (getmarkerpos _marker)) <= 200) then {_return = _string};

	}foreach dispatch_locations;
	

	if (isNil "_return") then {_return = format ["GRID: %1",mapGridPosition _location];};

	_return
};