_emptyshop = [];

shop_list_item = 0;
shop_list_stock = 1;
shop_list_stock_max = 2;

["LandRover_MG_TK_EP1", -1, -1],

_takistan_mine =
	[
		["Shovel", -1, -1],
		["Pickaxe", -1, -1],
		["JackHammer", -1, -1]
	];

_bl = // barely legal
	[
		["ziptie",-1,-1],
		["lockpick",-1,-1],
		["gasmask", -1, -1],
		["earplugs", -1, -1],
		["lighter", -1, -1],
		["fuelline", -1, -1]

	];

// Blackmarket Organs
_bmo = [
	["brain",-1,-1],
	["eye",-1,-1],
	["kidney",-1,-1],
	["heart",-1,-1],
	["lung",-1,-1],
	["liver",-1,-1]
];

// Appstore
_appstore = [
	["banking_app",-1,-1]
];

// Military Surplus Shop to be added later a few m4 type weapons etc


_vehiclefactory_exports =
	[
		["Tractor",-1,-1],
		["TowingTractor",-1,-1],
		["ATV_CZ_EP1",-1,-1],
		["Old_bike_TK_CIV_EP1", -1, -1],
		["MMT_Civ",-1,-1],
		["M1030", -1, -1],
		["TT650_Civ", -1, -1],
		["TT650_Gue", -1, -1],
		["TT650_TK_CIV_EP1", -1, -1],
		["Old_moto_TK_Civ_EP1", -1, -1],
		["Ikarus_TK_CIV_EP1", -1, -1],
		["Skoda", -1, -1],
		["Ikarus", -1, -1],
		["SkodaBlue", -1, -1],
		["SkodaRed", -1, -1],
		["SkodaGreen", -1, -1],
		["Volha_1_TK_CIV_EP1", -1, -1],
		["Volha_2_TK_CIV_EP1", -1, -1],
		["VolhaLimo_TK_CIV_EP1", -1, -1],
		["VWGolf",-1,-1],
		["Lada1_TK_CIV_EP1",-1,-1],
	//	["Lada2_TK_CIV_EP1",-1,-1],
		["car_hatchback", -1, -1],
		["Car_Sedan",-1,-1],
		["Lada1", -1, -1],
		["Lada2", -1, -1],
		["S1203_TK_CIV_EP1", -1, -1],
		["S1203_ambulance_EP1", -1, -1],
		["LandRover_TK_CIV_EP1", -1, -1],
		["hilux1_civil_2_covered", -1, -1],
		["hilux1_civil_1_open", -1, -1],
		["hilux1_civil_3_open", -1, -1],
		["hilux1_civil_3_open_EP1", -1, -1],
		["datsun1_civil_1_open", -1, -1],
		["datsun1_civil_2_covered", -1, -1],
		["datsun1_civil_3_open", -1, -1],
		["SUV_TK_CIV_EP1", -1, -1],
		["Ural_TK_CIV_EP1",-1,-1],
		["UralCivil",-1,-1],
		["UralCivil2",-1,-1],
		["V3S_Open_TK_CIV_EP1", -1, -1],
		["V3S_Civ",-1,-1],
		["BAF_Offroad_D", -1, -1],
		["BAF_Offroad_W", -1, -1],
		["LandRover_CZ_EP1", -1, -1],
		["AH6X_EP1", -1, -1],
		["MH6J_EP1", -1, -1],
		["Mi17_Civilian", -1, -1]

	];


_takipharm =
	[
		["medkit",-1,-1],
		["ziptie",-1,-1],
		["repairkit",-1,-1],
		["Binocular", -1, -1],
		["Garbage IED Small_tp",-1,-1],
		["AKS_GOLD", -1, -1],
		["Rnd_762x39_AK47", -1, -1],
		["M14_EP1_TP", -1, -1],
		["DMR_TP", -1, -1],
		["Rnd_762x51_DMR_TP", -1, -1],
		["lockpick", -1, -1],
		["CZ_550", -1, -1],
		["x_22_LR_17_HMR", -1, -1],
		["MP5SD_TP", -1, -1],
		["Rnd_9x19_MP5SD_TP", -1, -1],
		["Colt1911", -1, -1],
		["Rnd_45ACP_1911", -1, -1],
		["revolver_EP1", -1, -1],
		["Rnd_45ACP", -1, -1]
	];

// SRT
_srtAir =
	[
		["AH6J_EP1_srt", -1, -1],
		["AW159_Lynx_BAF", -1, -1],
		["MH6J_EP1_srt", -1, -1],
		["UH1H_TK_GUE_EP1_srt", -1, -1],
		["UH1Y_srt", -1, -1],
		["UH60M_MEV_EP1", -1, -1],
		["BAF_Merlin_PMC", -1, -1]
	];
_srtCar =
	[
		["stunhmmv", -1 ,-1],
		["HMMWV_M1035_DES_EP1_srt", -1 ,-1],
		["LAV25_HQ", -1 ,-1],
		["M1133_MEV_EP1_srt", -1, -1],
		["HMMWV_Armored",  -1, -1],
		["HMMWV_DES_EP1_srt", -1, -1],
		["HMMWV_M1151_M2_DES_EP1_srt", -1, -1],
		["HMMWV_M998A2_SOV_DES_EP1_srt", -1, -1],
		["BAF_Offroad_D", -1, -1],
		["MtvrSupply_DES_EP1", -1, -1],
		["MtvrRepair_DES_EP1", -1, -1],
		["MtvrReammo_DES_EP1", -1, -1],
		["SUV_TK_CIV_EP1", -1, -1],
		["SUV_UN_EP1_retex", -1, -1],
		["SUV_TK_EP1_retex_special",-1 ,-1],
		["LandRover_TK_CIV_EP1_cop",-1 ,-1],
	    ["BAF_Jackal2_L2A1_D_srt",-1 ,-1]
	];
_osfWep = [
		["handy", -1, -1],
		["SmokeShellOrange", -1, -1],
		["lockpick", -1, -1],
		["medkit", -1, -1],
		["repairkit", -1, -1],
		["kanister", -1, -1],
		["supgrade1", -1, -1],
		["supgrade2", -1, -1],
		["supgrade3", -1, -1],
		["supgrade4", -1, -1],
		["supgrade5", -1, -1],
		["bodyarmor_100", -1, -1],
		["bodyarmor_50", -1, -1],
		["bodyarmor_20", -1, -1],
		["stun_light", -1, -1],
		["stun_full", -1, -1],
		["gasmask", -1, -1],
		["earplugs", -1, -1],
		["tracker", 25, 25],
		["nitro", -1, -1],
		["vclammo", -1, -1],

		["GPS", -1, -1],
		["Binocular", -1, -1],
		["Binocular_Vector", -1, -1],
		["NVGoggles", -1, -1],
		["SmokeShellOrange", -1, -1],
		
		["M9",-1,-1],
		["Rnd_9x19_M9SD",-1,-1],	
		["M9_PMC", -1, -1],
		["M9SD_PMC", -1, -1],
		["Rnd_9x19_M9SD",-1,-1],
		["glock17_PMC", -1, -1],
		["Rnd_9x19_M9", -1, -1],
		["Makarov", -1, -1],
		["Rnd_9x18_Makarov", -1, -1],
		["UZI_EP1", -1, -1],
		["Rnd_9x19_UZI", -1, -1],
		["Sa61_EP1", -1, -1],
		["Rnd10_765x17_Ball", -1, -1],
		["Rnd20_765x17_Ball", -1, -1],
		["Colt1911", -1, -1],
		["Rnd_45ACP_1911", -1, -1],
		["revolver_EP1", -1, -1],
		["revolver_gold_EP1", -1, -1],
		["Rnd_45ACP", -1, -1],
		
		["M1014", -1, -1],
		["Rnd_B_Beneli_74Slug", -1, -1],
		["Rnd_B_Beneli_Pellets", -1, -1],
		["MP5A5", -1, -1],
		["Rnd_9x19_MP5", -1, -1],
		["Rnd_9x19_glock17", -1, -1],
		["M4A3_RCO_GL_EP1", -1, -1],
		["M4A1_RCO_GL", -1, -1],
		["M4A1_HWS_GL_SD_Camo", -1, -1],
		["M4A1_HWS_GL_camo", -1, -1],
		["m16a4", -1, -1],
		["M16A4_GL", -1, -1],
		["M16A4_ACG_GL", -1, -1],
		["BAF_L85A2_UGL_Holo", -1, -1],
		["BAF_L85A2_UGL_ACOG", -1, -1],
		["BAF_L86A2_ACOG", -1, -1],
		["m8_carbine", -1, -1],
		["m8_SAW", -1, -1],
		["m8_sharpshooter", -1, -1],
		["m8_carbine_pmc", -1, -1],
		["m8_carbineGL", -1, -1],
		["M8_compact",  -1, -1],
		["m8_compact_pmc", -1, -1],
		["m8_holo_sd", -1, -1],
		["Rnd_556x45_Stanag", -1, -1],
		["Rnd_556x45_StanagSD", -1, -1],
		["Rnd_556x45_BetaCMag",-1,-1],
		["M249_200", -1, -1],
		["BAF_L110A1_Aim_srt",-1,-1],
		["M249_m145_EP1", -1, -1],
		["Rnd_100_M249", -1, -1],
		["Rnd_200_M249", -1, -1],
		["M14_EP1", -1, -1],
		["Rnd_762x51_DMR", -1, -1],
		["M110_NVG_EP1", -1, -1],
		["rnd_762x51_B_SCAR",  -1, -1],
		["BAF_LRR_scoped", -1, -1],
		["Rnd_86x70_L115A1", -1, -1],
		["SMAW" ,-1,-1],
		["SMAW_HEDP" ,-1,-1 ],
		["SMAW_HEAA",-1,-1 ],
		["Stinger", -1, -1],
		["Stinger_mag", -1, -1],
		["Mk13", -1, -1],
		["M32", -1, -1],
		["Rnd_HE", -1, -1],
		["Rnd_Smoke", -1, -1],
		["Rnd_HE_M203", -1, -1],
		["Rnd_Smoke_M203", -1, -1],
		["Rnd_SmokeRed_M203", -1, -1],
		["Rnd_SmokeGreen_M203", -1, -1],
		["Rnd_SmokeYellow_M203", -1, -1],
		["FlareWhite_M203", -1, -1],
		["FlareGreen_M203", -1, -1],
		["FlareRed_M203", -1, -1],
		["FlareYellow_M203", -1, -1],
		["HandGrenade_BAF", -1, -1],
		["SmokeShell", -1, -1],
		["SmokeShellRed", -1, -1],
		["SmokeShellGreen", -1, -1],
		["SmokeShellYellow", -1, -1],
		["SmokeShellPurple", -1, -1],
		["SmokeShellBlue", -1, -1],
		["CZ_Backpack_EP1",	 -1, -1],
		["CZ_VestPouch_EP1", -1, -1],
		["Javelin_srt", -1, -1],
		["Javelin_mag_srt", -1, -1],
		
		["MP5SD", -1, -1],
		["Rnd_9x19_MP5SD", -1, -1],
		["Bizon", -1, -1],
		["Rnd_9x19_Bizon", -1, -1],
		["Saiga12K", -1, -1],
		["Rnd_B_Saiga12_74Slug", -1, -1],
		["Rnd_B_Saiga12_Pellets", -1, -1],
		["LeeEnfield", -1, -1],
		["x_303", -1, -1],
		["FN_FAL", -1, -1],
		["Rnd_762x51_FNFAL", -1, -1],
		["AK_47_M", -1, -1],
		["AK_47_S", -1, -1],
		["Rnd_762x39_AK47", -1, -1],
		["Sa58P_EP1", -1, -1],
		["Sa58V_EP1", -1, -1],
		["Rnd_762x39_SA58", -1, -1],
		["AKS74U", -1, -1],
		["AKS_74_UN_kobra", -1, -1],
		["RPK_74",  -1, -1],
		["AK74", -1, -1],
		["AK74GL", -1, -1],
		["AKS_74", -1, -1],
		["AKS74kobra", -1, -1],
		["AKS74kobragl", -1, -1],
		["AKS74pso", -1, -1],
		["Rnd_545x39_AK", -1, -1],
		["Rnd_545x39_AKSD",	 -1, -1],
		["Rnd_545x39_RPK", -1, -1],
		["CZ_550", -1, -1],
		["x_22_LR_17_HMR", -1, -1],
		
		["RPG7V", -1, -1],
		["PG7V",  -1, -1],
		["PG7VR", -1, -1],
		["PG7VL", -1, -1],
		["OG7", -1, -1],
		
		["RPG18", -1, -1],
		["RPG18_mag",  -1, -1],
		["M79", -1, -1],
		["Rnd_HE_M203", -1, -1],
		["Rnd_HE_GP25", -1, -1],
		["FlareWhite_GP25", -1, -1],
		["FlareGreen_GP25", -1, -1],
		["FlareRed_GP25", -1, -1],
		["FlareYellow_GP25", -1, -1],
		["Rnd_SMOKE_GP25", -1, -1],
		["Rnd_SmokeRed_GP25", -1, -1],
		["Rnd_SmokeGreen_GP25", -1, -1],
		["Rnd_SmokeYellow_GP25", -1, -1],
		["HandGrenade_East", -1, -1],
		["SmokeShell", -1, -1],
		["TK_ALICE_Pack_EP1", -1, -1],
		["TK_Assault_Pack_EP1", -1, -1],
		["TK_RPG_Backpack_EP1", -1, -1],
		["Tripod_Bag", -1, -1],
		["DSHkM_Mini_TriPod_TK_GUE_Bag_EP1", -1, -1],
		["DSHKM_TK_GUE_Bag_EP1", -1, -1],
		["KORD_high_TK_Bag_EP1", -1, -1],
		["KORD_TK_Bag_EP1", -1, -1]
];
_osfAir = [
		["Mi17_rockets_RU_OSF", -1, -1],
		["Su25_TK_EP1_OSF", -1, -1],
		["Mi24_P_OSF", -1, -1],
		["Ka60_PMC_miniguns_OSF", -1, -1],
		["MV22_OSF", -1, -1],
		["UH60M_EP1_OSF", -1, -1],
		["Ka52Black_OSF", -1, -1],
		["An2_TK_EP1_OSF", -1, -1],
		["Ka137_PMC_OSF", -1, -1],
		["MH6J_EP1_OSF", -1, -1],
		["Pchela1T_OSF", -1, -1],
		["Su34_OSF", -1, -1]
];
_osfVeh = [
		
		["GAZ_Vodnik_HMG_OSF", -1, -1],
		["BTR90_OSF", -1, -1],
		["BRDM2_CDF_OSF", -1, -1],
		["BMP3_OSF", -1, -1],
		["T90_OSF", -1, -1],
		["2S6M_Tunguska_OSF", -1, -1],
		["Ural_ZU23_CDF_OSF", -1, -1],
		["Ural_CDF_OSF", -1, -1],
		["LandRover_Special_CZ_EP1_OSF", -1, -1],
		["GAZ_Vodnik_MedEvac_OSF", -1, -1]
];
_srtWep =
	[
		["Tripod_Bag" ,-1,-1],
		["M2HD_mini_TriPod_US_Bag_EP1" ,-1,-1],
		["M2StaticMG_US_Bag_EP1" ,-1,-1],
		["MK19_TriPod_US_Bag_EP1" ,-1,-1],
		["TOW_TriPod_US_Bag_EP1" ,-1,-1],
		["BAF_L2A1_ACOG_minitripod_bag" ,-1,-1],
		["BAF_L2A1_ACOG_tripod_bag" ,-1,-1],
		
		["handy", -1, -1],
		["bodyarmor_100", -1, -1],
		["bodyarmor_50", -1, -1],
		["bodyarmor_20", -1, -1],
		
		["repairkit", -1, -1],
		["kanister", -1, -1],
		["medkit", -1, -1],
		["spikestrip", -1, -1],
		["weaponbag", -1, -1],
		["Itembag", -1, -1],
		["defuser", -1, -1],
		["vclammo", -1, -1],
		["lockpick", -1, -1],
		["Binocular", -1, -1],
		["Binocular_Vector", -1, -1],
		["NVGoggles", -1, -1],
		["nitro", -1, -1],
		["supgrade1", -1, -1],
		["supgrade2", -1, -1],
		["supgrade3", -1, -1],
		["supgrade4", -1, -1],
		["supgrade5", -1, -1],
		["tracker", 25, 25],
		["bait",-1,-1],
		["gasmask", -1, -1],
		["earplugs", -1, -1],
		["stun_light", -1, -1],
		["stun_full", -1, -1],
		["M1014", -1, -1],
		["Rnd_B_Beneli_74Slug", -1, -1],
		["Rnd_B_Beneli_Pellets", -1, -1],
		["MP5A5", -1, -1],
		["Rnd_9x19_MP5", -1, -1],
		["M9_PMC", -1, -1],
		["M9SD_PMC", -1, -1],
		["Rnd_9x19_M9SD",-1,-1],
		["glock17_PMC", -1, -1],
		["Rnd_9x19_M9", -1, -1],
		["Rnd_9x19_glock17", -1, -1],
		["M4A3_RCO_GL_EP1", -1, -1],
		["M4A1_RCO_GL", -1, -1],
		["M4A1_HWS_GL_SD_Camo", -1, -1],
		["M4A1_HWS_GL_camo", -1, -1],
		["m16a4", -1, -1],
		["M16A4_GL", -1, -1],
		["M16A4_ACG_GL", -1, -1],
		["BAF_L85A2_UGL_Holo", -1, -1],
		["BAF_L85A2_UGL_ACOG", -1, -1],
		["BAF_L86A2_ACOG", -1, -1],
		["m8_carbine", -1, -1],
		["m8_SAW", -1, -1],
		["m8_sharpshooter", -1, -1],
		["m8_carbine_pmc", -1, -1],
		["m8_carbineGL", -1, -1],
		["M8_compact",  -1, -1],
		["m8_compact_pmc", -1, -1],
		["m8_holo_sd", -1, -1],
		["Rnd_556x45_Stanag", -1, -1],
		["Rnd_556x45_StanagSD", -1, -1],
		["Rnd_556x45_BetaCMag",-1,-1],
		["M249_200", -1, -1],
		["BAF_L110A1_Aim_srt",-1,-1],
		["M249_m145_EP1", -1, -1],
		["Rnd_100_M249", -1, -1],
		["Rnd_200_M249", -1, -1],
		["M14_EP1", -1, -1],
		["Rnd_762x51_DMR", -1, -1],
		["M110_NVG_EP1", -1, -1],
		["rnd_762x51_B_SCAR",  -1, -1],
		["BAF_LRR_scoped", -1, -1],
		["Rnd_86x70_L115A1", -1, -1],
		["SMAW" ,-1,-1],
		["SMAW_HEDP" ,-1,-1 ],
		["SMAW_HEAA",-1,-1 ],
		["Stinger", -1, -1],
		["Stinger_mag", -1, -1],
		["Mk13", -1, -1],
		["M32", -1, -1],
		["Rnd_HE", -1, -1],
		["Rnd_Smoke", -1, -1],
		["Rnd_HE_M203", -1, -1],
		["Rnd_Smoke_M203", -1, -1],
		["Rnd_SmokeRed_M203", -1, -1],
		["Rnd_SmokeGreen_M203", -1, -1],
		["Rnd_SmokeYellow_M203", -1, -1],
		["FlareWhite_M203", -1, -1],
		["FlareGreen_M203", -1, -1],
		["FlareRed_M203", -1, -1],
		["FlareYellow_M203", -1, -1],
		["HandGrenade_BAF", -1, -1],
		["SmokeShell", -1, -1],
		["SmokeShellRed", -1, -1],
		["SmokeShellGreen", -1, -1],
		["SmokeShellYellow", -1, -1],
		["SmokeShellPurple", -1, -1],
		["SmokeShellBlue", -1, -1],
		["CZ_Backpack_EP1",	 -1, -1],
		["CZ_VestPouch_EP1", -1, -1],
		["USBasicBag", -1, -1],
		["US_Assault_Pack_EP1", -1, -1],
		["US_UAV_Pack_EP1", -1, -1],
		["US_Backpack_EP1", -1, -1],
		["US_Patrol_Pack_EP1", -1, -1],
		["Javelin_srt", -1, -1],
		["Javelin_mag_srt", -1, -1]
	];

