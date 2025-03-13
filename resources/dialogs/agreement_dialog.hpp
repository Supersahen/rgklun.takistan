class agreement_dialog {
	idd = 1200;
	movingEnable = true;
	controlsBackground[] = {agreement_background, agreement_background_frame};
	objects[] = { };
	controls[] = {button_accept, button_decline, agreement_text, agreement_link};

	class agreement_background: RscBackground
	{
		idc = 1800;
		x = 0.385156 * safezoneW + safezoneX;
		y = 0.395 * safezoneH + safezoneY;
		w = 0.180469 * safezoneW;
		h = 0.385 * safezoneH;
	};

	class agreement_background_frame: RscBgRahmen
	{
		idc = 1800;
		text = "Police Agreement";
		x = 0.385156 * safezoneW + safezoneX;
		y = 0.395 * safezoneH + safezoneY;
		w = 0.180469 * safezoneW;
		h = 0.385 * safezoneH;
	};
	class button_accept: RscButtonNice
	{
		idc = 1600;
		text = "Accept";
		action = "police_agreement = true";
		x = 0.393359 * safezoneW + safezoneX;
		y = 0.7275 * safezoneH + safezoneY;
		w = 0.0738281 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class button_decline: RscButtonNice
	{
		idc = 1601;
		text = "Decline";
		action = "failMission ""END1"";";
		x = 0.483594 * safezoneW + safezoneX;
		y = 0.7275 * safezoneH + safezoneY;
		w = 0.0738281 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class agreement_text: RscStructuredText
	{
		idc = 1000;
		text = "Agreement";
		x = 0.393359 * safezoneW + safezoneX;
		y = 0.4125 * safezoneH + safezoneY;
		w = 0.164062 * safezoneW;
		h = 0.2275 * safezoneH;
	};
	class agreement_link: RscEdit
	{
		idc = 1001;
		text = "http://www.rise-gaming.com/police-agreement/";
		x = 0.393359 * safezoneW + safezoneX;
		y = 0.6575 * safezoneH + safezoneY;
		w = 0.164062 * safezoneW;
		h = 0.035 * safezoneH;
	};
};
