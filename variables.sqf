//=================================================================================
INV_smscost              = 25;
add_civmoney             = 10000;
add_insmoney             = 17000;
warfare					 = false;
martiallaw				 = false;
add_copmoney             = 18000;
medical_system_enabled = false;

backpack_locked = false;
backpack_gear = [];
stunning = false;
jointops = false;
commanderaccepted = false;
chiefaccepted = false;
hud_jointopsstatus = "Not Joint Ops";


admin_menu_filter = false;
esp_loop_toggle = false;
refueling = false;

hacking_bitch = false;
online_during_hacker = 0;

player_total_playtime = 0;
player_logins = 0;
player_interacting = false;

civ_array = [
	"civ1","civ2","civ3","civ4","civ5","civ6","civ7","civ8","civ9","civ10",
	"civ11","civ12","civ13","civ14","civ15","civ16","civ17","civ18","civ19","civ20",
	"civ21","civ22","civ23","civ24","civ25","civ26","civ27","civ28","civ29","civ30",
	"civ31","civ32","civ33","civ34","civ35","civ36","civ37","civ38","civ39","civ40",
	"civ41","civ42","civ43","civ44","civ45","civ46","civ47","civ48","civ49","civ50",
	"civ51","civ52","civ53","civ54","civ55","civ56","civ57","civ58","civ59","civ60",
	"civ61","civ62","civ63","civ64"
];

esu_array = [
	"esu1","esu2","esu3","esu4","esu5"
];
cop_array = [
	"cop1","cop2","cop3","cop4","cop5",
	"cop6","cop7","cop8","cop9","cop10",
	"cop11","cop12","cop13","cop14","cop15",
	"cop16","cop17","cop18","cop19","cop20",
	"cop21","cop22"
];	
ins_array = [
	"ins1","ins2","ins3","ins4","ins5",
	"ins6","ins7","ins8","ins9","ins10",
	"ins11"
];

opfor_array = [
	"opf1","opf2","opf3","opf4","opf5",
	"opf6","opf7","opf8","opf9","opf10",
	"opf11","opf12","opf13","opf14","opf15",
	"opf16","opf17","opf18","opf19","opf20",
	"opf21","opf22"
];


CopWaffenAvailable       = 0;
CopInPrisonTime          = 180;
shooting_self            = 0;
srHinbewegen             = 0;
police_agreement = false;
["isstunned", false] call stats_init_variable;
hatGanggebietErobert     = false;
CivTimeInPrison          = 0;
CopLog                   = [];
MayorTaxes               = 0;
MayorTaxPercent          = 35;
chiefSteuern             = 0;
INV_ActionInUse = false;
carmagedon = false;
INV_InventarPistol 		 = "";
INV_InventarSMG			 = "";



// DRONES
drone_testing = false;
drone_deployed = false;
drone_control_pos = 3;
stock_shares = [

];



chiefBekommtSteuern      = 35;
commanderSteuern             = 0;
commanderBekommtSteuern      = 35;
spawned = false;
eigene_zeit              = time;
cop_blacklist = false;
player_jailtime = 0;
statsLoaded = 0;
dog_array = [];
startmoneh                   = 500000;
spectate_target = nil;
defense_active = false;
siren_shortDur     = 1.866;
siren_longDur      = 4.8;
esusiren = 5.2;
skip_respawn = false;
blacklists = [false,false,false,false];


player_bail = 0;
processing = false;
DefaultLaws = [
	"Always Drive on the RIGHT side of the road", 
	"Always Holster weapons in Towns 1k/1min jail.",
	"Completing an assassination mission is murder.",
	"Failure to pull over is a crime.",
	"Being near a methlab\gangarea\sell point is reasonable suspicion to search.",
	"You may be searched at will on the NAF.",
	"Occupying a police vehicle is KOS.",
	"Blank Law",
	"Blank Law"
];

