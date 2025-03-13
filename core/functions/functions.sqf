#include "macro.h"
_active = false;
bankloopnew = {
	[] spawn {  
		bank_loop = true;   
		while {bank_loop} do {  
			bank_gold_bars = bank_gold_bars + 1;   
			publicVariable "bank_gold_bars";   
			if (bank_gold_bars == 20) then {   
				bank_gold_bars = 20;  
				publicVariable "bank_gold_bars"; 
			 };  
			 Uisleep 360; 
		 }; 
	 }; 
};

kick_player = {
	private ["_player","_message"];
	_player = _this select 0;
	_message = _this select 1;
	
	if (isNil "_player" or isNil "_message") exitWith {};
	if (_player == player) then {
		
		player groupChat format ["%1",_message];
		uiSleep 5;
		failMission "END1";
	};
};

player_add_license = {
	_number = _this select 0;
	_number = parseNumber _number;

	_license = ((INV_Licenses select _number) select 0);
	_name    = ((INV_Licenses select _number) select 2);
	_cost    = ((INV_Licenses select _number) select 3);

	if (_license call INV_HasLicense) exitWith {player groupChat "You already have that license."};
	if (([player, "money"] call INV_GetItemAmount) < _cost) exitWith {player groupChat localize "STRS_inv_buylicense_nomoney";};
	[player, "money", -_cost] call INV_AddInventoryItem;
	player groupChat format ["You bought a %1 for $%2",_name, _cost];
	INV_LicenseOwner = INV_LicenseOwner + [_license];
	["licenses"] call RG_fnc_iSave;
	["inventory"] call RG_fnc_iSave;

};

open_href_test_dialog = {
	
	
	_rules ctrlSetStructuredText parseText format["
	</t><br/><br/><a underline='true' size='0.8' color='#3333FF' href='http://www.rise-gaming.com/takistan-life-rules/'>Click Here</a0></t>"];
};
update_gang_menu_display = {

	private ["_selection","_gang","_members","_leader","_wars"];
	_selection = _this select 1;
	
	lbclear 1501;
	lbclear 1502;
	
	_gang = gangsarray select _selection;
	_members = _gang select 2;
	_leader = (_gang select 1) select 0;
	_wars = _gang select 4;
	
	if (isNil "_gang") exitWith {};
	if (isNil "_leader") exitWith {};
	if (isNil "_wars") exitWith {};
	if (isNil "_wars") exitWith {};
	
	{
		if (_x == _leader) then {
			_index = lbAdd [1501, format ["%1 - Leader",_x]];
		} else {
			_index = lbAdd [1501, format ["%1",_x]];
		};
	} foreach _members;
	
	if (count _wars == 0) then {
		_index = lbAdd [1502, format ["Not At War"]];
	} else {
		{
			_index = lbAdd [1502, format ["%1",_x]];
		} foreach _wars;
	};
};
check_wartime_spawns = {
	if !(playerSide == east) exitWith {};
	
	_count = 0;
	
	{
		_unit = _x;
		if (typeName _unit == "STRING") then {_unit = call compile _unit};
		if ([_unit] call player_cop) then {
			if (_unit distance (getmarkerpos "opf_base_spawn") <= 2000) then {
				_count = _count + 1;
			};
		};
	} foreach playableUnits;
	if (_count > 0) exitWith {false};
	true
};

mosque_remove = {

	mosque = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject "Land_A_Mosque_big_hq_EP1");
	mosque1 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 58479);
	mosque2 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 58480);
	mosque3 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 59178);
	mosque4 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 59182);
	mosque5 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 59179);
	mosque6 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 59185);
	mosque7 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 59184);
	mosque8 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 59183);
	mosque9 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 59180);
	mosque10 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 59181);
	mosque11 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 58526);
	mosque12 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 58512);
	mosque13 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 58512);
	mosque14 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 58527);
	mosque15 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 58514);
	mosque16 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 58513);
	mosque17 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 59186);
	mosque18 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 59187);
	mosque19 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 58499);
	mosque20 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 58511);
	mosque21 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 58503);
	tree1 = (getMarkerpos "civ_spawnpoint_northcivspawn" nearestobject 59576);
	
	mosque attachto [mosqueattach, [0,0,0]]; 
	mosque1 attachto [mosqueattach, [0,0,0]]; 
	mosque2 attachto [mosqueattach, [0,0,0]]; 
	mosque3 attachto [mosqueattach, [0,0,0]]; 
	mosque4 attachto [mosqueattach, [0,0,0]]; 
	mosque5 attachto [mosqueattach, [0,0,0]]; 
	mosque6 attachto [mosqueattach, [0,0,0]]; 
	mosque7 attachto [mosqueattach, [0,0,0]]; 
	mosque8 attachto [mosqueattach, [0,0,0]]; 
	mosque9 attachto [mosqueattach, [0,0,0]]; 
	mosque10 attachto [mosqueattach, [0,0,0]]; 
	mosque11 attachto [mosqueattach, [0,0,0]]; 
	mosque12 attachto [mosqueattach, [0,0,0]]; 
	mosque13 attachto [mosqueattach, [0,0,0]]; 
	mosque14 attachto [mosqueattach, [0,0,0]]; 
	mosque15 attachto [mosqueattach, [0,0,0]]; 
	mosque16 attachto [mosqueattach, [0,0,0]]; 
	mosque17 attachto [mosqueattach, [0,0,0]]; 
	mosque18 attachto [mosqueattach, [0,0,0]]; 
	mosque19 attachto [mosqueattach, [0,0,0]]; 
	mosque20 attachto [mosqueattach, [0,0,0]];  
	mosque21 attachto [mosqueattach, [0,0,0]];  
	mosqueattach setPos [getPos mosqueattach select 0, getPos mosqueattach select 1, -500];

};

mosque_add = {
	detach mosque;
	detach mosque1;
	detach mosque2;
	detach mosque3;
	detach mosque4;
	detach mosque5;
	detach mosque6;
	detach mosque7;
	detach mosque8;
	detach mosque9;
	detach mosque10;
	detach mosque11;
	detach mosque12;
	detach mosque13;
	detach mosque14;
	detach mosque15;
	detach mosque16;
	detach mosque17;
	detach mosque18;
	detach mosque19;
	detach mosque20;
	detach mosque21;
};

get_item_image = {
	_item = _this select 0;
	_image = "resources\images\case.paa";
	
	switch (_item) do {
		case "defuser": {_image = "resources\images\defuser.paa"};
		case "bodyarmor_100": {_image = "resources\images\armor.paa"};
		case "bodyarmor_20": {_image = "resources\images\armor.paa"};
		case "bodyarmor_20_ill": {_image = "resources\images\armor.paa"};
		case "bodyarmor_50": {_image = "resources\images\armor.paa"};
		case "money": {_image = "resources\images\shekels.paa"};
		
		case "handy": {_image = "resources\images\phone.paa"};
		case "handy_vip": {_image = "resources\images\phone.paa"};
		
		case "Legal_Steroids": {_image = "resources\images\steroids.paa"};
		case "illegal_steroids": {_image = "resources\images\steroids.paa"};
		
		case "keychain": {_image = "resources\images\keychain.paa"};
		case "spikestrip": {_image = "resources\images\spikes.paa"};
		
		case "medkit": {_image = "resources\images\medkit.paa"};
		case "medkit_ill": {_image = "resources\images\medkit.paa"};
		case "medkit_vip": {_image = "resources\images\medkit.paa"};
		case "medkit_don": {_image = "resources\images\medkit.paa"};
		case "esumedkit": {_image = "resources\images\medkit.paa"};
		
		case "lockpick": {_image = "resources\images\lockpick.paa"};
		case "lockpick_ill": {_image = "resources\images\lockpick.paa"};
		case "lockpick_don": {_image = "resources\images\lockpick.paa"};
		case "lockpick_vip": {_image = "resources\images\lockpick.paa"};
		case "lockpick_civshop": {_image = "resources\images\lockpick.paa"};
		
		case "ziptie": {_image = "resources\images\ziptie.paa"};
		case "ziptie_don": {_image = "resources\images\ziptie.paa"};
		case "ziptie_hit": {_image = "resources\images\ziptie.paa"};
		case "ziptie_ill": {_image = "resources\images\ziptie.paa"};
		
		case "earplugs": {_image = "resources\images\earplugs.paa"};
		case "gasmask": {_image = "resources\images\gasmask.paa"};
		case "gasmask_ill": {_image = "resources\images\gasmask.paa"};
		case "gasmask_on": {_image = "resources\images\gasmask.paa"};
		
		case "repairkit": {_image = "resources\images\repairkit.paa"};
		case "repairkit_ill": {_image = "resources\images\repairkit.paa"};
		case "repairkit_vip": {_image = "resources\images\repairkit.paa"};
		case "repairkit_don": {_image = "resources\images\repairkit.paa"};
		case "esurepairkit": {_image = "resources\images\repairkit.paa"};
		
		case "kanister": {_image = "resources\images\jerrycan.paa"};
		case "kanister_ill": {_image = "resources\images\jerrycan.paa"};
		case "kanister_vip": {_image = "resources\images\jerrycan.paa"};
		case "kanister_don": {_image = "resources\images\jerrycan.paa"};
		
		case "nitro": 	  {_image = "resources\images\upgrade.paa"};
		case "nitro_don": {_image = "resources\images\upgrade.paa"};
		case "nitro_vip": {_image = "resources\images\upgrade.paa"};
		case "nitro_ill": {_image = "resources\images\upgrade.paa"};
		case "supgrade1": {_image = "resources\images\upgrade.paa"};
		case "supgrade1_ill": {_image = "resources\images\upgrade.paa"};
		case "supgrade1_don": {_image = "resources\images\upgrade.paa"};
		case "supgrade1_vip": {_image = "resources\images\upgrade.paa"};
		case "supgrade2": {_image = "resources\images\upgrade.paa"};
		case "supgrade2_ill": {_image = "resources\images\upgrade.paa"};
		case "supgrade2_don": {_image = "resources\images\upgrade.paa"};
		case "supgrade2_vip": {_image = "resources\images\upgrade.paa"};
		case "supgrade3": {_image = "resources\images\upgrade.paa"};
		case "supgrade3_ill": {_image = "resources\images\upgrade.paa"};
		case "supgrade3_don": {_image = "resources\images\upgrade.paa"};
		case "supgrade3_vip": {_image = "resources\images\upgrade.paa"};
		case "supgrade4": {_image = "resources\images\upgrade.paa"};
		case "supgrade4_ill": {_image = "resources\images\upgrade.paa"};
		case "supgrade4_don": {_image = "resources\images\upgrade.paa"};
		case "supgrade4_vip": {_image = "resources\images\upgrade.paa"};
		case "supgrade5": {_image = "resources\images\upgrade.paa"};
		case "supgrade5_ill": {_image = "resources\images\upgrade.paa"};
		case "supgrade5_don": {_image = "resources\images\upgrade.paa"};
		case "supgrade5_vip": {_image = "resources\images\upgrade.paa"};
		
		default {};
	
	};
	_image
};
hud_notification = {
	disableSerialization;
	_text = _this select 0;
	if (isNil "_text") exitWith {};
	//if (isNil "taki_notifications") then {taki_notifications = []; notification_displayed = false};
	//taki_notifications = taki_notifications + [_text];
	
	//if (notification_displayed) exitWith {};
//	notification_displayed = true;
	1001 cutRsc ["hud_notification","PLAIN DOWN",10];
	_display = uiNameSpace getVariable "hud_notification";	
	_dsptext = _display displayCtrl 1000;
	_text = format ["<t align='center' color='#ffffff' font='Zeppelin32' size='1.3'>%1</t>",_text];
	_dsptext ctrlSetStructuredText parseText _text;
	
	uiSleep 10;
	//taki_notifications = taki_notifications - [_text];
	1001 cutText ["","PLAIN DOWN",1];
	//notification_displayed = false;
	
	//if (count taki_notifications >= 1) then {
		//[taki_notifications select 0] spawn hud_notification;
	//};
};
declare_martial_law = {
	if !(isStaff or police_colonel) exitWith {player groupChat "You are not a Colonel!"};
	_message = format ["Martial Law has been declared in the North. Citizens are advised to stay indoors as there may be combat."];
	[[], "mp_global_chat_message", [_message]] call mp_aware_me;
	martiallaw = true;
	publicVariable "martiallaw";
};

