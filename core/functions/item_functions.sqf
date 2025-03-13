if !(isNil "item_functions_defined") exitWith {};
#include "macro.h"
// Variables
INV_alkoholusesperre = 0;
INV_alkohol_usesperre = FALSE;
INV_AlkoholCounter = 0;
INV_hunger         = 25;
INV_HungerProSek   = 0.010;
INV_HungerSchaden  = 0.1;
INV_HungerStartVal = 25;
hungernachricht    = 0;

nofunction = {
	if (true) exitWith {};
};

item_refuel_can = {
	_vcl = nearestObjects [player, ["Car","Air"], 5];
	_vcl = _vcl select 0;
	_item = _this select 1;

	if (player != vehicle player) exitWith {player groupChat "You must be outside the vehicle to refuel it";};
	if (isNil {(nearestObjects [player, ["Car","Air"], 5]) select 0;}) exitWith {player groupChat "You are too far away to refuel the vehicle";};

	if ((fuel _vcl) == 1)  exitWith {
			player groupChat "There Is Already A Full Tank Of Fuel In The Vehicle";
	};


	if ((player distance _vcl < 5) and (speed _vcl < 1)) then {
		player groupchat "Refueling Vehicle!";
		[[], "mp_anim_sync", [player,"switchmove","AinvPknlMstpSlayWrflDnon_medic"]] call mp_aware_me;
		uiSleep 5;
		[[], "mp_anim_sync", [player,"switchmove","AinvPknlMstpSlayWrflDnon_medic"]] call mp_aware_me;
		uiSleep 5;
		_vcl setFuel 1;
		player groupChat localize "STRS_inv_items_refuel_refueled";
		[player, _item, -1] call INV_AddInventoryItem;
	};
};
item_repair_kit = {
	_item = _this select 1;
	_vcl = (nearestobjects [getpos player, ["LandVehicle", "Air"], 15] select 0);

	if (player != vehicle player) exitWith {player groupChat "You must be outside the vehicle to repair it";};
	if (player distance _vcl > 10) exitWith {player groupChat "You are too far away to repair the vehicle";};
	if ((damage _vcl) == 0) exitWith {player groupChat localize "STRS_inv_items_repair_notneeded";};

	player groupchat "Repairing! Stay close outside of vehicle";
	[player, _item, -1] call INV_AddInventoryItem;
	[[], "mp_anim_sync", [player,"switchmove","AinvPknlMstpSlayWrflDnon_medic"]] call mp_aware_me;
	uiSleep 5;
	[[], "mp_anim_sync", [player,"switchmove","AinvPknlMstpSlayWrflDnon_medic"]] call mp_aware_me;
	uiSleep 5;
	[[], "mp_anim_sync", [player,"switchmove","AinvPknlMstpSlayWrflDnon_medic"]] call mp_aware_me;
	uiSleep 5;
	if ((player distance _vcl < 10) and (!isPlayer _vcl) and (speed _vcl < 1)) then {
		_vcl setDamage 0;
		player groupChat localize "STRS_inv_items_repair_repaired";
	}
	else {
		[player, _item, 1] call INV_AddInventoryItem;
		player groupChat "Repairs canceled by moving or having someone inside vehicle";
	};
};
item_tracking_chip = {
	_vehicle = nil;
	if (vehicle player == player) then {
		_vehicle = (nearestobjects [getpos player, ["LandVehicle", "Air"], 5] select 0);
	} else {
		if (vehicle player != player) then {
			_vehicle = vehicle player;
		};
	};
	if (isNil "_vehicle") exitWith {player groupChat format ["No vehicle to track"];};

	if (vehicle player == player) then {
		[] call shop_play_animation;
	};

	_name = (name vehicle player) + "'s vehicle";
	_id = str(random 50000);


	_id = createMarkerLocal [_id, (getpos _vehicle)];
	_id setMarkerShapeLocal "ICON";
	_id setMarkerTypeLocal "DOT";
	_id setMarkerColorlocal "ColorRed";
	_id setMarkerTextlocal _name;

	trackers_arr = trackers_arr + [[_id, _vehicle, _name]];

	[player, "tracker", -1] call INV_AddInventoryItem;

	player groupChat "You have placed a GPS tracking chip in this vehicle.";

	if !(trackers_active) then
	{
		trackers_active = true;
		[] spawn start_tracker_loop;
	};
};
item_ziptie = {
	_victim = _this select 0;
	_state = animationstate _victim;

	if(!([_victim] call player_vulnerable))exitwith{
			player groupChat format["This person does not have their hands up, or is not subdued"];
		};

	if(_state in player_ziptied_states) exitwith
	{
		player groupchat "You have begun to take the zipties off of the bound captive";
		[[], "mp_anim_sync", [player,"switchmove","AinvPknlMstpSlayWrflDnon_medic"]] call mp_aware_me;
		uiSleep 5;
		(format ["%1 switchmove ""%2"";", _victim, "boundCaptive_unaErc"]) call broadcast;
		(format['server globalchat "%3 was released from zip ties by %2";', _victim, name player, name _victim]) call broadcast;
		[_victim , "ziptied",false] call player_set_bool;
		[_victim, "isstunned",false] call player_set_bool;
	};


	if(vehicle _victim != _victim)exitwith {player groupchat "the person is in a vehicle!"};


	if((([player, "ziptie"] call INV_GetItemAmount) < 1 && (([player, "ziptie_don"] call INV_GetItemAmount) < 1 )) && (([player, "ziptie_ill"] call INV_GetItemAmount) < 1 )) exitwith {player groupchat "You need a zip tie in your inventory in order to use this function."};

	(format ["%1 playmove ""%2"";", player, "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"]) call broadcast;

		_unit = player;
		format["
			_unit = %1;
			_distance = player distance _unit;
			if ( _distance <= 30 ) then
			{
				[_unit, player] say3D ""ziptie"";
			};
			", _unit] call broadcast;

	uiSleep 1;

	[_victim , "ziptied",true] call player_set_bool;
	[_victim, "isstunned",false] call player_set_bool;

	[player, 'ziptie',-1] call INV_AddInventoryItem;
	[player, 'ziptie_don',-1] call INV_AddInventoryItem;
	[player, 'ziptie_ill',-1] call INV_AddInventoryItem;

	(format['server globalchat "%3 was zip tied by %2";', _victim, name player, name _victim]) call broadcast;

	_message = format["%1 was zip tied by %2", name _victim, (name player)];
	[_message, "Ziptie"] call mp_log;
};
item_weaponbag = {

	_item   = _this select 1;

	if (vehicle player == player) then {
			_deleted = 0;
			{
				deleteVehicle _x;
				_deleted = _deleted + 1;
			} forEach (player nearObjects ["weaponholder", 5]);

			player groupChat format[localize "STRS_inv_items_weapondeleted", _deleted];
		} else {
			format ["clearWeaponCargo %1; clearMagazineCargo %1;", (vehicle player)] call broadcast;
			player groupChat "STRS_inv_items_weaponcargocleared";
			_deleted = 1;
	};

	if (_deleted > 0) then {
		[player, _item, -(1)] call INV_AddInventoryItem;
	};
};
item_bankcharge = {
	if (isCop or isOpf) exitWith {player groupChat "You cant rob the bank as a cop! Corruption is taken seriously here!"};
	if (isins) exitWith {player groupChat "You cannot rob the bank"};
	if !(Alive Player) exitWith {player groupChat "You are not alive?"};
	if ((Player Distance safe1) > 5) exitWith {Player groupChat "You must be within five meters of the safe to place the charge!"};
	if ({side _x == west} count playableUnits < 5) exitWith {player groupChat "There are not enough cops online! You need a max of five cops to rob the bank!"};
	if (!([player] call check_armed_player)) exitWith {player groupChat format ["You are not allowed to rob the bank at this time as you are not armed! The security guard refuses to let you through!"]};
	[] Spawn {
	_object = createVehicle ["Explosive", (getPos safe1), [], 0, "NONE"];
	_object attachTo [safe1, [0.9,-0.3,0.5]];
	_object setVectorUp [1,0,0];

	_object2 = createVehicle ["Explosive", (getPos safe1), [], 0, "NONE"];
	_object2 attachTo [safe1, [0.9,-0.5,0.2]];
	_object2 setVectorUp [1,0,0];
	_object2 setDir 90;

	_object3 = createVehicle ["Explosive", (getPos safe1), [], 0, "NONE"];
	_object3 attachTo [safe1, [0.9,-0.3,-1]];
	_object3 setVectorUp [1,0,0];

	_object4 = createVehicle ["Explosive", (getPos safe1), [], 0, "NONE"];
	_object4 attachTo [safe1, [0.9,0.3,0.2]];
	_object4 setVectorUp [1,0,0];
	_object4 setDir 90;

	_object5 = createVehicle ["Explosive", (getPos safe1), [], 0, "NONE"];
	_object5 attachTo [safe1, [0.9,0.2,0]];
	_object5 setVectorUp [1,0,0];

	shapedchargetimer = 60;
	player groupChat "Placing shaped charge! Stand back!";
	[[], "mp_anim_sync", [player,"switchmove","AinvPknlMstpSlayWrflDnon_medic"]] call mp_aware_me;
	UIsleep 5;
	while {shapedchargetimer > 0} do {
		shapedchargetimer = shapedchargetimer - 1;
		titleText [(format ["Shaped Charge Detonation In %1 Seconds", shapedchargetimer]), "PLAIN"];
		if (shapedchargetimer == 30) then {
		_totalamountstolen = bank_gold_bars * 100000;
		format['[%1] execVM "bankrob_victim.sqf"',_totalamountstolen] call broadcast;
		};
		if (shapedchargetimer == 0) then {
			"grenade" createVehicle (getPos _object);
			UIsleep 0.6;
			"grenade" createVehicle (getPos _object2);
			"grenade" createVehicle (getPos _object3);
			"grenade" createVehicle (getPos _object4);
			UIsleep 1;
			"grenade" createVehicle (getPos _object5);
			deleteVehicle _object;
			deleteVehicle _object2;
			deleteVehicle _object3;
			deleteVehicle _object4;
			deleteVehicle _object5;
			_totalamountstolen = bank_gold_bars * 100000;
			if (_totalamountstolen == 100000) then {
				player groupChat "The shaped charge has exploded! But the Safe was empty!";
			};
			if (_totalamountstolen > 100000) then {
				player groupChat "The shaped charge has exploded! Get as many gold bars before the cops arrive!";
				[] execVM "bankrob.sqf";
			};
		};
		UIsleep 1;
	};
	};
	[player, "shape_charge", -1] call INV_AddInventoryItem;
};
item_bodyarmor_20 = {
	_bodyArmor = player getVariable "bodyarmor";
	_armor = 40;
	player setVariable ["bodyarmor",_armor,false];
	player groupChat format ["You have equipped bodyarmor. It can absorb %1 points of damage",_armor];
	[player, "bodyarmor_20",-1] call INV_AddInventoryItem;
	[player, "bodyarmor_20_ill",-1] call INV_AddInventoryItem;
	[[],"mp_play_sound",[player,30,"bodyarmor"]] call mp_aware_me;
};
item_bodyarmor_50 = {
	_bodyArmor = player getVariable "bodyarmor";
	_armor = 100;
	player setVariable ["bodyarmor",_armor,false];
	player groupChat format ["You have equipped bodyarmor. It can absorb %1 points of damage",_armor];
	[player, "bodyarmor_50",-1] call INV_AddInventoryItem;
	[[],"mp_play_sound",[player,30,"bodyarmor"]] call mp_aware_me;
};
item_bodyarmor_100 = {
	_bodyArmor = player getVariable "bodyarmor";
	_armor = 125;
	player setVariable ["bodyarmor",_armor,false];
	player groupChat format ["You have equipped bodyarmor. It can absorb %1 points of damage",_armor];
	[player, "bodyarmor_100",-1] call INV_AddInventoryItem;
	[[],"mp_play_sound",[player,30,"bodyarmor"]] call mp_aware_me;
};

item_breaching_ladder = {
	_ladders = nearestObjects [player, ["Land_ladderEP1","Land_ladder_half_EP1"], 7];
	_ladder = _ladders select 0;
	if !(isNil "_ladder") then {
		_ladder_new = "Land_ladderEP1" createVehicle (position _ladder);
		_ladder_new attachto [_ladder,[0,0,7]];
	};

	if (isNil "_ladder") then {
		_pos = [(position player select 0) + (sin(getdir player)*2), (position player select 1) + (cos(getdir player)*2), 0];
		_ladder_new = createVehicle ["Land_ladderEP1", [0,0,0], [], 0, "NONE"];
		_ladder_new setdir getdir player;
		_ladder_new setpos _pos;
	};
	[player, "Land_ladderEP1",-1] call INV_AddInventoryItem;
	call compile format['_ladder_new setvehicleinit "this addEventHandler [""HandleDamage"", {false}]; this setvehiclevarname ""%1%2%3""; %1%2%3 = this"; processinitcommands', player, _class, _time];
};
item_breaching_ladder_half = {
	_ladders = nearestObjects [player, ["Land_ladderEP1","Land_ladder_half_EP1"], 7];
	_ladder = _ladders select 0;
	if !(isNil "_ladder") then {
		_ladder_new = "Land_ladder_half_EP1" createVehicle (position _ladder);
		_ladder_new attachto [_ladder,[0,0,6]];
	};

	if (isNil "_ladder") then {
		_pos = [(position player select 0) + (sin(getdir player)*2), (position player select 1) + (cos(getdir player)*2), 0];
		_ladder_new = createVehicle ["Land_ladder_half_EP1", [0,0,0], [], 0, "NONE"];
		_ladder_new setdir getdir player;
		_ladder_new setpos _pos;
	};
	[player, "Land_ladder_half_EP1",-1] call INV_AddInventoryItem;
	call compile format['_ladder_new setvehicleinit "this addEventHandler [""HandleDamage"", {false}]; this setvehiclevarname ""%1%2%3""; %1%2%3 = this"; processinitcommands', player, _class, _time];
};

item_defuser = {
	_item   = _this select 1;
	_anzahl = _this select 2;
	_DefuseBombArray = ["TimeBomb", "Mine", "MineE", "BAF_ied_v1", "BAF_ied_v2", "BAF_ied_v3", "BAF_ied_v4","Explosive", "PMC_IED_V1","PMC_IED_V2", "PMC_IED_V3", "PMC_IED_V4"];
	if (isNil "INV_BombDefuserInUse") then {
		INV_BombDefuserInUse = false;
	};
	
	if (player distance mission_bomb < 5) exitWith {[] call bomb_defuse};

	if (not(INV_BombDefuserInUse)) then {
		INV_BombDefuserInUse = true;
		if (vehicle player == player) then {
		
			private ["_bombs"];
			_bombs = (nearestObjects [player,["Suitcase","Car","Barrel5"],10]);
			for "_i" from 0 to (count _bombs) do {
				_bomb = _bombs select _i;
				if (_bomb getVariable "bombarmed") then {
					_bomb setVariable ["bombarmed",false,true];
					player groupChat "You have defused a bomb";
				};
			};
		
			_bombs = [];

			{
				_bombs = _bombs + (nearestObjects [player, [_x], 5]);
			} forEach _DefuseBombArray;

			if (count _bombs > 0) then {

				if (random 100 < 99) then {
					player groupChat localize "STRS_inv_items_defuser_success";
					deletevehicle (_bombs select 0);
				}
				else {
					player groupChat localize "STRS_inv_items_defuser_failed";
					[(position player)] spawn Bomb_Vehicle;
				};
			}
			else {
				player groupChat localize "STRS_inv_items_defuser_nobomb";
			};
		};
		
	INV_BombDefuserInUse = false;
	};
};
item_druguse = {
	_art = _this select 0;
	if (_art == "init") then {
		INV_drogenusesperre = 0;
		INV_drogen_usesperre = FALSE;
		INV_DrogenCounter = 0;
	};

	if (_art == "use") then {
		_item   = _this select 1;
		_anzahl = _this select 2;
		if (INV_drogenusesperre == 1) exitWith {player groupChat localize "STRS_inv_item_druguse_toomany";};
		if (INV_drogen_usesperre) then {INV_drogenusesperre = 1;};
		INV_DrogenCounter =  INV_DrogenCounter + _anzahl;
		[player, _item, -(_anzahl)] call INV_AddInventoryItem;
		_endeZeit = time + 60 + (_anzahl * 10);

		if (_item == "lsd") then {
			while {time < _endeZeit} do {
				"wetDistortion" ppEffectEnable true;
				"wetDistortion" ppEffectAdjust [0.5, 1, 1, 4.1, 3.7, 2.5, 1.85, 0.0051, 0.0051, 0.0051, 0.0051, 0.5, 0.3, 10, 6.0];
				"wetDistortion" ppEffectCommit 5;
				"chromAberration" ppEffectEnable true;
				"chromAberration" ppEffectAdjust [0.2,0.2,true];
				"chromAberration" ppEffectCommit 1;

				_position = getpos player;
				_weite = 100;
				_x = _position select 0;
				_y = _position select 1;
				_z = _position select 2;
				_w1 = (random _weite) - (random _weite);
				_w2 = (random _weite) - (random _weite);
				_w3 = random 7;
				_f1 = random 1;
				_f2 = random 1;
				_f3 = random 1;
				_g1 = random 5;
				_g2 = random 10;
				_g3 = random 5;

				if (_w1 + _w2 > 100) then {
					_g1 = _g1 * 2;
					_g2 = _g2 * 2;
					_g3 = _g3 * 2;
				};

				_v1 = random 0.05;
				_v2 = random 0.05;
				_v3 = 0.1 - random 0.075;
				Drop ["\ca\data\cl_basic", "", "Billboard", 1, 60, [_x + _w1, _y + _w2, _z + _w3], [_v1, _v2, _v3], 1, 1.275, 1, 0, [_g1, _g2, _g3], [ [_f1, _f2, _f3, 1], [_f2, _f1, _f3, 1], [_f3, _f2, _f1, 1] ], [0, 0, 0], 3, 0.2, "", "", ""];
				uiSleep 0.001;
			};
		};

		if (_item == "Cocaine") then {
			while {time < _endeZeit} do {
				_force = random 10;
				"chromAberration" ppEffectEnable true;
				"chromAberration" ppEffectAdjust [_force / 24, _force / 24, false];
				"chromAberration" ppEffectCommit (0.3 + random 0.1);
				waituntil {ppEffectCommitted "chromAberration"};
				uiSleep 0.6;
			};
		};

		if (_item == "wonderglue") then {
			while {time < _endeZeit} do {
				_force = random 10;
				"colorCorrections" ppEffectEnable true;
				"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
				"colorCorrections" ppEffectCommit 1;
				"chromAberration" ppEffectEnable true;
				"chromAberration" ppEffectAdjust [0.01,0.01,true];
				"chromAberration" ppEffectCommit 1;
				uiSleep 3;
			};
		};



		if (_item == "marijuana") then {

			Flare = "SmokeShellGreen" createVehicle position player;
			if (vehicle player != player) then {
				Flare attachTo [vehicle player,[0,0,0.]];
			}
			else {
				Flare attachTo [player,[0,0,0.]];
			};

			while {time < _endeZeit} do {
				"colorCorrections" ppEffectEnable true;
				"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
				"colorCorrections" ppEffectCommit 1;
				"chromAberration" ppEffectEnable true;
				"chromAberration" ppEffectAdjust [0.01,0.01,true];
				"chromAberration" ppEffectCommit 1;
				uiSleep 3;
			};
		};
		if (_item == "meth") then

		{

		Flare = "SmokeShellred" createVehicle position player;
		if (vehicle player != player) then { Flare attachTo [vehicle player,[0,0,0.]];}
			else {Flare attachTo [player,[0,0,0.]];};

		while {time < _endeZeit} do

			{

			"colorCorrections" ppEffectEnable true;
			"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
			"colorCorrections" ppEffectCommit 1;
			"chromAberration" ppEffectEnable true;
			"chromAberration" ppEffectAdjust [0.01,0.01,true];
			"chromAberration" ppEffectCommit 1;

			uiSleep 3;

			};

		};

		player groupChat localize "STRS_inv_item_druguse_ende";
		INV_drogenusesperre = 0;
		INV_DrogenCounter =  INV_DrogenCounter - _anzahl;

	};


	"colorInversion" ppEffectEnable false;
	"wetDistortion" ppEffectEnable false;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [0.5,0.5,0.5,0], [0.5,0.5,0.5,0], [0.5,0.5,0.5,0]];
	"colorCorrections" ppEffectCommit 10;
	waitUntil {ppEffectCommitted "colorCorrections"};
	"colorCorrections" ppEffectEnable false;
	"chromAberration" ppEffectEnable false;
};
item_earplugs = {
	if (isNil "earplugs_equipted") then {
		earplugs_equipted = false;
	};

	if (earplugs_equipted) then {

		1 fadeSound 1;
		player groupChat format ["You have taken out your earplugs"];
		earplugs_equipted = false;
	} else {

		1 fadeSound 0.4;
		player groupChat format ["You have put in your earplugs"];
		earplugs_equipted = true;
	};
};
item_esu_medkit = {

	if (!isesu) exitWith {systemChat format ["You are not an ESU"];};
	_target = (nearestobjects [player, ["Man"],  3] select 1);
	if (isNull _target) exitWith {player groupChat format ["No one in range"];};

	[[], "mp_anim_sync", [player,"switchmove","AinvPknlMstpSlayWrflDnon_medic"]] call mp_aware_me;

	uiSleep 5;

	_target setDamage 0;
	[_target] call medical_system_heal;
	_message = format ["%1-%2 has healed you.",player, name player];
	[[_target], "mp_global_chat_message", [_message]] call mp_aware_me;
};

