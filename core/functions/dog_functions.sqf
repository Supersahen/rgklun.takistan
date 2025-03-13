dog_buy = {
	animal_type = _this select 1;
	if !(player_rank >= 400 or srt) exitWith {player groupChat "You are not a lieutenant therefore you cannot buy a police k9"};
	_money = [player,"money"] call INV_GetItemAmount;
	if (_money < 100000) exitWith {player groupChat "You dont have enough money";};
	if (dog_bought) exitWith {player groupChat "You can only have one dog";};
	dog_bought = true;
	nameofdog = _this select 0;
	[player, "money", - 100000] call INV_AddInventoryItem;
	
	player groupChat format ["You have purchased a police K9 for $%1",[100000, ","] call format_integer];																					
	_owner_name = name player;
	_owner_unit = player;
	_dog_name = format ["CLAY_tmpDog%1", round (random 1000)];
	
	call compile format ["animal_type createUnit [[(getPos player select 0) + (1 * sin (getDir player)), (getPos player select 1) + (0.3 * cos (getDir player)), 0], group player, 'this setVehicleVarName %1; %1 = this']",_dog_name];
	player_dog = call compile format  ["%1",_dog_name];
	[player_dog] join grpNull;
	player_dog setDir (getdir player);
	
	[] spawn {
		waitUntil {!(alive player_dog)};
		UIsleep 3;
		dog_bought = false;
		deleteVehicle player_dog;
		deleteMarkerLocal "dog_position";
		exit;
	};
	
	[] spawn {
		waitUntil {isNull player_dog};
		UIsleep 3;
		if (isNull player_dog) exitWith {player groupChat "Your dog is now dead however you may buy another one from the shop";};
		deleteMarkerLocal "dog_position";
		dog_bought = false;
		exit;
	};
	
	[nameofdog] spawn dog_track;
	
	player_dog addEventHandler ["Killed", { _this call dog_handle_killed }]; processInitCommands;

	player setVariable ["CLAY_DogUnit", player_dog, true];
	player setVariable ["CLAY_DogName", _dog_name, true];
	player setVariable ["CLAY_DogStatus", "Waiting", true];
	
	player_dog setVariable ["CLAY_OwnerName", _owner_name, true];	
	player_dog setVariable ["CLAY_OwnerUnit", _owner_unit, true];	
	
	dog_array = dog_array + [[player_dog,player]];
	publicVariable "dog_array";
		
		If (isNil "BIS_MENU_GroupCommunication") Then
		{
			BIS_MENU_GroupCommunication = [[localize "STR_SOM_COMMUNICATIONS", false]];
		};

		DOGCTRL_MENU =
		[
			["Dog Control", true],
			["Follow", [2], "", -5, [["expression", "nul = [1] spawn dog_move"]], "1", "1", "\ca\ui\data\cursor_tactical_ca.paa"],
			["Wait", [3], "", -5, [["expression", "nul = [2] spawn dog_move"]], "1", "0"],
			["Move To Pos", [4], "", -5, [["expression", "nul = [3] spawn dog_move"]], "1", "1", "\ca\ui\data\cursor_tactical_ca.paa"],
			["", [], "", -1, [], "0", "0"],
			["Attack Target", [5], "", -5, [["expression", "nul = [cursorTarget] spawn dog_attack"]], "1", "1", "\ca\ui\data\cursor_attack_ca.paa"],
			["Search", [6], "", -5, [["expression", "nul = [cursorTarget] spawn dog_search"]], "1", "1", "\ca\ui\data\cursor_attack_ca.paa"],
			["", [], "", -1, [], "0", "0"],
			["Board Car", [8], "", -5, [["expression", "nul = [1, cursorTarget] spawn dog_vehicle"]], "1", "CursorTarget", "\ca\ui\data\cursor_getin_ca.paa"],
			["Dismount", [9], "", -5, [["expression", "nul = [2] spawn dog_vehicle"]], "1", "0", "\ca\ui\data\icon_board_out_ca.paa"]
		];
		BIS_MENU_GroupCommunication set [7, ["Dog Control", [0], "#USER:DOGCTRL_MENU", -5, [["expression", ""]], "1", "1", "\ca\ui\data\cursor_tactical_ca.paa"]];
};

