_vcltp=false;
_vcl = _this select 0;
_art = _this select 1;

if(_art == "spawn_remove")then {
	_crew = crew _vcl;
	{
		_x action ["Eject",_vcl];
	} forEach _crew;
	//if ((count crew _vcl) > 0) exitWith {};
	
	uiSleep 1;
	
	if(_vcl distance impoundarea2 < 10)exitwith{};
	if(!alive _vcl)exitwith{deleteVehicle _vcl;};

	_vcl setpos [(getPosATL impoundarea1 select 0)-(random 50)+(random 50), (getPosATL impoundarea1 select 1)-(random 50)+(random 50), getPosATL impoundarea1 select 2];

	format['hint format["%1 has been impounded for blocking a spawn",  %1]', _vcl] call broadcast;
	_vcl setdamage 0;
	_vcl engineOn false;
	_vcl setvehiclelock "locked";
};

if(_art == "impound")then {
	if (isNil "_vcl") exitWith {};

	if ((count crew _vcl) > 0) exitWith {
		player groupChat "The vehicle is not empty!"
	};

	if(_vcl distance impoundarea2 < 30) exitwith {
		player groupchat "the vehicle is already impounded!"
	};	
	
	if(_vcl distance impoundarea1 < 500) exitwith {
		player groupchat "the vehicle is already impounded!"
	};
/*
	if(_vcl iskindof "air")exitwith { 
		player groupchat "you cannot impound this vehicle!"
	};
*/

	//if(!alive _vcl)exitwith{player groupchat "you cannot impound this wreck!"};
	if(!alive _vcl) exitwith {
		player groupchat "Removing Wreck"; deleteVehicle _vcl; 
	};

	_incarpark = false;

	//{if ((player distance (_x select 0)) < (_x select 1)) then {_incarpark = true};} forEach INV_VehicleGaragen;
	{if (_vcl in (list _x)) then {_incarpark = true};} foreach INV_VehicleGaragen;

	if(_incarpark) exitwith {
		player groupchat "this vehicle is in a carpark. you cannot impound it!"
	};

	_vcl setpos [(getPosATL impoundarea1 select 0)-(random 50)+(random 50), (getPosATL impoundarea1 select 1)-(random 50)+(random 50), getPosATL impoundarea1 select 2];
	player groupChat localize "STRS_inventar_impound_success";

	
	format['server globalChat format[localize "STRS_inventar_impound_gesehen", "%1", "(%2)", %3]', name player, player, _vcl] call broadcast;
	
	_message =  format [localize "STRS_inventar_impound_gesehen", name player, player, _vcl];
	[_message,"Impound"] call mp_log;
	
	[player, "money", 1000] call INV_AddInventoryItem;
	player groupchat "You have earned $1000 for impounding a vehicle.";
	
	
	_vcl setdamage 0;
	_vcl engineOn false;
	_vcl setvehiclelock "locked";
	
	interact_target = nil;
};

if(_art == "buy")then {
	_money = [player] call get_dynamiccuntflap;
	
	_infos = _vcl call INV_GetItemArray;
	_price = _infos call INV_GetItemBuyCost;
	_price = _price * impoundpaycoef;
	
	if (isNil "_price") then {_price = 5000};
	
	if(_money < _price) exitwith {
		player groupchat "you do not have enough shekels"
	};

	if(iscop and count (nearestobjects [getpos ccarspawn,["Ship","car","motorcycle","truck"], 3]) > 0)exitwith{player groupchat "there is a vehicle blocking the spawn!"};

	_vcl = call compile format["%1", _vcl];
	
	if (_vcl isKindOf "Air") exitWith {	
			if ((player distance (getpos airimpoundspawn_opf)) < 1000) exitWith {
			_vcl setpos getpos airimpoundspawn_opf;
			_vcl setdir getdir airimpoundspawn_opf;
			_vcltp=true;
			player groupchat format["You payed the $%1 fine and retrieved your vehicle!", _price];
			player groupchat format["Your vehicle has spawned at the air impound lot"];
			};
		_vcl setpos getpos airimpoundspawn;
		_vcl setdir getdir airimpoundspawn;
		_vcltp=true;
		player groupchat format["You payed the $%1 fine and retrieved your vehicle!", _price];
		player groupchat format["Your vehicle has spawned at the air impound lot"];
	};
	
	if (iscop and ((player distance (getpos ccarspawn)) < 300)) then {
		_vcl setpos getpos ccarspawn;
		_vcl setdir getdir ccarspawn;
		_vcltp=true;
	} else {
		_vcl setpos [(getPosATL impoundarea2 select 0)-(random 10)+(random 10), (getPosATL impoundarea2 select 1)-(random 10)+(random 10), getPosATL impoundarea2 select 2];
		_vcl setdir getdir impoundarea2;
		_vcltp=true;
	};
	
	if(isciv or isins)then {
		if (player distance getpos impoundarea2_opf < 1000) exitWith {
			_vcl setpos [(getPosATL impoundarea2_opf select 0)-(random 10)+(random 10), (getPosATL impoundarea2_opf select 1)-(random 10)+(random 10), getPosATL impoundarea2_opf select 2];
			_vcl setdir getdir impoundarea2_opf;
			_vcltp=true;
		};
		_vcl setpos [(getPosATL impoundarea2 select 0)-(random 10)+(random 10), (getPosATL impoundarea2 select 1)-(random 10)+(random 10), getPosATL impoundarea2 select 2];
		_vcl setdir getdir impoundarea2;
		_vcltp=true;
	};
	if !(isnil "_vcltp") exitWith {
	_vcltp=false;
	[player,-_price] call transaction_dynamiccuntflap;
	player groupchat format["You payed the $%1 fine and retrieved your vehicle!", _price];
	};
};

