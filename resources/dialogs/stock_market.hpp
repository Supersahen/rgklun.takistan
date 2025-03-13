class stock_menu {
	idd = 2000;
	movingEnable = true;
	controlsBackground[] = {market_background,market_background_frame};
	objects[] = { };
	controls[] = {
		stock_markets,
		stock_amount,
		share_price,
		owned_shares,
		increase_decrease,
		stock_worth,
		button_buy,
		button_sell,
		button_close
		
	};
	
	class market_background: RscBackground
	{
		idc = 1800;
		x = 0.352344 * safezoneW + safezoneX;
		y = 0.29 * safezoneH + safezoneY;
		w = 0.278906 * safezoneW;
		h = 0.49 * safezoneH;
	};	
	
	class market_background_frame: RscBgRahmen
	{
		idc = 1800;
		text = "Takistan Stock Exchange";
		x = 0.352344 * safezoneW + safezoneX;
		y = 0.29 * safezoneH + safezoneY;
		w = 0.278906 * safezoneW;
		h = 0.49 * safezoneH;
	};
	class stock_markets: RscListbox
	{
		idc = 1500;
		x = 0.360547 * safezoneW + safezoneX;
		y = 0.3075 * safezoneH + safezoneY;
		w = 0.13125 * safezoneW;
		h = 0.455 * safezoneH;
		onLBSelChanged = "_this call stock_dialog_select";
	};
	class stock_amount: RscEdit
	{
		idc = 1400;
		text = "0";
		x = 0.5 * safezoneW + safezoneX;
		y = 0.57 * safezoneH + safezoneY;
		w = 0.123047 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class share_price: RscText
	{
		idc = 1000;
		text = "Share Price:";
		sizeEx = 0.029;
		style = ST_CENTER;
		x = 0.5 * safezoneW + safezoneX;
		y = 0.3075 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.0175 * safezoneH;
	};
	class owned_shares: RscText
	{
		idc = 1001;
		text = "Owned Shares:";
		sizeEx = 0.029;
		style = ST_CENTER;
		x = 0.5 * safezoneW + safezoneX;
		y = 0.3775 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.0175 * safezoneH;
	};
	class increase_decrease: RscText
	{
		idc = 1002;
		text = "";
		sizeEx = 0.029;
		style = ST_CENTER;
		x = 0.5 * safezoneW + safezoneX;
		y = 0.4475 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.0175 * safezoneH;
	};
	class stock_worth: RscText
	{
		idc = 1003;
		text = "";
		sizeEx = 0.029;
		style = ST_CENTER;
		x = 0.5 * safezoneW + safezoneX;
		y = 0.5175 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.0175 * safezoneH;
	};
	class button_buy: RscButtonNice
	{
		idc = 1600;
		text = "Buy Share";
		action = "[ctrltext 1400] call stock_buy_share";
		x = 0.5 * safezoneW + safezoneX;
		y = 0.6225 * safezoneH + safezoneY;
		w = 0.123047 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class button_sell: RscButtonNice
	{
		idc = 1601;
		text = "Sell Share";
		action = "[ctrltext 1400] call stock_sell_share";
		x = 0.5 * safezoneW + safezoneX;
		y = 0.675 * safezoneH + safezoneY;
		w = 0.123047 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class button_close: RscButtonNice
	{
		idc = 1602;
		text = "Close Market";
		action = "closedialog 0";
		x = 0.5 * safezoneW + safezoneX;
		y = 0.7275 * safezoneH + safezoneY;
		w = 0.123047 * safezoneW;
		h = 0.035 * safezoneH;
	};

};
