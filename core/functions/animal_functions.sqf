Pet_buy = {
	animal_type = _this select 1;
	_money = [player,"money"] call INV_GetItemAmount;
	if (_money < 100000) exitWith {player groupChat "You dont have enough money";};
	if (Pet_bought) exitWith {player groupChat "You can only have one Pet";};
	Pet_bought = true;
	nameofPet = _this select 0;
	[player, "money", - 100000] call INV_AddInventoryItem;
	
	player groupChat format ["You have purchased a pet for $%1",[100000, ","] call format_integer];																					
	_owner_name = name player;
	_owner_unit = player;
	_Pet_name = format ["CLAY_tmpPet%1", round (random 1000)];
	
	call compile format ["animal_type createUnit [[(getPos player select 0) + (1 * sin (getDir player)), (getPos player select 1) + (0.3 * cos (getDir player)), 0], group player, 'this setVehicleVarName %1; %1 = this']",_Pet_name];
	player_Pet = call compile format  ["%1",_Pet_name];
	[player_Pet] join grpNull;
	player_Pet setDir (getdir player);
	
	[] spawn {
		waitUntil {!(alive player_Pet)};
		UIsleep 3;
		Pet_bought = false;
		deleteVehicle player_Pet;
		deleteMarkerLocal "Pet_position";
		exit;
	};
	
	[] spawn {
		waitUntil {isNull player_Pet};
		UIsleep 3;
		if (isNull player_Pet) exitWith {player groupChat "Your Pet is now dead however you may buy another one from the shop";};
		deleteMarkerLocal "Pet_position";
		Pet_bought = false;
		exit;
	};
	
	[nameofPet] spawn Pet_track;
	
	player_Pet addEventHandler ["Killed", { _this call Pet_handle_killed }]; processInitCommands;

	player setVariable ["CLAY_PetUnit", player_Pet, true];
	player setVariable ["CLAY_PetName", _Pet_name, true];
	player setVariable ["CLAY_PetStatus", "Waiting", true];
	
	player_Pet setVariable ["CLAY_OwnerName", _owner_name, true];	
	player_Pet setVariable ["CLAY_OwnerUnit", _owner_unit, true];	
	
	Petsarray = Petsarray + [player_Pet];
	publicVariable "Petsarray";
		
		If (isNil "BIS_MENU_GroupCommunication") Then
		{
			BIS_MENU_GroupCommunication = [[localize "STR_SOM_COMMUNICATIONS", false]];
		};
		
			PetCTRL_MENU =
		[
			["Pet Control", true],
			["Follow", [2], "", -5, [["expression", "nul = [1] spawn Pet_move"]], "1", "1", "\ca\ui\data\cursor_tactical_ca.paa"],
			["Wait", [3], "", -5, [["expression", "nul = [2] spawn Pet_move"]], "1", "0"],
			["Move To Pos", [4], "", -5, [["expression", "nul = [3] spawn Pet_move"]], "1", "0", "\ca\ui\data\cursor_tactical_ca.paa"],
			["", [], "", -1, [], "0", "0"],
			["Attack Target", [5], "", -5, [["expression", "nul = [cursorTarget] spawn Pet_attack"]], "1", "0", "\ca\ui\data\cursor_attack_ca.paa"],
			["", [], "", -1, [], "0", "0"],
			["Board Car", [8], "", -5, [["expression", "nul = [1, cursorTarget] spawn Pet_vehicle"]], "1", "CursorTarget", "\ca\ui\data\cursor_getin_ca.paa"],
			["Dismount", [9], "", -5, [["expression", "nul = [2] spawn Pet_vehicle"]], "1", "0", "\ca\ui\data\icon_board_out_ca.paa"]
		];
		BIS_MENU_GroupCommunication set [7, ["Pet Control", [0], "#USER:PetCTRL_MENU", -5, [["expression", ""]], "1", "1", "\ca\ui\data\cursor_tactical_ca.paa"]];
};

