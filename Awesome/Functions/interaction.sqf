#include "macro.h"
#include "constants.h"

if (not(isNil "interaction_functions_defined")) exitWith {};

interact_human = {
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;

	if (not([_player] call player_human)) exitWith { false };
	if (not([_target] call player_human)) exitWith { false };

	if (
		([player,"restrained"] call player_get_bool) or
		([player,"ziptied"] call player_get_bool) or
		([player] call player_get_arrest) or
		([player] call player_get_mp_arrest) or
		([player] call player_vulnerable)
	) exitWith {systemChat "You cannot do that right now."};

	civ_variable_name = str(_target);
	civ_player_variable  = _target;
	
	if (isesu) exitWith {
		if (!(createDialog "civmenu_esu")) exitWith {hint "Dialog Error!";};
		true
	};
	if (iscop) exitWith {
		if (([_target] call player_cop) and !(isStaff)) exitWith {};
			if (not(createDialog "civmenu")) exitWith { hint "Dialog Error!";};
		true;
	};	
	if (isopf) exitWith {
		if (([_target] call player_opfor) and !(isStaff or isCommander)) exitWith {};
		if (not(createDialog "civmenu")) exitWith { hint "Dialog Error!";};
		true;
	};
	if (isciv or isins) exitWith {
		if (!(createDialog "civinteraktion")) exitWith {hint "Dialog Error!";};
		true
	};	
	false
};
interact_clothes = {
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;

	if (_target in clothesusearray) exitWith {
		for [{_i = 0}, {_i < (count Clothing_Shops)}, {_i = _i + 1}] do {
			_shoparray	= (Clothing_Shops select _i);
			_object = _shoparray select 0;
			if (_target == _object) then {[_i] execvm "Awesome\Clothes\Clothes Dialogs.sqf"};

		};
		true
	};
	false
};

interact_ai = {
	private["_player", "_target"];

	_player = _this select 0;
	_target = _this select 1;

	if (isNil "_player") exitWith {false};
	if (isNil "_target") exitWith {false};

	if (not([_player] call player_human)) exitWith {false};
	if ([_target] call player_human) exitWith {false};
	if (not(_target in shopusearray)) exitWith {false};

	if (
		([player,"restrained"] call player_get_bool) or
		([player,"ziptied"] call player_get_bool) or
		([player] call player_get_arrest) or
		([player] call player_get_mp_arrest) or
		([player] call player_vulnerable)
	) exitWith {systemChat "You cannot do that right now."};

	private["_id"];
	_id = _target call INV_GetShopNum;

	if(([_player] call player_cop) and (_target in drugsellarray)) exitWith {
		[_id] spawn shop_drug_search;
		true;
	};

	if (iscop) then {
		police_rookie = (player_rank >= 0);
		police_officer = (player_rank >= 100);
		police_sergeant = (player_rank >= 200);
		police_lieutenant = (player_rank >= 400);
		police_colonel = (player_rank >= 800);
	};

	private["_handled"];


	if((_target in bludon_shop_list)) exitWith {
		if (not([_player] call player_cop)) exitWith {
			hint "You cannot access Blufor Donator Shops: Not a Cop";
			false
		};
		[_id] call shop_open_dialog;
		true
	};
	if((_target in civdon_shop_list)) exitWith {
		if (not([_player] call player_civilian)) exitWith {
			hint "You cannot access Civilian Donator Shops: Not a Civilian";
			false
		};
		[_id] call shop_open_dialog;
		true
	};
	if((_target in insdon_shop_list)) exitWith {
		if (not([_player] call player_insurgent)) exitWith {
			hint "You cannot access insurgent Donator Shops: Not an insurgent";
			false
		};
		[_id] call shop_open_dialog;
		true
	};
		if((_target in opfdon_shop_list)) exitWith {
		if (not([_player] call player_opfor)) exitWith {
			hint "You cannot access Opfor Donator Shops: Not an Opfor";
			false
		};
		[_id] call shop_open_dialog;
		true
	};

	if((_target in hit_shop_list)) exitWith {
		if !(ishit) exitWith {
			hint "You cannot access Hitman Shops: You are not whitelisted!";
			false
		};
		[_id] call shop_open_dialog;
		true
	};

	// PMC SHOPS
	private["_uid"];
	_uid = getPlayerUID player;

	if((_target in pmc_shop_list) && not(pmc) and ([player] call player_civilian)) exitWith {
			hint "You cannot access PMC Shops: You are not whitelisted!";
	};

	if((_target in vip_shops) && not(isvip)) exitWith {
			hint "You cannot access VIP Shops: You are not vip!!";
	};

	if((_target in news_crew_shops) && (_uid in newscrewblacklist)) exitWith {
			hint "You cannot access NEWS Shops: You are not blacklisted!";
	};

	if((_target in taki_pharm_shops) && not(_uid in taki_pharm_whitelist)) exitWith {
			hint "You cannot access this shop: You are not whitelisted!";
	};

	if((_target in srt_shops) && not(srt)) exitWith {
			hint "You cannot access this shop: You are not whitelisted!";
	};		
	
	if((_target in esu_shops) && not(isesu)) exitWith {
			hint "You cannot access this shop: You are not an esu!";
	};	
	
	if((_target in osf_shops) && not(srt)) exitWith {
			hint "You cannot access this shop: You are not whitelisted!";
	};
	if((_target in mine_shop) && !("mine_license" call INV_HasLicense)) exitWith {
			player groupChat "You are not allowed to buy or sell equiptment\resources from or to us until you are registered with our company!";
	};
	if((_target == cop_rookie) && !(police_rookie) && !(isstaff or srt)) exitWith {
	        hint "You lack the required rank to use this shop! (Cadet)";
	       player groupChat "You lack the required rank to use this shop! (Cadet)";
	};
	if((_target == coppatrol) && !(police_officer) && !(isstaff or srt)) exitWith {
	        hint "You lack the required rank to use this shop! (Police Officer)";
	        player groupChat "You lack the required rank to use this shop! (Police Officer)";
	};
	if((_target == copcriminal) && !(police_sergeant) && !(isstaff or srt)) exitWith {
	        hint "You lack the required rank to use this shop! (Sergeant)";
	       player groupChat "You lack the required rank to use this shop! (Sergeant)";
	};
	if((_target == copswat) && !(police_lieutenant) && !(isstaff or srt)) exitWith {
	        hint "You lack the required rank to use this shop! (Lieutenant)";
	        player groupChat "You lack the required rank to use this shop! (Lieutenant)";
	};
	if((_target == copcolonel) && !(police_colonel) && !(isstaff or srt)) exitWith {
	        hint "You lack the required rank to use this shop! (Colonel)";
	        player groupChat "You lack the required rank to use this shop! (Colonel)";
	};
	[_id] call shop_open_dialog;
	true
};

interact_atm = {
	private["_player", "_target"];

	_player = _this select 0;
	_target = _this select 1;

	if (isNil "_player") exitWith {false};
	if (isNil "_target") exitWith {false};

	if (
		([player,"restrained"] call player_get_bool) or
		([player,"ziptied"] call player_get_bool) or
		([player] call player_get_arrest) or
		([player] call player_get_mp_arrest) or
		([player] call player_vulnerable)
	) exitWith {systemChat "You cannot do that right now."};

	if (not([_player] call player_human)) exitWith {false};
	if ([_target] call player_human) exitWith {false};
	if (not(_target in bankflagarray)) exitWith {false};

	if(!local_useBankPossible) exitWith {
		hint "The ATM rejected your card";
		false
	};

	call interact_atm_menu;
	true
};

interact_pay_bail = {
	private["_player", "_bail"];

	_player = _this select 0;
	_bail = _this select 1;

	if (isNil "_player") exitWith {};
	if (isNil "_bail") exitWith{};

	_bail = [_bail] call parse_number;
	if (_bail <= 0) exitWith {};

	private["_money"];
	_money = [_player] call player_get_total_money;

	if (_bail >= _money) exitWith {
		player groupChat format["You do not have enough shekels to pay $%1 in bail", _bail];
	};


	player_bail = player_bail - _bail;
	
	[_player, _bail] call player_lose_money;
	[_player, player_bail] call player_set_bail;
	
	_cops = playersNumber west;
	_pay = _bail / _cops;
	
	format ['
		if (iscop) then {
			player groupChat format ["You got $%1 for %2 paying bail.",[%1,","] call format_integer];
			[player,%1] call transaction_dynamiccuntflap;
		};
	',_pay,name player] call broadcast;
	
	player groupChat format ["You paid $%1 in bail", strM(_bail)];
};

interact_restrain = {
	private ["_player","_target"];

	if (not(alive player)) exitWith {};
	if (vehicle player != player) exitWith {};

	[player, "restrained",true] call player_set_bool;

	[] spawn {
		while {[player, "restrained"] call player_get_bool} do {
			_near_cops = [player, 40] call player_near_cops;
			if !(_near_cops) then {
				[player,"restrained",false] call player_set_bool;
				[[], "mp_anim_sync", [player,"switchmove",""]] call mp_aware_me;
			};
		};
		while {[player, "restrained"] call player_get_bool} do {
			waitUntil {animationstate player != "civillying01" && vehicle player == player};
			[[], "mp_anim_sync", [player,"switchmove","civillying01"]] call mp_aware_me;
		};
	};
};
/*
interact_restrain = {
	private ["_player","_target"];
	_player = _this select 0;
	_target = _this select 1;

	_state = [_player, "restrained"] call player_get_bool;
	if (isNil "_state") exitWith {};

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (not(alive _target)) exitWith {};
	if (vehicle _target != _target) exitWith {};

	if (_state) then {
	// Unrestrain
	} else {
	// Restrain
	[_target] call handcuff_sound;


	};
};
*/
interact_toggle_restrains = {
	private["_player", "_victim"];

	_player = _this select 0;
	_victim = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_victim] call player_human)) exitWith {};
	if (not(alive _victim)) exitWith {};

	private["_inVehicle", "_victim_name"];
	_inVehicle = (vehicle _victim != _victim);
	_victim_name = (name _victim);

	if (_inVehicle) exitWith {
		player groupChat format["%1-%2 is in a vehicle!", _victim, _victim_name];
	};

	if ([_victim,"ziptied"] call player_get_bool) exitWith {

		_message = format["%1-%2 was removed from zipties by %3", _victim, _victim_name, (name _player)];

		[[], "mp_global_chat_message", [_message]] call mp_aware_me;

		[_victim, "ziptied", false] call player_set_bool;

		};

	if ([_victim,"blindfolded"] call player_get_bool) then {
		[_victim] spawn player_blindfold_handler;
	};

	private["_message"];
	if ([_victim, "restrained"] call player_get_bool) then {
		[_victim, "restrained", false] call player_set_bool;
		_message = format["%1-%2 was removed from handcuffs by %3", _victim, _victim_name, (name _player)];
		[[], "mp_global_chat_message", [_message]] call mp_aware_me;
	}
	else {
		if (not([_victim] call player_vulnerable)) exitWith {
			player groupChat format["%1-%2 cannot be restrained, he is not subdued.", _victim, _victim_name];
		};

		[_victim, "restrained", true] call player_set_bool;
		_message = format["%1-%2 was handcuffed by %3", _victim, _victim_name, (name _player)];
		[_victim] call handcuff_sound;
		
		[_message, "Restrain"] call mp_log;
		[[], "mp_global_chat_message", [_message]] call mp_aware_me;
	};
};

