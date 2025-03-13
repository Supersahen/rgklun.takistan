#include "constants.h"

call disableserialization;
private ["_name_tags_i"];
_name_tags_i = 0;

object_atm = {
	private["_object"];
	_object = _this select 0;
	if (isNil "_object") exitWith {false};
	if (typeName _object != "OBJECT") exitWith {false};
	if (isNull _object) exitWith {false};
	
	(_object in bankflagarray)
};
object_clotheshop = {
	private["_object"];
	_object = _this select 0;
	if (isNil "_object") exitWith {false};
	if (typeName _object != "OBJECT") exitWith {false};
	if (isNull _object) exitWith {false};
	
	(_object in clothesusearray)
};

object_shop = {
	private["_object"];
	_object = _this select 0;
	if (isNil "_object") exitWith {false};
	if (typeName _object != "OBJECT") exitWith {false};
	if (isNull _object) exitWith {false};
	
	(_object in shopusearray)
};


name_tags_vehicle = {
	private["_target"];
	_target = _this select 0;
	if ([_target] call player_human) exitWith {false};
	if (not([_target] call vehicle_exists)) exitWith {false};
	
	(
		_target isKindOf "LandVehicle" ||
		_target isKindOf "Air" ||
		_target isKindOf "Ship" ||
		_target isKindOf "LocalBasicWeaponsBox"
	)
};




name_tags_center_screen = {
	private["_x", "_y"];
	_x = (safezoneX + 0.5 * safezoneW);
	_y = (safezoneY + 0.5 * safezoneH);
	[_x, _y]
};



name_tags_head_position = {
	private["_target", "_pos", "_pos_x", "_pos_y", "_pos_z"];
	_target = _this select 0;

	private["_distance"];
	_distance = player distance _target;
	

	private["_pos", "_pos_x", "_pos_y", "_pos_z"];
	_pos = (_target selectionPosition "neck");
	_pos_x = (_pos select 0);
	_pos_y = (_pos select 1);
	_pos_z = (_pos select 2) + 0.2;
	private["_pos"];
	
	_pos_z = if (_pos_z > 1.6) then { 1.9 } else {_pos_z};
	_pos =  [_pos_x, _pos_y, _pos_z];
	//player groupChat format["_pos = %1", _pos];
	
	(worldToScreen (_target modelToWorld _pos))
	
};

name_tags_head_screen = {
	private["_target"];
	_target = _this select 0;
	
	private["_center"];
	_center = call name_tags_center_screen;
	
	if (isNil "_target") exitWith {_center};
	if (typeName _target != "OBJECT") exitWith {_center};
	if (isNull _target) exitWith {_center};
	if (not(_target isKindOf "Man")) exitWith {_center;};
	
	private["_pos2D"];
	_pos2D = ([_target] call name_tags_head_position);

	if (isNil "_pos2D") exitWith {_center};
	if (typeName _pos2D != "ARRAY") exitWith {_center};
	if (count _pos2D < 2) exitWith {_center};
	
	([(_pos2D select 0), (_pos2D select 1)])
};

