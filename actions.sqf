if(A_running) exitwith {};
A_running = true;

private["player"];
_side = side player;
_is_civ = isciv;
_is_cop = iscop;
_is_ins = isins;
_is_opf = isopf;

_faction = nil;

_uid = getplayeruid player;


if (_is_civ) then {_faction = "civilian"};
if (_is_cop) then {_faction = "cop"};
if (_is_ins) then {_faction = "ins"};
if (_is_opf) then {_faction = "opfor"};

phone_action = player addaction ["<t color='#3d74ff'>RG Phone</t>","noscript.sqf","[] call phone_open",1,false,true,"",'(([player,"handy"] call INV_GetItemAmount) > 0) and phonetesting and !(([player,"ziptied"] call player_get_bool) or ([player,"restrained"] call player_get_bool) or ([player,"isstunned"] call player_get_bool))'];
action_cancel = player addaction ["<t color='#3d74ff'>Cancel Action</t>","noscript.sqf","working = false",1,false,true,"",'working'];

drone_action = player addaction ["Deploy Drone","noscript.sqf","[] spawn taki_drone_deploy",11,true,true,"",'(typeOf unitBackpack player == "US_UAV_Pack_EP1" and drone_testing and !drone_deployed);'];
drone_control = player addaction ["Control Drone","noscript.sqf","[1] call taki_drone_control",11,true,true,"",'drone_deployed and drone_testing'];
drone_destroy = player addaction ["Destroy Drone","noscript.sqf","[] call taki_drone_destroy;",11,true,true,"",'drone_deployed and drone_testing'];

spawn_help = player addaction ["<t color='#3d74ff'>Open Spawn Menu</t>","noscript.sqf","[] call open_spawn_menu",1,false,true,"",'player distance default_flagpole < 7'];

player addaction ["Steal Police Payroll","noscript.sqf",'convoyhascash=false; publicvariable "convoyhascash"; [player, "money", govconvoybonus] call INV_AddInventoryItem; player groupchat format["You stole $%1!", _cash];',1,false,true,"","_driver = driver convoytruck; player distance convoytruck <= 7 and convoyhascash and (isciv or isins) and (!alive _driver or isnull _driver)"];
vehicle_interact = player addaction ["<t color='#17c200'>Interact</t>", "noscript.sqf","[] call interaction_handle",9,false,true,"",'_vcl = (getpos player nearEntities [["Air", "Ship", "LandVehicle"], 5] select 0); player distance _vcl <= 5'];

//bodybag_interact_action = player addaction ["<t color='#17c200'>Interact With Bodybag</t>", "noscript.sqf","[] spawn bodybag_interact",9,false,true,"",'_bag = (nearestobjects [player, ["Body"],  5] select 0); player distance _bag <= 5 and !player_interacting'];
bodybag_interact_action = player addaction ["<t color='#17c200'>Deliver Bodybag</t>", "noscript.sqf","[] spawn bodybag_interact",9,false,true,"",'_bag = ( nearestobjects [ player, ["Body"], 5 ] select 0 ); ( player distance _bag ) <= 5 and !player_interacting && alive player && isesu; '];
bag_dead_body_action = player addaction ["<t color='#17c200'>Bag Dead Body</t>", "noscript.sqf","[] spawn bag_dead_body",9,false,true,"",'_body = ( nearestObjects[ player, ["Man"], 5 ] select 1 ); !( alive _body ) && ( player distance _body ) <= 5 && !player_interacting && !isins && !isciv'];
harvest_action = player addaction ["<t color='#ff0000'>Harvest Organs</t>", "noscript.sqf","[] spawn harvest_dead_body",9,false,true,"",'_body = ( nearestObjects[ player, ["Man"], 5 ] select 1 ); !( alive _body ) && ( player distance _body ) <= 5 && !player_interacting && !isesu && !iscop && !isopf;'];

hospital_enter = player addaction ["<t color='#17c200'>Enter Hospital</t>", "noscript.sqf","player setpos (getmarkerPos 'hospital_exit')",9,false,true,"",'player distance (getmarkerPos "hospital_entry") <= 2'];
hospital_exit = player addaction ["<t color='#17c200'>Exit Hospital</t>", "noscript.sqf","player setpos (getmarkerPos 'hospital_entry')",9,false,true,"",'player distance (getmarkerPos "hospital_exit") <= 2'];
hospital_enter2 = player addaction ["<t color='#17c200'>Enter Hospital</t>", "noscript.sqf","player setpos (getmarkerPos 'hospital_exit2')",9,false,true,"",'player distance (getmarkerPos "hospital_entry2") <= 2'];
hospital_exit2 = player addaction ["<t color='#17c200'>Exit Hospital</t>", "noscript.sqf","player setpos (getmarkerPos 'hospital_entry2')",9,false,true,"",'player distance (getmarkerPos "hospital_exit2") <= 2'];


backpack_lock = player addaction ["<t color='#17c200'>Lock Backpack</t>", "noscript.sqf","[] call lock_backpack_storage",9,false,true,"",'(typeOf unitBackpack player != "" and !backpack_locked)'];
backpack_unlock = player addaction ["<t color='#17c200'>Unlock Backpack</t>", "noscript.sqf","[] call unlock_backpack_storage",9,false,true,"",'(typeOf unitBackpack player != "" and backpack_locked)'];

storage_lock = player addaction ["<t color='#17c200'>Lock Storage</t>", "noscript.sqf","[] call lock_vehicle_storage",9,false,true,"",'_vcl = (getpos player nearEntities [["Air", "Ship", "LandVehicle"], 5] select 0); player distance _vcl < 5 and [player,_vcl] call vehicle_owner and !(_vcl getVariable "storage_lock")'];
storage_unlock = player addaction ["<t color='#17c200'>Unlock Storage</t>", "noscript.sqf","[] call unlock_vehicle_storage",9,false,true,"",'_vcl = (getpos player nearEntities [["Air", "Ship", "LandVehicle"], 5] select 0); player distance _vcl < 5 and [player,_vcl] call vehicle_owner and (_vcl getVariable "storage_lock")'];