end_martial_law = {
	if !(isStaff or police_colonel) exitWith {player groupChat "You are not a Colonel!"};
	martiallaw = false;
	_message = format ["Martial Law in the North has been ended."];
	[[], "mp_global_chat_message", [_message]] call mp_aware_me;
	publicVariable "martiallaw";
};

declare_joint_ops = {
	if !(isStaff or ischief or isCommander) exitWith {player groupChat "You are not the chief or commander!"};
	if (jointops) exitWith {
		[] call end_joint_ops;
	};
		if (!(jointops) and !(commanderaccepted) and (chiefaccepted) and (isCommander)) then {
			[[], "mp_global_chat_message", ["The opfor commander has accepted joint ops."]] call mp_aware_me;
			commanderaccepted = true;
			publicVariable "commanderaccepted";
		};
		if (!(jointops) and (commanderaccepted) and !(chiefaccepted) and (ischief)) then {
			[[], "mp_global_chat_message", ["The police chief has accepted joint ops."]] call mp_aware_me;
			chiefaccepted = true;
			publicVariable "chiefaccepted";
		};
		
		if (!(jointops) and !(commanderaccepted) and !(chiefaccepted) and (ischief)) exitWith {
			[[], "mp_global_chat_message", ["The police chief has requested joint ops."]] call mp_aware_me;
			chiefaccepted = true;
			publicVariable "chiefaccepted";
		};
		if (!(jointops) and !(commanderaccepted) and !(chiefaccepted) and (isCommander)) exitWith {
			[[], "mp_global_chat_message", ["The opfor commander has requested joint ops."]] call mp_aware_me;
			commanderaccepted = true;
			publicVariable "commanderaccepted";
		};
		
		if (!(commanderaccepted) and (chiefaccepted)) exitWith {player groupchat "The Opfor commander has not accepted joint ops."};
		if ((commanderaccepted) and !(chiefaccepted)) exitWith {player groupchat "The Police chief has not accepted joint ops."};
		if (!(commanderaccepted) and !(chiefaccepted)) exitWith {player groupchat "Both leaders have not accepted/requested joint ops."};
		
		if (chiefaccepted and commanderaccepted) then {
			_message = format ["Joint Ops has been declared."];
			[[], "mp_global_chat_message", [_message]] call mp_aware_me;
			jointops = true;
			publicVariable "jointops";
			hud_jointopsstatus = "In Joint Ops";
			publicVariable "hud_jointopsstatus";
		};
};

end_joint_ops = {
		if !(isStaff or ischief or isCommander) exitWith {player groupChat "You are not the chief or commander!"};
		_person = "If this is showing then it does not work";
		if !(jointops) exitWith {player groupchat "There are no joint ops in place!";};
		if (isStaff) then {_person = "A Staff Member"};
		if (ischief) then {_person = "The Police chief"};
		if (isCommander) then {_person = "The Opfor commander"};
		jointops = false;
		chiefaccepted = false;
		commanderaccepted = false;
		publicVariable "commanderaccepted";
		publicVariable "chiefaccepted";
		_message = format ["Joint Ops has been ended by %1.", _person];
		[[], "mp_global_chat_message", [_message]] call mp_aware_me;
		publicVariable "jointops";
		hud_jointopsstatus = "Not Joint Ops";
		publicVariable "hud_jointopsstatus";
	};

goto_airbase = {
	player setpos getMarkerPos "airbasetp";
};

war_declare = {
	if !(isCommander) exitWith {player groupChat "You are not the Opfor Commander!"};
	
	_message = format ["The Opfor commander has declared war on the Blufor!!."];
	[[], "mp_global_chat_message", [_message]] call mp_aware_me;
	warfare = true;
	publicVariable "warfare";
	
};

war_end = {
	if !(isCommander) exitWith {player groupChat "You are not the Opfor Commander!"};
	
	_message = format ["The Opfor commander has ended the war."];
	[[], "mp_global_chat_message", [_message]] call mp_aware_me;
	warfare = false;
	publicVariable "warfare";
	
};



gate_control = {
	if (vehicle player == player) exitWith { false };
	if !(iscop or isopf) exitWith { false };
	_gate = (nearestobjects [getpos player, ["ZavoraAnim"],  20] select 0);
	
	if (isNil "_gate") exitWith { false };

	_cars = nearestObjects [_gate, ["Car"], 4];
	if (count _cars > 0) exitWith {player groupChat  "Your or another players vehicle is too close to the bargate to operate it safely. Please move 4 meters away from the gate"};

	if (_gate animationPhase "bargate" == 0) then {
		_gate animate ["bargate",1];
	} else {
		_gate animate ["bargate",0]; 
	};
	true

};
player_putincar = {
	private ["_nearplayers","_vcl","_player"];
	_nearplayers = (position player) nearObjects ["Man",7];
	_vcl = (nearestobjects [position player,["Air", "Ship","LandVehicle"], 7] select 0);
	_player = player;
	putincar_tgt = nil;
	if ([player] call check_safezone) exitWith {};
	{

		if (_x distance _vcl < 7) then{

			_state = animationstate _x;

			_bool = _state in player_vulnerable_states;

			if !((animationstate _x) in player_vulnerable_states) exitWith {};

			if(!isPlayer _x) exitWith {};

			putincar_tgt = _x;

			player groupChat format ["%1",_x];


		};
	}
	foreach _nearplayers;
	if (isNull putincar_tgt) exitWith {player groupChat "No target found"};
	if (putincar_tgt == player) exitWith {};
	if (putincar_tgt distance _vcl > 7) exitWith {player groupChat "Target is to far from the vehicle"};
	uiSleep 3;
	(format ["%1 moveInCargo %2", putincar_tgt, _vcl]) call broadcast;
	detach putincar_tgt;
	putincar_tgt setVariable["Escorting",false,true];
	format['%1 groupChat "You have been placed in a vehicle. You are to assume your hands are tied and communication has been cut off. You may not switch out of any seat or eject. Doing so will result in a ban.";',putincar_tgt] call broadcast;
	_vcl lock true;
	putincar_tgt = nil;
};

