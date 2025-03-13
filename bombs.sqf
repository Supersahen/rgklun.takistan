_art = _this select 0;

if (_art == "init") then {
    INV_ServerBombArray = [];
    INV_LocalBombArray  = [];

    if (time > 120) then {
		INV_BombGetServerArray = true;
		publicVariable "INV_BombGetServerArray";
    } 
    else {
		INV_BombGetServerArray = false;
    };

    INV_BombSpawn = {
        if ((typeName _this) == "OBJECT") then {
            if (not(isNull _this)) then {
                if (((getPosATL _this) select 2) < 5) then {
                    createVehicle ["Bo_GBU12_LGB", (getPosATL _this), [], 0, "NONE"];
                        
                    //if (player distance _this < 25) then {player setdamage 1;}; // All players within 25m die instantly
                    // _this setDamage 1;
                        
                    if (!(_this isKindOf "Man")) then {
                        _men1 = (crew _this); 
                        {
 
                            _has_admin_camera = _x getVariable ["has_admin_camera", false];
                            if !(_has_admin_camera) then {
									 _x setDamage 1;
                                };               
                        } forEach _men1;            
                    };
                        
                    _men2 = nearestObjects[getPosATL _this, ["Man", "LandVehicle", "Air"], 25];

                    {
                        _has_admin_camera = _x getVariable "has_admin_camera";
                        if ( !(isnil "_has_admin_camera") && _has_admin_camera) then {
                        } 
                        else {
                            _x setDamage 1;
                        };
                        
                        if(!(_x isKindOf "Man")) then {
                            _men3 = crew _x;
                            {
                                _has_admin_camera = _x getVariable "has_admin_camera";
                                if ( !(isnil "_has_admin_camera") && _has_admin_camera) then {
									
								} else {
									_x setDamage 1;
								};
                            } forEach _men3;
                        };
                    } forEach _men2;
                };
            };
        } 
        else {
            createVehicle ["Bo_GBU12_LGB", (_this), [], 0, "NONE"];
            //if (player distance _this < 25) then {player setdamage 1;}; // All players within 25m die instantly
            _men2 = nearestObjects[_this, ["Man", "LandVehicle", "Air"], 25];
                
            {
                _x setDamage 1;
                        
                if(!(_x isKindOf "Man")) then {
					_men3 = crew _x;
					{
						_x setDamage 1;
					} forEach _men3;
				};
                        
            } forEach _men2;
        };
    };

    INV_BombIdExists = {
        private["_result", "_i"];
        _result = false;

        for [{_i=0}, {_i < (count INV_ServerBombArray)}, {_i=_i+1}] do {
			if (((INV_ServerBombArray select _i) select 0) == _this) exitWith {_result = true;};
		};
        _result;
    };

    INV_BombAdd = {
        INV_ServerBombArray = INV_ServerBombArray + [[ (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5) ]];
        if (player == (_this select 0)) then {
			INV_LocalBombArray = INV_LocalBombArray + [[ (_this select 1), (_this select 2), (_this select 3), [] ]];
		};
    };

    INV_BombDelete = {
        private["_name", "_id", "_i", "_j", "_actionArr"];
        _id = _this;

        for [{_i=0}, {_i < (count INV_ServerBombArray)}, {_i=_i+1}] do {
            if (((INV_ServerBombArray select _i) select 0) == _id) exitWith {
                INV_ServerBombArray set [_i, ""];
                INV_ServerBombArray = INV_ServerBombArray - [""];
            };
        };

        for [{_i=0}, {_i < (count INV_LocalBombArray)}, {_i=_i+1}] do {
            if (((INV_LocalBombArray select _i) select 0) == _id) exitWith {
                if (alive(vehicle player)) then {
                    _actionArr = ((INV_LocalBombArray select _i) select 3);
                    for [{_j=0}, {_j < (count _actionArr)}, {_j=_j+1}] do {
                        (vehicle player) removeAction (_actionArr select _j);
                    };
                };

                INV_LocalBombArray set [_i, ""];
                INV_LocalBombArray = INV_LocalBombArray - [""];
            };
        };
    };

    INV_BombEdit = {
        private["_id", "_settings", "_i"];
        _id       = (_this select 0);
        _settings = (_this select 1);

        for [{_i=0}, {_i < (count INV_ServerBombArray)}, {_i=_i+1}] do {
            if (((INV_ServerBombArray select _i) select 0) == _id) exitWith {
                (INV_ServerBombArray select _i) set [4, _settings];
            };
        };
    };
	
	INV_BombVehicle = {
			private["_id", "_vehicle", "_i"];
			
			_id = _this select 0;
			_vehicle = objNull;
			
			for [{_i=0}, {_i < (count INV_ServerBombArray)}, {_i=_i+1}] do {
					if (((INV_ServerBombArray select _i) select 0) == _id) exitWith {
							_vehicle = ((INV_ServerBombArray select _i) select 1);
						};
				};
			
			_vehicle
		};

    if (isServer) then {["server"] spawn A_SCRIPT_BOMBS;};
    //["client"] spawn A_SCRIPT_BOMBS;
};

