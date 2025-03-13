	
	_h = [] execVM "Awesome\MyStats\persist.sqf";
	waitUntil{scriptDone _h};
	execvm "serverside\init.sqf";
	//[] execvm "makesnow.sqf";
	["server"] execVM "bombs.sqf";
	[0, 0, 0, ["serverloop"]] execVM "core\loops\mayorserverloop.sqf";
	[0, 0, 0, ["serverloop"]] execVM "core\loops\chiefserverloop.sqf";
	[0, 0, 0, ["serverloop"]] execVM "core\loops\CommanderServerLoop.sqf";
	[] execVM "Scripts\gangs\gang_loop_server.sqf";
	[] execVM "drugreplenish.sqf";
	[] execVM "governmentconvoy.sqf";
	[] execvm "core\loops\dog_loop.sqf";
	