item_esu_repairkit =
{
	if( !isesu ) exitWith
	{
		player groupChat format [ "You are not an ESU!" ];
	};

	if( player != ( vehicle player ) ) exitWith
	{
		player groupChat "You must be outside the vehicle to repair it";
	};

	_dist = 10;
	_veh = ( ( nearestObjects [ player, [ "LandVehicle", "Air" ], _dist ] ) select 0 );

	_dmg = damage _veh ;

	if( _dmg == 0 ) exitWith
	{
		player groupChat "This vehicle does not need repairing";
	};

	if( _dmg >= 1 ) exitWith
	{
		player groupChat "Hmmm ... this vehicle would appear to be beyond repair ...";
	};

	player groupChat "Repairing! Stay close to the vehicle!";

	_reps = 2;
	_count = 0;

	while{ _count <= _reps } do
	{
		_count = _count + 1;

		[ [], "mp_anim_sync", [ player, "switchmove", "AinvPknlMstpSlayWrflDnon_medic" ] ] call mp_aware_me;
		uiSleep 5;

		_dmg = damage _veh;

		if( ( player distance _veh ) > _dist || player != ( vehicle player ) || _dmg == 0 || _dmg == 1 ) exitWith
		{
			player groupChat "Repair failed! Vehicle has moved or there is a player in the vehicle!";
		};

		if( _count == _reps ) exitWith
		{
			_veh setDamage 0;
			player groupChat "Vehicle Repaired!";
		};
	};
};