handcuff_sound = {
	private ["_unit"];
	_unit = _this select 0;
	format["
	_unit = %1;
	_distance = player distance _unit;
	if ( _distance <= 30 ) then
	{
		[_unit, player] say3D ""handcuffs"";
	};
	", _unit] call broadcast;
};


spawn_point_config = {
	
	spawn_points = [];
	if (isNil "isdon") then {isdon = false};
	if (isNil "isvip") then {isvip = false};
	if (isNil "srt") then {srt = false};
	if (isNil "vice") then {vice = false};
	if (isNil "osf") then {osf = false};
	if (isNil "pmc") then {pmc = false};
	
	if (isciv) then {
		spawn_points = [
			["civ_spawnpoint_northcivspawn","North Civ Spawn"],
			["civ_spawnpoint_southcivspawn","South Civ Spawn"]
		];
		if (isdon) then {
			spawn_points = spawn_points + [["civ_donator_area_1","Civilian Donator"]];
		};
		if (isvip) then {
			spawn_points = spawn_points + [["vip_donator_area","Northern VIP"]];
			spawn_points = spawn_points + [["vip_donator_area_1","Southern VIP"]];
		};
		if (pmc) then {
			spawn_points = spawn_points + [["respawn_pmc","PMC Base"]];
		};
	};	
	
	if (isesu) then {
		spawn_points = [
			["spawn_esu","North Hospital"],
			["spawn_esu2","South Hospital"]
		];
	};	
	
	if (isopf) then {
		spawn_points = [
			["opf_base_spawn","Opfor Base"]
		];
		
		if ([] call check_wartime_spawns) then {
			spawn_points = spawn_points + [["opf_spawnpoint_fob","Opfor FOB"]];
		};
		if (isvip) then {
			spawn_points = spawn_points + [["vip_donator_area_1","Southern VIP"]];
		};	
		if (osf) then {
			spawn_points = spawn_points + [["osf_base","OSF Base (Not Finished, Baker See Sp3)"]];
		};
	};	
	
	if (isins) then {
		spawn_points = [
			["ind_base_spawn","Insurgent Base"],
			["ind_spawnpoint_fob","Insurgent FOB"]
		];
		if (isvip) then {
			spawn_points = spawn_points + [["vip_donator_area_1","Southern VIP"]];
		};
	};
	
	if (iscop) then {
	
		spawn_points = [
			["cop_base_spawn","Police HQ"],
			["airbasetp","Police Airbase"]

		];
		if (isdon) then {
			spawn_points = spawn_points + [["cop_donator_area","Blufor Donator"]];
		};
		if (isvip) then {
			spawn_points = spawn_points + [["vip_donator_area","Northern VIP"]];
		};
		if (srt) then {
			spawn_points = spawn_points + [["srt_base","SRT Base"]];
		};
	};
};
[] call spawn_point_config;

display_keypress = {
	private["_control","_code","_shift","_ctrlKey","_alt","_handled"];
	_handled = false;
	_control = _this select 0;
	_code = _this select 1;
	_shift = _this select 2;
	_ctrlKey = _this select 3;
	_alt = _this select 4;
	_disallowed = [
		1,
		2,
		3,
		4,
		5,
		6,
		41
	];
	//Esc Key Handler
	if(_code in _disallowed) then {_handled = true;};
	_handled;
};
check_player_slots = {
	_slot = vehicleVarName player;
	if((_slot in adminslots) && not(isStaff)) then {   player groupChat "You are not in the whitelist for this slot."; uiSleep 8; failMission "END1";};
	if((_slot in srtslots) && !(srt)) then {   player groupChat "You are not in the whitelist for this slot."; uiSleep 8; failMission "END1";};
	if((_slot in osfslots) && !(osf)) then {   player groupChat "You are not in the whitelist for this slot."; uiSleep 8; failMission "END1";};
	if((_slot in pmcslots) && !(pmc)) then {   player groupChat "You are not in the whitelist for this slot."; uiSleep 8; failMission "END1";};
};
open_spawn_menu = {
	closedialog 0;	
	_return = false;
	
	if ([] call player_prison_persistence) exitWith {};
	if ([player] call player_get_arrest) exitWith {player groupChat format ["The spawn menu may not be used while in jail"];};
	
	titleText ["","BLACK OUT"];
	uiSleep 2;
	if (!(createDialog "spawn_dialog")) exitWith {hint "Dailog Error, Relog!"};
	[] call check_player_slots;
	(findDisplay 1600) displaySetEventHandler ["keyDown","_this call display_keypress"];
	if (iscop) then {
		[] spawn cop_refresh_allowed_weapons;
	};
	[] call spawn_point_config;
	{
		_name = _x select 1;		
		_location = _x select 0;		
		_index = lbAdd [1607, format ["%1", _name]];
		lbSetData [1607, _index,_location];
	} foreach spawn_points;
	player_dead = false;
	spawned = true;
	lbSetCurSel [1607,0];
};

vehicle_search = {
	_vcl = (getpos player nearEntities [["Air", "Ship", "LandVehicle"],5] select 0); 
	if (isNil "_vcl") exitWIth {}; 
	disableSerialization;
	
	_str = ([_vcl] call vehicle_storage_name);
	if([_vcl,_str] call INV_RemoveIllegalStorage)then
		{call compile format["publicvariable ""%1"";", _str]
	};
	
	_content = _vcl getVariable "storage_content";
	_weapons = _content select 0;
	_magazines = _content select 1;
	closedialog 0;
	createDialog "vehicle_info";
	_trennlinie = "=======================================================================";
	_trunk = call compile _str;

	_DFML = findDisplay 2000;
	lbClear (_DFML displayCtrl 2001);
	
	/*
	(_DFML displayCtrl 2001)	lbAdd _trennlinie;
	(_DFML displayCtrl 2001)	lbAdd "T R U N K";
	(_DFML displayCtrl 2001)	lbAdd _trennlinie;
	
	for "_i" from 0 to (count _trunk - 1) do {
		_item        = (_trunk select _i) select 0;
		_amount      = [(_trunk select _i) select 1] call decode_number;
		_name = _item call INV_GetItemName;
	(_DFML displayCtrl 2001)	lbAdd format ["%1 x%2",_item,_amount];
	};
	*/
	(_DFML displayCtrl 2001)	lbAdd _trennlinie;
	(_DFML displayCtrl 2001)	lbAdd "I N V E N T O R Y";
	(_DFML displayCtrl 2001)	lbAdd _trennlinie;
	
	_count = (count (_weapons select 0)) -1;
	for "_i" from 0 to _count do {
		_type = (_weapons select 0) select _i;
		_number = (_weapons select 1) select _i;
		_type = _type call INV_GetItemName;
		(_DFML displayCtrl 2001)	lbAdd format ["%1 x%2",_type,_number];
	};	
		
	_count = (count (_magazines select 0)) -1;
	for "_i" from 0 to _count do {
		_type = (_magazines select 0) select _i;
		_number = (_magazines select 1) select _i;
		_type = _type call INV_GetScriptFromClass_Mag;
		_type = (_type call INV_GetItemName);
		(_DFML displayCtrl 2001)	lbAdd format ["%1 x%2",_type,_number];
	};
};
spawn_select = {

	_location = _this select 0;
	_location = getMarkerPos _location;
	
	closeDialog 0;
	if ((_location select 0 == 0) and (_location select 1 == 0) and (_location select 2 == 0)) then {_location = getMarkerPos "default_spawn"};
	
	_message = format ["You are spawning in"];
	player setpos _location;
	uiSleep 2;
	titleText ["","BLACK IN"]; 
	cutText ["", "BLACK IN"]; 
	titleFadeOut 4;
	player_dead = false;
	[player] call name_tags_3d_controls_setup;

};

set_minimap_pos = {
	disableSerialization;
	_i = _this select 0;
	
	_location = (spawn_points select _i) select 0;
	_location = getMarkerPos _location;
	
	_dialog = findDisplay 1600;
	_map = _dialog displayCtrl 1601;
	
	ctrlMapAnimClear _map;
	_map ctrlMapAnimAdd [0.3, 0.1, _location];
	ctrlMapAnimCommit _map;	
};


check_safezone = {
	private ["_unit","_return"];
	_unit = _this select 0;
		_return = _unit getVariable "insafezone";
	_return
};
jail_break_function = {

	jail_breaking = true;
	private ["_wall","_wall_pos","_message","_i"];
	if !([player,"shape_charge"] call INV_GetItemAmount >= 1) exitWith {player groupChat format ["You need a shape charge for this. Get them at the blackmarket"];};
	if ([player] call player_get_arrest) exitWith {
		player groupChat format["You cant do this in jail"];
	};
	if (not([player] call check_armed_player)) exitwith {
		player groupchat "You need a gun to do this.";
	};
	
	_wall = (nearestObjects [player,["Concrete_wall_EP1"],5]) select 0;
	if (isNil "_wall") exitWith {player groupChat format ["No suitable entry point found. Try being within 5 meters of a 'Concrete Wall.'"]};
	_wall_pos = getposasl _wall;
	
	_message = "Prison cameras have spotted a man placing charges at the north takistan detention center";
	[[], "mp_server_message", [_message]] call mp_aware_me;
	[player, "(Prison Breaking)",100000] call player_update_warrants;

	[[], "mp_anim_sync", [player,"switchmove","AinvPknlMstpSlayWrflDnon_medic"]] call mp_aware_me;
	uiSleep 5;
	[player, "shape_charge", -1] call INV_AddInventoryItem;
	
	_i = 60;
	while {_i >= 0} do {
		player groupChat format ["Detonation in %1 seconds. Stand back!",_i];
		_i = _i - 1;
		uiSleep 1;
	};
	"grenade" createVehicle (getPos _wall);
	"grenade" createVehicle (getPos _wall);

	_wall setposasl [getposasl _wall select 0, getposasl _wall select 1, -500];
	uiSleep 60;
	_wall setposasl _wall_pos;
	jail_breaking = false;
};
auto_carmagedon = {
	["The server has initiated a global carmagedon, you have 5 minutes to occupy your vehicle or it will be removed! Everyone is reminded you may scroll wheel on your vehicle to prevent it from being deleted!"] call server_message;
	_time = 300;
	_distance = 30000;
	while {true} do {
		_time = _time - 1;
		if (_time == 240) then {["AUTO CARMAGEDON: You have 4 minute(s) to occupy your vehicle or it will be removed!"] call server_message;};
		if (_time == 180) then {["AUTO CARMAGEDON: You have 3 minute(s) to occupy your vehicle or it will be removed!"] call server_message;};
		if (_time == 120) then {["AUTO CARMAGEDON: You have 2 minute(s) to occupy your vehicle or it will be removed!"] call server_message;};
		if (_time == 60) then {["AUTO CARMAGEDON: You have 1 minute(s) to occupy your vehicle or it will be removed!"] call server_message;};
		if (_time == 30) then {["AUTO CARMAGEDON: You have 30 second(s) to occupy your vehicle or it will be removed!"] call server_message;};
		if (_time == 15) then {["AUTO CARMAGEDON: You have 15 second(s) to occupy your vehicle or it will be removed!"] call server_message};
		if (_time == 0) then {
								{
									{
										if ({alive _x} count crew _x == 0) then {
											_var = _x getVariable "car_save";
											if (_var) exitWith {};
											deletevehicle _x;
										};
									} foreach((getmarkerpos "civ_spawnpoint_northcivspawn") nearObjects [_x, _distance]);
								} forEach (droppableitems + ["LandVehicle", "Air", "Car", "Motorcycle", "Bicycle", "UAV", "Wreck", "Wreck_Base", "HelicopterWreck", "UH1Wreck", "UH1_Base", "UH1H_base", "AH6_Base_EP1","CraterLong", "Ka60_Base_PMC", "Ka137_Base_PMC", "A10"]);
			["Auto Carmagedon has concluded! It is safe to leave your vehicles!"] call server_message;
			};
		uiSleep 1;
		};
};
player_drag = {
		private["_unit"];
		_unit = _this select 0;
		if ([player] call player_get_arrest) exitWith {player groupChat format ["Stop trying to abuse glitches you fucker."]};
		if ([_unit] call player_get_arrest) exitWith {player groupChat format ["Stop trying to abuse glitches you fucker."]};
		if ([player] call player_get_mp_arrest) exitWith {player groupChat format ["Stop trying to abuse glitches you fucker."]};
		if ([_unit] call player_get_mp_arrest) exitWith {player groupChat format ["Stop trying to abuse glitches you fucker."]};
		if(_unit getVariable "Escorting") exitWith {[_unit] call player_release};
		_exit = false;
		if (isciv or isins) then {
			if !([player] call check_armed_player) exitWith {player groupChat "You must be armed to do this."; _exit = true;};
			if !((animationstate _unit) in player_vulnerable_states) exitWith {player groupChat "This person is not restrained or is not vulnerable."; _exit = true;};
		};
		if (_exit) exitwith {};
		if ([_unit] call check_safezone) exitwith {};
		if (insafezone) exitwith {};
		if(isNull _unit) exitWith {player groupChat "null unit"}; //Not valid
		if(!(_unit isKindOf "Man")) exitWith {player groupChat "unit not of type man"}; //Not a 'Man'
		if(!isPlayer _unit) exitWith {player groupChat "unit not a player"}; //Not a human player
		_unit attachTo [player, [0,0.8,0]];
		_unit setVariable["transporting",false,true];
		transporting = true;
		_unit setVariable["Escorting",true,true];
};
player_release = {
	private["_unit"];
	_unit = _this select 0;
	if(isNull _unit) exitWith {player groupChat "Null Unit"}; //Not valid
	if(!(_unit getVariable "Escorting")) exitWith {player groupChat "Unit is not currently being escorted"}; //He's not being Escorted.
	if(isNull _unit) exitWith {player groupChat "null unit"}; //Not valid
	detach _unit;
	_unit setVariable["Escorting",false,true];
	transporting = false;
};

abort_timer = {
	if (true) exitWith {};
	if (isstaff) exitWith {};
	disableserialization;
	waitUntil {!(isnull finddisplay 49)};
	_time = 10;
	while {!isnull (finddisplay 49)} do
	{
		if (_time == 0) exitWith {
			_ctrl = ((findDisplay 49) displayctrl 104);
			_ctrl ctrlsettext "Abort";
			_ctrl ctrlenable true;
		};
		_ctrl = ((findDisplay 49) displayctrl 104);
		_ctrl ctrlenable false;
		_ctrl ctrlsettext format ["Abort in %1 seconds",_time];
		_time = _time - 1;
		uiSleep 1;
	};
};

disable_abort_while_dead =
{
	if (player_dead) exitwith {};
	player_dead = true;

	disableserialization;
	while {player_dead} do
	{
		if !(isnull (finddisplay 49)) then
		{
			_ctrl = ((findDisplay 49) displayctrl 104);
			_ctrl ctrlenable false;
			_ctrl ctrlsettext "Respawning...";
		};
		uiSleep 0.1;
	};

	if !(isnull (finddisplay 49)) then
	{
		_ctrl = ((findDisplay 49) displayctrl 104);
		_ctrl ctrlsettext "Abort";
		_ctrl ctrlenable true;
	};

	_active = false;
};

_active = false;
player_dead = false;

remove_spikestrip = {
	private ["_strip"];
	_strip = _this select 0;
	deletevehicle _strip;
};
pmc_notification = {
	if !(pmc) exitWith {player groupchat "YOU ARE NOT PMC."};
	_name = (name vehicle player);
	[[], "mp_global_chat_message", [Format["%1 has become PMC.", _name]]] call mp_aware_me;
	ispmc = true;

};
animations_dialog_open = {
	if (!(createDialog "animationsdialog")) exitWith
		{
			hint "Dialog Error!";
		};

		{
			_index = lbAdd [1, (_x select 3)];
			lbSetData [1, _index, (_x select 1)];
		} forEach ANIM_AllAnimationArray;

		buttonSetAction [2, "[lbCurSel 1, (lbData [1, (lbCurSel 1)])] execVM ""animplay.sqf""; closedialog 0;"];
};
impound_retrieve = {
	if (!(createDialog "distribute")) exitWith {hint "Dialog Error!"};
	disableSerialization;
	_mode = _this select 0;
	if (isNil "_mode") then {_mode = "NONE"};
	_DFML = findDisplay -1;
	lbClear 1;
	lbClear (_DFML displayCtrl 1);
	ctrlSetText [3, format["RISE PD Impound Lot"]];
	if (_mode == "Air") then {
		private["_vehicles"];
		_vehicles = [player] call vehicle_list;
		for "_i" from 0 to ((count _vehicles) - 1) do {
			_vehicle = (_vehicles select _i);
			if (!isNull _vehicle and _vehicle distance impoundarea1 < 300 and _vehicle isKindOf "Air" ) then {
				_index = (_DFML displayCtrl 1)	lbAdd format["%1 (%2)", _vehicle, typeof _vehicle];
				(_DFML displayCtrl 1)	lbSetData [_index, format["%1", _vehicle]];
			};
		};
	} else {
		private["_vehicles"];
		_vehicles = [player] call vehicle_list;
		for "_i" from 0 to ((count _vehicles) - 1) do {
			_vehicle = (_vehicles select _i);
			if (!isNull _vehicle and _vehicle distance impoundarea1 < 200 and _vehicle isKindOf "LandVehicle") then {
				_index = (_DFML displayCtrl 1)	lbAdd format["%1 (%2)", _vehicle, typeof _vehicle];
				(_DFML displayCtrl 1)	lbSetData [_index, format["%1", _vehicle]];
			};
		};
	};


	buttonSetAction [2, "[lbData [1, (lbCurSel 1)],""buy""] call A_SCRIPT_IMPOUND;"];
};

vehicle_faction_check = {
	_player = _this select 0;
	_vehicle = _this select 1;
	if (isNil "_player") exitWith {true};
	if (isNil "_vehicle") exitWith {true};

	_unit =  driver _vehicle;
	_unitSide = side _unit;
	_playerSide = side _player;
	if ((_unitSide == west) and !(_playerSide == west)) exitWith {false};
	if ((_unitSide == east) and !(_playerSide == east)) exitWith {false};
	if ((_unitSide == resistance) and !(_playerSide == resistance)) exitWith {false};
	true
};

start_menu = {
	disableSerialization;
	if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	_DFML = findDisplay -1;
	lbClear 1;
	lbClear (_DFML displayCtrl 1);
	_trennlinie = "---------------------------------------------------------------------------------------------------------";
	_updates = [

		"Blindfolding Feature Added",
		"Jail Breaking Feature Fixed",
		"Mobile Market Update",
		"Appstore Update",
		"Added An-2 to Terrorist Air Shop",
		"2 New Skins Added to Opfor"

	];
	_basics = [
		"Please read our full list of rules at www.rise-gaming.com\rules",
		"If you are a cop or opfor or un please be on teamspeak, ts3.rise-gaming.com",
		"Don't RDM (Random Death Match)",
		"Be respectful (Racism = PERM Ban)",
		"If in doubt ask an admin (on teamspeak please)"
	];
	_keys = [
		"F5 : Toggles TLR Keys",
		"CTRL + F (ON FOOT ONLY) : Punch \ Rifle Butt \ Pistol Whip",
		"CTRL + F (IN VEHICLE) : Toggles Sirens (Cops\Opfor)",
		"CTRL + H : Police Airhorn",
		"CTRL + G : Toggles Speed Gun (Cops\Opfor)",
		"SHIFT + H : Toggles Airhorn Sound (Cops)",
		"~ Tilde : Cop Menu (Clear\Add Warrants , Release Prisoners, Sat Cam)",
		"1: Stats 2: Inventory 3: Hands Up 4: Bait Car (Cops) 5: Gang Menu (Civs)",
		"F8: Disable/enable HUD",
		"" // Use this to skip a line
	];
	(_DFML displayCtrl 1)	lbAdd _trennlinie;
	(_DFML displayCtrl 1)	lbAdd "R E C E N T  U P D A T E S :";
	(_DFML displayCtrl 1)	lbAdd _trennlinie;
	{
		(_DFML displayCtrl 1)	lbAdd _x;
	} foreach _updates;
	(_DFML displayCtrl 1)	lbAdd _trennlinie;
	(_DFML displayCtrl 1)	lbAdd "T H E  B A S I C S :";
	(_DFML displayCtrl 1)	lbAdd _trennlinie;
	{
		(_DFML displayCtrl 1)	lbAdd _x;
	} foreach _basics;
	(_DFML displayCtrl 1)	lbAdd _trennlinie;
	(_DFML displayCtrl 1)	lbAdd "K E Y S :";
	(_DFML displayCtrl 1)	lbAdd _trennlinie;
	{
		(_DFML displayCtrl 1)	lbAdd _x;
	} foreach _keys;
};

interact_license_buy = {
	if (!(createDialog "license_menu")) exitWith {hint "Dialog Error!";};
	_i = _this select 0;
	_shop = INV_LicenseShops select _i;
	_licenses =  _shop select INV_LicenseShops_List;

	{
		_name = [_x] call get_license_name_by_class;
		_price = [_x] call get_license_price_by_class;
		_ref = [_x] call get_license_ref_by_class;

		_index = lbAdd [2100, format ["%1 - ($%2)", _name,_price]];
		lbSetData [2100, _index, format["%1", _ref]];

	} foreach _licenses;

};
get_license_ref_by_class = {

	private ["_class"];
	_class = _this select 0;
	_ref = nil;

	for "_i" from 0 to (count INV_Licenses) do {
		_license = (INV_Licenses select _i);
		if (isNil "_license") exitWith {};
		_license_class 	= _license	select 0;
		_license_ref 	= _i;
		if (_class == _license_class) then {_ref = _license_ref};
	};
	_ref
};
get_license_price_by_class = {

	private ["_class"];
	_class = _this select 0;
	_price = nil;

	for "_i" from 0 to (count INV_Licenses) do {
		_license = (INV_Licenses select _i);
		if (isNil "_license") exitWith {};
		_license_class 	= _license	select 0;
		_license_price 	= _license	select 3;
		if (_class == _license_class) then {_price = _license_price};
	};
	_price
};
get_license_name_by_class = {

	private ["_class"];
	_class = _this select 0;
	_name = nil;

	for "_i" from 0 to (count INV_Licenses) do {
		_license = (INV_Licenses select _i);
		if (isNil "_license") exitWith {};
		_license_class 	= _license	select 0;
		_license_name 	= _license	select 2;
		if (_class == _license_class) then {_name = _license_name};
	};
	_name
};
player_remove_license = {
	_number = _this select 0;

	_license = ((INV_Licenses select _number) select 0);
	_name    = ((INV_Licenses select _number) select 2);

	if (not(_license call INV_HasLicense)) exitWith {player groupChat localize "STRS_inv_buylicense_alreadyfalse";};
	INV_LicenseOwner = INV_LicenseOwner - [_license];
	player groupChat format[localize "STRS_inv_buylicense_losttraining", _name];
	["licenses"] call RG_fnc_iSave;
};

FNC_GetPos = {
    private ["_pos","_pass"];
    _pass = _this select 0;
    _pos = getPosASL _pass;
    if !(surfaceIsWater _pos) then {
        _pos = ASLToATL _pos;
    };
    _pos
};

plane_pull_back = {
	_vehicle = _this select 1;
	_player = _this select 0;

	_vel = velocity _vehicle;
	_dir = direction _vehicle;
	player groupChat "Wait 5 Seconds";
	uiSleep 5;

	_i = 0;
	for "_i" from 0 to 4 do {

	_vehicle setVelocity [
			(_vel select 0),
			(_vel select 1) -4,
			(_vel select 2)
	];
	uiSleep 1;
	};
};
server_message = {
	_message = _this select 0;
	[[], "mp_server_message", [_message]] call mp_aware_me;
};


bomb_defuse = {

	if !(iscop or isopf) exitWith {player groupChat "You must be a cop to defuse the bomb!"};

	_defusers = [player, "defuser"] call INV_GetItemAmount;

	if (_defusers < 1) exitWith {player groupChat "You need a defuser to defuse the bomb!"};

	if (_defusers >= 1) then {

		bombing_active = false;
		deletevehicle mission_bomb;

		publicvariable "bombing_active";

		[player , 300000] call transaction_dynamiccuntflap;

		(format ['server globalChat "The Police have prevented the bombing!";']) call broadcast;

	};

};


debug = {
	_var = _this select 0;
	_string = _this select 1;
	
	if (isNil "_var") exitWith {};
	if (isNil "_string") then {
		systemChat format ["TYPE: %1 : VALUE: %2",typeName _var,_var];
	} else {
		systemChat format ["NAME: %1 TYPE: %2 : VALUE: %3",_string,typeName _var,_var];
	};
};

bombing_fail = {

		allow_bombing = false;

		player groupChat "You have failed your mission!";

		countdown = false ;

		deleteMarker "bomb_marker";

		deleteVehicle mission_bomb;

		bombing_active = false;

		publicvariable "bombing_active";

		uiSleep 300;

		allow_bombing = true;

};

bombing_complete = {

			allow_bombing = false;

			"bo_gbu12_lgb" createvehicle (getpos mission_bomb);

			uiSleep 1;

			"bo_gbu12_lgb" createvehicle (getpos mission_bomb);


			deleteMarker "bomb_marker";

			deleteVehicle mission_bomb;

			bombing_active = false;
			publicvariable "bombing_active";

			[player , 300000] call transaction_dynamiccuntflap;

			player groupChat "You have earned $300,000 for a sucessful bombing!";

			(format ['server globalChat "The police have failed to prevent the bombing!";']) call broadcast;


			uiSleep 300;

			allow_bombing = true;

};

reskin_admin = {
	_player = _this select 0;
	_class = typeof vehicle player;
	_reskin_array = [
		"USMC_LHD_Crew_Red"
	];
	_bool = _class in _reskin_array;
	_player setVehicleInit ' this setObjectTexture [0, "resources\images\admin_skin_jacket.jpg"]';
	_player setVehicleInit ' this setObjectTexture [1, "resources\images\admin_skin_helmet.jpg"]';
	processInitCommands;
	
};



mp_log = {

	_string = _this select 0;
	_tag = _this select 1;
	_hour = date select 3;
	_minute = date select 4;
	_random = round random 999;
	_uid = getplayeruid player;
	_faction = nil;
	if ([player] call player_opfor) then {_faction = "Opfor"};
		if ([player] call player_civilian) then {_faction = "Civilian"};
		if ([player] call player_cop) then {_faction = "Cop"};
		if ([player] call player_insurgent) then {_faction = "Insurgent"};

	_stamp = format ["(%4) TIME: %1:%2:%3 (%5) (%6) |  ",_hour,_minute,_random,_tag,_faction,_uid];
	["TakistanLifeLog", "TakistanLifeLog", _stamp ,_string] call fn_SaveToServer;

};

player_blacklist = {
	private ["_player","_faction"];
	_player = _this select 0;
	_uid = getplayeruid _player;
	_faction = _this select 1;
	if (isNil "_player") exitWith {player groupChat "No player selected"};
	
	if (_faction == "cop") exitWith {
		player groupChat format ["%1 was added to the %2 blacklist",name _player,_faction];
	};
	if (_faction == "opfor") exitWith {
		player groupChat format ["%1 was added to the %2 blacklist",name _player,_faction];
	};
	if (_faction == "terror") exitWith {
		player groupChat format ["%1 was added to the %2 blacklist",name _player,_faction];
	};
	
	[[_player],"player_blacklist_update",[_faction]] call mp_aware_me;
};

player_blacklist_update = {

	private ["_faction"];
	_faction = _this select 0;
	if (_faction == "cop") then {
		player groupChat format ["You were blacklisted from %1",_faction];
		blacklists set [0,true];
	};
	if (_faction == "opfor") then {
		player groupChat format ["You were blacklisted from %1",_faction];
		blacklists set [1,true];
	};
	if (_faction == "terror") then {
		player groupChat format ["You were blacklisted from %1",_faction];
		blacklists set [2,true];
	};
	
	[format ["%1_persistent",getplayeruid player], format ["%1_persistent",getplayeruid player],  "blacklists",blacklists] call fn_SaveToServer;
};

player_message_global = {
	private ["_text","_faction","_cost","_dynamiccuntflap"];
	_text =  _this select 0;
	_faction = "Nil";
	if (iscop) then {_faction = "Cop"};
	if (isciv) then {_faction = "Civilian"};
	if (isesu) then {_faction = "ESU"};
	if (isopf) then {_faction = "Opfor"};
	if (isins) then {_faction = "Insurgent"};
	
	_text = format ["%1 (%2): %3",name player, _faction,_text];
	
	if (isStaff) then {
		[[], "mp_system_chat_message", [_text]] call mp_aware_me;
		
	} else {
		_cost = 2000;
		_dynamiccuntflap = [player] call get_dynamiccuntflap;
		
		if (_cost > _dynamiccuntflap) exitWith {
			player globalChat format ["You need at least $2,000 to put a message in global."];
		};
		
		_dynamiccuntflap = _dynamiccuntflap - _cost;
		[player, _dynamiccuntflap] call set_dynamiccuntflap;
		
		[[], "mp_system_chat_message", [_text]] call mp_aware_me;
	};
	
	[_text , "Global Message"] call mp_log;
};

player_get_player_by_name = {
	private["_name", "_player"];
	_name = _this select 0;
	if (isNil "_name") exitWith {nil};
	if (typeName _name != "STRING") exitWith {nil};

	_player = nil;

	{
		private["_exit"];

		_exit = if (true) then {
			private["_cplayer", "_cname", "_cplayer_variable"];
			_cplayer_variable = _x;
			_cplayer = missionNamespace getVariable _cplayer_variable;
			if (isNil "_cplayer") exitWith {false};
			_cname = name _cplayer;
			if (_cname == _name) exitWith {
				_player = _cplayer;
				true
			};
		};
		if (isNil "_exit") then {_exit = false};
		if (_exit) exitWith {};
	} foreach playerstringarray;

	if (isNil "_player") exitWith {nil};
	_player
};
admin_cam_player = {
	_player = _this select 0;
	spectate_target = _player;
	if (!isNil "RIGHT_ARROW_EH") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown", RIGHT_ARROW_EH];};
	if (!isNil "LEFT_ARROW_EH") then {(findDisplay 46) displayRemoveEventHandler ["KeyDown", LEFT_ARROW_EH];};
	(vehicle _player) switchCamera "EXTERNAL";
	spectateing = true;
	titleText ["Spectating... PRESS SPACE TO EXIT, Right Arrow To Select Next Player","PLAIN DOWN"]; titleFadeOut 4;
	hint "Press Space To Exit";
	SPACE_EH = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 0x39) then {spectateing = false;};"];
	RIGHT_ARROW_EH = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 0xCD) then {[] call admin_cam_next_player};"];
	LEFT_ARROW_EH = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 0xCB) then {[] call admin_cam_previous_player};"];
	waitUntil {((!spectateing) or (!alive spectate_target))};
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", SPACE_EH];
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", RIGHT_ARROW_EH];
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", LEFT_ARROW_EH];
	(vehicle player) switchCamera "EXTERNAL";
	titleText ["Back to player...","PLAIN DOWN"]; titleFadeOut 4;
};

