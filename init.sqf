cutText ["", "BLACK OUT"];
taki_init_finished = false;

if(isServer) then
{
	
	call compile preProcessFile "\iniDB\init.sqf";
	diag_log "iniDB\init.sqf COMPLETE";
	titleText ["Database Initialising","PLAIN"]; // Displays text
	execVM "RG\serverGather.sqf";
};

[] execvm "scripts\monitor_init.sqf";
diag_log "scripts\monitor_init.sqf COMPLETE";


titleText ["Initializing Client","PLAIN"]; // Displays text
A_fnc_EH_hDamage = compile (preprocessFileLineNumbers "Awesome\EH\Eh_handledamage.sqf");
diag_log "Awesome\EH\Eh_handledamage.sqf COMPLETE";
A_fnc_EH_hFired = compile (preprocessFileLineNumbers "Awesome\EH\EH_fired.sqf");
diag_log "Awesome\EH\EH_fired.sqf COMPLETE";
A_fnc_EH_hWepasm = compile (preprocessFileLineNumbers "Awesome\EH\EH_weaponassembled.sqf");
diag_log "Awesome\EH\EH_weaponassembled.sqf COMPLETE";
A_fnc_veh_EH_hFired = compile (preprocessFileLineNumbers "Awesome\EH\EH_fired_vehicle.sqf");
diag_log "Awesome\EH\EH_fired_vehicle.sqf COMPLETE";

RG_fnc_iSave = compile preprocessFileLineNumbers "RG\iSave.sqf";
diag_log "RG\iSave.sqf COMPLETE";

enableSaving [false, false];
diag_log "Taki Init - 3";

//waitUntil {!isNil "BIS_fnc_init"};

isClient = !isServer || (isServer && !isDedicated);


_h = [] execVM "core\functions\functions_init.sqf";
waitUntil{scriptDone _h};

_h = [] execVM "Awesome\Functions\encodingfunctions.sqf";
waitUntil{scriptDone _h};
diag_log "Awesome\Functions\encodingfunctions.sqf COMPLETE";

_h = [] execVM "Scripts\removebuildings.sqf";
waitUntil{scriptDone _h};

_h = [] execVM "Scripts\createbuildings.sqf";
waitUntil{scriptDone _h};
diag_log "Scripts\createbuildings.sqf COMPLETE";

_h = [] execVM "Scripts\mosque_remove.sqf";
waitUntil{scriptDone _h};
diag_log "Scripts\mosque_remove.sqf COMPLETE";

if (isServer) then {
	_h = [] execVM "Awesome\MyStats\persist.sqf";
	waitUntil{scriptDone _h};
	execvm "serverside\init.sqf";
};
diag_log "Skipped serverside as isClient";


_h = [] execVM "Awesome\MyStats\functions.sqf";
waitUntil{scriptDone _h};
diag_log "Awesome\MyStats\functions.sqf COMPLETE";


WEST setFriend [EAST, 0];
WEST setFriend [RESISTANCE, 0];
EAST setFriend [WEST, 0];
EAST setFriend [RESISTANCE, 0];
RESISTANCE setFriend [EAST, 0];
RESISTANCE setFriend [WEST, 0];
CIVILIAN setFriend [WEST, 0];
CIVILIAN setFriend [EAST, 0];
CIVILIAN setFriend [RESISTANCE, 0];

diag_log "setFriends Section COMPLETE";


[] execVM "Awesome\Scripts\optimize_1.sqf";
diag_log "Awesome\Scripts\optimize_1.sqf COMPLETE";

["init"] execVM "bombs.sqf";
diag_log "bombs.sqf COMPLETE";

titleText ["Initializing Functions","PLAIN"]; // Displays text


[] execVM "Awesome\Functions\interaction.sqf";
diag_log "Awesome\Functions\interaction.sqf COMPLETE";


call compile preprocessfile "triggers.sqf";

diag_log "triggers.sqf COMPLETE";


if (isClient) then {
	[] execVM "briefing.sqf";
	diag_log "briefing.sqf COMPLETE";
};

_h = [] execVM "broadcast.sqf";
waitUntil{scriptDone  _h};
diag_log "broadcast.sqf COMPLETE";


[]	execVM "strfuncs.sqf"; 
diag_log "strfuncs.sqf COMPLETE";

_h = []	execVM "core\functions\functions.sqf";
waitUntil{scriptDone  _h}; 
diag_log "core\functions\functions.sqf COMPLETE";

_h = [] execVM "4422894.sqf";
waitUntil{scriptDone _h};
diag_log "4422894.sqf COMPLETE";


[]execVM "miscfunctions.sqf";
diag_log "miscfunctions.sqf COMPLETE";
[] execVM "Awesome\Functions\quicksort.sqf";
diag_log "Awesome\Functions\quicksort.sqf COMPLETE";
[] execVM "INVvars.sqf";
diag_log "INVvars.sqf COMPLETE";
[] execVM "Awesome\Functions\bankfunctions.sqf";
diag_log "Awesome\Functions\bankfunctions.sqf COMPLETE";

_h = [] execVM "bankexec.sqf";
waitUntil{scriptDone  _h};
diag_log "bankexec.sqf COMPLETE";

[] execVM "lottoarrays.sqf";
diag_log "lottoarrays.sqf COMPLETE";
[] execVM "initWPmissions.sqf";
diag_log "initWPmissions.sqf COMPLETE";
[] execVM "gfx.sqf";
diag_log "gfx.sqf COMPLETE";
[] execVM "animList.sqf";
diag_log "animList.sqf COMPLETE";

_h = [] execVM "variables.sqf";
waitUntil{scriptDone  _h};
diag_log "variables.sqf COMPLETE";


[] execVM "Awesome\Functions\money_functions.sqf";
diag_log "Awesome\Functions\money_functions.sqf COMPLETE";


[] execVM "Awesome\Functions\gangfunctions.sqf";
diag_log "Awesome\Functions\gangfunctions.sqf COMPLETE";


// Starts up Awesome scripts
_h = [] execVM "Awesome\init.sqf";
waitUntil{scriptDone _h};
diag_log "Awesome\Functions\gangfunctions.sqf COMPLETE";


[] execVM "setPitchBank.sqf";
diag_log "setPitchBank.sqf COMPLETE";

//[] spawn compile preprocessFileLineNumbers "Awesome\Functions\time_functions.sqf";
//diag_log "Awesome\Functions\time_functions.sqf COMPLETE";


//// Start the Drop Cargo Script
execVM "BTK\Cargo Drop\Start.sqf";
diag_log "BTK\Cargo Drop\Start.sqf COMPLETE";

[] execvm "core\loops\esu_mission_loop.sqf";

if (!hasInterface && !isServer) then {
	HCName = name player;
	headlessClient = true;
	publicVariable "headlessClient";
	publicVariable "HCName";
	
};


if (isServer) then {
	[] execvm "serverinit.sqf";
	[] call bankloopnew;
};
if(isClient) then {
	[] execvm "clientinit.sqf";
	diag_log "clientinit.sqf COMPLETE";
};
taki_init_finished = true;