item_fence_cutter = {
	if (vehicle player == player) then
	{
		player groupChat "Cutting Fence";
		player playmove "AinvPknlMstpSlayWrflDnon_medic";uiSleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
		{
			if (typeOf _x == "") then
			{
				_x setdamage 1;
			};
		} forEach (nearestObjects [player,[], 2]);
			player playmove "AinvPknlMstpSlayWrflDnon_medic";uiSleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
		}
		else
		{
			player groupChat "You must be on foot.";
		};
};
item_treefixer = {
	if (vehicle player == player) then
	{
		player groupChat "Attempting fix...";
		player playmove "AinvPknlMstpSlayWrflDnon_medic";uiSleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
		{
			if ((typeOf _x == "") && (damage _x > 0)) then
			{
				_x setdamage 0;
			};
		} forEach (nearestObjects [player,[], 15]);
		player playmove "AinvPknlMstpSlayWrflDnon_medic";uiSleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
	} else
	{
		player groupChat "You must be on foot.";
	};
};
item_gasmask = {
	_maskOn = [player, "gasmask_on"] call INV_GetItemAmount;
	_maskOff = [player, "gasmask"] call INV_GetItemAmount;
	_bmaskOff = [player, "gasmask_ill"] call INV_GetItemAmount;

	if (_maskOn >= 1) then {
		[player,"gasmask",1] call INV_AddInventoryItem;
		[player,"gasmask_on",-1] call INV_AddInventoryItem;
		player groupChat "You have taken your gasmask off.";
	};

	if (_maskOff >= 1) then {
		[player,"gasmask_on",1] call INV_AddInventoryItem;
		[player,"gasmask",-1] call INV_AddInventoryItem;
		player groupChat "You have put your gasmask on.";
	};

	if (_bmaskOff >= 1) then {
		[player,"gasmask_on",1] call INV_AddInventoryItem;
		[player,"gasmask_ill",-1] call INV_AddInventoryItem;
		player groupChat "You have put your gasmask on.";
	};
};
item_handy = {
	[] call phone_open;
};
item_ignite_fuel = {
	_item   = _this select 1;
	if (player == vehicle player)  exitWith {
		player groupChat localize "STRS_inv_items_ignite_ignite_notincar";
	};

	if ((damage vehicle player) == 1) exitWith {
		player groupChat localize "STRS_inv_items_repair_notneeded";
	};

	vehicle player setDamage 0.95;

	player groupchat localize "STRS_inv_items_ignite_ignite";
	[player, _item, -1] call INV_AddInventoryItem;
};
item_itembag = {
	_item    = _this select 1;
	_deleted = 0;
	if (vehicle player == player) then {
		{
		deleteVehicle _x;
		_deleted = _deleted + 1;

		} forEach (droppableitems + ["Bag_Base_EP1"]);
		player groupChat format[localize "STRS_inv_items_itemdeleted", _deleted];
	}
	else {
		player groupchat "you must be on foot";
	};

	if (_deleted > 0) then {
		[player, _item, -(1)] call INV_AddInventoryItem;
	};
};
item_lockpick = {
	_art = _this select 0;
	_lock = _this select 1;
	if (INV_ActionInUse) exitWith {};
	INV_ActionInUse = true;
	if (_art == "use") then {
		private["_incarpark","_item"];
		_incarpark = false;
		_vehicle  = [10] call INV_LocateClosestVehicle;

		if (isNil "_vehicle") exitWith {
			player groupChat "No vehicle close enough";
		};


		if (([player, _vehicle] call vehicle_owner)) exitWith {
			player groupChat "You already own this vehicle.";
		};

		if ((player distance (getMarkerPos "cop_base_spawn")) <= 120) exitwith {
			player groupChat "You cannot lockpick vehicles in the Cop Base";
		};
		if ((player distance (getMarkerPos "respawn_civilian")) <= 120) exitwith {
			player groupChat "You cannot lockpick vehicles in civilian spawn";
		};
		if ((player distance (getMarkerPos "south_spawn")) <= 70) exitwith {
			player groupChat "You cannot lockpick vehicles in civilian spawn";
		};
		if ((player distance (getMarkerPos "opf_base_spawn")) <= 120) exitwith {
			player groupChat "You cannot lockpick vehicles in opfor spawn";
		};

		if (({(alive _x)&&(isPlayer _x)} count (crew _vehicle)) > 0) exitwith {
			player groupChat "You cannot lockpick while people are inside";
		};

		player groupChat format["lockpicking %1", _vehicle];
		[player, _lock, -1] call INV_AddInventoryItem;
		[[], "mp_anim_sync", [player,"switchmove","AinvPknlMstpSlayWrflDnon_medic"]] call mp_aware_me;

		uiSleep 6;
		{
			if (_vehicle in (list _x)) then {
				_incarpark = true;
			};
		} forEach INV_VehiclePark;



		if ((random 100) < lockpickchance) then
		{

			if !(_incarpark) then
			{

				[player, _vehicle] call vehicle_add;
				player groupChat localize "STRS_inventar_lockpick_success";


				[[], "mp_global_chat_message", [format["%1 was seen stealing a vehicle (registration plate: %2)!", player, _vehicle]]] call mp_aware_me;
				[[], "mp_global_chat_message", [format["Vehicle %1 set wanted in copdatabase for being stolen", _vehicle]]] call mp_aware_me;
				[player, "vehicle theft", 10000, 50, false] call player_update_warrants;
				_vehicle setvariable["veh_status", "VEHICLE REPORTED STOLEN", true];
			};
		} else
		{
			player groupchat localize "STRS_inventar_lockpick_noluck";
		};
	};
	INV_ActionInUse = false;
};
item_medkit = {

	_item = _this select 1;
	if(vehicle player != player)exitwith{player groupchat "you cannot use this in a vehicle"};
	if(!(player call INV_Heal)) exitwith {};
	[player, _item, -1] call INV_AddInventoryItem;

};
item_nitro = {
	_art = _this select 0;

	if (_art == "use") then {
		_item   = _this select 1;
		_vcl  	= vehicle player;
		_type	= typeof _vcl;
		_fuel = fuel _vcl;

		if((_vcl getvariable ["nitro", 0]) == 1)exitwith{player groupchat "this vehicle already has nitro installed"};
		if (player == _vcl) exitWith {player groupChat localize "STRS_inv_items_speed_car"};
		if (!(_vcl iskindof "Car")) exitWith {player groupChat localize "STRS_inv_items_speed_no";};
		if (({_vcl isKindOf _x} count ["BRDM2_Base","BTR90_Base","LAV25_Base","HMMWV_M1151_M2_DES_Base_EP1","StrykerBase_EP1"]
		) > 0) exitwith {player groupchat "you cannot tune this vehicle"};
		if (_vcl getVariable ["beingTuned", false]) exitWith {player groupChat "Your vehicle is currently being tuned. Wait until this is done before trying again!";};
		_vcl setVariable ["beingTuned", true, true];

		[player, _item, -1] call INV_AddInventoryItem;

		player groupchat "tuning vehicle...";
		_vcl setfuel 0;
		uiSleep 10;
		_vcl setfuel _fuel;
		_vcl setvariable ["nitro", 1, true];
		_vcl setVariable ["beingTuned", false, true];
		player groupchat "vehicle tuned!";
		uiSleep 2;
		player groupchat "press and hold shift to activate nitro";
	};
};
item_spikestrip = {
	_art = _this select 0;
	if (_art == "use") then
	{
		_item    = _this select 1;
		_class	 = "Fort_Razorwire";
		[player,_item, -1] call INV_AddInventoryItem;
		_pos = [(position player select 0) + (sin(getdir player)*2), (position player select 1) + (cos(getdir player)*2), 0];
		_obj = _class createvehicle [0, 0, 0];
		_obj setdir getdir player;
		_obj setpos _pos;
		_obj setDamage 1;
		call compile format['_obj setvehicleinit "this setvehiclevarname ""%1%2""; %1%2 = this"; processinitcommands', player, _class];
		(format ["if (local server) then {publicarbeiterarctionarray = publicarbeiterarctionarray + [ [%1%2, %1] ];};", player, _class]) call broadcast;
	};
};
item_suicide = {
	 _art = _this select 0;
	if (_art == "use") then {

		private["_position", "_max_height", "_inVehicle"];
		_max_height = 5;
		_position = getPosATL player;
		_inVehicle = ((vehicle player) != player);
		_vcl = player;

		if ((_position select 2) > _max_height && _inVehicle) exitWith {
			player groupChat format["Suicide bombs can only be used at ground level"];
		};

		if ((player distance (getmarkerpos "civ_spawnpoint_northcivspawn")) < 130) exitWith {
			player groupchat "Some supernatural force prevents you from detonating a bomb in this holy place!"
		};
		if ((player distance (getmarkerpos "civ_spawnpoint_southcivspawn")) < 130) exitWith {
			player groupchat "Some supernatural force prevents you from detonating a bomb in this holy place!"
		};
		if ((player distance (getmarkerpos "ind_base_spawn")) < 130) exitWith {
			player groupchat "Some supernatural force prevents you from detonating a bomb in this holy place!"
		};
		if ((player distance (getmarkerpos "cop_base_spawn")) < 130) exitWith {
			player groupchat "Some supernatural force prevents you from detonating a bomb in this holy place!"
		};
		if ((player distance (getmarkerpos "opf_spawn_base")) < 130) exitWith {
			player groupchat "Some supernatural force prevents you from detonating a bomb in this holy place!"
		};


		_item   = _this select 1;
		_anzahl = _this select 2;
		"hint localize ""STRS_inv_item_selbstmordbombe_globalmsg"";" call broadcast;
		format["

		_unit = %1;
		_distance = player distance _unit;

		if ( _distance <= 200 ) then
		{
			[_unit, player] say3D ""battle_cry_ins"";
		};

		", player] call broadcast;

		for [{_i=5}, {_i >= 0}, {_i=_i-1}] do {
			titletext [format ["Bombcountdown: -->*%1*<--", _i],"PLAIN DOWN"];
			uiSleep 1;
		};

		if ((!alive player) or ([player,"restrained"] call player_get_bool) or ([player,"ziptied"] call player_get_bool) or ([player,"isstunned"] call player_get_bool)) exitWith {};
		call compile format [" autobombe%2 = createVehicle [""Bo_GBU12_LGB"", (%1), [], 0, ""NONE""];",(getpos player), (round (random 2000))];
		[player, _item, -1] call INV_AddInventoryItem;
	};
};
item_supgrade = {

		_item 	= _this select 1;
		_vcl	= vehicle player;
		_type	= typeof _vcl;
		_fuel = fuel _vcl;
		if(_vcl == player)exitwith{player groupchat "you must be in a vehicle"};
		if(!(_vcl iskindof "car"))exitwith{player groupchat "you cannot tune this vehicle"};

		if (({_vcl isKindOf _x} count ["BRDM2_Base","BTR90_Base","LAV25_Base"]
		) > 0) exitwith {player groupchat "you cannot tune this vehicle"};
		if (_vcl getVariable ["beingTuned", false]) exitWith {player groupChat "Your vehicle is currently being tuned. Wait until this is done before trying again!";};
		_vcl setVariable ["beingTuned", true, true];

		[player, _item, -1] call INV_AddInventoryItem;

		player groupchat "tuning vehicle...";
		_vcl setfuel 0;

		if(_item == "supgrade1") then {uiSleep 6;  _vcl setvariable ["tuning", 1, true];};
		if(_item == "supgrade1_don") then {uiSleep 5;  _vcl setvariable ["tuning", 1, true];};
		if(_item == "supgrade1_vip") then {uiSleep 4;  _vcl setvariable ["tuning", 1, true];};
		if(_item == "supgrade2") then {uiSleep 7;  _vcl setvariable ["tuning", 2, true];};
		if(_item == "supgrade2_don") then {uiSleep 6;  _vcl setvariable ["tuning", 2, true];};
		if(_item == "supgrade2_vip") then {uiSleep 5;  _vcl setvariable ["tuning", 2, true];};
		if(_item == "supgrade3") then {uiSleep 8;  _vcl setvariable ["tuning", 3, true];};
		if(_item == "supgrade3_don") then {uiSleep 7;  _vcl setvariable ["tuning", 3, true];};
		if(_item == "supgrade3_vip") then {uiSleep 6;  _vcl setvariable ["tuning", 3, true];};
		if(_item == "supgrade4") then {uiSleep 9;  _vcl setvariable ["tuning", 4, true];};
		if(_item == "supgrade4_don") then {uiSleep 8;  _vcl setvariable ["tuning", 4, true];};
		if(_item == "supgrade4_vip") then {uiSleep 7;  _vcl setvariable ["tuning", 4, true];};
		if(_item == "supgrade4_ill") then {uiSleep 9;  _vcl setvariable ["tuning", 4, true];};
		if(_item == "supgrade5") then {uiSleep 10;  _vcl setvariable ["tuning", 5, true];};
		if(_item == "supgrade5_don") then {uiSleep 9;  _vcl setvariable ["tuning", 5, true];};
		if(_item == "supgrade5_vip") then {uiSleep 8;  _vcl setvariable ["tuning", 5, true];};
		if(_item == "supgrade5_ill") then {uiSleep 10;  _vcl setvariable ["tuning", 5, true];};
		if(_item == "supgrade6_vip") then {uiSleep 8;  _vcl setvariable ["tuning", 6, true];};

		_vcl setfuel _fuel;
		_vcl setVariable ["beingTuned", false, true];
		player groupchat "vehicle tuned!";
};
item_syphon = {
	_art = _this select 0;

	if (_art == "use") then {
		private["_item", "_number"];
		_item  = _this select 1;
		_number = _this select 2;

		if (player != vehicle player) exitWith {
			player groupchat "You must be outside the vehicle to syphon gas!";
		};

		private["_vehicle"];
		_vehicle  = [10] call INV_LocateClosestVehicle;

		if (isNil "_vehicle") exitWith {};
		if(typeof _vehicle == "MMT_Civ" or typeof _vehicle == "MMT_USMC") exitWith {};

		if ((fuel _vehicle) < 0.5) exitWith {
			player groupChat "There is not enough fuel in this car to syphon";
		};

		[player, _item, -1] call INV_AddInventoryItem;

		player playMove "AinvPknlMstpSlayWrflDnon_medic";
		player groupchat "Draining fuel.";
		(format["%1 setFuel 0;",_vehicle]) call broadcast;
		uiSleep 6;
		WaitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};
		player groupChat localize "STRS_inv_items_empty_refueled";
		[player, "kanister", 1] call INV_AddInventoryItem;
	};
};
item_terror_bomb = {
	_art = _this select 0;
	if (_art == "use") then {



		if !([player] call player_insurgent) exitWith {player groupChat "You are not a terrorist!"; [player, "bomb_mission", - 1] call INV_AddInventoryItem };


		if !(bombing_active) exitWith {player groupChat "You are too late!"; [player, "bomb_mission", - 1] call INV_AddInventoryItem };

		if (player distance (getMarkerPos "bomb_marker") >= 30) exitWith { player groupChat "You are to far from the target!"};

		(format ['server globalChat "UN Intelligience reports terrorists have placed the bomb at the target!";']) call broadcast;


		[player, "bomb_mission", - 1] call INV_AddInventoryItem ;

		mission_bomb = "Explosive" createvehicle getpos player;
		mission_bomb setVehicleVarName "mission_bomb";

		[player , "(bombing)", 200000] call player_update_warrants;


			countdown = true;

			_countdown_time = 180;

			player groupChat "Timer set to 3 Minutes!";

			player groupChat "Stay within 200 meters of the bomb!";



			while {countdown} do {


			_inRange = (player distance (getpos mission_bomb) < 200);

			if ((!alive player) or (!_inRange) or (!bombing_active)) exitWith {

					[] call bombing_fail;

			};

				if (_countdown_time == 0) exitWith {

					[] call bombing_complete;

				};

			_countdown_time = _countdown_time - 1;


			uiSleep 1;
			};
	};
};
item_alcohol = {
	_art = _this select 0;
	if (_art == "use") then {
		_item   = _this select 1;
		_anzahl = _this select 2;
		if (INV_alkoholusesperre == 1) exitWith {player groupChat localize "STRS_inv_item_druguse_toomany";};
		if (INV_alkohol_usesperre) then {INV_alkoholusesperre = 1;};
		INV_AlkoholCounter =  INV_AlkoholCounter + _anzahl;
		[player, _item, -(_anzahl)] call INV_AddInventoryItem;
		_endeZeit = time + 45 + (_anzahl * 10);
		_fadeInTime   = 0;
		_fadeOutTime  = 0;
		_faded = false;
		// Normal Beer, Weizenbier, White-Wine
		if (_item == "beer" OR _item == "smirnoff" OR _item == "wine" OR _item == "wine2") then {
			while {time < _endeZeit} do {
				if (not(alive player)) exitWith {};
				//player setdamage ((damage player) - 0.01);
				if (vehicle player == player) then {
					_v1 = velocity player select 0;
					_v2 = velocity player select 1;
					_v3 = velocity player select 2;
					_v1add = (random 4 - random 4); _v2add = (random 3 - random 3);
					player setVelocity [_v1+_v1add, _v2+_v2add, _v3];
				};
				if (time > _fadeInTime) then {
					titleCut ["","WHITE OUT",0];
					_fadeOutTime = time + 1;
					_fadeInTime  = time + 5;
					_faded = false;
				};
				if ((time > _fadeOutTime) and (!_faded)) then {
					titleCut ["","WHITE IN",0];
					_faded = true;
				};
				uiSleep 1;
			};
		};
		if (_item == "Vodka" OR _item == "beer2" OR _item == "wiskey") then {
			while {time < _endeZeit} do {

				if (not(alive player)) exitWith {};
				//player setdamage ((damage player) - 0.01);
				if (vehicle player == player) then {
					_v1 = velocity player select 0;
					_v2 = velocity player select 1;
					_v3 = velocity player select 2;
					_v1add = (random 10 - random 8); _v2add = (random 12 - random 10);
					player setVelocity [_v1+_v1add, _v2+_v2add, _v3];
				};
				if (time > _fadeInTime) then {
					titleCut ["","WHITE OUT",0];
					_fadeOutTime = time + 1;
					_fadeInTime  = time + 10;
					_faded       = false;
				};
				if ((time > _fadeOutTime) and (!_faded)) then {
					titleCut ["","WHITE IN",0];
					_faded = true;
				};
				uiSleep 1;
			};
		};
		titleCut ["","WHITE IN",0];
		uiSleep 10;
		player groupChat localize "STRS_inv_item_druguse_ende";
		INV_alkoholusesperre = 0;
		INV_AlkoholCounter =  INV_AlkoholCounter - _anzahl;
	};
};
item_resource = {
	player groupChat localize "STRS_inv_items_ressources";
};

