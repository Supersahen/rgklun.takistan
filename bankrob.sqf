if !(alive player) exitWith {};
	Uisleep 3;
	private "_class";
	_amount = (bank_gold_bars / 2);
	_amount = round _amount;
	bank_gold_bars = 1;
	publicVariable "bank_gold_bars";
	_class = ["Gold_Bar"] call item2class;

	_pos = [6561.4, 11378.7, 0.3];
	_object = createVehicle ["Suitcase", _pos, [], 0, "NONE"];
	_object2 = createVehicle ["Suitcase", _pos, [], 0, "NONE"];

	_object setPos _pos;
	_object2 setPos _pos;
	_object attachTo [safe1, [1.2,0.5,-0.32]];
	_object2 attachTo [safe1, [1.2,-0.5,-0.32]];
	_object setDir 50;
	_object2 setDir 270;
	
	_object setvariable ["droparray", [([_amount] call encode_number), "Gold_Bar"], true];
	_object2 setvariable ["droparray", [([_amount] call encode_number), "Gold_Bar"], true];



/*
safe1 addAction [
"Take Gold Bars","noscript.sqf","
taking_gold_bars = true;
if (bank_gold_bars < 2) exitWith {player groupChat 'There are less than two bars in the safe!'};
[player,'Gold_Bar', 2] call INV_AddInventoryItem;
taking_gold_bars = false;"
];
*/