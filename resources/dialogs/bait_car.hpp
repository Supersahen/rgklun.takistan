class bait_car_dialog {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1_bait, background_bait};
	objects[] = { };
	controls[] = {bait_activate, bait_deactivate, bait_cut, bait_install};


class DLG_BACK1_bait: RscBackground
{
	idc = 1800;
	x = 0.344141 * safezoneW + safezoneX;
	y = 0.4125 * safezoneH + safezoneY;
	w = 0.311719 * safezoneW;
	h = 0.1575 * safezoneH;
};
class background_bait: RscBgRahmen
{
	text = "Bait Car 2.0";
	idc = 1801;
	x = 0.344141 * safezoneW + safezoneX;
	y = 0.4125 * safezoneH + safezoneY;
	w = 0.311719 * safezoneW;
	h = 0.1575 * safezoneH;
};
class bait_activate: RscButton
{
	idc = 1600;
	text = "Activate";
	x = 0.352344 * safezoneW + safezoneX;
	y = 0.43 * safezoneH + safezoneY;
	w = 0.0902344 * safezoneW;
	h = 0.0525 * safezoneH;
	action = "call bait_activate ;closeDialog 0";

};
class bait_deactivate: RscButton
{
	idc = 1601;
	text = "Deactivate";
	x = 0.352344 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0902344 * safezoneW;
	h = 0.0525 * safezoneH;
	action = "call bait_deactivate ;closeDialog 0";
};
class bait_cut: RscButton
{
	idc = 1602;
	text = "Cut Tracker";
	x = 0.557422 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0902344 * safezoneW;
	h = 0.0525 * safezoneH;
	action = "call bait_cut ;closeDialog 0";
};
class bait_install: RscButton
{
	idc = 1603;
	text = "Install";
	x = 0.557422 * safezoneW + safezoneX;
	y = 0.43 * safezoneH + safezoneY;
	w = 0.0902344 * safezoneW;
	h = 0.0525 * safezoneH;
	action = "call bait_install ;closeDialog 0";
};
};