//storage_lock_crate = player addaction ["<t color='#17c200'>Lock Storage</t>", "noscript.sqf","[] call lock_vehicle_storage",9,false,true,"",'_vcl = (getpos player nearEntities [["GuerillaCacheBox_EP1"], 5] select 0); player distance _vcl < 5 and [player,_vcl] call vehicle_owner and !(_vcl getVariable "storage_lock")'];
//storage_unlock_crate = player addaction ["<t color='#17c200'>Unlock Storage</t>", "noscript.sqf","[] call unlock_vehicle_storage",9,false,true,"",'_vcl = (getpos player nearEntities [["GuerillaCacheBox_EP1"], 5] select 0); player distance _vcl < 5 and [player,_vcl] call vehicle_owner and (_vcl getVariable "storage_lock")'];


dog_action_1 = player addaction ["<t color='#fff81f'>Dog: Follow</t>","noscript.sqf",'[1] spawn dog_move;', 1, false,true,"","dog_actions_active"];
dog_action_2 = player addaction ["<t color='#fff81f'>Dog: Wait</t>","noscript.sqf",'[2] spawn dog_move', 1, false,true,"","dog_actions_active"];
dog_action_3 = player addaction ["<t color='#fff81f'>Dog: Move</t>","noscript.sqf",'[3] spawn dog_move', 1, false,true,"","dog_actions_active"];
dog_action_4 = player addaction ["<t color='#fff81f'>Dog: Attack</t>","noscript.sqf",'[cursorTarget] spawn dog_attack', 1, false,true,"","dog_actions_active"];
dog_action_5 = player addaction ["<t color='#fff81f'>Dog: Search</t>","noscript.sqf",'[cursorTarget] spawn dog_search', 1, false,true,"","dog_actions_active"];
dog_action_6 = player addaction ["<t color='#fff81f'>Dog: Mount</t>","noscript.sqf",'[1, cursorTarget] spawn dog_vehicle', 1, false,true,"","dog_actions_active"];
dog_action_7 = player addaction ["<t color='#fff81f'>Dog: Dismount</t>","noscript.sqf",'[2] spawn dog_vehicle', 1, false,true,"","dog_actions_active"];

dog_action_add = player addaction ["<t color='#fff81f'>Dog: Open Commands</t>","noscript.sqf",'[1] spawn dog_actions_add;', 1, false,true,"","!dog_actions_active and dog_bought"];
dog_action_remove = player addaction ["<t color='#fff81f'>Dog: Close Commands</t>","noscript.sqf",'[1] spawn dog_actions_remove', 1, false,true,"","dog_actions_active"];

/*
donor_check_1 = player addaction ["Check Donor Licenses","RG\donor_check.sqf",[],1,false,true,"","player distance vipatm <= 5"];
donor_check_2 = player addaction ["Check Donor Licenses","RG\donor_check.sqf",[],1,false,true,"","player distance vipatm_1 <= 5"];
donor_check_3 = player addaction ["Check Donor Licenses","RG\donor_check.sqf",[],1,false,true,"","player distance civdonatoratm <= 5"];
donor_check_4 = player addaction ["Check Donor Licenses","RG\donor_check.sqf",[],1,false,true,"","player distance copdonatoratm <= 5"];
donor_check_5 = player addaction ["Check Donor Licenses","RG\donor_check.sqf",[],1,false,true,"","player distance opfdonatoratm <= 5"];
donor_check_6 = player addaction ["Check Donor Licenses","RG\donor_check.sqf",[],1,false,true,"","player distance inddonatoratm <= 5"];
donor_check_7 = player addaction ["Check Donor Licenses","RG\donor_check.sqf",[],1,false,true,"","player distance civdonatoratm2 <= 5"];
*/


action50 = player addaction ["Private storage","noscript.sqf",'[player] call interact_private_storage_menu;', 1, false,true,"","player distance university < 7"];
storage1 = player addaction ["Private storage","noscript.sqf",'[player] call interact_private_storage_menu;', 1, false,true,"","player distance copbank < 7"];
storage2 = player addaction ["Private storage","noscript.sqf",'[player] call interact_private_storage_menu;', 1, false,true,"","player distance pmcatm < 7"];
storage3 = player addaction ["Private storage","noscript.sqf",'[player] call interact_private_storage_menu;', 1, false,true,"","player distance insurgent_atm < 7"];
storage4 = player addaction ["Private storage","noscript.sqf",'[player] call interact_private_storage_menu;', 1, false,true,"","player distance atm5 < 7"];
storage5 = player addaction ["Private storage","noscript.sqf",'[player] call interact_private_storage_menu;', 1, false,true,"","player distance southshop1 < 7"];


action51 = player addaction [format ["Pay Bail", slave_cost],"noscript.sqf", '["bail"] spawn dialog_handler;',1,false,true,"","player distance bailflag <= 5 and isciv"];
//action86 = player addaction ["Unflip vehicle","noscript.sqf","_this call vehicle_unflip;",1,false,true,"",'_vcl = (getpos player nearEntities [["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 5 and ([player, _vcl] call vehicle_owner)'];
action44 = player addaction ["Elect a President","noscript.sqf",'["president"] spawn dialog_handler;',1,false,true,"","player distance rathaus <= 3"];

