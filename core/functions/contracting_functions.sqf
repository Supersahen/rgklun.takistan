contract_join = {

	if !(pmc) exitWith {player groupChat "Only PMCs may use this option"};
	if !((vehiclevarname player) in pmcslots) exitWIth {player groupChat format ["You must be in a PMC slot to do this"];};

	private ["_complete","_contractors","_type","_contract_name","_contractarray","_player_name","_contract"];

    _contract = _this select 0;
	_contract = parseNumber _contract;
    _player_name = name player;
    
	
        _contractarray = pmccontracts select _contract;
        _contract_name = (_contractarray select 0) select 0;
        _type = (_contractarray select 1) select 0;
        _contractors = _contractarray select 2;
		_client = (_contractarray select 4) select 0;
		_payment =(_countractarray select 4) select 1;
        _complete = _contractarray select 3;
		
		
        if !(_player_name in _contractors) then {
            _contractors = _contractors + [_player_name];
            _contractarray set[2, _contractors];
            format['pmccontracts set[%1, %2]', _contract, _contractarray] call broadcast;
			
			
			player groupChat "You have joined this contract";
			(format ['server globalChat "%1 has joined a contract for %2.";',_player_name,_client,_payment]) call broadcast;
			contracted = true;

        } else {player groupChat "You are already a part of this contract"};
    
};



contract_leave = {
	
	if !(pmc) exitWith {player groupChat "Only PMCs may use this option"};
	
	private ["_complete","_contractors","_type","_contract_name","_contractarray","_player_name","_contract"];

    _contract = _this select 0;
	_contract = parseNumber _contract;
    _player_name = name player;
    

        _contractarray = pmccontracts select _contract;
        _contract_name = (_contractarray select 0) select 0;
        _type = (_contractarray select 1) select 0;
        _contractors = _contractarray select 2;
        _complete = _contractarray select 3;
        if (_player_name in _contractors) then {
            _contractors = _contractors - [_player_name];
            _contractarray set[2, _contractors];
            format['pmccontracts set[%1, %2]', _contract, _contractarray] call broadcast;
			player groupChat "You have left this contract";
			(format ['server globalChat "%1 has left the contract he was on.";',_player_name]) call broadcast;
			contracted = false;

        };
 
};

create_contract = {
	_type = _this select 0;
	_player_target = _this select 1;
	_payment = _this select 2;
	_client = name player;
	
	
	if (isNil "_payment") exitWith {player groupChat "You must input a payment amount!"};
	if (isNil "_type") exitWith {player groupChat "You must select a contract type!"};
	//if ((_type == "Capture") and (isNil "_player")) exitWith {player groupChat "You must select a target"};
	
	_pmccontracts = pmccontracts;
	
	if ((vehiclevarname player) in pmcslots) exitWIth {player groupChat format ["You are not allowed to do this as PMC."];};
	
	(format ['if ((vehiclevarname player) in pmcslots) then { player sideChat format "A new contract is avaliable"',_client,_type,_payment]) call broadcast;
	
	
	(format ["
	pmccontracts = pmccontracts + [[[""%1""], [""%1""], [], False , [""%2"",%3],[""%4""]]];
	",_type,_client,_payment,_player_target]) call broadcast;
	player groupChat format ["You have created a contract worth $%1 of the type (%2). Have PMCs join your contract.",_payment,_type];
		
};


contract_remove = {
	
	if ((vehiclevarname player) in pmcslots) exitWIth {player groupChat format ["You are not the client"];};
	
	private ["_complete","_contractors","_type","_contract_name","_contractarray","_player_name","_contract"];

    _contract = _this select 0;
	_contract = parseNumber _contract;
    _player_name = name player;
    

        _contractarray = pmccontracts select _contract;
        _contract_name = (_contractarray select 0) select 0;
        _type = (_contractarray select 1) select 0;
        _contractors = _contractarray select 2;
        _complete = _contractarray select 3;
		_client = (_contractarray select 4) select 0;
		_payment =(_countractarray select 4) select 1;
	
        if (_player_name == _client) then {
		
			{
				_unit = [_x] call player_get_player_by_name;
				_unit sideChat "A contract you were on has been terminated.";
				[_unit, "contracted",false] call player_set_bool;
			} foreach _contractors;
		
			format['
			pmccontracts set[%1, 0]; 
			pmccontracts = pmccontracts - [0];
			', _contract] call broadcast;
			player groupChat "You have removed your contract.";
        } else {player groupChat "This is not your contract"};
  
};
contract_complete = {
	
	if ((vehiclevarname player) in pmcslots) exitWIth {player groupChat format ["You are not allowed to do this as PMC."];};
	private ["_complete","_contractors","_type","_contract_name","_contractarray","_player_name","_contract"];

	_contract = _this select 0;	_contract = parseNumber _contract;
    _player_name = name player;
    

        _contractarray = pmccontracts select _contract;
        _contract_name = (_contractarray select 0) select 0;
        _contractors = _contractarray select 2;
        _complete = _contractarray select 3;
		_client = (_contractarray select 4) select 0;
		_payment = (_contractarray select 4) select 1;
		
		_numberofcontractors = count _contractors;
		_totalpayment = _numberofcontractors * _payment;
		_playermoney = [player] call get_dynamiccuntflap;
		if (_playermoney < _totalpayment) exitWith {
			player groupchat "You do not have enough money in your bank to pay the contractors. Remember the payment will be the original payment specified * the amount of contractors!";
			player groupchat "Remember now that you have not paid the contractors they will need to get money somehow!";
		};
        if (_player_name == _client) then {
		
			format['
			pmccontracts set[%1, 0]; 
			pmccontracts = pmccontracts - [0];
			', _contract] call broadcast;
			_moneyinbank = [player] call get_dynamiccuntflap;
			_message = format ["%1 just completed the contract for a total of %2 with %3 money in their bank.",_client,_totalpayment,_moneyinbank];
			[_message, "PMC Contracting"] call mp_log;
			{
				[player, -_totalpayment] call transaction_dynamiccuntflap;
				_unit = [_x] call player_get_player_by_name;
				[_unit, _payment] call transaction_dynamiccuntflap;
				(format ['server globalChat "%1 completed a contract for %2 in the amount of $%3";',_x,_player_name,_payment]) call broadcast;
				[_unit, "contracted",false] call player_set_bool;
				
		
			} foreach _contractors;
			
			
			
			player groupChat "You have completed the contract and payment has been sent to all the contractors on the contract.";
			
        } else {player groupChat "This is not your contract. You cannot complete it"};

};
leave_contract_death = {

	if !(pmc) exitWith {}:
	if !((vehiclevarname player) in pmcslots) exitWIth {};

	{
			_player_name = name player;
			_contractarray = _x;
			_contractors = _contractarray select 2;
			if (_player_name in _contractors) then {
				_contractors = _contractors - [_player_name];
				_contractarray set[2, _contractors];
				format['pmccontracts set[%1, %2]', _x, _contractarray] call broadcast;
				(format ['server globalChat "%1 has died while on a contract";',_player_name]) call broadcast;
			};
	} foreach pmccontracts;
};