if (_art == "server") then {
    _lastLength = 0;

    while {true} do {
        _skipWait = false;
        for [{_i=0}, {_i < (count INV_ServerBombArray)}, {_i=_i+1}] do {
            _array    = (INV_ServerBombArray select _i);
            _id       = _array select 0;
            _vehicle  = _array select 1;
            _name     = _array select 2;
            _status   = _array select 3;
            _settings = _array select 4;

            if (isNull(_vehicle)) exitWith {
                format["""%1"" call INV_BombDelete", _id] call broadcast;
                _skipWait = true;
            };

            if (not(alive(_vehicle)))  exitWith {
                format["""%1"" call INV_BombDelete", _id] call broadcast;
                _skipWait = true;
            };
        };

        if ( (INV_BombGetServerArray) ) then {
            _lastLength = count INV_ServerBombArray;
            INV_BombGetServerArray = false;
            publicVariable "INV_ServerBombArray";
        };
        
        if (!_skipWait) then {
            uiSleep 1;
        };
    };
};

if (_art == "client") then {
    _a1=0; _a2=0; _a3=0; _a4=0; _a5=0; _v=0;
    while {true} do {
        _skipWait = false;
        for [{_i=0}, {_i < (count INV_LocalBombArray)}, {_i=_i+1}] do {
            _array    = (INV_LocalBombArray select _i);
            _id = _array select 0;
            _vehicle  = _array select 1;
            _item = _array select 2;
            _actionArr= _array select 3;
            
            if (isNull(_vehicle)) exitWith { 
                format["""%1"" call INV_BombDelete", _id] call broadcast; _skipWait = true; 
            };
            
            if (not(alive(_vehicle)))  exitWith { 
                format["""%1"" call INV_BombDelete", _id] call broadcast; _skipWait = true; 
            };
           
            
            if (vehicle player != _vehicle) then {
                for [{_j=0}, {_j < (count _actionArr)}, {_j=_j+1}] do { _vehicle removeAction (_actionArr select _j); };
                _actionArr = [];
            };
            (INV_LocalBombArray select _i) set [3, _actionArr];
        };
        
        if (!_skipWait) then {
            uiSleep 3;
        };
    };
};

if (_art == "plant") then {
    _item = _this select 1;
    _id = format["%1_%2", player, round(time)];
    _vcl = vehicle player;
    _settings   = [];
    _exit      = 0;
    _explosion = 0;
    if (vehicle player == player) exitWith {
        player groupChat localize "STRS_inv_item_vehiclebomb_notinvehicle";
    };
        
    format ["if (player in %1) then {player groupChat format[localize ""STRS_inv_item_vehiclebomb_legen_gesehen"", %2];};", _vcl, player] call broadcast;
    player groupChat format[localize "STRS_inv_item_vehiclebomb_planted", _id];
    
    format[ "[%1, ""%2"", %3, ""%4"", ""%5"", %6] call INV_BombAdd;", player, _id, _vcl, _item, "planted", _settings] call broadcast;
    [player, _item, (-1)] call INV_AddInventoryItem;
};

if (_art == "config") then {
    _art  = _this select 1;
    _name = _this select 2;
    _id   = _this select 3;
    if (!(_id call INV_BombIdExists)) exitWith {player groupChat localize "STRS_inv_item_vehiclebomb_notexist,";};
};
