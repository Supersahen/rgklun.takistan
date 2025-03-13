if (not(isNil "respawn_functions_defined")) exitWith {};
["player_rejoin_camera_complete"] call player_wait;
[player, true] spawn player_spawn;
respawn_functions_defined = true;