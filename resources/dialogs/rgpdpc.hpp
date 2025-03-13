class dispatch_database_dlg
{
	name=dispatch_database_dlg;
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {  dispatch_computer_main };
	objects[] = { };
	controls[] = { dispatch_computer_close, dispatch_log};


			
	class dispatch_computer_main: RscPicture
	{
		text = "resources\images\police\police_dispatch.paa";
		idc = 1800;
		x = 0.253906 * safezoneW + safezoneX;
		y = 0.255 * safezoneH + safezoneY;
		w = 0.475781 * safezoneW;
		h = 0.525 * safezoneH;
	};	
	class dispatch_log: RscListbox
	{
		idc = 202;
		x = 0.270313 * safezoneW + safezoneX;
		y = 0.29 * safezoneH + safezoneY;
		w = 0.442969 * safezoneW;
		h = 0.42 * safezoneH;
	};
	class dispatch_computer_close: RscButton
	{
		idc = 1600;
		text = "Close";
		action = "closedialog 0";
		x = 0.639453 * safezoneW + safezoneX;
		y = 0.7275 * safezoneH + safezoneY;
		w = 0.0738281 * safezoneW;
		h = 0.035 * safezoneH;
	};
};