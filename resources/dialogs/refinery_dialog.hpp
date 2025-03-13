class refinery_dialog {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {refinery_background,refinery_background_frame};
	objects[] = { };
	controls[] = {
		refinery_list,
		button_refine,
		button_close

		
	};
	class refinery_background: RscBackground
	{
		idc = 1800;
		x = 0.442578 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.106641 * safezoneW;
		h = 0.2975 * safezoneH;
	};
	class refinery_background_frame: RscBgRahmen
	{
		idc = 1800;
		text = "Takistan Resource Refinery";
		x = 0.442578 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.106641 * safezoneW;
		h = 0.2975 * safezoneH;
	};
	class refinery_list: RscListbox
	{
		idc = 1500;
		x = 0.450781 * safezoneW + safezoneX;
		y = 0.5175 * safezoneH + safezoneY;
		w = 0.0902344 * safezoneW;
		h = 0.1575 * safezoneH;
	};
	class button_refine: RscButton
	{
		idc = 1600;
		text = "Refine";
		action = "[] spawn refinery_process";
		x = 0.450781 * safezoneW + safezoneX;
		y = 0.6925 * safezoneH + safezoneY;
		w = 0.0902344 * safezoneW;
		h = 0.035 * safezoneH;
	};
	
	class button_close: RscButton
	{
		idc = 1601;
		text = "Close";
		action = "closedialog 0";
		x = 0.450781 * safezoneW + safezoneX;
		y = 0.745 * safezoneH + safezoneY;
		w = 0.0902344 * safezoneW;
		h = 0.035 * safezoneH;
	};
};
