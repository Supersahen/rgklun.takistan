if (isNil "statsLoaded") then {statsLoaded = 0;};
waitUntil {statsLoaded == 1;};
while {true} do
{
	uisleep 100;
	systemChat "[STATS SAVED]";
	uisleep 20;
	
	if (statsLoaded == 1) then {
		
		if (isNil "iscop" or isNil "isopf" or isNil "isins" or isNil "isciv" or isNil "isesu") exitWith {player groupChat "You are glitched. Stats will not be saved"};
		if (iscop) then {
			[getPlayerUID player, getPlayerUID player, "moneyAccountWest", ([player] call get_dynamiccuntflap)] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "backpack_west", [player] call player_get_backpack_gear] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "WeaponsPlayerWest", weapons player] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "MagazinesPlayerWest", magazines player] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "LicensesWest", INV_LicenseOwner] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "InventoryWest", ([player] call player_get_inventory)] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "privateStorageWest", ([player, "private_storage"] call player_get_array)] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "FactoryWest", INV_Fabrikowner] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "HolsterSMG_West", INV_InventarSmg] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "HolsterPistol_West", INV_InventarPistol] call fn_SaveToServer;
			[format ["%1_persistent",getPlayerUID player], format ["%1_persistent",getPlayerUID player], "rank_west",player_rank] call fn_SaveToServer;
		};
		if (isopf) then {
			[getPlayerUID player, getPlayerUID player, "moneyAccountEast", ([player] call get_dynamiccuntflap)] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "backpack_east", [player] call player_get_backpack_gear] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "WeaponsPlayerEast", weapons player] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "MagazinesPlayerEast", magazines player] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "LicensesEast", INV_LicenseOwner] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "InventoryEast", ([player] call player_get_inventory)] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "privateStorageEast", ([player, "private_storage"] call player_get_array)] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "FactoryEast", INV_Fabrikowner] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "HolsterSMG_East", INV_InventarSmg] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "HolsterPistol_East", INV_InventarPistol] call fn_SaveToServer;
			[format ["%1_persistent",getPlayerUID player], format ["%1_persistent",getPlayerUID player], "rank_east", player_rank] call fn_SaveToServer;
		};
		
		if (isins) then {
			[getPlayerUID player, getPlayerUID player, "moneyAccountRes", ([player] call get_dynamiccuntflap)] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "backpack_un",[player] call player_get_backpack_gear] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "WeaponsPlayerRes", weapons player] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "MagazinesPlayerRes", magazines player] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "LicensesRes", INV_LicenseOwner] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "InventoryRes", ([player] call player_get_inventory)] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "privateStorageRes", ([player, "private_storage"] call player_get_array)] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "FactoryRes", INV_Fabrikowner] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "HolsterSMG_Res", INV_InventarSmg] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "HolsterPistol_Res", INV_InventarPistol] call fn_SaveToServer;
			[format ["%1_persistent",getPlayerUID player],format ["%1_persistent",getPlayerUID player], "rank_un", player_rank] call fn_SaveToServer;
		};
		
		if (isciv or isesu) then {
			[getPlayerUID player, getPlayerUID player, "moneyAccountCiv", ([player] call get_dynamiccuntflap)] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "backpack_civ",[player] call player_get_backpack_gear] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "WeaponsPlayerCiv", weapons player] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "MagazinesPlayerCiv", magazines player] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "LicensesCiv", INV_LicenseOwner] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "InventoryCiv", ([player] call player_get_inventory)] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "privateStorageCiv", ([player, "private_storage"] call player_get_array)] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "Fabrikablage1_storage", ([player, "Fabrikablage1"] call player_get_array)] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "AircraftFactory1_storage", ([player, "AircraftFactory1"] call player_get_array)] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "Fabrikablage3_storage", ([player, "Fabrikablage3_storage"] call player_get_array)] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "Fabrikablage4_storage", ([player, "Fabrikablage4_storage"] call player_get_array)] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "FactoryCiv", INV_Fabrikowner] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "HolsterSMG_Civ", INV_InventarSmg] call fn_SaveToServer;
			[getPlayerUID player, getPlayerUID player, "HolsterPistol_Civ", INV_InventarPistol] call fn_SaveToServer;
			[format ["%1_persistent",getPlayerUID player], format ["%1_persistent",getPlayerUID player], "rank_esu", player_rank] call sendToServer;
		};
	
		[getPlayerUID player, getPlayerUID player, "shares", [] call stocks_save ] call fn_SaveToServer;
		[format ["%1_persistent",getPlayerUID player],format ["%1_persistent",getPlayerUID player], "player_total_playtime", player_total_playtime] call fn_SaveToServer;

	};
};
