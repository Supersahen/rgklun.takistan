fnc_inAngleSector = {
	private["_dir1","_dir2","_dir3","_small","_large","_x","_y","_r"];
	_r = false;
	_small = (_this select 1) - ((_this select 2) / 2);
	_large = (_this select 1) + ((_this select 2) / 2);
	_x = ((_this select 3) select 0) - ((_this select 0) select 0);
	_y = ((_this select 3) select 1) - ((_this select 0) select 1);
	_dir1 = _x atan2 _y;
	if (_dir1 < 0) then {_dir1 = _dir1 + 360};
	_dir2 = _dir1 - 360;
	_dir3 = _dir1 + 360;
	if ((_dir1 >= _small && _dir1 <= _large) || (_dir2 >= _small && _dir2 <= _large) || (_dir3 >= _small && _dir3 <= _large)) then {_r = true};
	_r
};

is_prone = {
	private ["_unit", "_return", "_check"];

	_unit = _this select 0;
	_return = false;
	_check = (_unit selectionPosition "neck" select 2);

	if (_check <= 0.5) then { _return = true; } else { _return = false; };
	_return;
};


is_facing = {
	private ["_unit1", "_unit2", "_return"];

	_unit1 = _this select 0;
	_unit2 = _this select 1;

	_return = [[_unit1] call FNC_getpos, getdir _unit1, 45,[_unit2] call FNC_getpos] call fnc_inAngleSector;
	_return;
};


is_frontback = {
	private ["_unit1", "_unit2", "_return", "_check"];

	_unit1 = _this select 0;
	_unit2 = _this select 1;
	_return = "";

	_check = [[_unit2] call FNC_getpos, getdir _unit2, 180,[_unit1] call FNC_getpos] call fnc_inAngleSector;
	if (_check) then {
			_return = "front";
		} else {
			_return = "back";
		};

	_return;
};

