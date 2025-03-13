class spawn_dialog {
	idd = 1600;
	movingEnable = true;
	controlsBackground[] = {spawn_background,spawn_background_frame,spawn_locations_frame};
	objects[] = { };
	controls[] = {
		spawn_locations,
		spawn_map,
		spawn_spawn,
		spawn_lobby
	};

	class spawn_background: RscBackground
	{
		idc = 1605;
		x = 0.278516 * safezoneW + safezoneX;
		y = 0.255 * safezoneH + safezoneY;
		w = 0.459375 * safezoneW;
		h = 0.56 * safezoneH;
	};
	class spawn_background_frame: RscBgRahmen
	{
		idc = 1606;
		text = "Choose A Spawn Location";
		x = 0.278516 * safezoneW + safezoneX;
		y = 0.255 * safezoneH + safezoneY;
		w = 0.459375 * safezoneW;
		h = 0.56 * safezoneH;
	};
	class spawn_locations: RscListbox
	{
		idc = 1607;
		onLBSelChanged = "[_this select 1] call set_minimap_pos;";
		x = 0.286719 * safezoneW + safezoneX;
		y = 0.2725 * safezoneH + safezoneY;
		w = 0.123047 * safezoneW;
		h = 0.42 * safezoneH;
	};
	class spawn_locations_frame: RscBgRahmen
	{
		idc = 1608;
		onLBSelChanged = "[_this select 1] call set_minimap_pos;";
		x = 0.286719 * safezoneW + safezoneX;
		y = 0.2725 * safezoneH + safezoneY;
		w = 0.123047 * safezoneW;
		h = 0.42 * safezoneH;
	};
	class spawn_map: RscMapControl
	{
		idc = 1601;
		x = 0.417969 * safezoneW + safezoneX;
		y = 0.2725 * safezoneH + safezoneY;
		w = 0.311719 * safezoneW;
		h = 0.525 * safezoneH;
	};
	class spawn_spawn: RscButton
	{
		idc = 1609;
		text = "Spawn Here";
		action = "[(lbData[1607,(lbCurSel 1607)])] spawn spawn_select";
		x = 0.286719 * safezoneW + safezoneX;
		y = 0.71 * safezoneH + safezoneY;
		w = 0.123047 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class spawn_lobby: RscButton
	{
		idc = 1610;
		text = "To Lobby";
		action = "failMission ""END1"";";
		x = 0.286719 * safezoneW + safezoneX;
		y = 0.7625 * safezoneH + safezoneY;
		w = 0.123047 * safezoneW;
		h = 0.035 * safezoneH;
	};
};