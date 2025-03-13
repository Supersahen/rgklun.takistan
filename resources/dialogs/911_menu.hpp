class emergency_menu {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {main};
	objects[] = { };
	controls[] = {
		urgency,
		type,
		type_header,
		urgency_header,
		button_submit,
		button_cancel
		
	};
	
	class main: RscPicture
	{
		idc = 1800;
		text = "resources\images\police\copmenu_main.paa";
		x = 0.401563 * safezoneW + safezoneX;
		y = 0.325 * safezoneH + safezoneY;
		w = 0.13125 * safezoneW;
		h = 0.385 * safezoneH;
	};
	class urgency: RscCombo
	{
		idc = 1;
		x = 0.409766 * safezoneW + safezoneX;
		y = 0.43 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class type: RscCombo
	{
		idc = 2;
		x = 0.409766 * safezoneW + safezoneX;
		y = 0.535 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class button_submit: RscButtonNice
	{
		idc = 1600;
		text = "Submit Report";
		x = 0.409766 * safezoneW + safezoneX;
		y = 0.5875 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
		action = "[(lbData [2, (lbCurSel 2)]),(lbData [1, (lbCurSel 1)])] call dispatch_report; closedialog 0";
	};
	class type_header: RscText
	{
		idc = 1000;
		text = "Type Of Crime";
		x = 0.409766 * safezoneW + safezoneX;
		y = 0.4825 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class urgency_header: RscText
	{
		idc = 1001;
		text = "Urgency of Response";
		x = 0.409766 * safezoneW + safezoneX;
		y = 0.3775 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class button_cancel: RscButtonNice
	{
		idc = 1601;
		text = "Cancel";
		x = 0.409766 * safezoneW + safezoneX;
		y = 0.64 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
		action = "closedialog 0";
	};
};