_generalstore =
	[
		["Fuelline", 40, 80],
		["NVGoggles", -1, -1],
		["kanister", 20, 40],
		["repairkit", 15, 30],
		["Bread", 10, 20],
		["boar", -1, -1],
		["medkit", 0, 10],
		["handy", -1, -1],
		["lighter", -1, -1],
		["Stone", -1, -1],
		["Binocular", 80, 80],
		["GPS", 40, 80]
	];

//Fishing Shop
//Syphon Refuel kit, Refuel Can, Small Repair Kit, Repair Kit
_fs =
	[
		["Fuelline", 40, -1],
		["kanister", 20, 40],
		["repairkit", 15, 30]
	];

//Item Shop
//perch, trout, walleye, bass, Bread, medkit, Mobile phone, Lighter, Fishing Rod
_is =
	[
		["walleye", 20, 40],
		["bass", 20, 40],
		["Bread", 10, 20],
		["medkit", 0, 10],
		["handy", -1, -1],
		["lighter", -1, -1]
	];

//Pub
//Lager, Bitter, Vodka, Smirnoff ICE, Wiskey, White Wine, Red Wine
_pub =
	[
		["beer", -1, -1],
		["duck", -1, -1],
		["bass", -1, -1],
		["bread", -1, -1],
		["chicken", -1, -1],
		["steak", -1, -1],
		["trout", -1, -1],
		["goat", -1, -1],
		["rabbit", -1, -1],
		["boar", -1, -1],
		["beer2", 10, 100],
		["vodka", 10, 100],
		["smirnoff", 10, 100],
		["wiskey", 10, 100],
		["wine", 10, 100],
		["wine2", 10, 100]
	];

//Gun Shop
//Stone, M9, M9Ammo, Colt1911, Colt1911Ammo, Revolver-Silver, Revolver-SilverAmmo, CZ550, CZ550Ammo, LeeEnfield, LeeEnfieldAmmo, Saiga12K, Saiga12KAmmo, Saiga12KAmmo, M16A2, M16A2Ammo, FAL, FALAmmo
_gs =
	[
		["Stone", -1, -1],
		["glock17_EP1", -1, -1],
		["Rnd_9x19_glock17", -1, -1],
		["M9", 10, -1],
		["Rnd_9x19_M9", -1, -1],
		["Colt1911", -1, -1],
		["Rnd_45ACP_1911", -1, -1],
		["revolver_EP1", -1, -1],
		["Rnd_45ACP", -1, -1],
		["CZ_550", -1, -1],
		["x_22_LR_17_HMR", -1, -1],
		["LeeEnfield", -1, -1],
		["x_303", -1, -1],
		["Saiga12K", -1, -1],
		["Rnd_B_Saiga12_74Slug", -1, -1],
		["Rnd_B_Saiga12_Pellets", -1, -1],
		["M16A2", -1, -1],
		["Rnd_20_Stanag", -1, -1],
		["FN_FAL", -1, -1],
		["Rnd_762x51_FNFAL", -1, -1]
	];

//Equiptment Shop
//Binocular, GPS, lockpick, Fuelline, Stone
_es =
	[
		["handy", 80, 80],
		["Binocular", 80, 80],
		["NVGoggles", -1, -1],
		["GPS", 40, 80],
		["lockpick", 30, 30],
		["Fuelline", -1, -1],
		["Stone", -1, -1]
	];

//Checkpoint shop
// Checkpoint items, bargates,roadcones, barriers, etc.

_cp =
	[

		["SearchLight_US_EP1", -1, -1],
		["roadblock", -1, -1],
		["bargate", -1, -1],
		["BigbagfenceCorner", -1, -1],
		["bigbagfence", -1, -1],
		["bigbagfenceRound", -1, -1],
		["bunkersmall", -1, -1],
		["danger", -1, -1],
		["roadcone", -1, -1],
		["barrack", -1, -1],
		["Sign_Checkpoint_US_EP1", -1, -1],
		["Land_CamoNetVar_NATO_EP1", -1, -1],
		["Land_ladderEP1", -1, -1],
		["Land_ladder_half_EP1", -1, -1],
		["Land_Campfire_burning", -1, -1],
		["Land_RedWhiteBarrier", -1, -1],
		["RoadBarrier_long", -1, -1],
		["RoadBarrier_light", -1, -1],
		["MASH_EP1", -1, -1],
		["Hedgehog", -1, -1],
		["Fort_RazorWire", -1, -1],
		["Land_Shed_wooden", -1, -1],
		["Land_fortified_nest_big_EP1", -1, -1],
		["Land_Fire_barrel_burning", -1, -1],
		["Land_vez", -1, -1],
		["Concrete_wall_EP1", -1, -1],
		["H_barrier",-1,-1]
		
		
		
		
		
		/*
		["Concrete_wall_EP1",-1,-1],
		["Wire",-1,-1],
		["Hedgehog",-1,-1],
		["BagFenceC",-1,-1],
		["BagFenceE",-1,-1],
		["BagFenceL",-1,-1],
		["BagFenceR",-1,-1],
		["BagFenceS",-1,-1],
		["Land_GuardShed",-1,-1]
		*/
	];


//Car Upgrades
//Nitro, Speed1, Speed2, Speed3, Speed4, Speed5
_cu =
	[
		["nitro", 25, 25],
		["supgrade1", 25, 25],
		["supgrade2", 25, 25],
		["supgrade3", 25, 25],
		["supgrade4", 25, 25],
		["supgrade5", 25, 25],
		["tracker", 25, 25]
	];

//Car Shop
//Bike, MTBike, Bike, Old Motorbike, Motorbike, Motorbike, Motorbike, ATV, Tractor, Skoda, SkodaBlue, SkodaRed, SkodaGreen
//Vohla Blue, Vohla Grey, Vohla Limo, Lada, Lada Hippie, VWGolf, Hatchback, Sedan, Lada Red, Lada White, S1203 Van, Landrover, Landrover
//Hilux1, Hilux1_2, Hilux1_3oep1, Hilux1_3o, Datsun1o, Datsun2c, Datsun3o
_cs =
	[
		
		["Old_bike_TK_CIV_EP1", -1, -1],
		["MMT_Civ", 75, 100],
		["Old_moto_TK_Civ_EP1", 75, 100],
		["TT650_TK_CIV_EP1", 75, 100],
		["TT650_Civ", 75, 100],
		["TT650_Ins", 75, 100],
		["M1030", 75, 100],
		["ATV_CZ_EP1", 75, 100],
		["Skoda", 75, 100],
		["SUV_TK_CIV_EP1", -1, -1],
		["SkodaBlue", 75, 100],
		["SkodaRed", 75, 100],
		["SkodaGreen", 75, 100],
		["Volha_1_TK_CIV_EP1", 25, 100],
		["Volha_2_TK_CIV_EP1", 25, 100],
		["VolhaLimo_TK_CIV_EP1", 25, 100],
		["Lada1_TK_CIV_EP1", 25, 100],
		//["Lada2_TK_CIV_EP1", 25, 100],
		["VWGolf", 25, 100],
		["car_hatchback", 25, 100],
		["Car_Sedan", 25, 100],
		["Lada1", 25, 100],
		["Lada2", 25, 100],
		["S1203_TK_CIV_EP1", 25, 100],
		["LandRover_TK_CIV_EP1", 25, 10],
		["hilux1_civil_1_open", 25, 100],
		["hilux1_civil_1_open_camo", 25, 100],
		["hilux1_civil_2_covered", 25, 100],
		["hilux1_civil_3_open_EP1", 25, 100],
		["hilux1_civil_3_open", 25, 100],
		["datsun1_civil_1_open", 25, 100],
		["datsun1_civil_2_covered", 25, 100],
		["datsun1_civil_3_open", 25, 100]
	];

//Truck Shop
//Ikarus, Ikarus_TK_CIV_EP1, UralCivil, UralCivil2, V3S_Open_TK_CIV_EP1, V3S_Civ
_ts =
	[
		["Tractor", 5, 50],
		["tractorOld", 5, 50],
		["Ikarus", 5, 20],
		["Ikarus_TK_CIV_EP1", 5, 20],
		["Ural_TK_CIV_EP1", 5, 20],
		["UralCivil", 5, 20],
		["UralCivil2", 5, 20],
		["V3S_Open_TK_CIV_EP1", 5, 20],
		["V3S_Civ", 5, 20]
	];

//Air Shop - North
//ULB - AH6X_EP1, MH6J_EP1, Mi17_Civilian, BAF_Merlin_HC3_D, MV22, An2_1_TK_CIV_EP1, An2_2_TK_CIV_EP1, L39, C130J
_as =
	[
		["AH6X_EP1", 5, 10],
		["MH6J_EP1", 5, 10],
		["Mi17_Civilian", 5, 10],
		["BAF_Merlin_HC3_D", 5, 10],
		["MV22", 5, 10],
		["An2_1_TK_CIV_EP1", 5, 10],
		["An2_2_TK_CIV_EP1", 5, 10],
		["L39", 2, 5],
		["C130J", 2, 5],
		["TowingTractor",-1,-1]
	];

//Air Shop - South
//ULB - AH6X_EP1, MH6J_EP1, Mi17_Civilian, BAF_Merlin_HC3_D, MV22, An2_1_TK_CIV_EP1, An2_2_TK_CIV_EP1, L39, C130J
_as_1 =
	[
		["AH6X_EP1", 10, 10],
		["MH6J_EP1", 10, 10],
		["Mi17_Civilian",10, 10],
		["BAF_Merlin_HC3_D", 10, 10],
		["MV22", 10, 10],
		["An2_1_TK_CIV_EP1", 10, 10],
		["An2_2_TK_CIV_EP1", 10, 10],
		["L39", 5, 5],
		["C130J", 5, 5]
	];

//Hospital Doctor
//medkit
_td =
	[
		["medkit", -1, -1]
	];

//Mining Shop
_ms =
	[
		["Shovel", -1, -1],
		["Pickaxe", 10, 100],
		["JackHammer", 10, 50]
	];

//Resource Shop
_rs =
	[
		["Diamond_rock", -1 ,-1],
		["Platinum", -1, -1],
		["Gold", -1, -1],
		["Silver", -1, -1],
		["Rubies", -1, -1],
		["iron", -1, -1],
		["copper", -1, -1],
		["steel", -1, -1],
		["sand", -1, -1],
		["glass", -1, -1],

		// Refined Shit
		["Diamond_rock_refined", -1 ,-1],
		["Platinum_refined", -1, -1],
		["Gold_refined", -1, -1],
		["Silver_refined", -1, -1],
		["Rubies_refined", -1, -1],
		["iron_refined", -1, -1],
		["copper_refined", -1, -1],
		["steel_refined", -1, -1],
		["sand_refined", -1, -1],
		["glass_refined", -1, -1]
	];

//Diamond Sell
_gds =
	[
		["Diamondring", -1, -1],
		["EDiamondring", -1, -1],
		["Platinumring", -1, -1],
		["EPlatinumring", -1, -1]
	];

//Oil Trader/Seller
_os =
	[
		["OilBarrel", -1, -1]
	];

//Gangarea Shops
_gangshop_buy =
	[
		["GPS", -1, -1],
		["Binocular", -1, -1],
		["NVGoggles", -1, -1],
		["shape_charge", -1, -1],
		["repairkit", -1, -1],
		["lockpick", -1, -1],
		["lighter", -1, -1],
		["Fuelline", -1, -1],
		["kanister", -1, -1],
		["medkit", -1, -1],
		["revolver_EP1", -1, -1],
		["Rnd_45ACP", -1, -1],
		["Makarov", -1, -1],
		["Rnd_9x18_Makarov", -1, -1],
		["Colt1911", -1, -1],
		["Rnd_45ACP_1911", -1, -1],
		["UZI_EP1", -1, -1],
		["Rnd_9x19_UZI", -1, -1],
		["LeeEnfield", -1, -1],
		["x_303", -1, -1],
		["HandGrenade", -1, -1],
		["Stone", -1, -1],
		["AK_47_M", -1, -1],
		["Rnd_762x39_AK47", -1, -1],
		["AKS74U", -1, -1],
		["Rnd_545x39_AK", -1, -1],
		["ziptie", -1, -1]
	];

//Drug Traffiking
_db1 =
	[
		["marijuana", -1, -1],
		["cocaine", -1, -1],
		["lsd", -1, -1]
	];

_db2 =
	[
		["cocaine", -1, -1],
		["lsd", -1, -1]
	];

_db3 =
	[
		["heroin", -1, -1],
		["marijuana", -1, -1]
	];

//Cocaine Sell
_dsc =
	[
		["cocaine", -1, -1]
	];
//Meth Sell
_dsmeth =
	[
		["meth", -1, -1]
	];

//Marijuana Sell
_dsm =
	[
		["marijuana", -1, -1]
	];

//LSD Sell
_dsl =
	[
		["lsd", -1, -1]
	];

//Heroin Sell
_dsh =
	[
		["heroin", -1, -1]
	];

	// Weapons
_unWeapons1 = [
		["M1014", -1, -1],
		["Rnd_B_Beneli_74Slug", -1, -1],
		["Rnd_B_Beneli_Pellets", -1, -1],
		["MP5A5", -1, -1],
		["Rnd_9x19_MP5", -1, -1],
		["M9_PMC", -1, -1],
		["M9SD_PMC", -1, -1],
		["Rnd_9x19_M9SD",-1,-1],
		["glock17_PMC", -1, -1],
		["Rnd_9x19_M9", -1, -1],
		["Rnd_9x19_glock17", -1, -1]
	];

	// ESU
esu_vehicle_shop = [
	["UH60M_MEV_EP1_esu",-1,-1],
	["SUV_TK_EP1_esu",-1,-1],
	["S1203_ambulance_EP1", -1, -1],
	["HMMWV_Ambulance_CZ_DES_EP1", -1, -1]
];

esu_item_shop = [
	["esumedkit", -1, -1],
	["esurepairkit",-1,-1],
	["GPS", -1, -1],
	["Binocular", -1, -1],
	["NVGoggles", -1, -1],
	//["jawsoflife", -1, -1],
	["medkit", -1, -1],
	["kanister",  -1, -1],
	["repairkit",  -1, -1],
	["supgrade2",  -1, -1],
	["supgrade3",  -1, -1]

];


_unWeapons2 = [
		["M249_EP1", -1, -1],
		["M249_m145_EP1", -1, -1],
		["Rnd_100_M249", -1, -1],
		["Rnd_200_M249", -1, -1],
		["BAF_L110A1_Aim", -1, -1],
		["Rnd_556x45_L110A1", -1, -1],
		["Mk_48", -1, -1],
		["Mk_48_DES_EP1", -1, -1],
		["BAF_L7A2_GPMG", -1, -1],
		["Rnd_762x51_M240", -1, -1],
		["MG36_camo", -1, -1],
		["m8_SAW", -1, -1],
		["Rnd_556x45_BetaCMag", -1, -1]
];

_unWeapons3 = [
		["AA12_PMC", -1, -1],
		["Rnd_B_AA12_74Slug", -1, -1],
		["Rnd_B_AA12_Pellets", -1, -1],
		["M14_EP1",-1,-1],
		["M16A2",-1,-1],
		["M16A2GL",-1,-1],
		["m16a4",-1,-1],
		["M16A4_GL",-1,-1],
		["m16a4_acg",-1,-1],
		["M16A4_ACG_GL",-1,-1],
		["M4A1",-1,-1],
		["M4A1_Aim",-1,-1],
		["M4A1_Aim_camo",-1,-1],
		["M4A1_AIM_SD_camo",-1,-1],
		["M4A1_HWS_GL",-1,-1],
		["M4A1_HWS_GL_camo",-1,-1],
		["M4A1_HWS_GL_SD_Camo",-1,-1],
		["M4A1_RCO_GL",-1,-1],
		["M4A3_CCO_EP1",-1,-1],
		["M4A3_RCO_GL_EP1",-1,-1],
		["SCAR_L_CQC_CCO_SD",-1,-1],
		["SCAR_L_CQC",-1,-1],
		["SCAR_L_CQC_Holo",-1,-1],
		["SCAR_L_CQC_EGLM_Holo",-1,-1],
		["SCAR_L_STD_HOLO",-1,-1],
		["SCAR_L_STD_EGLM_RCO",-1,-1],
		["SCAR_L_STD_Mk4CQT",-1,-1],
		["SCAR_H_CQC_CCO",-1,-1],
		["SCAR_H_CQC_CCO_SD",-1,-1],
		["SCAR_H_STD_EGLM_Spect",-1,-1],
		["MP5A5",-1,-1],
		["MP5SD",-1,-1],
		["Sa58P_EP1",-1,-1],
		["Sa58V_EP1",-1,-1],
		["Sa58V_CCO_EP1",-1,-1],
		["Sa58V_RCO_EP1",-1,-1],
		["FN_FAL",-1,-1],
		["FN_FAL_ANPVS4",-1,-1],
		["G36a",-1,-1],
		["G36C",-1,-1],
		["G36A_camo",-1,-1],
		["G36C_camo",-1,-1],
		["G36K_camo",-1,-1],
		["M8_compact",-1,-1],
		["MG36",-1,-1],
		["m8_holo_sd",-1,-1],

		// MAGS
		["Rnd_556x45_Stanag",-1,-1],
		["Rnd_556x45_StanagSD",-1,-1],
		["Rnd_20_Stanag",-1,-1],
		["Rnd_556x45_G36",-1,-1],
		["Rnd_556x45_G36SD",-1,-1],
		["Rnd_556x45_BetaCMag",-1,-1],
		["rnd_762x51_B_SCAR",-1,-1],
		["Rnd_762x51_SB_SCAR",-1,-1],
		["Rnd_9x19_MP5",-1,-1],
		["Rnd_9x19_MP5SD",-1,-1],
		["Rnd_762x39_SA58",-1,-1],
		["Rnd_762x51_DMR", -1, -1],
		["Rnd_762x51_FNFAL",-1,-1]

];

_unWeapons4 = [
		["SMAW" ,-1,-1],
		["SMAW_HEDP" ,-1,-1 ],
		["SMAW_HEAA",-1,-1 ],
		["M136",-1,-1],
		["M136_m",-1,-1],
		["Stinger", -1, -1],
		["Stinger_mag", -1, -1],
		["M24",-1,-1],
		["M40A3",-1,-1],
		["DMR",-1,-1],
		["M4SPR",-1,-1],
		["BAF_LRR_scoped",-1,-1],
		["M110_NVG_EP1",-1,-1],
		["SCAR_H_LNG_Sniper",-1,-1],

		// MAGS
		["Rnd_762x51_M24",-1,-1],
		["Rnd_762x51_DMR",-1,-1],
		["Rnd_86x70_L115A1",-1,-1],
		["rnd_762x51_B_SCAR",-1,-1],
		["Mk13", -1, -1],
		["Rnd_HE_M203", -1, -1],
		["Rnd_Smoke_M203", -1, -1],
		["Rnd_SmokeRed_M203", -1, -1],
		["Rnd_SmokeGreen_M203", -1, -1],
		["Rnd_SmokeYellow_M203", -1, -1],
		["FlareWhite_M203", -1, -1],
		["FlareGreen_M203", -1, -1],
		["FlareRed_M203", -1, -1],
		["FlareYellow_M203", -1, -1],
		["HandGrenade_BAF", -1, -1],
		["SmokeShell", -1, -1],
		["SmokeShellRed", -1, -1],
		["SmokeShellGreen", -1, -1],
		["SmokeShellYellow", -1, -1],
		["SmokeShellPurple", -1, -1],
		["SmokeShellBlue", -1, -1],
		["PipeBomb", -1, -1],
		["Mine", -1, -1],
		["Tripod_Bag", -1, -1],
		["BAF_GPMG_Minitripod_D_bag",  -1, -1],
		["BAF_L2A1_ACOG_tripod_bag", -1, -1],
		["BAF_L2A1_ACOG_minitripod_bag", -1, -1],
		["CZ_Backpack_EP1",	 -1, -1],
		["CZ_VestPouch_EP1", -1, -1],
		["US_UAV_Pack_EP1", -1, -1],
		["BAF_AssaultPack_FAC", -1, -1]
];

	//Items
