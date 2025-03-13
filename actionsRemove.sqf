if(A_running) exitwith {};
A_running = true;

 if !(isNil "jointopsactioncop") 		then {CopBank removeAction jointopsactioncop};
 if !(isNil "jointopsactionopf") 		then {atm5 removeAction jointopsactionopf};
 if !(isNil "action11") 				then {player removeAction action11};
 if !(isNil "spawn_help") 				then {player removeAction spawn_help};
 if !(isNil "backpack_unlock") 			then {player removeAction backpack_unlock};
 if !(isNil "backpack_lock") 			then {player removeAction backpack_lock};
 if !(isNil "storage_unlock") 			then {player removeAction storage_unlock};
 if !(isNil "storage_lock") 			then {player removeAction storage_lock};
 if !(isNil "storage_unlock_crate") 	then {player removeAction storage_unlock_crate};
 if !(isNil "srt_tp") 					then {srt_tp_stand removeAction srt_tp};
 if !(isNil "battle_cry") 				then {player removeAction battle_cry};
 if !(isNil "bombing_mission") 			then {insurgent_atm removeAction bombing_mission};
 if !(isNil "bombing_mission_fob") 		then {ind_fob_atm removeAction bombing_mission_fob};
 if !(isNil "hospital_enter") 			then {player removeAction hospital_enter};
 if !(isNil "hospital_exit") 			then {player removeAction hospital_exit};
 if !(isNil "hospital_enter2") 			then {player removeAction hospital_enter2};
 if !(isNil "hospital_exit2") 			then {player removeAction hospital_exit2};
 if !(isNil "dog_action_1") 			then {player removeAction dog_action_1};
 if !(isNil "dog_action_2") 			then {player removeAction dog_action_2};
 if !(isNil "dog_action_3") 			then {player removeAction dog_action_3};
 if !(isNil "dog_action_4") 			then {player removeAction dog_action_4};
 if !(isNil "dog_action_5") 			then {player removeAction dog_action_5};
 if !(isNil "dog_action_6") 			then {player removeAction dog_action_6};
 if !(isNil "dog_action_7") 			then {player removeAction dog_action_7};
 if !(isNil "dog_action_remove") 		then {player removeAction dog_action_remove};
 if !(isNil "dog_action_add") 			then {player removeAction dog_action_add};
 if !(isNil "phone_action") 			then {player removeAction phone_action};
 if !(isNil "action43_2") 				then {player removeAction action43_2};
 if !(isNil "jail_break") 				then {player removeAction jail_break};
 if !(isNil "remove_wreck") 			then {player removeAction remove_wreck};
 if !(isNil "action420") 				then {player removeAction action420};
 if !(isNil "object1") 					then {player removeAction object1};
 if !(isNil "object2") 					then {player removeAction object2};
 
 
 if !(isNil "drone_action") 			then {player removeAction drone_action};
 if !(isNil "drone_control") 			then {player removeAction drone_control};
 if !(isNil "drone_destroy") 			then {player removeAction drone_destroy};
 

 if !(isNil "impound_lot") 				then {impoundbuy removeAction impound_lot};
 if !(isNil "cop_impound_lot") 			then {copcar removeAction cop_impound_lot};
 if !(isNil "air_impound_lot") 			then {airimpound removeAction air_impound_lot};
 if !(isNil "martiallaw_declare") 		then {CopBank removeAction martiallaw_declare};
 if !(isNil "airbasetp") 				then {CopBank removeAction airbasetp};
 if !(isNil "defense_mission") 			then {CopBank removeAction defense_mission};
 if !(isNil "martiallaw_end") 			then {CopBank removeAction martiallaw_end};
 if !(isNil "defense_mission_opf") 		then {atm5 removeAction defense_mission_opf};
 
 if !(isNil "jail_break") 				then {player removeAction jail_break};
 if !(isNil "prison_exit") 				then {player removeAction prison_exit};
 if !(isNil "prison_enter") 			then {player removeAction prison_enter};
 if !(isNil "action23") 				then {player removeAction action23};
 if !(isNil "take_evidence_action") 	then {player removeAction take_evidence_action};
 if !(isNil "action24") 				then {player removeAction action24};
 if !(isNil "action25") 				then {player removeAction action25};
 
 if !(isNil "action29") 				then {player removeAction action29};
 if !(isNil "action41") 				then {player removeAction action41};
 if !(isNil "action42") 				then {player removeAction action42};
 if !(isNil "action43") 				then {player removeAction action43};
 if !(isNil "action44") 				then {player removeAction action44};
 if !(isNil "action45") 				then {player removeAction action45};
 if !(isNil "action46") 				then {player removeAction action46};
 if !(isNil "action47") 				then {player removeAction action47};
 if !(isNil "action472") 				then {player removeAction action472};
 if !(isNil "action48") 				then {player removeAction action48};
 if !(isNil "action49") 				then {player removeAction action49};
 if !(isNil "action50") 				then {player removeAction action50};
 
 if !(isNil "storage1") 				then {player removeAction storage1};
 if !(isNil "storage2") 				then {player removeAction storage2};
 if !(isNil "storage3") 				then {player removeAction storage3};
 if !(isNil "storage4") 				then {player removeAction storage4};
 if !(isNil "storage5") 				then {player removeAction storage5};
 if !(isNil "action51") 				then {player removeAction action51};
 
 if !(isNil "action53")					then {player removeAction action53};
 if !(isNil "action55") 				then {player removeAction action55};
 if !(isNil "action56") 				then {player removeAction action56};
 if !(isNil "action57") 				then {player removeAction action57};
 if !(isNil "action58") 				then {player removeAction action58};
 if !(isNil "action59") 				then {player removeAction action59};
 if !(isNil "action60") 				then {player removeAction action60};
 if !(isNil "action_cancel") 			then {player removeAction action_cancel};
 
 
 if !(isNil "action73") then {player removeAction action73};
 if !(isNil "action74") then {player removeAction action74};
 if !(isNil "action75") then {player removeAction action75};
 if !(isNil "action76") then {player removeAction action76};
 if !(isNil "action77") then {player removeAction action77};
 if !(isNil "action78") then {player removeAction action78};
 if !(isNil "action79") then {player removeAction action79};
 if !(isNil "action80") then {player removeAction action80};
 if !(isNil "action81") then {player removeAction action81};
 if !(isNil "action82") then {player removeAction action82};
 if !(isNil "action83") then {player removeAction action83};
 if !(isNil "action84") then {player removeAction action84};
 if !(isNil "action85") then {player removeAction action85};
 
 
 if !(isNil "action90") then {player removeAction action90};
 if !(isNil "action94") then {player removeAction action94};
 if !(isNil "action95") then {player removeAction action95};
 if !(isNil "action96") then {player removeAction action96};
 if !(isNil "action97") then {player removeAction action97};
 if !(isNil "action98") then {player removeAction action98};
 if !(isNil "action99") then {player removeAction action99};
 if !(isNil "action100") then {player removeAction action100};
 if !(isNil "action101") then {player removeAction action101};
 if !(isNil "action102") then {player removeAction action102};
 if !(isNil "action103") then {player removeAction action103};
 if !(isNil "action104") then {player removeAction action104};
 if !(isNil "action105") then {player removeAction action105};
 if !(isNil "action106") then {player removeAction action106};
 if !(isNil "action107") then {player removeAction action107};
 if !(isNil "action108") then {player removeAction action108};
 if !(isNil "action109") then {player removeAction action109};
 if !(isNil "action110") then {player removeAction action110};
 if !(isNil "action111") then {player removeAction action111};
 
 if !(isNil "action112") then {player removeAction action112};
 if !(isNil "action113") then {player removeAction action113};
 if !(isNil "action114") then {player removeAction action114};
 if !(isNil "action115") then {player removeAction action115};
 if !(isNil "action116") then {player removeAction action116};
 if !(isNil "action117") then {player removeAction action117};
 if !(isNil "action118") then {player removeAction action118};
 if !(isNil "action119") then {player removeAction action119};
 if !(isNil "action120") then {player removeAction action120};
 if !(isNil "action121") then {player removeAction action121};
 if !(isNil "action122") then {player removeAction action122};
 if !(isNil "action123") then {player removeAction action123};
 if !(isNil "action124") then {player removeAction action124};
 if !(isNil "action125") then {player removeAction action125};
 if !(isNil "action126") then {player removeAction action126};
 
 
 if !(isNil "action127") then {player removeAction action127};
 if !(isNil "action128") then {player removeAction action128};
 if !(isNil "action129") then {player removeAction action129};
 if !(isNil "action130") then {player removeAction action130};
 if !(isNil "action131") then {player removeAction action131};
 if !(isNil "action132") then {player removeAction action132};
 if !(isNil "action133") then {player removeAction action133};
 if !(isNil "action134") then {player removeAction action134};
 if !(isNil "action135") then {player removeAction action135};
 if !(isNil "action136") then {player removeAction action136};
 if !(isNil "action137") then {player removeAction action137};
 if !(isNil "action138") then {player removeAction action138};
 if !(isNil "action139") then {player removeAction action139};
 if !(isNil "action140") then {player removeAction action140};
 if !(isNil "action141") then {player removeAction action141};
 if !(isNil "action142") then {player removeAction action142};
 if !(isNil "action144") then {player removeAction action144};
 if !(isNil "action145") then {player removeAction action145};
 if !(isNil "pmc_spawn") then {player removeAction pmc_spawn};
 if !(isNil "action300") then {player removeAction action300};
 if !(isNil "action301") then {player removeAction action301};
 if !(isNil "action28") then {player removeAction action28};
 if !(isNil "vehicle_interact") then {player removeAction vehicle_interact};
 if !(isNil "bodybag_interact_action") then {player removeAction bodybag_interact_action};
 if !(isNil "bag_dead_body_action") then {player removeAction bag_dead_body_action};
 if !(isNil "harvest_action") then {player removeAction harvest_action};
 if !(isNil "pmc_lvl1") then {player removeAction pmc_lvl1};
 
 if !(isNil "pmc_lvl2") then {player removeAction pmc_lvl2};
 if !(isNil "pmc_lvl3") then {player removeAction pmc_lvl3};
 if !(isNil "phone_testing") then {player removeAction action51};
 if !(isNil "changehorn_action") then {player removeAction changehorn_action};
 if !(isNil "bomb_mission") then {player removeAction bomb_mission};
 if !(isNil "battle_cry") then {player removeAction battle_cry};
 if !(isNil "bomb_mission_start") then {player removeAction bomb_mission_start};
 if !(isNil "takistan_mine_1") then {player removeAction takistan_mine_1};
 
 
 if !(isNil "gsshop1") then {fuelshop1 removeAction gsshop1};
 if !(isNil "gsshop2") then {fuelshop2 removeAction gsshop2};
 if !(isNil "gsshop3") then {fuelshop3 removeAction gsshop3};
 if !(isNil "gsshop4") then {fuelshop4 removeAction gsshop4};
 if !(isNil "gsshop5") then {fuelshop5 removeAction gsshop5};
 if !(isNil "gsshop6") then {fuelshop6 removeAction gsshop6};
 if !(isNil "gsshop7") then {fuelshop7 removeAction gsshop7};
 if !(isNil "gsshop8") then {fuelshop8 removeAction gsshop8};
 if !(isNil "gsshop9") then {fuelshop9 removeAction gsshop9};
 
 if !(isNil "lotto1") then {fuelshop1 removeAction lotto1};
 if !(isNil "lotto2") then {fuelshop1 removeAction lotto2};
 if !(isNil "lotto3") then {fuelshop1 removeAction lotto3};
 if !(isNil "lotto4") then {fuelshop1 removeAction lotto4};
 if !(isNil "lotto5") then {fuelshop1 removeAction lotto5};
 if !(isNil "lotto6") then {fuelshop1 removeAction lotto6};
 if !(isNil "lotto7") then {fuelshop1 removeAction lotto7};
 if !(isNil "lotto8") then {fuelshop1 removeAction lotto8};
 if !(isNil "lotto9") then {fuelshop1 removeAction lotto9};



[player] call holster_remove_actions;

A_running = false;