item_give = {

	if (giving) exitWith {};
	giving = true;

	private["_action", "_item", "_quantity", "_item_name"];
	_action = _this select 0;
	_item = _this select 1;
	_quantity  = _this select 2;
	_item_name = (_item call INV_GetItemName);

	if ( primaryweapon player == "" and secondaryweapon player == "") then {
		player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon";
	}
	else {
		[[], "mp_anim_sync", [player,"playmove","AinvPknlMstpSlayWrflDnon"]] call mp_aware_me;
	};


	if (_action == "give") then {
		private["_player_number", "_player_variable_name", "_player_variable"];

		_player_number   = call compile (_this select 3);
		_player_variable_name = playerstringarray select _player_number;
		_player_variable =  missionNamespace getVariable _player_variable_name;

		if (_quantity < 0) exitWith {
			player groupChat "You cannot give a negative number of items!";
		};

		if (not([_player_variable] call player_exists)) exitWith {
			player groupChat localize "STRS_inv_not_ingame";
		};

		if (_player_variable == player) exitWith {
			player groupChat localize "STRS_inv_inventar_uebergabe_self";
		};

		private["_near_players"];
		_near_players = nearestobjects [getpos player, ["LandVehicle", "Air", "Man"], 20];

		if (not(_player_variable in _near_players) and (player distance _player_variable > 20)) exitWith {
			player groupChat localize "STRS_inv_inventar_uebergabe_distance";
		};

		if (!(_item call INV_GetItemGiveable)) exitWith {
			player groupChat localize "STRS_inv_inventar_uebergabe_verbot";
		};

		if (!([player, _item, -(_quantity)] call INV_AddInventoryItem)) exitWith {
			player groupChat localize "STRS_inv_inventar_uebergabe_zuwenig";
		};
		["inventory"] call RG_fnc_iSave;

		format ["if (player == %1) then {[""receive"", ""%2"", %3, %4] call item_give;};", _player_variable, _item, _quantity, player] call broadcast;
		player groupChat format [localize "STRS_inv_inventar_uebergabe_success_self", name _player_variable, strN(_quantity), _item_name];


		_message = format ["%1 gave %2 %3 units of %4",name player,name _player_variable,strN(_quantity), _item_name];

		[_message, "Give"] call mp_log;
	};

	if (_action == "receive") then {
		private["_player"];
		_player = _this select 3;
		if ([player, _item, _quantity] call INV_AddInventoryItem) then {
			player groupChat format[localize "STRS_inv_inventar_gotfromotherplayer", strN(_quantity), _item_name, name _player];
		}
		else {
			format ["if (player == %1) then {[player, ""%2"", %3] call INV_AddInventoryItem;};", _player, _item, _quantity] call broadcast;
		};
	};
	["inventory"] call RG_fnc_iSave;
	giving = false;
 };