_unItems = [
		["handy", -1, -1],
		["bodyarmor_100", -1, -1],
		["bodyarmor_50", -1, -1],
		["bodyarmor_20", -1, -1],
		
		["repairkit", -1, -1],
		["kanister", -1, -1],
		["medkit", -1, -1],
		["spikestrip", -1, -1],
		["weaponbag", -1, -1],
		["Itembag", -1, -1],
		["defuser", -1, -1],
		["vclammo", -1, -1],
		["lockpick", -1, -1],
		["Binocular", -1, -1],
		["Binocular_Vector", -1, -1],
		["NVGoggles", -1, -1],
		["nitro", -1, -1],
		["supgrade1", -1, -1],
		["supgrade2", -1, -1],
		["supgrade3", -1, -1],
		["supgrade4", -1, -1],
		["supgrade5", -1, -1],
		["tracker", 25, 25],
		["bait",-1,-1],
		["gasmask", -1, -1],
		["earplugs", -1, -1],
		["stun_light", -1, -1],
		["stun_full", -1, -1],
		["Tripod_Bag", -1, -1],
		["M2HD_mini_TriPod_US_Bag_EP1", -1, -1],
		["M2StaticMG_US_Bag_EP1", -1, -1],
		["CZ_Backpack_EP1",	 -1, -1],
		["CZ_VestPouch_EP1", -1, -1],
		["USBasicBag", -1, -1],
		["US_Assault_Pack_EP1", -1, -1],
		["US_UAV_Pack_EP1", -1, -1],
		["US_Backpack_EP1", -1, -1],
		["US_Patrol_Pack_EP1", -1, -1]

	];

	// Heavy Vehicles
_unHeavyVehicles = [

		["M1A1_US_DES_EP1", -1, -1],
		["M6_EP1",-1 ,-1],
		["M1128_MGS_EP1",-1,-1],
		["LAV25", -1, -1],
		["M1126_ICV_M2_EP1", -1, -1],
		["LAV25_HQ", -1 ,-1],
		["M113_UN_EP1", -1, -1],
		["M113Ambul_UN_EP1", -1, -1]

	];

	// Light Vehicles
_unLightVehicles = [
		["Old_bike_TK_INS_EP1", -1, -1],
		["MMT_USMC", -1, -1],
		["M1030_US_DES_EP1", -1, -1],
		["ATV_US_EP1", -1, -1],
		["Ural_UN_EP1", -1, -1],
		["MTVR_DES_EP1", -1, -1],
		["MtvrReammo_DES_EP1", -1, -1],
		["MtvrRefuel_DES_EP1", -1, -1],
		["MtvrRepair_DES_EP1", -1, -1],
		["SUV_UN_EP1_un",-1 ,-1],
		["HMMWV_MK19_DES_EP1", -1, -1],
		["HMMWV_M998_crows_M2_DES_EP1", -1, -1],
		["HMMWV_M1151_M2_CZ_DES_EP1", -1, -1],
		["BAF_Jackal2_L2A1_D", -1, -1],
		["HMMWV_TOW_DES_EP1", -1, -1],
		["HMMWV_Avenger_DES_EP1", -1, -1],
		["HMMWV_Armored",  -1, -1]


	];

_unAirShop = [

		["AH64D_Sidewinders",-1,-1],
		["AH64D_EP1",-1,-1],
		["AH1Z",-1,-1],
		["CH_47F_EP1", -1, -1],
		["UH60M_MEV_EP1", -1, -1],
		["Mi17_UN_CDF_EP1", -1, -1],
		["MH6J_EP1", -1, -1],
		["AH6X_EP1", -1, -1],
		["AH6J_EP1", -1, -1],
		["UH60M_EP1", -1, -1],
		["Mi171Sh_CZ_EP1", -1, -1]


	];
_unPlaneShop = [

		["C130J_US_EP1_cop", -1, -1],
		["A10_US_EP1", -1, -1],
		["AV8B2", -1, -1],
		["MQ9PredatorB_unarmed", -1, -1]

	];


//Blufor Vehicle Shop
_cv =
	[
		
		["Old_bike_TK_INS_EP1", -1, -1],
		["MMT_USMC", -1, -1],
		["M1030_US_DES_EP1", -1, -1],
		["ATV_US_EP1", -1, -1],
		["LadaLM", -1, -1],
		["hilux1_civil_1_open_police_retex",-1,-1],
		["SUV_UN_EP1_retex", -1, -1],
		["SUV_TK_EP1_retex_special",-1 ,-1],
		["LandRover_TK_CIV_EP1_cop",-1 ,-1]


	];

// BLUFOR VICE VEHICLES
_vice =
	[
		["SUV_TK_CIV_EP1_vice",-1,-1],
		["SUV_TK_CIV_EP1",-1,-1],
		["hilux1_civil_1_open_police_retex",-1,-1],
		["hilux1_civil_3_open_EP1_vice",-1,-1],
		["Lada2_vice",-1,-1],
		["S1203_TK_CIV_EP1_vice",-1,-1],
		["Car_Sedan_vice",-1,-1],
		["VWGolf_vice",-1,-1],
		["VolhaLimo_vice",-1,-1],
		["SkodaGreen_vice",-1,-1]
	];

//Blufor SOBR Vehicle Shop
_sv =
	[
		["HMMWV_M1151_M2_DES_EP1", -1, -1],
		["stunhmmv", -1, -1],
		["M113_UN_EP1", -1, -1],
		
		["LAV25_HQ", -1, -1],
		["HMMWV_Armored", -1, -1],
		["HMMWV_Ambulance_DES_EP1", -1, -1],
		["HMMWV_Terminal_EP1", -1, -1],
		["M113Ambul_UN_EP1", -1, -1],
		
		["MTVR_DES_EP1", -1, -1],
		["MtvrReammo_DES_EP1", -1, -1],
		["MtvrRefuel_DES_EP1", -1, -1],
		["MtvrRepair_DES_EP1", -1, -1],
		["HMMWV", -1, -1],
		["HMMWV_DES_EP1", -1, -1],
		["TowingTractor",-1,-1]
	];
// Blufor War Vehicle Shop
_bwv = [
	["M1A1_US_DES_EP1", -1, -1],
	["M6_EP1", -1, -1],
	["M1126_ICV_M2_EP1", -1, -1],
	["M1126_ICV_mk19_EP1", -1, -1],
	["M1135_ATGMV_EP1", -1, -1],
	["M1128_MGS_EP1", -1, -1],
	["HMMWV_Avenger_DES_EP1", -1, -1],
	["HMMWV_M998_crows_M2_DES_EP1", -1, -1],
	["HMMWV_TOW_DES_EP1", -1, -1],
	["HMMWV_M998A2_SOV_DES_EP1", -1, -1],
	["AAV", -1, -1],
	["LAV25", -1, -1],
	["AH1Z", -1, -1],
	["AH64D_Sidewinders", -1, -1]
	
];

//Blufor SOBR Air Shop
_sa =
	[
		["UH1Y", -1, -1],
		["MH6J_EP1", -1, -1],
		["AH6X_EP1", -1, -1],
		["UH1H_TK_GUE_EP1_cop", -1, -1],
		["MH60S", -1, -1],
		["UH60M_MEV_EP1", -1, -1],
		["AH6J_EP1", -1, -1],
		["CH_47F_EP1", -1, -1],
		["UH60M_EP1", -1, -1]
	];

// PMC land vehicles
_pmcveh =
	[
		
		["BAF_ATV_D", -1, -1],
		["MMT_USMC", -1, -1],
		["M1030", -1, -1],
		["SUV_PMC_BAF", -1, -1],
		["ArmoredSUV_PMC", -1, -1],
		["HMMWV_M1035_DES_EP1", -1, -1],
		["HMMWV_DES_EP1", -1, -1],
		["MTVR_DES_EP1", -1, -1],
		["MtvrReammo_DES_EP1", -1, -1],
		["MtvrRefuel_DES_EP1", -1, -1],
		["MtvrRepair_DES_EP1", -1, -1]
	];

// PMC air vehicles
_pmcair =
	[
		["MH6J_EP1", -1, -1],
		["Ka60_PMC_miniguns", -1, -1],
		["Ka60_GL_PMC",-1,-1],
		["UH60M_MEV_EP1", -1, -1],
		["BAF_Merlin_PMC", -1, -1]
	];
//PMC Items
_pmcs        =
	[
		["handy", -1, -1],
		["GPS", -1, -1],
		["NVGoggles", -1, -1],
		["Binocular", -1, -1],
		["Binocular_Vector", -1, -1],
		["lockpick", -1, -1],
		["medkit", -1, -1],
		
		["repairkit", -1, -1],
		["ziptie", -1, -1],
		["kanister", -1, -1],
		["supgrade1", -1, -1],
		["supgrade2", -1, -1],
		["supgrade3", -1, -1],
		["supgrade4", -1, -1],
		["supgrade5", -1, -1],
		["tracker", 25, 25],
		["nitro", -1, -1],
		["vclammo", -1, -1],
		["gasmask", -1, -1],
		["earplugs", -1, -1],
		["stun_light", -1, -1],
		["bodyarmor_50", -1, -1],
		["bodyarmor_20", -1, -1],
		["M1014", -1, -1],
		["Rnd_B_Beneli_74Slug", -1, -1],
		["Rnd_B_Beneli_Pellets", -1, -1],
		["MP5A5", -1, -1],
		["Rnd_9x19_MP5", -1, -1],
		["M136",-1,-1],
		["M136_m",-1,-1],
		["M9_PMC", -1, -1],
		["UZI_EP1_pmc",-1,-1],
		["Rnd_9x19_UZI",-1,-1],
		["M9SD_PMC", -1, -1],
		["Rnd_9x19_M9SD",-1,-1],
		["glock17_PMC", -1, -1],
		["Rnd_9x19_M9", -1, -1],
		["Rnd_9x19_glock17", -1, -1],
		["AA12_PMC", -1, -1],
		["Rnd_B_AA12_74Slug", -1, -1],
		["Rnd_B_AA12_Pellets", -1, -1],
		["m16a4", -1, -1],
		["M16A4_GL", -1, -1],
		["M4A1", -1, -1],
		["M4A1_Aim", -1, -1],
		["M4A3_CCO_EP1", -1, -1],
		["M4A3_RCO_GL_EP1", -1, -1],
		["Rnd_20_Stanag", -1, -1],
		["Rnd_556x45_Stanag", -1, -1],
		["G36A_camo", -1, -1],
		["G36C_camo", -1, -1],
		["G36K_camo", -1, -1],
		["G36_C_SD_camo", -1, -1],
		["Rnd_556x45_G36", -1, -1],
		["Rnd_556x45_G36SD", -1, -1],
		["MG36_camo", -1, -1],
		["Rnd_556x45_BetaCMag", -1, -1],
		["m8_carbine", -1, -1],
		["m8_SAW", -1, -1],
		["m8_sharpshooter", -1, -1],
		["m8_carbine_pmc", -1, -1],
		["m8_carbineGL", -1, -1],
		["M8_compact",  -1, -1],
		["m8_compact_pmc", -1, -1],
		["m8_holo_sd", -1, -1],
		["Rnd_20_Stanag", -1, -1],
		["Rnd_556x45_Stanag", -1, -1],
		["Rnd_556x45_StanagSD", -1, -1],
		["BAF_L85A2_RIS_Holo", -1, -1],
		["BAF_L85A2_UGL_Holo", -1, -1],
		["BAF_L85A2_RIS_ACOG", -1, -1],
		["BAF_L85A2_UGL_ACOG", -1, -1],
		["BAF_L85A2_RIS_SUSAT", -1, -1],
		["BAF_L85A2_UGL_SUSAT", -1, -1],
		["BAF_L86A2_ACOG", -1, -1],
		["Rnd_20_Stanag", -1, -1],
		["Rnd_556x45_Stanag", -1, -1],
		["M249_EP1", -1, -1],
		["M249_m145_EP1", -1, -1],
		["Rnd_100_M249", -1, -1],
		["Rnd_200_M249", -1, -1],
		["BAF_L110A1_Aim", -1, -1],
		["Rnd_556x45_L110A1", -1, -1],
		["Mk_48", -1, -1],
		["Mk_48_DES_EP1", -1, -1],
		["BAF_L7A2_GPMG", -1, -1],
		["Rnd_762x51_M240", -1, -1],
		["M24", -1, -1],
		["M24_des_EP1", -1, -1],
		["Rnd_762x51_M24", -1, -1],
		["M110_NVG_EP1", -1, -1],
		["rnd_762x51_B_SCAR", -1, -1],
		["M14_EP1", -1, -1],
		["DMR",-1,-1],
		["Rnd_762x51_DMR", -1, -1],
		["Mk13", -1, -1],
		["Rnd_HE_M203", -1, -1],
		["Rnd_Smoke_M203", -1, -1],
		["Rnd_SmokeRed_M203", -1, -1],
		["Rnd_SmokeGreen_M203", -1, -1],
		["Rnd_SmokeYellow_M203", -1, -1],
		["FlareWhite_M203", -1, -1],
		["FlareGreen_M203", -1, -1],
		["FlareRed_M203", -1, -1],
		["FlareYellow_M203", -1, -1],
		["HandGrenade_BAF", -1, -1],
		["SmokeShell", -1, -1],
		["SmokeShellRed", -1, -1],
		["SmokeShellGreen", -1, -1],
		["SmokeShellYellow", -1, -1],
		["SmokeShellPurple", -1, -1],
		["SmokeShellBlue", -1, -1],
		["PipeBomb", -1, -1],
		["Mine", -1, -1],
		["Tripod_Bag", -1, -1],
		["BAF_GPMG_Minitripod_D_bag",  -1, -1],
		["BAF_L2A1_ACOG_tripod_bag", -1, -1],
		["BAF_L2A1_ACOG_minitripod_bag", -1, -1],
		["CZ_Backpack_EP1",	 -1, -1],
		["CZ_VestPouch_EP1", -1, -1],
		["US_UAV_Pack_EP1", -1, -1],
		["BAF_AssaultPack_FAC", -1, -1]
	];

//Blufor Shop
_copshop =
	[
		["wonderglue",-1,-1],
		["handy", -1, -1],
		["bodyarmor_50", -1, -1],
		["bodyarmor_20", -1, -1],
		
		["repairkit", -1, -1],
		["kanister", -1, -1],
		["medkit", -1, -1],
		["spikestrip", -1, -1],
		["weaponbag", -1, -1],
		["Itembag", -1, -1],
		["defuser", -1, -1],
		["vclammo", -1, -1],
		["lockpick", -1, -1],
		["Binocular", -1, -1],
		["Binocular_Vector", -1, -1],
		["NVGoggles", -1, -1],
		["nitro", -1, -1],
		["supgrade1", -1, -1],
		["supgrade2", -1, -1],
		["supgrade3", -1, -1],
		["supgrade4", -1, -1],
		["supgrade5", -1, -1],
		["tracker", 25, 25],
		["bait",-1,-1],
		["gasmask", -1, -1],
		["earplugs", -1, -1],
		["stun_light", -1, -1],
		["stun_full", -1, -1],
		["CZ_Backpack_EP1",	 -1, -1],
		["CZ_VestPouch_EP1", -1, -1],
		["USBasicBag", -1, -1],
		["US_Assault_Pack_EP1", -1, -1],
		["US_UAV_Pack_EP1", -1, -1],
		["US_Backpack_EP1", -1, -1],
		["US_Patrol_Pack_EP1", -1, -1]
	];

// Blufor Rookie Shop
blufor_rookie_shop = [
		["M9", -1, -1],
		["Rnd_9x19_M9", -1, -1],
		["Rnd_9x19_M9SD", -1, -1],
		["Saiga12K", -1, -1],
		["Rnd_B_Saiga12_74Slug", -1, -1],
		["Rnd_B_Saiga12_Pellets", -1, -1],
		["M1014", -1, -1],
		["Rnd_B_Beneli_74Slug", -1, -1],
		["Rnd_B_Beneli_Pellets", -1, -1],
		["MP5A5", -1, -1],
		["MP5SD", -1, -1],
		["Rnd_9x19_MP5SD_cop", -1, -1]
];

//Blufor Patrol
blufor_patrol_shop =
	[

		["FN_FAL", -1, -1],
		["Rnd_762x51_FNFAL", -1, -1],
		["M4A1", -1, -1],
		["M16A2", -1, -1],
		["M16A2GL", -1, -1],
		["m16a4", -1, -1],
		["M16A4_GL", -1, -1],
		["Rnd_20_Stanag", -1, -1],
		["SmokeShell", -1, -1],
		["SmokeShellRed", -1, -1],
		["SmokeShellGreen", -1, -1],
		["SmokeShellYellow", -1, -1],
		["SmokeShellPurple", -1, -1],
		["SmokeShellBlue", -1, -1],
		["SmokeShellOrange", -1, -1],
		["Rnd_Smoke_M203", -1, -1],
		["Rnd_SmokeRed_M203", -1, -1],
		["Rnd_SmokeGreen_M203", -1, -1],
		["Rnd_SmokeYellow_M203", -1, -1],
		["FlareWhite_M203", -1, -1],
		["FlareGreen_M203", -1, -1],
		["FlareRed_M203", -1, -1],
		["FlareYellow_M203", -1, -1]
	];

//Blufor Response
blufor_response_shop =
	[
		["M136",-1,-1 ],
		["M136_m",-1,-1 ],
		
		["Stinger",-1,-1 ],		
		["Stinger_mag",-1,-1 ],
		
		
		["glock17_EP1", -1, -1],
		["Rnd_9x19_glock17", -1, -1],
		["M4A1_Aim", -1, -1],
		["M4A1_HWS_GL", -1, -1],
		["M4A1_RCO_GL", -1, -1],
		["m16a4_acg", -1, -1],
		["M16A4_ACG_GL", -1, -1],
		["SCAR_L_STD_HOLO", -1, -1],
		["SCAR_L_STD_Mk4CQT", -1, -1],
		["SCAR_L_CQC", -1, -1],
		["SCAR_L_CQC_Holo", -1, -1],
		["SCAR_L_CQC_EGLM_Holo", -1, -1],
		["SCAR_L_STD_EGLM_RCO", -1, -1],
		["Rnd_556x45_Stanag", -1, -1],
		["SCAR_L_CQC_CCO_SD", -1, -1],
		["Rnd_556x45_StanagSD", -1, -1],
		["Sa58V_CCO_EP1", -1, -1],
		["Sa58V_RCO_EP1", -1, -1],
		["Rnd_762x39_SA58", -1, -1],
		["G36a", -1, -1],
		["G36C", -1, -1],
		["G36K", -1, -1],
		["G36_C_SD_eotech", -1, -1],
		["Rnd_556x45_G36", -1, -1],
		["Rnd_556x45_G36SD", -1, -1],
		["MG36", -1, -1],
		["Rnd_556x45_BetaCMag", -1, -1],
		["M4SPR", -1, -1],
		["Rnd_20_Stanag", -1, -1],
		["Mk13", -1, -1],
		["Rnd_HE_M203", -1, -1],
		["Rnd_Smoke_M203", -1, -1],
		["Rnd_SmokeRed_M203", -1, -1],
		["Rnd_SmokeGreen_M203", -1, -1],
		["Rnd_SmokeYellow_M203", -1, -1],
		["FlareWhite_M203", -1, -1],
		["FlareGreen_M203", -1, -1],
		["FlareRed_M203", -1, -1],
		["FlareYellow_M203", -1, -1],
		["SmokeShell", -1, -1],
		["SmokeShellRed", -1, -1],
		["SmokeShellGreen", -1, -1],
		["SmokeShellYellow", -1, -1],
		["SmokeShellPurple", -1, -1],
		["SmokeShellBlue", -1, -1],
		["SmokeShellOrange", -1, -1],
		["HandGrenade_West", -1, -1]
	];
