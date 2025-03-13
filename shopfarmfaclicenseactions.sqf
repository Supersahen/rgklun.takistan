#include "Awesome\Functions\macro.h"

private ["_counter"];
_counter = 0;

private["_b1", "_b2", "_b3"];
_b1 = 0; _b2 = 0; _b3 = 0;

private["_c1", "_c2", "_c3"];
_c1 = 0; _c2 = 0; _c3 = 0;

private["_Arr1", "_Arr2"];
_Arr1 = [];
_Arr2 = [];

private["_i"];
for [{_i=0}, {_i < (count INV_FarmItemArray)},{_i=_i+1}] do {
	_Arr1 = _Arr1 + [0]
};

private["_i"];
for [{_i=0}, {_i < (count INV_Licenses)},{_i=_i+1}] do {
	_Arr2 = _Arr2 + [0]
};

shopusearray = [];
clothesusearray = [];
licenseusearray = [];

uiSleep 10;

//==================================SHOPACTIONS========================================

for [{_i=0}, {_i < (count INV_ItemShops)}, {_i=_i+1}] do {
	private["_object"];
	_object   = ((INV_ItemShops select _i) select 0);
	if !(isNil "_object") then {
		shopusearray = shopusearray + [_object];
	};
};

//===================================FARMING===============================================

while {true} do {
	for [{_i = 0}, {_i < (count INV_FarmItemArray)}, {_i = _i + 1}] do {
		_arr    = (INV_FarmItemArray select _i);
		_added  = (_Arr1 select _i);
		_isInArea = false;
		
		if((iscop or isopf) and ((_arr select 1) == "Whale" or (_arr select 1) == "Unprocessed_cocain")) exitWith {}; 
		
		{
			if (((vehicle player) distance (getMarkerPos (_x select 0))) < (_x select 1)) then {_isInArea = true;};
		} forEach (_arr select 0);

		_hasVehicle = false;

		{
			if ((vehicle player) isKindOf _x) then {_hasVehicle = true;};
		} forEach (_arr select 4);

		if ((_isInArea) and (_hasVehicle) and (speed (vehicle player) > 2 or ((_arr select 4) select 0) == "Ship")) then {
			[(_arr select 1), (_arr select 2), (_arr select 3), (_arr select 4)] execVM "gathergen.sqf";
		};
	};
	
	//=======================================================================================
			// NEW LICENESES
	//=======================================================================================
		for "_i" from 0 to (count INV_LicenseShops) do {
		_shop		= (INV_LicenseShops select _i);
		if (isNil "_shop") exitWith {};
		_object 	= _shop	select 0;
		if !(isNil "_object") then {
			if (player distance _object <= 4) then {
				if (_b1 == 0) then {
				
					call compile format ['
					LicenseAction	=	player addaction ["Buy Licenses", "noscript.sqf","[%1] call interact_license_buy", 1, false, true, "", ""];
					',_i];
					_b1 = 1;
					_c1 = _i;
				};	
			};
			
			if ((player distance _object > 4) and (_b1 == 1) and (_c1 == _i)	) then {
				player removeaction LicenseAction;
				_b1 = 0;
			};
		};
	};
	//======================================CLOTHING=========================================
	for "_i" from 0 to (count Clothing_shops) do {
		
		_CShopa		= (Clothing_Shops select _i);
		if (isNil "_CShopa") exitWith {};
		_object 	= _CShopa	select 0;
		clothesusearray = clothesusearray + [_object];

	};

	//======================================PAINT=========================================
	for "_i" from 0 to ((count Paint_Shops) - 1) do
	{

		_PShopa			= (Paint_Shops select _i);
		if (isNil "_pShopa") exitWith {};
		_PSpawn		 	= _PShopa	select 0;
		_PLocation_1 	= _PShopa	select 1;
		//_PLocation_2 	= _PShopa	select 2;

		_veh = vehicle player;

		if ( ( ((_veh) distance _PLocation_1) <= 10) && ( (_veh) != player) ) then {
				if (_b2 == 0) then {
					(_veh)  removeaction PAINTSHOPA1;
					PAINTSHOPA1	=	(_veh) addaction ["Access Car Painting", "Awesome\Paint\Paint Dialogs.sqf", [_PSpawn], 1, false, true, "", ""];
					_b2 = 1;
					_c2 = _i;
				};
			};
		
		if (	( (((_veh) distance _PLocation_1 ) > 10) || ((vehicle player) == player)) 	and		 (_b2 == 1) and (_c2 == _i)	) then {
				(_veh)  removeaction PAINTSHOPA1;
				_b2 = 0;
		};
	};

	uiSleep 1;
	_counter = _counter + 1;
	if (_counter >= 5000) exitwith {[] execVM "shopfarmfaclicenseactions.sqf"};
};
