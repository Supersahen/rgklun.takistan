
[] spawn {
	private["_uid", "_id"];
	_uid = getPlayerUID player;
	playerUID = getPlayerUID player;
	_cid = player;
	uiSleep 2;
	titleText ["Loading Stats","PLAIN"]; // Displays text
	if (isNil "dynamiccuntflap") then {
			diag_log "Setting Money to default as no stats loaded";
			[player, startmoneh] call set_dynamiccuntflap;
	};
	
	if (isNil "iscop" or isNil "isopf" or isNil "isins" or isNil "isciv" or isNil "isesu") exitWith {player groupChat "You are glitched. Stats will not be saved"};
	
	if(iscop) then
	{
		[format ["%1_persistent",_uid], format ["%1_persistent",_uid], "police_agreement", "STRING", _cid] call sendToServer;
		[_uid, _uid, "moneyAccountWest", "NUMBER", _cid] call sendToServer;
		[_uid, _uid, "backpack_west", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "WeaponsPlayerWest", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "MagazinesPlayerWest", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "LicensesWest", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "InventoryWest", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "privateStorageWest", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "FactoryWest", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "HolsterSMG_West", "STRING", _cid] call sendToServer;
		[_uid, _uid, "HolsterPistol_West", "STRING", _cid] call sendToServer;
		[format ["%1_persistent",_uid], format ["%1_persistent",_uid], "rank_west", "NUMBER", _cid] call sendToServer;
		[format ["%1_persistent",_uid], format ["%1_persistent",_uid], "JailTime", "NUMBER", _cid] call sendToServer;
	};

	if(isopf) then
	{
		[_uid, _uid, "moneyAccountEast", "NUMBER", _cid] call sendToServer;
		[_uid, _uid, "backpack_east", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "WeaponsPlayerEast", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "MagazinesPlayerEast", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "LicensesEast", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "InventoryEast", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "privateStorageEast", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "FactoryEast", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "HolsterSMG_East", "STRING", _cid] call sendToServer;
		[_uid, _uid, "HolsterPistol_East", "STRING", _cid] call sendToServer;
		[format ["%1_persistent",_uid], format ["%1_persistent",_uid], "rank_east", "NUMBER", _cid] call sendToServer;
		[format ["%1_persistent",_uid], format ["%1_persistent",_uid], "JailTime", "NUMBER", _cid] call sendToServer;
	};
	if(isins) then
	{
		[_uid, _uid, "moneyAccountRes", "NUMBER", _cid] call sendToServer;
		[_uid, _uid, "backpack_un", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "WeaponsPlayerRes", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "MagazinesPlayerRes", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "LicensesRes", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "InventoryRes", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "privateStorageRes", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "FactoryRes", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "HolsterSMG_Res", "STRING", _cid] call sendToServer;
		[_uid, _uid, "HolsterPistol_Res", "STRING", _cid] call sendToServer;
		[format ["%1_persistent",_uid], format ["%1_persistent",_uid], "rank_un", "NUMBER", _cid] call sendToServer;
		[format ["%1_persistent",_uid], format ["%1_persistent",_uid], "JailTime", "NUMBER", _cid] call sendToServer;
	};
	
	if(isciv or isesu) then
	{
		[_uid, _uid, "moneyAccountCiv", "NUMBER", _cid] call sendToServer;
		[_uid, _uid, "backpack_civ", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "WeaponsPlayerCiv", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "MagazinesPlayerCiv", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "LicensesCiv", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "InventoryCiv", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "privateStorageCiv", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "Fabrikablage1_storage", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "AircraftFactory1_storage", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "Fabrikablage3_storage", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "Fabrikablage4_storage", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "FactoryCiv", "ARRAY", _cid] call sendToServer;
		[_uid, _uid, "HolsterSMG_Civ", "STRING", _cid] call sendToServer;
		[_uid, _uid, "HolsterPistol_Civ", "STRING", _cid] call sendToServer;
		[format ["%1_persistent",_uid], format ["%1_persistent",_uid], "JailTime", "NUMBER", _cid] call sendToServer;
		[format ["%1_persistent",_uid], format ["%1_persistent",_uid], "rank_esu", "NUMBER", _cid] call sendToServer;
	};
	
	[_uid, _uid, "shares", "ARRAY", _cid] call sendToServer;
	[format ["%1_persistent",_uid], format ["%1_persistent",_uid], "logins", "NUMBER", _cid] call sendToServer;
	[format ["%1_persistent",_uid], format ["%1_persistent",_uid], "player_total_playtime", "NUMBER", _cid] call sendToServer;
	[format ["%1_persistent",_uid], format ["%1_persistent",_uid], "online_during_hacker", "NUMBER", _cid] call sendToServer;
	//END
	statsLoaded = 1;

	uiSleep 4; 
	titleText ["Stats Loaded","PLAIN"]; // Displays text

	 if ((isdon) && !("donator" call INV_HasLicense)) then {INV_LicenseOwner = INV_LicenseOwner + ["donator"];
				server globalchat "DONATOR ACCOUNT DETECTED: Donator License Added"};



	if ((isvip) && !("viplicense" call INV_HasLicense)) then {INV_LicenseOwner = INV_LicenseOwner + ["viplicense"];
				server globalchat "VIP DONATOR ACCOUNT DETECTED: VIP Donator License Added"};

	if ((vice) && !("vice_training" call INV_HasLicense)) then {INV_LicenseOwner = INV_LicenseOwner + ["vice_training"];
				server globalchat "VICE ACCOUNT DETECTED: VICE TRAINING Added"};
	uiSleep 1;
	stats_loaded = true;
	
	if (!police_agreement and iscop) then {
		[] spawn agreement_dialog;
	};
	if (iscop) then {
		waitUntil {police_agreement};
	};
	
	[] call open_spawn_menu;
	
	player_logins = player_logins + 1;
	[format ["%1_persistent",getplayeruid player], format ["%1_persistent",getplayeruid player], "logins", player_logins] call fn_SaveToServer;
	_message = format ["%1 logged into the server. They have logged in %2 times",name player,player_logins];
	[_message,"Login"] call mp_log;
	
	
	[str ("RISE GAMING") ,  str("Takistan Life: Revolution"), str("Welcome To Takistan")] spawn BIS_fnc_infoText;
};