dog_move = {
	_dog = player_dog;
	switch (_this select 0) do
	{
		case 1:
		{
			_dog stop false;
			(DOGCTRL_MENU select 1) set [6, "0"];
			(DOGCTRL_MENU select 2) set [6, "1"];
			player setVariable ["CLAY_DogStatus", "Following"];
			while {alive _dog && player getVariable "CLAY_DogStatus" == "Following"} do
			{
				_pos = [(getPos player select 0) + (1 * sin (getDir player)), (getPos player select 1) + (0.3 * cos (getDir player)), 0];
				_dog doMove _pos;
				UIsleep 2;
			};
		};
		case 2:
		{
			(DOGCTRL_MENU select 1) set [6, "1"];
			(DOGCTRL_MENU select 2) set [6, "0"];
			player setVariable ["CLAY_DogStatus", "Waiting"];
			_dog stop true;
			UIsleep 2;
			[[], "mp_anim_sync", [_dog,"playmove","Dog_Sit1"]] call mp_aware_me;
		};
		case 3:
		{
			_dog stop false;
			(DOGCTRL_MENU select 1) set [6, "1"];
			(DOGCTRL_MENU select 2) set [6, "1"];
			player setVariable ["CLAY_DogStatus", "Moving"];
			CLAY_DogMoveClick = false;
			If (visibleMap) Then
			{
				onMapSingleClick {_dog = player getVariable "CLAY_DogUnit"; _dog setVariable ["CLAY_DogMovePos", _pos]; CLAY_DogMoveClick = true; onMapSingleClick ""};
			}
			Else
			{
				showCommandingMenu "";
				UIsleep 0.5;
				createDialog "RscMiniMap";
				onMapSingleClick {_dog = player getVariable "CLAY_DogUnit"; _dog setVariable ["CLAY_DogMovePos", _pos]; CLAY_DogMoveClick = true; closeDialog 0; onMapSingleClick ""};
			};
			waitUntil {!(alive _dog) || CLAY_DogMoveClick || player getVariable "CLAY_DogStatus" != "Moving"};
			If (CLAY_DogMoveClick) Then
			{
				_pos = _dog getVariable "CLAY_DogMovePos";
				_marker = createMarkerLocal ["CLAY_DogMoveMarker", _pos];
				_marker setMarkerShapeLocal "ICON";
				_marker setMarkerTypeLocal "selector_selectedMission";
				_marker setMarkerColorLocal "ColorBlue";
				_marker setMarkerSizeLocal [0.5, 0.5];
				while {alive _dog && player getVariable "CLAY_DogStatus" == "Moving"} do
				{
					If (_dog distance _pos <= 5 && player getVariable "CLAY_DogStatus" == "Moving") Then
					{
						(DOGCTRL_MENU select 2) set [6, "1"];
						player setVariable ["CLAY_DogStatus", "Waiting"];
					[[], "mp_anim_sync", [_dog,"playmove","Dog_Sit1"]] call mp_aware_me;
					} Else {
					_dog doMove _pos;
					};
					UIsleep 2;
				};
				
				deleteMarkerLocal "CLAY_DogMoveMarker";
			};
		};
	};
};
dog_actions_remove = {
	if !(dog_actions_active) exitWith {};
	dog_actions_active = false;
};
dog_actions_add = {
	if (dog_actions_active) exitWith {};
	dog_actions_active = true;
};
dog_attack = {
	_target = _this select 0;
	if (isnil "_target") exitWith {};
	if (!(_target isKindOf "Man")) exitwith {};
	player setVariable ["CLAY_DogStatus", "Attacking"];
	
	_sound = createSoundSource ["Sound_BadDog", getpos player_dog, [], 0];
	_sound attachTo [player_dog, [0,0,0]];

	while {alive player_dog && alive _target && player getVariable "CLAY_DogStatus" == "Attacking"} do
	{
		player_dog doMove getPos _target;
		If (player_dog distance _target < 5 && vehicle _target == _target) Then
		{
			player_dog doTarget _target;
			player_dog lookAt _target;
 
			player_dog setVelocity [0, 0, 2.5];
			_time = round random 15;
			_target setHit ["legs", 1];
			_target setHit ["hands", 1];
			_target setDammage 0.8;
			player groupchat "The dog has bitten his target";
			[[], "mp_anim_sync", [_target,"switchmove","AdthPercMstpSrasWrflDnon_8"]] call mp_aware_me;
			[_target, "isstunned", true] call player_set_bool;
			uiSleep _time;
			[_target, "isstunned", false] call player_set_bool;
			[[], "mp_anim_sync", [_target,"switchmove","amovppnemstpsnonwnondnon"]] call mp_aware_me;
			player setVariable ["CLAY_DogStatus", "Waiting",true];
		};
		UIsleep 1;
	};
	deleteVehicle _sound;
};

