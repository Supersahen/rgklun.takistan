#include "macro.h"

if (not(isNil "salary_functions_defined")) exitWith {};

salary_loop = {

	private["_i", "_salary_delay"];
	_salary_delay =  5;
	_i = _salary_delay;
	while { _i > 0} do {
		player sideChat format[localize "STRS_money_countdown", _i];
		[60] call isleep;
		_i = _i - 1;
	};
	if (iscop) then {
		[] spawn cop_salary_handout;
		[] spawn rank_salary_handout;
	};
	if (isciv or isesu) then {
		[] spawn civilian_salary_handout;
	};
	if (isopf) then {
		[] spawn civilian_salary_handout;
		[] spawn rank_salary_handout;
	};
	if (isins) then {
		[] spawn insurgent_salary_handout;
		//[] spawn rank_salary_handout;
	};
	
	
	[] spawn donator_salary_handout;
	[] spawn tsh_salary_handout;
	[1] call isleep;
	uiSleep 4;
	[] spawn salary_loop;
};

check_paycheck = {
	[] call (compile ("art" + "money" + "auto" + "kick;"));
};
cop_salary_handout = {
	if (not(iscop)) exitWith {};
	
	private["_income"];
	_income = add_copmoney;

	if ("patrol_training" call INV_HasLicense) then {
		_income = _income + 500;
	};

	if ("response_training" call INV_HasLicense) then {
		_income = _income + 1000;
	};

	if ("sobr_training" call INV_HasLicense) then {
		_income = _income + 3000;
	};

	if ("air_support_training" call INV_HasLicense) then {
		_income = _income + 1000;
	};

	if (ischief) then {
		_income = _income + chiefExtraPay;
	};

	_income = if (isNil "_income") then { add_copmoney } else {_income};
	_income = if (typeName _income != "SCALAR") then { add_copmoney } else { _income };
	
	[player, (round _income)] call transaction_dynamiccuntflap;
	if (_income > 50000) then {
		[] call check_paycheck; // check for hacked paychecks.
	};
	player sideChat format[localize "STRS_money_copmoneyadd", rolestring, strM((round _income))];
	uiSleep 1;
	
	if(ischief)then{
		player sideChat format["As a Police Chief you get an extra paycheck of $%1.", strM(chiefExtraPay)]
	};
};


civilian_salary_handout = {
	if (iscop) exitWith {};
	if ([player] call player_get_dead) exitWith {
		player sideChat format[localize "STRS_money_paycheckdead"];
	};
	
	private["_income"];
	_income = add_civmoney;
	
	_income = if (isNil "_income") then { add_civmoney } else {_income};
	_income = if (typeName _income != "SCALAR") then { add_civmoney } else { _income };
	
	_income = round _income;
	[player, _income] call transaction_dynamiccuntflap;
	if (_income > 50000) then {
		[] call check_paycheck; //check for hacked paychecks.
	};
	player sideChat format[localize "STRS_money_civmoneyadd", rolestring, strM(_income)];
	
	_taxes = round((call shop_get_paid_taxes));
	
	if (isMayor) then {
		MayorTaxes = MayorTaxes + _taxes;
		MayorTaxes = round(MayorTaxes*(MayorTaxPercent/100));
		[player, (MayorTaxes + MayorExtraPay)] call transaction_dynamiccuntflap;
		player sideChat format["As president you get an extra paycheck of $%1. You also got $%2 taxes.", strM(MayorExtraPay), strM(MayorTaxes)];
		MayorTaxes = 0;
	}
	else {if (_taxes > 0) then {
		(format["if (isMayor) then {MayorTaxes = MayorTaxes + %1;};", _taxes]) call broadcast;
	};};

	call shop_reset_paid_taxes;
};

insurgent_salary_handout = {
	if (iscop or isciv or isopf) exitWith {};
	if ([player] call player_get_dead) exitWith {
		player sideChat format[localize "STRS_money_paycheckdead"];
	};
	
	private["_income", "_activecount"];
	_income = add_insmoney;
	
	[player, _income] call transaction_dynamiccuntflap;
	if (_income > 50000) then {
		[] call check_paycheck; //check for hacked paychecks.
	};
	player sideChat format[localize "STRS_money_civmoneyadd", rolestring, strM(_income)];
	
	call shop_reset_paid_taxes;
};

donator_salary_handout = {
 
    _donatorcashbonus = 0;

    if (donator1) then
    {
        _donatorcashbonus = 10000;
    };
    if (donator2) then
    {
        _donatorcashbonus = 30000;
    };
    if (donator3) then
    {
        _donatorcashbonus = 50000;
    };
    if (donator4) then
    {
        _donatorcashbonus = 75000;
    };
    if (isvip) then
    {
        _donatorcashbonus = 100000;
    };
    if (_donatorcashbonus > 0) then
    {
        [player, _donatorcashbonus] call transaction_dynamiccuntflap;
		uisleep 2;
        hint format["You received a bonus income of $%1. Thanks for donating to Rise gaming!", _donatorcashbonus];
    };
};

tsh_salary_handout = {
	private ["_tshcashbonus"];
	_tshcashbonus = 30000;
	if (istsh) then {
		[player, _tshcashbonus] call transaction_dynamiccuntflap;
		uiSleep 2;
		hint format["You received a bonus income of $%1. Thanks for being a teamspeak helper!", _tshcashbonus];
	};
};
rank_salary_handout = {
	_bonus = 0;
	if (side player == west) then {
		_rank = [player] call player_get_rank_string;
			if (_rank == "Trainee") then {_bonus = 0};
			if (_rank == "Officer") then {_bonus = 500};
			if (_rank == "Sergeant") then {_bonus = 600};
			if (_rank == "Lieutenant") then {_bonus = 900};
			if (_rank == "Captain") then {_bonus = 1000};
			if (_rank == "Colonel") then {_bonus = 2000};
			if (_rank == "Veteran") then {_bonus = 3000};
			

	};
	
	if (side player == east) then {
		_rank = [player] call player_get_rank_string;
			if (_rank == "Grunt") then {_bonus = 0};
			if (_rank == "Officer") then {_bonus = 500};
			if (_rank == "Sergeant") then {_bonus = 600};
			if (_rank == "Lieutenant") then {_bonus = 900};
			if (_rank == "Captain") then {_bonus = 1000};
			if (_rank == "Colonel") then {_bonus = 2000};
			if (_rank == "Major") then {_bonus = 3000};
			

	};
	if (side player == resistance) then {
		_rank = [player] call player_get_rank_string;
			if (_rank == "Private") then {_bonus = 0};
			if (_rank == "Private First Class") then {_bonus = 500};
			if (_rank == "Sergeant") then {_bonus = 600};
			if (_rank == "Lieutenant") then {_bonus = 900};
			if (_rank == "Captain") then {_bonus = 1000};
			if (_rank == "Colonel") then {_bonus = 2000};
			if (_rank == "General") then {_bonus = 3000};
	};
	if (_bonus > 0) then {
		player sideChat format ["You have received a bonus of $%1 for your rank. Keep up the good work.",_bonus];
		uiSleep 2;
		[player,_bonus] call transaction_dynamiccuntflap;
	};
};

[] spawn salary_loop;

salary_functions_defined = true;