item_holster = {
	private["_action"];
	_action = _this select 0;
	if (_action == "use") then {
		private["_item", "_number"];
		_item   = _this select 1;
		_number = _this select 2;



		if (_item == "pistol") then {
			[player] call holster_show_weapon;
		};
		if (_item == "smg") then {
			[player] call holster_show_weapon_smg;
		};
	};
};

item_vehicle_ammo = {
	_art = _this select 0;
	if (_art != "use") exitwith {};
	_item   	= _this select 1;
	_anzahl 	= _this select 2;
	_vcl    	= vehicle player;

	if (player == _vcl) exitWith {player groupChat localize "STRS_inv_item_vclammo_novehicle";};
	if (_vcl iskindof "air") exitwith {player groupchat "You cannot rearm airvehicles you cheaters"};

	_role		= assignedVehicleRole player;
	_path		= _role select 1;

	if (isNil "_path") exitwith {player groupchat "You cannot rearm in this seat!"};

	_weapons	= (vehicle player) weaponsTurret _path;
	if ((count _weapons) <= 0) exitwith {player groupchat "This seat has no weapons!"};

	{
		_mag = ((getArray (configFile >> "cfgWeapons" >> _x >> "Magazines")) select 0);
		_vcl addMagazineTurret[_mag, _path];
	} forEach _weapons;


	player groupChat localize "STRS_inv_item_vclammo_rearmed";
	[player, _item, -1] call INV_AddInventoryItem;
};

