
esu_mission_object = nil;
esu_mission_details = [];
esu_mission_active = false;

esu_fire_locations = [
	["Garmarud",getMarkerPos "esu_missions_garmarud"], // Follow Format
	["Rasman",getMarkerPos "esu_missions_rasman"],
	["Bastam",getMarkerPos "esu_missions_bastam"],
	["Nagara",getMarkerPos "esu_missions_nagara"],
	["Truck Shop",getMarkerPos "esu_missions_truckshop"] 
];

esu_pipe_locations = [

];

esu_mission_ignite = {
	_object = _this select 0;
	if (isNull _object) exitWith {};
	[_object,5,time,false,true] execvm "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";

};

esu_fire_mission = {
	
	_location = (esu_mission_details select 1) select 1;
	_string =  (esu_mission_details select 1) select 0;
	
	_building = nearestObjects [_location ,esu_fire_houses,200];
	_building = _building select round random (count _building - 1);
	_location = getPosAtl _building;
	
	_message = format ["A building has burst into flames in %1. Go extinguish it quickly!",_string];
	[_message] call mp_esu_message;
	
	esu_mission_object = "Baseball" createVehicle _location;
	publicVariable "esu_mission_object";
	
	
	[esu_mission_object] call esu_mission_ignite;
	
	waitUntil {isNull esu_mission_object};
	
	_message = format ["Good work extinguishing the fire in %1. The community thanks you.",_string];
	[_message] call mp_esu_message;

	esu_mission_active = false;
	publicVariable "esu_mission_active";
};

esu_pipe_mission = {

	//waitUntil {};
	esu_mission_active = false;
	publicVariable "esu_mission_active";
};

esu_missions = [

	["Fire",esu_fire_locations,50000,esu_fire_mission]
	//["Pipe Burst",esu_pipe_locations,45000,esu_pipe_mission]
];


esu_fire_houses = [
	"Land_A_Office01_EP1",
	"Land_A_Stationhouse_ep1",
	"Land_House_C_1_EP1",
	"Land_House_C_2_EP1",
	"Land_House_C_3_EP1",
	"Land_House_C_4_EP1",
	"Land_House_C_5_EP1",
	"Land_House_C_5_V3_EP1",
	"Land_House_C_5_V1_EP1",
	"Land_House_C_5_V2_EP1",
	"Land_House_C_9_EP1",
	"Land_House_C_10_EP1",
	"Land_House_C_11_EP1",
	"Land_House_C_12_EP1",
	"Land_House_K_1_EP1",
	"Land_House_K_5_EP1",
	"Land_House_K_3_EP1",
	"Land_House_K_6_EP1",
	"Land_House_K_7_EP1",
	"Land_House_K_8_EP1",
	"Land_House_L_1_EP1",
	"Land_House_L_3_EP1",
	"Land_House_L_4_EP1",
	"Land_House_L_6_EP1",
	"Land_House_L_7_EP1",
	"Land_House_L_9_EP1",
	"Land_House_L_8_EP1"
];
esu_get_mission = {

	_details = false;
	if (esu_mssion_active) exitWith {false};
	_mission = esu_missions select round random (count esu_missions - 1);
	
	_location = (_mission select 1) select round random (count (_mission select 1) - 1);
	_string = _mission select 0;
	_pay =  _mission select 2;
	_function = _mission select 3;
	
	_details = [_string,_location,_pay,_function];
	_details
};


esu_mission_pay = {
	_pay = _this select 0;
	if !(isesu) exitWith {};
	[player, _pay] call transaction_dynamiccuntflap;
	player groupChat format ["You have recieved $%1 for your duty.",_pay];
};


esu_misson_loop = {
	if (isServer) then {
	
		while {true} do {
			
			_mission = [] call esu_get_mission;
			if (typeName _mission == "ARRAY") then {
					
					esu_mission_active = true;
					esu_mission_details = _mission;
					publicVariable "esu_mission_active";
					publicVariable "esu_mission_details";
					
					_function = _mission select 3;
					[] spawn _function; // May cause a problem. Not sure yet
					
					
				} else {
					diag_log format ["DEBUG: ESU missions not working. Function returns false"];
			};
			// Waits until esu mission is finished. 
			waitUntil {!esu_mission_active};
			
			// Pay our esu for their fine duty
			[[], "esu_mission_pay", [_mission select 2]] call mp_aware_me;
			
			// Redeclare base vars
			esu_mission_details = [];
			publicVariable "esu_mission_details";
			
			uiSleep 360; // Wait 5 Minutes
		};
	};
};



