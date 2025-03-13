private["_unit", "_select", "_damage", "_source", "_projectile"];
_unit 			= _this select 0;
_select			= _this select 1;
_damage			= _this select 2;
_source			= _this select 3;
_projectile		= _this select 4;

private["_distance", "_reduce", "_source_cop", "_source_opf", "_weapon_source"];
_distance = 0;

if (insafezone or invulnerability) exitwith {_damage = 0;};
_insafezone = [_unit] call check_safezone;
if (_insafezone) then {_damage = 0};

_slot = vehicleVarName _source;
_weapon_source = currentWeapon _source;

_source_cop = (([_source] call player_cop) or ([gunner vehicle _source] call player_cop));
_source_opf = (([_source] call player_opfor) or ([gunner vehicle _source] call player_opfor));
_source_pmc = (_slot in pmcslots);

_default_spawn = (_unit distance default_flagpole < 200);
if ((_projectile in beanbag_rounds) and (_weapon_source in beanbag_guns) && (_source_cop or _source_opf or _source_pmc)) then
{
	_distance = _source distance _unit;
	[_source, _unit, _damage, _distance] call beanbag_hit;
	_damage = 0;
};
if ((_projectile in rubber_rounds) and (_weapon_source in rubber_round_guns) && (_source_cop or _source_opf or _source_pmc)) then
{
	_distance = _source distance _unit;
	[_source, _unit, _damage, _distance] call rubber_bullet_hit;
	_damage = 0;
};

if (_projectile == "B_9x19_SD") then {
	if (((_weapon_source == "M9") || (_weapon_source == "M9SD") || (_weapon_source == "UZI_EP1") || (_weapon_source == "glock17_ep1") || (_weapon_source == "UZI_SD_EP1")) && (_source_cop or _source_opf or _source_pmc)) then {
		_reduce = true;
		_distance = _source distance _unit;
		[_unit, _source, _distance, _damage] spawn stun;
		_damage = 0;
	};
};

_bodyArmor = _unit getVariable ["bodyarmor",0];
_bodyArmor = _bodyArmor / 100;
if (_bodyArmor > 0) then {
	_damage = _damage - _bodyArmor;
	if (_damage < 0) then {_damage = 0};
	_bodyArmor = (_bodyArmor - _damage) * 100; //This needs to be remultiplied as body armor will only work once otherwise
	_unit setVariable ["bodyarmor",_bodyArmor,false];
};

_damage = [_unit,_source,_select,_damage] call medical_calculate_damage;


if ((typeOf vehicle _unit) == "USMC_LHD_Crew_Red") then { _damage = 0;};
if (_default_spawn) then {_damage = 0};

if ((_damage <= 0.35) and (_projectile == "") ) then { _damage = 0;};
_damage
