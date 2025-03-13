#define AdminConsol 1000
#define AdminPlayers 2006

private ["_c", "_player_variable_name", "_player_variable"];

for "_c" from 0 to ((count playerstringarray) - 1) do {
	_player_variable_name = playerstringarray select _c;
	_player_variable = missionNamespace getVariable [_player_variable_name, objNull];  // 	_player_variable = missionNamespace getVariable [_player_variable_name, objNull];

	if ([_player_variable] call player_exists) then { // original [_player_variable] call player_exists

		private["_player_name", "_index"];
		_player_name = (name _player_variable);
		_index = lbAdd [AdminPlayers, format ["%1 - (%2)", _player_variable_name, _player_name]];
		lbSetData [AdminPlayers, _index, format["%1", _player_variable]];

	};
};

refresh_admin_players = {
	lbClear AdminPlayers;
	for "_c" from 0 to ((count playerstringarray) - 1) do {
		_player_variable_name = playerstringarray select _c;
		_player_variable = missionNamespace getVariable [_player_variable_name, objNull];  // 	_player_variable = missionNamespace getVariable [_player_variable_name, objNull];

		if ([_player_variable] call player_exists) then { // original [_player_variable] call player_exists

			private["_player_name", "_index"];
			_player_name = (name _player_variable);
			_index = lbAdd [AdminPlayers, format ["%1 - (%2)", _player_variable_name, _player_name]];
			lbSetData [AdminPlayers, _index, format["%1", _player_variable]];
		};
	};
	systemChat "Players Refreshed";
};


_isAdminInvisible = false;