_cop_airbase = [
		["AH64D_Sidewinders",-1,-1],
		["AH64D_EP1",-1,-1],
		["AH1Z",-1,-1],
		["CH_47F_EP1", -1, -1],
		["UH60M_MEV_EP1", -1, -1],
		["Mi17_UN_CDF_EP1", -1, -1],
		["UH1Y",-1,-1],
		["MH6J_EP1", -1, -1],
		["AH6X_EP1", -1, -1],
		["AH6J_EP1", -1, -1],
		["UH60M_EP1", -1, -1],
		["Mi171Sh_CZ_EP1", -1, -1],
		["C130J_US_EP1_cop", -1, -1],
		["A10_US_EP1", -1, -1],
		["AV8B2", -1, -1],
		["MQ9PredatorB_unarmed", -1, -1]
];
	

//Blufor SOBR
blufor_sobr_shop =
	[
		["bodyarmor_100", -1, -1],
		["M9SD", -1, -1],
		["Rnd_9x19_M9SD", -1, -1],
		["G36A_camo", -1, -1],
		["G36C_camo", -1, -1],
		["G36K_camo", -1, -1],
		["G36_C_SD_camo", -1, -1],
		["Rnd_556x45_G36", -1, -1],
		["Rnd_556x45_G36SD", -1, -1],
		["MG36_camo", -1, -1],
		["Rnd_556x45_BetaCMag", -1, -1],
		["BAF_L85A2_RIS_Holo", -1, -1],
		["BAF_L85A2_UGL_Holo", -1, -1],
		["BAF_L85A2_RIS_ACOG", -1, -1],
		["BAF_L85A2_UGL_ACOG", -1, -1],
		["BAF_L85A2_RIS_SUSAT", -1, -1],
		["BAF_L85A2_UGL_SUSAT", -1, -1],
		["BAF_L86A2_ACOG", -1, -1],
		["Rnd_556x45_Stanag", -1, -1],
		["M4A1_Aim_camo", -1, -1],
		["M4A1_HWS_GL_camo", -1, -1],
		["M4A3_RCO_GL_EP1", -1, -1],
		["M4A3_CCO_EP1", -1, -1],
		["Rnd_556x45_Stanag", -1, -1],
		["M4A1_AIM_SD_camo", -1, -1],
		["M4A1_HWS_GL_SD_Camo", -1, -1],
		["Rnd_556x45_StanagSD", -1, -1],
		["M24", -1, -1],
		["M24_des_EP1", -1, -1],
		["M40A3", -1, -1],
		["Rnd_762x51_M24", -1, -1],
		["Rnd_762x51_M240", -1, -1],
		["M14_EP1", -1, -1],
		["Rnd_762x51_DMR", -1, -1],
		["Rnd_HE_M203", -1, -1],
		["Rnd_Smoke_M203", -1, -1],
		["SmokeShell", -1, -1],
		["SmokeShellRed", -1, -1],
		["HandGrenade_West", -1, -1]
	];
//Blufor Colonel
blufor_colonel_shop =
	[
		["Tripod_Bag" ,-1,-1],
		["M2HD_mini_TriPod_US_Bag_EP1" ,-1,-1],
		["M2StaticMG_US_Bag_EP1" ,-1,-1],
		["MK19_TriPod_US_Bag_EP1" ,-1,-1],
		["TOW_TriPod_US_Bag_EP1" ,-1,-1],
		
		
		["SMAW" ,-1,-1],
		["SMAW_HEDP" ,-1,-1],
		["SMAW_HEAA",-1,-1],
		
		["NLAW",-1,-1 ],
		["NLAW_m",-1,-1 ],
		
		["SCAR_H_CQC_CCO", -1, -1],
		["SCAR_H_CQC_CCO_SD", -1, -1],
		["M110_NVG_EP1", -1, -1],
		["SCAR_H_STD_EGLM_Spect", -1, -1],
		["SCAR_H_LNG_Sniper", -1, -1],
		["rnd_762x51_B_SCAR", -1, -1],
		["Rnd_762x51_SB_SCAR", -1, -1],
		
		["BAF_L85A2_RIS_Holo", -1, -1],
		["BAF_L85A2_UGL_Holo", -1, -1],
		["BAF_L85A2_RIS_ACOG", -1, -1],
		["BAF_L85A2_UGL_ACOG", -1, -1],
		["BAF_L86A2_ACOG", -1, -1],
		["Rnd_556x45_Stanag", -1, -1],
		["Rnd_556x45_StanagSD", -1, -1],
		["Rnd_556x45_G36", -1, -1],
		["Rnd_556x45_BetaCMag", -1, -1],
		
		["DMR", -1, -1],
		["Rnd_762x51_DMR", -1, -1],
		
		["M60A4_EP1", -1, -1],
		["M249_200", -1, -1],
		["M249_EP1", -1, -1],
		["M240", -1, -1],
		["m240_scoped_EP1", -1, -1],
		["Mk_48", -1, -1],
		["Mk_48_DES_EP1", -1, -1],
		["BAF_L110A1_Aim", -1, -1],
		["Rnd_556x45_L110A1", -1, -1],
		["Rnd_100_M249", -1, -1],
		["Rnd_200_M249", -1, -1],
		["Rnd_762x51_M240", -1, -1],
		
		
		["BAF_LRR_scoped", -1, -1],
		["Rnd_86x70_L115A1", -1, -1]
	];



//Terror Shop
_terrorshop_buy =
	[
		["handy", -1, -1],
		["GPS", -1, -1],
		["Binocular", -1, -1],
		["Binocular_Vector", -1, -1],
		["NVGoggles", -1, -1],
		["lockpick", -1, -1],
		["medkit", -1, -1],
		["repairkit", -1, -1],
		["kanister", -1, -1],
		["supgrade1", -1, -1],
		["supgrade2", -1, -1],
		["supgrade3", -1, -1],
		["supgrade4", -1, -1],
		["supgrade5", -1, -1],
		["tracker", 25, 25],
		["nitro", -1, -1],
		["vclammo", -1, -1],
		["gasmask", -1, -1],
		["earplugs", -1, -1],
		["stun_light_ter", -1, -1],
		["selbstmordbombe", -1, -1],
		["SmokeShellOrange", -1, -1],
		["Colt1911", -1, -1],
		["Rnd_45ACP_1911", -1, -1],
		["revolver_EP1", -1, -1],
		["revolver_gold_EP1", -1, -1],
		["Rnd_45ACP", -1, -1],
		["MakarovSD", -1, -1],
		["Makarov", -1, -1],
		["Rnd_9x18_Makarov", -1, -1],
		["Rnd_9x18_MakarovSD", -1, -1],
		["UZI_EP1", -1, -1],
		["UZI_SD_EP1", -1, -1],
		["Rnd_9x19_UZI", -1, -1],
		["Rnd_9x19_UZI_SD", -1, -1],
		["Sa61_EP1", -1, -1],
		["Rnd10_765x17_Ball", -1, -1],
		["Rnd20_765x17_Ball", -1, -1],
		["Saiga12K", -1, -1],
		["Rnd_B_Saiga12_74Slug", -1, -1],
		["Rnd_B_Saiga12_Pellets", -1, -1],
		["LeeEnfield", -1, -1],
		["x_303", -1, -1],
		["FN_FAL", -1, -1],
		["Rnd_762x51_FNFAL", -1, -1],
		["AK_47_M", -1, -1],
		["AK_47_S", -1, -1],
		["AKS_GOLD", -1, -1],
		["Rnd_762x39_AK47", -1, -1],
		["VSS_Vintorez", -1, -1],
		["Rnd_9x39_10_VSS", -1, -1],
		["Rnd_9x39_20_VSS", -1, -1],
		["KSVK", -1, -1],
		["5Rnd_127x108_KSVK"],
		["Sa58P_EP1", -1, -1],
		["Sa58V_EP1", -1, -1],
		["Sa58V_CCO_EP1", -1, -1],
		["Sa58V_RCO_EP1", -1, -1],
		["Rnd_762x39_SA58", -1, -1],
		["AKS74U", -1, -1],
		["AKS_74_UN_kobra", -1, -1],
		["RPK_74",  -1, -1],
		["AK74", -1, -1],
		["AK74GL", -1, -1],
		["AKS_74", -1, -1],
		["AKS74kobra", -1, -1],
		["AKS74kobragl", -1, -1],
		["AKS74pso", -1, -1],
		["Rnd_545x39_AK", -1, -1],
		["Rnd_545x39_AKSD",	 -1, -1],
		["Rnd_545x39_RPK", -1, -1],
		["PK", -1, -1],
		//["UK59_ACR", -1, -1],
		["Rnd_762x54_PK", -1, -1],
		["SVD", -1, -1],
		["Rnd_762x54_SVD", -1, -1],
		["CZ_550", -1, -1],
		["x_22_LR_17_HMR", -1, -1],
		["RPG7V", -1, -1],
		["PG7V",  -1, -1],
		["PG7VR", -1, -1],
		["PG7VL", -1, -1],
		["OG7", -1, -1],
		["HandGrenade_East", -1, -1],
		["Stone", -1, -1],
		["SmokeShell", -1, -1],
		["M79", -1, -1],
		["Rnd_HE_M203", -1, -1],
		["Rnd_HE_GP25", -1, -1],
		["FlareWhite_GP25", -1, -1],
		["FlareGreen_GP25", -1, -1],
		["FlareRed_GP25", -1, -1],
		["FlareYellow_GP25", -1, -1],
		["Rnd_SMOKE_GP25", -1, -1],
		["Rnd_SmokeRed_GP25", -1, -1],
		["Rnd_SmokeGreen_GP25", -1, -1],
		["Rnd_SmokeYellow_GP25", -1, -1],
		["MineE", -1, -1],
		["Garbage IED Small", -1, -1],
		["Garbage IED Large", -1, -1],
		["Ground IED Small", -1, -1],
		["Ground IED Large", -1, -1],
		["TK_ALICE_Pack_EP1", -1, -1],
		["TK_Assault_Pack_EP1", -1, -1],
		["TK_RPG_Backpack_EP1", -1, -1],
		["Tripod_Bag", -1, -1],
		["DSHkM_Mini_TriPod_TK_GUE_Bag_EP1", -1, -1],
		["DSHKM_TK_GUE_Bag_EP1", -1, -1],
		//["2b14_82mm_TK_INS_Bag_EP1", -1, -1],
		["ziptie", -1, -1]
	];

//Black Market Weapons
_bmw =
	[
		["M9_ill", -1, -1],
		["Rnd_9x19_M9", -1, -1],
		["Colt_ill", -1, -1],
		["Rnd_45ACP_1911", -1, -1],
		["revolver_ill", -1, -1],
		["revolver_gold_ill", -1, -1],
		["Rnd_45ACP", -1, -1],
		["Makarov_ill", -1, -1],
		["Rnd_9x18_Makarov", -1, -1],
		["UZI_EP1_ill", -1, -1],
		["Rnd_9x19_UZI", -1, -1],
		["Saiga_ill", -1, -1],
		["Rnd_B_Saiga12_74Slug", -1, -1],
		["Rnd_B_Saiga12_Pellets", -1, -1],
		["M16A2_ill", -1, -1],
		["M4A1_ill", -1, -1],
		["G36C_ill", -1, -1],
		["Rnd_20_Stanag", -1, -1],
		["Rnd_556x45_Stanag", -1, -1],
		["Rnd_556x45_G36", -1, -1],
		["AK_47_S_ill", -1, -1],
		["AKS_GOLD_ill", -1, -1],
		["Rnd_762x39_AK47", -1, -1],
		["AK74_ill", -1, -1],
		["AK74GL_ill", -1, -1],
		["AKS74kobragl_ill", -1, -1],
		["AKS74pso_ill", -1, -1],
		["AK_107_kobra_ill", -1, -1],
		["Rnd_545x39_AK", -1, -1],
		["LeeEnfield_ill", -1, -1],
		["x_303", -1, -1],
		["FN_FAL_ill", -1, -1],
		["Rnd_762x51_FNFAL", -1, -1],
		["RPK_74_ill",  -1, -1],
		["Rnd_545x39_RPK", -1, -1],
		["PK_ill", -1, -1],
		["Pecheneg_ill", -1, -1],
		["Rnd_762x54_PK", -1, -1],
		["M60A4_ill", -1, -1],
		["Rnd_762x51_M240", -1, -1],
		["CZ_550_ill", -1, -1],
		["x_22_LR_17_HMR", -1, -1],
		["SVD_ill", -1, -1],
		["Rnd_762x54_SVD", -1, -1],
		["VSS_vintorez_ill", -1, -1],
		["Rnd_9x39_20_VSS", -1, -1],
		["M24_des_EP1_ill", -1, -1],
		["Rnd_762x51_M24", -1, -1],
		["RPG7V_ill", -1, -1],
		["PG7V", -1, -1],
		["PG7VR", -1, -1],
		["PG7VL", -1, -1],
		["RPG18_ill", -1, -1],
		["RPG18_mag", -1, -1],
		["HandGrenade_East_ill", -1, -1],
		["SmokeShell_ill", -1, -1],
		["M79_ill", -1, -1],
		["Rnd_HE_GP25", -1, -1],
		["FlareWhite_GP25", -1, -1],
		["FlareGreen_GP25", -1, -1],
		["FlareRed_GP25", -1, -1],
		["FlareYellow_GP25", -1, -1],
		["Rnd_SmokeRed_GP25", -1, -1],
		["Rnd_SmokeGreen_GP25", -1, -1],
		["Rnd_SmokeYellow_GP25", -1, -1]
	];

//Black Market Equipment
_bme =
	[
		["handy", -1, -1],
		["GPS_ill", -1, -1],
		["Gold_Bar", -1, -1],
		["shape_charge", -1, -1],	
		["Binocular_ill", -1, -1],
		["Binocular_Vector_ill", -1, -1],
		["NVGoggles_ill", -1, -1],
		["medkit_ill", -1, -1],
		["lockpick_ill", -1, -1],
		["ziptie_ill", -1, -1],
		["lighter", -1, -1],
		["gasmask_ill", -1, -1],
		["earplugs", -1, -1],
		["car_bomb", -1, -1],
		["suitcase_bomb", -1, -1],
		["stun_light_ill", -1, -1],
		["bodyarmor_20_ill", -1, -1],
		["repairkit_ill", -1, -1],
		["tracker_ill", -1, -1],
		["Fuelline_ill", -1, -1],
		["kanister_ill", -1, -1],
		["nitro_ill", -1, -1],
		["supgrade1_ill", -1, -1],
		["supgrade2_ill", -1, -1],
		["supgrade3_ill", -1, -1],
		["supgrade4_ill", -1, -1],
		["supgrade5_ill", -1, -1]
	];

//Black Market Vehicles
_bmv =
	[
		["Lada1_ill", 5, 10],
		["Lada2_ill", 5, 10],
		["VolhaLimo_TK_CIV_ill", 5, 10],
		["Car_Sedan_ill", 5, 10],
		["VWGolf_ill", 5, 10],
		["LandRover_TK_CIV_ill", 5, 10],
		["hilux1_civil_3_open_ill", 5, 10],
		["Ural_TK_CIV_ill", 5, 10],
		["V3S_Open_TK_CIV_ill", 5, 10],
		["Pickup_PK_INS_ill", 5, 10],
		["UAZ_MG_INS_ill", 5, 10],
		["Offroad_DSHKM_INS_ill", 5, 10]
	];


// Drug Shop
_hash =
	[
		["marijuana", -1, -1],
		["cocaine", -1, -1],
		["lsd", -1, -1]
	];
// Terrorist Weapons
_igs =
	[
		["GPS", -1, -1],
		["Binocular", -1, -1],
		["Binocular_Vector", -1, -1],
		["NVGoggles", -1, -1],
		["SmokeShellOrange", -1, -1],
		["Colt1911", -1, -1],
		["Rnd_45ACP_1911", -1, -1],
		["revolver_EP1", -1, -1],
		["revolver_gold_EP1", -1, -1],
		["Rnd_45ACP", -1, -1],
		["Makarov", -1, -1],
		["MakarovSD", -1, -1],
		["Rnd_9x18_Makarov", -1, -1],
		["Rnd_9x18_MakarovSD", -1, -1],
		["UZI_EP1", -1, -1],
		["UZI_SD_EP1", -1, -1],
		["Rnd_9x19_UZI", -1, -1],
		["Rnd_9x19_UZI_SD", -1, -1],
		["Sa61_EP1", -1, -1],
		["Rnd10_765x17_Ball", -1, -1],
		["Rnd20_765x17_Ball", -1, -1],
		["Saiga12K", -1, -1],
		["Rnd_B_Saiga12_74Slug", -1, -1],
		["Rnd_B_Saiga12_Pellets", -1, -1],
		["LeeEnfield", -1, -1],
		["x_303", -1, -1],
		["FN_FAL", -1, -1],
		["Rnd_762x51_FNFAL", -1, -1],
		["Sa58P_EP1", -1, -1],
		["Sa58V_EP1", -1, -1],
		["Rnd_762x39_SA58", -1, -1],
		["AK_47_M", -1, -1],
		["AK_47_S", -1, -1],
		["Rnd_762x39_AK47", -1, -1],
		["AKS74U", -1, -1],
		["AKS_74_UN_kobra", -1, -1],
		["RPK_74",  -1, -1],
		["AK74", -1, -1],
		["AK74GL", -1, -1],
		["AKS_74", -1, -1],
		["AKS74kobra", -1, -1],
		["AKS74kobragl", -1, -1],
		["AKS74pso", -1, -1],
		["Rnd_545x39_AK", -1, -1],
		["Rnd_545x39_AKSD",	 -1, -1],
		["Rnd_545x39_RPK", -1, -1],
		["M40A3", -1, -1],
		["Rnd_762x51_M24", -1, -1],
		["PK", -1, -1],
		["Pecheneg",-1,-1],
		//["UK59_ACR", -1, -1],
		["Rnd_762x54_PK", -1, -1],
		["SVD", -1, -1],
		["Rnd_762x54_SVD", -1, -1],
		["CZ_550", -1, -1],
		["x_22_LR_17_HMR", -1, -1],
		["RPG7V", -1, -1],
		["PG7V",  -1, -1],
		["PG7VR", -1, -1],
		["PG7VL", -1, -1],
		["OG7", -1, -1],
		["RPG18", -1, -1],
		["RPG18_mag", -1, -1],
		["HandGrenade_East", -1, -1],
		["Stone", -1, -1],
		["SmokeShell", -1, -1],
		["M79", -1, -1],
		["Rnd_HE_M203", -1, -1],
		["Rnd_HE_GP25", -1, -1],
		["FlareWhite_GP25", -1, -1],
		["FlareGreen_GP25", -1, -1],
		["FlareRed_GP25", -1, -1],
		["FlareYellow_GP25", -1, -1],
		["Rnd_SMOKE_GP25", -1, -1],
		["Rnd_SmokeRed_GP25", -1, -1],
		["Rnd_SmokeGreen_GP25", -1, -1],
		["Rnd_SmokeYellow_GP25", -1, -1],
		["MineE", -1, -1],
		["GarbageIEDSmall_PMC", -1, -1],
		["GroundIEDSmall_PMC", -1, -1],
		["GarbageIEDLarge_PMC", -1, -1],
		["GroundIEDLarge_PMC", -1, -1],
		["TK_ALICE_Pack_EP1", -1, -1],
		["TK_Assault_Pack_EP1", -1, -1],
		["TK_RPG_Backpack_EP1", -1, -1],
		["Tripod_Bag", -1, -1],
		["DSHkM_Mini_TriPod_TK_GUE_Bag_EP1", -1, -1],
		["DSHKM_TK_GUE_Bag_EP1", -1, -1],
		//["2b14_82mm_TK_GUE_Bag_EP1", -1, -1],
		["Igla", -1, -1],
		["Igla_mag", -1, -1]
	];
	
	// Terrorist Weapons - FOB