action47 = player addaction [format["Buy bank insurance ($%1)", ("bank_insurance" call INV_GetItemBuyCost)],"noscript.sqf",'if( [player, "money"] call INV_GetItemAmount < ("bank_insurance" call INV_GetItemBuyCost))exitwith{player groupchat "not enough shekels"};if(buybi)exitwith{player groupchat "already buying insurance"};buybi = true;[player, "money", -("bank_insurance" call INV_GetItemBuyCost)] call INV_AddInventoryItem;[player, "bank_insurance", 1] call INV_AddInventoryItem;player groupchat format["you bought bank insurance for $%1", ("bank_insurance" call INV_GetItemBuyCost)];buybi = false;',1,false,true,"","(!buybi and (player distance mainbank <= 3 or player distance copbank <= 3 or player distance atm5 <= 3 or player distance insurgent_atm <= 3 or player distance licenseflag5 <= 3 or player distance licenseflag6 <= 3 or player distance storage <= 7 or player distance ind_fob_atm <= 3))"];
action472 = player addaction [format["Buy 5 bank insurance ($%1)", ("bank_insurancex5" call INV_GetItemBuyCost)],"noscript.sqf",'if( [player, "money"] call INV_GetItemAmount < ("bank_insurancex5" call INV_GetItemBuyCost))exitwith{player groupchat "not enough shekels"};if(buybi)exitwith{player groupchat "already buying insurance"};buybi = true;[player, "money", -("bank_insurancex5" call INV_GetItemBuyCost)] call INV_AddInventoryItem;[player, "bank_insurance", 5] call INV_AddInventoryItem;player groupchat format["you bought 5 bank insurance for $%1", ("bank_insurancex5" call INV_GetItemBuyCost)];buybi = false;',1,false,true,"","(!buybi and (player distance mainbank <= 3 or player distance copbank <= 3 or player distance atm5 <= 3 or player distance insurgent_atm <= 3 or player distance licenseflag5 <= 3 or player distance licenseflag6 <= 3 or player distance storage <= 7 or player distance ind_fob_atm <= 3))"];


action48 = player addaction ["Crime Log","noscript.sqf",'["coplog"] spawn dialog_handler;',1,false,true,"","player distance rathaus <= 3"];
//action71 = player addaction ["Pull out","noscript.sqf",'(getpos player nearEntities [["Air", "Ship", "LandVehicle"], 3] select 0) execVM "pullout.sqf";',1,true,true,"",'_vcl = (getpos player nearEntities [["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 10 and count (crew _vcl) > 0 and ([_vcl] call INV_IsPlayerVehicle) and (call INV_IsArmed)'];
//action72 = player addaction [localize "STRS_addAction_vehicleinfo","noscript.sqf",'(getpos player nearEntities [["Air", "Ship", "LandVehicle"], 3] select 0) call A_SCRIPT_VEHINFO;',1,true,true,"",'_vcl = (getpos player nearEntities [["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 10 and ([_vcl] call INV_IsPlayerVehicle) and (iscop or isopf or isStaff)'];

//action145 = player addaction ["Put In Car","noscript.sqf","[] call player_putincar ",1,true,true,"",'_vcl = (getpos player nearEntities [["Air", "Ship", "LandVehicle"], 3] select 0); player distance _vcl < 5'];
//car_safe = player addaction ["Save Car From Carmagedon","Scripts\safe_car.sqf",[],1,true,true,"",'_vcl = (getpos player nearEntities [["Air", "Ship", "LandVehicle"], 3] select 0); player distance _vcl < 5'];


take_evidence_action = player addaction ["Take evidence","noscript.sqf",'player groupchat "evidence removed."; {deletevehicle _x} foreach (nearestobjects [getpos player, ["weaponholder","suitcase","Bag_Base_EP1","Land_Sack_EP1"], 3])',1,true,true,"",'_weps = (nearestobjects [getpos player, ["weaponholder","suitcase","Bag_Base_EP1","Land_Sack_EP1"], 3] select 0); player distance _weps < 5 and iscop or isopf'];
action29 = player addaction ["Open/close gate","noscript.sqf",'_gate = (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0); if(_gate animationPhase "bargate" == 1)then{_gate animate ["bargate", 0]}else{_gate animate ["bargate", 1]};',1,true,true,"",'player distance (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0) < 7 and (iscop or isopf or isins)'];


//view_trunk_action = player addaction [localize "STRS_addaction_trunk_see","noscript.sqf",'_vcl = (getpos player nearEntities [["Ship", "LandVehicle"], 3] select 0);_str = ([_vcl] call vehicle_storage_name);[_str] call A_SCRIPT_VEHICLECHECK;',1,true,true,"",'_vcl = (getpos player nearEntities [["Ship", "LandVehicle"], 3] select 0);player distance _vcl < 10 and not([player, _vcl] call vehicle_owner) and ([_vcl] call INV_IsPlayerVehicle) and (iscop or isins)'];
//check_trunk_action = player addaction [localize "STRS_addaction_trunk_check","noscript.sqf",'_vcl = (getpos player nearEntities [["Ship", "LandVehicle"], 3] select 0);_str = ([_vcl] call vehicle_storage_name);if([_vcl,_str] call INV_RemoveIllegalStorage)then{call compile format["publicvariable ""%1"";", _str]};',1,true,true,"",'_vcl = (getpos player nearEntities [["Ship", "LandVehicle"], 3] select 0);player distance _vcl < 10 and not([player, _vcl] call vehicle_owner) and ([_vcl] call INV_IsPlayerVehicle) and (iscop or isopf or isins)'];

