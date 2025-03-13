class medical_respawn_dialog {
	idd = 1200;
	movingEnable = true;
	controlsBackground[] = {medical_background, medical_background_frame};
	objects[] = { };
	controls[] = {medical_respawn_button, medical_esu_text, medical_esu_distance, medical_timer};

	class medical_background: RscBackground
	{
		idc = 1206;
		x = 0.417969 * safezoneW + safezoneX;
		y = 0.745 * safezoneH + safezoneY;
		w = 0.147656 * safezoneW;
		h = 0.28 * safezoneH;
	};	
	class medical_background_frame: RscBgRahmen
	{
		idc = 1205;
		x = 0.417969 * safezoneW + safezoneX;
		y = 0.745 * safezoneH + safezoneY;
		w = 0.147656 * safezoneW;
		h = 0.28 * safezoneH;
	};
	class medical_respawn_button: RscButton
	{
		idc = 1204;
		text = "Respawn";
		x = 0.434375 * safezoneW + safezoneX;
		y = 0.815 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class medical_esu_text: RscText
	{
		idc = 1202;
		font = "Zeppelin32";
		sizeEx = 0.032;
		style = ST_CENTER;
		text = "";
		x = 0.434375 * safezoneW + safezoneX;
		y = 0.8675 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class medical_esu_distance: RscText
	{
		idc = 1203;
		text = "";
		font = "Zeppelin32";
		sizeEx = 0.032;
		style = ST_CENTER;
		x = 0.434375 * safezoneW + safezoneX;
		y = 0.92 * safezoneH + safezoneY;
		w = 0.106641 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class medical_timer: RscStructuredText
	{
		idc = 1201;
		text = "";
		sizeEx = 0.032;
		style = ST_CENTER;
		x = 0.434375 * safezoneW + safezoneX;
		y = 0.7625 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
	};

};
