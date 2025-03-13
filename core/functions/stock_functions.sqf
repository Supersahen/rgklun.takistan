stock_markets = [
//   Name                     SharePrice Max +/-   Max Shares   Last +/-	   Force +/-
	["Billy Joes Firearms",		1000,	2500,		100,	    0,		     0],
	["Wallys War Vehicles",		1000,	2500,		100,	    0,		     0],
	["Londons Liquor",			1000,	2500,		100,	    0,		     0],
	["Morton Salt",				1000,	2500,		100,	    0,		     0],
	["Petes Pipes",				1000,	2500,		100,	    0,		     0],
	["Ashleys Autos",			1000,	2500,		100,	    0,		     0],
	["Gear Inc.",				1000,	2500,		100,	    0,		     0],
	["Taki Pharmacueticals",	1000,	2500,		100,	    0,		     0],
	["Taki Fast - Fast Food",	1000,	2500,		100,	    0,		     0],
	["Takisource",				1000,	2500,		100,	    0,		     0],
	["Taki Air",				1000,	2500,		100,	    0,		     0],
	["Trend Transports",		1000,	2500,		100,	    0,		     0],
	["Apex Metalworking",		1000,	2500,		100,	    0,		     0],
	["Stigs Autoservice",		1000,	2500,		100,	    0,		     0],
	["Clarksons Camaros",		1000,	2500,		100,	    0,		     0],
	["Ducks Dynasty",			1000,	2500,		100,	    0,		     0],
	["Kenny G's Topless Maids",	1000,	2500,		100,	    0,		     0],
	["Jim's Gr8 B8",			1000,	2500,		100,	    0,		     0],
	["Radcock Trucking",		1000,	2500,		100,	    0,		     0],
	["Patricks Lumber Yard",	1000,	2500,		100,	    0,		     0],
	["Sparkys Electrical",		1000,	2500,		100,	    0,		     0]
];


stocks_save = {
	
	_saveArray = [];
	for "_i" from 0 to (count stock_markets - 1) do {
		_cmpy = (stock_markets select _i) select 0;
		_shares = [_cmpy] call stock_get_shares;
		_saveArray set [count _saveArray,_shares];		
	};
	_saveArray
};

stocks_load = {
	_value = _this select 0;
	
	for "_i" from 0 to (count stock_markets - 1) do {
		_company = (stock_markets select _i) select 0;
		_shares = _value select _i;
		stock_shares = stock_shares + [[_company, _shares]];
	};
};

update_stocks = {

	for "_i" from 0 to (count stock_markets -1) do {
		_market = stock_markets select _i;
		_name = _market select 0;
		_share = _market select 1;
		_maxamt = _market select 2;
		_last = _market select 4;
		_mode = ["+","-",""] select round random (count ["+","-",""] - 1);
		if (_mode == "+") then {
			_amt = (round random _maxamt);
			_share = _share + _amt;
			_last = _amt;
		};		
		if (_mode == "-") then {
			_amt = (round random _maxamt);
			_share = _share - _amt;
			_last = -_amt;
		};
		if (_share <= 0) then {_share = 0};
		
		
		_market = [_name,_share,_maxamt, _market select 3,_last,_market select 5];
		stock_markets set [_i,_market];
	};
	//[[],"mp_global_chat_message",[format ["NTSE: Stock market prices have been adjusted!"]]] call mp_aware_me;
	publicVariable "stock_markets";
};

stock_loop = {
	stock_market_enabled = true;
	while {stock_market_enabled} do {
	
		[] call update_stocks;
		publicVariable "stock_markets";
		uiSleep 900;
	};
};

stock_buy_share = {
	private ["_amount","_company","_shares","_max_shares","_shareprice","_cost","_dynamiccuntflap","_present","_cmpy"];
	_amount = _this select 0;
	_company = stock_markets select (lbCurSel 1500);
	_company = _company select 0;
	
	_amount = parseNumber _amount;
	_shares = [_company] call stock_get_shares;
	_max_shares = [_company] call stock_get_max_shares;
	_shareprice = [_company] call stock_get_share_price;
	if (_shareprice <= 0) exitWith {
		player groupChat format ["You may not buy shares in this company"];
	};
	_cost = _shareprice * _amount;
	
	if (_shares + _amount > _max_shares) exitWith {
		player groupChat format ["You may not have more than %1 shares in %2",[_company] call stock_get_max_shares,_company];
	};
	
	_dynamiccuntflap = [player] call get_dynamiccuntflap;
	if (_dynamiccuntflap < _cost) exitWith {player groupChat "You do not have enough money to buy those shares"};
	_dynamiccuntflap = _dynamiccuntflap - _cost;
	[player,_dynamiccuntflap] call set_dynamiccuntflap;
	
	
	
	_present = false;
	for "_i" from 0 to (count stock_shares - 1) do {
		_cmpy = (stock_shares select _i) select 0;
		if (_company == _cmpy) then {
			_amt = (stock_shares select _i) select 1;
			stock_shares set [_i,[_cmpy,_amt + _amount]];
			_present = true;
		};
	};
	
	if !(_present) then {
		stock_shares = stock_shares + [[_company,_amount]];
	};
	
	_message = format ["%1 bought %2 shares in %2",name player,_amount,_company];
	[_message,"Stocks"] call mp_log;
	
	["",lbCurSel 1500] call stock_dialog_select;
	player groupChat format ["You have bought %1 shares in %2",_amount, _company];
};