_ifw =
	[	
		["handy", -1, -1],
		["lockpick", -1, -1],
		["medkit", -1, -1],
		["SmokeShellOrange", -1, -1],
		["repairkit", -1, -1],
		["kanister", -1, -1],
		["supgrade1", -1, -1],
		["supgrade2", -1, -1],
		["supgrade3", -1, -1],
		["supgrade4", -1, -1],
		["supgrade5", -1, -1],
		["nitro", -1, -1],
		["vclammo", -1, -1],
		["selbstmordbombe", -1, -1],
		["gasmask", -1, -1],
		["earplugs", -1, -1],
		["stun_light_ter", -1, -1],
		["GPS", -1, -1],
		["Binocular", -1, -1],
		["Binocular_Vector", -1, -1],
		["NVGoggles", -1, -1],
		["Colt1911", -1, -1],
		["Rnd_45ACP_1911", -1, -1],
		["revolver_EP1", -1, -1],
		["revolver_gold_EP1", -1, -1],
		["Rnd_45ACP", -1, -1],
		["Makarov", -1, -1],
		["MakarovSD", -1, -1],
		["Rnd_9x18_Makarov", -1, -1],
		["Rnd_9x18_MakarovSD", -1, -1],
		["UZI_EP1", -1, -1],
		["UZI_SD_EP1", -1, -1],
		["Rnd_9x19_UZI", -1, -1],
		["Rnd_9x19_UZI_SD", -1, -1],
		["Sa61_EP1", -1, -1],
		["Rnd10_765x17_Ball", -1, -1],
		["Rnd20_765x17_Ball", -1, -1],
		["Saiga12K", -1, -1],
		["Rnd_B_Saiga12_74Slug", -1, -1],
		["Rnd_B_Saiga12_Pellets", -1, -1],
		["LeeEnfield", -1, -1],
		["x_303", -1, -1],
		["FN_FAL", -1, -1],
		["Rnd_762x51_FNFAL", -1, -1],
		["AK_47_M", -1, -1],
		["AK_47_S", -1, -1],
		["Rnd_762x39_AK47", -1, -1],
		["AKS74U", -1, -1],
		["AKS_74_UN_kobra", -1, -1],
		["RPK_74",  -1, -1],
		["AK74", -1, -1],
		["AK74GL", -1, -1],
		["AKS_74", -1, -1],
		["AKS74kobra", -1, -1],
		["AKS74kobragl", -1, -1],
		["AKS74pso", -1, -1],
		["Rnd_545x39_AK", -1, -1],
		["Rnd_545x39_AKSD",	 -1, -1],
		["Rnd_545x39_RPK", -1, -1],
		["PK", -1, -1],
		["Rnd_762x54_PK", -1, -1],
		["CZ_550", -1, -1],
		["x_22_LR_17_HMR", -1, -1],
		["RPG18", -1, -1],
		["RPG18_mag", -1, -1],
		["HandGrenade_East", -1, -1],
		["MineE", -1, -1],
		["GarbageIEDSmall_PMC", -1, -1],
		["GroundIEDSmall_PMC", -1, -1],
		["GarbageIEDLarge_PMC", -1, -1],
		["GroundIEDLarge_PMC", -1, -1],
		["TK_ALICE_Pack_EP1", -1, -1],
		["TK_Assault_Pack_EP1", -1, -1],
		["TK_RPG_Backpack_EP1", -1, -1]
	];

// Terrorist Plane Shop
_iair =
	[
		["An2_TK_EP1", -1, -1]
	];
// Terrorist Heli Shop
_ihs =
	[
		["UH1H_TK_GUE_EP1", -1, -1],
		["Ka137_MG_PMC", -1, -1],
		["Mi17_Ins",-1 ,-1],
		["Ka137_PMC",-1,-1],
		["An2_TK_EP1", -1, -1]
	];
// Insurgent Equipment Shop
_isup =
	[
		["handy", -1, -1],
		["lockpick", -1, -1],
		["medkit", -1, -1],
		["SmokeShellOrange", -1, -1],
		["repairkit", -1, -1],
		["kanister", -1, -1],
		["supgrade1", -1, -1],
		["supgrade2", -1, -1],
		["supgrade3", -1, -1],
		["nitro", -1, -1],
		["vclammo", -1, -1],
		//["Mammo_HE", -1, -1],
		//["Mammo_WP", -1, -1],
		//["Mammo_IL", -1, -1],
		["dirty_bomb", -1, -1],
		["car_bomb", -1, -1],
		["suitcase_bomb", -1, -1],
		
		["selbstmordbombe", -1, -1],
		["gasmask", -1, -1],
		["earplugs", -1, -1],
		["stun_light_ter", -1, -1]
	];
// UNITED STATES SUPPLY SHOP
_ussup =
	[
		["handy", -1, -1],
		["lockpick", -1, -1],
		["medkit", -1, -1],
		["repairkit", -1, -1],
		["kanister", -1, -1],
		["supgrade1", -1, -1],
		["supgrade2", -1, -1],
		["supgrade3", -1, -1],
		["nitro", -1, -1],
		["vclammo", -1, -1],
		["gasmask", -1, -1],
		["earplugs", -1, -1]

	];

// US Light Vehicles
_uslv =
	[
		["HMMWV_DES_EP1",-1,-1],
		["HMMWV_Ambulance_DES_EP1",-1,-1],
		["HMMWV_M1035_DES_EP1",-1,-1],
		["HMMWV_Terminal_EP1",-1,-1],
		["HMMWV_MK19_DES_EP1",-1,-1],
		["HMMWV_M998_crows_M2_DES_EP1",-1,-1],
		["HMMWV_M998_crows_MK19_DES_EP1",-1,-1],
		["HMMWV_M998A2_SOV_DES_EP1",-1,-1],
		["HMMWV_TOW_DES_EP1",-1,-1],
		["HMMWV_Avenger_DES_EP1",-1,-1],
		["M1126_ICV_M2_EP1",-1,-1],
		["M1133_MEV_EP1",-1,-1]

	];
// Terrorist Heavy Vehicles
// Terrorist Light Vehicles
_bt =
	[
		["Lada2_TK_CIV_EP1_bomb",-1,-1],
		["Old_bike_TK_INS_EP1", -1, -1],
		["TT650_TK_EP1", -1, -1],
		["UAZ_INS", -1, -1],
		["BAF_Offroad_D", -1, -1],
		["UAZ_MG_INS",-1,-1],
		["UAZ_SPG9_INS",-1,-1],
		["Pickup_PK_TK_GUE_EP1", -1, -1],
		["Offroad_DSHKM_TK_GUE_EP1", -1, -1],
		["V3S_TK_GUE_EP1", -1, -1],
		["V3S_GUE", -1, -1],
		["LandRover_Special_CZ_EP1", -1, -1],
		["Offroad_SPG9_TK_GUE_EP1", -1, -1],
		["BTR40_MG_TK_GUE_EP1", -1, -1],
		["BTR40_TK_GUE_EP1", -1, -1],
		["V3S_Refuel_TK_GUE_EP1", -1, -1],
		["V3S_Repair_TK_GUE_EP1", -1, -1],
		["V3S_Reammo_TK_GUE_EP1", -1, -1],
		["BRDM2_HQ_Gue", -1, -1],
		["BTR90_HQ", -1, -1],
		["BMP2_HQ_TK_EP1",-1,-1],
		["Ural_ZU23_TK_GUE_EP1", -1, -1],
		["BRDM2_TK_GUE_EP1", -1, -1],
		["T34_Terrorist", -1, -1],
		["T55_TK_EP1_ter", -1, -1]
	];
	
// Terrorist Light Vehicles - FOB
_ifv =
	[
		["Lada2_TK_CIV_EP1_bomb",-1,-1],
		["Old_bike_TK_INS_EP1", -1, -1],
		["TT650_TK_EP1", -1, -1],
		["UAZ_Unarmed_TK_CIV_EP1", -1, -1],
		["BAF_Offroad_D", -1, -1],
		["Pickup_PK_TK_GUE_EP1", -1, -1],
		["Offroad_DSHKM_TK_GUE_EP1", -1, -1],
		["V3S_TK_GUE_EP1", -1, -1],
		["V3S_GUE", -1, -1],
		["LandRover_Special_CZ_EP1", -1, -1],
		["BTR40_TK_GUE_EP1", -1, -1],
		["V3S_Refuel_TK_GUE_EP1", -1, -1],
		["V3S_Repair_TK_GUE_EP1", -1, -1],
		["V3S_Reammo_TK_GUE_EP1", -1, -1],
		["BRDM2_HQ_Gue", -1, -1],
		["BTR90_HQ", -1, -1]
	];

_ihvy =
	[
		["LandRover_Special_CZ_EP1", -1, -1],
		["Offroad_SPG9_TK_GUE_EP1", -1, -1],
		["BTR40_MG_TK_GUE_EP1", -1, -1],
		["BTR40_TK_GUE_EP1", -1, -1],
		["V3S_Refuel_TK_GUE_EP1", -1, -1],
		["V3S_Repair_TK_GUE_EP1", -1, -1],
		["V3S_Reammo_TK_GUE_EP1", -1, -1],
		["BRDM2_HQ_Gue", -1, -1],
		["BTR90_HQ", -1, -1],
		["BMP2_HQ_TK_EP1",-1,-1],
		["Ural_ZU23_TK_GUE_EP1", -1, -1],
		["BRDM2_TK_GUE_EP1", -1, -1],
		["T34_Terrorist", -1, -1],
		["T55_TK_EP1_ter", -1, -1]
	];


// Opfor Weapons
_rgs =
	[
		["GPS", -1, -1],
		["Binocular", -1, -1],
		["Binocular_Vector", -1, -1],
		["NVGoggles", -1, -1],
		["SmokeShellOrange", -1, -1],
		["Colt1911", -1, -1],
		["Rnd_45ACP_1911", -1, -1],
		["revolver_EP1", -1, -1],
		["revolver_gold_EP1", -1, -1],
		["Rnd_45ACP", -1, -1],
		["M9",-1,-1],
		["Rnd_9x19_M9SD",-1,-1],	
		["MP5SD", -1, -1],
		["Rnd_9x19_MP5SD", -1, -1],
		["Makarov", -1, -1],
		["Rnd_9x18_Makarov", -1, -1],
		["UZI_EP1", -1, -1],
		["Rnd_9x19_UZI", -1, -1],
		["Sa61_EP1", -1, -1],
		["Rnd10_765x17_Ball", -1, -1],
		["Rnd20_765x17_Ball", -1, -1],
		["Bizon", -1, -1],
		["Rnd_9x19_Bizon", -1, -1],
		["Saiga12K", -1, -1],
		["Rnd_B_Saiga12_74Slug", -1, -1],
		["Rnd_B_Saiga12_Pellets", -1, -1],
		["LeeEnfield", -1, -1],
		["x_303", -1, -1],
		["FN_FAL", -1, -1],
		["Rnd_762x51_FNFAL", -1, -1],
		["AK_47_M", -1, -1],
		["AK_47_S", -1, -1],
		["Rnd_762x39_AK47", -1, -1],
		["Sa58P_EP1", -1, -1],
		["Sa58V_EP1", -1, -1],
		["Rnd_762x39_SA58", -1, -1],
		["AKS74U", -1, -1],
		["AKS_74_UN_kobra", -1, -1],
		["RPK_74",  -1, -1],
		["AK74", -1, -1],
		["AK74GL", -1, -1],
		["AKS_74", -1, -1],
		["AKS74kobra", -1, -1],
		["AKS74kobragl", -1, -1],
		["AKS74pso", -1, -1],
		["Rnd_545x39_AK", -1, -1],
		["Rnd_545x39_AKSD",	 -1, -1],
		["Rnd_545x39_RPK", -1, -1],
		["AK107pso", -1, -1],
		["AK107GLpso", -1, -1],
		["AK_107_kobra", -1, -1],
		["AK_107_GL_kobra", -1, -1],
		["Sa58V_CCO_EP1", -1, -1],
		["Sa58V_RCO_EP1", -1, -1],
		["Rnd_762x39_SA58", -1, -1],
		["PK", -1, -1],
		["Pecheneg", -1, -1],
		["Rnd_762x54_PK", -1, -1],
		["SVD", -1, -1],
		["SVD_CAMO", -1, -1],
		["DMR", -1, -1],
		["Rnd_762x51_DMR", -1, -1],
		["SVD_des_EP1", -1, -1],
		["Rnd_762x54_SVD", -1, -1],
		["M24_des_EP1", -1, -1],
		["Rnd_762x51_M24", -1, -1],
		["CZ_550", -1, -1],
		["x_22_LR_17_HMR", -1, -1],
		
		["Igla", -1, -1],
		["Igla_mag", -1, -1],
		
		["RPG7V", -1, -1],
		["PG7V",  -1, -1],
		["PG7VR", -1, -1],
		["PG7VL", -1, -1],
		["OG7", -1, -1],
		
		["MAAWS", -1, -1],
		["MAAWS_HEAT", -1, -1],
		["MAAWS_HEDP", -1, -1],
		
		["MetisLauncher", -1, -1],
		["AT13_mag", -1, -1],
		
		["RPG18", -1, -1],
		["RPG18_mag",  -1, -1],
		["M79", -1, -1],
		["Rnd_HE_M203", -1, -1],
		["Rnd_HE_GP25", -1, -1],
		["FlareWhite_GP25", -1, -1],
		["FlareGreen_GP25", -1, -1],
		["FlareRed_GP25", -1, -1],
		["FlareYellow_GP25", -1, -1],
		["Rnd_SMOKE_GP25", -1, -1],
		["Rnd_SmokeRed_GP25", -1, -1],
		["Rnd_SmokeGreen_GP25", -1, -1],
		["Rnd_SmokeYellow_GP25", -1, -1],
		["HandGrenade_East", -1, -1],
		["Stone", -1, -1],
		["SmokeShell", -1, -1],
		["MineE", -1, -1],
		["PipeBomb", -1, -1],
		["TK_ALICE_Pack_EP1", -1, -1],
		["TK_Assault_Pack_EP1", -1, -1],
		["TK_RPG_Backpack_EP1", -1, -1],
		["Tripod_Bag", -1, -1],
		["DSHkM_Mini_TriPod_TK_GUE_Bag_EP1", -1, -1],
		["DSHKM_TK_GUE_Bag_EP1", -1, -1],
		["KORD_high_TK_Bag_EP1", -1, -1],
		["KORD_TK_Bag_EP1", -1, -1]
		//["2b14_82mm_TK_Bag_EP1", -1, -1],

	];
	
// Opfor Equiptment - Fob
_rgs_fob =
	[
		["handy", -1, -1],
		["SmokeShellOrange", -1, -1],
		["lockpick", -1, -1],
		["medkit", -1, -1],
		["repairkit", -1, -1],
		["kanister", -1, -1],
		["supgrade1", -1, -1],
		["supgrade2", -1, -1],
		["bodyarmor_50", -1, -1],
		["bodyarmor_20", -1, -1],
		["stun_light", -1, -1],
		["stun_full", -1, -1],
		["gasmask", -1, -1],
		["earplugs", -1, -1],
		["tracker", 25, 25],
		["nitro", -1, -1],
		["vclammo", -1, -1],
		["ziptie", -1, -1],
		["GPS", -1, -1],
		["Binocular", -1, -1],
		["Binocular_Vector", -1, -1],
		["NVGoggles", -1, -1],
		["SmokeShellOrange", -1, -1],
		["Colt1911", -1, -1],
		["Rnd_45ACP_1911", -1, -1],
		["revolver_EP1", -1, -1],
		["revolver_gold_EP1", -1, -1],
		["Rnd_45ACP", -1, -1],
		["M9",-1,-1],
		["Rnd_9x19_M9SD",-1,-1],	
		["MP5SD", -1, -1],
		["Rnd_9x19_MP5SD", -1, -1],
		["Makarov", -1, -1],
		["Rnd_9x18_Makarov", -1, -1],
		["UZI_EP1", -1, -1],
		["Rnd_9x19_UZI", -1, -1],
		["Sa61_EP1", -1, -1],
		["Rnd10_765x17_Ball", -1, -1],
		["Rnd20_765x17_Ball", -1, -1],
		["Bizon", -1, -1],
		["Rnd_9x19_Bizon", -1, -1],
		["Saiga12K", -1, -1],
		["Rnd_B_Saiga12_74Slug", -1, -1],
		["Rnd_B_Saiga12_Pellets", -1, -1],
		["LeeEnfield", -1, -1],
		["x_303", -1, -1],
		["FN_FAL", -1, -1],
		["Rnd_762x51_FNFAL", -1, -1],
		["AK_47_M", -1, -1],
		["AK_47_S", -1, -1],
		["Rnd_762x39_AK47", -1, -1],
		["Sa58P_EP1", -1, -1],
		["Sa58V_EP1", -1, -1],
		["Rnd_762x39_SA58", -1, -1],
		["AKS74U", -1, -1],
		["AKS_74_UN_kobra", -1, -1],
		["RPK_74",  -1, -1],
		["AK74", -1, -1],
		["AK74GL", -1, -1],
		["AKS_74", -1, -1],
		["AKS74kobra", -1, -1],
		["AKS74kobragl", -1, -1],
		["AKS74pso", -1, -1],
		["Rnd_545x39_AK", -1, -1],
		["Rnd_545x39_AKSD",	 -1, -1],
		["Rnd_545x39_RPK", -1, -1],
		["CZ_550", -1, -1],
		["x_22_LR_17_HMR", -1, -1],
		
		["RPG7V", -1, -1],
		["PG7V",  -1, -1],
		["PG7VR", -1, -1],
		["PG7VL", -1, -1],
		["OG7", -1, -1],
		
		["RPG18", -1, -1],
		["RPG18_mag",  -1, -1],
		["M79", -1, -1],
		["Rnd_HE_M203", -1, -1],
		["Rnd_HE_GP25", -1, -1],
		["FlareWhite_GP25", -1, -1],
		["FlareGreen_GP25", -1, -1],
		["FlareRed_GP25", -1, -1],
		["FlareYellow_GP25", -1, -1],
		["Rnd_SMOKE_GP25", -1, -1],
		["Rnd_SmokeRed_GP25", -1, -1],
		["Rnd_SmokeGreen_GP25", -1, -1],
		["Rnd_SmokeYellow_GP25", -1, -1],
		["HandGrenade_East", -1, -1],
		["Stone", -1, -1],
		["SmokeShell", -1, -1],
		["TK_ALICE_Pack_EP1", -1, -1],
		["TK_Assault_Pack_EP1", -1, -1],
		["TK_RPG_Backpack_EP1", -1, -1],
		["Tripod_Bag", -1, -1],
		["DSHkM_Mini_TriPod_TK_GUE_Bag_EP1", -1, -1],
		["DSHKM_TK_GUE_Bag_EP1", -1, -1],
		["KORD_high_TK_Bag_EP1", -1, -1],
		["KORD_TK_Bag_EP1", -1, -1]
	];
