class dispatch_menu {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {dispatch_menu_bckg};
	objects[] = { };
	controls[] = {
		dispatch_warrants,
		dispatch_warrant_submit,
		dispatch_satcam,
		dispatch_jailcam,
		dispatch_markers,
		dispatch_header_2,
		dispatch_accept,
		dispatch_end,
		dispatch_tags,
		dispatch_computer,
		close_cancel
		
	};
	
	class dispatch_menu_bckg: RscPicture
	{
		idc = 1800;
		text = "resources\images\police\copmenu_main.paa";
		x = 0.36875 * safezoneW + safezoneX;
		y = 0.3425 * safezoneH + safezoneY;
		w = 0.213281 * safezoneW;
		h = 0.3325 * safezoneH;
	};	
	class dispatch_warrants: RscButton
	{
		idc = 1600;
		text = "Warrants";
		x = 0.376953 * safezoneW + safezoneX;
		y = 0.395 * safezoneH + safezoneY;
		w = 0.0820312 * safezoneW;
		h = 0.035 * safezoneH;
		action = "closedialog 0; [""coplog""] spawn dialog_handler;";
	};
	class dispatch_warrant_submit: RscButton
	{
		idc = 1601;
		text = "Prison | Warrants";
		x = 0.376953 * safezoneW + safezoneX;
		y = 0.4475 * safezoneH + safezoneY;
		w = 0.0820312 * safezoneW;
		h = 0.035 * safezoneH;
		action = "[] call interact_warrants_menu; closedialog 0;";
	};
	class dispatch_satcam: RscButton
	{
		idc = 1602;
		text = "SatCam";
		x = 0.376953 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.0820312 * safezoneW;
		h = 0.035 * safezoneH;
		action = "closedialog 0; [ [(getPosATL player select 0), (getPosATL player select 1), 200] ] execVM ""satcam.sqf"";";
	};
	class dispatch_jailcam: RscButton
	{
		idc = 1603;
		text = "Jail Cam";
		x = 0.376953 * safezoneW + safezoneX;
		y = 0.5525 * safezoneH + safezoneY;
		w = 0.0820312 * safezoneW;
		h = 0.035 * safezoneH;
		action = "closedialog 0; [0,1,2,[""jailcam""]] execVM ""copcams.sqf"";";
	};
	class dispatch_markers: RscButton
	{
		idc = 1604;
		text = "Markers";
		x = 0.376953 * safezoneW + safezoneX;
		y = 0.605 * safezoneH + safezoneY;
		w = 0.0820312 * safezoneW;
		h = 0.035 * safezoneH;
		action = "closedialog 0; [player] call interact_toggle_side_markers;";
	};
	class dispatch_header_2: RscTextCenter
	{
		idc = 1001;
		text = "Dispatch";
		x = 0.491797 * safezoneW + safezoneX;
		y = 0.36 * safezoneH + safezoneY;
		w = 0.0820312 * safezoneW;
		h = 0.0175 * safezoneH;
	};
	class dispatch_accept: RscButton
	{
		idc = 1605;
		text = "Accept Call";
		x = 0.491797 * safezoneW + safezoneX;
		y = 0.395 * safezoneH + safezoneY;
		w = 0.0820312 * safezoneW;
		h = 0.035 * safezoneH;
		action = "closedialog 0; [] call dispatch_accept";
	};
	class dispatch_end: RscButton
	{
		idc = 1606;
		text = "End Call ";
		x = 0.491797 * safezoneW + safezoneX;
		y = 0.4475 * safezoneH + safezoneY;
		w = 0.0820312 * safezoneW;
		h = 0.035 * safezoneH;
		action = "closedialog 0; [] call dispatch_remove";

	};	
	class dispatch_computer: RscButton
	{
		idc = 1608;
		text = "Dispatch Computer";
		x = 0.491797 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.0820312 * safezoneW;
		h = 0.035 * safezoneH;
		action = "[""police_database""] spawn dialog_handler; closedialog 0";

	};	
	class dispatch_tags: RscButton
	{
		idc = 1609;
		text = "Fix Sidemarkers";
		x = 0.491797 * safezoneW + safezoneX;
		y = 0.5525 * safezoneH + safezoneY;
		w = 0.0820312 * safezoneW;
		h = 0.035 * safezoneH;
		action = "[player] call name_tags_3d_controls_setup; closedialog 0";

	};
	class close_cancel: RscButton
	{
		idc = 1607;
		x = 0.491797 * safezoneW + safezoneX;
		y = 0.605 * safezoneH + safezoneY;
		w = 0.0820312 * safezoneW;
		h = 0.035 * safezoneH;
		text = "Close";
		action = "closedialog 0;";
	};
};