item_stun_armor = {

	_action = _this select 0;
	_item   = _this select 1;
	_amount = _this select 2;

	switch _item do {
		case "stun_light": {
			player setvariable ["stun_armor", "light", true];
			player groupchat "You put on light stun Armor";
			[player, _item, -1] call INV_AddInventoryItem;
			[player, "stun_light_on", 1] call INV_AddInventoryItem;
		};

		case "stun_light_ter": {
			player setvariable ["stun_armor", "light", true];
			player groupchat "You put on light stun Armor";
			[player, _item, -1] call INV_AddInventoryItem;
			[player, "stun_light_on", 1] call INV_AddInventoryItem;
		};

		case "stun_light_ill": {
			player setvariable ["stun_armor", "light", true];
			player groupchat "You put on light stun Armor";
			[player, _item, -1] call INV_AddInventoryItem;
			[player, "stun_light_on", 1] call INV_AddInventoryItem;
		};

		case "stun_full": {
			player setvariable ["stun_armor", "full", true];
			player groupchat "You put on Full stun Armor";
			[player, _item, -1] call INV_AddInventoryItem;
			[player, "stun_full_on", 1] call INV_AddInventoryItem;
		};

		case "stun_light_on":{
			player setvariable ["stun_armor", "", true];
			player groupchat "You took off your light stun Armor";
			[player, _item, -1] call INV_AddInventoryItem;
			[player, "stun_light", 1] call INV_AddInventoryItem;
		};
		case "stun_full_on": {
			player setvariable ["stun_armor", "", true];
			player groupchat "You took off your Full stun Armor";
			[player, _item, -1] call INV_AddInventoryItem;
			[player, "stun_full", 1] call INV_AddInventoryItem;
		};
	};
};
item_mortar_ammo = {
	_action = _this select 0;
	_item   = _this select 1;
	_amount = _this select 2;

	_veh = vehicle player;

	if !(_veh iskindOf "StaticMortar") exitwith {
		player groupchat "You must be in a M252 or Podnos static";
	};

	_Addrounds = {
		private ["_veh", "_mag"];
		_veh = _this select 0;
		_mag = _this select 1;

		if (_veh isKindOf "M252") then {
			switch _mag do {
				case "HE":
				{
					_veh addMagazine "8Rnd_81mmHE_M252";
				};
				case "WP":
				{
					_veh addMagazine "8Rnd_81mmWP_M252";
				};
				case "IL":
				{
					_veh addMagazine "8Rnd_81mmILLUM_M252";
				};
			};
		};

		if (_veh isKindOf "2b14_82mm") then {
			switch _mag do {
				case "HE":
				{
					_veh addMagazine "8Rnd_82mmHE_2B14";
				};
				case "WP":
				{
					_veh addMagazine "8Rnd_82mmWP_2B14";
				};
				case "IL":
				{
					_veh addMagazine "8Rnd_82mmILLUM_2B14";
				};
			};
		};
	};

	switch _item do {
		case "Mammo_HE": {
			[_veh, "HE"] call _Addrounds;
			player groupchat "8 High Explosive rounds added";
			[player, _item, -1] call INV_AddInventoryItem;
		};

		case "Mammo_WP": {
			[_veh, "WP"] call _Addrounds;
			player groupchat "8 Willie Pete rounds added";
			[player, _item, -1] call INV_AddInventoryItem;
		};

		case "Mammo_IL": {
			[_veh, "IL"] call _Addrounds;
			player groupchat "8 Illumination rounds added";
			[player, _item, -1] call INV_AddInventoryItem;
		};
	};
};
item_bombs = {
	if (true) exitWIth {};
};
item_object = {
	_art = _this select 0;

	if (_art == "use") then {
		_item    = _this select 1;
		_class	 = _item call INV_GetItemClassName;
		_exitvar = 0;
		if (player != vehicle player) exitWith {
			player groupChat localize "STRS_inv_item_sperre_invcl";
		};

		{
			if (player distance (_x select 0) < (_x select 1)) exitWith {
				_exitvar = 1;
				player groupChat localize "STRS_inv_item_sperre_hiernicht";
			};
		} forEach INV_SperrenVerbotArray;

		if (_exitvar == 1) exitWith {};

		[player, _item, -1] call INV_AddInventoryItem;

		_pos = [(position player select 0) + (sin(getdir player)*2), (position player select 1) + (cos(getdir player)*2), 0];
		_obj = createVehicle [_class, [0,0,0], [], 0, "NONE"];
		_message = format ["Player %1 placed fortification %2!", name player, _class];
		[_message, "Fortification Place"] call mp_log;
		_obj setdir getdir player;
		_obj setpos _pos;
		_time = round time;
		call compile format['_obj setvehicleinit "this addEventHandler [""HandleDamage"", {false}]; this setvehiclevarname ""%1%2%3""; %1%2%3 = this"; processinitcommands', player, _class, _time];

		(format ["if (local server) then {publicarbeiterarctionarray = publicarbeiterarctionarray + [ [%1%2%3, %1] ];};", player, _class, _time]) call broadcast;
	};
};
item_mine = {
	private["_action", "_minearray"];

	_action = _this select 0;
	if (_action != "use") exitWith {};
	if (working) exitWith {};
	if ((vehicle player) != player) exitWith {player groupchat "You cannot mine inside a vehicle";};


	private["_item", "_number"];
	_item   = _this select 1;
	_number = _this select 2;

	private["_isInArea"];

	working = true;
	_isInArea = false;

	{
		if (player distance (getMarkerPos ((_x select 0) select 0)) < ((_x select 0) select 1) && not(iscop)) then {
			_isInArea = true;
			_minearray = _x
		};
	} forEach miningarray;

	private["_resource", "_max", "_infos", "_name"];
	_resource = _minearray select 1;
	_max = _minearray select 2;
	_infos = _resource call INV_GetItemArray;
	_item_weight = _resource call INV_GetItemTypeKg;
	_name = (_infos call INV_GetItemName);

	if (not(_isInArea)) exitWith {
		player groupChat "You are not near a mine.";
		working = false;
	};

	if (_item == "Shovel") then {
		totalamount=0;
		_max = shovelmax;
		if ((vehicle player) != player) exitWith {player groupchat "You cannot dig while you are in a vehicle!";};
		private["_i"];
		_i = 0;
		while { _i < 4 } do {
			_amount = round (random _max);
			titletext ["Digging...", "PLAIN DOWN", 0.1];
			[[], "mp_anim_sync", [player,"playmove","AinvPknlMstpSlayWrflDnon"]] call mp_aware_me;

			uiSleep 1.3;
			[[], "mp_anim_sync", [player,"switchmove","normal"]] call mp_aware_me;
			shoveldur = shoveldur - (floor (random 2));

			if(shoveldur <= 0) exitWith {
				player groupchat "The shovel broke";
				[player, "Shovel", -1] call INV_AddInventoryItem; shoveldur=20;
				working = false;
			};

			_avail = floor (INV_CarryingCapacity - (call INV_GetOwnWeight));

			totalamount = totalamount + _amount;
			if ((totalamount*3) >= _avail) exitWith {
				totalamount = (_avail/3);
				player groupchat "maximum weight reached";
				_i = 6;
				working = false;
			};

			player groupchat format["You got %1 %2.", _amount, _name];
			_i = _i + 1;
		};

		totalamount = (floor (totalamount));
		[player, _resource, totalamount] call INV_AddInventoryItem;
	};

	if (_item == "Pickaxe") then {
		private["_max"];
		totalamount=0;
		_max = pickaxemax;
		if ((vehicle player) != player) exitWith {player groupchat "You cannot mine while you are in a vehicle!";};
		private["_i"];
		_i = 0;
		while { _i < 4 } do {
			private["_amount"];
			_amount = round (random _max);

			titletext ["Working...", "PLAIN DOWN", 0.1];

			[[], "mp_anim_sync", [player,"playmove","AinvPknlMstpSlayWrflDnon"]] call mp_aware_me;
			uiSleep 1.3;
			[[], "mp_anim_sync", [player,"switchmove","normal"]] call mp_aware_me;

			pickaxedur = pickaxedur - (floor (random 2));

			if(pickaxedur <= 0) exitWith {
				player groupchat "The pickaxe broke";
				[player, "Pickaxe", -1] call INV_AddInventoryItem;
				pickaxedur=50;
				working = false;
			};

			_avail = floor (INV_CarryingCapacity - (call INV_GetOwnWeight));

			totalamount = totalamount + _amount;
			if((totalamount*3) >= _avail) exitwith {
				totalamount = (_avail/3); player groupchat "maximum weight reached"; _i=6;
				working = false;
			};

			player groupchat format["You got %1 %2.", _amount, _name];
			_i = _i + 1;
		};

		totalamount = (floor (totalamount));
		[player, _resource, totalamount] call INV_AddInventoryItem;
	};

	if (_item == "JackHammer") then {

		while {working} do {

			_isInArea = false;
			{
				if (player distance (getMarkerPos ((_x select 0) select 0)) < ((_x select 0) select 1) && not(iscop)) then {
					_isInArea = true;
					_minearray = _x
				};
			} forEach miningarray;

			if (not(_isInArea)) exitWith {
				player groupChat "You are not near a mine.";
				working = false;
			};


			titleText ["Drilling....","PLAIN DOWN",0.1];
			player playmove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";

			_random = round (random hammermax);
			if ((call INV_GetOwnWeight) + (_item_weight * _random)  <= INV_CarryingCapacity) then {
				[player, _resource, _random] call INV_AddInventoryItem;
				player groupchat format["You got %1 %2", _random, _name];
			} else {
				player groupChat format ["You cannot hold anymore %1",_name];
				working = false;
			};
			uiSleep 3.5;
		};

	};
	working = false;
};

