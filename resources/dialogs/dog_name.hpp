class dog_name_dialog {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {background_animals_dialog, RscFrame_1800};
	objects[] = { };
	controls[] = {
	    RscButton_1600,
        RscButton_1601,
        RscText_1000,
		RscEdit_1400,
		RscText_1001,
		RscButton_1603,
		RscButton_1604
	};
	class background_animals_dialog: RscBackground
	{
		idc = 9877;
		x = 0.448949 * safezoneW + safezoneX;
		y = 0.473137 * safezoneH + safezoneY;
		w = 0.124336 * safezoneW;
		h = 0.176704 * safezoneH;
	};
	class RscButton_1600: RscButton
	{
		idc = 1600;
		text = "Alsatian";
		action = "animal = 'Pastor'; player groupchat 'Alsatian Selected'";
		x = 0.386229;
		y = 0.541371;
		w = 0.135461;
		h = 0.0645391;
	};
	class RscButton_1601: RscButton
	{
		idc = 1601;
		text = "Mongrel";
		action = "animal = 'Fin'; player groupchat 'Mongrel Selected'";
		x = 0.541371;
		y = 0.543341;
		w = 0.135461;
		h = 0.0645391;
	};
	class RscText_1000: RscText
	{
		idc = 1000;
		text = "Choose your type of Dog:";
		x = 0.46093 * safezoneW + safezoneX;
		y = 0.481473 * safezoneH + safezoneY;
		w = 0.102978 * safezoneW;
		h = 0.0192302 * safezoneH;
	};
	class RscEdit_1400: RscEdit
	{
		idc = 1400;
		x = 0.377364;
		y = 0.687155;
		w = 0.309811;
		h = 0.0408984;
	};
	class RscText_1001: RscText
	{
		idc = 1001;
		text = "Please choose a name for your police k9";
		x = 0.368499;
		y = 0.643814;
		w = 0.321631;
		h = 0.0297005;
	};
	class RscFrame_1800: RscFrame
	{
		idc = 1800;
		text = "Buy Police K9";
		x = 0.448949 * safezoneW + safezoneX;
		y = 0.473137 * safezoneH + safezoneY;
		w = 0.124336 * safezoneW;
		h = 0.176704 * safezoneH;
	};
	class RscButton_1603: RscButton
	{
		idc = 1603;
		text = "Ok";
		action = "[ctrlText 1400,animal] call dog_buy";
		x = 0.455721 * safezoneW + safezoneX;
		y = 0.617641 * safezoneH + safezoneY;
		w = 0.0321311 * safezoneW;
		h = 0.0229355 * safezoneH;
	};
	class RscButton_1604: RscButton
	{
		idc = 1604;
		text = "Cancel";
		action = "closeDialog 0";
		x = 0.533861 * safezoneW + safezoneX;
		y = 0.616716 * safezoneH + safezoneY;
		w = 0.0321311 * safezoneW;
		h = 0.0229355 * safezoneH;
	};
};