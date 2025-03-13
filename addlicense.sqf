#include "Awesome\Functions\macro.h"

_this    = _this select 3;
_number  = _this select 0;
_art     = _this select 1;

if ((_art == "remove") or (_art == "add")) then {
	if (_art == "add") then {
		_license = ((INV_Licenses select _number) select 0);
		_name    = ((INV_Licenses select _number) select 2);
		_cost    = ((INV_Licenses select _number) select 3);

		if (_license call INV_HasLicense) exitWith {player groupChat localize "STRS_inv_buylicense_alreadytrue";};
		if (([player, 'money'] call INV_GetItemAmount) < _cost) exitWith {player groupChat localize "STRS_inv_buylicense_nomoney";};

		_exit = false;

		if (_exit && !debug) exitwith {};

		[player, 'money', -(_cost)] call INV_AddInventoryItem;
		player groupChat format[localize "STRS_inv_buylicense_gottraining", strM(_cost), _name];


		INV_LicenseOwner = INV_LicenseOwner + [_license];
		["licenses"] call RG_fnc_iSave;
		["inventory"] call RG_fnc_iSave;
	} else {
		_license = ((INV_Licenses select _number) select 0);
		name    = ((INV_Licenses select _number) select 2);
		if (not(_license call INV_HasLicense)) exitWith {player groupChat localize "STRS_inv_buylicense_alreadyfalse";};
		INV_LicenseOwner = INV_LicenseOwner - [_license];
		player groupChat format[localize "STRS_inv_buylicense_losttraining", _name];
		["licenses"] call RG_fnc_iSave;
	};

};