Pet_move = {
	_Pet = player_Pet;
	switch (_this select 0) do
	{
		case 1:
		{
			_Pet stop false;
			(PetCTRL_MENU select 1) set [6, "0"];
			(PetCTRL_MENU select 2) set [6, "1"];
			player setVariable ["CLAY_PetStatus", "Following"];
			while {alive _Pet && player getVariable "CLAY_PetStatus" == "Following"} do
			{
				_pos = [(getPos player select 0) + (1 * sin (getDir player)), (getPos player select 1) + (0.3 * cos (getDir player)), 0];
				_Pet doMove _pos;
				UIsleep 2;
			};
		};
		case 2:
		{
			(PetCTRL_MENU select 1) set [6, "1"];
			(PetCTRL_MENU select 2) set [6, "0"];
			player setVariable ["CLAY_PetStatus", "Waiting"];
			_Pet stop true;
			UIsleep 2;
			[[], "mp_anim_sync", [_Pet,"playmove","Dog_Sit1"]] call mp_aware_me;
		};
		case 3:
		{
			_Pet stop false;
			(PetCTRL_MENU select 1) set [6, "1"];
			(PetCTRL_MENU select 2) set [6, "1"];
			player setVariable ["CLAY_PetStatus", "Moving"];
			CLAY_PetMoveClick = false;
			If (visibleMap) Then
			{
				onMapSingleClick {_Pet = player getVariable "CLAY_PetUnit"; _Pet setVariable ["CLAY_PetMovePos", _pos]; CLAY_PetMoveClick = true; onMapSingleClick ""};
			}
			Else
			{
				showCommandingMenu "";
				UIsleep 0.5;
				createDialog "RscMiniMap";
				onMapSingleClick {_Pet = player getVariable "CLAY_PetUnit"; _Pet setVariable ["CLAY_PetMovePos", _pos]; CLAY_PetMoveClick = true; closeDialog 0; onMapSingleClick ""};
			};
			waitUntil {!(alive _Pet) || CLAY_PetMoveClick || player getVariable "CLAY_PetStatus" != "Moving"};
			If (CLAY_PetMoveClick) Then
			{
				_pos = _Pet getVariable "CLAY_PetMovePos";
				_marker = createMarkerLocal ["CLAY_PetMoveMarker", _pos];
				_marker setMarkerShapeLocal "ICON";
				_marker setMarkerTypeLocal "selector_selectedMission";
				_marker setMarkerColorLocal "ColorBlue";
				_marker setMarkerSizeLocal [0.5, 0.5];
				while {alive _Pet && player getVariable "CLAY_PetStatus" == "Moving"} do
				{
					If (_Pet distance _pos <= 5 && player getVariable "CLAY_PetStatus" == "Moving") Then
					{
						(PetCTRL_MENU select 2) set [6, "1"];
						player setVariable ["CLAY_PetStatus", "Waiting"];
					[[], "mp_anim_sync", [_Pet,"playmove","Pet_Sit1"]] call mp_aware_me;
					} Else {
					_Pet doMove _pos;
					};
					UIsleep 2;
				};
				
				deleteMarkerLocal "CLAY_PetMoveMarker";
			};
		};
	};
};
Pet_attack = {
	_target = _this select 0;
	if (isnil "_target") exitWith {};
	player setVariable ["CLAY_PetStatus", "Attacking"];
	
	_sound = createSoundSource ["Sound_Baddog", getpos player_Pet, [], 0];
	_sound attachTo [player_Pet, [0,0,0]];

	while {alive player_Pet && alive _target && player getVariable "CLAY_PetStatus" == "Attacking"} do
	{
		player_Pet doMove getPos _target;
		If (player_Pet distance _target < 5 && vehicle _target == _target) Then
		{
			player_Pet doTarget _target;
			player_Pet lookAt _target;
 
			player_Pet setVelocity [0, 0, 2.5];
			_time = round random 15;
			_target setHit ["legs", 1];
			_target setHit ["hands", 1];
			_target setDammage 0.8;
			player groupchat "The Pet has bitten his target";
			[[], "mp_anim_sync", [_target,"switchmove","AdthPercMstpSrasWrflDnon_8"]] call mp_aware_me;
			[_target, "isstunned", true] call player_set_bool;
			uiSleep _time;
			[_target, "isstunned", false] call player_set_bool;
			[[], "mp_anim_sync", [_target,"switchmove","amovppnemstpsnonwnondnon"]] call mp_aware_me;
			player setVariable ["CLAY_PetStatus", "Waiting",true];
		};
		UIsleep 1;
	};
	deleteVehicle _sound;
};