defense_array = [
	["Rasman",getmarkerpos "defense_rasman"],
	["Bank",getmarkerpos "defense_bank"],
	["North Oilrigs",getmarkerpos "defense_oilrigs"],
	["Checkpoint Alpha",getmarkerpos "defense_cpa"],
	["Checkpoint Bravo",getmarkerpos "defense_cpb"],
	["Checkpoint Charlie",getmarkerpos "defense_cpd"],
	["Jail",getmarkerpos "defense_jail"],
	["Truck Stop",getmarkerpos "defense_truckstop"],
	["Gas Station 1",getmarkerpos "defense_gs1"]
];

defense_array_opf = [
	["Checkpoint Alpha",getmarkerpos "defense_cpa"],
	["Checkpoint Bravo",getmarkerpos "defense_cpb"],
	["Checkpoint Charlie",getmarkerpos "defense_cpd"],
	["Border Breach Alpha",getmarkerpos "defense_breach_alpha","You Have Been Assigned To Defend A Border Breach From Trespassers!"],
	["Border Breach Bravo",getmarkerpos "defense_breach_bravo","You Have Been Assigned To Defend A Border Breach From Trespassers!"],
	["Gang Area 3",getmarkerpos "defense_ga3","You Have Been Tasked To Raid A Gang Area From Criminals!"],
	["Truck Shop",getmarkerpos "defense_truckshop_south"],
	["Hashish Emporium",getmarkerpos "defense_hashish"]
	];

rise_phone_buttons = [
	["Keychain", "resources\images\phone\keys_icon.paa", "closedialog 0; [] call keys_dialog;", "true", "View and trade your vehicle keys"],
	["Player Info", "resources\images\phone\licenses_icon.paa","closedialog 0; [""spielerliste""] spawn dialog_handler;", "true", "View your character information"],
	["Settings", "resources\images\phone\settings_icon.paa", "closedialog 0;[""Einstellungen""] call A_SCRIPT_SETTINGS;", "true", "Modify game and system preferences"],
	["My Gang", "resources\images\phone\gangs_icon.paa", "closedialog 0;[""gangmenu""] spawn dialog_handler;", "isciv", "View and/or manage your current gang"],
	//["Loans", "resources\images\phone\loan_shark.paa", "createDialog ""life_loan_menu""", "true", "Take out and pay back loans"],
	["Appstore", "resources\images\phone\appstore.paa", "closedialog 0; [] call phone_appstore", "true", "Buy Apps"],
	["Banking", "resources\images\phone\banking.paa", "closedialog 0; [] call phone_banking", "true", "Withdraw and deposit money"],
	["Warrants", "resources\images\phone\warrants_icon.paa", "closedialog 0; [""coplog""] spawn dialog_handler;", "(playerSide == west or playerSide == east or pmc)", "Index of criminals and warrants"],
	["Create Warrants", "resources\images\phone\warrants_icon.paa", "closedialog 0; [] call interact_warrants_menu;", "iscop or isopf", "Opens a menu to submit a warrant"],
	["Jail Cam", "resources\images\phone\jailcam.paa", "closedialog 0; [0,1,2,[""jailcam""]] execVM ""copcams.sqf"";", "iscop or isopf", "Opens a menu to submit a warrant"],
	["Sat Cam", "resources\images\phone\satcam.paa", "closedialog 0;[ [(getPosATL player select 0), (getPosATL player select 1), 200] ] execVM ""satcam.sqf"";", "(playerSide == west or playerSide == east)", "Opens a satelite link"],
	["Fix Sidemarkers", "resources\images\phone\sidemarkers.paa", "[player] call name_tags_3d_controls_setup;", "(iscop or isins or isopf)", "Fixes sidemarkers"],
	["Toggle Markers", "resources\images\phone\markers.paa", "[player] call interact_toggle_side_markers;", "(iscop or isins or isopf)", "Toggles team markers on the map"],
	["Accept Call", "resources\images\phone\acceptcall.paa", "[] call dispatch_accept", "iscop", "Tasks a 911 call to respond to"],
	["End Call", "resources\images\phone\endcall.paa", "[] call dispatch_remove", "iscop", "Ends current 911 call"],
	["Dispatch PC", "resources\images\phone\dispatch.paa", "closedialog 0; [""police_database""] spawn dialog_handler;", "iscop", "Opens dispatch logs"],
	["Global Messaging", "resources\images\phone\globalmessage.paa", "closedialog 0; [""global_message""] spawn dialog_handler;", "true", "Global Messaging App"],
	["Stock Market", "resources\images\phone\stocks.paa", "closedialog 0; [] call stock_dialog", "true", "Invest money"]
];
rise_phone_actions = [];