stock_sell_share = {
	private ["_amount","_company","_shares","_max_shares","_shareprice","_cost","_dynamiccuntflap","_present","_cmpy"];
	_amount = _this select 0;
	_company = stock_markets select (lbCurSel 1500);
	_company = _company select 0;
	
	_amount = parseNumber _amount;
	_shares = [_company] call stock_get_shares;
	
	_shareprice = [_company] call stock_get_share_price;
	_cost = _shareprice * _amount;
	
	if (_shares - _amount < 0 ) exitWith {
		player groupChat format ["You do not have %1 shares in %2.",[_company] call stock_get_max_shares,_company];
	};
	
	_dynamiccuntflap = [player] call get_dynamiccuntflap;
	_dynamiccuntflap = _dynamiccuntflap + _cost;
	[player,_dynamiccuntflap] call set_dynamiccuntflap;
	
	
	
	_present = false;
	for "_i" from 0 to (count stock_shares - 1) do {
		_cmpy = (stock_shares select _i) select 0;
		if (_company == _cmpy) then {
			_amt = (stock_shares select _i) select 1;
			stock_shares set [_i,[_cmpy,_amt - _amount]];
			_present = true;
		};
	};
	
	if !(_present) then {
		stock_shares = stock_shares + [[_company,_amount]];
	};
	
	["",lbCurSel 1500] call stock_dialog_select;
	
	_message = format ["%1 sold %2 shares in %3 for %4",name player,_amount,_company,_cost];
	[_message,"Stocks"] call mp_log;
	
	player groupChat format ["You have sold %1 shares in %2",_amount, _company];
};

stock_get_shares = {
	private ["_company","_var"];
	_company = _this select 0;
	_var = 0;
	
	for "_i" from 0 to (count stock_shares - 1) do {
		if (_company == (stock_shares select _i) select 0) then {
			_var = (stock_shares select _i) select 1;
		};
	};
	_var
};

stock_get_share_price = {
	private ["_company","_var"];
	_company = _this select 0;
	_var = 0;
	
	for "_i" from 0 to (count stock_markets - 1) do {
		if (_company == (stock_markets select _i) select 0) then {
			_var = (stock_markets select _i) select 1;
		};
	};
	_var
};

stock_get_max_shares = {
	private ["_company","_var"];
	_company = _this select 0;
	_var = 100;
	
	for "_i" from 0 to (count stock_markets - 1) do {
		if (_company == (stock_markets select _i) select 0) then {
			_var = (stock_markets select _i) select 3;
		};
	};
	_var
};

stock_get_last = {
	private ["_company","_var"];
	_company = _this select 0;
	_var = 0;
	
	for "_i" from 0 to (count stock_markets - 1) do {
		if (_company == (stock_markets select _i) select 0) then {
			_var = (stock_markets select _i) select 4;
		};
	};
	_var
};

stock_get_share_worth = {
	private ["_company","_var"];
	_company = _this select 0;
	_var = 0;
	
	for "_i" from 0 to (count stock_markets - 1) do {
		if (_company == (stock_markets select _i) select 0) then {
			_shares = [_company] call stock_get_shares;
			_shareprice = [_company] call stock_get_share_price;
			_var = _shares * _shareprice;
		};
	};
	_var
};

stock_get_max_increase = {
	private ["_company","_var"];
	_company = _this select 0;
	_var = 2000;
	
	for "_i" from 0 to (count stock_markets - 1) do {
		if (_company == (stock_markets select _i) select 0) then {
			_var = (stock_markets select _i) select 2;
		};
	};
	_var
};

if (isServer) then {[] spawn stock_loop};