//view_air_trunk_action = player addaction [localize "STRS_addaction_trunk_see","noscript.sqf",'_vcl = (getpos player nearEntities [["Air"], 7] select 0);_str = ([_vcl] call vehicle_storage_name);[_str] call A_SCRIPT_VEHICLECHECK;',1,true,true,"",'_vcl = (getpos player nearEntities [["Air"], 7] select 0);player distance _vcl < 20 and not([player, _vcl] call vehicle_owner) and ([_vcl] call INV_IsPlayerVehicle) and (iscop or isins)'];
//check_air_trunk_action = player addaction [localize "STRS_addaction_trunk_check","noscript.sqf",'_vcl = (getpos player nearEntities [["Air"], 7] select 0);_str = ([_vcl] call vehicle_storage_name);if([_vcl,_str] call INV_RemoveIllegalStorage)then{call compile format["publicvariable ""%1"";", _str]};',1,true,true,"",'_vcl = (getpos player nearEntities [["Air"], 7] select 0);player distance _vcl < 20 and not([player, _vcl] call vehicle_owner) and ([_vcl] call INV_IsPlayerVehicle) and (iscop or isopf or isins)'];


c130_trunk = player addaction ["Open Trunk","Scripts\c130_trunk.sqf","",1,true,true,"",'_vcl = (getpos player nearEntities [["C130J","C130J_US_EP1"], 15] select 0); player distance _vcl < 15'];

jail_break = player addaction ["Place Charge","noscript.sqf", '[] spawn jail_break_function',1,false,true,"","player distance getMarkerPos 'prisonspawn' <= 40 and (isciv or isins)"];

prison_enter = player addaction ["Enter Jail","noscript.sqf",'player setpos (getmarkerpos "prison_enter")',1,false,true,"","player distance prison_door_1 <= 3 and iscop"];
prison_exit = player addaction ["Exit Jail","noscript.sqf",'player setpos (getmarkerpos "prison_exit")',1,false,true,"","(player distance bailflag <= 3 and iscop and !([player] call player_get_arrest))"];



battle_cry = player addaction ["Battle Cry","Scripts\battlecry.sqf","",1,false,true,"","allow_battlecry and isins"];



remove_wreck = player addaction ["Remove Wreckage", "noscript.sqf","_strip = (nearestobjects [getpos player, [""Craterlong"",""Wreck_Base"",""Wreck""],  10] select 0);[_strip] call remove_spikestrip",1,false,true,"","player distance (nearestobjects [getpos player, [""Craterlong""],  10] select 0) < 7 and (iscop or isopf or isstaff)"];


