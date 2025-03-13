/*
	Name: ranking.sqf;
	Author: [RISE] Sp3ctr3
	Property Of [RISE] Gaming Community
	Contact before using
*/
cop_generate_weapons_list = {

	cop_cadet_weapons = [];
	cop_officer_weapons = [];
	cop_sergeant_weapons = [];
	cop_lieutenant_weapons = [];
	cop_captain_weapons = [];
	cop_colonel_weapons = [];
	cop_donor_weapons = [];

	{
		_weapon = _x select 0;
		_kind = _weapon call INV_GetItemType;
		if (_kind == "weapon" or _kind == "Weapon") then {
			_class = _weapon call INV_GetItemClassName;
			cop_donor_weapons = cop_donor_weapons + [_class];
		};
		
	} foreach blufor_donator_weapon_shop;	
	
	{
		_weapon = _x select 0;
		_kind = _weapon call INV_GetItemType;
		if (_kind == "weapon" or _kind == "Weapon") then {
			_class = _weapon call INV_GetItemClassName;
			cop_donor_weapons = cop_donor_weapons + [_class];
		};
		
	} foreach vip_donor_weapon_shop;	
	
	{
		_weapon = _x select 0;
		_kind = _weapon call INV_GetItemType;
		if (_kind == "weapon" or _kind == "Weapon") then {
			_class = _weapon call INV_GetItemClassName;
			cop_cadet_weapons = cop_cadet_weapons + [_class];
		};
		
	} foreach blufor_rookie_shop;		
	
	{
		_weapon = _x select 0;
		_kind = _weapon call INV_GetItemType;
		if (_kind == "weapon" or _kind == "Weapon") then {
			_class = _weapon call INV_GetItemClassName;
			cop_officer_weapons = cop_officer_weapons + [_class];
		};
		
	} foreach blufor_patrol_shop;		
	
	{
		_weapon = _x select 0;
		_kind = _weapon call INV_GetItemType;
		if (_kind == "weapon" or _kind == "Weapon") then {
			_class = _weapon call INV_GetItemClassName;
			cop_sergeant_weapons = cop_sergeant_weapons + [_class];
		};
		
	} foreach blufor_response_shop;		
	
	{
		_weapon = _x select 0;
		_kind = _weapon call INV_GetItemType;
		if (_kind == "weapon" or _kind == "Weapon") then {
			_class = _weapon call INV_GetItemClassName;
			cop_lieutenant_weapons = cop_lieutenant_weapons + [_class];
		};
		
	} foreach blufor_sobr_shop;	
	
	{
		_weapon = _x select 0;
		_kind = _weapon call INV_GetItemType;
		if (_kind == "weapon" or _kind == "Weapon") then {
			_class = _weapon call INV_GetItemClassName;
			cop_colonel_weapons = cop_colonel_weapons + [_class];
		};
		
	} foreach blufor_colonel_shop;
	
};
cop_refresh_allowed_weapons = {
	if !(iscop) exitWith {};
	waitUntil {!isNil "player_rank"};
	police_rookie = (player_rank >= 0);
	police_officer = (player_rank >= 100);
	police_sergeant = (player_rank >= 200);
	police_lieutenant = (player_rank >= 400);
	police_colonel = (player_rank >= 800);
	cop_allowed_weapons = [];
	
	
	cop_allowed_weapons = cop_cadet_weapons;	
	
	if (police_officer) then {
		cop_allowed_weapons = cop_cadet_weapons + cop_officer_weapons;
	};
	
	if (police_sergeant) then {
		cop_allowed_weapons = cop_cadet_weapons + cop_officer_weapons + cop_sergeant_weapons;
	};	
	
	if (police_lieutenant) then {
		cop_allowed_weapons = cop_cadet_weapons + cop_officer_weapons + cop_sergeant_weapons + cop_lieutenant_weapons;
	};	
	
	if (police_colonel) then {
		cop_allowed_weapons = cop_cadet_weapons + cop_officer_weapons + cop_sergeant_weapons + cop_lieutenant_weapons + cop_colonel_weapons;
	};
	
	if (isdon) then {
		cop_allowed_weapons = cop_allowed_weapons + cop_donor_weapons;
	};
};


cop_check_weapons = {
	private ["_removed","_bool"];
	if (srt or vice or isstaff or (isNil "player_rank")) exitWith {};
	if !(iscop) exitWith {};
	
	_removed = false;
	
	if(primaryweapon player in ["mp5a5","mp5sd","m1014","Saiga12k","AA12_PMC"]) exitWith {};
	
	if ((primaryWeapon player) != "") then {
		if !(primaryweapon player in cop_allowed_weapons) then {
			player removeWeapon (primaryweapon player);
			_removed = true;
		};
	};
	
	if ((secondaryWeapon player) != "") then {
		if !(secondaryWeapon player in cop_allowed_weapons) then {
			player removeWeapon (secondaryWeapon player);
			_removed = true;
		};
	};
	
	if (_removed) then {
		player groupChat format ["One or more of your weapons were removed because you are not the right rank to use it."];
	};
	
	_removed
};