interact_release_player = {
	private["_player", "_victim"];

	_player = _this select 0;
	_victim = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_victim] call player_human)) exitWith {};

	if (_victim == player) exitWith {
		player groupChat format["You cannot release yourself from prison"];
	};

	if (not([_victim] call player_get_arrest)) exitWith {
		player groupChat format["%1-%2 is not in prison", _victim,  (name _victim)];
	};
	
	_north_arrest = _victim getVariable "north_prisoner";
	if (isNil "_north_arrest") exitWith {};
	if (isopf and _north_arrest) exitWith {player groupChat "You are not allowed to unarrest northern prisoners"};

	private["_message"];
	_message = format["%1-%2 has been set free by %3-%4", _victim, (name _victim), _player, (name _player)];
	[[], "mp_global_chat_message", [_message]] call mp_aware_me;
	[_victim, false] call player_set_arrest;
};

interact_want_player = {
	private["_player", "_victim", "_reason"];

	_player = _this select 0;
	_victim = _this select 1;
	_reason = _this select 2;

	if (not([_player] call player_human)) exitWith {};
	if (not([_victim] call player_human)) exitWith {};
	if (isNil "_reason") exitWIth {};
	if (typeName _reason != "STRING") exitWith {};

	if (_victim == player) exitWith {
		player groupChat format["You cannot set yourself wanted"];
	};

	if ([_victim] call player_get_arrest) exitWith {
		player groupChat format["%1-%2 is in prison, cannot be set wanted", _victim,  (name _victim)];
	};

	if (not(alive _victim)) exitWith {
		player groupChat format["%1-%2 is not alive, cannot be set wanted", _victim,  (name _victim)];
	};

	if (_reason == "Description of crime") exitWith {
		player groupChat "You must enter a description of the crime!"
	};

	private["_message"];
	_message = format["%1-%2 has been set wanted by %3-%4 for %5", _victim, (name _victim), _player, (name _player), _reason];
	[[], "mp_global_chat_message", [_message]] call mp_aware_me;
	[_message, "Warrant"] call mp_log;
	_reason = _reason + format[" by %1-%2", _player, (name _player)];
	[_victim, _reason, 0] call player_update_warrants;
};


interact_unwant_player = {
	private["_player", "_victim"];

	_player = _this select 0;
	_victim = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_victim] call player_human)) exitWith {};

	if (_victim == player) exitWith {
		player groupChat format["You cannot set yourself unwanted"];
	};

	if (not(([_victim] call player_get_wanted))) exitWith {
		player groupChat format["%1-%2 is not wanted", _victim, (name _victim)];
	};

	private["_message"];
	_message = format["%1-%2 has cleared %3-%4's warrants", _player, (name _player), _victim, (name _victim)];
	[[], "mp_global_chat_message", [_message]] call mp_aware_me;
	[_message, "Warrant"] call mp_log;
	[_victim] call player_reset_warrants;
};


interact_president_elect = { _this spawn {
	private["_player", "_target"];


	_player = _this select 0;
	_target = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};

	WahlSperre = if (isNil "WahlSperre") then {false} else {WahlSperre};

	private["_sleep_time"];
	_sleep_time = 30;
	if (WahlSperre) exitWith {
		player groupChat format["You have already voted in the last %1 seconds", _sleep_time];
	};


	private["_voter_number", "_candidate_number"];
	_voter_number = [_player] call player_get_index;
	_candidate_number = [_target] call player_get_index;

	if (_voter_number < 0 || _candidate_number < 0) exitWith {
		player groupChat format["Unable to find candidate number"];
	};


	private["_next_election_str", "_next_election"];
	_next_election = server getVariable "next_president_election";
	_next_election_str = if (not(isNil "_next_election")) then { format["The results will be announced in %1 minute/s", _next_election]} else {""};

	player groupChat format["You voted for %1-%2. %3", _target, (name _target), _next_election_str];
	format['if (isServer) then { [%1, %2] call interact_president_update_votes;}',_voter_number, _candidate_number] call broadcast;

	WahlSperre = true;
	uiSleep _sleep_time;
	WahlSperre = false;

};};

interact_president_update_votes = {
	private["_voter_number", "_candidate_number"];

	if (not(isServer)) exitWith {};
	_voter_number = _this select 0;
	_candidate_number = _this select 1;

	if (isNil "_voter_number") exitWith {};
	if (isNil "_candidate_number") exitWith {};

	if (typeName _voter_number != "SCALAR") exitWith{};
	if (typeName _candidate_number != "SCALAR") exitWith {};


	private["_i"];
	//remove the voter from all arrays first
	_i = 0;
	while { _i < (count WahlArray) } do {
		private["_array"];
		_array = (WahlArray select _i);
		if (_voter_number in _array) exitWith {
			_array = _array - [_voter_number];
			WahlArray SET [_i, _array];
		};
		_i = _i + 1;
	};

	//then add the voter to this candidate's array of voters
	WahlArray SET [_candidate_number, ((WahlArray select _candidate_number ) + [_voter_number])];
};



interact_president_change_laws = {
	private["_number", "_text"];

	_number = _this select 0;
	_text   = _this select 1;

	if (isNil "_number") exitWith {};
	if (typeName _number != "SCALAR") exitWith {};

	if (isNil "_text") exitWith {};
	if (typeName _text != "STRING") exitWith {};

	if (_number == -1) exitWith {};

	if ((_text call ISSE_str_Length) > 60) exitWith {
		player groupChat "The text for this law is too long";
	};

	LawsArray set [_number, _text];
	publicVariable "LawsArray";

	private["_message"];
	_message = format["Law #%1 has changed.\n%2", _number, _text];
	format['hint toString(%1);', toArray(_message)] call broadcast;
};


