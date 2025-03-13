_bullet			= _this select 1;
_this			= _this select 0;

_unit 			= _this select 0;
_weapon			= _this select 1;
_muzzle			= _this select 2;
_mode			= _this select 3;
_ammo			= _this select 4;
_magazine		= _this select 5;
_projectile		= _this select 6;

_BPos = [];

//player groupchat "running";
_Poison_gas =
{
	_pos = _this select 0;
	_timenow = time;
	while{time < (_timenow + 10) || (!(isnull _pos))}do
		{
			uiSleep 1;
			if(!(isnull _pos))then
				{
					if(count(nearestObjects [_pos, ["Man"], 10]) > 0)then
						{
							{
								_maskCT = [_x,"gasmask_on"] call INV_GetItemAmount;
								if (_maskCT >= 1) exitWith {};
								_dmg = damage _x;
								_dmg = _dmg + 0.1;
								_x setdamage _dmg;
							} foreach nearestObjects [_pos, ["Man"], 10];
						};
				};
		};
};

while {!isNull _bullet and ((velocity _bullet)select 0 > 0.1)} do {
	_BPos = getPosATL _bullet;
};

[_bullet] spawn _Poison_gas;