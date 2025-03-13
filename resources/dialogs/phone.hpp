

class RGPhone {

	idd = 90000;
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {

		class MainBackground:RscPictureKeepAspect {
			idc = -1;
			text = "resources\images\phone\phone.paa";
			colorBackground[] = {0, 0, 0, 0};
			x = 0;
			y = -0.15;
			w = 1;
			h = 1.3;
		};

	};

	class controls
	{

		class TextTime : RscStructuredText
		{
			idc = 90035;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0; y = 0.165;
			w = 1; h = 0.05;
		};

		class TextStatusLeft : RscStructuredText
		{
			idc = 90036;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0.5 - (0.08 * 2) - 0.005; y = 0.165;
			w = 0.3; h = 0.05;
		};

		class TextStatusRight : RscStructuredText
		{
			idc = 90037;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0.34; y = 0.165;
			w = 1 - (0.34 * 2) - 0.02; h = 0.05;
			class Attributes {
				align = "right";
			};
		};

		class IconSyncData : RscStructuredText {
			idc = 90010;
			x = 0.49 - (0.098 * 2);
			y = 1.102 - 0.28;
			w = 0.11;
			h = 0.17;
		};

		class IconMoney : RscStructuredText {
			idc = 90015;
			x = 0.471 - (0.08 * 1);
			y = 1.102 - 0.28;
			w = 0.11;
			h = 0.17;
		};

		class IconMessage : RscStructuredText {
			idc = 90020;
			x = 0.49;
			y = 1.102 - 0.28;
			w = 0.11;
			h = 0.17;
		};

		class IconInventory : RscStructuredText {
			idc = 90025;
			x = 0.51 + (0.08 * 1);
			y = 1.102 - 0.28;
			w = 0.11;
			h = 0.17;
		};

		class IconOne : RscStructuredText {
			idc = 90500;
			x = 0.49 - (0.098 * 2);
			y = 0.055;
			w = 0.11;
			h = 0.17;
		};

		class IconTwo : RscStructuredText {
			idc = 90501;
			x = 0.471 - (0.08 * 1);
			y = 0.055;
			w = 0.11;
			h = 0.17;
		};

		class IconThree : RscStructuredText {
			idc = 90502;
			x = 0.49;
			y = 0.055;
			w = 0.11;
			h = 0.17;
		};

		class IconFour : RscStructuredText {
			idc = 90503;
			x = 0.51 + (0.08 * 1);
			y = 0.055;
			w = 0.11;
			h = 0.17;
		};

		class IconFive : RscStructuredText {
			idc = 90504;
			x = 0.49 - (0.098 * 2);
			y = 0.22;
			w = 0.11;
			h = 0.17;
		};

		class IconSix : RscStructuredText {
			idc = 90505;
			x = 0.471 - (0.08 * 1);
			y = 0.22;
			w = 0.11;
			h = 0.17;
		};

		class IconSeven : RscStructuredText {
			idc = 90506;
			x = 0.49;
			y = 0.22;
			w = 0.11;
			h = 0.17;
		};

		class IconEight : RscStructuredText {
			idc = 90507;
			x = 0.51 + (0.08 * 1);
			y = 0.22;
			w = 0.11;
			h = 0.17;
		};

		class IconNine : RscStructuredText {
			idc = 90508;
			x = 0.49 - (0.098 * 2);
			y = 0.385;
			w = 0.11;
			h = 0.17;
		};		
		class IconTen : RscStructuredText {
			idc = 90509;
			x = 0.471 - (0.08 * 1);
			y = 0.385;
			w = 0.11;
			h = 0.17;
		};		
		class IconEleven : RscStructuredText {
			idc = 90510;
			x = 0.49;
			y = 0.385;
			w = 0.11;
			h = 0.17;
		};		
		class IconTwelve : RscStructuredText {
			idc = 90511;
			x = 0.51 + (0.08 * 1);
			y = 0.385;
			w = 0.11;
			h = 0.17;
		};		
		class IconThirteen : RscStructuredText {
			idc = 90512;
			x = 0.49 - (0.098 * 2);
			y = 0.55;
			w = 0.11;
			h = 0.17;
		};		
		class IconFourteen : RscStructuredText {
			idc = 90513;
			x = 0.471 - (0.08 * 1);
			y = 0.55;
			w = 0.11;
			h = 0.17;
		};		
		class IconFithteen : RscStructuredText {
			idc = 90514;
			x = 0.49;
			y = 0.55;
			w = 0.11;
			h = 0.17;
		};		
		class IconSixteen : RscStructuredText {
			idc = 90515;
			x = 0.51 + (0.08 * 1);
			y = 0.55;
			w = 0.11;
			h = 0.17;
		};