interact_president_change_taxes_admin = {
	private["_item", "_mag", "_weap", "_vcl", "_bank"];

	_item = _this select 0;
	_mag  = _this select 1;
	_weap = _this select 2;
	_vcl  = _this select 3;
	_bank = _this select 4;

	format ["
		(INV_ItemTypeArray select 0) set [2, %1];
		(INV_ItemTypeArray select 1) set [2, %2];
		(INV_ItemTypeArray select 2) set [2, %3];
		(INV_ItemTypeArray select 3) set [2, %4];
		bank_tax = %5;
		hint ""A moderator has reset the laws and taxes!"";
	", _item, _vcl, _mag, _weap, _bank] call broadcast;
};
interact_president_change_taxes = {
	private["_item", "_mag", "_weap", "_vcl", "_bank"];

	_item = _this select 0;
	_mag  = _this select 1;
	_weap = _this select 2;
	_vcl  = _this select 3;
	_bank = _this select 4;

	format ["
		(INV_ItemTypeArray select 0) set [2, %1];
		(INV_ItemTypeArray select 1) set [2, %2];
		(INV_ItemTypeArray select 2) set [2, %3];
		(INV_ItemTypeArray select 3) set [2, %4];
		bank_tax = %5;
		hint ""The President has changed the tax rates!"";
	", _item, _vcl, _mag, _weap, _bank] call broadcast;
};

civilian_camera_cost_per_second = 1000000;

interact_civilian_camera_menu = {_this spawn {
	if (!(createDialog "civcamdialog")) exitWith {hint "Dialog Error!";};

	[1] call DialogCivilianPlayersList;
	lbSetCurSel    [1, 0];
	sliderSetRange [2, 5, 30];
	sliderSetSpeed [2, 1, 5];

	while {ctrlVisible 1002} do {
		private["_seconds", "_cost"];
		_seconds =  round(sliderPosition 2);
		_cost = _seconds * civilian_camera_cost_per_second;
		ctrlSetText [3, strM(_cost)];
		ctrlSetText [5, str(_seconds)];
	};
};};


interact_civilian_camera = {_this spawn {
	private["_player", "_target", "_watchtime"];

	_player = _this select 0;
	_target = _this select 1;
	_watchtime = _this select 2;


	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};

	if (_player != player) exitWith {};

	if (true) exitWith {
		player groupChat format["Civilian camera has been disabled"];
	};

	private["_cost"];
	_cost = _watchtime * civilian_camera_cost_per_second;

	private["_money"];
	_money = [_player] call player_get_total_money;


	if (_money < _cost) exitWith {
		player groupChat format["You do not have enough shekels to use civilian camera"];
	};

	[_player, _cost] call player_lose_money;


	if (not(([_target] call player_get_bounty) > 0)) exitWith {
		player groupChat format["%1-%2 cannot be watched, he is not wanted", _target, (name _target)];
	};


	private["_message"];
	_message = format["%1-%2 has paid $%3 to watch %4-%5 for %6 second/s in civilian camera!", _player, (name _player), strM(_cost), _target, (name _target), _watchtime];
	[[], "mp_global_chat_message", [_message]] call mp_aware_me;


	private["_tx", "_ty", "_tz", "_tpos"];
	_tpos = getPosATL _target;
	_tx = _tpos select 0;
	_ty = _tpos select 1;
	_tz = _tpos select 2;

	private["_camera"];
	_camera = "camera" camcreate [_tx, _ty, 15];

	if (not(createDialog "MainCamDialog")) exitWith {hint "Dialog Error!";};

	[0,0,0,["camcontrol",_camera,[10,30]]] execVM "copcams.sqf";

	_camera cameraEffect ["internal", "back"];
	_camera camSetPos [(getPosATL vehicle _target select 0),(getPosATL vehicle _target select 1),10];
	_camera camSetTarget vehicle _target;
	_camera camSetFOV 0.700;
	_camera camPreload 5;
	_camera camCommit 0;
	waitUntil {camCommitted _camera};
	_camera camsetpos [_tx, _ty ,10];
	_camera camSetTarget vehicle _target;
	_camera camSetFOV 0.700;
	_camera camCommit 0;
	private["_endTime"];
	_endTime = time + _watchtime;

	sliderSetRange [1055, 0, 50];
	sliderSetSpeed [1055, 100, 250];
	sliderSetPosition [1055, 10];

	private["_dx"];
	_dx = -20;

	while {(ctrlVisible 1050) and (time < _endTime)} do {
		private["_tx", "_ty", "_tpos"];
		_tpos = getPosATL (vehicle _target);
		_tx = _tpos select 0;
		_ty = _tpos select 1;
		_tz = _tpos select 2;
		_td = getDir (vehicle _target);

		_camera camSetTarget [(10 * sin(_td)+ _tx), (10*cos(_td)+_ty), _tz];
		_camera camSetPos [(_tx + _dx * sin(_td)), (_ty + _dx * cos(_td)), (_tz+(round(sliderPosition 1055)))];
		_camera camSetFOV 0.700;
		_camera camCommit 0;
		waituntil {camCommitted _camera};
		uiSleep 0.01;
	};

	setAperture -1;
	closeDialog 0;
};};

interact_warrants_menu = { _this spawn {
	if (!(createDialog "wantedrelease")) exitWith {hint "Dialog Error!";};
	[1] call DialogNotCopsList;
	lbSetCurSel [1, 0];
	[11] call DialogNotCopsList;
	lbSetCurSel [11, 0];
};};



interact_mobile_receive = {
	private["_player", "_sender", "_text"];

	_player = _this select 0;
	_sender = _this select 1;
	_text = _this select 2;

	if (not([_player] call player_human)) exitWith {};
	if (not([_sender] call player_human)) exitWith {};
	if (_player != player) exitWith {};

	private["_header"];
	_header = format["%1-%2 sent you a text message.", _sender, (name _sender)];

	titleText [_header + "\n" + _text, "PLAIN DOWN"];
	player groupChat (_header + " " + _text);

	[[],"mp_play_sound",[player,30,"smstone"]] call mp_aware_me;
};

interact_mobile_send = {
	private["_player", "_target"];

	_player = _this select 0;
	_target = _this select 1;
	_text = _this select 2;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (_player != player) exitWith {};

	if (isNil "_text") exitWith {};
	if (typeName _text != "STRING") exitWith {};

	if (_text == "") exitWith {
		player groupChat format["You cannot send an empty message"];
	};

	private["_max_size"];
	_max_size = 100;
	if (strlen(_text) > _max_size) exitWith {
		player groupChat format["Cannot send the text message. It is longer than %1 characters.", _max_size];
	};


	private["_money", "_cost"];
	_money  = [player] call get_dynamiccuntflap;
	_cost = INV_smscost;


	if (_money < _cost) exitWith {
		player groupChat format["Text messages cost %1, you do not have enough shekels in your bank account.", strM(INV_smscost)];
	};

	[player,-_cost] call transaction_dynamiccuntflap;

	_phone = [_target, "handy"] call INV_GetItemAmount;

	if !(_phone >= 1) exitWith {
		player groupChat format["%1-%2 does not have a mobile phone, your text message bounced", _target, (name _target)];
	};

	player groupChat format["You sent a text message to %1-%2 for $%3", _target, (name _target), strM(_cost)];


	private["_message"];
	_message = format["%1", _text];
	format['[%1, %2, toString(%3)] spawn interact_mobile_receive;', _target, _player, toArray(_message)] call broadcast;


	_log = format ["%1 sent %2 a text message, it was : %3",name _player,name _target,_message];
	[_log, "Text Message"] call mp_log;

	player say ["smssendtone", 1];

};

interact_mobile_use = {
	if (!(createDialog "handydialog")) exitWith {hint "Dialog Error!";};
	[2] call DialogAllPlayersList;
	lbSetCurSel [99, 0];
	buttonSetAction [3, '[player, (missionNamespace getVariable (lbData [2, lbCurSel 2])), (ctrlText 1)] call interact_mobile_send; closedialog 0;'];
};



interact_deposit_receive = {
	private["_player", "_sender", "_amount"];

	_player = _this select 0;
	_sender = _this select 1;
	_amount = _this select 2;

	if (not([_player] call player_human)) exitWith {};
	if (not([_sender] call player_human)) exitWith {};
	if (_player != player) exitWith {};

	if (isNil "_amount") exitWith {};
	if (typeName _amount != "SCALAR") exitWith {};
	if (_amount <= 0) exitWith {};

	[_player, _amount] call transaction_dynamiccuntflap;

	player groupChat format["You received $%1 from %2-%3 on your bank account", strM(_amount), _sender, (name _sender)];
};

interact_deposit_other = {
	private["_player", "_target", "_amount"];

	_player = _this select 0;
	_target = _this select 1;
	_amount = _this select 2;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (_player != player) exitWith {};

	if (isNil "_amount") exitWith {};
	if (typeName _amount != "SCALAR") exitWith {};
	if (_amount <= 0) exitWith {};


	private["_player_variable", "_player_variable_name", "_bank_amount"];
	private["_tax_fee", "_total_due"];
	_tax_fee = round(_amount * (bank_tax/100));
	_total_due = _tax_fee + _amount;
	_bank_amount = [_player] call get_dynamiccuntflap;

	if (_bank_amount < _total_due) exitWith {
		player groupChat format["You do not have enough shekels in your account to send $%1, with tax fee $%2", strM(_amount), strM(_tax_fee)];
	};

	[_player, -(_total_due)] call transaction_dynamiccuntflap;
	[_tax_fee] call shop_update_taxes;

	player groupChat format["You have sent $%1 to %2-%3, your tax fee was $%4", strM(_amount), _target, (name _target), strM(_tax_fee)];

	_message = format ["%1 transferred %2 $%3",name player,(name _target),strM(_amount)];
	[_message, "Money Tranfer"] call mp_log;

	format['[%1, %2, %3] call interact_deposit_receive;', _target, _player, strN(_amount)] call broadcast;
};

interact_check_trx_minimum = {
	private["_amount"];
	_amount = _this select 0;
	private["_minimum"];
	_minimum = 10;
	if (_amount < _minimum) exitWith {
		player groupChat format["THe minimum about for a bank transaction is $%1", strM(_minimum)];
		true
	};
	false
};

interact_deposit_self ={
	private["_player", "_target", "_amount"];

	_player = _this select 0;
	_target = _this select 1;
	_amount = _this select 2;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (_player != player) exitWith {};

	if (isNil "_amount") exitWith {};
	if (typeName _amount != "SCALAR") exitWith {};
	if (_amount <= 0) exitWith {};

	if ([_amount] call interact_check_trx_minimum) exitWith {};

	private["_money"];
	_money = [player, 'money'] call INV_GetItemAmount;

	if (_money < _amount) exitWith {
		player groupChat format["You do not have enough shekels in your inventory to deposit $%1", strM(_amount)];
	};

	player groupChat format["You have deposited $%1 into your bank account", strM(_amount)];
	_message = format ["%2 has deposited $%1 to their bank account", strM(_amount),name player];
	[_message, "Deposit"] call mp_log;
	["all"] call RG_fnc_iSave;

	[_player, _amount] call transaction_dynamiccuntflap;
	[_player, 'money', -(_amount)] call INV_AddInventoryItem;
};

interact_deposit = {
	private["_player", "_target", "_amount"];

	_player = _this select 0;
	_target = _this select 1;
	_amount  = _this select 2;


	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};

	if (_player != player) exitWith {};

	if (isNil "_amount") exitWith {};
	if (typeName _amount != "SCALAR") exitWith {};
	if (_amount <= 0) exitWith {};

	if ([_amount] call interact_check_trx_minimum) exitWith {};

	if (_player == _target) exitWith {
		(_this call interact_deposit_self)
	};
	
	(_this call interact_deposit_other)
};

interact_withdraw = {
	private["_player", "_amount"];

	_player = _this select 0;
	_amount = _this select 1;


	if (not([_player] call player_human)) exitWith {};
	if (_player != player) exitWith {};

	if (isNil "_amount") exitWith {};
	if (typeName _amount != "SCALAR") exitWith {};
	if (_amount <= 0) exitWith {};

	if ([_amount] call interact_check_trx_minimum) exitWith {};

	private["_bank_amount"];
	_bank_amount = [_player] call get_dynamiccuntflap;

	if (_amount > _bank_amount) exitWith {
		player groupChat format["You do not have enough shekels on your bank account to withdraw $%1", strM(_amount)];
	};

	[_player, -(_amount)] call transaction_dynamiccuntflap;
	[_player, 'money', (_amount)] call INV_AddInventoryItem;
	player groupChat format["You have withdrawn $%1 from your bank account", strM(_amount)];
	_message = format ["%2 has withdrawn $%1 from their bank account", strM(_amount),name player];
	["all"] call RG_fnc_iSave;
	[_message, "Withdrawal"] call mp_log;
};