impound_lot = impoundbuy addaction ["Impound Lot","noscript.sqf","[] call impound_retrieve",1,false,true,"","player distance impoundbuy <= 5"];
impound_lot2 = impoundbuy_opf addaction ["Impound Lot","noscript.sqf","[] call impound_retrieve",1,false,true,"","player distance impoundbuy_opf <= 5"];
cop_impound_lot = copcar addaction ["Impound Lot","noscript.sqf","[] call impound_retrieve",1,false,true,"","player distance copcar <= 5"];
air_impound_lot = airimpound addaction ["Impound Lot","noscript.sqf",'["Air"] call impound_retrieve',1,false,true,"","player distance airimpoundairimpound <= 5"];
air_impound_lot2 = airimpound_opf addaction ["Impound Lot","noscript.sqf",'["Air"] call impound_retrieve',1,false,true,"","player distance airimpound_opf <= 5"];
//==================================== OBJECT ACTIONS =================================================
//action89 = player addaction ["Remove Searchlight","noscript.sqf",'if (((call INV_GetOwnWeight) + ("SearchLight_US_EP1" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["SearchLight_US_EP1"], 3] select 0);[player, "SearchLight_US_EP1", 1] call INV_AddInventoryItem;player groupchat "you picked up a searchlight";',1,true,true,"",'_light = (nearestobjects [getpos player, ["SearchLight_US_EP1"],  3] select 0); !(_light in speedcamarray) and player distance _light < 5 and iscop'];
//action26 = player addaction ["Remove Roadblock","noscript.sqf",'if (((call INV_GetOwnWeight) + ("roadblock" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_CncBlock_Stripes"],  3] select 0);[player, "roadblock", 1] call INV_AddInventoryItem;player groupchat "you picked up a roadblock";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_CncBlock_Stripes"],  3] select 0) < 5 and iscop'];
//action27 = player addaction ["Remove Bargate","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Bargate" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0);[player, "Bargate", 1] call INV_AddInventoryItem;player groupchat "you picked up a bargate";',1,true,true,"",'player distance (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0) < 7 and iscop'];
action28 = player addaction ["Remove Road Cone","noscript.sqf",'if (((call INV_GetOwnWeight) + ("roadcone" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_coneLight"],  3] select 0);[player, "roadcone", 1] call INV_AddInventoryItem;player groupchat "you picked up a road cone";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_coneLight"],  3] select 0) < 5'];
//action91 = player addaction ["Remove M2 Static","noscript.sqf",'if (((call INV_GetOwnWeight) + ("M2StaticMG_US_EP1" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["M2StaticMG_US_EP1"],  3] select 0);[player, "M2StaticMG_US_EP1", 1] call INV_AddInventoryItem;player groupchat "you picked up a M2 Static";',1,true,true,"",'player distance (nearestobjects [getpos player, ["M2StaticMG_US_EP1"],  3] select 0) < 5 and iscop'];
//action30 = player addaction ["Open/close gate","noscript.sqf",'_gate = (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0); if(_gate animationPhase "bargate" == 1)then{_gate animate ["bargate", 0]}else{_gate animate ["bargate", 1]};',1,true,true,"",'player distance (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0) < 7 and isciv'];
//action31 = player addaction ["Remove Big bag fence (corner)","noscript.sqf",'if (((call INV_GetOwnWeight) + ("BigbagfenceCorner" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_fort_bagfence_corner"],  3] select 0);[player, "BigbagfenceCorner", 1] call INV_AddInventoryItem;player groupchat "you picked up a sandbag wall (corner)";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_fort_bagfence_corner"],  3] select 0) < 5'];
//action32 = player addaction ["Remove Big bag fence","noscript.sqf",'if (((call INV_GetOwnWeight) + ("bigbagfence" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_fort_bagfence_long"],  3] select 0);[player, "bigbagfence", 1] call INV_AddInventoryItem;player groupchat "you picked up a sandbag wall";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_fort_bagfence_long"],  3] select 0) < 5'];
//action33 = player addaction ["Remove Big bag fence (round)","noscript.sqf",'if (((call INV_GetOwnWeight) + ("bigbagfenceRound" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_fort_bagfence_round"],  3] select 0);[player, "bigbagfenceRound", 1] call INV_AddInventoryItem;player groupchat "you picked up a sandbag wall (round)";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_fort_bagfence_round"],  3] select 0) < 5'];
//action34 = player addaction ["Remove Bunker (small)","noscript.sqf",'if (((call INV_GetOwnWeight) + ("bunkersmall" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_fortified_nest_small"],  3] select 0);[player, "bunkersmall", 1] call INV_AddInventoryItem;player groupchat "you picked up a bunker (small)";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_fortified_nest_small"],  3] select 0) < 5'];
//action35 = player addaction ["Remove Danger Sign","noscript.sqf",'if (((call INV_GetOwnWeight) + ("danger" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Sign_Danger"],  3] select 0);[player, "danger", 1] call INV_AddInventoryItem;player groupchat "you picked up a danger sign";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Sign_danger"],  3] select 0) < 5'];
//action36 = player addaction ["Remove Factory","noscript.sqf",'if (((call INV_GetOwnWeight) + ("factory" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_A_GeneralStore_01a"],  3] select 0);[player, "factory", 1] call INV_AddInventoryItem;player groupchat "you picked up a factory";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_A_GeneralStore_01a"],  3] select 0) < 5 and isciv'];
//action37 = player addaction ["Remove Office Building","noscript.sqf",'if (((call INV_GetOwnWeight) + ("officebuilding" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["land_A_Office01"],  3] select 0);[player, "officebuilding", 1] call INV_AddInventoryItem;player groupchat "you picked up a officebuilding";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_A_office01"],  3] select 0) < 5 and isciv'];
//action38 = player addaction ["Remove Barrack","noscript.sqf",'if (((call INV_GetOwnWeight) + ("barrack" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["land_Barrack2"],  3] select 0);[player, "barrack", 1] call INV_AddInventoryItem;player groupchat "you picked up a barrack";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_Barrack2"],  3] select 0) < 5 and isciv'];
//action39 = player addaction ["Remove Hedgehog","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Hedgehog_EP1" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Hedgehog_EP1"],  3] select 0);[player, "Hedgehog_EP1", 1] call INV_AddInventoryItem;player groupchat "you picked up a Hedgehog";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Hedgehog_EP1"],  3] select 0) < 5 and iscop'];
//action40 = player addaction ["Remove Checkpoint sign","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Sign_Checkpoint_US_EP1" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Sign_Checkpoint_US_EP1"],  3] select 0);[player, "Sign_Checkpoint_US_EP1", 1] call INV_AddInventoryItem;player groupchat "you picked up a Checkpoint sign";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Sign_Checkpoint_US_EP1"],  3] select 0) < 5 and iscop'];
action410 = player addaction ["Remove Camo net","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Land_CamoNetVar_NATO_EP1" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_CamoNetVar_NATO_EP1"],  3] select 0);[player, "Land_CamoNetVar_NATO_EP1", 1] call INV_AddInventoryItem;player groupchat "you picked up a Camo net";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_CamoNetVar_NATO_EP1"],  3] select 0) < 5'];
action420 = player addaction ["Remove Breaching ladder","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Land_ladderEP1" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_ladderEP1"],  5] select 0);[player, "Land_ladderEP1", 1] call INV_AddInventoryItem;player groupchat "you picked up a Breaching Ladder";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_ladderEP1"],  5] select 0) < 5'];
object1 = player addaction ["Remove Long Barrier","noscript.sqf",'if (((call INV_GetOwnWeight) + ("RoadBarrier_long" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["RoadBarrier_long"],  5] select 0);[player, "RoadBarrier_long", 1] call INV_AddInventoryItem;player groupchat "you picked up a Barrier Long";',1,true,true,"",'player distance (nearestobjects [getpos player, ["RoadBarrier_long"],  5] select 0) < 5'];
object2 = player addaction ["Remove Small Barrier","noscript.sqf",'if (((call INV_GetOwnWeight) + ("RoadBarrier_light" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["RoadBarrier_light"],  5] select 0);[player, "RoadBarrier_light", 1] call INV_AddInventoryItem;player groupchat "you picked up a Barrier Small";',1,true,true,"",'player distance (nearestobjects [getpos player, ["RoadBarrier_light"],  5] select 0) < 5'];
//action420 = player addaction ["Remove Campfire","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Land_Campfire_burning" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_Campfire_burning"],  5] select 0);[player, "Land_Campfire_burning", 1] call INV_AddInventoryItem;player groupchat "you picked up a Campfire";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_Campfire_burning"],  5] select 0) < 5'];
//action430 = player addaction ["Remove Road Barricade","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Fort_Barricade_EP1" call INV_GetItemTypeKg)) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Fort_Barricade_EP1"],  5] select 0);[player, "Fort_Barricade_EP1", 1] call INV_AddInventoryItem;player groupchat "you picked up a Road Barricade";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Fort_Barricade_EP1"],  5] select 0) < 5'];


			lotto1 = fuelshop1 addAction ["Purchase Lottery Ticket","lottodialog.sqf",["lotto1", "lotto2", "lotto3", "lotto4"]];
			lotto2 = fuelshop2 addAction ["Purchase Lottery Ticket","lottodialog.sqf",["lotto1", "lotto2", "lotto3", "lotto4"]];
			lotto3 = fuelshop3 addAction ["Purchase Lottery Ticket","lottodialog.sqf",["lotto1", "lotto2", "lotto3", "lotto4"]];
			lotto4 = fuelshop4 addAction ["Purchase Lottery Ticket","lottodialog.sqf",["lotto1", "lotto2", "lotto3", "lotto4"]];
			lotto5 = fuelshop5 addAction ["Purchase Lottery Ticket","lottodialog.sqf",["lotto1", "lotto2", "lotto3", "lotto4"]];
			lotto6 = fuelshop6 addAction ["Purchase Lottery Ticket","lottodialog.sqf",["lotto1", "lotto2", "lotto3", "lotto4"]];
			lotto7 = fuelshop7 addAction ["Purchase Lottery Ticket","lottodialog.sqf",["lotto1", "lotto2", "lotto3", "lotto4"]];
			lotto8 = fuelshop8 addAction ["Purchase Lottery Ticket","lottodialog.sqf",["lotto1", "lotto2", "lotto3", "lotto4"]];
			lotto9 = fuelshop9 addAction ["Purchase Lottery Ticket","lottodialog.sqf",["lotto1", "lotto2", "lotto3", "lotto4"]];