		class ButtonClose : RscButtonPhone {
			idc = -1;
			shortcuts[] = {0x00050000 + 2};
			text = "";
			onButtonClick = "closeDialog 0;";
			tooltip = "Close your phone";
			x = 0.5 - ((6.25 / 40) / 2);
			y = 1;
			w = (6.25 / 40);
			h = (6.25 / 40);
		};

		class ButtonMessages : RscButtonPhone {
			idc = 90040;
			text = "";
			onButtonClick = "[] call phone_sms";
			tooltip = "Send text messages to players";
			x = 0.49;
			y = 1.102 - 0.28;
			w = 0.11;
			h = 0.17;
		};

		class Button911 : RscButtonPhone {
			idc = 90045;
			text = "";
			onButtonClick = "[] call phone_emergency";
			tooltip = "Call 911";
			x = 0.49 - (0.098 * 2);
			y = 1.102 - 0.28;
			w = 0.11;
			h = 0.17;
		};

		class ButtonInventory : RscButtonPhone {
			idc = 90050;
			text = "";
			onButtonClick = "[player] spawn interact_inventory_menu;";
			tooltip = "View and use items in your inventory";
			x = 0.51 + (0.08 * 1);
			y = 1.102 - 0.28;
			w = 0.11;
			h = 0.17;
		};

		class ButtonContracts : RscButtonPhone {
			idc = 90045;
			text = "";
			onButtonClick = "[] call phone_contracting";
			tooltip = "Hire a PMC";
			x = 0.471 - (0.08 * 1);
			y = 1.102 - 0.28;
			w = 0.11;
			h = 0.17;
		};

		class ButtonOne : RscButtonPhone {
			idc = 90600;
			text = "";
			onButtonClick = "call compile (rise_phone_actions select 0)";
			x = 0.49 - (0.098 * 2);
			y = 0.055;
			w = 0.11;
			h = 0.17;
		};

		class ButtonTwo : RscButtonPhone {
			idc = 90601;
			text = "";
			onButtonClick = "call compile (rise_phone_actions select 1)";
			x = 0.471 - (0.08 * 1);
			y = 0.055;
			w = 0.11;
			h = 0.17;
		};

		class ButtonThree : RscButtonPhone {
			idc = 90602;
			text = "";
			onButtonClick = "call compile (rise_phone_actions select 2)";
			x = 0.49;
			y = 0.055;
			w = 0.11;
			h = 0.17;
		};

		class ButtonFour : RscButtonPhone {
			idc = 90603;
			text = "";
			onButtonClick = "call compile (rise_phone_actions select 3)";
			x = 0.51 + (0.08 * 1);
			y = 0.055;
			w = 0.11;
			h = 0.17;
		};

		class ButtonFive : RscButtonPhone {
			idc = 90604;
			text = "";
			onButtonClick = "call compile (rise_phone_actions select 4)";
			x = 0.49 - (0.098 * 2);
			y = 0.22;
			w = 0.11;
			h = 0.17;
		};

		class ButtonSix : RscButtonPhone {
			idc = 90605;
			text = "";
			onButtonClick = "call compile (rise_phone_actions select 5)";
			x = 0.471 - (0.08 * 1);
			y = 0.22;
			w = 0.11;
			h = 0.17;
		};

