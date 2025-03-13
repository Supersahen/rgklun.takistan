vehicle_eventhandler = {
	private["_unit", "_select", "_damage", "_source", "_projectile"];
	_unit 			= _this select 0;
	_select			= _this select 1;
	_damage			= _this select 2;
	_source			= _this select 3;
	_projectile		= _this select 4;
	
	
	_9mm	= (_projectile in ["B_9x19_Ball","B_9x19_SD","B_9x39_SP5"]);
	_50 	= (_projectile in ["B_127x107_Ball","B_127x99_Ball_noTracer","B_127x108_Ball"]);
	_45 	= (_projectile in ["B_45ACP_Ball"]);
	_12 	= (_projectile in ["B_12Gauge_74Slug","B_12Gauge_Pellets"]);
	_545 	= (_projectile in ["B_545x39_Ball","B_545x39_SD"]);
	_762 	= (_projectile in ["B_762x51_noTracer","B_762x51_Ball"]);
	_556 	= (_projectile in ["B_556x45_Ball","B_556x45_Ball_SD","B_556x45_SD"]);
	_unknown = !(_9mm and _50 and _45 and _12 and _545 and _762 and _556);
	
	
	switch (true) do {
		case _9mm : {_ratio = .75};
		case _50 : {_ratio = .05};
		case _45 : {_ratio = .65};
		case _12 : {_ratio = .45};
		case _545 : {_ratio = .55};
		case _762 : {_ratio = .45};
		case _556 : {_ratio = .55};
		case _unknown : {_ratio = .45};
	};
	
	_level = 0;
	switch (_select) do {
		case "engine"  : {_level = _unit getVariable ["engine_mod",0];};
		case "tires"   : {_level = _unit getVariable ["tires_mod",0];};
		case "windows" : {_level = _unit getVariable ["windows_mod",0];};
		case "hull"	   : {_level = _unit getVariable ["hull_mod",0];};
		case "fuel"    : {_level = _unit getVariable ["fuel_mod",0];};
	
	};
	
	switch (_level) do {
		case 0 : {};
		case 1 : {_ratio2 = 1};
		case 2 : {_ratio2 = 1.2};
		case 3 : {_ration2 = 1.3};
	};	
	
	_handle = (_level > 0);
	
	if (_handle) then {
		_reduce = (_ratio * _ratio2);
		_reduce = (_reduce * _damage);
		_damage = _damage - _reduce;
	};
	_damage
};


vehicle_modable = {
	private ["_class"];
	_class = _this select 0;
	if (isNil "_class") exitWith {};
	
	_notune = [
		"xxx"
	
	];
	
	
	(_class in _notune)
};