interact_atm_menu = { _this spawn {
	private["_player"];

	_player = _this select 0;
	if (not([_player] call player_human)) exitWith {};
	if (_player != player) exitWith {};

	if !(local_useBankPossible)  exitWith {
		player groupChat format ["You robbed the bank a few minutes ago. You can not use it for %1 minutes after you robbed it.","12"];
	};

	if (!(createDialog "bank")) exitWith {hint "Dialog Error!";};

	private["_my_index"];

	_my_index = [1] call DialogAllPlayersList;

	if (_my_index >= 0) then {
		lbSetCurSel [1, _my_index];
	};

	buttonSetAction [10, format["[%1, (missionNamespace getVariable(lbData [1, lbCurSel 1])), ([ctrlText 2] call parse_number)] call interact_deposit; closedialog 0; ['money'] call RG_fnc_iSave; ['inventory'] call RG_fnc_iSave;", _player] ];
	buttonSetAction [11, format["[%1, ([ctrlText 2] call parse_number)] call interact_withdraw; closedialog 0;", _player] ];

	while {ctrlVisible 1003} do {
		private["_money", "_bank"];
		_money = [player, "money"] call INV_GetItemAmount;
		_bank = [player] call get_dynamiccuntflap;
		CtrlSetText [101, format ["$%1", strM(_money)]];
		CtrlSetText [102, format ["$%1", strM(_bank)]];
		private["_amount"];
		_amount = [ctrlText 2] call parse_number;
		if (_amount < 0) then {_amount = 0};

		if ((lbCurSel 1) == _my_index) then {
			CtrlSetText [4,""];
			CtrlSetText [5,""];
		}
		else {
			CtrlSetText [4, "Incl. Taxes:"];
			CtrlSetText [5, format ["$%1", strM(_amount + round(_amount * (bank_tax/100)))]];
		};
		uiSleep 0.3;
	};
};};

interact_toggle_side_markers = {
	private["_player"];
	_player = _this select 0;

	if (isNil "_player") exitWith {};
	if (_player != player) exitWith {};

	private["_sidemarkers"];
	_sidemarkers = [_player, "sidemarkers"] call player_get_bool;
	_sidemarkers = not(_sidemarkers);
	[_player, "sidemarkers", _sidemarkers] call player_set_bool;

	if (not(_sidemarkers)) then {
		player groupChat format["Side markers disabled"];
	}
	else {
		player groupChat format["Side markers enabled"];
	};
};



interact_inventory_menu = {
	private["_player"];
	disableSerialization;
	_player = _this select 0;
	if (not([_player] call player_human)) exitWith {};
	if (!(createDialog "inventar")) exitWith {hint "Dialog Error!";};

	private["_itemcounter"];
	_itemcounter = 0;

	private["_i"];
	_i = 0;
	private["_inventory"];
	_inventory = [_player] call player_get_inventory;
	while { _i < (count _inventory) } do {
		private ["_item", "_number", "_lbl_name"];
		_item = ((_inventory select _i) select 0);
		_picture = "";
		_number = ([player, _item] call INV_GetItemAmount);

		if (_number > 0) then {
			_lbl_name = (_item call INV_GetItemName);
			_index = lbAdd [1, format ["%1 (x%2)",_lbl_name,_number]];
			lbSetData [1, _index, _item];
			_picture = [_item] call get_item_image;
			_itemcounter = _itemcounter + 1;
			if !(_picture == "") then {
				lbSetPicture [1, _index, _picture];
			};
		};
		_i = _i + 1;
	};

	if (_itemcounter == 0) exitWith {
		player groupChat format["Your inventory is empty"];
	};

	for "_c" from 0 to ((count playerstringarray) - 1) do {
		private["_player_variable_name", "_player_variable"];
		_player_variable_name = playerstringarray select _c;
		_player_variable = missionNamespace getVariable [_player_variable_name, objNull];

		if ([_player_variable] call player_human) then {
			private["_player_name"];
			_player_name = (name _player_variable);
			if ((_player_variable distance player) > 20 ) exitWith {};
			_index = lbAdd [99, format ["%1 - (%2)", _player_variable_name, _player_name]];
			lbSetData [99, _index, format["%1", _c]];
		};
	};

	lbSetCurSel [99, 0];
	lbSetCurSel [1, 0];
	buttonSetAction [3,format["[""use"",  lbData [1, (lbCurSel 1)], ctrlText 501, lbData [99, (lbCurSel 99)]] call item_handle; closedialog 0;"] ];
	buttonSetAction [4,format["[""drop"", lbData [1, (lbCurSel 1)], ctrlText 501, lbData [99, (lbCurSel 99)]] call item_handle; closedialog 0;"] ];
	buttonSetAction [246,format["[""give"", lbData [1, (lbCurSel 1)], ctrlText 501, lbData [99, (lbCurSel 99)]] call item_handle; closedialog 0;"] ];

	/*
	while {ctrlVisible 1001} do {
		_ctrl = (findDisplay 1000) displayCtrl 202;
		_ctrl ctrlSetStructuredText format ["%1/%2",call INV_GetOwnWeight,INV_CarryingCapacity];

		uisleep 1;
	};
	*/
};

interact_check_distance = {
	private["_player", "_target", "_interaction"];
	_player = _this select 0;
	_target = _this select 1;
	_interaction = _this select 2;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (isNil "_interaction") exitWith {};
	if (typeName _interaction != "STRING") exitWith {};

	private["_distance"];
	_distance = _player distance _target;

	if ((_distance > 5)) exitWIth {
		player groupChat format["You cannot %1 %2-%3, you are too far", _interaction, _target, (name _target)];
		false
	};

	if (not(alive _target)) exitWith {
		player groupChat format["You cannot %1 %2-%3, he is dead", _interaction, _target, (name _target)];
		false
	};

	true
};

interact_check_armed = {
	private["_player", "_target", "_interaction"];
	_player = _this select 0;
	_target = _this select 1;
	_interaction = _this select 2;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (isNil "_interaction") exitWith {};
	if (typeName _interaction != "STRING") exitWith {};


	if (not([player] call check_armed_player)) exitWith {
		player groupChat format["You cannot %1 %2-%3, you are not armed", _interaction, _target, (name _target)];
		false
	};

	true
};


//HEALING
interact_heal_player = {
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};

	private["_interaction"];
	_interaction = "heal";
	if (not([_player, _target, _interaction] call interact_check_distance)) exitWith {};

	player groupChat format["You healed %1-%2", _target, (name _target)];
	format['[%1, %2] call interact_heal_receive;', _player, _target] call broadcast;
};

interact_heal_receive = {
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};

	if (_target != player) exitWith {};

	player setDamage 0;
	[player] call medical_system_heal;
	player groupChat format["%1-%2 healed you", _player, (name _player)];
};


//////////////////// CHECK INVENTORY ////////////////////

interact_check_inventory = {
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};

	if (_player != player) exitWith {};

	private["_interaction"];
	_interaction = "search";
	if (not([_player, _target, _interaction] call interact_check_distance)) exitWith {};
	if (not([_player, _target, _interaction] call interact_check_armed)) exitWith {};


	if(!([_target] call player_vulnerable))exitwith{
		player groupChat format["%1-%2 does not have his hands up, or is subdued", _target, (name _target)];
	};

	format['[%1, %2] call interact_check_inventory_receive;', _player, _target] call broadcast;
};
interact_check_licenses = {
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};

	if (_player != player) exitWith {};
	format['[%1, %2] call interact_check_licenses_receive;', _player, _target] call broadcast;
};
interact_check_license_response = {
	private["_player", "_target", "_licenses"];
	_player = _this select 0;
	_target = _this select 1;
	_licenses = _this select 2;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (isNil "_licenses") exitWith {};
	if (typeName _licenses != "ARRAY") exitWith {};

	if (_player != player) exitWith {};

	["licensecheck", _licenses, _target] spawn dialog_handler;
};
interact_check_licenses_receive = {


	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (_target != player) exitWith {};

	format['[%1, %2, %3] call interact_check_license_response;', _player, _target, INV_LicenseOwner] call broadcast;
};
interact_check_inventory_admin = {
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};

	if (_player != player) exitWith {};

	private["_interaction"];
	_interaction = "search";
	format['[%1, %2] call interact_check_inventory_receive;', _player, _target] call broadcast;
};

interact_check_inventory_response = {
	private["_player", "_target", "_licenses", "_inventory"];
	_player = _this select 0;
	_target = _this select 1;
	_licenses = _this select 2;
	_inventory = _this select 3;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (isNil "_licenses") exitWith {};
	if (typeName _licenses != "ARRAY") exitWith {};
	if (isNil "_inventory") exitWith {};
	if (typeName _inventory != "ARRAY") exitWith {};

	if (_player != player) exitWith {};

	["inventorycheck", _licenses, _inventory, _target] spawn dialog_handler;
};
interact_check_inventory_receive = {
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (_target != player) exitWith {};

	private["_inventory"];
	_inventory = [_target] call player_get_inventory;
	format['[%1, %2, %3, %4] call interact_check_inventory_response;', _player, _target, INV_LicenseOwner, _inventory] call broadcast;
};



//////////////////// ROBBING ////////////////////

interact_rob_inventory = {
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};

	if (_player != player) exitWith {};

	private["_interaction"];
	_interaction = "rob";
	if (not([_player, _target, _interaction] call interact_check_distance)) exitWith {};
	if (not([_player, _target, _interaction] call interact_check_armed)) exitWith {};


	private["_near_cops"];
	if (([player, 40] call player_near_cops) && not([_target] call player_cop)) then {
		player groupChat format["You cannot rob %1-%2, there is a cop near", _target, (name _target)];
	};

	if (not([_target] call player_vulnerable)) exitWith {
		player groupChat format["%1-%2 does not have his hands up, or is not subdued", _target, (name _target)];
	};

	format['[%1, %2] call interact_rob_inventory_receive;', _player, _target] call broadcast;
};


interact_rob_inventory_response = {
	private["_player", "_target", "_amount"];
	_player = _this select 0;
	_target = _this select 1;
	_amount = _this select 2;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (isNil "_amount") exitWith {};
	if (typeName _amount != "SCALAR") exitWith {};
	if (_amount <= 0) exitWith {};

	if (_player != player) exitWith {};

	[_player, "money", _amount] call INV_AddInventoryItem;
};