admin_cam_next_player = {
		
	for "_i" from 0 to (count playableUnits -1) do {
		
		_unit = playableUnits select _i;
		if (_unit == spectate_target) then {
			_next = _i + 1;
			if (_next == count playableUnits) then {_next = 0};
			_unit = playableUnits select _next;
			[_unit] spawn admin_cam_player;
			systemChat format ["Now spectating %1",name _unit];
		};
	};
};
admin_cam_previous_player = {
		
	for "_i" from 0 to (count playableUnits -1) do {
		
		_unit = playableUnits select _i;
		if (_unit == spectate_target) then {
			_next = _i - 1;
			if (_next == -1) then {_next = (count playableUnits - 1)};
			_unit = playableUnits select _next;
			[_unit] spawn admin_cam_player;
			systemChat format ["Now spectating %1",name _unit];
		};
	};
};

dialog_handler = {
	#include "macro.h"

	disableSerialization;

	private["_art"];
	_art   = _this select 0;
	_array = _this;
	_money  = [player, 'money'] call INV_GetItemAmount;
	_zusatzString = "";

	if ((count _array)>1) then {
		_zusatzString = _array select 1;
	};

	if (_art == "bail") then {
		if (!(createDialog "baildialog")) exitWith {hint "Dialog Error!";};
		sliderSetRange [2, 100, 250000];		sliderSetSpeed [2, 1, 50];

		while {(ctrlVisible 1008)} do {
			ctrlSetText [1, format["$%1", strM((round(sliderPosition 2)))]];
			uiSleep 0.3;
		};
	};

	if (_art == "police_arrest") then {
		
		if (not(createDialog "civmenu_arrest")) exitWith { hint "Dialog Error!";};

		if (count arrest_charges <= 0) then {
			_reason = "No charges selected";
			_index	= lbAdd [7, format["%1", (_reason)]];
			lbSetData [7, _index,format["%1", (_reason)]];
		} else {
			for "_i" from 0 to ((count arrest_charges) -1) do {
				_charge = arrest_charges select _i;
				_string = _charge select 0;
				_count = _charge select 1;
				_index	= lbAdd [7, format["%1 x%2",_string,_count]];
			};
		};
		
		for "_i" from 0 to ((count arrestable_charges) -1) do 
		{
			_array = arrestable_charges select _i;
			_reason = _array select 0;
			_index	= lbAdd [3, format["%1", (_reason)]];
			lbSetData [3, _index,format["%1", (_reason)]];
		};
	};
	if (_art == "police_arrest_update") then {
		lbClear 7;
		for "_i" from 0 to ((count arrest_charges) -1) do {
			_charge = arrest_charges select _i;
			_string = _charge select 0;
			_count = _charge select 1;
			_index	= lbAdd [7, format["%1 x%2",_string,_count]];
		};
	};

	if (_art == "911") then {
		if (!(createDialog "emergency_menu")) exitWith {hint "Dialog Error!";};
		
		private["_c"];
		_c = 0;
		while { _c < (count dispatch_urgency) } do {
				_x = dispatch_urgency select _c;
				_index = lbAdd [1, format ["%1",_x]];
				lbSetData [1, _index, format["%1", _x]];
				_c = _c + 1;
		};
		private["_c"];
		_c = 0;
		while { _c < (count dispatch_crimes) } do {
		

				_x = dispatch_crimes select _c;
				_index = lbAdd [2, format ["%1",_x]];
				lbSetData [2, _index, format["%1", _x]];
				_c = _c + 1;
		};
		
	};

	if (_art == "ticket_menu") then {
		if (!(createDialog "ticket_menu")) exitWith {hint "Dialog Error!";};
		
		for "_i" from 0 to (count ticket_reasons - 1) do {
			_reason = ticket_reasons select _i;
			_index = lbAdd [1, format ["%1",_reason]];
			lbSetData [1, _index, format["%1", _reason]];
		};
	};

	if (_art == "spielerliste") then {

		if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
		_DFML = findDisplay -1;
		
		private["_dead_wait_time"];
		_dead_wait_time = [player] call player_dead_wait_time;
		
		lbClear 1;
		lbClear (_DFML displayCtrl 1);
		
		private["_total_money", "_private_money", "_factory_money", "_cash"];
		_total_money = [player] call player_get_total_money;
		_private_money = [player] call player_get_private_storage_money;
		_factory_money = [player] call player_get_factory_money;
		_cash = [player, 'money'] call INV_GetItemAmount;
		_bank = [player] call get_dynamiccuntflap;
		_trennlinie = "=======================================================================";
		(_DFML displayCtrl 1) 	lbAdd format ["Date:     %3.%2.%1", (date select 0), (date select 1), (date select 2)];
		(_DFML displayCtrl 1)	lbAdd format ["Runtime: %1 minutes", (round(time/60))];
		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		(_DFML displayCtrl 1)	lbAdd localize "STRS_statdialog_playerinfo";
		(_DFML displayCtrl 1)	lbAdd format ["Total shekels: $%1", strM(_total_money)];
		(_DFML displayCtrl 1)	lbAdd format ["Shekels: $%2", localize "STRS_statdialog_health", strM(_cash)];
		(_DFML displayCtrl 1)	lbAdd format ["Savings: $%2", localize "STRS_statdialog_health", strM(_bank)];
		(_DFML displayCtrl 1)	lbAdd format ["Private storage: $%1", strM(_private_money)];
		(_DFML displayCtrl 1)	lbAdd format ["Factory storage: $%1", strM(_factory_money)];
	//	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_hunger", round(INV_hunger)]];
		(_DFML displayCtrl 1)	lbAdd format ["%1: %2/%3", localize "STRS_statdialog_weight", (call INV_GetOwnWeight), INV_CarryingCapacity];
		(_DFML displayCtrl 1)	lbAdd format ["%1: %2",    localize "STRS_statdialog_copkills", ([player, "copskilled"] call player_get_scalar)];
		(_DFML displayCtrl 1)	lbAdd format ["%1: %2",    localize "STRS_statdialog_civkills", ([player, "civskilled"] call player_get_scalar)];
		(_DFML displayCtrl 1)	lbAdd format ["%1: %2",    "Arrests Made", ([player, "arrestsmade"] call player_get_scalar)];
		(_DFML displayCtrl 1)	lbAdd format ["%1: %2",    localize "STRS_statdialog_selfkills", ([player, "selfkilled"] call player_get_scalar)];
		(_DFML displayCtrl 1)	lbAdd format ["%1: %2",    localize "STRS_statdialog_deaths", ([player, "deadtime"] call player_get_scalar)];
		(_DFML displayCtrl 1)	lbAdd format ["%1: %2 seconds",    "Dead-Wait time", round(_dead_wait_time)];
		
		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		(_DFML displayCtrl 1)	lbAdd localize "STRS_statdialog_licenselist";
		
		for [{_i=0}, {_i < (count INV_Licenses)}, {_i=_i+1}] do {
			if (((INV_Licenses select _i) select 0) call INV_HasLicense) then
			{
				(_DFML displayCtrl 1)	lbAdd (((INV_Licenses select _i) select 2));
			};
		};
		
		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		(_DFML displayCtrl 1)	lbAdd "F A C T O R I E S:";
		
		for [{_i=0}, {_i < (count all_factories)}, {_i=_i+1}] do {
			if (((all_factories select _i) select 1) in INV_Fabrikowner) then
			{

			_workers = call compile format["%1workers", ((all_factories select _i) select 8)];
			(_DFML displayCtrl 1)	lbAdd format['%1', ((all_factories select _i) select 2), _workers];
			};
		};
		
		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		(_DFML displayCtrl 1)	lbAdd localize "STRS_statdialog_regierung";
		
		if (not(MayorNumber == -1)) then {
			(_DFML displayCtrl 1)	lbAdd (playerstringarray select MayorNumber);
		};
		
		_next_president_election = server getVariable "next_president_election";
		if (not(isnil "_next_president_election")) then { if (typeName _next_president_election == "SCALAR") then { if (_next_president_election > 0) then {
			private ["_s"];
			_s = "";
			if (_next_president_election > 1) then { _s = "s";};
			
			(_DFML displayCtrl 1)	lbAdd format["Next election results in %1 minute%2", _next_president_election, _s]; 
		};};}; 
		
		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		(_DFML displayCtrl 1)	lbAdd localize "STRS_statdialog_chief";
		
		if (not(chiefNumber == -1)) then {
			(_DFML displayCtrl 1)	lbAdd (playerstringarray select chiefNumber);
		};
		
		_next_chief_election = server getVariable "next_chief_election";
		if (not(isnil "_next_chief_election")) then { if (typeName _next_chief_election == "SCALAR") then { if (_next_chief_election > 0) then {
			private ["_s"];
			_s = "";
			if (_next_chief_election > 1) then { _s = "s";};
			
			(_DFML displayCtrl 1)	lbAdd format["Next election results in %1 minute%2", _next_chief_election, _s]; 
		};};}; 

		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		
		// OPFOR COMMANDER
			(_DFML displayCtrl 1)	lbAdd localize "STRS_statdialog_commander";
		
		if (not(commanderNumber == -1)) then {
			(_DFML displayCtrl 1)	lbAdd (playerstringarray select commanderNumber );
		};
		
		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		
		_next_chief_election = server getVariable "next_chief_election";
		if (not(isnil "_next_chief_election")) then { if (typeName _next_chief_election == "SCALAR") then { if (_next_chief_election > 0) then {
			private ["_s"];
			_s = "";
			if (_next_chief_election > 1) then { _s = "s";};
			
			(_DFML displayCtrl 1)	lbAdd format["Next election results in %1 minute%2", _next_chief_election, _s]; 
		};};}; 


		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		(_DFML displayCtrl 1)	lbAdd "G A N G S:";
		
		if (count gangsarray > 0) then {
		
			_control1 = gangarea1 getvariable "control";
			_control2 = gangarea2 getvariable "control";
			_control3 = gangarea3 getvariable "control";
			
			if (isNil "_control1") then {_control1 = "None"};
			if (isNil "_control2") then {_control2 = "None"};
			if (isNil "_control3") then {_control3 = "None"};

			
			(_DFML displayCtrl 1)	lbAdd format["Territories:"];
			(_DFML displayCtrl 1)	lbAdd format[" Gang Area 1: %1",_control1];
			(_DFML displayCtrl 1)	lbAdd format[" Gang Area 2: %1",_control2];
			(_DFML displayCtrl 1)	lbAdd format[" Gang Area 3: %1",_control3];
			(_DFML displayCtrl 1)	lbAdd format[""];
		
			for "_i" from 0 to (count gangsarray -1) do {
				_gangarray = gangsarray select _i;
				_gangname  = _gangarray select 0;
				_members   = _gangarray select 2;
				_leader = (_gangarray select 1) select 0;
					
				(_DFML displayCtrl 1)	lbAdd format["%1 - Members :",_gangname];
				{
					_leader_status = "";
					if (_leader == _x) then {_leader_status = " - Leader"};
					(_DFML displayCtrl 1)	lbAdd format["  %1%2",_x,_leader_status];
				} foreach _members;
				
			};
			
		} else {
			(_DFML displayCtrl 1)	lbAdd format[" No Gangs"];
		};
		

		
		(_DFML displayCtrl 1) lbAdd _trennlinie;

		_totalamountstolen = (bank_gold_bars * 100000);
		(_DFML displayCtrl 1)	lbAdd "B A N K:";
		(_DFML displayCtrl 1)	lbAdd (format ["Est. total funds in the main bank safe: $%1", _totalamountstolen]);		if(!local_useBankPossible)then{(_DFML displayCtrl 1) lbAdd (format ["Bank lockout time remaining: %1 seconds.", banklockouttime])};	
		(_DFML displayCtrl 1)	lbAdd _trennlinie;

		(_DFML displayCtrl 1)	lbAdd localize "STRS_statdialog_laws";
		_i = 0;
		{
			if (not(_x == "")) then {
				_i = _i + 1;
				(_DFML displayCtrl 1)	lbAdd (format ["%1: %2", _i, _x]);
			};
		}
		forEach LawsArray;
		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		(_DFML displayCtrl 1)	lbAdd localize "STRS_statdialog_taxes";
		{
			if ((_x select 2) > 0) then {
				(_DFML displayCtrl 1)	lbAdd format["%1: %2", (_x select 1), (_x select 2)];
			};
		}
		foreach INV_ItemTypeArray;
		(_DFML displayCtrl 1)	lbAdd format["Transfer: %1", bank_tax];

		
		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		/*
		(_DFML displayCtrl 1)	lbAdd "F O O D  S T O C K S:";

		_stock = ["boar", (shop1 call INV_getshopnum)] call INV_GetStock;
		_stock = _stock + (["boar", (shop2 call INV_GetShopNum)] call INV_GetStock);
		_stock = _stock + (["boar", (shop3 call INV_GetShopNum)] call INV_GetStock);
		_stock = _stock + (["boar", (shop4 call INV_GetShopNum)] call INV_GetStock);

		(_DFML displayCtrl 1)	lbAdd format["boar meat: %1", _stock];

		_stock = ["perch", (shop1 call INV_getshopnum)] call INV_GetStock;
		_stock = _stock + (["perch", (shop2 call INV_GetShopNum)] call INV_GetStock);
		_stock = _stock + (["perch", (shop3 call INV_GetShopNum)] call INV_GetStock);
		_stock = _stock + (["perch", (shop4 call INV_GetShopNum)] call INV_GetStock);

		(_DFML displayCtrl 1)	lbAdd format["perch: %1", _stock];

		_stock = ["walleye", (shop1 call INV_GetShopNum)] call INV_GetStock;
		_stock = _stock + (["walleye", (shop2 call INV_GetShopNum)] call INV_GetStock);
		_stock = _stock + (["walleye", (shop3 call INV_GetShopNum)] call INV_GetStock);
		_stock = _stock + (["walleye", (shop4 call INV_GetShopNum)] call INV_GetStock);

		(_DFML displayCtrl 1)	lbAdd format["walleye: %1", _stock];

		_stock = ["trout", (shop1 call INV_GetShopNum)] call INV_GetStock;
		_stock = _stock + (["trout", (shop2 call INV_GetShopNum)] call INV_GetStock);
		_stock = _stock + (["trout", (shop3 call INV_GetShopNum)] call INV_GetStock);
		_stock = _stock + (["trout", (shop4 call INV_GetShopNum)] call INV_GetStock);

		(_DFML displayCtrl 1)	lbAdd format["trout: %1", _stock];

		_stock = ["bass", (shop1 call INV_GetShopNum)] call INV_GetStock;
		_stock = _stock + (["bass", (shop2 call INV_GetShopNum)] call INV_GetStock);
		_stock = _stock + (["bass", (shop3 call INV_GetShopNum)] call INV_GetStock);
		_stock = _stock + (["bass", (shop4 call INV_GetShopNum)] call INV_GetStock);

		(_DFML displayCtrl 1)	lbAdd format["bass: %1", _stock];

		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		*/

		


		(_DFML displayCtrl 1)	lbAdd format["Oil demand: %1 barrel/s", strN(call shop_get_oil_barrel_demand)];
		(_DFML displayCtrl 1)	lbAdd format["Fuel price: $%1 per liter", (call shop_get_fuel_price)];
		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		(_DFML displayCtrl 1)	lbAdd localize "STRS_statdialog_playerlist";

		for "_c" from 0 to ((count playerstringarray) - 1) do {
			private["_player", "_player_variable_name"];
			_player_variable_name = playerstringarray select _c;
			_player = missionNamespace getVariable [_player_variable_name,objNull];
			
			if ([_player] call player_human) then {
				private["_label_text", "_index"];
				_label_text =  format ["%1: %2", _player, (name _player)];
				_index = (_DFML displayCtrl 1) lbAdd _label_text;
				private["_wanted"];
				if (not([_player] call player_cop) && ([_player] call player_get_bounty) > 0) then {
					(_DFML displayCtrl 1) lbSetColor [_index, [1, 0, 0, 1]];
				};
			};
		};
		
		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		(_DFML displayCtrl 1)	lbAdd "W A N T E D:";
		
		for "_c" from 0 to ((count playerstringarray) - 1) do {
			private["_player_variable_name", "_player_variable"];
			_player_variable_name = playerstringarray select _c;
			_player_variable = missionNamespace getVariable [_player_variable_name, objNull];

			if (not([_player_variable] call player_cop) && ([_player_variable] call player_get_wanted)) then {
				private["_bounty", "_reasons"];
				_reasons = [_player_variable] call player_get_reason; 
				_bounty = [_player_variable] call player_get_bounty;
				
				(_DFML displayCtrl 1) lbAdd (format ["%1 (Bounty: %3): %2 is wanted for %4 crime/s:", _player_variable, (name _player_variable), _bounty, (count _reasons)]);
				private["_j", "_count"];
				_j = 0;
				while { _j < (count _reasons) } do {
					private["_reason"];
					_reason = _reasons select _j;
					(_DFML displayCtrl 1) lbAdd (format ["    %1. %2", (_j + 1), _reason]); 
					_j = _j + 1;
				};
				(_DFML displayCtrl 1) lbAdd _trennlinie;
			};

		};


		(_DFML displayCtrl 1)	lbAdd _trennlinie;
	};

	if (_art == "inventorycheck") then {
		if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
		
		_DFML = findDisplay -1;
		
		lbClear 1;
		lbClear (_DFML displayCtrl 1);
		
		_licensearray  = (_array select 1);
		_inventararray = (_array select 2);
		_civobj        = (_array select 3);
		_waffenarray   = weapons _civobj - nonlethalweapons;
		_magazinarray  = magazines _civobj;
		_trennlinie = "=======================================================================";
		(_DFML displayCtrl 1)	lbAdd localize "STRS_statdialog_licenselist";
		private "_i"; //// ADD to fix bug
		for "_i" from 0 to ((count _licensearray) - 1) do
		{
			_lizenz = (_licensearray select _i);
			(_DFML displayCtrl 1)	lbAdd format ["%1", (_lizenz call INV_GetLicenseName)];
		};
		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		(_DFML displayCtrl 1)	lbAdd localize "STRS_statdialog_inventarlist";
		for "_i" from 0 to ((count _inventararray) - 1) do
		{
			_objekt     = ((_inventararray select _i) select 0);
			_objektname = (_objekt call INV_GetItemName);
			_anzahl     = [((_inventararray select _i) select 1)] call decode_number;
			if (_anzahl > 0) then
			{
				(_DFML displayCtrl 1)	lbAdd format ["%1: %2", _objektname, _anzahl];
			};
		};

		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		(_DFML displayCtrl 1)	lbAdd localize "STRS_statdialog_waffen";
		
		for "_i" from 0 to ((count _waffenarray) - 1) do
		{
			_objekt     = _waffenarray select _i;
			_scriptname = _objekt call INV_GetScriptFromClass_Weap;
			_objektname = (_scriptname call INV_GetItemName);
			(_DFML displayCtrl 1)	lbAdd format ["%1", _objektname];
		};
		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		_index = (_DFML displayCtrl 1)	lbAdd localize "STRS_statdialog_magazine";
		for [{_i=0}, {_i < (count _magazinarray)}, {_i=_i+1}] do
		{
			_objekt     = _magazinarray select _i;
			_scriptname = _objekt call INV_GetScriptFromClass_Mag;
			_objektname = (_scriptname call INV_GetItemName);
			(_DFML displayCtrl 1)	lbAdd format ["%1", _objektname];
		};
		(_DFML displayCtrl 1)	lbAdd _trennlinie;
	};
	if (_art == "licensecheck") then {
		if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
		
		_DFML = findDisplay -1;
		
		lbClear 1;
		lbClear (_DFML displayCtrl 1);
		
		_licensearray  = (_array select 1);
		_trennlinie = "=======================================================================";
		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		(_DFML displayCtrl 1)	lbAdd localize "STRS_statdialog_licenselist";
		(_DFML displayCtrl 1)	lbAdd _trennlinie;

		for "_i" from 0 to ((count _licensearray) - 1) do
		{
			_lizenz = (_licensearray select _i);
			(_DFML displayCtrl 1)	lbAdd format ["%1", (_lizenz call INV_GetLicenseName)];
		};
		(_DFML displayCtrl 1)	lbAdd _trennlinie;
	};

	if (_art == "inventorysteal") then {

	};

	if (_art == "gesetz") then {
		if (!(createDialog "gesetzdialog")) exitWith {hint "Dialog Error!";};
		
		_DFML = findDisplay -1;
			
		lbClear 1;
		lbClear (_DFML displayCtrl 1);
		
		{
			_index = (_DFML displayCtrl 1)	lbAdd _x;
			(_DFML displayCtrl 1)	lbSetData [_index, _x];
		}
		forEach LawsArray;
		
		while {ctrlVisible 1020} do {
			_selected = lbCurSel 1;
			ctrlSetText [2, lbText [1, _selected]];
			waitUntil {((not(_selected == lbCurSel 1)) or (not(ctrlVisible 1020)))};
		};
	};

	// PMC DIALOG BREAKDOWN STARTS HERE

	if (_art == "coplog") then {
		if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
		
		_DFML = findDisplay -1;
		
		lbClear 1;
		lbClear (_DFML displayCtrl 1);

		_trennlinie = "=======================================================================";
		(_DFML displayCtrl 1)	lbAdd _trennlinie;

		private ["_i"];
		(_DFML displayCtrl 1)	lbAdd "C U R R E N T  W A R R A N T S:";
		(_DFML displayCtrl 1)	lbAdd _trennlinie;
		
		for "_c" from 0 to ((count playerstringarray) - 1) do {
			private["_player_variable_name", "_player_variable"];
			_player_variable_name = playerstringarray select _c;
			_player_variable = missionNamespace getVariable [_player_variable_name, objNull];
			
			if (not([_player_variable] call player_cop) && ([_player_variable] call player_get_wanted)) then {
				private["_bounty", "_reasons"];
				_reasons = [_player_variable] call player_get_reason; 
				_bounty = [_player_variable] call player_get_bounty;
				
				(_DFML displayCtrl 1) lbAdd (format ["%1 (Bounty: $%3): %2 is wanted for %4 crime/s:", _player_variable, (name _player_variable), strM(_bounty), (count _reasons)]);
				private["_j"];
				_j = 0;
				while { _j < (count _reasons) } do {
					private["_reason"];
					_reason = _reasons select _j;
					(_DFML displayCtrl 1) lbAdd (format ["    %1. %2", (_j + 1), _reason]); 
					_j = _j + 1;
				};
				(_DFML displayCtrl 1) lbAdd _trennlinie;
			};
		};
	};

	if (_art == "president") then {
		if (!(createDialog "president_election")) exitWith {hint "Dialog Error!";};
		
		_DFML = findDisplay -1;
		
		lbClear 1;
		lbClear (_DFML displayCtrl 1);
		
		private["_index"];
		_index = [1] call DialogNotCopsInsList;
		(_DFML displayCtrl 1) lbSetCurSel _index;
	};

	if (_art == "chief") then {
		if (!(createDialog "chief_election")) exitWith {hint "Dialog Error!";};
		
		_DFML = findDisplay -1;
		
		lbClear 1;
		lbClear (_DFML displayCtrl 1);
		
		private["_index"];
		_player_variable_name = "";
		_index = -1;

		for "_c" from 0 to ((count playerstringarray) - 1) do {
			private["_player_variable_name", "_player_variable"];
			_player_variable_name = playerstringarray select _c;
			_player_variable = missionNamespace getVariable [_player_variable_name, objNull];
		
			if (([player] call player_exists)) then {
				private["_player_cop"];
				_player_cop = [_player_variable] call player_cop;
				if (not(_player_cop)) exitWith {};
				
				private["_player_name"];
				_player_name = (name _player_variable);
				_index = lbAdd [1, format ["%1 - (%2)", _player_variable_name, _player_name]];
				lbSetData [1, _index, format["%1", _c]];
			};
		};
	};
	if (_art == "commander") then {
		if (!(createDialog "commander_election")) exitWith {hint "Dialog Error!";};
		
		_DFML = findDisplay -1;
		
		lbClear 1;
		lbClear (_DFML displayCtrl 1);
		
		private["_index"];
		_player_variable_name = "";
		_index = -1;

		for "_c" from 0 to ((count playerstringarray) - 1) do {
			private["_player_variable_name", "_player_variable"];
			_player_variable_name = playerstringarray select _c;
			_player_variable = missionNamespace getVariable [_player_variable_name, objNull];
		
			if (([player] call player_exists)) then {
				private["_player_opfor"];
				_player_opfor = [_player_variable] call player_opfor;
				if (not(_player_opfor)) exitWith {};
				
				private["_player_name"];
				_player_name = (name _player_variable);
				_index = lbAdd [1, format ["%1 - (%2)", _player_variable_name, _player_name]];
				lbSetData [1, _index, format["%1", _c]];
			};
		};
	};
	if (_art == "steuern") then {
		if (!(createDialog "steuerdialog")) exitWith {hint "Dialog Error!";};
		
		_DFML = findDisplay -1;
		
		lbClear 1;
		lbClear (_DFML displayCtrl 1);
		
		sliderSetSpeed [12, 1, 5];
		sliderSetRange [12, 0, 30];
		sliderSetPosition [12,((INV_ItemTypeArray select 0) select 2)];
		sliderSetSpeed [22, 1, 5];		sliderSetRange [22, 1, 30];
		sliderSetPosition [22,((INV_ItemTypeArray select 1) select 2)];
		sliderSetSpeed [32, 1, 5];				sliderSetRange [32, 1, 30];
		sliderSetPosition [32,((INV_ItemTypeArray select 2) select 2)];
		sliderSetSpeed [42, 1, 5];
		sliderSetRange [42, 0, 30];
		sliderSetPosition [42,((INV_ItemTypeArray select 3) select 2)];
		sliderSetSpeed [52, 1, 5];
		sliderSetRange [52, 0, 30];
		sliderSetPosition [52,bank_tax];
		while {ctrlVisible 1032} do {
			ctrlSetText [11, format[localize "STRS_dialogandere_steuerdialog_itemsteuer", strN((round(sliderPosition 12)))]];
			ctrlSetText [21, format[localize "STRS_dialogandere_steuerdialog_fahrzeugsteuer", strN((round(sliderPosition 22)))]];
			ctrlSetText [31, format[localize "STRS_dialogandere_steuerdialog_magazinsteuer", strN((round(sliderPosition 32)))]];
			ctrlSetText [41, format[localize "STRS_dialogandere_steuerdialog_waffesteuer", strN((round(sliderPosition 42)))]];
			ctrlSetText [51, format[localize "STRS_dialogandere_steuerdialog_banksteuer", strN((round(sliderPosition 52)))]];
			uiSleep 0.1;
		};
	};

	if (_art == "copmenu") then {
		if (!(createDialog "dispatch_menu")) exitWith {hint "Dialog Error!"};
	};

	if (_art == "copmenulite") then {
		if (!(createDialog "dispatch_menu")) exitWith {hint "Dialog Error!"};
	};

	if (_art == "distribute") then {
		if (!(createDialog "distribute")) exitWith {hint "Dialog Error!"};
	};

	if (_art == "gangmenu") then {
		if (!(createDialog "gang_menu")) exitWith {hint "Dialog Error!";};
		private "_i";
		for "_i" from 0 to (  ((count gangsarray) - 1)) do {
			_gangarray = gangsarray select _i;
			_members = _gangarray select 2;
			_leader = (_gangarray select 1) select 0;
			if (isNil "_leader") then {_leader = "NONE"};
			_index = lbAdd [1500, format ["%1", (_gangarray select 0)]];
			lbSetData [1500, _index, format ["%1", (_gangarray select 0)]];
		};
	};
	if (_art == "police_database") then {
		if (!(createDialog "dispatch_database_dlg")) exitWith {hint "Dialog Error!";};
		private "_i";
		for "_i" from 0 to ((count dispatch_database) - 1) do {
			_call = dispatch_database select _i;
			_location = _call select 0;
			_type = _call select 1;
			_urgency = _call select 2;
			_caller = _call select 3;
			if !((count dispatch_database) >=1) exitWIth {};
			_index = lbAdd [202, format ["Caller: %4 | Crime: %2 | Urgency: %3 | Location: %1",_location,_type,_urgency,_caller]];
		};
	};	
	if (_art == "global_message") then {
		if (!(createDialog "global_message_dialog")) exitWith {hint "Dialog Error!";};
		
		buttonSetAction [3, '[(ctrlText 1)] call player_message_global; closedialog 0;'];
	};
	
	if (_art == "pmcmenu_create") then {
		if (!(createDialog "pmc_menu_create")) exitWith {hint "Dialog Error!";};
		private "_i";
		for [{_i=0}, {_i < (count contracttypes)}, {_i=_i+1}] do {
			_type = contracttypes select _i;
			_index = lbAdd [2100, format ["%1",_type]];
			lbSetData [2100, _index, format ["%1",_type]];
		};

		for "_c" from 0 to ((count playerstringarray) - 1) do {
		_player_variable_name = playerstringarray select _c;
		_player_variable = missionNamespace getVariable [_player_variable_name, objNull];  // 	_player_variable = missionNamespace getVariable [_player_variable_name, objNull];

		if ([_player_variable] call player_exists) then { // original [_player_variable] call player_exists
		
			private["_player_name", "_index"];
			_player_name = (name _player_variable);
			_index = lbAdd [2101, format ["%1 - (%2)", _player_name, _player_variable_name]];
			lbSetData [2101, _index, format["%1", _player_name]];
			
		};
	};
		
	};
	if (_art == "pmcmenu") then {
		if (!(createDialog "pmc_menu")) exitWith {hint "Dialog Error!";};
		for "_c" from 0 to ((count pmccontracts) - 1) do {
			_contractarray = pmccontracts select _c;
			_name = (_contractarray select 0) select 0;
			_type = (_contractarray select 1) select 0;
			_contractors = _contractarray select 2;
			_complete = _contractarray select 3;
			_client = (_contractarray select 4) select 0;
			_payment = (_contractarray select 4) select 1;
			_target = (_contractarray select 5) select 0;
			if (_complete) then {_complete = "Yes"} else {_complete = "No"};
			_index = lbAdd [1500, format ["%1 - %2",_name,_client]];
			lbSetData [1500, _index, format ["%1",_c]];
		};

		
		while {ctrlVisible 1010} do {
			_i = lbData [1500, (lbCurSel 1500)];
			_i = parseNumber _i;
			_name = (((pmccontracts select _i) select 0)select 0);
			_type = (((pmccontracts select _i) select 1)select 0);
			_target = (((pmccontracts select _i) select 5)select 0);
			_client = (((pmccontracts select _i) select 4)select 0);
			_payment= (((pmccontracts select _i) select 4)select 1);
			_contractors = (pmccontracts select _i) select 2;
			
			if (isNil "_name") then {_name = "No Contract Selected"};
			if (isNil "_type") then {_type = "No Contract Selected"};
			if (isNil "_target") then {_target = "No Contract Selected"};
			if (isNil "_client") then {_client = "No Contract Selected"};
			if (isNil "_payment") then {_payment = "No Contract Selected"};
			if (isNil "_contractors") then {_contractors = "No Contract Selected"};
			
			ctrlSetText [1000,  format ["Name: %1",_name]];
			ctrlSetText [1001,  format ["Type: %1",_type]];
			ctrlSetText [1002,  format ["Target: %1",_target]];
			ctrlSetText [1003,  format ["Client: %1",_client]];
			ctrlSetText [1004,  format ["Payment: %1",_payment]];
			ctrlSetText [1005,  format ["Contractors: %1",_contractors]];

			uiSleep 0.1;
		};
	};

	if (_art == "gildenverwaltung") then {
		
		if(!gangleader)exitwith{player groupchat "you are not the gang leader! You may need to wait 10 seconds for the gangs to update."};

		closedialog 0;
		if (!(createDialog "gilde_verwaltung")) exitWith {hint "Dialog Error!";};

		_members = [];
		for "_i" from 0 to (  ((count gangsarray) - 1)) do {
			if ((name player) in ((gangsarray select _i) select 2)) exitWith {_members = ((gangsarray select _i) select 2)};
		};

		_index = lbAdd [201, localize "STRS_hints_ja"];
		lbSetData [201, _index, "true"];
		_index = lbAdd [201, localize "STRS_hints_nein"];
		lbSetData [201, _index, "false"];

		{
			
			_index = lbAdd [102, (format ["%1 (%2)", _x, [_x] call player_get_player_by_name])];
			lbSetData [102, _index, (format ["%1", [_x] call player_get_player_by_name])];
			
		
		} foreach _members;

	};
	if (_art == "dogname") then {
		if (!(createDialog "dogname")) exitWith {hint "Dialog Error!";};
		};
};