if (_faction == "civilian" or _faction == "ins") then {

			action45 = player addaction ["Change the Law","noscript.sqf",'["gesetz"] call dialog_handler;',1,false,true,"","player distance rathaus <= 3 and isMayor"];
			action46 = player addaction ["Change taxes","noscript.sqf",'["steuern"] spawn dialog_handler;',1,false,true,"","player distance rathaus <= 3 and isMayor"];
			action49 = player addaction [format ["Buy Slave ($%1)", slave_cost],"slaves.sqf", ["slave"],1,false,true,"","!currecciv and player distance slaveflag <= 10"];
			//action52 = player addaction ["Process Diamond rock","itemprocess.sqf",["Diamond_rock", "Diamondring", 12, "diamond"],1,false,true,"","player distance Diamond_1 <= 5"];
			//action53 = player addaction ["Process Oil","itemprocess.sqf",["Oil", "OilBarrel", 10, "oil"],1,false,true,"","player distance Oil_1 <= 5"];
			
			bombing_mission = insurgent_atm addaction ["Get Bombing Mission","Scripts\terror_bombing.sqf",[],1,false,true,"",""];
			bombing_mission_fob = ind_fob_atm addAction ["Get Bombing Mission","Scripts\terror_bombing.sqf",[],1,false,true,"",""];
			
			takistan_mine_1 = player addaction ["Process Resources","noscript.sqf","[] call refinery_menu_open",1,false,true,"","player distance takistan_mine <= 5"];
			action8 = 	player addaction ["Get Assassination job","core\missions\assassination.sqf",["getajob_assassin"],1,false,true,"","player distance assassin <= 3"];
			action55 = player addaction ["Process LSD","itemprocess.sqf",["Unprocessed_LSD", "lsd", 5, "lsd ga1"],1,false,true,"","_control = gangarea1 getvariable ""control"";!isnil ""_control"" and player distance gangarea1 <= 5 and (_control == (call INV_MyGang))"];
			action56 = player addaction ["Process Cocaine","itemprocess.sqf",["Unprocessed_Cocaine", "cocaine", 5, "cocaine ga1"],1,false,true,"","_control = gangarea1 getvariable ""control"";!isnil ""_control"" and player distance gangarea1 <= 5 and (_control == (call INV_MyGang))"];
			//ga2
			action57 = player addaction ["Process LSD","itemprocess.sqf",["Unprocessed_LSD", "lsd", 5, "lsd ga2"],1,false,true,"","_control = gangarea2 getvariable ""control"";!isnil ""_control"" and player distance gangarea2 <= 5 and (_control == (call INV_MyGang))"];
			action58 = player addaction ["Process Heroin","itemprocess.sqf",["Unprocessed_Heroin", "heroin", 5, "heroin ga2"],1,false,true,"","_control = gangarea2 getvariable ""control"";!isnil ""_control"" and player distance gangarea2 <= 5 and (_control == (call INV_MyGang))"];
			//ga3
			action59 = player addaction ["Process Heroin","itemprocess.sqf",["Unprocessed_Heroin", "heroin", 5, "heroin ga3"],1,false,true,"","_control = gangarea3 getvariable ""control"";!isnil ""_control"" and player distance gangarea3 <= 5 and (_control == (call INV_MyGang))"];
			action60 = player addaction ["Process Marijuana","itemprocess.sqf",["Unprocessed_Marijuana", "marijuana", 5, "marijuana ga3"],1,false,true,"","_control = gangarea3 getvariable ""control"";!isnil ""_control"" and player distance gangarea3 <= 5 and (_control == (call INV_MyGang))"];
			//======================================== GANG FLAGS ===================================================
			action73 = player addaction ["Neutralise flag","Scripts\gangs\gangflags.sqf",[gangarea1, "neutralise"],1,false,true,"",'_control = gangarea1 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea1 <= 8 and _control != (call INV_MyGang) and _control != "" and gangmember and !pickingup'];
			action74 = player addaction ["Neutralise flag","Scripts\gangs\gangflags.sqf",[gangarea2, "neutralise"],1,false,true,"",'_control = gangarea2 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea2 <= 8 and _control != (call INV_MyGang) and _control != "" and gangmember and !pickingup'];
			action75 = player addaction ["Neutralise flag","Scripts\gangs\gangflags.sqf",[gangarea3, "neutralise"],1,false,true,"",'_control = gangarea3 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea3 <= 8 and _control != (call INV_MyGang) and _control != "" and gangmember and !pickingup'];
			action76 = player addaction ["Capture flag","Scripts\gangs\gangflags.sqf",[gangarea1, "capture"],1,false,true,"",'_control = gangarea1 getvariable "control";player distance gangarea1 <= 10 and isnil "_control" and gangmember and !pickingup'];
			action77 = player addaction ["Capture flag","Scripts\gangs\gangflags.sqf",[gangarea2, "capture"],1,false,true,"",'_control = gangarea2 getvariable "control";player distance gangarea2 <= 10 and isnil "_control" and gangmember and !pickingup'];
			action78 = player addaction ["Capture flag","Scripts\gangs\gangflags.sqf",[gangarea3, "capture"],1,false,true,"",'_control = gangarea3 getvariable "control";player distance gangarea3 <= 10 and isnil "_control" and gangmember and !pickingup'];
			//======================================== SHOP EXPORT ==================================================
			action79 = player addaction ["Shop 1 export","noscript.sqf","[(shop1 call INV_GetShopNum)] call shop_open_dialog;",1,false,true,"","player distance shop1export <= 3"];
			action80 = player addaction ["Shop 2 export","noscript.sqf","[(shop2 call INV_GetShopNum)] call shop_open_dialog;",1,false,true,"","player distance shop2export <= 3"];
			action81 = player addaction ["Shop 3 export","noscript.sqf","[(shop3 call INV_GetShopNum)] call shop_open_dialog;",1,false,true,"","player distance shop3export <= 3"];
			action82 = player addaction ["Shop 4 export","noscript.sqf","[(shop4 call INV_GetShopNum)] call shop_open_dialog;",1,false,true,"","player distance shop4export <= 3"];
			//======================================= GANG GUNSHOPS ==================================================
			action83 = player addaction ["Gang Shop", "noscript.sqf",
										"[(gangarea1 call INV_GetShopNum)] call shop_open_dialog;",
							1, false,true,"",
							"_control = gangarea1 getvariable ""control"";!isnil ""_control"" and player distance gangarea1 <= 5 and (_control == (call INV_MyGang))"];

			action84 = player addaction ["Gang Shop", "noscript.sqf",
										"[(gangarea2 call INV_GetShopNum)] call shop_open_dialog;",
							1, false,true,"",
							"_control = gangarea2 getvariable ""control"";!isnil ""_control"" and player distance gangarea2 <= 5 and (_control == (call INV_MyGang))"];

			action85 = player addaction ["Gang Shop", "noscript.sqf",
										"[(gangarea3 call INV_GetShopNum)] call shop_open_dialog;",
							1, false,true,"",
							"_control = gangarea3 getvariable ""control"";!isnil ""_control"" and player distance gangarea3 <= 5 and (_control == (call INV_MyGang))"];
			//===================================== Gas station Robbing===============================================
			gsshop1 = fuelshop1 addaction ["Rob Gas Station 1", "noscript.sqf", '[player, 1] call player_rob_station', 1, false, true, "","station1money >= 10000"];
			gsshop2 = fuelshop2 addaction ["Rob Gas Station 2", "noscript.sqf", '[player, 2] call player_rob_station', 1, false, true, "","station2money >= 10000"];
			gsshop3 = fuelshop3 addaction ["Rob Gas Station 3", "noscript.sqf", '[player, 3] call player_rob_station', 1, false, true, "", "station3money >= 10000"];
			gsshop4 = fuelshop4 addaction ["Rob Gas Station 4", "noscript.sqf", '[player, 4] call player_rob_station', 1, false, true, "", "station4money >= 10000"];
			gsshop5 = fuelshop5 addaction ["Rob Gas Station 5", "noscript.sqf", '[player, 5] call player_rob_station', 1, false, true, "", "station5money >= 10000"];
			gsshop6 = fuelshop6 addaction ["Rob Gas Station 6", "noscript.sqf", '[player, 6] call player_rob_station', 1, false, true, "", "station6money >= 10000"];
			gsshop7 = fuelshop7 addaction ["Rob Gas Station 7", "noscript.sqf", '[player, 7] call player_rob_station', 1, false, true, "", "station7money >= 10000"];
			gsshop8 = fuelshop8 addaction ["Rob Gas Station 8", "noscript.sqf", '[player, 8] call player_rob_station', 1, false, true, "", "station8money >= 10000"];
			gsshop9 = fuelshop9 addaction ["Rob Gas Station 9", "noscript.sqf", '[player, 9] call player_rob_station', 1, false, true, "", "station9money >= 10000"];


			action89 = player addaction ["Take Hostage Mission","core\missions\hostage.sqf",["getajob_hostage"],1,false,true,"","player distance hostage <= 3"];
			action90 = player addaction ["Take Hostage", "noscript.sqf", "[hostage1] join (group player); player groupchat ""Keep the hostage close or you will fail!"";",1,false,true,"","player distance hostage1 < 5 and isciv"];
			pharmacyrob = pharmacy addaction ["Rob Pharmacy", "noscript.sqf", '[player, "pharmacy"] call player_rob_store', 1, false, true, "", "not(iscop or isopf) && pharmacymoney >= 15000"];
			action120 = player addaction ["Process Meth","itemprocess1.sqf",["pharm", "meth", 2, ""],1,false,true,"","player distance methlab <= 5 and isciv"];
			action144 = player addaction ["Access Armory","Scripts\armory\pmcdoor.sqf",[],13,true,true,"","player distance pmcarmorydoor <= 5 and pmc"];
			pmc_spawn = player addaction ["Go To PMC Spawn","noscript.sqf",'player setpos (getmarkerpos "respawn_pmc")',13,true,true,"","player distance pmc_action_spawn <= 15 and pmc"];
			pmcatm_action = pmcatm addaction ["Become PMC","noscript.sqf","[] call pmc_notification"];
			pmc_lvl1 = player addaction ["Stock Weapons (Lv. 1 130k)","Scripts\armory\pmc_lvl1.sqf",pmcbox,12,true,true,"","player distance pmcbox <= 5 and pmc"];
			pmc_lvl2 = player addaction ["Stock Weapons (Lv. 2 200k)","Scripts\armory\pmc_lvl2.sqf",pmcbox,11,true,true,"","player distance pmcbox <= 5 and pmc"];
			pmc_lvl3 = player addaction ["Stock Weapons (Lv. 3 250k)","Scripts\armory\pmc_lvl3.sqf",pmcbox,10,true,true,"","player distance pmcbox <= 5 and pmc"];

			};