Pet_vehicle = {
	switch (_this select 0) do
	{
		case 1:
		{
			player setVariable ["CLAY_PetStatus", "Boarding"];
			_vehicle = _this select 1;
			If (_vehicle iskindof "all") Then
			{
				_pos = [0,-1.3,-.5];
				_dir = 0;

				while {alive player_Pet && player_Pet distance _vehicle > 10 && player getVariable "CLAY_PetStatus" == "Boarding"} do
				{
					player_Pet doMove getPos _vehicle;
					uiSleep 2;
				};
				If (alive player_Pet && player_Pet distance _vehicle <= 10 && player getVariable "CLAY_PetStatus" == "Boarding") Then
				{
					player_Pet attachTo [_vehicle, _pos];
					player_Pet setDir _dir;
					[[], "mp_anim_sync", [player_Pet,"switchMove","Pet_Sit1"]] call mp_aware_me;
					player_Pet disableAI "ANIM";
					uiSleep 1;
					player setVariable ["CLAY_PetStatus", "InVehicle"];
					player_Pet setVariable ["CLAY_PetVehicle", _vehicle];
					(PetCTRL_MENU select 1) set [6, "0"];
					(PetCTRL_MENU select 2) set [6, "0"];
					(PetCTRL_MENU select 3) set [6, "0"];
					(PetCTRL_MENU select 6) set [6, "0"];
					(PetCTRL_MENU select 7) set [6, "0"];
					(PetCTRL_MENU select 9) set [6, "1"];
					(PetCTRL_MENU select 10) set [6, "1"];
				};
			}
			Else
			{
				Hint "Invalid Vehicle Type!";
				player_Pet doMove getPos player_Pet;
				uiSleep 1;
				[[], "mp_anim_sync", [player_Pet,"playmove","Pet_Sitting"]] call mp_aware_me;
				player setVariable ["CLAY_PetStatus", "Waiting"];
			};
		};
		case 2:
		{
			_vehicle = player_Pet getVariable "CLAY_PetVehicle";
			detach player_Pet;
			player_Pet setPos [(getPos _vehicle select 0) + (-5 * sin (getDir _vehicle)), (getPos _vehicle select 1) + (-5 * cos (getDir _vehicle)), 0.5];
			player_Pet setDir (getDir _vehicle + 180);
			player_Pet enableAI "ANIM";
			player setVariable ["CLAY_PetStatus", "Waiting",true];
			(PetCTRL_MENU select 1) set [6, "1"];
			(PetCTRL_MENU select 3) set [6, "1"];
			(PetCTRL_MENU select 6) set [6, "1"];
			(PetCTRL_MENU select 7) set [6, "1"];
			(PetCTRL_MENU select 9) set [6, "0"];
			(PetCTRL_MENU select 10) set [6, "1"];
		};
	};
};

Pet_search = {
	_target = cursortarget;
	if (isNil "_target") exitWith {};
	if not ([_target] call player_human) exitWith {player groupchat "No Player Selected"};
	player_Pet stop false;
	
	while { alive player and alive player_Pet and alive _target } do {
		if (player_Pet distance _target < 3) exitWith {
			[player, _target] call interact_drug_search_Pet;
			player_Pet stop true;
		};
		player_Pet doMove position _target;
		uiSleep 1;
	};
};
Pet_track = {
	_name = _this select 0;
	

	_marker = createMarkerLocal ["Pet_position", (getpos player_Pet)];
	
	"Pet_position" setMarkerShapeLocal "ICON";
	"Pet_position" setMarkerTypeLocal "DOT";
	"Pet_position" setMarkerColorlocal "ColorRed";
	"Pet_position" setMarkerTextlocal _name;
	
	while {alive player_Pet and alive player} do {	
		"Pet_position" setMarkerPosLocal getpos player_Pet;
		uiSleep 1;
	};
};
Pet_handle_killed = {
	_unit = _this select 0;
	_killer = _this select 1;
	
	_killer_name = name _killer;
	_owner_name = _unit getVariable "CLAY_OwnerName";
	_killer_side = "";
	if ([_killer] call player_cop) then {_killer_side = "Cop"};
	if ([_killer] call player_opfor) then {_killer_side = "Opfor"};
	if ([_killer] call player_civilian) then {_killer_side = "Civilian"};
	if ([_killer] call player_insurgent) then {_killer_side = "Insurgent"};
	
	_message = format ["(%1 - %2) killed %3 (%4's Pet)",_killer_name,_killer_side,nameofPet, _owner_name];
	
	if (([_killer] call player_civilian) or ([_killer] call player_insurgent)) then {
		[player , "(animal-cruelty)",20000] call player_update_warrants;
	};
	[[], "mp_global_chat_message", [_message]] call mp_aware_me;
};

