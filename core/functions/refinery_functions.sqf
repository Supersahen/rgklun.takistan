refinery_menu_open = {
	if !(createDialog "refinery_dialog") exitWith {hint "dialog_error"};
	
	_inventory = [player] call player_get_inventory;
	
	for "_i" from 0 to (count _inventory - 1) do {
		_item = (_inventory select _i) select 0;
		_count = ([player, _item] call INV_GetItemAmount);
		_picture = "";
		if (_count > 0 and _item call INV_GetItemKindOf == "resource") then {
			_name = (_item call INV_GetItemName);
			_index = lbAdd [1500, format ["%1 (x%2)",_name,_count]];
			lbSetData [1500, _index, _item];
			if !(_picture == "") then {
				lbSetPicture [1500, _index, _picture];
			};
		};
	};
	
};

refinery_process = {

	_item = lbData [1500,lbCurSel 1500];
	if !("mine_license" call INV_HasLicense) exitWith {player groupChat "You are not allowed to process resources at our refinery until you are contracted with our company."};
	_ammount = [player,_item] call INV_GetItemAmount;
	if !(_ammount > 0) exitWith {player groupChat "You have nothing to process."};
	_name1   = _item call INV_GetItemName;
	_output_class = (_item + "_refined");
	_name2 =  _output_class call INV_GetItemName;
	switch (_item) do {
		case "sand": { };
		case "glass": {  };
		case "wood": {  };
		case "iron": {  };
		case "mineraloil": {  };
		case "silicon": {  };
		case "copper": {  };
		case "steel": {  };
		case "black_powder": {  };
		case "sulfur": {  };
		case "coal": {  };
		case "Diamond_rock": {  };
		case "Rubies": {  };
		case "Platinum": {  };
		case "Silver": {  };
		case "Gold": {  };
		case "Oil": {_output_class = "OilBarrel";};
		case "erdoel": {  };
		case "plastic": {  };
		case "stahlwolle": {  };
	};
	closeDialog 0;
	[[],"mp_anim_sync",[player, "playmove","AinvPknlMstpSlayWrflDnon_medic"]] call mp_aware_me;
	[player,_item,-_ammount] call INV_AddInventoryItem;
	[player,_output_class,_ammount] call INV_AddInventoryItem;
	uiSleep 5;
	player groupchat format["%1 %2 was processed into %3 %4!", _ammount, _name1, _ammount, _name2];	
};