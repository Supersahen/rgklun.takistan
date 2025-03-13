 // Inventory Functons
 #include "macro.h"
 
item_handle = {
	private["_amount", "_action", "_item"];
	_action = _this select 0;
	_item   = _this select 1;
	_amount = _this select 2;
	
	if (!(_amount call ISSE_str_isInteger)) exitWith {
		player groupChat localize "STRS_inv_no_valid_number";
	};

	_amount = _amount call ISSE_str_StrToInt;
	if (_amount > ([player, _item] call INV_GetItemAmount)) exitWith {};

	private["_player"]; 
	_player = _this select 3;
	if (([player] call player_vulnerable) or (!INV_CanUseInventory)) exitWith {
		player groupChat localize "STRS_inv_cannotUseNow";
	};
	INV_InventarGiveReceiver = _player;
	if ((_action == "drop") and (INV_CanDropItem)) then {
		[_item, _amount] spawn item_drop;
	};
	if ((_action == "give") and (INV_CanGiveItem)) then {
		["give", _item, _amount, _player] call item_give;
	};	
	if ((_action == "use") and (INV_CanUseItem)) then {
		["use", _item, _amount] call item_use;
	};
};
 
item_use = {
	if (INV_CanUseItem) then {
		private["_fnc","_item","_amount"];
		_item   = _this select 1;
		_amount = _this select 2;
		_fnc = _item call INV_GetItemFilename;
		_fnc = if (isNil "_fnc") then {""} else { _fnc };
		_fnc = if (typeName _fnc != "STRING") then { "" } else {_fnc};
		
		if (_fnc == "") exitWith {
			player groupChat localize "STRS_inv_inventar_cannotuse";
		};
		//systemChat format ['["use","%1",%2,[]] spawn %3',_item,_amount,_fnc];
		call compile format ['["use","%1",%2,[]] spawn %3',_item,_amount,_fnc];
	};
};
 
item_drop = {
	_item   = _this select 0;
	_amount = _this select 1;
	if (dropping) exitWith {};
	dropping = true;
	
	if ((!INV_CanUseInventory) or (!INV_CanDropItem)) exitWith {
		player groupChat localize "STRS_inv_inventar_cannotdrop";
	};
	if (_item == "money") exitwith {player groupchat "You cannot drop shekels!";};
	if (_amount <= 0) exitwith {player groupchat "You cannot drop a negative amount";};
	if (_item call INV_GetItemDropable) then {
		if ([player, _item, -(_amount)] call INV_AddInventoryItem) then {
			player groupChat localize "STRS_inv_inventar_weggeworfen";
			if(primaryweapon player == "" and secondaryweapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};
			uiSleep 1.5;
			private "_class";
			_class = [_item] call item2class;
			_pos = getPosATL player;
			_object = createVehicle [_class, _pos, [], 0, "NONE"];
			_object setposASL getposASL player;
			_object setvariable ["droparray", [([_amount] call encode_number), _item], true];
		}
		else {
			player groupChat localize "STRS_inv_inventar_drop_zuwenig";
		};
	}
	else {
		player groupChat localize "STRS_inv_inventar_ablege_verbot";
	};
	["inventory"] call RG_fnc_iSave;
	dropping = false;
};
 