dog_actions_active = false;

load_gear = [];

ticket_reasons = [
	"Speeding",
	"Wreckless Driving",
	"Wreckless Flying",
	"Property Damage",
	"Damage To Police Property",
	"Illegal Firearm",
	"Illegal Items",
	"Failing To Yield",
	"Illegal Parking",
	"Disorderly Conduct",
	"Bounty",
	"Loitering",
	"Other"
];

arrestable_charges = [

	["Terrorism",20,"",true],
	
	
	["Evading Police",6,"",true],
	["Evading Checkpoint",6,"",true],
	["Illegal Border Crossing",10,"",true],
	
	["Murder",15,"",true],
	["Attempted Murder",7,"",true],
	["Manslaughter",5,"",false],
	["Assault",5,"",false],
	["Kidnapping / Hostage Taking",10,"",true],
	
	["Robbery",6,"",false],
	["Bank Robbery",10,"",true],
	
	["Domestic Violence",3,"",false],
	["Vehicle Theft",3,"",false],
	
	// Posession Crimes
	["Drug Trafficking",20,"",true],
	["Organ Trafficking",20,"",true],
	["Organ Posession",5,"",false],
	["Drug Posession",5,"",false],
	["Receiving Stolen Property",5,"",false],
	
	
	// Disorderly Interfering
	["Interfering With Police",3,"",false],
	["Disorderly Conduct",2,"",false],
	["Tampering With A Body",6,"",true],
	["Aiding and abetting",5,"",false],
	["Tresspassing",2,"",false],
	["Tampering With Evidence",3,"",false],

	["Failing To Pay A Fine",3,"",false],
	
	
	["Prison Breaking",20,"",true],

	["Corruption",20,"",true],
	["Excessive Traffic Violations",4,"",false],
	["War Crimes",20,"",true],
	["Other",5,"",false]

];

arrest_charges = [];

player setVariable ["faction_rank",0,true];
player_rank = 0;
dog_cost = 100000;
contracttypes = ["Sector Control (Alpha)","Sector Control (Bravo)","Sector Control (Truck Stop)","Sector Control (Delta)","Sector Control (Gang Area)","Sector Control (Checkpoint)","Sector Control (Rasman)","Security","Capture","Checkpoint Assistance", "Other"];
contracted = false;


// CUSTOM
adminslots = ["Cop21","Cop22","opf21","opf22","un14"];
srtslots = ["Cop16","Cop17","Cop18","Cop19","Cop20"];
osfslots = ["opf16","opf17","opf18","opf19","opf20"];
pmcslots = ["civ1","civ2","civ3","civ4","civ5"];
// Police Dispatch
dispatch_response = false;
dispatch_active = false;
dispatch_cooldown = false;
dispatch_banned = false;
dispatch_call = false;
dispatch_database = [];
retribution_testing = false;
phonetesting = true;
dog_bought = false;
testing = false;

testing_stuns = false;
sitting = false;
transporting = false;
pmc = false;
srt = false;
osf = false;
ziptied = false;
smg_array = ["MP5A5","MP5SD","AKS_74_U","bizon","bizon_silenced","bizon_silenced","VSS_vintorez","m8_compact_pmc","Sa58V_CCO_EP1","M8_compact","G36C"];
current_horn = "policehorn3";
allow_battlecry = true;
vip_weapons_array = ["BAF_AS50_scoped","M107","BAF_L85A2_RIS_CWS","ksvk","m107","AKS_74_GOSHAWK"];
admin_zone = [7052.15,15454.9,0.00134277];
vice = false;
viceskins = ["Functionary1","Functionary2","Citizen2_EP1","CIV_EuroMan02_EP1"];