item_steroids_ill = {

	if (INV_CarryingCapacity > INV_CarryingCapacityOld) exitWith {player groupChat format ["You have already used steroids."];};
	INV_CarryingCapacityOld = INV_CarryingCapacity;

	INV_CarryingCapacity = INV_CarryingCapacity + 35;
	[player, "illegal_steroids", -1] call INV_AddInventoryItem;
	player groupChat format ["You have used steroids. Your carry capacity has increased by 35kgs."];

};

item_steroids = {

	if (INV_CarryingCapacity > INV_CarryingCapacityOld) exitWith {player groupChat format ["You have already used steroids."];};
	INV_CarryingCapacityOld = INV_CarryingCapacity;

	INV_CarryingCapacity = INV_CarryingCapacity + 20;
	[player, "legal_steroids", -1] call INV_AddInventoryItem;
	player groupChat format ["You have used steroids. Your carry capacity has increased by 20kgs."];
};

item_meth_cleaning = {
	[player, "mixer_dirty",-1] call INV_AddInventoryItem;
	player groupChat "You have cleaned a dirty set of mixing equiptment";
	[player, "mixer",1] call INV_AddInventoryItem;
};
item_meth_mixing = {
	_iodineCT = [player , "iodine"] call INV_GetItemAmount;
	_redPhosCT = [player , "red_phosphorus"] call INV_GetItemAmount;
	_amoniaNaOHCT = [player , "ammonia_hydroxide"] call INV_GetItemAmount;
	_hydroticCT = [player , "hydriotic_acid"] call INV_GetItemAmount;

	_yield = 5;

	_recipe = [1,2,2,1];

	_reqI = _recipe select 0;
	_reqRedP = _recipe select 1;
	_reqAmNa = _recipe select 2;
	_reqHyd = _recipe select 3;

	if (_reqI > _iodineCT) exitWith { player groupChat format ["You require %1 Iodine to mix this, but only have %2",_reqI,_iodineCT]};
	if (_reqRedP > _redPhosCT) exitWith { player groupChat format ["You require %1 Red Phosphorus to mix this, but only have %2",_reqRedP,_redPhosCT]};
	if (_reqAmNa > _amoniaNaOHCT) exitWith { player groupChat format ["You require %1 Ammonia Hydroxide to mix this, but only have %2",_reqAmNa,_amoniaNaOHCT]};
	if (_reqHyd > _hydroticCT) exitWith { player groupChat format ["You require %1 Hydroitic Acid to mix this, but only have %2",_reqHyd,_hydroticCT]};

	[[], "mp_anim_sync", [player,"switchmove","AinvPknlMstpSlayWrflDnon_medic"]] call mp_aware_me;

	[player, "iodine",-_reqI] call INV_AddInventoryItem;
	[player, "red_phosphorus",-_reqRedP] call INV_AddInventoryItem;
	[player, "ammonia_hydroxide",-_reqAmNa] call INV_AddInventoryItem;
	[player, "hydriotic_acid",-_reqHyd] call INV_AddInventoryItem;


	uiSleep 5;
	[player, "pharm",_yield] call INV_AddInventoryItem;
	[player, "mixer",-1] call INV_AddInventoryItem;
	[player, "mixer_dirty",1] call INV_AddInventoryItem;
	player groupChat "You have mixed some ingridents together to make the base compound for meth and dirtied your equiptment. Process at the methlab to finalize product.";

};
item_meth_mixing_dirty = {
	_iodineCT = [player , "iodine"] call INV_GetItemAmount;
	_redPhosCT = [player , "red_phosphorus"] call INV_GetItemAmount;
	_amoniaNaOHCT = [player , "ammonia_hydroxide"] call INV_GetItemAmount;
	_hydroticCT = [player , "hydriotic_acid"] call INV_GetItemAmount;

	_yield = 1;

	_recipe = [1,2,2,1];

	_reqI = _recipe select 0;
	_reqRedP = _recipe select 1;
	_reqAmNa = _recipe select 2;
	_reqHyd = _recipe select 3;

	if (_reqI > _iodineCT) exitWith { player groupChat format ["You require %1 Iodine to mix this, but only have %2",_reqI,_iodineCT]};
	if (_reqRedP > _redPhosCT) exitWith { player groupChat format ["You require %1 Red Phosphorus to mix this, but only have %2",_reqRedP,_redPhosCT]};
	if (_reqAmNa > _amoniaNaOHCT) exitWith { player groupChat format ["You require %1 Ammonia Hydroxide to mix this, but only have %2",_reqAmNa,_amoniaNaOHCT]};
	if (_reqHyd > _hydroticCT) exitWith { player groupChat format ["You require %1 Hydroitic Acid to mix this, but only have %2",_reqHyd,_hydroticCT]};

	[[], "mp_anim_sync", [player,"switchmove","AinvPknlMstpSlayWrflDnon_medic"]] call mp_aware_me;

	[player, "iodine",-_reqI] call INV_AddInventoryItem;
	[player, "red_phosphorus",-_reqRedP] call INV_AddInventoryItem;
	[player, "ammonia_hydroxide",-_reqAmNa] call INV_AddInventoryItem;
	[player, "hydriotic_acid",-_reqHyd] call INV_AddInventoryItem;


	uiSleep 5;
	[player, "pharm",_yield] call INV_AddInventoryItem;
	player groupChat "You have mixed some ingridents together to make the base compound for meth and ruined your equiptment causing loss of product. Process at the methlab to finalize product.";
};
item_tracking_chip_disable = {
	{
		deletemarkerlocal (_x select 0);
		player groupChat format["CONNECTION CUT WITH TRACKER %1", (_x select 2)]
	} foreach trackers_arr;
	trackers_arr = [];
	[player, "tracker_dis", 0] call INV_SetItemAmount;


	trackers_active = false;
};
item_bait = {
	[] call bait_install;
};
item_food = {
	_art = _this select 0;

	if (_art == "use") then {
		_item   = _this select 1;
		_anzahl = _this select 2;
		_hungerStillen = 0;
		_amount = [player, _item] call INV_GetItemAmount;

		//switch _item do {
		  //  case "trout":  { _hungerStillen = 20; };
			//case "walleye":  { _hungerStillen = 20; };
			//case "perch":  { _hungerStillen = 20; };
			//case "bass":  { _hungerStillen = 20; };
			//case "Whale":     { _hungerStillen = 50; };
			//case "Donut":     { _hungerStillen = 25;  };
			//case "Bread":     { _hungerStillen = 10;  };
			//case "boar":     { _hungerStillen = 25;  };
			//case "rabbit":     { _hungerStillen = 20;  };
			//case "strangemeat":     { _hungerStillen = 15;  };
		//}; Commented it all out manually instead of using /* */ cos I'm unsure that actually works in arma.

		if (_amount >= _anzahl) then {
			[player, _item, -(_anzahl)] call INV_AddInventoryItem;
			if(_item == "Donut" and isciv)exitwith{player groupchat "the donut turns to ash in your mouth..."};
			INV_hunger = INV_hunger - (_hungerStillen*_anzahl);
			if (INV_hunger < 0) then {INV_hunger = 0};
			player groupChat format[localize "STRS_inv_item_nahrung_gegessen", strN((round (100-INV_hunger)))];
		} else {
			player groupchat "You do not have enough of this item";
		};
	};
};