interact_rob_inventory_receive = {
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;


	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};

	if (_target != player) exitWith {};

	private["_money"];
	_money  = [player, 'money'] call INV_GetItemAmount;

	private["_amount"];
	_amount = (floor(random _money));
	[_target, "money", -(_amount)] call INV_AddInventoryItem;

	if (stolenfromtimeractive || (_money <= 0) || (_amount <= 0)) exitwith {
		[_player, format["(failed-armed-robbery, %1-%2)", _target, (name _target)], 20000] call player_update_warrants;

		private["_message"];
		_message = format["%1-%2 attemted to rob %3-%4 but failed", _player, (name _player), _target, (name _target)];
		format['hint toString(%1);', toArray(_message)] call broadcast;
	};

	format['[%1, %2, %3] call interact_rob_inventory_response;', _player, _target, _amount] call broadcast;
	[_player, format["(armed-robbery, %1-%2)", _target, (name _target)], _amount] call player_update_warrants;

	private["_message"];
	_message = format["%1-%2 stole $%3 from %4-%5", _player, (name _player), strM(_amount), _target, (name _target)];
	[_message, "Robbery"] call mp_log;
	format['hint toString(%1);', toArray(_message)] call broadcast;

	[] spawn {
		stolenfromtimeractive = true;
		uiSleep stolenfromtime;
		stolenfromtimeractive = false;
	};
};

//////////////////// SEARCHING ////////////////////
interact_search_player = {
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};

	if (_player != player) exitWith {};

	private["_interaction"];
	_interaction = "search";
	if (not([_player, _target, _interaction] call interact_check_distance)) exitWith {};
	if (not([_player, _target, _interaction] call interact_check_armed)) exitWith {};

	format['[%1, %2] call interact_search_receive;', _player, _target] call broadcast;
};

interact_search_receive = {
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};

	if (_target != player) exitWith {};


	private["_drugs_value"];
	_drugs_value = [_target] call interact_drug_search_count;
	_organs_value = [_target] call interact_organ_search_count;
	_bank_value = [_target] call interact_gold_search_count;
	
	if ((_drugs_value <= 0) and (_organs_value <= 0)) exitWith {
		format['[%1, %2, 0] call interact_drug_search_response;', _player, _target] call broadcast;
	};
		
	[_target, ([_target] call player_inventory_name), "drug"] call INV_StorageRemoveKindOf;
	[_target, ([_target] call player_inventory_name), "organ"] call INV_StorageRemoveKindOf;
	[_target, ([_target] call player_inventory_name), "bankgold"] call INV_StorageRemoveKindOf;

	if (_organs_value > 0) then {
		[_target, "(organ-possession)", _organs_value] call player_update_warrants;
		[_target, "(tampering with a body)", 15000] call player_update_warrants;
	};		
	
	if (_bank_value > 0) then {
		[_target, "(posession of stolen property - bank gold)", _bank_value] call player_update_warrants;
	};	
	
	if (_drugs_value > 0) then {
		[_target, "(drug-possession)", _drugs_value] call player_update_warrants;
	};
	
	_total_value = (_drugs_value + _organs_value + _bank_value);
	
	format['[%1, %2, %3] call interact_search_response;', _player, _target, _total_value] call broadcast;
	player groupChat format["%1-%2 removed your illegal items", _player, (name _player)];
};

interact_search_response = {
	private["_player", "_target", "_amount"];
	_player = _this select 0;
	_target = _this select 1;
	_amount = _this select 2;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (isNil "_amount") exitWith {};
	if (typeName _amount != "SCALAR") exitWith {};

	if (_amount < 0) exitWith {};

	if (_player != player) exitWith {};

	_amount = round(_amount);
	
	private["_message"];
	
	if (_amount > 0) then {
	
		_message = format["%1-%2 had $%3 worth of illegal items.!", _target, (name _target), strM(_amount)];
		format['titleText [toString(%1), "PLAIN DOWN"];', toArray(_message)] call broadcast;
		player groupChat format ["%1 had illegal items on him. You should issue him a citation of %2 or arrest him.",name _target,strM(_amount)];
		
	} else {
		player groupChat format ["%1 did not have anything illegal on him.",name _target];
	};
};

interact_organ_search_count = {
	private["_target"];
	_target = _this select 0;

	if (not([_target] call player_human)) exitWith {0};
	if (_target != player) exitWith {0};

	private["_i", "_organs_value"];
	_organs_value = 0;
	_i = 0;

	private["_inventory"];
	_inventory = [_target] call player_get_inventory;

	while { _i <  (count _inventory) } do {
		private["_item", "_infos"];
		_item   = ((_inventory select _i) select 0);
		_infos  = _item call INV_GetItemArray;

		if(_item call INV_GetItemKindOf == "organ") then {
			private["_amount", "_price"];
			_amount = ([player, _item] call INV_GetItemAmount);
			_price  = (_infos call INV_GetItemSellCost);
			_organs_value = _organs_value + (_price*_amount);
		};
		_i = _i + 1;
	};

	_organs_value
};

interact_gold_search_count = {
	private["_target"];
	_target = _this select 0;

	if (not([_target] call player_human)) exitWith {0};
	if (_target != player) exitWith {0};

	private["_i", "_bank_value"];
	_bank_value = 0;
	_i = 0;

	private["_inventory"];
	_inventory = [_target] call player_get_inventory;

	while { _i <  (count _inventory) } do {
		private["_item", "_infos"];
		_item   = ((_inventory select _i) select 0);
		_infos  = _item call INV_GetItemArray;

		if(_item call INV_GetItemKindOf == "bankgold") then {
			private["_amount", "_price"];
			_amount = ([player, _item] call INV_GetItemAmount);
			_price  = (_infos call INV_GetItemSellCost);
			_bank_value = _bank_value + (_price*_amount);
		};
		_i = _i + 1;
	};

	_bank_value
};

interact_drug_search_count = {
	private["_target"];
	_target = _this select 0;

	if (not([_target] call player_human)) exitWith {0};
	if (_target != player) exitWith {0};

	private["_i", "_drugs_value"];
	_drugs_value = 0;
	_i = 0;

	private["_inventory"];
	_inventory = [_target] call player_get_inventory;

	while { _i <  (count _inventory) } do {
		private["_item", "_infos"];
		_item   = ((_inventory select _i) select 0);
		_infos  = _item call INV_GetItemArray;

		if(_item call INV_GetItemKindOf == "drug") then {
			private["_amount", "_price"];
			_amount = ([player, _item] call INV_GetItemAmount);
			_price  = (_infos call INV_GetItemSellCost);
			_drugs_value = _drugs_value + (_price*_amount);
		};
		_i = _i + 1;
	};

	_drugs_value
};


////////////////////////////////////////Dog Searching////////////////////////////////////////////////
interact_drug_search_dog = {
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};

	if (_player != player) exitWith {};


	format['[%1, %2] call interact_drug_search_receive_dog;', _player, _target] call broadcast;
	
};
interact_drug_search_response_dog = {
	private["_dog", "_target", "_amount"];
	_player = _this select 0;
	_target = _this select 1;
	_amount = _this select 2;
	if (not([_target] call player_human)) exitWith {};
	if (isNil "_amount") exitWith {};
	if (typeName _amount != "SCALAR") exitWith {};
	if (_player != player) exitWith {};

	
	if (_amount < 0) exitWith {};

	_amount = round(_amount);
	

	if (_amount == 0) exitWith {
		player groupChat format["Your dog has not found any drugs on %1-%2", _target, (name _target)];
	};

	private["_message"];
	_message = format["Your dog found drugs on %1-%2, you have removed them. You should arrest %1-%2 or give them a ticket of $%3. ", _target, (name _target), strM(_amount/2)];
	player groupChat _message;

	_message = format["A police k9 has found a person with drugs, %1-%2 had $%3 worth of illegal items.!", _target, (name _target), strM(_amount)];
	format['titleText [toString(%1), "PLAIN DOWN"];', toArray(_message)] call broadcast;
};

interact_drug_search_count_dog = {
	private["_target"];
	_target = _this select 0;

	if (not([_target] call player_human)) exitWith {0};
	if (_target != player) exitWith {0};

	private["_i", "_drugs_value"];
	_drugs_value = 0;
	_i = 0;

	private["_inventory"];
	_inventory = [_target] call player_get_inventory;

	while { _i <  (count _inventory) } do {
		private["_item", "_infos"];
		_item   = ((_inventory select _i) select 0);
		_infos  = _item call INV_GetItemArray;

		if(_item call INV_GetItemKindOf == "drug") then {
			private["_amount", "_price"];
			_amount = ([player, _item] call INV_GetItemAmount);
			_price  = (_infos call INV_GetItemSellCost);
			_drugs_value = _drugs_value + (_price*_amount);
		};
		_i = _i + 1;
	};

	_drugs_value
};

interact_drug_search_receive_dog = {
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};

	if (_target != player) exitWith {};


	private["_drugs_value"];
	_drugs_value = [_target] call interact_drug_search_count;

	if (_drugs_value <= 0) exitWith {
		format['[%1, %2, 0] call interact_drug_search_response_dog;', _player, _target] call broadcast;
	};

	[_target, ([_target] call player_inventory_name), "drug"] call INV_StorageRemoveKindOf;
	[_target, "(drug-possession)", _drugs_value] call player_update_warrants;


	format['[%1, %2, %3] call interact_drug_search_response_dog;', _player, _target, strN(_drugs_value)] call broadcast;
	player groupChat format["%1-%2 removed your drugs", _player, (name _player)];
};


































//////////////////// DISARMING ////////////////////

interact_disarm = {
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};

	if (_player != player) exitWith {};

	private["_interaction"];
	_interaction = "disarm";
	if (not([_player, _target, _interaction] call interact_check_distance)) exitWith {};
	if (not([_player, _target, _interaction] call interact_check_armed)) exitWith {};


	if(not([_target] call player_vulnerable)) exitWith {
		player groupChat format["You cannot disarm %1-%2, he is not subdued", _target, (name _target)];
	};

	private["_weapons"];
	_weapons = (weapons _target);
	if (count _weapons == 0) exitWith {
		player groupChat format["%1-%2 is not armed!", _target, (name _target)];
	};

	private["_message"];
	_message = format["%1-%2 disarmed %3-%4", _player, (name _player), _target, (name _target)];
	[[], "mp_global_chat_message", [_message]] call mp_aware_me;

	format['[%1, %2] call interact_disarm_receive;', _player, _target] call broadcast;
};