terror_watchlist = [];

beanbag_rounds = ["B_12Gauge_74Slug"];
beanbag_guns = ["M1014","AA12_PMC","Saiga12K"];

rubber_rounds = ["B_9x19_SD"];
rubber_round_guns = ["MP5A5","MP5SD"];


cop_car_names = ["SUV_UN_EP1_retex"];

appstore = [
	["Banking App","banking_app",100000],
	["Mobile Market","market_app",100000],
	["-Suggestions Welcomed-","banking_app",100000]


];


// Admin
isMod = false;
isDeveloper = false;
isSnAdmin = false;
isAdmin = false;
istsh = false;
isstaff = false;

// Donor
donator1 = false;
donator2 = false;
donator3 = false;
donator4 = false;
isdon = false;
isvip = false;
//Blacklist
cop_blacklist = [];
un_blacklist = [];
opfor_blacklist = [];




money_limit              = 99999999;
bank_limit               = 99999999;

wantedbonus              = 35000;
monehStehlenMax          = 200000;
gtbonus                  = 10;
gtactive                 = false;
keyblock                 = false;
maxmanitime              = 2400;
powerrestorecost         = 10000;
impoundpaycoef           = 0.15;
noholster                = false;
MGcost                   = 10000;
PKcost                   = 10000;
SQUADcost                = 20000;
maxinfai                 = 16;
firestrikes              = 3;
totalstrikes             = 3;
firestrikesveh			 = 3;
totalstrikesveh			 = 3;
facworkercost            = 15000;
fvspam                   = false;
maxfacworkers            = 50;
maxfacworkers2           = 41;
firingcaptive            = false;
pickingup                = false;
giving              	 = false;
dropping                 = false;
lockpickchance           = 15;
planting                 = false;
drugstockinc             = 900;
druguserate              = 120;

currecciv               = false;
curreccop               = false;
currecins               = false;
currecred               = false;

buybi                   = false;

//========robbing variables===========
stolenfromtime          = 300;
stolenfromtimeractive   = false;  // dont change
//========AWESOME===========

stunshots              = 0;
stunshotsmax           = 3;

stunloop               = false;

MaxStunTime            = 15;

StunActiveTime         = 0;
StunTimePerHit         = 15;

Stuntimelight          = 5;

M_punch                = 1.5;

stunpistolfront        = 10;
stunpistolback         = 15;

stunriflefront         = 15;
stunrifleback          = 20;

stunpronecrit          = 30;
stunpronehev           = 25;
stunpronereg           = 20;

stunfrontcrit          = 25;
stunfronthev           = 20;
stunfrontreg           = 15;

stunbackcrit           = 30;
stunbackhev            = 25;
stunbackreg            = 25;

M_prone_crit           = 0.1;
M_prone_hev            = 0.05;
M_prone_reg            = 0.01;

M_front_crit           = 0.05;
M_front_hev            = 0.01;
M_front_reg            = 0.005;

M_back_crit            = 0.5;
M_back_hev             = 0.1;
M_back_reg             = 0.05;

pmcopmax               = 3;
pmccoplimit            = 0;
pmccoptimer            = 60 * 30;
pmccoptimerz           = false;

S_LOADED               = false;
A_running              = false;

A_actions              = compile preprocessfilelinenumbers "actions.sqf";
A_actionsremove        = compile preprocessfilelinenumbers "actionsRemove.sqf";