player_increase_rank = {

	private ["_player","_value"];
	_player = _this select 0;
	_value = _this select 1;
	
	if ([_player] call player_civilian) exitWith {};
	
	player_rank = player_rank + _value;
	player setVariable ["faction_rank",player_rank,true];
	
	[] spawn cop_refresh_allowed_weapons;

	_rank_string = [player] call player_get_rank_string;
	_next = [player] call player_get_ranking_info;
	_next = _next select 2;
	player sideChat format ["Your rank has been increased by %1 points. You are currently a %2 and have %3 points until your next rank!",_value,_rank_string,_next];
};

player_derank = {
	private ["_player"];
	_player = _this select 0;
	if (isNil "_player") exitWith {
		systemChat format ["No player selected to derank"];
	};
	_player setVariable ["faction_rank",0,true];
	_player sideChat "You have been deranked by an admin";
	player_rank = 0;
};

player_get_ranking_info = {
	private ["_player"];
	_player = _this select 0;
	if (isNil "_player") exitwith {};

	_rank = _player getVariable "faction_rank";
	_rank_string = nil;
	_next_rank = nil;
	
	if ([_player] call player_civilian) exitWith {};
	
	if ([_player] call player_cop) then {
		_rank_string = "Cadet";
		if (_rank_string == "Cadet") then {_next_rank = 100 - _rank; };
		if (_rank >= 100) then {_rank_string = "Officer"; _next_rank = 200 - _rank;};
		if (_rank >= 200) then {_rank_string = "Sergeant"; _next_rank = 400 - _rank; };
		if (_rank >= 400) then {_rank_string = "Lieutenant"; _next_rank = 800 - _rank;};
		if (_rank >= 800) then {_rank_string = "Captain"; _next_rank = 1600 - _rank;};
		if (_rank >= 1600) then {_rank_string = "Colonel"; _next_rank = 3200 - _rank;};
		if (_rank >= 3200) then {_rank_string = "Veteran"; _next_rank = 6400 - _rank;};		
	};
	
	if ([_player] call player_esu) then {
		_rank_string = "Cadet";
		if (_rank_string == "Cadet") then {_next_rank = 100 - _rank; };
		if (_rank >= 100) then {_rank_string = "First Responder"; _next_rank = 200 - _rank;};
		if (_rank >= 200) then {_rank_string = "Road Crew Warrior"; _next_rank = 400 - _rank; };
		if (_rank >= 400) then {_rank_string = "Dr. Takistan"; _next_rank = 800 - _rank;};
		if (_rank >= 800) then {_rank_string = "Dr. Foreman"; _next_rank = 1600 - _rank;};
		if (_rank >= 1600) then {_rank_string = "Dr. Gregory House"; _next_rank = 3200 - _rank;};
	};
	
	if ([_player] call player_opfor) then {
		_rank_string = "Grunt";
		if (_rank_string == "Grunt") then {_next_rank = 100 - _rank;};
		if (_rank >= 100) then {_rank_string = "Officer"; _next_rank = 200 - _rank; };
		if (_rank >= 200) then {_rank_string = "Sergeant"; _next_rank = 400 - _rank; };
		if (_rank >= 400) then {_rank_string = "Lieutenant"; _next_rank = 800 - _rank; };
		if (_rank >= 800) then {_rank_string = "Captain"; _next_rank = 1600 - _rank; };
		if (_rank >= 1600) then {_rank_string = "Colonel"; _next_rank = 3200 - _rank; };
		if (_rank >= 3200) then {_rank_string = "Major"; _next_rank = 6400 - _rank; };	
	};
	
	if ([_player] call player_insurgent) then {
		_rank_string = "Grunt";
		if (_rank_string == "Grunt") then {_next_rank = 100 - _rank;};
		if (_rank >= 100) then {_rank_string = "Martyr"; _next_rank = 200 - _rank; };
		if (_rank >= 200) then {_rank_string = "Allah Warrior"; _next_rank = 400 - _rank; };
		if (_rank >= 400) then {_rank_string = "Abu Bakr Al-Baghdadi"; _next_rank = 800 - _rank; };	
	};
	_return = [_rank,_rank_string,_next_rank];
	
	_return
};

player_get_rank_string = {
	private ["_player","_value"];
	_player = _this select 0;

	_string = [_player] call player_get_ranking_info;
	_string = _string select 1;
	
	_string
};
[] call cop_generate_weapons_list;
uiSleep 1;
[] spawn cop_refresh_allowed_weapons;