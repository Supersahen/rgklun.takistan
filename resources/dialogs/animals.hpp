class animals {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {background_animals_dialog, RscFrame_1800};
	objects[] = { };
	controls[] = {
	    RscButton_1600,
        RscButton_1601,
		RscButton_1602,
        RscText_1000,
		RscEdit_1400,
		RscText_1001,
		RscButton_1603,
		RscButton_1604
	};
	class background_animals_dialog: RscBackground
	{
		idc = 9877;
		x = 0.391125 * safezoneW + safezoneX;
		y = 0.336969 * safezoneH + safezoneY;
		w = 0.209248 * safezoneW;
		h = 0.352703 * safezoneH;
	};
	class RscButton_1600: RscButton
	{
		idc = 1600;
		text = "Alsatian";
		action = "animal = 'Pastor'; player groupchat 'Alsatian Selected'";
		x = 0.455929 * safezoneW + safezoneX;
		y = 0.382451 * safezoneH + safezoneY;
		w = 0.0771241 * safezoneW;
		h = 0.0460933 * safezoneH;
	};
	class RscButton_1601: RscButton
	{
		idc = 1601;
		text = "Mongrel";
		action = "animal = 'Fin'; player groupchat 'Mongrel Selected'";
		x = 0.455929 * safezoneW + safezoneX;
		y = 0.441225 * safezoneH + safezoneY;
		w = 0.0758894 * safezoneW;
		h = 0.0460933 * safezoneH;
	};
	class RscButton_1602: RscButton
	{
		idc = 1602;
		text = "Goat";
		action = "animal = 'Goat'; player groupchat 'Goat Selected'";
		x = 0.455929 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.0758894 * safezoneW;
		h = 0.0460933 * safezoneH;
	};
	class RscText_1000: RscText
	{
		idc = 1000;
		text = "Please select the animal you wish to buy";
		x = 0.411858 * safezoneW + safezoneX;
		y = 0.347186 * safezoneH + safezoneY;
		w = 0.164448 * safezoneW;
		h = 0.0192302 * safezoneH;
	};
	class RscEdit_1400: RscEdit
	{
		idc = 1400;
		x = 0.406349 * safezoneW + safezoneX;
		y = 0.594039 * safezoneH + safezoneY;
		w = 0.177471 * safezoneW;
		h = 0.0229355 * safezoneH;
	};
	class RscText_1001: RscText
	{
		idc = 1001;
		text = "Please choose a name for your animal";
		x = 0.417367 * safezoneW + safezoneX;
		y = 0.570529 * safezoneH + safezoneY;
		w = 0.15455 * safezoneW;
		h = 0.0145987 * safezoneH;
	};
	class RscFrame_1800: RscFrame
	{
		idc = 1800;
		x = 0.391125 * safezoneW + safezoneX;
		y = 0.336969 * safezoneH + safezoneY;
		w = 0.209248 * safezoneW;
		h = 0.352703 * safezoneH;
	};
	class RscButton_1603: RscButton
	{
		idc = 1603;
		text = "Ok";
		action = "[ctrlText 1400,animal] call Pet_buy";
		x = 0.406349 * safezoneW + safezoneX;
		y = 0.629304 * safezoneH + safezoneY;
		w = 0.063908 * safezoneW;
		h = 0.0460933 * safezoneH;
	};
	class RscButton_1604: RscButton
	{
		idc = 1604;
		text = "Cancel";
		action = "closeDialog 0";
		x = 0.516527 * safezoneW + safezoneX;
		y = 0.629304 * safezoneH + safezoneY;
		w = 0.0639082 * safezoneW;
		h = 0.0451668 * safezoneH;
	};
};