if (_faction == "cop") then {
			jointopsactioncop = CopBank addAction ["Request/Accept/END joint ops","noscript.sqf","[] call declare_joint_ops"];
			action43 = player addaction ["Elect a Chief","noscript.sqf",'["chief"] spawn dialog_handler;',1,false,true,"","player distance copbank < 7"];
			action9 =   player addaction ["Escort VIP", "noscript.sqf", "[VIPtarget] join (group player); player groupchat ""escort the VIP to the police base before he is assassinated!"";",1,false,true,"","player distance VIPtarget < 5 and iscop"];
			action121 = player addaction ["Remove SpikeStrip", "noscript.sqf","_strip = (nearestobjects [getpos player, [""Fort_Razorwire""],  10] select 0);[_strip] call remove_spikestrip",1,false,true,"","player distance (nearestobjects [getpos player, [""Fort_Razorwire""],  10] select 0) < 7 and (iscop or isopf)"];
			
			srt_tp =  srt_tp_stand addaction ["TP To SRT Base", "noscript.sqf",'player setpos (getmarkerpos "srt_base")',1,false,true,"","iscop and srt"];
			defense_mission =  CopBank addaction ["Get Defense Mission", "core\missions\defense_mission.sqf",'',1,false,true,"","!defense_active"];
			
			airbasetp = CopBank addaction ["Go To Airbase", "noscript.sqf","[] call goto_airbase",1,false,true,"",""];

			martiallaw_declare = CopBank addaction ["Declare Martial Law", "noscript.sqf","[] call declare_martial_law",1,false,true,"","(!martiallaw)"];
			martiallaw_end = CopBank addaction ["End Martial Law", "noscript.sqf","[] call end_martial_law",1,false,true,"","martiallaw"];

			//impound_action = player addaction ["Impound vehicle","noscript.sqf",'_vcl = (getpos player nearEntities [["Ship", "LandVehicle"], 3] select 0);[_vcl, "impound"] call A_SCRIPT_IMPOUND;',1,true,true,"",'_vcl = (getpos player nearEntities [["Ship", "LandVehicle"], 3] select 0);player distance _vcl < 10 and ([_vcl] call INV_IsPlayerVehicle) and (iscop or isopf)'];

			//air_impound_action = player addaction ["Impound Air vehicle","noscript.sqf",'_vcl = (getpos player nearEntities [["Air"], 7] select 0);[_vcl, "impound"] call A_SCRIPT_IMPOUND;',1,true,true,"",'_vcl = (getpos player nearEntities [["Air"], 7] select 0);player distance _vcl < 20 and ([_vcl] call INV_IsPlayerVehicle) and (iscop or isopf)'];

};
if (_faction == "opfor") then {
			jointopsactionopf = atm5 addAction ["Request/Accept/END joint ops","noscript.sqf","[] call declare_joint_ops"];
			action43_2 = player addaction ["Elect a Commander","noscript.sqf",'["commander"] spawn dialog_handler;',1,false,true,"","player distance atm5 < 7"];
		//	action300 = player addaction["Get Defend Mission","core\missions\opfmissions.sqf",["start"],1,false,true,"","player distance atm5 < 7 and !opfmissionactive and !opfmissionwaittime"];
		//	action301 = player addaction["Cancel Defend Mission","core\missions\opfmissions.sqf",["end"],1,false,true,"","opfmissionactive and player distance atm5 < 7"];
			atm5_Declarewar = atm5 addaction ["Declare War","noscript.sqf","[] call war_declare"];
			atm5_Endwar = atm5 addaction ["Declare War","noscript.sqf","[] call war_declare"];
			//impound_action = player addaction ["Impound vehicle","noscript.sqf",'_vcl = (getpos player nearEntities [["Air", "Ship", "LandVehicle"], 3] select 0);[_vcl, "impound"] call A_SCRIPT_IMPOUND;',1,true,true,"",'_vcl = (getpos player nearEntities [["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 10 and ([_vcl] call INV_IsPlayerVehicle) and (iscop or isopf)'];
			//air_impound_action = player addaction ["Impound Air vehicle","noscript.sqf",'_vcl = (getpos player nearEntities [["Air"], 7] select 0);[_vcl, "impound"] call A_SCRIPT_IMPOUND;',1,true,true,"",'_vcl = (getpos player nearEntities [["Air"], 7] select 0);player distance _vcl < 20 and ([_vcl] call INV_IsPlayerVehicle) and (iscop or isopf)'];
			defense_mission_opf =  atm5 addaction ["Get Defense Mission", "core\missions\Defence_Mission_Opf.sqf",'',1,false,true,"","!defense_active"];

};


[player] call holster_add_actions;
A_running = false;