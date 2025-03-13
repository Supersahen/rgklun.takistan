	#include "macro.h"
	
	if !(player_dead) then {
		[] spawn {
			safe1 say "Bank_alarm";
			Uisleep 10;
			safe1 say "Bank_alarm";
			Uisleep 10;
			safe1 say "Bank_alarm";
			Uisleep 10;
			safe1 say "Bank_alarm";
			Uisleep 10;
			safe1 say "Bank_alarm";
			Uisleep 10;
			safe1 say "Bank_alarm";
			Uisleep 10;
		};
	};
	_robpool = _this select 0;

	titleText ["$$$ WARNING $$$ Security Guards have spotted armed men attempting to break into the national bank!!! $$$ WARNING $$$", "PLAIN DOWN"];
	Uisleep 1;
	titleText ["$$$ WARNING $$$ Security Guards have spotted armed men attempting to break into the national bank!!! $$$ WARNING $$$", "PLAIN DOWN"];
	Uisleep 1;
	titleText ["$$$ WARNING $$$ Security Guards have spotted armed men attempting to break into the national bank!!! $$$ WARNING $$$", "PLAIN DOWN"];
	Uisleep 1;
	uiSleep 30;
	
	_totalamountstolen = bank_gold_bars * 100000;
	if (_totalamountstolen > 100000) then {	
		server globalchat format["The thief stole $%1!", [_robpool,","] call format_integer];
	};
		if (_totalamountstolen == 100000) exitWith {	
		server globalchat "The Thief didnt steal anything as the safe was empty! Therefore you lost no shekels in the robbery!";
	};
	if (isvip) exitWith {player groupchat "Due to your offshore bank account, you lost no shekels in the robbery!"};
	
	uiSleep 4;

	private["_bank_account", "_robbed", "_insurances_inv", "_insurances_stor"];

	_insurances_inv = [player, 'bank_insurance'] call INV_GetItemAmount;
	_insurances_stor = [player, 'bank_insurance', 'private_storage'] call INV_GetStorageAmount;
	
	
	if (_insurances_inv > 0) exitWith {
		player groupChat localize "STRS_bank_rob_lostnomoney";
		[player, 'bank_insurance', -(1)] call INV_AddInventoryItem;
	};
	
	if(_insurances_stor > 0) exitWith {
		player groupChat localize "STRS_bank_rob_lostnomoney";
		[player, 'bank_insurance', -(1), 'private_storage'] call INV_AddItemStorage;
	};
	
	_playerCount = count playableunits;
	_robbed = round (_robpool / _playercount);

	[player, -(_robbed)] call transaction_dynamiccuntflap;
	_bank_account = [player] call get_dynamiccuntflap;
	
	if (_bank_account < 0) exitWith {
		[player,50000] call set_dynamiccuntflap;
	};
	
	player groupChat format ["The bank has been robbed and you lost $%1 but have $%2 remaining in your account.",_robbed,_bank_account];