//huntingarray           =
//[
    //["hunting1", "Hunting Area 1 - Chickens, Cows",     500, ["Hen", "Cock", "Cow", "Cow01", "Cow02", "Cow03", "Cow04", "Cow01_EP1"], [35,5,5,5,5,5,5,5], [25,25,25,75,55,15,25,35]],
    //["hunting2", "Hunting Area 2 - Boars, Rabbits",     500, ["WildBoar", "Rabbit"], [35,50], [120,30]],
    //["hunting3", "Hunting Area 3 - Dogs, Sheep",         500, ["Pastor", "Fin", "Sheep", "Sheep02_EP1"], [5,5,40,10], [200,150,60,120]],
    //["hunting4", "Hunting Area 4 - Boars, Rabbits",     500, ["WildBoar", "Rabbit"], [35,50], [120,30]],
    //["hunting5", "Hunting Area 5 - Goats",                 500, ["Goat", "Goat01_EP1", "Goat02_EP1"], [10,10,10], [350, 800, 175]]
//];

backup_cop_weapons      =
[
    "ItemMap",
    "ItemRadio",
    "ItemCompass",
    "ItemWatch",
    "m16a4"
];

backup_cop_magazines    =
[
    "15Rnd_9x19_M9",
    "15Rnd_9x19_M9",
    "15Rnd_9x19_M9SD",
    "15Rnd_9x19_M9SD",
    "30Rnd_556x45_Stanag",
    "30Rnd_556x45_Stanag",
    "30Rnd_556x45_Stanag",
    "30Rnd_556x45_Stanag",
    "30Rnd_556x45_Stanag",
    "30Rnd_556x45_Stanag",
    "SmokeShell",
    "SmokeShell",
    "HandGrenade",
    "HandGrenade"
];

backup_opf_weapons      =
[
    "ItemMap",
    "ItemRadio",
    "ItemCompass",
    "ItemWatch",
    "Makarov",
    "AK_74_GL_kobra"
];
backup_opf_magazines    =
[
    "8Rnd_9x18_Makarov",
    "8Rnd_9x18_Makarov",
    "30Rnd_545x39_AK",
    "30Rnd_545x39_AK",
    "30Rnd_545x39_AK",
    "30Rnd_545x39_AK",
    "30Rnd_545x39_AK",
    "30Rnd_545x39_AK",
    "HandGrenade_East",
    "HandGrenade_East"
];

backup_ins_weapons      =
[
    "ItemMap",
    "ItemRadio",
    "ItemCompass",
    "ItemWatch",
    "AK_47_S"
];
backup_ins_magazines    =
[
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_AK47",
    "HandGrenade_East",
    "HandGrenade_East"
];


//========AWESOME===========


//===============MOTD==================
motdwaittime            = 120;

//===============Cop Patrol==================

pmissionactive          = false;
patrolwaittime          = false;
patrolmoneyperkm        = 7.0;  // 1 would be equal to $7,000 for 1KM

//===============Opfor Missions==================

opfmissionactive      = false;
opfmissionwaittime    = false;
opfmissionmoney       = 250000;

//=========government convoy=============
govconvoybonus          = 1000000;
convoyrespawntime       = 30;  //reset to 30 after testing
moneyintruck            = true; //dont change

//===== Gas station robbing
wantedamountforrobbing  = 35000;

//if(debug)then{drugstockinc = 6;druguserate = 20};
//==============================PETROL/OIL=========================================
[] execvm "fuel_vars.sqf";


//==============================MINING=============================================
shoveldur=20;
shovelmax=2;
pickaxedur=50;
pickaxemax=3;
hammerdur=100;
hammermax=4;
working=false;

//===============================GANGS=============================================
gangincome          = 15000;
gangcreatecost      = 75000;
gangdeltime         = 300;
gangmember          = false;
gangleader          = false;
gangareas           = [gangarea1,gangarea2,gangarea3];
gang_array_name     = 0;
gang_array_memebers = 1;
gangwar = false;

//=================================================================================

//=========== cop patrol array ==========
coppatrolarray  =
[
    getmarkerpos "patrolpoint1",
    getmarkerpos "patrolpoint2",
    getmarkerpos "patrolpoint3",
    getmarkerpos "patrolpoint4",
    getmarkerpos "patrolpoint5",
    getmarkerpos "patrolpoint6",
    getmarkerpos "patrolpoint7",
    getmarkerpos "patrolpoint8",
    getmarkerpos "patrolpoint9",
    getmarkerpos "patrolpoint10",
    getmarkerpos "patrolpoint11",
    getmarkerpos "patrolpoint12",
    getmarkerpos "patrolpoint13"
];

