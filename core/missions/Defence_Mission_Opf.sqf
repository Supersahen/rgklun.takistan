/*
	[RISE] Sp3ctr3
	edited By Duck But Was Sp3ctr3 Pretty Much.
	Defence_Mission_Opf.sqf
*/

	if !(isopf) exitWith {};
	
	if (defense_active) exitWith {player groupChat "You are already on a defense mission"};
	
	_mission = defense_array_opf select floor random count defense_array_opf;;
	
	_name = _mission select 0;
	_location = _mission select 1;
	_Msg = _mission select 2;
	
	if (isNil "_location") exitWith {};
	if (isNil "_name") exitWith {};
	
	if (typeName _location != "ARRAY") exitWith {};
		
	defense_active = true;
	
	_marker = createMarkerLocal ["defense_marker",_location];
	"defense_marker" setMarkerColorLocal "ColorRed";
	"defense_marker" setMarkerShapeLocal "ICON";
	"defense_marker" setMarkerTextLocal " Defense Point";
	"defense_marker" setMarkerTypeLocal "Warning";
	
	_marker = createMarkerLocal ["defense_background",_location];
	"defense_background" setMarkerColorLocal "ColorYellow";
	"defense_background" setMarkerShapeLocal "ELLIPSE";
	"defense_background" setMarkerSizeLocal [150, 150];
	if !(isnil "_Msg") then {player groupChat format ["%1",_Msg];}
	else { player groupChat format ["You have been assigned to defend %1 from insurgents. Hold that area for 10 minutes for a reward of $200,000",_name];
};
	
	waitUntil {player distance _location < 150};
	
	[] spawn {
		player groupChat format ["You have entered the area to defend. Remain here for 10 Minutes. If you die or leave the area you do not get paid."];
		
		_time = 600;
		while {defense_active} do {
		
			if (player distance (getMarkerPos "defense_marker")> 150) then {
				player groupChat format ["You have left the defense area, you have failed."];
				defense_active = false;
			};
			if !(alive player) then {
				player groupChat format ["You have died while defending the area, you have failed."];
				defense_active = false;
			};
			
			if (_time <= 0) then {
				player groupChat format ["You have sucessfully defended the area. You have received $200,000."];
				[player,200000] call transaction_dynamiccuntflap;
				[player,15] call player_increase_rank;
				defense_active = false;
			};
			
			_time = _time - 1;
			uiSleep 1;
		};
	};
	
	waitUntil {!defense_active};
	
	deleteMarkerLocal "defense_marker";
	deleteMarkerLocal "defense_background";
	