// Opfor Supply
_rsup =
	[
		["handy", -1, -1],
		["SmokeShellOrange", -1, -1],
		["lockpick", -1, -1],
		["medkit", -1, -1],
		
		["repairkit", -1, -1],
		["kanister", -1, -1],
		["supgrade1", -1, -1],
		["supgrade2", -1, -1],
		["supgrade3", -1, -1],
		["supgrade4", -1, -1],
		["supgrade5", -1, -1],
		["bodyarmor_100", -1, -1],
		["bodyarmor_50", -1, -1],
		["bodyarmor_20", -1, -1],
		["stun_light", -1, -1],
		["stun_full", -1, -1],
		["gasmask", -1, -1],
		["earplugs", -1, -1],
		["tracker", 25, 25],
		["nitro", -1, -1],
		["vclammo", -1, -1],
		//["Mammo_HE", -1, -1],
		//["Mammo_WP", -1, -1],
		//["Mammo_IL", -1, -1],
		["ziptie", -1, -1]
	];
// Opfor Helicopters
_rhs =
	[
		["MH6J_EP1", -1, -1],
		["AH6X_EP1", -1, -1],
		["Mi17_medevac_RU", -1, -1],
		["Mi17_TK_EP1", -1, -1],
		["UH1H_TK_EP1", -1, -1],
		["Ka52Black", -1, -1],
		["Ka60_PMC_miniguns",-1,-1],
		["Mi24_D_TK_EP1", -1, -1],
		["Mi24_D", -1, -1],
		["Mi24_P", -1, -1],
		["Mi24_V", -1, -1]
	];
	
// Opfor Helicopters - FOB
_rhs_fob =
	[
		["MH6J_EP1", -1, -1],
		["AH6X_EP1", -1, -1],
		["Mi17_medevac_RU", -1, -1],
		["Mi17_TK_EP1", -1, -1],
		["UH1H_TK_EP1", -1, -1]
	];
// Opfor Light Transport
_rlt =
	[
		
		["Old_bike_TK_INS_EP1", -1, -1],
		["TT650_TK_EP1", -1, -1],
		["UAZ_Unarmed_TK_EP1", -1, -1],
		["BAF_Offroad_W", -1, -1],
		["UAZ_AGS30_TK_EP1", -1, -1],
		["UAZ_MG_TK_EP1", -1, -1],
		["Kamaz", -1, -1],
		["KamazOpen", -1, -1]
	];
	
// Opfor Light Transport - Fob
_rlt_fob =
	[
		
		["Old_bike_TK_INS_EP1", -1, -1],
		["TT650_TK_EP1", -1, -1],
		["UAZ_Unarmed_TK_EP1", -1, -1],
		["BAF_Offroad_W", -1, -1],
		["UAZ_AGS30_TK_EP1", -1, -1],
		["UAZ_MG_TK_EP1", -1, -1],
		["Kamaz", -1, -1],
		["KamazOpen", -1, -1]
	];
// Opfor Heavy Vehicles
_rhvy =
	[
		
		["UralReammo_TK_EP1", -1, -1],
		["UralRefuel_TK_EP1", -1, -1],
		["UralRepair_TK_EP1", -1, -1],
		["M113_TK_EP1", -1, -1],
		["M113Ambul_TK_EP1", -1, -1],
		["BTR40_MG_TK_INS_EP1", -1, -1],
		["BTR40_TK_INS_EP1", -1, -1],
		["GAZ_Vodnik", -1, -1],
		["GAZ_Vodnik_MedEvac", -1, -1],
		["LandRover_SPG9_TK_EP1", -1, -1],
		["BRDM2_TK_EP1", -1, -1],
		["BMP2_TK_EP1", -1, -1],
		["Ural_ZU23_TK_EP1", -1, -1],
		["GAZ_Vodnik_HMG", -1, -1],
		["BTR60_TK_EP1", -1, -1],
		["ZSU_TK_EP1", -1, -1],
		["T34_TK_EP1", -1, -1],
		["T55_TK_EP1", -1, -1],
		["BMP3", -1, -1],
		["T72_TK_EP1", -1, -1],
		["T90", -1, -1]

	];
// Opfor Jets
_rair =
	[
		["An2_TK_EP1", -1, -1],
		["C130J_US_EP1_op4", -1, -1],
		["MQ9PredatorB_unarmed", -1, -1],
		["L39_TK_EP1", -1, -1],
		["Su25_TK_EP1", -1, -1],
		["Su34", -1, -1]

	];

_carparts =
	[
		["medkit", -1, -1],
		["kanister",  -1, -1],
		["repairkit",  -1, -1],
		["nitro",  -1, -1],
		["supgrade1",  -1, -1],
		["supgrade2",  -1, -1],
		["supgrade3",  -1, -1],
		["supgrade4",  -1, -1],
		["supgrade5", -1, -1]
	];

_as_2 =
	[
		["Offroad_DSHKM_Gue", 5, 5],
		["Pickup_PK_GUE", 5, 5],
		["GAZ_Vodnik", 5, 5],
		["An2_TK_EP1", 5, 5],
		["UH1H_TK_EP1", 5, 5]
	];

// Cop Fortifications
_fs1 =
	[
		["SearchLight_UN", -1, -1],
		["Wire", -1, -1],
		["Hedgehog", -1, -1],
		["BagFenceC", -1, -1],
		["BagFenceE", -1, -1],
		["BagFenceL", -1, -1],
		["BagFenceR", -1, -1],
		["BagFenceS", -1, -1],
		["NBagFenceC", -1, -1],
		["NBagFenceL", -1, -1],
		["NBagFenceR", -1, -1],
		["HBarrC", -1, -1],
		["BunkerS", -1, -1],
		["ZavoraAnim", -1, -1],
		["roadcone", -1, -1],
		["Land_coneLight", -1, -1],
		["Land_arrows_yellow_L", -1, -1],
		["Land_arrows_yellow_R", -1, -1],
		["Land_arrows_desk_R", -1, -1],
		["Land_arrows_desk_L", -1, -1],
		["Land_CncBlock_Stripes", -1, -1],
		["RoadBarrier_light", -1, -1],
		["RoadBarrier_long", -1, -1],
		["Sign_Danger", -1, -1],
		["Land_RedWhiteBarrier", -1, -1],
		["RoadBarrier_long", -1, -1],
		["RoadBarrier_light", -1, -1],
		["Land_vez", -1, -1],
		["Land_Misc_deerstand", -1, -1],
		["MASH_EP1", -1, -1],
		["Land_fortified_nest_big", -1, -1],
		["Hedgehog", -1, -1],
		["Fort_RazorWire", -1, -1],
		["Land_Shed_wooden", -1, -1],
		["Land_fortified_nest_big_EP1", -1, -1],
		["Land_Fort_Watchtower_EP1", -1, -1],
		["Land_Fire_barrel_burning", -1, -1],
		["Sign_Checkpoint_US_EP1", -1, -1]
	];

// PMC
_fs2 =
	[
		["SearchLight_US", -1, -1],
		["Wire", -1, -1],
		["Hedgehog", -1, -1],
		["BagFenceC", -1, -1],
		["BagFenceE", -1, -1],
		["BagFenceL", -1, -1],
		["BagFenceR", -1, -1],
		["BagFenceS", -1, -1],
		["NBagFenceC", -1, -1],
		["NBagFenceL", -1, -1],
		["NBagFenceR", -1, -1],
		["BunkerS", -1, -1],
		["ZavoraAnim", -1, -1],
		["roadcone", -1, -1],
		["Land_CncBlock_Stripes", -1, -1],
		["RoadBarrier_light", -1, -1],
		["Sign_Danger", -1, -1],
		["Sign_Checkpoint_US_EP1", -1, -1],
		["Land_Campfire_burning",-1,-1],
		["Land_RedWhiteBarrier", -1, -1],
		["RoadBarrier_long", -1, -1],
		["RoadBarrier_light", -1, -1],
		["Concrete_wall_EP1", -1, -1],
		["H_barrier",-1,-1]
	];

// Factory shop
_fs3 =
	[
		["GuerillaCacheBox_EP1", -1, -1],
		["Fort_Crate_wood", -1, -1],
		["BagFenceC", -1, -1],
		["BagFenceE", -1, -1],
		["BagFenceL", -1, -1],
		["BagFenceR", -1, -1],
		["BagFenceS", -1, -1],
		["NBagFenceC", -1, -1],
		["NBagFenceL", -1, -1],
		["NBagFenceR", -1, -1],
		["ZavoraAnim", -1, -1],
		["Land_CncBlock_Stripes", -1, -1],
		["Sign_Danger", -1, -1]
	];

// Terror
_fs4 =
	[
		["Wire", -1, -1],
		["Hedgehog", -1, -1],
		["Fort_Crate_wood", -1, -1],
		["BagFenceC", -1, -1],
		["BagFenceE", -1, -1],
		["BagFenceL", -1, -1],
		["BagFenceR", -1, -1],
		["BagFenceS", -1, -1],
		["NBagFenceC", -1, -1],
		["NBagFenceL", -1, -1],
		["NBagFenceR", -1, -1],
		["BunkerS", -1, -1],
		["ZavoraAnim", -1, -1],
		["Land_CncBlock_Stripes", -1, -1],
		["RoadBarrier_light", -1, -1],
		["Sign_Danger", -1, -1],
		["Land_RedWhiteBarrier", -1, -1],
		["RoadBarrier_long", -1, -1],
		["RoadBarrier_light", -1, -1],
		["Fort_Barricade_EP1", -1, -1],
		["Fort_Barricade", -1, -1]
	];

// Opfor Fortifications
_fs5 =
	[
		["SearchLight_UN", -1, -1],
		["GuerillaCacheBox_EP1", -1, -1],
		["Wire", -1, -1],
		["Hedgehog", -1, -1],
		["BagFenceC", -1, -1],
		["BagFenceE", -1, -1],
		["BagFenceL", -1, -1],
		["BagFenceR", -1, -1],
		["BagFenceS", -1, -1],
		["NBagFenceC", -1, -1],
		["NBagFenceL", -1, -1],
		["NBagFenceR", -1, -1],
		["HBarrC", -1, -1],
		["BunkerS", -1, -1],
		["ZavoraAnim", -1, -1],
		["roadcone", -1, -1],
		["Land_coneLight", -1, -1],
		["Land_CncBlock_Stripes", -1, -1],
		["RoadBarrier_light", -1, -1],
		["RoadBarrier_long", -1, -1],
		["Sign_Danger", -1, -1],
		["Sign_Checkpoint_TK_EP1", -1, -1],
		["SearchLight_US_EP1", -1, -1],
		["roadblock", -1, -1],
		["bargate", -1, -1],
		["BigbagfenceCorner", -1, -1],
		["bigbagfence", -1, -1],
		["bigbagfenceRound", -1, -1],
		["bunkersmall", -1, -1],
		["danger", -1, -1],
		["roadcone", -1, -1],
		["barrack", -1, -1],
		["Sign_Checkpoint_US_EP1", -1, -1],
		["Land_ladderEP1", -1, -1],
		["Land_ladder_half_EP1", -1, -1],
		["Land_RedWhiteBarrier", -1, -1],
		["RoadBarrier_long", -1, -1],
		["RoadBarrier_light", -1, -1],
		["Land_Campfire_burning", -1, -1],
		["Concrete_wall_EP1", -1, -1],
		["H_barrier",-1,-1]
	];

// UNs Fortifications
_fs6 =
	[
		["GuerillaCacheBox_EP1", -1, -1],
		["Wire", -1, -1],
		["Hedgehog", -1, -1],
		["Fort_Crate_wood", -1, -1],
		["BagFenceC", -1, -1],
		["BagFenceE", -1, -1],
		["BagFenceL", -1, -1],
		["BagFenceR", -1, -1],
		["BagFenceS", -1, -1],
		["NBagFenceC", -1, -1],
		["NBagFenceL", -1, -1],
		["NBagFenceR", -1, -1],
		["HBarrC", -1, -1],
		["BunkerS", -1, -1],
		["ZavoraAnim", -1, -1],
		["roadcone", -1, -1],
		["Land_CncBlock_Stripes", -1, -1],
		["RoadBarrier_light", -1, -1],
		["Sign_Danger", -1, -1],
		["Land_RedWhiteBarrier", -1, -1],
		["RoadBarrier_long", -1, -1],
		["RoadBarrier_light", -1, -1],
		["Fort_Barricade_EP1", -1, -1],
		["Fort_Barricade", -1, -1]
	];

	// VIP FORT SHOP
_fsvip =
	[
		["GuerillaCacheBox_EP1_vip", -1, -1]

	];

//Hospital
_hp =
	[
		["S1203_ambulance_EP1", -1, -1],
		["HMMWV_Ambulance_CZ_DES_EP1", -1, -1]
	];

_bank = [
		["bank_insurance", -1, -1]
	];
	
//CIVILIAN Donator Vehicle Shop
_cdvs =
	[
		
		["SUV_TK_EP1_don", -1, -1],
		["SUV_UN_EP1_retex_don", -1, -1],
		["Ural_TK_CIV_EP1_don", -1, -1],
		["UralReammo_TK_EP1_don", -1, -1],
		["UralRefuel_TK_EP1_don", -1, -1],
		["UralRepair_TK_EP1_don", -1, -1],
		//["MAZ_543_SCUD_TK_EP1_don", -1, -1],
		["MTVR_DES_EP1_don", -1, -1],
		["LandRover_CZ_EP1_don", -1, -1],
		["hilux1_civil_1_open_don", -1, -1],
		["hilux1_civil_1_open_camo_don", -1, -1]
		//["Pickup_PK_TK_GUE_EP1_don", -1, -1]
		//["UAZ_AGS30_INS_don", -1, -1],
		//["UAZ_MG_INS_don", -1, -1]
	];

//CIVILIAN Donator Weapons Shop
_cdws =
	[
		["GPS_don", -1, -1],
		["NVGoggles_don", -1, -1],
		["shape_charge", -1, -1],	
		["Binocular_don", -1, -1],
		["nitro_don", -1 ,-1],
		["supgrade1_don", -1, -1],
		["supgrade2_don", -1, -1],
		["supgrade3_don", -1, -1],
		["supgrade4_don", -1, -1],
		["supgrade5_don", -1, -1],
		["defuser_don", -1 ,-1],
		["lockpick_don", -1 ,-1],
		["medkit_don", -1 ,-1],
		["kanister_don", -1 , -1],
		["ziptie_don", -1, -1],
		["repairkit_don",-1 , -1],
		["UZI_SD_EP1_don",-1,-1],
		["Rnd_9x19_UZI_SD_don",-1,-1],
	//	["M9SD_don",-1,-1],
	//	["Rnd_9x19_M9SD_don",-1,-1],
		["Colt1911_don",-1,-1],
		["Rnd_45ACP_1911_don",-1,-1],
		["Makarov", -1, -1],
		["Rnd_9x18_Makarov", -1, -1],
		["glock17_don",-1,-1],
		["Rnd_9x19_glock17_don",-1,-1],
		["Sa58V_CCO_EP1_don", -1, -1],
		["Sa58V_RCO_EP1_don", -1, -1],
		["Sa58P_EP1_don", -1, -1],
		["Sa58V_EP1_don", -1, -1],
		["Rnd_762x39_SA58", -1, -1],
		["FN_FAL_don",-1,-1],
		["Rnd_762x51_FNFAL",-1,-1],
		["m8_compact_pmc_don",-1 , -1],
		["m8_carbine_don",-1 , -1],
		["m8_holo_sd_don",-1 , -1],
		["Rnd_556x45_G36_don",-1 , -1],
		["Rnd_556x45_G36SD_don",-1 , -1],
		["M16A2_don", -1, -1],
		["M4A1_don", -1, -1],
		["M4A1_Aim_don", -1, -1],
		["M4A1_AIM_SD_camo_don", -1, -1],
		["Rnd_556x45_Stanag_don", -1, -1],
		["Rnd_556x45_StanagSD_don", -1, -1],
		["MP5A5_don", -1, -1],
		["MP5SD_don", -1, -1],
		["Rnd_9x19_MP5", -1, -1],
		["Rnd_9x19_MP5SD", -1, -1],
		["revolver_gold_EP1_don", -1, -1],
		["Rnd_45ACP_don", -1, -1],
		["MakarovSD_don", -1, -1],
		["Rnd_9x18_MakarovSD_don", -1, -1],
		["CZ_550_don", -1, -1],
		["x_22_LR_17_HMR_don", -1, -1],
		["AKS_GOLD_don", -1, -1],
		["AK_47_M_don", -1, -1],
		["AK_47_S_don", -1, -1],
		["Rnd_762x39_AK47", -1, -1],
		["SmokeShellYellow", -1, -1],
		["SmokeShellPurple", -1, -1],
		["SmokeShellBlue", -1, -1]
		//["PipeBomb_don", -1, -1]


	];

//CIVILIAN Donator Air Shop
_cdas =
	[
		//["AH6J_EP1_m134_don", -1, -1],
		["Mi17_Civilian_don", -1, -1],
		["MV22_don", -1, -1],
		["BAF_Merlin_HC3_don", -1 ,-1],
		["MH6J_EP1_don",-1,-1]
	];
//BLUFOR Donator Air Shop
_cpdas =
	[
		["AH6J_EP1_don_cop", -1, -1],
		["AW159_Lynx_BAF_don", -1, -1],
		["UH1Y_don", -1, -1],
		["BAF_Merlin_HC3_don", -1 ,-1]
	];
	
//BLUFOR Donator Vehicle Shop
_cpdvs =
	[
		
		["LAV25_HQ_don", -1, -1],
		["BAF_FV510_D_don", -1, -1],
		["LAV25_don", -1, -1],
		["AAV_don", -1, -1],
		["BMP2_UN_EP1_don", -1, -1],
		["M1133_MEV_EP1_don", -1, -1],
		["M1135_ATGMV_EP1_don", -1, -1],
		["M1128_MGS_EP1_don", -1, -1],
		["M1A2_US_TUSK_MG_EP1_don", -1, -1],
		["BAF_Offroad_W_don", -1, -1],
		["HMMWV_Avenger_DES_EP1_don", -1, -1],
		["HMMWV_TOW_DES_EP1_don", -1, -1],
		["HMMWV_M998A2_SOV_DES_EP1_don", -1, -1],
		["HMMWV_M1151_M2_CZ_DES_EP1_don", -1, -1],
		["HMMWV_M998_crows_M2_DES_EP1_don", -1, -1],
		
		["SUV_TK_EP1_don", -1, -1],
		["HMMWV_DES_EP1_don",-1,-1],
		["Ural_TK_CIV_EP1_don", -1, -1],
		["MtvrReammo_DES_EP1_don", -1, -1],
		["MtvrRefuel_DES_EP1_don", -1, -1],
		["MtvrRepair_DES_EP1_don", -1, -1],
		["MTVR_DES_EP1_don", -1, -1],
		["SUV_UN_EP1_retex_don", -1, -1],
		["LandRover_CZ_EP1_don", -1, -1],
		["hilux1_civil_1_open_don", -1, -1],
		["hilux1_civil_1_open_camo_don", -1, -1]
	];

