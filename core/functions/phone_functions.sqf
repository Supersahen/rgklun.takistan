phone_open = {

	disableSerialization;
	if (dialog) exitWith {};
	if (!(createDialog "RGPhone")) exitWith {hint "Dialog Error!";};
	_display = findDisplay 90000;	
	_911 = _display displayCtrl 90010;
	_message = _display displayCtrl 90020;
	_contracts = _display displayCtrl 90015;
	_inventory = _display displayCtrl 90025;

	// Hide all conditional buttons
	for "_i" from 0 to ((count rise_phone_buttons) - 1) do
	{
		ctrlShow [90500 + _i, false];
		ctrlShow [90600 + _i, false];
	};

	// Global buttons
	_911 ctrlSetStructuredText parseText "<t align='center' shadow='0'><img size='5.3' image='resources\images\phone\call_icon.paa' /><br /><t size='0.75'>911</t></t>";
	_message ctrlSetStructuredText parseText "<t align='center' shadow='0'><img size='5.3' image='resources\images\phone\message_icon.paa' /><br /><t size='0.75'>Messages</t></t>";
	_contracts ctrlSetStructuredText parseText "<t align='center' shadow='0'><img size='5.3' image='resources\images\phone\contractsapp.paa' /><br /><t size='0.75'>Contracting</t></t>";
	_inventory ctrlSetStructuredText parseText "<t align='center' shadow='0'><img size='5.3' image='resources\images\phone\inventory_icon.paa' /><br /><t size='0.75'>Inventory</t></t>";

	// Conditional buttons
	_lastButton = 0;
	{
		if (call compile (_x select 3)) then
		{
			_text = _display displayCtrl (90500 + _lastButton);
			_button = _display displayCtrl (90600 + _lastButton);
			_text ctrlSetStructuredText parseText format["<t align='center' shadow='0'><img size='5.3' image='%1' /><br /><t size='0.75'>%2</t></t>", _x select 1, _x select 0];
			_text ctrlShow true;
			_button ctrlShow true;
			_button ctrlSetTooltip (_x select 4);
			rise_phone_actions set [_lastButton, _x select 2];
			_lastButton = _lastButton + 1;
		};
	} forEach rise_phone_buttons;

};
phone_banking = {

	if(!local_useBankPossible) exitWith {
		player groupChat "The Banking App is currently offline.";
	};

	if !((([player, "banking_app"] call INV_GetItemAmount) > 0) || isvip || donator3 || donator4) exitWith {player groupChat "You need to buy the banking app."};
    [player] spawn interact_atm_menu;


};
phone_takishop = {
	if !((([player, "market_app"] call INV_GetItemAmount) > 0) || isvip || donator3 || donator4) exitWith {player groupChat "You need to buy the mobile market app."};
	if (!(createDialog "RG_Taki_Shop")) exitWith {hint "Dialog Error!";};
};
phone_shop_buy = {
	private ["_item","_price","_quantity"];
	_item = _this select 0;
	_quantity = _this select 1;
	_quantity = parseNumber _quantity;
	_price = 0;
	_itemName = _item call INV_getitemName;

	if (_quantity <= 0) exitWith {player groupChat format ["You must specify an amount to order."]};
	if (_item == "medkit") then {_price = 6000;};
	if (_item == "kanister") then {_price = 3500;};
	if (_item == "lockpick") then {_price = 6000;};
	if (_item == "repairkit") then {_price = 7500;};

	_price = _price * _quantity;
	_price = round _price;

	if (isNil "_item") exitWith {};
	if (isNil "_price") exitWith {};

	_dynamiccuntflap = [player] call get_dynamiccuntflap;
	if (_dynamiccuntflap < _price) exitWith {player groupChat format ["You dont have enough money for that many of this item."]};
	_dynamiccuntflap = _dynamiccuntflap - _price;
	[player,_dynamiccuntflap] call set_dynamiccuntflap;
	player groupChat format ["You have purchased %2 %1. Your item(s) will be delivered in 3 Minutes.",_itemName,_quantity];

	uiSleep 180;

	[player,_item,_quantity] call INV_AddInventoryItem;
	player groupChat format ["%2 %1 have been delivered to you and added to your inventory.",_itemName,_quantity];
};


phone_appstore = {
	if (!(createDialog "appstore_menu")) exitWith {hint "Dialog Error!";};
	{
		_app = _x;
		_appname = _app select 0;
		_appclass = _app select 1;
		_appprice = _app select 2;

		_index = lbAdd [2100, format ["%1 - ($%2)", _appname,_appprice]];
		lbSetData [2100, _index, format["%1", _appclass]];

	} foreach appstore;
};

appstore_buy = {
	private ["_appclass","_app","_appprice","_class","_curApp","_price","_dynamiccuntflap"];
	_appclass = _this select 0;
	_app = nil;
	_appprice = nil;
	{
		_curApp = _x;
		_class = _curApp select 1;
		_price = _curApp select 2;
		if (_appclass == _class) then {_app = _x; _appprice = _price};
	} foreach appstore;

	if !(isNil "_app") then {
		_dynamiccuntflap = [player] call get_dynamiccuntflap;
		if (_dynamiccuntflap < _appprice) exitWith {player groupChat format ["You dont have enough money for that app"]};
		_dynamiccuntflap = _dynamiccuntflap - _appprice;
		[player,_dynamiccuntflap] call set_dynamiccuntflap;
		[player,_appclass,1] call INV_SetItemAmount;
		player groupChat format ["You have purchased a %1.",_app select 0];
	};
};


phone_contracting = {
	["pmcmenu"] spawn dialog_handler;

};
phone_sms = {
	call interact_mobile_use;
};

phone_emergency = {
 	if ([player] call check_safezone) exitwith {};
	["911"] spawn dialog_handler;
};