item_detonator = {
	["activate",[]] call bomb_handler;
};

item_dirty_bomb = {
	private ["_count","_item"];
	_item = (_this select 1);
	_count = [player, _item] call INV_GetItemAmount;
	if (_count < 1) exitWith {};
	if (bomb_active) exitWith {player groupChat "You may only have 1 armed bomb at a time."};
	["place",["dirty"]] call bomb_handler;
	[player, _item, - 1] call INV_AddInventoryItem;
};

item_car_bomb = {
	private ["_count","_item"];
	_item = (_this select 1);
	_count = [player, _item] call INV_GetItemAmount;
	if (_count < 1) exitWith {};
	if (bomb_active) exitWith {player groupChat "You may only have 1 armed bomb at a time."};
	["place",["car"]] call bomb_handler;
	[player, _item, - 1] call INV_AddInventoryItem;
};

item_suitcase_bomb = {
	private ["_count","_item"];
	_item = (_this select 1);
	_count = [player, _item] call INV_GetItemAmount;
	if (_count < 1) exitWith {};
	if (bomb_active) exitWith {player groupChat "You may only have 1 armed bomb at a time."};
	["place",["suitcase"]] call bomb_handler;
	[player, _item, - 1] call INV_AddInventoryItem;
};

item_functions_defined = true;