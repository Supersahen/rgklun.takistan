// script written by Eddie Vedder for the Chernarus life Revivved mission


uiSleep 10;
govconvoygroup = createGroup west;
//[format["%1 (%2, %3, %4) - govermentconvoy: group created %5",  round(time), player, (name player), (getPlayerUID player), govconvoygroup]] call l4a;
_counter = 0;
_counter2 = 0;
_added = false;
_sidewon = "Neither";


while {true} do  {	
	
//waits for respawn
uiSleep (convoyrespawntime*54);

"hint ""The Government convoy will leave in a few minutes."";" call broadcast;

uiSleep (convoyrespawntime*6);

//Gets position to spawn
_array  = [[convspawn1, 10], [convspawn2, 10], [convspawn3, 10], [convspawn4, 10], [convspawn5, 10]];
_spawn   = (floor(random(count _array)));						
_pos    = (_array select _spawn) select 0;
_radius = (_array select _spawn) select 1;

// spawn markers truck and soldiers
_markerobj = createMarker ["convoy",[0,0]];																				
_markername = "convoy";																														
_markerobj setMarkerShape "ICON";								
"convoy" setMarkerType "Marker";										
"convoy" setMarkerColor "ColorRed";																														
"convoy" setMarkerText "Government Convoy";



convoy_marker_active = 1;
convoyhascash=true; publicvariable "convoyhascash";

convoytruck = createVehicle ["Ural_TK_CIV_EP1", (getPosATL _pos), [], 0, "NONE"];


convoytruck setVehicleInit "
convoytruck = this; 
this setVehicleVarName ""convoytruck"";  
this setAmmoCargo 0;  
clearweaponcargo this;
clearmagazinecargo this;
";	
processinitcommands;
publicvariable "convoytruck"; 


//start mission loop
"server globalchat ""The supply truck has spawned. The police must defend it against bandits and terrorists!"";" call broadcast;
while {true} do {
	
	"if(alive player and isciv and player distance convoytruck <= 150)then{titleText [""The Government is operating in this area! Turn back or you will be shot!"", ""plain down""]};" call broadcast;
	"convoy" setmarkerpos getpos convoytruck;		
	if (!convoyhascash) exitwith
		{
		_sidewon = "Civs";
		};
		

			
	if (convoytruck distance copbase1 < 150) exitwith 
		{   
		"if (iscop) then {[player, govconvoybonus] call transaction_dynamiccuntflap; player sidechat format[""you received $%1 for the successfully escorting the convoy"", govconvoybonus];};" call broadcast;
		_sidewon = "Cops";
		};
				
	if (_counter2 >= 900) exitwith
		{
		_sidewon = "Neither";
		};
		
	if (!alive convoytruck) exitwith
		{
		"server globalchat ""The government truck has been destroyed the shekels have burned"";" call broadcast;
		_sidewon = "Neither";
		};
			
	_counter2 = _counter2 + 1;
	
	_counter = _counter + 1;
	
	uiSleep 1;
		
	};
	
//mission has ended resetting vars and deleting units



(format ['server globalChat "%2 side won the government convoy mission, next truck leaves in %1 minutes!";', convoyrespawntime, _sidewon]) call broadcast;

deletevehicle convoytruck;
//deleteGroup govconvoygroup;
deletemarker "convoy";

_endmissionounter = 0;
_counter = 0;
_counter2 = 0;
_sidewon = "Neither";
moneyintruck = true;
_added = false;

};






//written by Gman
