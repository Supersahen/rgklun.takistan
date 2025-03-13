// script by cis272 :3

_selection = ((_this select 3)select 0);

_moneyearned = 0;
_distance = 0;


if (_selection == "start") then
{

opfmissionactive = true;
deleteMarkerLocal "missionmarker";


_newmarker = (floor(random(count opfmissionarray)));
_markerlocation = (opfmissionarray select _newmarker);

_markerobj = createmarkerlocal ["missionmarker",[0,0]];
_markername = "missionmarker";
_markerojb setmarkershapelocal "icon";
//"missionmarker" setMarkerBrushLocal "solid";
"missionmarker" setmarkertypelocal "defend";
"missionmarker" setmarkercolorlocal "colorred";
"missionmarker" setmarkersizelocal [1, 1];
"missionmarker" setmarkertextlocal "Defend Point";
_markername Setmarkerposlocal _markerlocation;

player sidechat "Your mission will be available shortly, simply get to the defend point and protect it for 5 minutes.";

uiSleep 2;
_plocation = getpos player;
_distance = _plocation distance _markerlocation;

while {opfmissionactive} do {
	if (player distance _markerlocation <= 150) then
		{
		uiSleep 300;
		
		if (player distance _markerlocation > 150) exitWith 
		
		{
		player sidechat "You did not stay in the defend area for 5 minutes and will not receive your payment!"
		};
		
		deleteMarkerLocal "missionmarker";
		_moneyearned = (opfmissionmoney);
		[player, _moneyearned] call transaction_dynamiccuntflap;
		player sidechat format["You earned $%1 for defending.", _moneyearned];
		player sidechat "Please wait a moment for a new defend point.";

		uiSleep 5;

		_newmarker = (floor(random(count opfmissionarray)));
		_markerlocation = (opfmissionarray select _newmarker);

		_markerobj = createmarkerlocal ["missionmarker",[0,0]];
		_markername = "missionmarker";
		_markerojb setmarkershapelocal "icon";
		//"missionmarker" setMarkerBrushLocal "solid";
		"missionmarker" setmarkertypelocal "defend";
		"missionmarker" setmarkercolorlocal "colorred";
		"missionmarker" setmarkersizelocal [1, 1];
		"missionmarker" setmarkertextlocal "Defend Point";
		_markername Setmarkerposlocal _markerlocation;
		player sidechat "New defend point added.";

		_plocation = getpos player;
		_distance = _plocation distance _markerlocation;


		};

	uiSleep 5;
	};
deleteMarkerLocal "missionmarker";



};

if (_selection == "end") then
{
opfmissionactive = false;
deleteMarkerLocal "missionmarker";
player sidechat "Defend mission ended you must wait 60 seconds to get a new one.";
opfmissionwaittime = true;
uiSleep 60;
opfmissionwaittime = false;

};