interact_disarm_receive = {
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};

	if (_target != player) exitWith {};

	private["_weapons"];
	_weapons = (weapons _target) - nonlethalweapons;
	if (count _weapons > 0) then {
		{_target removeWeapon _x} forEach _weapons;
	};

	[_target] call INV_RemoveIllegal;
};
interact_ticket = {
	private["_player", "_target", "_amount"];
	_player = _this select 0;
	_target = _this select 1;
	_amount = _this select 2;
	_reason = _this select 3;
	
	if (_reason == "" or isNil "_reason") exitWith {
		player groupChat format ["You must specify a reason for which you are ticketing this individual"];
		hint format ["You must specify a reason for which you are ticketing this individual"];
	};

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (_amount <= 0) exitWith {};
	if (_player != player) exitWith {};
	_amount = round(_amount);

	private["_message"];
	if !(isNil "_reason") then {
	_message = format["%1-%2 gave a %3-%4 a ticket of $%5 for %6", _player, (name _player), _target, (name _target), strM(_amount),_reason];
	} else {
		_message = format["%1-%2 gave a %3-%4 a ticket of $%5", _player, (name _player), _target, (name _target), strM(_amount)];
	};
	[[], "mp_global_chat_message", [_message]] call mp_aware_me;

	_log = format ["%1 gave %2 a ticket of %3",name _player,name _target,strN(_amount)];
	[_log, "Ticket"] call mp_log;

	[[_target], "interact_ticket_receive", [_player,_target,_amount]] call mp_aware_me;
	//format['[%1, %2, %3] call interact_ticket_receive;', _player, _target, _amount] call broadcast;
};

interact_ticket_receive = { _this spawn {
	private["_player", "_target", "_amount"];
	_player = _this select 0;
	_target = _this select 1;
	_amount = _this select 2;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (_amount <= 0) exitWith {};

	if (_target != player) exitWith {};

	_amount = round(_amount);

	response = false;
	if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};
	ctrlSetText [1, format["%1-%2 gave you a ticket of $%3. Do you agree to pay?", _player, (name _player), strM(_amount)]];
	waitUntil{(not(ctrlVisible 1023))};

	if (not(response)) exitWith {
		private["_message"];
		_message = format["%1-%2 did not agree to pay %3-%4's ticket of $%5", _target, (name _target), _player, (name _player), strM(_amount)];
		[[], "mp_global_chat_message", [_message]] call mp_aware_me;
	};

	private ["_player_money"];
	_player_money = [_target] call player_get_total_money;

	if (_amount > _player_money ) exitWith {
		private["_message"];
		_message = format["%1-%2 did not have enough shekels to pay %3-%4's ticket of $%5", _target, (name _target), _player, (name _player), strM(_amount)];
		[[], "mp_global_chat_message", [_message]] call mp_aware_me;
	};

	[_target, _amount] call player_lose_money;

	if (([_player] call player_cop) or ([_player] call player_opfor)) then {
		[[_player], "player_increase_rank", [_player,2]] call mp_aware_me;
	};

	_message = format["%1-%2 paid %3-%4's ticket of $%5", _target, (name _target), _player, (name _player), strM(_amount)];
	[[], "mp_global_chat_message", [_message]] call mp_aware_me;

	_message = format["%2 paid your ticket of $%5", _target, (name _target), _player, (name _player), strM(_amount)];
	[[_player], "mp_side_chat_message", [_message]] call mp_aware_me;
	[[], "interact_ticket_distribute", [_player,_target,_amount]] call mp_aware_me;
	//format['[%1, %2, %3] call interact_ticket_distribute;', _player, _target, _amount] call broadcast;
};};

interact_ticket_distribute = {
	private["_player", "_target", "_amount"];
	_player = _this select 0;
	_target = _this select 1;
	_amount = _this select 2;

	if (not([_player] call player_human)) exitWith {};
	if (not([_target] call player_human)) exitWith {};
	if (_amount <= 0) exitWith {};

	if !(iscop or isopf) exitWith {};

	private["_cop_count", "_cop_money"];
	_cop_count = playersNumber west;
	_cop_money = round(_amount / _cop_count);
	player sideChat format["You got $%1 because %2-%3 paid %4-%5's ticket of $%6", _cop_money, _target, (name _target), _player, (name _player), strM(_amount)];
	[player, _cop_money] call transaction_dynamiccuntflap;
};




interact_side_ai_magazines = {
	private["_side"];
	_side = _this select 0;
	if (isNil "_side") exitWith {[]};
	if (typeName _side != "SIDE") exitWith {[]};

	if (_side == west) exitWith { backup_cop_magazines };
	if (_side == east) exitWith { backup_opf_magazines };
	if (_side == resistance ) exitWith { backup_ins_magazines };

	[]
};

interact_side_ai_weapons = {
	private["_side"];
	_side = _this select 0;
	if (isNil "_side") exitWith {[]};
	if (typeName _side != "SIDE") exitWith {[]};

	if (_side == west) exitWith { backup_cop_weapons };
	if (_side == east) exitWith { backup_opf_weapons };
	if (_side == resistance ) exitWith { backup_ins_weapons };
	[]
};

interact_side_ai_class = {
	private["_side"];
	_side = _this select 0;
	if (isNil "_side") exitWith {""};
	if (typeName _side != "SIDE") exitWith {""};

	if (_side == west) exitWith {"UN_CDF_Soldier_EP1"};
	if (_side == east) exitWith {"TK_Soldier_EP1"};
	if (_side == resistance) exitWith {"TK_GUE_Soldier_EP1"};
	""
};