		class ButtonSeven : RscButtonPhone {
			idc = 90606;
			text = "";
			onButtonClick = "call compile (rise_phone_actions select 6)";
			x = 0.49;
			y = 0.22;
			w = 0.11;
			h = 0.17;
		};

		class ButtonEight : RscButtonPhone {
			idc = 90607;
			text = "";
			onButtonClick = "call compile (rise_phone_actions select 7)";
			x = 0.51 + (0.08 * 1);
			y = 0.22;
			w = 0.11;
			h = 0.17;
		};

		class ButtonNine : RscButtonPhone {
			idc = 90608;
			text = "";
			onButtonClick = "call compile (rise_phone_actions select 8)";
			x = 0.49 - (0.098 * 2);
			y = 0.385;
			w = 0.11;
			h = 0.17;
		};
		class ButtonTen : RscButtonPhone {
			idc = 90609;
			text = "";
			onButtonClick = "call compile (rise_phone_actions select 9)";
			x = 0.471 - (0.08 * 1);
			y = 0.385;
			w = 0.11;
			h = 0.17;
		};		
		class ButtonEleven : RscButtonPhone {
			idc = 90610;
			text = "";
			onButtonClick = "call compile (rise_phone_actions select 10)";
			x = 0.49;
			y = 0.385;
			w = 0.11;
			h = 0.17;
		};		
		class ButtonTwelve : RscButtonPhone {
			idc = 90611;
			text = "";
			onButtonClick = "call compile (rise_phone_actions select 11)";
			x = 0.51 + (0.08 * 1);
			y = 0.385;
			w = 0.11;
			h = 0.17;
		};		
		class ButtonThirteen : RscButtonPhone {
			idc = 90612;
			text = "";
			onButtonClick = "call compile (rise_phone_actions select 12)";
			x = 0.49 - (0.098 * 2);
			y = 0.55;
			w = 0.11;
			h = 0.17;
		};		
		class ButtonFourteen : RscButtonPhone {
			idc = 90613;
			text = "";
			onButtonClick = "call compile (rise_phone_actions select 13)";
			x = 0.471 - (0.08 * 1);
			y = 0.55;
			w = 0.11;
			h = 0.17;
		};		
		
		class ButtonFithteen : RscButtonPhone {
			idc = 90614;
			text = "";
			onButtonClick = "call compile (rise_phone_actions select 14)";
			x = 0.49;
			y = 0.55;
			w = 0.11;
			h = 0.17;
		};		
		
		class ButtonSixteen : RscButtonPhone {
			idc = 90615;
			text = "";
			onButtonClick = "call compile (rise_phone_actions select 15)";
			x = 0.51 + (0.08 * 1);
			y = 0.55;
			w = 0.11;
			h = 0.17;
		};

	};
};
class RGPhone_sms
{
	name=Phone;
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {  sms_background };
	objects[] = { };
	controls[] = { send_pic, send_button,cancel_button,selectedplayer,message};



	class sms_background: RscPicture
	{
		moving = 1;
		type = CT_STATIC;
		style = ST_PICTURE;

		idc = 1200;
		text = "resources\images\phone\messaging_screen.paa";
		x = 0.41392 * safezoneW + safezoneX;
		y = 0.296388 * safezoneH + safezoneY;
		w = 0.152237 * safezoneW;
		h = 0.586538 * safezoneH;
	};

	class selectedplayer: RscComboPhone
	{
		idc = 2;
		x = 0.44 * safezoneW + safezoneX;
		y = 0.420 * safezoneH + safezoneY;
		w = 0.09 * safezoneW;
		h = 0.03 * safezoneH;
	};