//===========Opfor Mission Array==========
opfmissionarray  =
[
    getmarkerpos "opfmissionpoint1",
    getmarkerpos "opfmissionpoint2",
    getmarkerpos "opfmissionpoint3",
    getmarkerpos "opfmissionpoint4",
    getmarkerpos "opfmissionpoint5",
    getmarkerpos "opfmissionpoint6",
    getmarkerpos "opfmissionpoint7",
    getmarkerpos "opfmissionpoint8",
    getmarkerpos "opfmissionpoint9",
    getmarkerpos "opfmissionpoint10",
    getmarkerpos "opfmissionpoint11"
];



if (iscop or isopf) then {
    [player, 'handy', 1] call INV_SetItemAmount;
	[player, "mobile", true] call player_set_bool;

    RadioTextMsg_1 = "Put your fucking hands up!";
    RadioTextMsg_2 = "Pull over and stay in your vehicle!";
    RadioTextMsg_3 = "Drop your weapon and put your hands on your head!";
    RadioTextMsg_4 = "Your free to go, have a nice day";
} else {
	if (isciv or isesu or isins) then {
		RadioTextMsg_1 = "Put your fucking hands up now!";
		RadioTextMsg_2 = "Step away from the vehicle!";
		RadioTextMsg_3 = "Do it now or your dead!";
		RadioTextMsg_4 = "Dont shoot i give up!";
	};
};

RadioTextArt_1 = "direct";
RadioTextArt_2 = "direct";
RadioTextArt_3 = "direct";
RadioTextArt_4 = "direct";

publicarbeiterarctionarray = [];

private["_i"];


deadtimebonus          = 0.001;


["arrested", false] call stats_init_variable;
["deadtimes", 0] call stats_init_variable;
["copskilled", 0] call stats_init_variable;
["civskilled", 0] call stats_init_variable;
["arrestsmade", 0] call stats_init_variable;



selfkilled               = 0;
killstrafe               = 20000;
copteamkillstrafe        = 20000;
GesetzAnzahl             = 10;


isMayor                  = false;
WahlArray                = [];
MayorNumber              = -1;
MayorExtraPay            = 5000;

private["_i"];
_i = 0;
while { _i < (count playerstringarray) } do {
	WahlArray = WahlArray + [ [] ];
	_i = _i + 1;
};

ischief                  = false;
iscommander              = false;
ChiefArray               = [];
CommanderArray           = [];
chiefNumber              = -1;
commanderNumber          = -1;
chiefExtraPay          	 = 10000;
commanderExtraPay        = 10000;
	
private["_i"];
_i = 0;
while { _i < (count playerstringarray) } do {
	ChiefArray = ChiefArray + [ [] ];
	_i = _i + 1;
};

private["_i"];
_i = 0;
while { _i < (count playerstringarray) } do {
	CommanderArray = CommanderArray + [ [] ];
	_i = _i + 1;
};

