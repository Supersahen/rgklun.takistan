_handler = [] execVM "workplacesettings.sqf";
waitUntil {scriptDone _handler};

if (isServer) then
{
[0,0,0,["serverloop"]] execVM "core\missions\assassination.sqf";
[0,0,0,["serverloop"]] execVM "core\missions\hostage.sqf";
};