	class message: RscEditPhone
	{
		idc = 1;
		text= "Type message here";
		x = 0.4245 * safezoneW + safezoneX;
		y = 0.4528 * safezoneH + safezoneY;
		w = 0.131 * safezoneW;
		h = 0.158 * safezoneH;
	};
	class send_pic: RscPicture
	{
		idc = 1204;
		text = "resources\images\phone\send.paa";
		x = 0.525 * safezoneW + safezoneX;
		y = 0.781 * safezoneH + safezoneY;
		w = 0.0285 * safezoneW;
		h = 0.025 * safezoneH;
	};
	class send_button : RscButtonPhone
	{
		action = "";
		idc = 3;
		x = 0.525 * safezoneW + safezoneX;
		y = 0.781 * safezoneH + safezoneY;
		w = 0.0285 * safezoneW;
		h = 0.025 * safezoneH;
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
	};

	class cancel_button : RscButtonPhone
	{
		action = "closedialog 0";
		idc = 1603;
		x = 0.525 * safezoneW + safezoneX;
		y = 0.390 * safezoneH + safezoneY;
		w = 0.030 * safezoneW;
		h = 0.023 * safezoneH;
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
	};
};
class RG_Taki_Shop
{
	name=Takishop;
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {  taki_shop_menu };
	objects[] = { };
	controls[] = {quantity1, quantity2, quantity3, quantity4,buy1,buy2,buy3,buy4};
	class taki_shop_menu: RscPicture
	{
		moving = 1;
		type = CT_STATIC;
		style = ST_PICTURE;
		idc = 1200;
		text = "resources\images\phone\phone_takishop_menu.paa";
		x = 0.41392 * safezoneW + safezoneX;
		y = 0.296388 * safezoneH + safezoneY;
		w = 0.152237 * safezoneW;
		h = 0.586538 * safezoneH;
	};
	class quantity1: RscEditPhone
	{
		idc = 1;
		text= "1";
		x = 0.47 * safezoneW + safezoneX;
		y = 0.5325 * safezoneH + safezoneY;
		w = 0.0265 * safezoneW;
		h = 0.013 * safezoneH;
	};
	class quantity2: RscEditPhone
	{
		idc = 2;
		text= "1";
		x = 0.47 * safezoneW + safezoneX;
		y = 0.630 * safezoneH + safezoneY;
		w = 0.0265 * safezoneW;
		h = 0.013 * safezoneH;
	};
	class quantity3: RscEditPhone
	{
		idc = 3;
		text= "1";
		x = 0.47 * safezoneW + safezoneX;
		y = 0.7172 * safezoneH + safezoneY;
		w = 0.0265 * safezoneW;
		h = 0.013 * safezoneH;
	};
	class quantity4: RscEditPhone
	{
		idc = 4;
		text= "1";
		x = 0.47 * safezoneW + safezoneX;
		y = 0.7932 * safezoneH + safezoneY;
		w = 0.0265 * safezoneW;
		h = 0.013 * safezoneH;
	};

	class buy1: RscButtonPhone
	{
		idc = 5;
		action = "[""repairkit"",ctrlText 1] spawn phone_shop_buy;";
		x = 0.525 * safezoneW + safezoneX;
		y = 0.5325 * safezoneH + safezoneY;
		w = 0.0265 * safezoneW;
		h = 0.013 * safezoneH;
	};
	class buy2: RscButtonPhone
	{
		idc = 6;
		action = "[""medkit"",ctrlText 2] spawn phone_shop_buy;";
		x = 0.525 * safezoneW + safezoneX;
		y = 0.630 * safezoneH + safezoneY;
		w = 0.0265 * safezoneW;
		h = 0.013 * safezoneH;
	};
	class buy3: RscButtonPhone
	{
		idc = 7;
		action = "[""kanister"",ctrlText 3] spawn phone_shop_buy;";
		x = 0.525 * safezoneW + safezoneX;
		y = 0.7172 * safezoneH + safezoneY;
		w = 0.0265 * safezoneW;
		h = 0.013 * safezoneH;
	};
	class buy4: RscButtonPhone
	{
		idc = 8;
		action = "[""lockpick"",ctrlText 4] spawn phone_shop_buy;";
		x = 0.525 * safezoneW + safezoneX;
		y = 0.7932 * safezoneH + safezoneY;
		w = 0.0265 * safezoneW;
		h = 0.013 * safezoneH;
	};
};




