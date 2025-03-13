class license_menu {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {license_main,license_main_frame};
	objects[] = { };
	controls[] = {
		license_list,
		license_buy,
		license_close
	};


	class license_main: RscBackground
	{
		idc = 1799;
		x = 0.385156 * safezoneW + safezoneX;
		y = 0.185 * safezoneH + safezoneY;
		w = 0.196875 * safezoneW;
		h = 0.63 * safezoneH;
	};
	class license_main_frame: RscBgRahmen
	{
		idc = 1800;
		text = "Licensing";
		x = 0.385156 * safezoneW + safezoneX;
		y = 0.185 * safezoneH + safezoneY;
		w = 0.196875 * safezoneW;
		h = 0.63 * safezoneH;
	};
	class license_list: RscListbox
	{
		idc = 2100;
		x = 0.393359 * safezoneW + safezoneX;
		y = 0.2025 * safezoneH + safezoneY;
		w = 0.180469 * safezoneW;
		h = 0.49 * safezoneH;
	};
	class license_buy: RscButton
	{
		idc = 2101;
		text = "Buy License";
		x = 0.401563 * safezoneW + safezoneX;
		y = 0.71 * safezoneH + safezoneY;
		w = 0.164062 * safezoneW;
		h = 0.035 * safezoneH;
		action = "[(lbData [2100, (lbCurSel 2100)])] call player_add_license";

	};
	class license_close: RscButton
	{
		idc = 1601;
		text = "Close Menu";
		x = 0.401563 * safezoneW + safezoneX;
		y = 0.7625 * safezoneH + safezoneY;
		w = 0.164062 * safezoneW;
		h = 0.035 * safezoneH;
		action = "closedialog 0";
	};
};

class appstore_menu {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {app_main,app_main_frame};
	objects[] = { };
	controls[] = {
		app_list,
		app_buy,
		app_close
	};


	class app_main: RscBackground
	{
		idc = 1799;
		x = 0.385156 * safezoneW + safezoneX;
		y = 0.185 * safezoneH + safezoneY;
		w = 0.196875 * safezoneW;
		h = 0.63 * safezoneH;
	};
	class app_main_frame: RscBgRahmen
	{
		idc = 1800;
		text = "RISE Gaming Appstore";
		x = 0.385156 * safezoneW + safezoneX;
		y = 0.185 * safezoneH + safezoneY;
		w = 0.196875 * safezoneW;
		h = 0.63 * safezoneH;
	};
	class app_list: RscListbox
	{
		idc = 2100;
		x = 0.393359 * safezoneW + safezoneX;
		y = 0.2025 * safezoneH + safezoneY;
		w = 0.180469 * safezoneW;
		h = 0.49 * safezoneH;
	};
	class app_buy: RscButton
	{
		idc = 2101;
		text = "Buy App";
		x = 0.401563 * safezoneW + safezoneX;
		y = 0.71 * safezoneH + safezoneY;
		w = 0.164062 * safezoneW;
		h = 0.035 * safezoneH;
		action = "[(lbData [2100, (lbCurSel 2100)])] spawn appstore_buy";

	};
	class app_close: RscButton
	{
		idc = 1601;
		text = "Close Menu";
		x = 0.401563 * safezoneW + safezoneX;
		y = 0.7625 * safezoneH + safezoneY;
		w = 0.164062 * safezoneW;
		h = 0.035 * safezoneH;
		action = "closedialog 0";
	};
};


