
if !(isServer) exitWith {};

dog_loop_run = true;
while {dog_loop_run} do {
	
	{
		_array = _x;
		_dog = _array select 0;
		_player = _array select 1;
		
		if ((isNull _dog) or (isNull _player)) exitWith {
		
			dog_array = dog_array - _x;
			diag_log format ["Removed %1 from dogarray",_array];
			publicVariable "dog_array";
		};
		
	} foreach dog_array;
	
	uiSleep 120;
};