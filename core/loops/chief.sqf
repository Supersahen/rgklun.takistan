_this = _this select 3;
_art  = _this select 0;
_money = [player, 'money'] call INV_GetItemAmount;

if (_art == "ClientWahlc") then {
	if (isNil("chief_election")) then { chief_election = false;};
	if (chief_election) exitWith { player groupChat "You just voted."; };
	_player_num   = call compile (_this select 1);
	format["if (isServer) then {[0,1,2,[""ServerChief"", %1, %2]] execVM ""core\loops\chief.sqf"";};", _player_num, rolenumber] call broadcast;
	player groupChat format[localize "STRS_chief_votedfor", (playerstringarray select _player_num)];
	chief_election = true;
	uiSleep 15;
	chief_election = false;
};

if (_art == "ServerChief") then {
	_candidate_number = (_this select 1);
	_voters_num  = ((_this select 2)-1);

	for [{_i=0}, {_i < count(ChiefArray)}, {_i=_i+1}] do {
		_arr = (ChiefArray select _i);
		if (_voters_num in _arr) exitWith {_arr = _arr - [_voters_num];	ChiefArray SET [_i, _arr];};
	};

	ChiefArray SET [_candidate_number, ((ChiefArray select _candidate_number )+ [_voters_num])];
};


if (_art == "control_chief") then {
	_item = _this select 1;
	_mag  = _this select 2;
	_weap = _this select 3;
	_vcl  = _this select 4;
	_bank = _this select 5;
	format ["(INV_ItemTypeArray select 0) SET [2, %1]; (INV_ItemTypeArray select 1) SET [2, %2]; (INV_ItemTypeArray select 2) SET [2, %3]; (INV_ItemTypeArray select 3) SET [2, %4];bank_tax = %5; hint ""The President has changed the tax rates!"";", _item, _vcl, _mag, _weap, _bank] call broadcast;
};