//BLUFOR Donator Weapons Shop
blufor_donator_weapon_shop =
	[
		["GPS_don", -1, -1],
		["NVGoggles_don", -1, -1],
		["Binocular_don", -1, -1],
		["nitro_don", -1 ,-1],
		["supgrade1_don", -1, -1],
		["supgrade2_don", -1, -1],
		["supgrade3_don", -1, -1],
		["supgrade4_don", -1, -1],
		["supgrade5_don", -1, -1],
		["defuser_don", -1 ,-1],
		["lockpick_don", -1 ,-1],
		["medkit_don", -1 ,-1],
		["kanister_don", -1 , -1],
		["ziptie_don", -1, -1],
		["repairkit_don",-1 , -1],
		["UZI_SD_EP1_don",-1,-1],
		["Rnd_9x19_UZI_SD_don",-1,-1],
		["M9SD_don",-1,-1],
		["Rnd_9x19_M9SD_don",-1,-1],
		["Colt1911_don",-1,-1],
		["Rnd_45ACP_1911_don",-1,-1],
		["glock17_don",-1,-1],
		["Rnd_9x19_glock17_don",-1,-1],
		["Stinger_don", -1, -1],
		["Stinger_mag_don", -1, -1],
		["M47Launcher_EP1_don", -1, -1],
		["Dragon_mag_don", -1, -1],
		["Javelin_don", -1, -1],
		["Javelin_mag", -1, -1],
		["M4A1_HWS_GL_SD_Camo_don", -1, -1],
		["M4A1_AIM_SD_camo_don", -1, -1],
		["Rnd_556x45_StanagSD_don", -1, -1],
		["AA12_PMC_don", -1, -1],
		["Rnd_B_AA12_HE_don", -1, -1],
		["Rnd_B_AA12_74Slug_don", -1, -1],
		["Rnd_B_AA12_Pellets_don", -1, -1],
		["SCAR_H_LNG_Sniper_SD_don", -1, -1],
		["Rnd_762x51_SB_SCAR_don", -1, -1],
		["m8_sharpshooter_don", -1, -1],
		["m8_SAW_don", -1, -1],
		["m8_compact_pmc_don",-1 , -1],
		["m8_carbine_don",-1 , -1],
		["m8_holo_sd_don",-1 , -1],
		["Rnd_556x45_G36_don",-1 , -1],
		["Rnd_556x45_G36SD_don",-1 , -1],
		["Rnd_556x45_BetaCMag_don", -1, -1],
		["Rnd_556x45_G36_don", -1, -1],
		["M24_don", -1, -1],
		["M24_des_EP1_don", -1, -1],
		["Rnd_556x45_Stanag_don", -1, -1],
		["rnd_762x51_B_SCAR_don", -1, -1],
		["Rnd_762x51_DMR_don", -1, -1],
		["Rnd_762x51_M24_don", -1, -1],
		["Rnd_HE_M203", -1, -1],
		["Rnd_Smoke_M203", -1, -1],
		["Rnd_SmokeRed_M203", -1, -1],
		["Rnd_SmokeGreen_M203", -1, -1],
		["Rnd_SmokeYellow_M203", -1, -1],
		["FlareWhite_M203", -1, -1],
		["SmokeShellYellow", -1, -1],
		["SmokeShellPurple", -1, -1],
		["SmokeShellBlue", -1, -1],
		["PipeBomb_don", -1, -1]
	];
//Insurgent Donator Vehicle Shop
_insvs =
	[
		["T34_don",-1,-1],
		["T55_TK_EP1_ter_don",-1,-1],
		["GAZ_Vodnik_HMG_don",-1,-1],
		["Offroad_DSHKM_INS_don",-1,-1],
		["KamazOpen_IglaTruck",-1,-1]
	];

//Insurgent Donator Weapons Shop
_insws =
	[
		["GPS_don", -1, -1],
		["NVGoggles_don", -1, -1],
		["Binocular_don", -1, -1],
		["nitro_don", -1 ,-1],
		["supgrade1_don", -1, -1],
		["supgrade2_don", -1, -1],
		["supgrade3_don", -1, -1],
		["supgrade4_don", -1, -1],
		["supgrade5_don", -1, -1],
		["defuser_don", -1 ,-1],
		["lockpick_don", -1 ,-1],
		["medkit_don", -1 ,-1],
		["kanister_don", -1 , -1],
		["ziptie_don", -1, -1],
		["repairkit_don",-1 , -1],
		["Garbage IED Small_don",-1 , -1],
		["Garbage IED Large_don",-1 , -1],
		["Ground IED Small_don",-1 , -1],
		["Ground IED Large_don",-1 , -1],
		["GarbageIEDSmall_PMC_don",-1 , -1],
		["GarbageIEDLarge_PMC_don",-1 , -1],
		["GroundIEDSmall_PMC_don",-1 , -1],
		["GroundIEDLarge_PMC_don",-1 , -1],
		["UZI_SD_EP1_don",-1,-1],
		["Rnd_9x19_UZI_SD_don",-1,-1],
		["M9SD_don",-1,-1],
		["Rnd_9x19_M9SD_don",-1,-1],
		["Colt1911_don",-1,-1],
		["Rnd_45ACP_1911_don",-1,-1],
		["glock17_don",-1,-1],
		["Rnd_9x19_glock17_don",-1,-1],
		["SVD_NSPU_EP1_don", -1, -1],
		["SVD_des_EP1_don", -1, -1],
		["SVD_CAMO_don", -1, -1],
		["SVD_don", -1, -1],
		["M40A3_don", -1, -1],
		["Rnd_762x51_M24", -1, -1],		
		["DMR_don", -1, -1],
		["Rnd_762x51_DMR", -1, -1],
		["Rnd_762x54_SVD", -1, -1],
		["AKS_74_NSPU_don", -1, -1],
		["Sa58V_CCO_EP1_don", -1, -1],
		["Sa58V_RCO_EP1_don", -1, -1],
		["Sa58P_EP1_don", -1, -1],
		["Sa58V_EP1_don", -1, -1],
		["Rnd_762x39_SA58", -1, -1],
		["VSS_Vintorez_don", -1, -1],
		["Rnd_9x39_10_VSS", -1, -1],
		["Rnd_9x39_20_VSS", -1, -1],
		["revolver_gold_EP1_don", -1, -1],
		["Rnd_45ACP_don", -1, -1],
		["MakarovSD_don", -1, -1],
		["Rnd_9x18_MakarovSD_don", -1, -1],
		["AK107pso_don", -1, -1],
		["AK_107_kobra_don", -1, -1],
		["AKS74U_don", -1, -1],
		["Rnd_545x39_AK", -1, -1],
		["bizon_silenced_don", -1, -1],
		["Rnd_9x19_SD_Bizon", -1, -1],
		["Pecheneg_don", -1, -1],
		["Rnd_762x54_PK", -1, -1],
		["RPK_74_don", -1, -1],
		["Rnd_545x39_RPK", -1, -1],
		["RPG7V_don", -1, -1],
		["PG7V_don", -1, -1],
		["PG7VR_don", -1, -1],
		["PG7VR_don", -1, -1],
		["OG7_don", -1, -1],
		["Igla", -1, -1],
		["Igla_mag", -1, -1],
		["Stinger_don", -1, -1],
		["Stinger_mag_don", -1, -1],
		["SmokeShellYellow", -1, -1],
		["SmokeShellPurple", -1, -1],
		["SmokeShellBlue", -1, -1],
		["PipeBomb_don", -1, -1]
	];

//Insurgent Donator Air Shop
_insas =
	[
	];

//OPFOR Donator Vehicle Shop
_odvs =
	[
		["SUV_TK_EP1_don", -1, -1],
		["BAF_Offroad_W_don", -1, -1],
		["UAZ_MG_TK_EP1_don", -1, -1],
		["UAZ_AGS30_TK_EP1_don", -1, -1],
		["Ural_TK_CIV_EP1_don", -1, -1],
		["UralReammo_TK_EP1_don", -1, -1],
		["UralRefuel_TK_EP1_don", -1, -1],
		["UralRepair_TK_EP1_don", -1, -1],
		["GAZ_Vodnik_HMG_don", -1, -1],
		["MTVR_DES_EP1_don", -1, -1],
		["hilux1_civil_1_open_don", -1, -1],
		["BTR90_don", -1, -1],
		["BMP2_TK_EP1_don", -1, -1],
		["2S6M_Tunguska_don", -1, -1],
		["hilux1_civil_1_open_camo_don", -1, -1]
	];

//OPFOR Donator Weapons Shop
_odws =
	[
		["GPS_don", -1, -1],
		["NVGoggles_don", -1, -1],
		["Binocular_don", -1, -1],
		["nitro_don", -1 ,-1],
		["supgrade1_don", -1, -1],
		["supgrade2_don", -1, -1],
		["supgrade3_don", -1, -1],
		["supgrade4_don", -1, -1],
		["supgrade5_don", -1, -1],
		["defuser_don", -1 ,-1],
		["lockpick_don", -1 ,-1],
		["medkit_don", -1 ,-1],
		["kanister_don", -1 , -1],
		["ziptie_don", -1, -1],
		["repairkit_don",-1 , -1],
		["UZI_SD_EP1_don",-1,-1],
		["Rnd_9x19_UZI_SD_don",-1,-1],
		["M9SD_don",-1,-1],
		["Rnd_9x19_M9SD_don",-1,-1],
		["Colt1911_don",-1,-1],
		["Rnd_45ACP_1911_don",-1,-1],
		["glock17_don",-1,-1],
		["Rnd_9x19_glock17_don",-1,-1],
		["SVD_NSPU_EP1_don", -1, -1],
		["SVD_des_EP1_don", -1, -1],
		["SVD_CAMO_don", -1, -1],
		["SVD_don", -1, -1],
		["Rnd_762x54_SVD", -1, -1],
		["BAF_LRR_scoped_w_don", -1, -1],
		["BAF_LRR_scoped_don", -1, -1],
		["Rnd_86x70_L115A1_don", -1, -1],
		["AKS_74_NSPU_don", -1, -1],
		["Sa58V_CCO_EP1_don", -1, -1],
		["Sa58V_RCO_EP1_don", -1, -1],
		["Sa58P_EP1_don", -1, -1],
		["Sa58V_EP1_don", -1, -1],
		["Rnd_762x39_SA58", -1, -1],
		["VSS_Vintorez_don", -1, -1],
		["Rnd_9x39_10_VSS", -1, -1],
		["Rnd_9x39_20_VSS", -1, -1],
		["revolver_gold_EP1_don", -1, -1],
		["Rnd_45ACP_don", -1, -1],
		["MakarovSD_don", -1, -1],
		["Rnd_9x18_MakarovSD_don", -1, -1],
		["AK107pso_don", -1, -1],
		["AK_107_kobra_don", -1, -1],
		["AKS74U_don", -1, -1],
		["Rnd_545x39_AK", -1, -1],
		["bizon_silenced_don", -1, -1],
		["Rnd_9x19_SD_Bizon", -1, -1],
		["Pecheneg_don", -1, -1],
		["Rnd_762x54_PK", -1, -1],
		["RPK_74_don", -1, -1],
		["Rnd_545x39_RPK", -1, -1],
		["Igla", -1, -1],
		["Igla_mag", -1, -1],
		["Stinger_don", -1, -1],
		["Stinger_mag_don", -1, -1],
		["M47Launcher_EP1_don", -1, -1],
		["Dragon_mag_don", -1, -1],
		["Javelin_don", -1, -1],
		["Javelin_mag", -1, -1],
		["MAAWS_don", -1, -1],
		["MAAWS_HEAT", -1, -1],
		["MAAWS_HEDP", -1, -1],
		["SmokeShellYellow", -1, -1],
		["SmokeShellPurple", -1, -1],
		["SmokeShellBlue", -1, -1],
		["PipeBomb_don", -1, -1]
	];

//OPFOR Donator Air Shop
_odas =
	[
		["Mi17_TK_EP1_don", -1, -1],
		["Ka52Black_don", -1, -1],
		["Ka60_PMC_don", -1, -1]
		//["Su25_Ins_don",-1,-1],
	];

vip_donor_weapon_shop =
[
	["GPS_vip", -1, -1],
	["NVGoggles_vip", -1, -1],
	["shape_charge", -1, -1],	
	["Binocular_vip", -1, -1],
	["Laserdesignator_vip", -1, -1],
	["Laserbatteries", -1, -1],
	["Binocular_Vector_vip", -1, -1],
	["lockpick_vip", -1, -1],
	["medkit_vip", -1, -1],
	["repairkit_vip", -1, -1],
	["kanister_vip", -1, -1],
	["ziptie_don", -1, -1],
	["nitro_vip", -1, -1],
	["supgrade1_vip", -1, -1],
	["supgrade2_vip", -1, -1],
	["supgrade3_vip", -1, -1],
	["supgrade4_vip", -1, -1],
	["supgrade5_vip", -1, -1],
	["supgrade6_vip", -1, -1],
	["UZI_SD_EP1_vip",-1,-1],
	["Rnd_9x19_UZI_SD_vip",-1,-1],
	["M9SD_vip",-1,-1],
	["Rnd_9x19_M9SD_vip",-1,-1],
	["Colt1911_vip",-1,-1],
	["Rnd_45ACP_1911_vip",-1,-1],
	["glock17_vip",-1,-1],
	["LeeEnfield_VIP", -1, -1],
	["UZI_EP1_VIP", -1, -1],
	["Rnd_9x19_UZI_VIP", -1, -1],
	["x_303_VIP", -1, -1],
	["Rnd_9x19_glock17_vip",-1,-1],
	["revolver_gold_EP1_vip", -1, -1],
	["Rnd_9x18_Makarov_VIP", -1, -1],
	["Rnd_45ACP_vip", -1, -1],
	["Makarov_VIP", -1, -1],
	["MakarovSD_vip", -1, -1],
	["Rnd_9x18_Makarov_VIP", -1, -1],
	
	["AK_107_kobra_vip", -1, -1],
	["Rnd_545x39_AK", -1, -1],
	["Bizon_vip", -1, -1],
	["Rnd_9x19_Bizon_vip", -1, -1],
	["Rnd_9x18_MakarovSD_vip", -1, -1],
	["RPK_74_vip",-1,-1],
	["Rnd_545x39_RPK",-1,-1],
	["FN_FAL_vip",-1,-1],
	["Rnd_762x51_FNFAL",-1,-1],
	["BAF_AS50_scoped_vip", -1, -1],
	["5Rnd_127x99_as50_vip", -1, -1],
	["M107_vip", -1 ,-1],
	["10Rnd_127x99_m107_vip",-1,-1],
	["KSVK_vip",-1,-1],
	["5Rnd_127x108_KSVK_vip",-1,-1],
	["BAF_L85A2_RIS_CWS_vip",-1 ,-1],
	["BAF_L86A2_ACOG_vip",-1,-1],
	["BAF_L85A2_RIS_Holo_vip",-1,-1],
	["Rnd_556x45_Stanag_vip",-1 ,-1],
	["AKS74GOSHAWK_vip",-1,-1],
	["Rnd_545x39_AK_vip",-1,-1],
	["AK74_VIP", -1, -1],
	["AA12_PMC_vip", -1, -1],
	["Rnd_B_AA12_74Slug", -1, -1],
	["Rnd_B_AA12_Pellets", -1, -1],
	["Rnd_B_AA12_HE_vip", -1, -1],
	["DMR_vip", -1, -1],
	["M14_EP1_vip",-1,-1],
	["Rnd_762x51_DMR_vip", -1, -1],
	["M110_NVG_EP1_vip", -1, -1],
	["SCAR_H_LNG_Sniper_SD_vip",-1,-1],
	["Rnd_762x51_SB_SCAR_don",-1,-1],
	["rnd_762x51_B_SCAR_vip", -1, -1],
	["M4A1_HWS_GL_SD_Camo_vip", -1, -1],
	["M4A1_AIM_SD_camo_vip", -1, -1],
	["SCAR_L_CQC_CCO_SD_vip", -1, -1],
	["SCAR_L_STD_EGLM_RCO_vip", -1, -1],
	["Rnd_556x45_StanagSD_vip", -1, -1],
	["M40A3_vip",-1,-1],
	["Rnd_762x51_M24_vip", -1, -1],
	["Rnd_HE_M203_vip", -1, -1]
];

_vipcarshop =
[
		["BAF_Merlin_HC3_vip", -1 ,-1],
		["SUV_TK_EP1_vip", -1, -1],
		["Ural_TK_CIV_EP1_vip", -1, -1],
		["UralRefuel_TK_EP1_vip", -1, -1],
		["MTVR_DES_EP1_vip", -1, -1],
		["hilux1_civil_1_open_vip", -1, -1],
		["AH6X_EP1_vip", -1, -1],
		["HMMWV_M1035_DES_EP1_vip", -1, -1],
		["hilux1_civil_1_open_camo_don", -1, -1]
];

_newsstationcar =
[
		["SUV_TK_EP1_news", -1, -1]
];

_newsstationair =
[
		["MH6J_EP1_news", -1, -1]

];
_pharm =
[
		["Legal_Steroids", -1, -1],
		["Illegal_Steroids", -1, -1],
		["red_phosphorus", -1, -1],
		["iodine", -1, -1],
		["ammonia_hydroxide", -1, -1],
		["hydriotic_acid", -1, -1],
		["mixer", -1, -1],
		["cleaning", -1, -1]

];
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

INV_LicenseShops_Object = 0;
INV_LicenseShops_List = 1;

_uniLicenses = [
	"car",
	"truck",
	"air",
	"engineer"
];

_pmcLicenses = [
	"pmc_license_journeyman",
	"pmc_license_air",
	"pmc_license_defense",
	"highcaliberrifle",
	"automatic",
	"riflelicense",
	"pistollicense",
	"engineer"

];

_gunLicenses = [
	"highcaliberrifle",
	"automatic",
	"riflelicense",
	"pistollicense"
];

_unLicenses = [
	"bomb",
	"special_operations",
	"un_vehicle",
	"un_explosives",
	"engineer"
];
_weaponLicenses = [
	"highcaliberrifle",
	"automatic",
	"riflelicense",
	"pistollicense",
	"engineer"

];
_opforLicenses = [
	"bomb",
	"soviet_vehicles",
	"soviet_air_veh",
	"engineer"


];
_mineLicenses = [
	"mine_license"
];
_copLicenses = [
	"air_support_training",
	"sobr_training",
	"response_training",
	"patrol_training",
	"probator"

];
_passPorts = [
	"passport_civilian",
	"car",
	"truck",
	"air",
	"engineer"

];
_newsLicenses = [
	"newslicense"
];
_ga1 = [
	"lsd ga1",
	"cocaine ga1"
];
_ga2 = [
	"lsd ga2",
	"heroin ga2"
];
_ga3 = [
	"marijuana ga3",
	"heroin ga3"
];
_doc = [
	"paramedic_license",
	"paramedic_license_air"
];

_indyLicenses = [
	"isis_training"
];
INV_LicenseShops = [
	[university,_uniLicenses],
	[southshop1,_uniLicenses],
	[gunshop1,_gunLicenses],
	[pmcatm,_pmcLicenses],
	//[insurgent_atm, _unLicenses],
	[licenseflag2,_weaponLicenses],
	[atm5,_opforLicenses],
	[osf_atm,_opforLicenses],
	[osf_atm_2,_opforLicenses],
	[insurgent_atm,_indyLicenses],
	[ind_fob_atm,_indyLicenses],
	[fob_atm2,_opforLicenses],
	[fob_atm3,_opforLicenses],
	[takistan_mine,_mineLicenses],
	[copbank,_copLicenses],
	[srt_atm,_copLicenses],
	[licenseflag5, _passPorts],
	[licenseflag3, _passPorts],
	[atmnews,_newsLicenses],
	//[Diamond_1, _mineLicenses],
	[oil_2, _mineLicenses],
	[gangbox1,_ga1],
	[gangbox2,_ga2],
	[gangbox3,_ga3],
	[Oil_1, _mineLicenses],
	[esu_atm,_doc],
	[esu_atm2,_doc]
];



INV_ItemShops_Object = 0;
INV_ItemShops_Name = 1;
INV_ItemShops_Crate = 2;
INV_ItemShops_Logic = 3;
INV_ItemShops_BuyList = 4;
INV_ItemShops_SellList = 5;
INV_ItemShops_License = 6;

