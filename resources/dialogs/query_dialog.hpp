class player_query_dialog {
	idd = 2200;
	movingEnable = true;
	controlsBackground[] = {query_background,query_background_frame};
	objects[] = { };
	controls[] = {
		players_listbox,
		button_spectate,
		button_close,
		player_info_text
	};
	
	class query_background: RscBackground
	{
		idc = 1800;
		x = 0.303125 * safezoneW + safezoneX;
		y = 0.255 * safezoneH + safezoneY;
		w = 0.410156 * safezoneW;
		h = 0.525 * safezoneH;
	};	
	
	class query_background_frame: RscBgRahmen
	{
		idc = 1800;
		text = "Player Queries";
		x = 0.303125 * safezoneW + safezoneX;
		y = 0.255 * safezoneH + safezoneY;
		w = 0.410156 * safezoneW;
		h = 0.525 * safezoneH;
	};
	class players_listbox: RscListBox
	{
		idc = 1400;
		onLBSelChanged = "_this call mp_admin_query_refresh;";
		x = 0.311328 * safezoneW + safezoneX;
		y = 0.2725 * safezoneH + safezoneY;
		w = 0.139453 * safezoneW;
		h = 0.4375 * safezoneH;
	};
	class button_spectate: RscButton
	{
		idc = 1600;
		text = "Coming Soon";
		x = 0.311328 * safezoneW + safezoneX;
		y = 0.7275 * safezoneH + safezoneY;
		w = 0.139453 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class button_close: RscButton
	{
		idc = 1601;
		text = "Close";
		action = "closedialog 0";
		x = 0.565625 * safezoneW + safezoneX;
		y = 0.7275 * safezoneH + safezoneY;
		w = 0.139453 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class player_info_text: RscStructuredText
	{
		idc = 1000;
		text = "Select a query result on the right";
		style = ST_LEFT;
		x = 0.467187 * safezoneW + safezoneX;
		y = 0.2725 * safezoneH + safezoneY;
		w = 0.237891 * safezoneW;
		h = 0.4375 * safezoneH;
	};

};
