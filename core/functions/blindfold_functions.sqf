player_blindfold_handler = {
	_target = _this select 0;
	if (isNil "_target") exitWith {};
	
	if ([_target,"blindfolded"] call player_get_bool) exitWith {
		[[], "mp_anim_sync", [player,"switchmove","AinvPknlMstpSlayWrflDnon_medic"]] call mp_aware_me;
		waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
		player groupChat format ["You unblindfolded %1",name _target];
		format ['[%1] call player_unblindfold',_target] call broadcast;
	};

	if !([_target] call player_vulnerable) exitWith {player groupChat "This person is not vulnerable. Ziptie him in order to blindfold him."};
	if ([_target] call check_safezone) exitWith {player groupChat "Target is in a safezone."};
	if ((player distance _target) > 2) exitWith {player groupChat "Target is to far away."};
	
	[[], "mp_anim_sync", [player,"switchmove","AinvPknlMstpSlayWrflDnon_medic"]] call mp_aware_me;
	waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
	
	player groupChat format ["You blindfolded %1",name _target];
	format ['[%1] spawn player_blindfold',_target] call broadcast;
};
player_blindfold = {
	_target = _this select 0;
	if (isNil "_target") exitWith {};
	if !(player == _target) exitWith {};
	titleText ["You have been blindfolded and all forms of communication have been stripped from you.","BLACK OUT"];
	[player,"blindfolded",true] call player_set_bool;
	
	player removeWeapon "ItemGPS";
	player removeWeapon "ItemMap";
	player removeWeapon "ItemRadio";
	
	uiSleep 360;
	
	player groupChat "You have managed to slip the blindfold from your face and are now able to see again.";
	[player] call player_unblindfold;
};

player_unblindfold = {
	_target = _this select 0;
	if (isNil "_target") exitWith {};
	if !(player == _target) exitWith {};
	titleText ["You have been unblindfolded","BLACK IN"];
	[player,"blindfolded",false] call player_set_bool;
	
	player addWeapon "ItemMap";
	player addWeapon "ItemRadio";
};
