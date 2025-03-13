INV_Licenses =
    [

        ["car",[licenseflag3,university,licenseflag5,southshop1],localize "STRS_license_car",5000],
        ["truck",[licenseflag3,university,southshop1,licenseflag5],localize "STRS_license_truck",32500],
        ["oil",[Oil_1,Oil_1,Oil_2,Oil_2],"Oil Processor's License",45000],
        //["diamond",[Diamond_1,Diamond_1,Diamond_1,Diamond_1],"Diamond Processor's License",95000],
      //  ["glassblowing",[Glassblower,Glassblower,Glassblower,Glassblower],localize "STRS_license_glassblowerlicense",65000],
        ["cocaine ga1",[gangarea1,gangarea1,gangarea1,gangarea1],"GA1 Cocaine Processing Training",45000],
        ["lsd ga1",[gangarea1,gangarea1,gangarea1,gangarea1],"GA1 LSD Processing Training",30000],
        ["heroin ga2",[gangarea2,gangarea2,gangarea2,gangarea2],"GA2 Heroin Processing Training",50000],
        ["lsd ga2",[gangarea2,gangarea2,gangarea2,gangarea2],"GA2 LSD Processing Training",30000],
        ["heroin ga3",[gangarea3,gangarea3,gangarea3,gangarea3],"GA3 Heroin Processing Training",50000],
        ["marijuana ga3",[gangarea3,gangarea3,gangarea3,gangarea3],"GA3 Marijuana Processing Training",17000],
		["air",[licenseflag3,licenseflag5,university,southshop1],localize "STRS_license_air",500000],
        ["pistollicense",[pmcatm,licenseflag2,licenseflag2,licenseflag2],"Pistol License",50000],
        ["riflelicense",[pmcatm,licenseflag2,licenseflag2,licenseflag2],"Rifle License",200000],
        ["isis_training",[objnull,objnull,objnull,objnull],"ISIS Training",300000],
        ["automatic",[pmcatm,licenseflag2,licenseflag2,licenseflag2],"Assault Weapon License",300000],
		["engineer",[southshop1,university,insurgent_atm,atm5],localize "STRS_license_engineer",65000],
        ["bomb",[objnull,insurgent_atm,atm5,objnull],"Basic Combat Training",10000],     
		
		["special_operations",[insurgent_atm,insurgent_atm,insurgent_atm,insurgent_atm],"Special Operations Training",350000],
		["un_vehicle",[insurgent_atm,insurgent_atm,insurgent_atm,insurgent_atm],"Special Vehicle Training",600000],
		["un_explosives",[insurgent_atm,insurgent_atm,insurgent_atm,insurgent_atm],"Explosives Training",100000],
		
        ["probator",[copbank,copbank,copbank,copbank],localize "STRS_license_probator",10000],
        ["patrol_training",[copbank,copbank,copbank,copbank],localize "STRS_license_coppatrol",15000],
        ["response_training",[copbank,copbank,copbank,copbank],localize "STRS_license_copresponse",150000],
        ["sobr_training",[copbank,copbank,copbank,copbank],localize "STRS_license_copswat",500000],
        ["air_support_training",[copbank,copbank,copbank,copbank],localize "STRS_license_copairsupport",225000],
       
	    ["passport_civilian",[licenseflag3,licenseflag3,licenseflag5,licenseflag5],"Takistani Passport",35000],
        ["pmc_license_journeyman",[pmcatm,pmcatm,pmcatm,pmcatm],"PMC Journeyman License",1350000],
        ["pmc_license_defense",[pmcatm,pmcatm,pmcatm,pmcatm],"PMC Defense License",350000],
        ["pmc_license_air",[pmcatm,pmcatm,pmcatm,pmcatm],"PMC Pilot License",850000],
		["soviet_vehicles",[objnull,atm5,objnull,objnull],"Soviet Vehicle Training",500000],
        ["soviet_air_veh",[objnull,atm5,objnull,objnull],"Soviet Aircraft Training",300000],
        ["paramedic_license",[objNull,objNull,objNull,objNull],"ESU Training",100000],
        ["paramedic_license_air",[objNull,objNull,objNull,objNull],"ESU Air Vehicle Training",500000],
		["donator",[objNull,objNull,objNull,objNull],"Donator License",999999999],
		["viplicense",[objNull,objNull,objNull,objNull],"VIP Donator License",999999999],
		["highcaliberrifle",[licenseflag2,pmcatm,licenseflag2,licenseflag2],"High Caliber Rifle License",450000],
		["newslicense",[atmnews,atmnews,atmnews,atmnews],"News Reporters License",150000],
		//["hitman",[hitshop,hitshop,hitshop,hitshop],"Hitman License",1000000],
		["vice_training",[objNull,objNull,objNull,objNull],"Undercover Training",1700000],
		["mine_license",[takistan_mine,takistan_mine,takistan_mine,takistan_mine],"Mining License",100000]
		//["terror",[atm_terror,atm_terror,atm_terror,atm_terror],"Terror License",200000]
        //["assassin",[agunshop,agunshop,objnull],"Assassin Training",30000]
    ];

["INV_LicenseOwner", []] call stats_init_variable;