name_tags_draw = {
	//player groupChat format["name_tags_draw %1", _this];
	
	private["_player", "_target"];
	_player = _this select 0;
	_target = _this select 1;
	if (not([_player] call player_human)) exitWith {false};
	if (isNil "_target") exitWith {false};
	if (typeName _target != "OBJECT") exitWith {false};
	if (isNull _target) exitWith {false};
	if (visibleMap) exitWith {false};
	if ((vehicle player) != player) exitWith {};
	
	private["_control"];
	_control = call name_tags_control;

	private["_target", "_distance", "_is_near", "_is_far"];
	_target = cursorTarget;
	_distance = player distance _target;
	
	
	if (([_target] call object_atm) && _distance < 3) exitWith {
		private["_center_pos"];
		_center_pos = call name_tags_center_screen;
		_control ctrlSetPosition _center_pos;
		_control ctrlSetStructuredText parseText format["<t size='1.2' font='EtelkaNarrowMediumPro' color='#00ff00'>ATM (E)</t>"];
		_control ctrlShow true;
		_control ctrlCommit 0;
		true
		// t align='center'
	};			
	if (([_target] call object_clotheshop) && _distance < 3) exitWith {
		private["_center_pos"];
		_center_pos = call name_tags_center_screen;
		_control ctrlSetPosition _center_pos;
		_control ctrlSetStructuredText parseText format["<t size='1.2' font='EtelkaNarrowMediumPro' color='#00ff00'>Clothing Shop (E)</t>"];
		_control ctrlShow true;
		_control ctrlCommit 0;
		true
	};
	
	if ([_target] call object_shop && _distance < 3) exitWith {
		if(([_player] call player_cop) and _target in drugsellarray) then { 
			_control ctrlSetStructuredText parseText format["<t size='1.2' font='EtelkaNarrowMediumPro' color='#ffffff'>Search (E)</t>"];
		}
		else {
			private["_shop_name"];
			_shop_name = (_target call INV_GetShopArray) select 1;
			_control ctrlSetStructuredText parseText format["<t size='1.2' font='EtelkaNarrowMediumPro' color='#ffffff'>%1 (E)</t>",_shop_name];
		};
		
		private["_head_pos"];
		_head_pos = [_target] call name_tags_head_screen;
		_control ctrlSetPosition _head_pos;
		_control ctrlShow true;
		_control ctrlCommit 0;
		
		true
	};
	
	if ([_target] call name_tags_vehicle && _distance < 25) exitWith {
		private["_owner", "_inside_vehicle", "_is_box"];
		_owner = ([player, _target] call vehicle_owner);
		_inside_vehicle = ([player, (vehicle player)] call mounted_player_inside);
		_is_box = _target isKindOf "LocalBasicWeaponsBox";
		
		if (_distance < 5 && not(_inside_vehicle) && not(_is_box)) then {
			
			private["_handled"];
			if (_owner && not(locked _target)) exitWith {
				_control ctrlSetStructuredText parseText format["<t size='1.2' font='EtelkaNarrowMediumPro' color='#00ff00'>Enter (E)</t><br /><t size='1.2' font='EtelkaNarrowMediumPro' color='#ffffff'>Trunk (T)</t>"];
				_handled = true;
			};
			
			if (_owner && (locked _target)) exitWith {
				_control ctrlSetStructuredText parseText format["<t size='1.2' font='EtelkaNarrowMediumPro' color='#00ff00'>Unlock (Press L)</t><br /><t size='1.2' font='EtelkaNarrowMediumPro' color='#ffffff'>Trunk (T)</t>"];
				_handled = true;
			};
		
			if (not(locked _target)) exitWith {	
				_control ctrlSetStructuredText parseText format["<t size='1.2' font='EtelkaNarrowMediumPro' color='#00ff00'>Enter (E)</t>"];
				_handled = true;
			};
		};
		
		private["_center_pos"];
		_center_pos = call name_tags_center_screen;
		_control ctrlSetPosition _center_pos;
		_control ctrlShow true;
		_control ctrlCommit 0;
		_handled
	};
	
	if ([_target] call player_human &&  _distance < 25) exitWith {
		if ([_target, "has_admin_camera"] call player_get_bool) exitWith {};
		
		
		// VICE SCRIPTING
		_targetSide = side _target;
		_skin = typeof _target;
		if ((_skin in viceskins) && (_targetSide == WEST)) exitWith {};
	
		if ([_target] call player_cop) then{ 
			_rank = [_target] call player_get_rank_string;
			_control ctrlSetStructuredText parseText format["<t size='1.2' font='EtelkaNarrowMediumPro' color='#0000ff'>%1 (%2) <br/> - %3 - </t>", _target, (name _target),_rank];
		};
		if (([_target] call player_civilian) && ([_target] call player_get_bounty) > 0) then {
			_control ctrlSetStructuredText parseText format["<t size='1.2' font='EtelkaNarrowMediumPro' color='#ff0000'>%1 (%2)</t><br /><t size='1.2' font='EtelkaNarrowMediumPro' color='#ff0000'>(Criminal)</t>", _target, (name _target)];
		} else {
			if ([_target] call player_civilian) then {
				_control ctrlSetStructuredText parseText format["<t size='1.2' font='EtelkaNarrowMediumPro' color='#ffff00'>%1 (%2)</t>", _target, (name _target)];
			};
		};
		
		if ([_target] call player_opfor) then{ 
			_rank = [_target] call player_get_rank_string;
			_control ctrlSetStructuredText parseText format["<t size='1.2' font='EtelkaNarrowMediumPro' color='#b00000'>%1 (%2) <br/> - %3 - </t>", _target, (name _target),_rank];
		};
		if ([_target] call player_insurgent) then{ 
			_rank = [_target] call player_get_rank_string;
			_control ctrlSetStructuredText parseText format["<t size='1.2' font='EtelkaNarrowMediumPro' color='#31d400'>%1 (%2) <br/> - %3 - </t>", _target, (name _target),_rank];
		};		
		
		if ([_target] call player_esu) then{ 
			_rank = [_target] call player_get_rank_string;
			_control ctrlSetStructuredText parseText format["<t size='1.2' font='EtelkaNarrowMediumPro' color='#ffff00'>%1 (%2) <br/> - %3 - </t>", _target, (name _target),_rank];
		};
		
		private["_head_pos"];
		_head_pos = [_target] call name_tags_head_screen;
		_control ctrlSetPosition _head_pos;
		_control ctrlShow true;
		_control ctrlCommit 0;

		true
	};

	false
};