player_add_license = {
	_number = _this select 0;
	_number = parseNumber _number;

	_license = ((INV_Licenses select _number) select 0);
	_name    = ((INV_Licenses select _number) select 2);
	_cost    = ((INV_Licenses select _number) select 3);

	if (_license call INV_HasLicense) exitWith {player groupChat "You already have that license."};
	if (([player, "money"] call INV_GetItemAmount) < _cost) exitWith {player groupChat localize "STRS_inv_buylicense_nomoney";};
	[player, "money", -_cost] call INV_AddInventoryItem;
	player groupChat format ["You bought a %1 for $%2",_name, _cost];
	INV_LicenseOwner = INV_LicenseOwner + [_license];
	["licenses"] call RG_fnc_iSave;
	["inventory"] call RG_fnc_iSave;

};

bodybag_create = {
	private ["_object","_location","_bag"];
	_object = (_this select 0);
	_location = [(getpos _object select 0),(getpos _object select 1),0];
	_bag = createVehicle ["Body", _location , [], 0, "CAN_COLLIDE"];
	
	[_bag] spawn 
	{
		_bag = _this select 0;
		_bodybagloop = true;
		_time = 0;
		
		while{ _bodybagloop } do 
		{
			_time = _time + 1;
			uisleep 1;
			_message = _time;
				
			if( _time == 900 ) exitWith 
			{
				_bodybagloop = false; 
				deletevehicle _bag;
			};
		};
	};
	
	_bag setDir (getdir (_this select 0));
	//_bag setVariable ["hasOrgans",true,true];
	//_bag setVariable ["hasInvestigated",false,true];
	//_bag setVehicleInit 'this enableSimulation false;'; processInitCommands;
	//_bag setVariable ["hasRetrieved",false,true];
	_bag
};

