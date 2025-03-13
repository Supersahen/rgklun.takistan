// fired event handler script
// EH_fired.sqf

_unit 			= _this select 0;
_weapon			= _this select 1;
_muzzle			= _this select 2;
_mode			= _this select 3;
_ammo			= _this select 4;
_magazine		= _this select 5;
_projectile		= _this select 6;



///////////////
// Distance checks
///////////////




_bullet = nearestObject  [[player] call FNC_getpos, _ammo];
if (insafezone) exitwith {deletevehicle _bullet};
if ([] call cop_check_weapons) then {deletevehicle _bullet};
if ([] call check_weapons) then {deletevehicle _bullet};


///////////////
// STUN EFFECTS
///////////////

if ((_magazine == "15Rnd_9x19_M9SD") && ((_weapon == "M9") || (_weapon == "M9SD") || (_weapon == "UZI_EP1") || (_weapon == "glock17_EP1") || (_weapon == "UZI_SD_EP1"))) exitWith {
		[1, _unit] call STUN_HANDLER;
	};



///////////////
// Tear Gas
///////////////
if (_ammo == "SmokeShellOrange" || _ammo == "1Rnd_SmokeYellow_GP25") exitwith {
	[_this, _bullet] call GAS_POISON_HANDLER;
};
if (_ammo == "SmokeShell" || _ammo == "G_40mm_Smoke") exitwith {
	[_this, _bullet] call GAS_SMOKE_HANDLER;
};