patrolling = true;

_task = player createSimpleTask ["Patrol"];

while {patrolling} do {
	_location =  coppatrolarray select round random (count coppatrolarray - 1);
	_marker = createMarkerLocal ["patrolmarker",_location];
	"patrolmarker" setmarkertypelocal "warning";
	"patrolmarker" setmarkercolorlocal "coloryellow";
	"patrolmarker" setmarkersizelocal [1, 1];
	"patrolmarker" setmarkertextlocal "Patrol point";
	
	
	_task setSimpleTaskDestination _location;
	player setCurrentTask _task;
	player sidechat "A patrol area has been marked. Head over there.";
	
	_distance = getpos player distance _location;
	
	waitUntil {player distance _location <= 30};
	
	_task setTaskState "Succeeded";
	deleteMarkerLocal "patrolmarker";
	deleteWaypoint [group player, 0];
	_task = player createSimpleTask ["Patrol"];
	
	_moneyearned = (ceil(_distance * patrolmoneyperkm));
	[player, _moneyearned] call transaction_dynamiccuntflap;
	[player, 2] call player_increase_rank;
	player sidechat format["You earned $%1 for patroling", _moneyearned];
	player sidechat "please wait a moment for a new patrol point";
};

