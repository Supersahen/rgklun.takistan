
/*

	disableSerialization;
	uiSleep 3;
	1001 cutRsc ["hud_notification","PLAIN DOWN",10];

*/


class hud_notification {
	idd = 9999;
    fadeout=0;
    fadein=0;
	duration = 20;
	name= "hud_notification";
	onLoad = "uiNamespace setVariable ['hud_notification', _this select 0]";

	class controlsBackground {
		class message_background: RscPicture
		{
			idc = 1800;
			text = "resources\images\notification.paa";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.01 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.07 * safezoneH;
		};
		class message_text: RscStructuredText
		{
			idc = 1000;
			text = "";
			style = ST_CENTER;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.0325 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.07 * safezoneH;
		};	
	};
};
/*
// Small
class message_background: RscFrame
{
	idc = 1800;
	x = 0.319531 * safezoneW + safezoneX;
	y = 0.01 * safezoneH + safezoneY;
	w = 0.360937 * safezoneW;
	h = 0.07 * safezoneH;
};
class message_text: RscText
{
	idc = 1000;
	text = "Test";
	x = 0.327734 * safezoneW + safezoneX;
	y = 0.0275 * safezoneH + safezoneY;
	w = 0.352734 * safezoneW;
	h = 0.035 * safezoneH;
};



// Large
class message_background: RscFrame
{
	idc = 1800;
	x = 0.319531 * safezoneW + safezoneX;
	y = 0.01 * safezoneH + safezoneY;
	w = 0.344531 * safezoneW;
	h = 0.14 * safezoneH;
};
class message_text: RscText
{
	idc = 1000;
	text = "Test";
	x = 0.327734 * safezoneW + safezoneX;
	y = 0.0275 * safezoneH + safezoneY;
	w = 0.328125 * safezoneW;
	h = 0.105 * safezoneH;
};