deadcam_target_array     =
[
    [17205.75,99198.17,-49454.65],
    [114238.47,12719.49,3040.26],
    [114238.47,12719.49,3040.28],
    [9396.48,-87407.76,-3495.99],
    [9396.48,-87407.76,-3495.72],
    [-85499.48,17145.94,-3497.86],
    [-81437.91,41177.12,-3500.26],
    [-68592.92,68496.92,-3504.91],
    [63894.18,99059.27,-3504.91],
    [57781.25,102312.13,-3505.24],
    [18155.12,112290.52,-3505.59],
    [114056.91,13559.94,-3506.64],
    [114056.91,13559.94,-3506.63],
    [12082.11,112377.59,-3507.94],
    [12082.11,112377.59,-3508.13],
    [12082.11,112377.59,-3507.88],
    [71475.13,94441.38,-3511.65],
    [79131.48,88521.11,-3512.17],
    [90116.62,77668.10,-3514.78],
    [93979.69,72896.55,-3515.45],
    [23989.44,112118.31,-3515.51],
    [111421.41,-10631.93,-3515.78],
    [111421.41,-10631.93,-3515.45],
    [111421.41,-10631.93,-3515.62],
    [-85207.23,22475.24,-3515.77],
    [-85269.09,22481.34,761.18],
    [-52542.68,-60176.11,-15820.92],
    [66335.50,-71098.57,-15831.98],
    [112733.68,9274.25,-15848.19],
    [112733.68,9274.25,-15848.03],
    [112733.68,9274.25,-15848.01],
    [112733.68,9274.25,-15848.28],
    [15793.38,-87445.16,-1975.57],
    [15793.38,-87445.16,-1975.58],
    [-85045.43,23679.19,-1976.55],
    [-2976.49,110953.34,-1977.04],
    [-2976.49,110953.34,-1976.94],
    [25975.48,-86795.57,-1977.29],
    [25975.48,-86795.57,-1977.28],
    [30152.87,-86219.98,-1977.49],
    [114191.58,8919.13,-1977.75],
    [114186.95,8335.76,-1978.02],
    [13212.45,-87514.59,-1978.28],
    [13212.45,-87514.59,-1978.39],
    [13328.19,-76559.05,-45508.50]
];

deadcam_position_array   =
[
    [6573.78,2365.67,19.16],
    [6563.33,2409.16,3.60],
    [6598.98,2409.17,3.60],
    [6615.21,2406.75,2.60],
    [6616.97,2469.89,3.60],
    [6619.17,2455.47,4.36],
    [6650.88,2457.08,5.60],
    [6719.63,2400.90,6.92],
    [6712.46,2403.60,7.08],
    [6712.08,2419.00,8.08],
    [6727.18,2457.75,20.08],
    [6724.96,2465.48,15.08],
    [6764.31,2465.91,7.08],
    [6771.92,2463.60,20.08],
    [6771.38,2538.25,21.08],
    [6771.13,2550.88,22.08],
    [6769.29,2568.52,23.08],
    [6793.91,2598.42,24.08],
    [6825.21,2646.20,25.08],
    [6839.44,2658.20,25.08],
    [6869.00,2658.38,25.08],
    [6909.94,2668.50,25.35],
    [6942.29,2667.94,25.33],
    [6846.04,2627.05,20.37],
    [6827.04,2538.54,18.41],
    [6742.96,2468.32,18.69],
    [6769.18,2697.18,15.22],
    [6792.32,2615.79,10.43],
    [6679.88,2556.44,6.43],
    [6560.67,2516.16,6.43],
    [6588.56,2525.49,6.43],
    [6551.50,2521.79,6.43],
    [6606.49,2523.45,1.69],
    [6606.37,2476.85,1.69],
    [6602.42,2474.65,1.69],
    [6578.19,2474.97,1.69],
    [6574.55,2488.17,1.69],
    [6574.79,2497.03,1.69],
    [6573.99,2491.74,5.46],
    [6574.33,2490.64,4.93],
    [6574.66,2458.02,4.93],
    [6597.66,2457.95,4.93],
    [6599.95,2459.04,5.23],
    [6599.66,2459.05,18.31],
    [6575.55,2451.36,19.46]
];
bank_gold_bars = 1;
atmscriptrunning = 0;
shopactivescript = 0;
deadcam_wechsel_dauer    = 5;
deadcam_kameraposition   = round(random (count deadcam_position_array - 1));
slave_cost               = 50000;
slavemoneyprosekunde	 = 500;
maxslave                 = 6;
copslaveallowed          = 1;
localslave               = 0;
localslavecounter        = 0;
huren_cost               = 50000;
hoemoneyprosekunde       = 500;
maxhuren                 = 5;
copworkerallowed         = 0;
pimpactive               = 0;
localhuren               = 0;
localhurencounter        = 0;
speedbomb_minspeed       = 1;
speedbomb_maxspeed       = 100;
speedbomb_mindur         = 10;
speedbomb_maxdur         = 300;
zeitbombe_mintime        = 1;
zeitbombe_maxtime        = 10;
publichideoutarray       = [];
hideoutcost              = 20000;
marker_ausserhalb        = param1;
marker_innerhalb         = 5;
marker_CopDistance       = 50; //controls distance cops need to be to make civ dots appear outside of towns.
CivMarkerUngenau         = 20;