_array = [];
	if (istsh) then
        {
           _newarray =
           [
			["------TSH Command ------",	{},true],
			["TP TO SAFE ZONE (TOGGLE)", {
				_safezone = (getmarkerpos "adminzone");
				_player = (vehicle player);
				if ((_player distance _safezone) < 200) exitWith {_player setpos location1};
				location1 = (getpos _player);
				_player setpos _safezone;
				player groupChat "You are now safe.";
				_message = format["%1 teleported to the safezone!",(name player)];
				[_message, "TSH"] call mp_log;
			}]
            ];
          _array = _array + _newarray;
        };
    if (isMod || isAdmin || isSnAdmin || isDeveloper) then
        {
           _newarray =
           [
			["------ Commands ------",	{},true],


			["Admin Camera (Select Player)", {
				[_selectedplayer] spawn admin_cam_player;
			},true],
			
			
			["TEMP ESP (SHIFT + SPACE) (30 Sec) ", {
				[] spawn {
					if (esp_loop_toggle) exitWith {};
					_message = format ["%1 used temp esp.",name player];
					[_message, "Admin"] call mp_log;
					player groupChat "TEMP ESP ACTIVATED";
					[] spawn admin_temp_esp_activate;
					
					uiSleep 30;
					player groupChat "TEMP ESP DEACTIVATED";
					esp_loop_toggle = false;
					setGroupIconsVisible [false, false];
				};		
			},true],
			
			
			["Staff Skin (Toggle)", {
				_name = name player;
				if (typeof vehicle player == "USMC_LHD_Crew_Red") exitWith {
					[player , prior_skin,false] call c_change;
					[[], "mp_global_chat_message", [format ["%1 has switched out of the admin skin and is now back in roleplay context.",_name]]] call mp_aware_me;
				};
				_name = name player;
				prior_skin = typeof vehicle player;
				player groupChat format ["%1",prior_skin];
				admin_skin = "USMC_LHD_Crew_Red";
				[player,admin_skin,false] call c_change;
				[player] call reskin_admin;
				[[], "mp_global_chat_message", [format ["%1 has switched into the admin skin and is now out of roleplay context.  Killing him may result in a ban!",_name]]] call mp_aware_me;

			},true],
			["Force player on teamspeak (select)",
			{
				[[_selectedplayer], "mp_start_force_ts", []] call mp_aware_me;
				[[_selectedplayer], "mp_compile_code", ["Invulnerability = true"]] call mp_aware_me;
			},true],
			["Stop force teamspeak (select)",
			{
				[[_selectedplayer], "mp_stop_force_ts", []] call mp_aware_me;
				[[_selectedplayer], "mp_compile_code", ["Invulnerability = false"]] call mp_aware_me;
			},true],

			["Player Info",
			{
				[[_selectedplayer], "mp_playerinfo", [player]] call mp_aware_me;
			},true],			
			
			
			["------ Anti Hack Stuff ------",	{},true],
			
			["Query Players",
			{
				[[], "mp_admin_query", [player]] call mp_aware_me;
			},true],			
			
			["Open Query Menu",
			{
				[] call mp_admin_query_open;
			},true],		
			["Log A Hacking (ask sp3 what this does)",
			{
				if (isNil "hacking") then {hacking = false};
				if (hacking) exitWith {};
				
				hacking = true;
				
				[[],"mp_online_during_hacker",[]] call mp_aware_me;
				
			},true],
			
			["Quarantine ON [USE IF NECESSARY]",
			{
			[[], "mp_compile_code", ["
				if !(isStaff) then {
					previousposition = getpos player;
					player enablesimulation false;
					_baseball = 'baseball' createvehiclelocal (getpos player);
					player attachto [_baseball, [0,1,0]];
					freedom=true;
					Invulnerability=true;
					[] spawn {
						[] spawn{
							while {freedom} do {
								titletext ['The server is now in quarantine mode! Please wait whilst we identify the problem and work to fix the issue. Thank you for your patience.', 'black'];
								uisleep 2;
							 }; 
						 };
						 [] spawn {
							while {freedom} do {
								closedialog 0; 
								uisleep 0.5;
							 }; 
						 };
					};
				};
			"]] call mp_aware_me;
			},true],	
			
			["Quarantine OFF [USE IF NECESSARY]",
			{
				[[], "mp_compile_code", ["
				if !(isStaff) then {
					freedom=false; 
					titletext ['', 'PLAIN DOWN', 0];
					detach player;
					Invulnerability=false;
					player enablesimulation true;
					player setpos previousposition;
				};
				 "]] call mp_aware_me;
			},true],			
		
			["Kick Player to Lobby", {

				format['
            		[] spawn
                    {
                        if (player != %1) exitWith {};

                        player groupChat "You have been kicked to the lobby by a server moderator.";
                        uiSleep 3;
                        failMission "END1";
                    };
                ', _selectedplayer] call broadcast;
            },true],
			["Server Message", {
				[[], "mp_screen_message", [_inputText]] call mp_aware_me;
			},true],

			["Prevent all stat saves", {

				_code = format['statsLoaded = 0;'];
				[[], "mp_compile_code", [_code]] call mp_aware_me;
            },true],
			["Reset Taxes and Laws", {

				LawsArray = DefaultLaws;
				publicVariable "LawsArray";
				[5,5,5,5,5] call interact_president_change_taxes_admin;
            }],

            ["Allow all stat saves", {

				_code = format['statsLoaded = 1;'];
				[[], "mp_compile_code", [_code]] call mp_aware_me;

            },true],
			
			["Bring Bank Menu Up (select)",
			{
				if (_selectedplayer == player) then {
					player groupChat "You cannot activate this command on yourself! Abuser!"; 
					["##ABUSE## This person tried to abuse the bank tool on the admin menu! ##ABUSE##", "Admin"] call mp_log;
				} else {
					[[_selectedplayer], "mp_compile_code", ["[player] call interact_atm_menu"]] call mp_aware_me;
				};
			}],
			["------ Server Management ------",	{}],
			["Declare Martial Law", {
				["An admin has declared martial law"] call server_message;
					martiallaw = true;
					publicVariable "martiallaw";
			}],
			["End Martial Law", {
				["An admin has ended martial law"] call server_message;
					martiallaw = false;
					publicVariable "martiallaw";
			}],
			["Declare Joint Ops", {
				["An admin has declared Joint Ops!"] call server_message;
				
				commanderaccepted = true; 
				publicVariable "commanderaccepted"; 
				
				chiefaccepted = true; 
				publicVariable "chiefaccepted"; 
				
				[] call declare_joint_ops;
			}],
			["End Joint Ops", {
				["An admin has ended Joint Ops! All Cops and Opfor have 5 minutes to return to their respective side of the border!"] call server_message;
				[] call end_joint_ops;
			}],
			
			["Declare War", {
				["An admin has declared war between opfor and blufor!"] call server_message;
					warfare = true;
					publicVariable "warfare";
			}],
			["End War", {
				["An admin has ended the war!"] call server_message;
					warfare = false;
					publicVariable "warfare";
			}],

			["------ World Commands ------",	{}],

			["Weapongedon", {
				_distance = parseNumber(_inputText);

				if ((typeName _distance) == (typeName (1234))) then {

					if (_distance > 8000) exitwith{player groupchat format["Range must be 8000 or less"];};

						player groupchat format["Starting Weapongedon at a range of %1 meters", _distance];
						{
							{
								if ({alive _x} count crew _x == 0) then {deleteVehicle _x;};
							} foreach((getpos player) nearObjects [_x, _distance]);
						} forEach (droppableitems + ["WeaponHolder","Bag_Base_EP1","WeaponHolderBase"]);
				}
				else {hint "ERROR: expected number";};
			}],
			["Carmagedon", {
				_distance = parseNumber(_inputText);

				if ((typeName _distance) == (typeName (1234))) then {

					if (_distance > 8000) exitwith{player groupchat format["Range must be 8000 or less"];};

						player groupchat format["Starting Carmagedon at a range of %1 meters", _distance];
						{
							{
								if ({alive _x} count crew _x == 0) then {deleteVehicle _x;};
							} foreach((getpos player) nearObjects [_x, _distance]);
						} forEach (droppableitems + ["LandVehicle", "Air", "Car", "Motorcycle", "Bicycle", "UAV", "Wreck_Base", "HelicopterWreck", "UH1Wreck", "UH1_Base", "UH1H_base", "AH6_Base_EP1","CraterLong", "Ka60_Base_PMC", "Ka137_Base_PMC", "A10"]);
					}
					else {
						hint "ERROR: expected number";
					};
			}],			
			
			["Bodybaggedon", {
				_distance = 20000;
				player groupchat format["Starting Bodybaggedon at a range of %1 meters", _distance];
				{
					deleteVehicle _x;
				} foreach ((getpos player) nearObjects ["Body", _distance]);

			}],
			
			["World Tree Fix / Building Repair", {

				_range = 100000;
				{
					if ((typeOf _x == "") && (damage _x > 0)) then
					{
						_x setdamage 0;
					};

				} forEach (nearestObjects [player,[], _range]);
			},true],
			["AUTO Carmagedon (5 Minutes + Warnings)", {
				execvm "Scripts\auto_carmagedon.sqf";
			},true],

			["------ Comp Commands ------",	{},true],
			["Give Player Money (Select)", {
				private["_variableName"];
				_variableName = (vehicleVarName _selectedplayer);
				if (isNil "_variableName") exitWith{};
				if (_variableName == "") exitWith {};
				_amount = parseNumber(_inputText);

				if ((typeName _amount) == (typeName (1234))) then
				{
					hint format["Giving player %1 %2 shekels", _variableName, _amount];
					format['
						[] spawn
						{
							if (player != %1) exitWith {};

							[player, %2] call transaction_dynamiccuntflap;
							player groupChat "A Server Administrator has sent you %2 shekels";
						};
					', _selectedplayer, _amount] call broadcast;
					_message = format["%1 comped %2 $%3",(name player),name _selectedplayer,_amount];
					[_message, "Admin"] call mp_log;

				}
				else
				{
					hint "ERROR: expected number";
				};
			},true],
			["Server Wide Comp", {
				_amount = parseNumber(_inputText);

				if ((typeName _amount) == (typeName (1234))) then
				{
					hint format["Giving all players %1 shekels", _amount];
					format['
						[] spawn
						{

							[player, %1] call transaction_dynamiccuntflap;
							player groupChat "A Server Administrator has sent you %1 shekels";
						};
					', _amount] call broadcast;
					_message = format["%1 gave %2 $%3",(name player),name _selectedplayer,_amount];
					[_message, "Admin"] call mp_log;
				}
				else
				{
					hint "ERROR: expected number";
				};
			}],
			["TP TO SAFE ZONE (TOGGLE)", {
				_safezone = (getmarkerpos "adminzone");
				_player = (vehicle player);
				if ((_player distance _safezone) < 200) exitWith {_player setpos location1};
				location1 = (getpos _player);
				_player setpos _safezone;
				player groupChat "You are now safe.";
			},true],
			["Delete Target", {
				_target = cursortarget;
				_var = _target getVariable ["nodelete",false];
				if not(_var) then {
					deleteVehicle cursorTarget;
				};
			}]
            ];
          _array = _array + _newarray;
        };

    if (isSnAdmin || isDeveloper) then
        {
           _newarray =
           [
		   ["------ Teleport Commands ------",	{}],
			["Self Teleport", {
				hint "Click on the map to Teleport!";
				closeDialog 0;
				openMap true;
				onMapSingleClick "
				onMapSingleClick """";
				[] spawn {
				_PS = '#particlesource' createVehicle getpos player;
				_PS setParticleCircle [0, [0, 0, 0]];
				_PS setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				_PS setParticleParams [['\ca\data\blesk1', 1, 0, 1], '', 'SpaceObject', 1, 3, [0, 0, 0], [0, 0, 0.75], 0, 2, 2, 0, [0.01], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, '', '', ''];
				_PS setDropInterval 0.05;	
				_PS2 = '#particlesource' createVehicle getpos player;
				_PS2 setParticleCircle [0, [0, 0, 0]];
				_PS2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				_PS2 setParticleParams [['\ca\data\blesk1', 1, 0, 1], '', 'SpaceObject', 1, 3, [0, 0, 0], [0, 0, 0.75], 0, 2, 2, 0, [0.01], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, '', '', PLAYER];
				_PS2 setDropInterval 0.05;
				_PS2 attachTo [player, [0,0,0]];
				openMap false;
				uisleep 0.1;
				deletevehicle _PS;
				deletevehicle _PS2;
				};
				(vehicle player) setpos [_pos select 0, _pos select 1, 0];
				openMap false;				
				";
				_message = format["Self Teleport command used by %1.", name player];
				[_message, "Admin"] call mp_log;
			},true],
			["Self Teleport (Discrete)", {
				hint "Click on the map to Teleport!";
				closeDialog 0;
				openMap true;
				onMapSingleClick "
				onMapSingleClick """";
				(vehicle player) setpos [_pos select 0, _pos select 1, 0];
				openMap false;				
				";
				_message = format["Self Teleport command used by %1.", name player];
				[_message, "Admin"] call mp_log;
			}],
			["Teleport Player to Me", {
				_selectedplayer setpos (getpos player);
			},true]
			];
			 _array = _array + _newarray;
        };
    if (isAdmin) then
        {
           _newarray =
           [
		   ["------ Teleport Commands ------",	{}],
			["Self Teleport", {
				hint "Click on the map to Teleport!";
				closeDialog 0;
				openMap true;
				onMapSingleClick "
				onMapSingleClick """";
				[] spawn {
				_PS = '#particlesource' createVehicle getpos player;
				_PS setParticleCircle [0, [0, 0, 0]];
				_PS setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				_PS setParticleParams [['\ca\data\blesk1', 1, 0, 1], '', 'SpaceObject', 1, 3, [0, 0, 0], [0, 0, 0.75], 0, 2, 2, 0, [0.01], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, '', '', ''];
				_PS setDropInterval 0.05;	
				_PS2 = '#particlesource' createVehicle getpos player;
				_PS2 setParticleCircle [0, [0, 0, 0]];
				_PS2 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				_PS2 setParticleParams [['\ca\data\blesk1', 1, 0, 1], '', 'SpaceObject', 1, 3, [0, 0, 0], [0, 0, 0.75], 0, 2, 2, 0, [0.01], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, '', '', PLAYER];
				_PS2 setDropInterval 0.05;
				_PS2 attachTo [player, [0,0,0]];
				openMap false;
				uisleep 0.1;
				deletevehicle _PS;
				deletevehicle _PS2;
				};
				(vehicle player) setpos [_pos select 0, _pos select 1, 0];
				openMap false;				
				";
				_message = format["Self Teleport command used by %1.", name player];
				[_message, "Admin"] call mp_log;
			}],
			["Teleport Player to Me", {
				_selectedplayer setpos (getpos player);
			}]
        ];

          _array = _array + _newarray;
        };
		
    if (isAdmin || isSnAdmin || isDeveloper) then
        {
           _newarray =
           [
			["----- Admin Commands -----",	{},true],
			["Derank Player",	{
			
				[[_selectedplayer], "mp_player_derank", [_selectedplayer]] call mp_aware_me;
				player groupChat format ["You have deranked %1",name _selectedplayer];
			}],
			["Skip Respawn", {
					_cam = "Camera" camCreate (position player);
					_cam cameraEffect ["internal", "front"];
					uiSleep 1;
					skip_respawn = true;
					_cam cameraEffect ["terminate", "front"];
					camDestroy _cam;
			}],
			["----- Blacklist Commands -----",	{}],

			["Blacklist from Cop (select)", {
				[[_selectedplayer],"player_blacklist_update",["cop"]] call mp_aware_me;
				player groupChat format ["You blacklisted %1 from blufor",name _selectedplayer];
				
			},true],
			["Blacklist from Opfor (select)", {
				[[_selectedplayer],"player_blacklist_update",["opfor"]] call mp_aware_me;
				player groupChat format ["You blacklisted %1 from opfor",name _selectedplayer];
			},true],

			["------ Player Commands ------",	{}],
			["Remove player weapons", {
				format['
					[] spawn
					{
						if (player != %1) exitWith {};

						removeAllWeapons player;
					};
				', _selectedplayer] call broadcast;
			}],
			["Check Player Inventory", {
				closedialog 0;
				[player, _selectedplayer] call interact_check_inventory_admin;
			}],
			["Kill player", {
				_selectedplayer setDamage 1;
			}],
			["Destroy player vehicle", {
				(vehicle _selectedplayer) setDamage 1;
			}],
			["Admin Jail Player", {
				_jailminutes = parseNumber(_inputText);

				if (_jailminutes > 60) exitwith {player groupChat format["This value must be 60 minutes or lower"];};

				if ((typeName _jailminutes) == (typeName (1234))) then {

					format['server globalChat"%1 was sent to jail for %2 minute(s) by a server administrator";', _selectedplayer, _jailminutes] call broadcast;
					format['[%1, %2] call player_prison_time;', _selectedplayer, _jailminutes] call broadcast;
					format['[%1, 100] call player_prison_bail;', _selectedplayer] call broadcast;
					format['[%1,%1] call player_prison_convict;', _selectedplayer] call broadcast;
					}
				else {
					hint "ERROR: expected number";
				};
			}],

			["------ Other Commands ------",	{}],
			["Fix My Vehicle", {
				vehicle player setFuel 1;
				vehicle player setvehicleammo 1;
				vehicle player setDamage 0;
			}],
			["Speed 5 - Nitro Vehicle", {
				_veh = vehicle player;
				_veh setvariable ["tuning", 5, true];
				_veh setvariable ["nitro", 1, true];
			}],
			["Heal World", {
				_objs = (position (vehicle player) nearObjects 100000); {_x setDamage 0} forEach _objs;
				(format ["titleText [""%1 has just performed a worldwide repair/heal!"", ""PLAIN DOWN""];",name player]) call broadcast
			},true],
			["----- ITEMS -----",	{}],
			["1 Lockpick", {
				[player, 'lockpick',1] call INV_AddInventoryItem;
			}],
			["1 Ziptie", {
				[player, 'ziptie',1] call INV_AddInventoryItem;
			}],
			["1 Medkit", {
				[player, 'medkit',1] call INV_AddInventoryItem;
			}],
			["1 Repair Kit", {
				[player, 'repairkit',1] call INV_AddInventoryItem;
			}],
			["1 Refuel Cans", {
				[player, 'kanister',1] call INV_AddInventoryItem;
			}],
			["Pistol", {
				{player addMagazine "17Rnd_9x19_glock17";} forEach [1,2,3,4,5,6,7,8];
				player addweapon "glock17_EP1";
				player action ["switchweapon", player, player, 0];
			}],
			["RangeFinder", {
				player addweapon "binocular_vector";
				player action ["switchweapon", player, player, 0];
			}]
        ];

          _array = _array + _newarray;
        };
    if (isSnAdmin || isDeveloper) then
        {
           _newarray =
           [

		   	["----- SnAdmin Commands -----",	{}],
			["Invulnerability (ON)", {
				invulnerability = true;
				player groupChat "Invulnerability (ON)";
			},true],
			["Invulnerability (OFF)", {
				invulnerability = false;
				player groupChat "Invulnerability (OFF)";
			},true],

			["Toggle Invisibility (On)", {
				objMYPlayer = (vehicle player);
		        publicVariable "objMYPlayer";
		        strExecCode = 'objMYPlayer hideObject true;';
		        player setVehicleInit strExecCode;
		        processInitCommands;
		        clearVehicleInit player;
		        strExecCode = nil;
		        player groupChat "You are now Invisible";
			},true],

			["Toggle Invisibility (Off)", {
				objMYPlayer = (vehicle player);
		        publicVariable "objMYPlayer";
		        strExecCode = 'objMYPlayer hideObject false;';
		        player setVehicleInit strExecCode;
		        processInitCommands;
		        clearVehicleInit player;
		        strExecCode = nil;
		        player groupChat "You are no longer Invisible";
		    },true],

			["Enter Targets Vehicle", {
				_vcl = (vehicle _selectedplayer);
				player moveInCargo _vcl;
				player groupChat "You have entered the targets vehicle";
			},true]
           ];
          _array = _array + _newarray;
        };

    if (isDeveloper) then
        {
           _newarray =
           [
		    ["------- Dev Commands -------",	{}],

			["Add 100,000 Dollars to Inventory", {
				[player, 'money',100000] call INV_AddInventoryItem;
			}],			
			
			["Add 1,000,000 Dollars to Inventory", {
				[player, 'money',1000000] call INV_AddInventoryItem;
			},true],
			["10 Satchels", {
					player addMagazine "pipebomb";
					player addMagazine "pipebomb";
					player addMagazine "pipebomb";
					player addMagazine "pipebomb";
					player addMagazine "pipebomb";
					player addMagazine "pipebomb";
					player addMagazine "pipebomb";
					player addMagazine "pipebomb";
					player addMagazine "pipebomb";
					player addMagazine "pipebomb";
			}],
			["Spawn Vehicle (Class Based)", {
				_vehicle = _inputtext createVehicle [(getpos player select 0) + 0, (getpos player select 1) + 0, getpos player select 2];
				_vehicle setVariable ["isPlayerVehicle", true, true];
				_message = format["%1 has used an Admin command to spawn a %2", name player, _inputtext];
				[_message, "Admin"] call mp_log;
			}],
			["Spawn Weapon (Class Based)", {
				player addWeapon _inputtext;
				_message = format["%1 has used an Admin command to spawn a %2", name player, _inputtext];
				[_message, "Admin"] call mp_log;
			}],
			["Spawn Magazine (Class Based)", {
				player addMagazine _inputtext;
				_message = format["%1 has used an Admin command to spawn a %2", name player, _inputtext];
				[_message, "Admin"] call mp_log;
			}],
			["Spawn Item (CLASS)", {
				[player, _inputtext,1] call INV_AddInventoryItem;
				_message = format["%1 has used an Admin command to spawn a %2", name player, _inputtext];
				[_message, "Admin"] call mp_log;
			}],
			["Create Moveable Object", {
				_obj =_inputtext createVehicle [(getpos player select 0) + 0, (getpos player select 1) + 0, getpos player select 2];
				_obj addAction [("<t color=""#dddd00"">" + STR_R3F_LOG_action_deplacer_objet + "</t>"), "Awesome\R3F\R3F_LOG\objet_deplacable\deplacer.sqf", nil, 3, false, true, "", ""];
			}],
			["Get My Pos", {
				Array = getPos player;
				dir = getDir player;
				x = Array  select 0;
				y = Array select 1;
				z = Array select 2;
				player groupchat format ['X: %1 Y: %2 Z: %3 DIR: %4',x,y,z,dir];
			}],
			["Custom Command (Menu)", {
				[] call dev_console_open
			},true],
			["Speed 7 - Nitro", {
				_veh = vehicle player;
				_veh setvariable ["tuning", 7, true];
				_veh setvariable ["nitro", 1, true];
			}],			
			["Warp Drive", {
				_veh = vehicle player;
				_veh setvariable ["tuning", 9, true];
				_veh setvariable ["nitro", 1, true];
			}],
			["Get Keys", {
				_vehicle  = [10] call INV_LocateClosestVehicle;
				[player, _vehicle] call vehicle_add;
			},true],
			
			["ESP(On)", {
				_blu = [0,0,1,1];
				_red = [1,0,0,1];
				_green = [0,1,0,1];
				_white = [1,1,1,1];

				setGroupIconsVisible [true, true];
				esp_loop_toggle = true;
				while {esp_loop_toggle} do
				{
					{
						clearGroupIcons group _x;
						if ((alive _x) and (player != _x)) then
						{
							_color = [];
							if (side _x == west) then {_color = _blu;};
							if (side _x == east) then {_color = _red;};
							if (side _x == civilian) then {_color = _white;};
							if (side _x == resistance) then {_color = _green;};

							group _x addGroupIcon ["x_art"];
							group _x setGroupIconParams [_color, format ["[%1]-[%2m]",name _x,round(_x distance player)], 1, true];
						};
					} foreach (playableunits);
					uiSleep 0.2;
				};
			},true],
			["ESP(Off)", {
				esp_loop_toggle = false;
				setGroupIconsVisible [false, false];
			},true],
			
			["Remove Own Staff Perks (30 Secs)", {
				[] spawn { 
				isstaff=false; 
				isStaff=false; 
				player groupchat "staff gone";
				UIsleep 30; 
				isstaff=true; 
				isStaff=true;
				player groupchat "staff back"; };
			}],
			
			["Unjail", {
				[player, getPos player] call player_prison_release;
				[player] call player_reset_prison;
			}],
			["Purge On", {
				_code = format['statsLoaded = 0;'];
				[[], "mp_compile_code", [_code]] call mp_aware_me;
				UIsleep 1;
				[[], "mp_screen_message", ['An Admin Has Initiated The Purge! In This Period There Is No Rules! You Will Receive Money During The Purge! Purge Starts In 5 Minutes!']] call mp_aware_me;
				UIsleep 1;
				[[], "mp_screen_message", ['An Admin Has Initiated The Purge! In This Period There Is No Rules! You Will Receive Money During The Purge! Purge Starts In 5 Minutes!']] call mp_aware_me;
				UIsleep 1;
				[[], "mp_screen_message", ['An Admin Has Initiated The Purge! In This Period There Is No Rules! You Will Receive Money During The Purge! Purge Starts In 5 Minutes!']] call mp_aware_me;
				UIsleep 1;
				[[], "mp_screen_message", ['An Admin Has Initiated The Purge! In This Period There Is No Rules! You Will Receive Money During The Purge! Purge Starts In 5 Minutes!']] call mp_aware_me;
				UIsleep 1;
				[[], "mp_screen_message", ['An Admin Has Initiated The Purge! In This Period There Is No Rules! You Will Receive Money During The Purge! Purge Starts In 5 Minutes!']] call mp_aware_me;
				UIsleep 300;
				[[], "mp_screen_message", ['The Purge Starts Now! Have Fun!']] call mp_aware_me;
				UIsleep 1;
				[[], "mp_screen_message", ['The Purge Starts Now! Have Fun!']] call mp_aware_me;
				UIsleep 1;
				[[], "mp_screen_message", ['The Purge Starts Now! Have Fun!']] call mp_aware_me;
				UIsleep 1;
				[[], "mp_screen_message", ['The Purge Starts Now! Have Fun!']] call mp_aware_me;
				Purge = true;
				money_limit              = 500000000;
				bank_limit               = 500000000;
				publicVariable "money_limit";
				publicVariable "bank_limit";
				while {Purge} do {
								_amount = 499000000;

						format['
							[] spawn
							{

								[player, %1] call transaction_dynamiccuntflap;
							};
						', _amount] call broadcast;
				UIsleep 60;
				
				};
			}],
			
			["Purge Off", {
				money_limit              = 500000000;
				bank_limit               = 500000000;
				publicVariable "money_limit";
				publicVariable "bank_limit";
				Purge = false;
				_code = format['statsLoaded = 1;'];
				[[], "mp_compile_code", [_code]] call mp_aware_me;
			}],
			
			["Jim Abuse USE IN VEHICLE", {
				(vehicle player) addweapon "gau8";
				(vehicle player) addmagazine "1350Rnd_30mmAP_A10";
				(vehicle player) addmagazine "1350Rnd_30mmAP_A10";
				(vehicle player) addmagazine "1350Rnd_30mmAP_A10";
				(vehicle player) addmagazine "1350Rnd_30mmAP_A10";
				(vehicle player) addmagazine "1350Rnd_30mmAP_A10";
				(vehicle player) addmagazine "1350Rnd_30mmAP_A10";
				(vehicle player) addmagazine "1350Rnd_30mmAP_A10";
				(vehicle player) addmagazine "1350Rnd_30mmAP_A10";
				(vehicle player) addmagazine "1350Rnd_30mmAP_A10";
				(vehicle player) addmagazine "1350Rnd_30mmAP_A10";
			}],
			["Weapon: VSS-Vintorez", {
				{player addMagazine "20Rnd_9x39_SP5_VSS";} forEach [1,2,3,4,5,6,7,8];
				player addweapon "VSS_vintorez";
				player action ["switchweapon", player, player, 0];
			}]
		];
          _array = _array + _newarray;
        };

lbClear AdminConsol;

{
	private["_text", "_code", "_index"];
	_text = _x select 0;
	_code = _x select 1;
	_list = _x select 2;
	
	
	if (isNil "_list" ) then {
		_list = false;
	};
	
	if (admin_menu_filter) then {
		if (_list) then {
			_index = lbAdd [AdminConsol, _text];
			lbSetData [AdminConsol, _index, format['call %1', _code]];
		};
	} else {
		_index = lbAdd [AdminConsol, _text];
		lbSetData [AdminConsol, _index, format['call %1', _code]];
	};
	
} forEach _array;