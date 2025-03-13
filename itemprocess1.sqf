

if (processing) exitWith {};
processing = true;
_num = round random 100;
if(iscop)exitwith{player groupchat "only civilians can do this!";};
 _this = _this select 3;
 _item1 = _this select 0;
 _item2 = _this select 1;
 _req = _this select 2;
 _license = _this select 3;
 _nitem1 = [player, "pharm"] call INV_GetItemAmount; 
 _name1 = _item1 call INV_getitemName;
 _name2 = _item2 call INV_getitemName;
 
if (_nitem1 <3) exitWith {player groupChat "You don't have enough to begin processing."; processing = false};
player groupChat "You are now processing meth! Be careful not to blow yourself up!";
(format ["%1 playmove ""%2"";", player, "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"]) call broadcast;
 uiSleep 3;


	if (_num < 5)exitwith
	{
	player groupchat "OH SHIT!";
	uiSleep 1;
	_bomb = "Bo_GBU12_LGB" createVehicle (position methlab);
	uiSleep 3;
	(format ['server globalChat "Citizens report hearing screams and a loud explosion near a known methlab in the mountains.";']) call broadcast;
	
	
	};

_total = _nitem1/3; 
_total = round _total;
[player, "pharm", -_nitem1] call INV_AddInventoryItem;
[player, "meth", _total] call INV_AddInventoryItem;
player groupchat format["%1 %2 was processed into %3 %4!", _nitem1, _name1, _total, _name2];

processing = false;