classmap =
[
	["money", "EvMoney"],
	["kanister", "Land_Canister_EP1"],
	["selbstmordbombe", "Explosive"],
	["OilBarrel", "Barrel4"],
	["Oil", "Barrel1"],
	["Unprocessed_Cocaine", "Land_Bag_EP1"],
	["Unprocessed_Marijuana", "Land_Bag_EP1"],
	["Unprocessed_LSD", "Land_Bag_EP1"],
	["Unprocessed_Heroin", "Land_Bag_EP1"],
	["marijuana", "Land_Sack_EP1"],
	["cocaine", "Land_Sack_EP1"],
	["lsd", "Land_Sack_EP1"],
	["heroin", "Land_Sack_EP1"],
	["repairkit", "Land_Pneu"],
	["medkit", "Suitcase"],
	["bank_insurance", "EvKobalt"],	
	["Gold_Bar", "Suitcase"],
	["shape_charge", "Explosive"]
];

droppableitems = [];
{
	private["_map", "_class"];
	_map = _x;
	_class = _map select 1;
	droppableitems set [(count droppableitems), _class];
} forEach classmap;

item2class = {
	private["_item", "_class"];
	_item = _this select 0;
	_class = "Suitcase";

	//player groupChat format["item to class %1", _item];
	if (isNil "_item") exitWith {_class};
	if (typeName _item != "STRING") exitWith {_class};


	{
		private["_cmap", "_citem", "_cclass"];
		_cmap = _x;
		_citem = _cmap select 0;
		_cclass = _cmap select 1;
		//player groupChat format["map: %1", _cmap];
		if (_item == _citem) exitWith {
			_class = _cclass;
		};
	} forEach classmap;

	_class
};



nonlethalweapons         = ["Binocular", "NVGoggles", "ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS"];


civclassarray         =
[
    "TK_CIV_Takistani01_EP1",
    "TK_CIV_Takistani02_EP1",
    "TK_CIV_Takistani03_EP1",
    "TK_CIV_Takistani04_EP1",
    "TK_CIV_Takistani05_EP1",
    "TK_CIV_Takistani06_EP1",
    "TK_CIV_Woman01_EP1",
    "TK_CIV_Woman02_EP1",
    "TK_CIV_Woman03_EP1",
    "TK_CIV_Worker01_EP1",
    "TK_CIV_Worker02_EP1",
    "Citizen2_EP1",
    "Citizen3_EP1",
    "CIV_EuroMan01_EP1",
    "CIV_EuroMan02_EP1",
    "Dr_Hladik_EP1",
    "Functionary1_EP1",
    "Functionary2_EP1",
    "Haris_Press_EP1",
    "Profiteer2_EP1"
];

pmc_array = [];


// Vehicle Kicking : Kicks cops if they use certain vehicles like the ones in the below array;
vehicle_kick_time = 15;
vehicle_checking = true; // Do not change
police_disallowed_vehicles = ["BTR90_HQ","BTR90","BTR60_TK_EP1","BTR40_MG_TK_INS_EP1","BTR40_MG_TK_GUE_EP1","M113_TK_EP1","GAZ_Vodnik_HMG"]; // Not done yet


civslavearray          = ["Hooker1","Hooker2","Hooker3","Hooker4","RU_Hooker1","RU_Hooker2","RU_Hooker3","RU_Hooker4"];
civworkerarray         = ["Worker1","Worker2","Worker3","Worker4"];