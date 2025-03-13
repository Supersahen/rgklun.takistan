class bank

{

idd = -1;
movingEnable = true;
controlsBackground[] = {bank_frame};
objects[] = { };
controls[] = {atm_deposit, atm_cancel, atm_withdraw, atm_field, atm_select, atm_text,atm_text2,dummybutton};

		class bank_frame: RscPicture
		{
			idc = 1800;
			text = "resources\images\atm.paa";
			x = 0.36875 * safezoneW + safezoneX;
			y = 0.255 * safezoneH + safezoneY;
			w = 0.196875 * safezoneW;
			h = 0.525 * safezoneH;
		};
		class atm_deposit: RscButtonNice
		{
			idc = 10;
			text = "Deposit";
			x = 0.376953 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class atm_cancel: RscButtonNice
		{
			idc = 1602;
			text = "Cancel";
			x = 0.434375 * safezoneW + safezoneX;
			y = 0.7275 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			action = "closedialog 0";
			h = 0.035 * safezoneH;
		};
		class atm_withdraw: RscButtonNice
		{
			idc = 11;
			text = "Withdraw";
			x = 0.475391 * safezoneW + safezoneX;
			y = 0.675 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class atm_field: RscEdit
		{
			idc = 2;
			text = "0";
			x = 0.393359 * safezoneW + safezoneX;
			y = 0.6225 * safezoneH + safezoneY;
			w = 0.147656 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class atm_select: RscCombo
		{
			idc = 1;
			x = 0.393359 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.147656 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class atm_text: RscTextCenter
		{
			idc = 101;
			text = "";
			x = 0.28 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.37 * safezoneW;
			h = 0.04 * safezoneH;
			
		};	
		class atm_text2: RscTextCenter
		{
			idc = 102;
			text = "";
			x = 0.28 * safezoneW + safezoneX;
			y = 0.49 * safezoneH + safezoneY;
			w = 0.37 * safezoneW;
			h = 0.04 * safezoneH;
		};


/*

	class DLG_BACK1: RscBackground

	{

	x = 0.31; y = 0.14;
	w = 0.37; h = 0.73;

	};

	class background : RscBgRahmen

	{

	x = 0.31; y = 0.14;
	w = 0.37; h = 0.73;
	text = $STRD_bank_description_title;

	};

	class text1 : RscText

	{

	x = 0.32; y = 0.17;
	w = 0.35; h = 0.04;
	style = ST_CENTER;
	text = $STRD_bank_description_deposit_transfer;

	};

	class spielerliste : RscCombo

	{

	idc = 1;
	x = 0.48; y = 0.22;
	w = 0.19; h = 0.04;

	};

	class text2 : RscText

	{

	x = 0.28; y = 0.22;
	w = 0.20; h = 0.04;
	style = ST_RIGHT;
	text = $STRD_bank_description_selectplayer;

	};

	class transfer_eingabe : RscEdit

	{

	idc = 2;
	x = 0.32;y = 0.27;
	w = 0.35;h = 0.04;
	text = "0";

	};

	class text4 : RscText

	{

	idc = 4;
	x = 0.47; y = 0.32;
	w = 0.12; h = 0.04;
	style = ST_RIGHT;
	text = $STRD_bank_description_steuern;

	};

	class money_steuern : RscText

	{

	idc = 5;
	x = 0.59; y = 0.32;
	w = 0.08; h = 0.04;
	text = "$";

	};

	class submit : RscButton

	{

	idc = 10;
	x = 0.39; y = 0.37;
	w = 0.20; h = 0.04;
	text = $STRD_bank_description_submit;

	};

	class text5 : RscText

	{

	x = 0.32; y = 0.58;
	w = 0.35; h = 0.04;
	style = ST_CENTER;
	text = $STRD_bank_description_withdraw;

	};

	class withdraw_eingabe : RscEdit

	{

	idc = 6;
	x = 0.32; y = 0.63;
	w = 0.35; h = 0.04;
	text = "0";

	};

	class withdraw_submit : RscButton

	{

	idc = 11;
	x = 0.39; y = 0.73;
	w = 0.20; h = 0.04;
	text = $STRD_bank_description_submit;

	};

	class cancel : RscButton

	{

	x = 0.39; y = 0.82;
	w = 0.20; h = 0.04;
	text = $STRD_bank_description_cancel;
	action = "closedialog 0";

	};

	class trennlinie : RscText

	{

	x = 0.32; y = 0.54;
	w = 0.35; h = 0.01;
	style = ST_FRAME;

	};

	class text_inventarmoney : RscText

	{

	x = 0.32; y = 0.44;
	w = 0.37; h = 0.04;
	idc = 101;
	style = ST_LEFT;
	text = "";

	};

	class text_accountmoney : RscText

	{

	x = 0.32; y = 0.49;
	w = 0.37; h = 0.04;
	idc = 102;
	style = ST_LEFT;
	text = "";

	};
	*/

	class dummybutton : RscDummy {idc = 1003;};

};