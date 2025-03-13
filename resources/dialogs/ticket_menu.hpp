class ticket_menu {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {ticket_background_frame,ticket_background_frame};
	objects[] = { };
	controls[] = {
		ticket_background,
		ticket_background_frame,
		reason_header,
		amount_header,
		ticket_reason,
		ticket_amount,
		button_submit,
		button_cancel
		
	};
	
	class ticket_background: RscBackground
	{
		idc = 1800;
		x = 0.401563 * safezoneW + safezoneX;
		y = 0.325 * safezoneH + safezoneY;
		w = 0.13125 * safezoneW;
		h = 0.385 * safezoneH;
	};	
	class ticket_background_frame: RscBgRahmen
	{
		idc = 1800;
		text = "Ticketing";
		x = 0.401563 * safezoneW + safezoneX;
		y = 0.325 * safezoneH + safezoneY;
		w = 0.13125 * safezoneW;
		h = 0.385 * safezoneH;
	};
	class ticket_reason: RscCombo
	{
		idc = 1;
		x = 0.409766 * safezoneW + safezoneX;
		y = 0.43 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class ticket_amount: RscEdit
	{
		idc = 2;
		text = "1000";
		x = 0.409766 * safezoneW + safezoneX;
		y = 0.535 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class button_submit: RscButtonNice
	{
		idc = 1600;
		text = "Issue Citation";
		x = 0.409766 * safezoneW + safezoneX;
		y = 0.5875 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
		action = "[player,civ_player_variable,[(ctrltext 2)] call parse_number,(lbData [1, (lbCurSel 1)])] call interact_ticket; closedialog 0";
	};
	class amount_header: RscText
	{
		idc = 1000;
		text = "Ticket Amount";
		x = 0.409766 * safezoneW + safezoneX;
		y = 0.4825 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class reason_header: RscText
	{
		idc = 1001;
		text = "Ticket Reason";
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