//note that the object (first element) must be unique to each shop, as this is used for caching shop data
INV_ItemShops = [
		[vipshop,"VIP Donator Shop",vipshop,dummyobj,vip_donor_weapon_shop,vip_donor_weapon_shop,true],
		[vipcarshop,"VIP Donator Vehicle Shop",dummyobj, vipshopcarspawn,_vipcarshop,_vipcarshop,true],
		[vipshop_1,"VIP Donator Shop",vipshopbox_1,dummyobj,vip_donor_weapon_shop,vip_donor_weapon_shop,true],
		[vipcarshop_1,"VIP Donator Vehicle Shop",dummyobj, vipshopcarspawn_1,_vipcarshop,_vipcarshop,true],

		[newscarshop,"News Reporter Car Shop",dummyobj, newscarspawn,_newsstationcar,_newsstationcar,true],
		[newsairshop,"News Reporter Air Shop",dummyobj, newsairspawn,_newsstationair,_newsstationair,true],


		// Factory Exporting!
		[veh_fac_export,"Vehicle Exports",dummyobj, veh_fac_export_zone,_emptyshop,_vehiclefactory_exports,true],

		// Mining
		[takistan_mine,"Takistan Mining Company",dummyobj, dummyobj,_takistan_mine, _takistan_mine,true],



		[srt_weapons,"SRT Equiptment",srt_weapons,dummyobj,_srtWep,_srtWep,false],
		[srt_carshop,"SRT Infantry Vehicles",dummyobj, srt_carshop_spawn,_srtCar,_srtCar,false],
		[srt_airshop,"SRT Air Vehicles",dummyobj, srt_airshop_spawn,_srtAir,_srtAir,false],
		
		[osf_weapons,"OSF Equiptment",osf_weapons,dummyobj,_osfWep,_osfWep,false],
		[osf_carshop,"OSF Infantry Vehicles",dummyobj, osf_carshop_spawn,_osfVeh,_osfVeh,false],
		[osf_airshop,"OSF Air Vehicles",dummyobj, osf_airshop_spawn,_osfAir,_osfAir,false],

		[fuelshop1,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true],
		[fuelshop2,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true],
		[fuelshop3,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true],
		[fuelshop4,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true],
		[fuelshop5,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true],
		[fuelshop6,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true],
		[fuelshop7,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true],
		[fuelshop8,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true],
		[fuelshop9,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true],

		[shop1,"Item Shop",dummyobj,dummyobj,_is,_is,true],
		[shop2,"Item Shop",dummyobj,dummyobj,_is,_is,true],
		[shop3,"Item Shop",dummyobj,dummyobj,_is,_is,true],
		[shop4,"Item Shop",dummyobj,dummyobj,_is,_is,true],

		//[barelylegal,"Barely Legal",dummyobj,dummyobj,_bl,_bl,true],


		[pub1,"Bar",dummyobj,dummyobj,_pub,_pub,true],
		[pub2,"Bar",dummyobj,dummyobj,_pub,_pub,true],
		[pub3,"Bar",dummyobj,dummyobj,_pub,_pub,true],

		[gunshop1,"Gun Shop",gunbox1,dummyobj,_gs,_gs,true],

		[checkpoint,"Checkpoint Shop",dummyobj,dummyobj,_cp,_cp,true],
		[equipshop,"Equipment Shop",equipbox,dummyobj,_es,_es,true],
		[equipshop4,"Equipment Shop",equipbox4,dummyobj,_es,_es,true],
		[equipshop6,"Equipment Shop",equipbox6,dummyobj,_es,_es,true],
		[equipshop7,"Equipment Shop",equipbox7,dummyobj,_es,_es,true],

		[tuning1,"Car Upgrades",dummyobj,dummyobj,_cu,_cu,true],
		[tuning2,"Car Upgrades",dummyobj,dummyobj,_cu,_cu,true],
		[tuning3,"Car Upgrades",dummyobj,dummyobj,_cu,_cu,true],
		//[tuning4,"Car Upgrades",dummyobj,dummyobj,_cu,_cu,true],
		[tuning5,"Car Upgrades",dummyobj,dummyobj,_cu,_cu,true],

		[carshop1,"Car Shop",dummyobj,carspawn1,_cs,_cs,true],
		[carshop2,"Car Shop",dummyobj,carspawn2,_cs,_cs,true],
		[carshop3,"Car Shop",dummyobj,carspawn3,_cs,_cs,true],
		[carshop4,"Car Shop",dummyobj,carspawn4,_cs,_cs,true],
		[carshop5,"Car Shop",dummyobj,carspawn5,_cs,_cs,true],
		[carshop6,"Car Shop",dummyobj,carspawn6,_cs,_cs,true],
		[carshop7,"Car Shop",dummyobj,carspawn7,_cs,_cs,true],
		[carshop8,"Car Shop",dummyobj,carspawn8,_cs,_cs,true],

		[truckshop,"Truck Shop",dummyobj,truckspawn,_ts,_ts,true],
		[truckshop2,"Truck Shop",dummyobj,truckspawn2,_ts,_ts,true],

		[airshop,"Air Shop",dummyobj,asairspawn,_as,_as,true],
		[airshop2,"Loy Manara Air Shop",dummyobj,asairspawn2,_as_1,_as_1,true],

		//[tdoc,"Doctor",dummyobj,dummyobj,_td,_td,false],

		[Oil_1,"Mining equipment",dummyobj,dummyobj,_ms,_ms,true],
		[Oil_2,"Mining equipment",dummyobj,dummyobj,_ms,_ms,true],

		[resourcesell,"Sell Resources",dummyobj,dummyobj,_rs,_rs,true],
		[resourcesell2,"Sell Resources",dummyobj,dummyobj,_rs,_rs,true],

		// General Shop
		//_generalstore
		[southshop1,"General Shop",southshopbox1,dummyobj,_generalstore,_generalstore,true],


		[RingShop,"Ring Sell", dummyobj,dummyobj,_gds,_gds,true],

		[OilSell1,"Oil Dealer", dummyobj,dummyobj, _emptyshop,_os,true],

		[gangarea1,"Gang Shop",gangbox1,dummyobj,_gangshop_buy,_gangshop_buy,false],
		[gangarea2,"Gang Shop",gangbox2,dummyobj,_gangshop_buy,_gangshop_buy,false],
		[gangarea3,"Gang Shop",gangbox3,dummyobj,_gangshop_buy,_gangshop_buy,false],


		[organ_dealer,"Sell Organs",dummyobj,dummyobj,_emptyshop,_bmo,true],
		[organ_dealer2,"Sell Organs",dummyobj,dummyobj,_emptyshop,_bmo,true],
		
		[cdrugsell,"Sell Cocaine",dummyobj,dummyobj,_emptyshop,_dsc,true],
		[methdrugsell,"Sell Meth",dummyobj,dummyobj,_emptyshop,_dsmeth,true],
		[mdrugsell,"Sell Marijuana",dummyobj,dummyobj,_emptyshop,_dsm,true],
		[ldrugsell,"Sell LSD",dummyobj,dummyobj,_emptyshop,_dsl,true],
		[hdrugsell,"Sell Heroin",dummyobj,dummyobj,_emptyshop,_dsh,true],

		[copcar,"Police Vehicle Shop",dummyobj, ccarspawn,_cv,_cv,true],
		//[copair,"Police Air Vehicle Shop",dummyobj, cairspawn,_ca,_ca,true],
		[blufor_war,"War Vehicles Vehicles",dummyobj, saairspawn,_bwv,_bwv,true],
		[swatcar,"SOBR Vehicle Shop",dummyobj, ccarspawn,_sv,_sv,true],
		[vicecar,"VICE Vehicles",dummyobj, ccarspawn,_vice,_vice,true],
		[swatair,"Air Vehicle Shop",dummyobj, saairspawn,_sa,_sa,true],

		[pmccar,"PMC Land Vehicle Shop",dummyobj, pmccarspawn,_pmcveh,_pmcveh,true],
		[pmcair,"PMC Air Vehicle Shop",dummyobj, pmcairspawn,_pmcair,_pmcair,true],

		[copbasic,"Police Shop",copbasic,dummyobj, _copshop,_copshop,false],
		[cop_rookie,"Rookie Shop",cop_rookie,dummyobj, blufor_rookie_shop,blufor_rookie_shop,false],
		[coppatrol,"Patrol-Officer",coppatrol,dummyobj,blufor_patrol_shop,blufor_patrol_shop,false],
		[copcriminal,"Criminal Response-Officer",copcriminal,dummyobj,blufor_response_shop,blufor_response_shop,true],
		[copswat,"SOBR",copswat,dummyobj,blufor_sobr_shop,blufor_sobr_shop,false],
		[copcolonel,"Colonel Shop",copcolonel,dummyobj,blufor_colonel_shop,blufor_colonel_shop,false],
		
		[copair,"Police Air Base",dummyobj,copairspawn,_cop_airbase,_cop_airbase,true],

		[pmcbox,"PMC Equipment",pmcbox,dummyobj,_pmcs,_pmcs,true],
		
		[pharmacy,"Pharmacy",dummyobj,dummyobj,_pharm,_pharm,true],

		[hashbar,"Get High",dummyobj,dummyobj,_hash,_emptyshop,true],

		//[un_weapons_1,"Light Weapons",un_weapons_1,dummyobj,_unWeapons1,_unWeapons1,true],
		//[un_weapons_2,"Heavy Weapons",un_weapons_2,dummyobj,_unWeapons2,_unWeapons2,true],
		//[un_weapons_3,"Assault Weapons",un_weapons_3,dummyobj,_unWeapons3,_unWeapons3,true],
		//[un_weapons_4,"Other Weapons",un_weapons_4,dummyobj,_unWeapons4,_unWeapons4,true],
		//[unhelishop,"Helicopters",dummyobj,unhelispawn,_unAirShop,_unAirShop,true],
		//[unsupplyshop,"Supplies",unsupplyshop,dummyobj,_unItems,_unItems,true],
		//[unvehshop,"Light Vehicles",dummyobj,unvehspawn,_unLightVehicles,_unLightVehicles,true],
		//[unhvyveh,"Heavy Vehicles",dummyobj,unhvyspawn,_unHeavyVehicles,_unHeavyVehicles,true],
		//[unairveh,"Aircraft",dummyobj,unairspawn,_unPlaneShop,_unPlaneShop,true],

		//[terrorshop,"Terrorist Shop",tgunbox,dummyobj,_terrorshop_buy,_terrorshop_buy,false],
		[ind_fob_weapons,"Weapons",ind_fob_weapons,dummyobj,_ifw,_ifw,false],
		[ind_fob_vehicles,"Air Vehicles",dummyobj,ind_fob_vehspawn,_ifv,_ifv,false],
		
		[insurgent_weapons,"Weapons",insurgent_weapons,dummyobj,_igs,_igs,false],
		[insurgent_air_vehicles,"Air Vehicles",dummyobj,insurgent_air_vehicles_spawn,_ihs,_ihs,false],
		[insurgent_items,"Supplies",insurgent_weapons,dummyobj,_isup,_isup,false],
		[insurgent_vehicles,"Vehicles",dummyobj,insurgent_vehicles_spawn,_bt,_bt,false],
		//[terror_heavy_vehicles,"Heavy Vehicles",dummyobj,terror_heavy_vehicles_spawn,_ihvy,_ihvy,false],
		//[terror_plane_vehicles,"Aircraft",dummyobj,terror_plane_vehicles_spawn,_iair,_iair,false],

		// Opfor Shops
		[redgunshop,"Weapons",redgunbox,dummyobj,_rgs,_rgs,true],
		[redsupplyshop,"Supplies",dummyobj,dummyobj,_rsup,_rsup,true],
		[redhelishop,"Helicopters",dummyobj,redhelispawn,_rhs,_rhs,true],
		[redltveh,"Light Vehicles",dummyobj,redvehspawn,_rlt,_rlt,true],
		[redhvyveh,"Heavy Vehicles",dummyobj,redhvyspawn,_rhvy,_rhvy,true],
		[redairveh,"Aircraft",dummyobj,redairspawn,_rair,_rair,true],
		
		
		// Opfor Fob Shops
		[opf_fob_airshop,"Aircraft",dummyobj,opf_fob_airshop_spawn,_rhs_fob,_rhs_fob,true],
		[opf_fob_vehicles,"Vehicles",dummyobj,opf_fob_vehicle_spawn,_rlt_fob,_rlt_fob,true],
		[opf_fob_equiptment,"Equiptment",opf_fob_equiptment_box,dummyobj,_rgs_fob,_rgs_fob,true],
		[opf_fob_checkpoint,"Checkpoint Items",dummyobj,dummyobj,_cp,_cp,true],

		

		[cparts,"Car Parts",dummyobj,dummyobj,_carparts,_carparts,true],

		//[airshop3,"Armed Vehicles",dummyobj,asairspawn3,_as_2,_as_2,true],

		[fortshop1,"Blufor Fortifications Shop",dummyobj,fortshop1s,_cp,_cp,true],
		//[fortshop2,"PMC Fortifications Shop",dummyobj,fortshop2s,_cp,_cp,true],
		[fortshop3,"Factory Fortifications Shop",dummyobj,fortshop3s,_cp,_cp,true],
		//[fortshop4,"Terror Fortifications Shop",dummyobj,fortshop4s,_cp,_cp,true],
		[fortshop5,"Opfor Fortifications Shop",dummyobj,fortshop5s,_cp,_cp,true],
		[fortshopOSF,"OSF Fortifications Shop",dummyobj,fortshopOSFMARKER,_cp,_cp,true],
		//[fortshop6,"Insurgent Fortifications Shop",dummyobj,fortshop6s,_fs4,_fs4,true],
		[vipfortshop,"VIP Fort Shop",dummyobj,vipfortshops,_fsvip,_fsvip,false],

		//[hpcar,"Hospital Vehicle Shop",dummyobj,hospitalspawn,esu_vehicle_shop,esu_vehicle_shop,true],
		
		[esu_vehicles,"ESU Vehicle Shop",dummyobj,esu_vehicles_spawn,esu_vehicle_shop,esu_vehicle_shop,true],
		[esu_supply,"ESU Item Shop",esu_supply,dummyobj,esu_item_shop,esu_item_shop,true],
		[esu_vehicles2,"ESU Vehicle Shop South",dummyobj,esu_vehicles_spawn2,esu_vehicle_shop,esu_vehicle_shop,true],
		[esu_supply2,"ESU Item Shop South",esu_supply2,dummyobj,esu_item_shop,esu_item_shop,true],
		
		[blackmarket_weapons,"Black Market Weapons",bmgunbox,dummyobj,_bmw,_bmw,false],
		[blackmarket_equipment,"Black Market Equipment",bmequipmentbox,dummyobj,_bme,_bme,false],
		[blackmarket_vehicle_shop,"Black Market Vehicles",dummyobj,blackmarket_vehicle_spawn,_bmv,_bmv,false],

		[mainbankShop,"Bank Insurance",dummyobj,dummyobj,_bank,_bank,true],

		[donatorcarshopciv,"Civ Donator Vehicle Shop",dummyobj,civdcarspawn,_cdvs,_cdvs,true],
		[donatorboxshopciv,"Civ Donator Weapons Shop",donatorboxshopciv,dummyobj,_cdws,_cdws,true],
		[donatorairshopciv,"Civ Donator Air Shop",dummyobj,civdairspawn,_cdas,_cdas,true],
		//Southern Civ Donor//
		[donatorcarshopciv_2,"Civ Donator Vehicle Shop",dummyobj,civdcarspawn_2,_cdvs,_cdvs,true],
		[donatorboxshopciv_2,"Civ Donator Weapons Shop",donatorboxshopciv_2,dummyobj,_cdws,_cdws,true],
		[donatorairshopciv_2,"Civ Donator Air Shop",dummyobj,civdairspawn_2,_cdas,_cdas,true],

		[donatorcarshopins,"Insurgent Donator Vehicle Shop",dummyobj,insdcarspawn,_insvs,_insvs,true],
		[donatorboxshopins,"Insurgent Donator Weapons Shop",donatorboxshopins,dummyobj,_insws,_insws,true],
		//[donatorairshopins,"Insurgent Donator Air Shop",dummyobj,copdairspawn,_insas,_insas,true],

		[donatorcarshopcop,"Blufor Donator Vehicle Shop",dummyobj,copdcarspawn,_cpdvs,_cpdvs,true],
		[donatorboxshopcop,"Blufor Donator Weapons Shop",donatorboxshopcop,dummyobj,blufor_donator_weapon_shop,blufor_donator_weapon_shop,true],
		[donatorairshopcop,"Blufor Donator Air Shop",dummyobj,copdairspawn,_cpdas,_cpdas,true],

		[donatorcarshopopf,"Opfor Donator Vehicle Shop",dummyobj,opfdcarspawn,_odvs,_odvs,true],
		[donatorboxshopopf,"Opfor Donator Weapons Shop",donatorboxshopopf,dummyobj,_odws,_odws,true],
		[donatorairshopopf,"Opfor Donator Air Shop",dummyobj,opfdairspawn,_odas,_odas,true],
		
		
 		//donor base shops
		[coleitemshop,"VIP Donator Shop",coleitemshop,dummyobj,vip_donor_weapon_shop,vip_donor_weapon_shop,true],
		[colecarshop,"Car Shop",dummyobj,colecarspawn,_cs,_cs,true],
		[colevipcarshop,"VIP Donator Vehicle Shop",dummyobj, colecarspawn,_vipcarshop,_vipcarshop,true],
		[coleairshop,"Civ Donator Air Shop",dummyobj,coleairspawn,_cdas,_cdas,true]
	];


//buidld the INV_ItemMaxStocks array
if (isServer) then {
        INV_ItemMaxStocks = [];

       for "_i" from 0 to  ((count INV_ItemShops) - 1 ) do {
                private["_newArray", "_buyList", "_sellList", "_newStock", "_newMax", "_newBuy", "_newSell"];

                _newArray = INV_ItemShops select _i;
                _buyList = _newArray select INV_ItemShops_BuyList;

                _newMax        = [];

                {
                        private["_array", "_class", "_stock", "_max"];
                        _array = _x;
                        _max = _array select shop_list_stock_max;
                        _newMax set [count _newMax, _max];
                } forEach _buyList;

                INV_ItemMaxStocks set [_i, _newMax];
        };
        publicVariable "INV_ItemMaxStocks";
};

//buidld the INV_ItemStocks array
if (isServer) then {
        INV_ItemStocks = [];
        for "_i" from 0 to  ((count INV_ItemShops) - 1 ) do {
                private["_newArray", "_buyList", "_newStock"];

                _newArray = INV_ItemShops select _i;
                _buyList = _newArray select INV_ItemShops_BuyList;
                _newStock        = [];

                {
                        private["_array", "_max"];
                        _array = _x;
                        _max = _array select shop_list_stock;
                        _newStock set [count _newStock, _max];
                } forEach _buyList;

                INV_ItemStocks set [_i, _newStock];
        };
        publicVariable "INV_ItemStocks";
};

waitUntil {!isNil "cop_generate_weapons_list"};
[] spawn cop_generate_weapons_list;
uiSleep 1;
[] spawn cop_refresh_allowed_weapons;


//buidld the INV_ItemShops array
for "_i" from 0 to  ((count INV_ItemShops) - 1 ) do {
        private["_newArray", "_buyList", "_sellList", "_newBuy", "_newSell"];

        _newArray = INV_ItemShops select _i;
        _buyList = _newArray select INV_ItemShops_BuyList;
        _sellList = _newArray select INV_ItemShops_SellList;

        _newBuy        = [];
        _newSell = [];

        {
                private["_array", "_item"];
                _array = _x;
                _item = _array select shop_list_item;
                _newSell set[count _newSell, _item];
        } forEach _sellList;

        {
                private["_array", "_item"];
                _array = _x;
                _item = _array select shop_list_item;
                _newBuy set[count _newBuy, _item];
        } forEach _buyList;

        _newArray set[INV_ItemShops_BuyList, _newBuy];
        _newArray set[INV_ItemShops_SellList, _newSell];

        INV_ItemShops set[_i, _newArray];
};

if (isClient) then {
        waitUntil { not(isNil "INV_ItemStocks") };
        waitUntil { not(isNil "INV_ItemMaxStocks") };
};