name_3d_tags_draw = {
	private["_player", "_side"];

	if( isNil "name_tags_side_units") exitWith {};
	
	disableSerialization;
	_player = _this select 0;
	_side = _this select 1;
	

	private["_i"];
	_count = 40;
	_i = 0;
	

	{
		if (not(_i < (count name_3d_controls)) || [_player] call player_civilian ||
			not(alive _player) || visibleMap) exitWith {};
		
		if (true) then {
			private["_control"];
			_control = name_3d_controls select _i;
			
			private["_target", "_cside", "_vehicle"];
			_target = _x;
			_cside = ([_target] call player_side);
			_vehicle = (vehicle player);
			
			if (not(_side == _cside) ||  not(alive _vehicle) || not(isPlayer _target) ||
				not(alive _target) || _target == _player ) exitWith {
				_control ctrlShow false;
			};

			private["_distance"];
			_distance = _target distance _player;
			if (_distance <  5) exitWith {
				_control ctrlShow false;
			};

			private["_part", "_pos", "_pos2D"];
			_part = if ((vehicle _target) == _target) then {"neck" } else {"engine"};
			_pos = (_target selectionPosition _part);

			_pos = [(_pos select 0), (_pos select 1), (_pos select 2) + 0.3];
			_pos2D = worldToScreen((vehicle _target) modelToWorld (_pos));
			if (not(count _pos2D == 2)) exitWith {
				_control ctrlShow false;
			};
		
			private["_size"];
			_size = (1 - _distance/120) max (0.6);
			_pos2D = [((_pos2D select 0)- 0.015), (_pos2D select 1) - 0.015];
			
			
			private["_x", "_y"];
			_x = abs((_pos2D select 0) - 0.5);
			_y = abs((_pos2D select 1) - 0.5);
			private["_aimin_at_center"];
			_aimin_at_center = (_x < 0.01 && _y < 0.01);
			if ((_aimin_at_center || _target == cursorTarget) && _distance > 25) then {
				if ([_target] call player_insurgent) then {
					_control ctrlSetStructuredText parseText format["<img  size=""%1"" color=""#31d400"" image=""resources\images\tri2.paa"" /><br /><t color='#31d400'>[%2-%3, %4 m]</t>", _size, _target, (name _target), round(_distance)];
				};
				if ([_target] call player_cop) then {
					_control ctrlSetStructuredText parseText format["<img  size=""%1"" color=""#002bff"" image=""resources\images\tri2.paa"" /><br /><t color='#002bff'>[%2-%3, %4 m]</t>", _size, _target, (name _target), round(_distance)];
				};				
				
				if ([_target] call player_esu) then {
					_control ctrlSetStructuredText parseText format["<img  size=""%1"" color=""#ffff00"" image=""resources\images\tri2.paa"" /><br /><t color='#002bff'>[%2-%3, %4 m]</t>", _size, _target, (name _target), round(_distance)];
				};
			}
			else {
				if (([_target] call player_insurgent) and !(([_target,"restrained"] call player_get_bool) or ([_target,"ziptied"] call player_get_bool))) then {
					_control ctrlSetStructuredText parseText format["<img  size=""%1"" color=""#31d400"" image=""resources\images\tri2.paa"" />", _size];
				};			
				if (([_target] call player_opfor) and !(([_target,"restrained"] call player_get_bool) or ([_target,"ziptied"] call player_get_bool))) then {
					_control ctrlSetStructuredText parseText format["<img  size=""%1"" color=""#ff0505"" image=""resources\images\tri2.paa"" />", _size];
				};
				if (([_target] call player_cop) and !(([_target,"restrained"] call player_get_bool) or ([_target,"ziptied"] call player_get_bool))) then {
					_control ctrlSetStructuredText parseText format["<img  size=""%1"" color=""#002bff"" image=""resources\images\tri2.paa"" />", _size];
				};				
				
				if (([_target] call player_esu) and !(([_target,"restrained"] call player_get_bool) or ([_target,"ziptied"] call player_get_bool))) then {
					_control ctrlSetStructuredText parseText format["<img  size=""%1"" color=""#ffff00"" image=""resources\images\tri2.paa"" />", _size];
				};
			};
		
			_control ctrlShow true;
			_control ctrlSetPosition _pos2D;
			_control ctrlCommit 0;	
			_i = _i + 1;
		};
	} forEach name_tags_side_units;
	
	while { _i < (count name_3d_controls)} do {
		private["_control"];
		_control = name_3d_controls select _i;
		_control ctrlShow false;
		_i = _i + 1;
	};
};