interact_recruit_ai_receive = {
	if (not(isServer)) exitWith {};
	private["_player"];

	player groupChat format["interact_recruit_ai_receive %1", _this];

	_player = _this select 0;
	if (not([_player] call player_human)) exitWith {};

	private["_class"];
	_class = [([_player] call player_side)] call interact_side_ai_class;

	private["_unit"];
	_unit = (group _player) createUnit [_class, position _player, [], 0, "FORM"];
	[_unit] joinSilent (group _player);

	private["_unit_name"];
	_unit_name = format["%1_Troop_%2_%3", str(_player), (count (units (group _player))), round(time)];

	_unit setVehicleInit format[
	'
		this setVehicleVarName "%1";
		%1 = this;
	', _unit_name];

	processInitCommands;

	_unit = missionNamespace getVariable _unit_name;
	_backup = call compile format["%1", _varName];

	private["_side_ai_weapons", "_side_ai_magazines"];

	_side_ai_weapons = [([_player] call player_side)] call interact_side_ai_weapons;
	_side_ai_magazines = [([_player] call player_side)] call interact_side_ai_magazines;

	[_unit] call player_reset_gear;
	{ _unit addWeapon _x } forEach _side_ai_weapons;
	{ _unit addMagazine _x } forEach _side_ai_magazines;

	reload _unit;
	_unit addMPEventHandler ["MPKilled", { _this call player_handle_mpkilled }];
};

interact_recruit_ai = { _this spawn {
	private["_player"];
	_player = _this select 0;
	if (not([_player] call player_human)) exitWith {};

	interact_recruit_ai_busy = if (isNil "interact_recruit_ai_busy") then { false } else {interact_recruit_ai_busy};

	if (interact_recruit_ai_busy) exitWith {
		player groupChat format["Already recruiting AI"];
	};

	interact_recruit_ai_busy = true;

	private["_money"];
	_money = [_player, 'money'] call INV_GetItemAmount;

	if (_money < 200000) exitWith {
		player groupChat "Not Enough Money";
		interact_recruit_ai_busy = false;
	};

	if (count (units group player) >= 8) exitWith {
		player groupChat "Squad Is Full";
		interact_recruit_ai_busy = false;
	};

	[_player, 'money', -(200000)] call INV_AddInventoryItem;
	player groupChat "Recruiting soldier";

	format['[%1] call interact_recruit_ai_receive;', _player] call broadcast;
	uiSleep 1;
	interact_recruit_ai_busy = false;
};};


interact_stranded_check = {
	private["_player"];
	_player = _this select 0;
	if ([_player] call player_get_dead) exitWith {};
	if (not([_player] call player_stranded)) exitWith {};

	response = false;
	if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!";};

	ctrlSetText [1, format["Hey there, looks like you are stranded. Do you want to quickly respawn? Note that as a penalty, you will lose your gear, and inventory."]];
	waitUntil{(not(ctrlVisible 1023))};

	if (response) then {
		titleText ["", "BLACK OUT", 1];
		uiSleep 1;
		[_player] call player_teleport_spawn;
		[_player] call player_reset_gear;
		[_player] call player_reset_side_inventory;
		titleText ["", "BLACK IN", 1];
	}
	else {
		player groupChat "Good luck, may the force be with you!";
	};
};


interact_generic_storage_menu = { _this spawn {
	private["_left_button_code", "_right_button_code",
			"_left_label_code", "_right_label_code",
			"_left_list_code", "_right_list_code",
			"_right_selection_code", "_left_selection_code"];

	_left_button_code = _this select 0;
	_left_selection_code = _this select 1;
	_left_list_code = _this select 2;
	_left_label_code = _this select 3;

	//["interact_generic_storage_menu",""] call print_debug;

	_right_button_code = _this select 4;
	_right_selection_code = _this select 5;
	_right_list_code = _this select 6;
	_right_label_code = _this select 7;

	if (isNil "_left_button_code") exitWith {};
	if (isNil "_left_selection_code") exitWith {};
	if (isNil "_left_list_code") exitWith {};
	if (isNil "_left_label_code") exitWith {};

	if (isNil "_right_button_code") exitWith {};
	if (isNil "_right_selection_code") exitWith {};
	if (isNil "_right_list_code") exitWith {};
	if (isNil "_right_label_code") exitWith {};

	if (typeName _left_button_code != "CODE") exitWith {};
	if (typeName _left_selection_code != "CODE") exitWith {};
	if (typeName _left_list_code != "CODE") exitWith {};
	if (typeName _left_label_code != "CODE") exitWith {};

	if (typeName _right_button_code != "CODE") exitWith {};
	if (typeName _right_selection_code != "CODE") exitWith {};
	if (typeName _right_list_code != "CODE") exitWith {};
	if (typeName _right_label_code != "CODE") exitWith {};

	if (!(createDialog "storage_dialog")) exitWith {hint "Dialog Error!";};
	disableSerialization;

	//["Dialog Created",""] call print_debug;

	//["1"] call print_debug;

	private["_display"];

	//["2"] call print_debug;

	lbClear 1;

	//["3"] call print_debug;

	lbClear 101;

	//["4"] call print_debug;



	//[_object, _arrname] call INV_CheckArray;

	//["5"] call print_debug;

	_arr = _object getVariable _arrname;
	//["_arr","_arr"] call print_debug;
		//["_object","_object"] call print_debug;
			//["_arrname","_arrname"] call print_debug;




	//player groupChat format["_arr = %1", _arr];

	CtrlSetText [91,localize "Take Items"];
	CtrlSetText [92,localize "Store Items"];

	//["List Text Defined"] call print_debug;


	CtrlSetText [765, (call _left_label_code)];
	CtrlSetText [100, (call _right_label_code)];

	private["_left_list"];
	_left_list = call _left_list_code;

	private["_right_list"];
	_right_list = call _right_list_code;

	{
		private["_index", "_text", "_value", "_entry"];
		_entry = _x;
		_text = _entry select 0;
		_value = _entry select 1;
		_index = lbAdd [1, _text];
		lbSetData [1, _index, _value];
	} forEach _left_list;

	{
		private["_index", "_text", "_value", "_entry"];
		_entry = _x;
		_text = _entry select 0;
		_value = _entry select 1;
		_index = lbAdd [101, _text];
		lbSetData [101, _index, _value];
	} forEach _right_list;


	buttonSetAction [3, format['[(lbData [1, (lbCurSel 1)]), ([(ctrlText 2)] call parse_number)] call %1', _left_button_code]];
	buttonSetAction [103, format['[(lbData [101, (lbCurSel 101)]), ([(ctrlText 102)] call parse_number)] call %1', _right_button_code]];

	while {ctrlVisible 1015} do {
		private["_left_selection"];
		_left_selection_index = (lbCurSel 1);

		if (_left_selection_index >= 0) then {
			private["_left_selection_value", "_left_amount"];
			_left_amount =  [(ctrlText 2)] call parse_number;
			_left_selection_value  = lbData [1, (lbCurSel 1)];
			CtrlSettext [3,  [_left_selection_value, _left_amount] call _left_selection_code];
		}
		else {
			CtrlSettext [3,  "/"];
		};

		private["_right_selection_index"];
		_right_selection_index = (lbCurSel 101);

		if (_right_selection_index >= 0) then {
			private["_right_selection_value", "_right_amount"];
			_right_selection_value = lbData [101, (lbCurSel 101)];
			_right_amount = [(ctrlText 102)] call parse_number;
			CtrlSettext [103,  [_right_selection_value, _right_amount] call _right_selection_code];
		}
		else {
			CtrlSettext [103,  "/"];
		};
		uiSleep 0.3;
	};

};};

interact_generate_storage_list_code = {
	private["_object", "_storage"];
	_object = _this select 0;
	_storage = _this select 1;

	if (isNil "_object") exitWith {{}};
	if (isNil "_storage") exitWith {{}};
	if (typeName _object != "OBJECT") exitWith {{}};
	if (typeName _storage != "STRING") exitWith {{}};

	private["_code"];
	_code = compile format[
	'
		_entries = [];
		{
			private["_entry", "_item", "_count","_text", "_item_weight", "_infos", "_name"];
			_entry = _x;
			_item = _entry select 0;
			_count = [(_entry select 1)] call decode_number;
			_infos  = _item call INV_GetItemArray;
			_item_weight = (_infos call INV_GetItemTypeKg);
			_name = (_infos call INV_GetItemName);
			if (_count > 0 && (_infos call INV_GetItemDropable)) then {
				_text = _name + " (" + strM(_count) + " - " + str(_item_weight * _count ) + "Kg)";
				_entries = _entries + [[_text, _item]];
			};
		} forEach (%1 getVariable "%2");
		(_entries)
	', _object, _storage];

	_code
};

interact_generate_selection_code = {
	private["_action"];
	_action = _this select 0;
	if (isNil "_action") exitWith {{""}};
	if (typeName _action != "STRING") exitWith {{""}};

	private["_code"];
	_code = compile format[
	'
		private["_item", "_count"];
		_item = _this select 0;
		_count = _this select 1;
		private["_infos", "_weight", "_text"];
		_infos  = _item call INV_GetItemArray;
		_weight = (_infos call INV_GetItemTypeKg) * _count;
		_text = ("%1 " + strM(_count) + " Item(s) (" + strM(_weight) + "Kg)");
		(_text)
	', _action];

	_code
};

interact_private_storage_menu = {
	private["_player"];

	_player = _this select 0;
	if (not([_player] call player_exists)) exitWith {};

	private["_private_storage_name", "_player_storage_name"];
	_private_storage_name = "private_storage";
	_player_storage_name = ([_player] call object_storage_name);

	private["_left_button_code", "_right_button_code",
			"_left_label_code", "_right_label_code",
			"_left_list_code", "_right_list_code",
			"_right_selection_code", "_left_selection_code"];

	_left_list_code = [_player, _private_storage_name] call interact_generate_storage_list_code;
	_right_list_code = [_player, _player_storage_name] call interact_generate_storage_list_code;

	_left_selection_code = ["Take"] call interact_generate_selection_code;
	_right_selection_code = ["Put"] call interact_generate_selection_code;

	_left_button_code = compile format['
		private["_item", "_count"];
		_item = _this select 0;
		_count = _this select 1;
		if (_count <= 0) exitWith {};
		if (_item == "money") exitWith {player groupChat "You are no longer allowed to take or store money in private storage"};
		[%1, "%2", _item, -(_count)] call interact_generic_storage;
	', _player, _private_storage_name];

	_right_button_code = compile format['
		private["_item", "_count"];
		_item = _this select 0;
		_count = _this select 1;
		if (_count <= 0) exitWith {};
		if (_item == "money") exitWith {player groupChat "You are no longer allowed to take or store money from private storage"};
		[%1, "%2", _item, _count] call interact_generic_storage;
	', _player, _private_storage_name];


	_left_label_code = compile format['
		private["_class", "_player", "_max_weight", "_weight"];
		_player = %1;
		_storage = "%2";
		_weight = [_player, _storage] call INV_GetStorageWeight;
		("Storage " + strM(_weight) + "/Unlimited" )
	', _player, _private_storage_name];

	_right_label_code = compile format['
		private["_class", "_player", "_max_weight", "_weight"];
		_player = %1;
		_storage = "%2";
		_weight = [_player, _storage] call INV_GetStorageWeight;
		_max_weight = INV_CarryingCapacity;
		("Inventory " + strM(_weight) + "/" + strM(_max_weight))
	', _player, _player_storage_name];

	[
		_left_button_code, _left_selection_code, _left_list_code, _left_label_code,
		_right_button_code, _right_selection_code, _right_list_code, _right_label_code
	] call interact_generic_storage_menu;
};

factory_storage_menu = {
	//player groupChat format["factory_storage_menu %1", _this];
	private["_player", "_factory_storage_name"];

	_player = _this select 0;
	_factory_storage_name = _this select 1;
	if (not([_player] call player_exists)) exitWith {};
	if (isNil "_factory_storage_name") exitWIth {};
	if (typeName _factory_storage_name != "STRING") exitWith {};

	private["_player_storage_name"];
	_player_storage_name = ([_player] call object_storage_name);

	private["_left_button_code", "_right_button_code",
			"_left_label_code", "_right_label_code",
			"_left_list_code", "_right_list_code",
			"_right_selection_code", "_left_selection_code"];

	_left_list_code = [_player, _factory_storage_name] call interact_generate_storage_list_code;
	_right_list_code = [_player, _player_storage_name] call interact_generate_storage_list_code;

	_left_selection_code = ["Take"] call interact_generate_selection_code;
	_right_selection_code = ["Put"] call interact_generate_selection_code;

	_left_button_code = compile format['
		private["_item", "_count"];
		_item = _this select 0;
		_count = _this select 1;
		if (_count <= 0) exitWith {};
		[%1, "%2", _item, -(_count)] call interact_factory_storage;
	', _player, _factory_storage_name];

	_right_button_code = compile format['
		private["_item", "_count"];
		_item = _this select 0;
		_count = _this select 1;
		if (_count <= 0) exitWith {};
		[%1, "%2", _item, _count] call interact_factory_storage;
	', _player, _factory_storage_name];

	_left_label_code = compile format['
		private["_class", "_player", "_max_weight", "_weight"];
		_player = %1;
		_storage = "%2";
		_weight = [_player, _storage] call INV_GetStorageWeight;
		("Storage " + strM(_weight) + "/Unlimited" )
	', _player, _factory_storage_name];

	_right_label_code = compile format['
		private["_class", "_player", "_max_weight", "_weight"];
		_player = %1;
		_storage = "%2";
		_weight = [_player, _storage] call INV_GetStorageWeight;
		_max_weight = INV_CarryingCapacity;
		("Inventory " + strM(_weight) + "/" + strM(_max_weight))
	', _player, _player_storage_name];

	[
		_left_button_code, _left_selection_code, _left_list_code, _left_label_code,
		_right_button_code, _right_selection_code, _right_list_code, _right_label_code
	] call interact_generic_storage_menu;
};

interact_vehicle_storage_menu = {
	private["_player", "_vehicle"];



	_player = _this select 0;
	_vehicle = _this select 1;

	if (not([_player] call player_exists)) exitWith {};
	if (not([_vehicle] call vehicle_exists)) exitWith {};

	private["_vehicle_storage_name", "_player_storage_name"];
	_vehicle_storage_name = ([_vehicle] call object_storage_name);
	_player_storage_name = ([_player] call object_storage_name);

	private["_left_button_code", "_right_button_code",
			"_left_label_code", "_right_label_code",
			"_left_list_code", "_right_list_code",
			"_right_selection_code", "_left_selection_code"];

	_left_list_code = [_vehicle, _vehicle_storage_name] call interact_generate_storage_list_code;
	_right_list_code = [_player, _player_storage_name] call interact_generate_storage_list_code;

	_left_selection_code = ["Take"] call interact_generate_selection_code;
	_right_selection_code = ["Put"] call interact_generate_selection_code;

	_left_button_code = compile format['
		private["_item", "_count"];
		_item = _this select 0;
		_count = _this select 1;
		if (_count <= 0) exitWith {};
		[%1, _item, -(_count)] call interact_vehicle_storage;
	', _vehicle];

	_right_button_code = compile format['
		private["_item", "_count"];
		_item = _this select 0;
		_count = _this select 1;
		if (_count <= 0) exitWith {};
		[%1, _item, _count] call interact_vehicle_storage;
	', _vehicle];

	_left_label_code = compile format['
		private["_class", "_vehicle", "_max_weight", "_weight"];
		_vehicle = %1;
		_storage = "%2";
		_class = typeOf _vehicle;
		_weight = [_vehicle, _storage] call INV_GetStorageWeight;
		_max_weight = _class call INV_GetVehMaxKg;
		("Trunk " + strM(_weight) + "/" + strM(_max_weight))
	', _vehicle, _vehicle_storage_name];

	_right_label_code = compile format['
		private["_class", "_player", "_max_weight", "_weight"];
		_player = %1;
		_storage = "%2";
		_weight = [_player, _storage] call INV_GetStorageWeight;
		_max_weight = INV_CarryingCapacity;
		("Inventory " + strM(_weight) + "/" + strM(_max_weight))
	', _player, _player_storage_name];

	[
		_left_button_code, _left_selection_code, _left_list_code, _left_label_code,
		_right_button_code, _right_selection_code, _right_list_code, _right_label_code
	] call interact_generic_storage_menu;
};



interact_vehicle_storage = {
	private["_vehicle", "_item", "_amount"];

	_vehicle = _this select 0;
	_logVehicle = _vehicle;
	_item = _this select 1;
	_logItem = _item;
	_amount = _this select 2;
	_logAmount = _amount;

	if (not([_vehicle] call vehicle_exists)) exitWith {};

	if (isNil "_item") exitWith {};
	if (isNil "_amount") exitWith {};
	if (typeName _item != "STRING") exitWith {};
	if (typeName _amount != "SCALAR") exitWith {};

	if (_amount == 0) exitWith {};

	private["_class"];
	_class = typeOf _vehicle;

	private["_player", "_info", "_v_storage", "_p_storage"];
	_player = player;
	_info = _item call INV_GetItemArray;
	_v_storage = [_vehicle] call vehicle_storage_name;
	_p_storage = [_player] call player_inventory_name;

	private["_v_max_weight", "_v_cur_weight", "_own_weight", "_items_weight", "_p_cur_weight", "_p_max_weight", "_v_items_amount", "_p_items_amount" ];
	_v_max_weight = _class call INV_GetVehMaxKg;
	_v_cur_weight = [_vehicle, _v_storage] call INV_GetStorageWeight;
	_p_max_weight = INV_CarryingCapacity;
	_p_cur_weight = (call INV_GetOwnWeight);
	_items_weight = (_info call INV_GetItemTypeKg) * abs(_amount);

	_v_items_amount = ([_vehicle, _item, _v_storage] call INV_GetStorageAmount);
	_p_items_amount = ([_player, _item, _p_storage] call INV_GetStorageAmount);

	private["_valid"];
	_valid = false;
	if (_amount > 0) then {
		//adding items to the vehicle
		if (_amount > _p_items_amount) exitWith {
			player groupChat format["You do not have that many items in your inventory"];
		};

		if (_v_max_weight > 0 && (_items_weight + _v_cur_weight) > _v_max_weight) exitWith {
			player groupChat format["The total weight of the items exceed the vehicle's capacity"];
		};
		player groupChat format["You put %1 item(s) into the vehicle", strM(_amount)];
		_message = format["%1 deposited %2 of %3 into vehicle %4", name player, strM(abs(_logAmount)), _logItem, _logVehicle];
		[_message, "Trunk"] call mp_log;
		_valid = true;
	}
	else {
		//removing items from the vehicle
		if (abs(_amount) > _v_items_amount) exitWith {
			player groupChat format["The vehicle does not have that many items"];
		};

		if (_p_max_weight> 0 && (_items_weight + _p_cur_weight) > _p_max_weight) exitWith {
			player groupChat format["The total weight of the items exceed the your carrying capacity"];
		};

		player groupChat format["You took %1 item(s) out of the vehicle", strM(abs(_amount))];
		_message = format["%1 withdrew %2 of %3 from a %4", name player, strM(abs(_logAmount)), _logItem, _logVehicle];
		[_message, "Trunk"] call mp_log;
		_valid = true;
	};

	if (not(_valid)) exitWith{};

	[_vehicle, _item, (_amount), _v_storage] call INV_AddItemStorage;
	[_player, _item, -(_amount), _p_storage] call INV_AddItemStorage;

	closeDialog 0;
	call shop_play_animation;
};



interact_factory_storage = {
	private["_player", "_factory", "_item", "_amount"];

	_player = _this select 0;
	_factory = _this select 1;
	_item = _this select 2;
	_amount = _this select 3;

	if (not([_player] call player_exists)) exitWith {};

	if (isNil "_factory") exitWith {};
	if (isNil "_item") exitWith {};
	if (isNil "_amount") exitWith {};
	if (typeName _factory != "STRING") exitWith {};
	if (typeName _item != "STRING") exitWith {};
	if (typeName _amount != "SCALAR") exitWith {};

	if (_amount == 0) exitWith {};

	private["_item_kind"];
	_item_kind = _item call INV_GetItemKindOf;

	if (not(_item_kind in ["ressource", "drug", "money"]) && _amount > 0) exitWith {
		player groupChat format ["You can only store shekels, drugs, and resources in factories"];
	};

	private["_info", "_f_storage", "_p_storage"];
	_info = _item call INV_GetItemArray;
	_f_storage = _factory;
	_p_storage = [_player] call player_inventory_name;

	private["_f_max_weight", "_f_cur_weight", "_items_weight", "_p_cur_weight", "_p_max_weight", "_f_items_amount", "_p_items_amount"];
	_f_cur_weight = [_player, _f_storage] call INV_GetStorageWeight;
	_f_max_weight = -1; //factories ulimited
	_p_max_weight = INV_CarryingCapacity;
	_p_cur_weight = (call INV_GetOwnWeight);
	_items_weight = (_info call INV_GetItemTypeKg) * abs(_amount);

	_f_items_amount = ([_player, _item, _f_storage] call INV_GetStorageAmount);
	_p_items_amount = ([_player, _item, _p_storage] call INV_GetStorageAmount);

	private["_valid"];
	_valid = false;
	if (_amount > 0) then {
		//adding items to the factory

		if (_amount > _p_items_amount) exitWith {
			player groupChat format["You do not have that many items in your inventory"];
		};

		if (_f_max_weight > 0 && (_items_weight + _f_cur_weight) > _f_max_weight) exitWith {
			player groupChat format["The total weight of the items exceed the factory's capacity"];
		};
		_valid =  true;
	}
	else {
		//removing items from the factory
		if (abs(_amount) > _f_items_amount) exitWith {
			player groupChat format["The factory does not have that many item"];
		};

		if (_p_max_weight > 0 && (_items_weight + _p_cur_weight) > _p_max_weight) exitWith {
			player groupChat format["The total weight of the items exceed the your carrying capacity"];
		};
		_valid =  true;
	};

	if (not(_valid)) exitWith {};

	[_player, _item, _amount, _f_storage] call INV_AddItemStorage;
	[_player, _item, -(_amount), _p_storage] call INV_AddItemStorage;
	[_f_storage, (_player getVariable _f_storage)] call stats_client_save;

	closeDialog 0;
	call shop_play_animation;
};


interact_generic_storage = {
	private["_player", "_storage", "_item", "_amount"];

	_player = _this select 0;
	_storage = _this select 1;
	_item = _this select 2;
	_amount = _this select 3;

	if (not([_player] call player_exists)) exitWith {};

	if (isNil "_storage") exitWith {};
	if (isNil "_item") exitWith {};
	if (isNil "_amount") exitWith {};
	if (typeName _storage != "STRING") exitWith {};
	if (typeName _item != "STRING") exitWith {};
	if (typeName _amount != "SCALAR") exitWith {};

	if (_amount == 0) exitWith {};

	//player groupChat format["interact_generic_storage %1", _this];

	private["_item_kind"];
	_item_kind = _item call INV_GetItemKindOf;

	private["_info", "_g_storage", "_p_storage"];
	_info = _item call INV_GetItemArray;
	_g_storage = _storage;
	_p_storage = [_player] call player_inventory_name;

	private["_g_max_weight", "_g_cur_weight", "_items_weight", "_p_cur_weight", "_p_max_weight", "_g_items_amount", "_p_items_amount"];
	_g_cur_weight = [_player, _g_storage] call INV_GetStorageWeight;
	_g_max_weight = -1; //factories ulimited weight
	_p_max_weight = INV_CarryingCapacity;
	_p_cur_weight = (call INV_GetOwnWeight);
	_items_weight = (_info call INV_GetItemTypeKg) * abs(_amount);

	_g_items_amount = ([_player, _item, _g_storage] call INV_GetStorageAmount);
	_p_items_amount = ([_player, _item, _p_storage] call INV_GetStorageAmount);

	private["_valid"];
	_valid = false;
	if (_amount > 0) then {
		//adding items to the storage
		if (_amount > _p_items_amount) exitWith {
			player groupChat format["You do not have that many items in your inventory"];
		};

		if (_g_max_weight > 0 && ((_items_weight + _g_cur_weight) > _g_max_weight)) exitWith {
			player groupChat format["The total weight of the items exceed the storage's capacity"];
		};

		_valid = true;
	}
	else {
		//removing items from the storage
		if (abs(_amount) > _g_items_amount) exitWith {
			player groupChat format["The storage does not have that many item(s)"];
		};

		if (_p_max_weight > 0 && (_items_weight + _p_cur_weight) > _p_max_weight) exitWith {
			player groupChat format["The total weight of the items exceed the your carrying capacity"];
		};
		_valid = true;
	};

	if (not(_valid)) exitWith {};
	[_player, _item, (_amount), _g_storage] call INV_AddItemStorage;
	[_player, _item, -(_amount), _p_storage] call INV_AddItemStorage;
	[_g_storage, (_player getVariable _g_storage)] call stats_client_save;
	closeDialog 0;
	call shop_play_animation;
};


interaction_functions_defined = true;