dog_vehicle = {
	switch (_this select 0) do
	{
		case 1:
		{
			player setVariable ["CLAY_DogStatus", "Boarding"];
			_vehicle = _this select 1;
			If (_vehicle iskindOf "man") exitWith {hint "Invalid Target"};
			If (_vehicle iskindof "all") Then
			{
				_pos = [0,-1.3,-.5];
				_dir = 0;

				while {alive player_dog && player_dog distance _vehicle > 10 && player getVariable "CLAY_DogStatus" == "Boarding"} do
				{
					player_dog doMove getPos _vehicle;
					uiSleep 2;
				};
				If (alive player_dog && player_dog distance _vehicle <= 10 && player getVariable "CLAY_DogStatus" == "Boarding") Then
				{
					player_dog attachTo [_vehicle, _pos];
					player_dog setDir _dir;
					[[], "mp_anim_sync", [player_dog,"switchMove","Dog_Sit1"]] call mp_aware_me;
					player_dog disableAI "ANIM";
					uiSleep 1;
					player setVariable ["CLAY_DogStatus", "InVehicle"];
					player_dog setVariable ["CLAY_DogVehicle", _vehicle];
					(DOGCTRL_MENU select 1) set [6, "0"];
					(DOGCTRL_MENU select 2) set [6, "0"];
					(DOGCTRL_MENU select 3) set [6, "0"];
					(DOGCTRL_MENU select 6) set [6, "0"];
					(DOGCTRL_MENU select 7) set [6, "0"];
					(DOGCTRL_MENU select 9) set [6, "1"];
					(DOGCTRL_MENU select 10) set [6, "1"];
				};
			}
			Else
			{
				Hint "Invalid Vehicle Type!";
				player_dog doMove getPos player_dog;
				uiSleep 1;
				[[], "mp_anim_sync", [player_dog,"playmove","Dog_Sitting"]] call mp_aware_me;
				player setVariable ["CLAY_DogStatus", "Waiting"];
			};
		};
		case 2:
		{
			_vehicle = player_dog getVariable "CLAY_DogVehicle";
			if (isNil "_vehicle") exitWith {player groupChat "Your dog is not in a vehicle"};
			detach player_dog;
			player_dog setPos [(getPos _vehicle select 0) + (-5 * sin (getDir _vehicle)), (getPos _vehicle select 1) + (-5 * cos (getDir _vehicle)), 0.5];
			player_dog setDir (getDir _vehicle + 180);
			player_dog enableAI "ANIM";
			player setVariable ["CLAY_DogStatus", "Waiting",true];
			(DOGCTRL_MENU select 1) set [6, "1"];
			(DOGCTRL_MENU select 3) set [6, "1"];
			(DOGCTRL_MENU select 6) set [6, "1"];
			(DOGCTRL_MENU select 7) set [6, "1"];
			(DOGCTRL_MENU select 9) set [6, "0"];
			(DOGCTRL_MENU select 10) set [6, "1"];
		};
	};
};

dog_search = {
	_target = cursortarget;
	if (isNil "_target") exitWith {};
	if not ([_target] call player_human) exitWith {player groupchat "No Player Selected"};
	player_dog stop false;
	
	while { alive player and alive player_dog and alive _target } do {
		if (player_dog distance _target < 3) exitWith {
			[player, _target] call interact_drug_search_dog;
			player_dog stop true;
		};
		player_dog doMove position _target;
		uiSleep 1;
	};
};
dog_track = {
	_name = _this select 0;
	

	_marker = createMarkerLocal ["dog_position", (getpos player_dog)];
	
	"dog_position" setMarkerShapeLocal "ICON";
	"dog_position" setMarkerTypeLocal "DOT";
	"dog_position" setMarkerColorlocal "ColorRed";
	"dog_position" setMarkerTextlocal _name;
	
	while {alive player_dog and alive player} do {	
		"dog_position" setMarkerPosLocal getpos player_dog;
		uiSleep 1;
	};
};
dog_handle_killed = {
	_unit = _this select 0;
	_killer = _this select 1;
	
	_killer_name = name _killer;
	_owner_name = _unit getVariable "CLAY_OwnerName";
	_killer_side = "";
	if ([_killer] call player_cop) then {_killer_side = "Cop"};
	if ([_killer] call player_opfor) then {_killer_side = "Opfor"};
	if ([_killer] call player_civilian) then {_killer_side = "Civilian"};
	if ([_killer] call player_insurgent) then {_killer_side = "Insurgent"};
	
	_message = format ["(%1 - %2) killed %3 (%4's dog)",_killer_name,_killer_side,nameofdog, _owner_name];
	
	if (([_killer] call player_civilian) or ([_killer] call player_insurgent)) then {
		[player , "(animal-cruelty)",20000] call player_update_warrants;
	};
	[[], "mp_global_chat_message", [_message]] call mp_aware_me;
};

