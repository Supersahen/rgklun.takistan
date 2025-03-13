
#define hud_status_idc 3600

class RGHud {
	idd = -1;
    fadeout=0;
    fadein=0;
	duration = 20;
	name= "RGHud";
	onLoad = "uiNamespace setVariable ['RGHud', _this select 0]";

	class controlsBackground {
		class RGHud_Status:w_RscText
		{
			idc = hud_status_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.29 / SafeZoneW)));
            y = safeZoneY + (safeZoneH * (1 - (0.50 / SafeZoneH)));
			w = 0.29; h = 0.5;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
	};
};