bodybag_delete_all = {
	
};

bodybag_interact = 
{
	player_interacting = true;
	_bag = (nearestobjects [getpos player, ["Body"],  5] select 0);
	
	if (isNil "_bag") exitWith {player groupChat "Too far away"};
	
	if (isesu) then 
	{
		if ((_bag distance getMarkerpos "spawn_esu" > 20) && (_bag distance getMarkerpos "spawn_esu2" > 20)) exitWith {player groupChat "The body is too far away from the hospital. Take it to the hospital."};
		[player, 10000] call transaction_dynamiccuntflap;
		[player,2] call player_increase_rank;
		player groupChat "You got $10,000 for delivering a body to the morgue.";
		deleteVehicle _bag;
	};
	
	player_interacting = false;
};

bag_dead_body = 
{
	player_interacting = true;
	
	_body = ( nearestObjects[ player, [ "Man" ], 5 ] ) select 1;
	
	if( ( isNil "_body" ) || ( alive _body ) ) exitWith
	{
		player groupChat "The body could not be located";
		player_interacting = false;
	};
	
	[ [], "mp_anim_sync", [ player, "switchmove", "AinvPknlMstpSlayWrflDnon_medic" ] ] call mp_aware_me;
	uiSleep 5;
	
	if( ( isNil "_body" ) || ( alive _body ) ) exitWith
	{
		player groupChat "The body could not be located";
		player_interacting = false;
	};
	
	if( isesu ) then
	{
		player groupChat "You successfully bagged a dead body. Return it to the morgue for a reward!";
	};
	
	if( iscop || isopf ) then
	{
		[ player, 2 ] call player_increase_rank;
		[ player, 5000 ] call transaction_dynamiccuntflap;
		
		player groupChat format[ "You got $5,000 for bagging a body! Call an ESU so they can take the body to the morgue." ];
	};
		
	[ [],"mp_play_sound", [ player, 30, "bodyarmor" ] ] call mp_aware_me;
	[ _body ] call bodybag_create;
	
	deleteVehicle _body;
	player_interacting = false;
};

harvest_dead_body = 
{
	player_interacting = true;
	
	_body = ( nearestObjects[ player, [ "Man" ], 5 ] ) select 1;
	
	if( ( isNil "_body" ) || ( alive _body ) ) exitWith
	{
		player groupChat "The body could not be located";
		player_interacting = false;
	};
	
	if !( _body getVariable "hasOrgans" ) exitWith 
	{
		player groupChat "This body's organs have already been stolen" ;
		player_interacting = false;
	};
		
	_organs = [ "heart","brain","lung","kidney","liver","eye" ];
	_organ = _organs select round random ( count _organs - 1 );
	[ [], "mp_anim_sync", [ player, "switchmove", "AinvPknlMstpSlayWrflDnon_medic" ] ] call mp_aware_me;
		
	uiSleep 5;
		
	[ player, _organ,1 ] call INV_AddInventoryItem;
	player groupChat format[ "You have harvested a %1", _organ ];
	_body setVariable[ "hasOrgans", false, true ];
	
	player_interacting = false;
};