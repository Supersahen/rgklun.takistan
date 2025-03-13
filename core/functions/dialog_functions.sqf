#include "macro.h"

stock_dialog = {
	disableSerialization;
	createDialog "stock_menu";
		
	for "_i" from 0 to (count stock_markets - 1) do {
		_market = stock_markets select _i;
		_name = _market select 0;
		_index = lbAdd [1500, _name];
		lbSetData [1500, _index,_i];
	};
	lbSetCurSel [1500,0];
};

stock_dialog_select = {
	
	disableSerialization;
	_display = findDisplay 2000;
	_list = _display displayCtrl 1500;
	_share_price_dlg = _display displayCtrl 1000;
	_shares_dlg = _display displayCtrl 1001;
	_increase_decrease_dlg = _display displayCtrl 1002;
	_worth_dlg = _display displayCtrl 1003;
	
	_i = _this select 1;
	if (isNil "_i") then {_i = lbCurSel 1500};
	_market = stock_markets select _i;
	_name = _market select 0;
	_shareprice = _market select 1;
	_difference = [_name] call stock_get_last;
	if (_difference >= 0) then {
		_color = [0,1,0,1];
	} else {
		_color = [1,0,0,1];
	};
	
	
	_shares_dlg ctrlSetText format ["Owned Shares: %1",[_name] call stock_get_shares];
	_share_price_dlg ctrlSetText format ["Share Price: $%1",strM(_shareprice)];
	_increase_decrease_dlg ctrlSetText format ["Difference: $%1",strM([_name] call stock_get_last)];
	_increase_decrease_dlg ctrlSetTextColor _color;
	
	_worth_dlg ctrlSetText format ["Stock Worth: $%1",strM([_name] call stock_get_share_worth)];
};

agreement_dialog = {
	disableSerialization;
	createDialog "agreement_dialog";
	
	_display = findDisplay 1200;
	_link = _display displayCtrl 1001;
	_text = _display displayCtrl 1000;
	_button = _display displayCtrl 1600;
	
	_display displaySetEventHandler ["keyDown","_this call display_keypress"];
	_text ctrlSetText format ["Before you play as a cop there are a few things you should know.
	Everything you should know will be outlined in the link that you may copy below. Simply tab out and follow that link to our website. Read the page that comes up.
	It is in your best interest that you read the information or it could result in severe punishment including but not limited to permanent removal from blufor."];
	
	_button ctrlEnable false;
	_i = 1;
	while {_i >= 0} do {
	
		_button ctrlSetText format ["%1 second(s) Left",_i];
		_i = _i - 1;
		uiSleep 1;
	};
		
	_button ctrlEnable true;
	_button ctrlSetText format ["Accept"];
	
	waitUntil {police_agreement};
		
	closedialog 0;
	[format ["%1_persistent",getplayeruid player], format ["%1_persistent",getplayeruid player],  "police_agreement","true"] call fn_SaveToServer;
};