name_tags_3d_controls_setup = {
	private["_marker_id", "_end"];
	_marker_id = tags_marker_start + 1;
	_end = tags_marker_end + 1;
	
	
	name_3d_controls = if (isNil "name_3d_controls") then { [] } else { name_3d_controls - [controlNull] };
	if (count name_3d_controls > 0) exitWith {};
	
	disableSerialization;
	cutRsc ["Rtags","PLAIN DOWN", 1e+011];
	
	private["_controls", "_display"];
	_controls = [];
	_display = (uiNamespace getVariable 'TAGS_HUD');
	
	while {_marker_id < _end } do {
		private["_control"];
		_control = _display displayCtrl _marker_id;
		_controls set[count(_controls), _control];
		_marker_id = _marker_id + 1;
	};
	name_3d_controls = _controls;
	//player groupChat format["name_3d_controls = %1", name_3d_controls];
	name_3d_controls
};

name_tags_control = {
	( (uiNamespace getVariable 'TAGS_HUD') displayCtrl tags_name_id)
};

onEachFrameHack = {
	//player groupChat format["onEachFrameHack %1", _this];
	[player, ([player] call player_side)] call name_3d_tags_draw;
	
	
	if (not([player, cursorTarget] call name_tags_draw)) then {
		(call name_tags_control) ctrlShow false;
	};
	
};

//loop for making list of units in your own side 
//(this is needed so that we dont go through the full player list each time per frame)
name_tags_side_units = [];
name_tags_loop = {
	private ["_cop","_indy","_civ","_opfor","_esu"];
	if (alive player) then {
		name_tags_side_units = name_tags_side_units - [objNull];
		
		_cop = [player] call player_cop;
		_indy = [player] call player_insurgent;
		_civ = [player] call player_civilian;
		_opfor = [player] call player_opfor;
		_esu = [player] call player_esu;

		if (_civ) exitWith {};

		{
			if !(isNil "_x" and isNull _x) then {
				if (typeName _x == "OBJECT") then {
					if ((alive _x) and (isPlayer _x) and not(_x in name_tags_side_units)) then {
						if (_cop and ([_x] call player_cop)) then {name_tags_side_units set [count(name_tags_side_units), _x];};
						if (_indy and ([_x] call player_insurgent)) then {name_tags_side_units set [count(name_tags_side_units), _x];};
						if (_opfor and ([_x] call player_opfor)) then {name_tags_side_units set [count(name_tags_side_units), _x];};
						if (_esu and ([_x] call player_esu)) then {name_tags_side_units set [count(name_tags_side_units), _x];};
					};
				};	
			};
		} foreach playableUnits;
	};
	[] spawn name_tags_loop;
};

[] spawn name_tags_loop;