
class Main
{
	name=Main;
	idd=-1;
	movingEnable=1;
	controlsBackground[]={commands_background,commands_background_frame,players_background,players_background_frame};
	objects[]={};
	controls[]={players_list,commands_list,command_activate,admin_input,refresh_players,filter_commands};
	
		class commands_background: RscBackground
		{
			idc = 1800;
			x = 0.294922 * safezoneW + safezoneX;
			y = 0.185 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.63 * safezoneH;
		};
		class commands_background_frame: RscBgRahmen
		{
			idc = 1800;
			text = "Commands";
			x = 0.294922 * safezoneW + safezoneX;
			y = 0.185 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.63 * safezoneH;
		};
		class players_background: RscBackground
		{
			idc = 1801;
			x = 0.524609 * safezoneW + safezoneX;
			y = 0.185 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.63 * safezoneH;
		};
		class players_background_frame: RscBgRahmen
		{
			idc = 1801;
			text = "Players";
			x = 0.524609 * safezoneW + safezoneX;
			y = 0.185 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.63 * safezoneH;
		};
		class commands_list: RscListbox
		{
			idc = 1000;
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.2025 * safezoneH + safezoneY;
			w = 0.164062 * safezoneW;
			h = 0.49 * safezoneH;
		};
		class refresh_players: RscButton
		{
			idc = 1600;
			text = "Refresh Players";
			action="[] call refresh_admin_players;";
			x = 0.542812 * safezoneW + safezoneX;
			y = 0.7625 * safezoneH + safezoneY;
			w = 0.147656 * safezoneW;
			h = 0.035 * safezoneH;
		};		
		class filter_commands: RscButton
		{
			idc = 1600;
			text = "Command Filter";
			action="if (admin_menu_filter) then {admin_menu_filter = false; player groupChat 'FILTER FALSE'; } else {admin_menu_filter = true; player groupChat 'FILTER TRUE';  }; closeDialog 0; [player] execvm 'adminconsollfill.sqf';";
			x = 0.542812 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.147656 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class players_list: RscListbox
		{
			idc = 2006;
			x = 0.532812 * safezoneW + safezoneX;
			y = 0.2025 * safezoneH + safezoneY;
			w = 0.164062 * safezoneW;
			h = 0.49 * safezoneH;
			onLBDblClick = "[] call admin_spectate";
		};
		class command_activate: RscButton
		{
			idc = 1600;
			text = "Activate Command";
			action="[player] spawn A_SCRIPT_ADMINMENUITEMS;";
			x = 0.311328 * safezoneW + safezoneX;
			y = 0.7625 * safezoneH + safezoneY;
			w = 0.147656 * safezoneW;
			h = 0.035 * safezoneH;
		};		
		class admin_input: RscEdit
		{
			idc = 2000;
			x = 0.311328 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.147656 * safezoneW;
			h = 0.035 * safezoneH;
		};
};

class dev_console 
{

	name=dev_console;
	idd=-1;
	movingEnable=1;
	controlsBackground[]={admin_players_background,admin_players_background_frame,admin_code_background,admin_code_background_frame};
	objects[]={};
	controls[]={admin_players_list,admin_players_list,button_self,button_all,button_player,button_close,admin_code};
	
	class admin_players_background: RscBackground
	{
		idc = 1801;
		x = 0.598437 * safezoneW + safezoneX;
		y = 0.255 * safezoneH + safezoneY;
		w = 0.13125 * safezoneW;
		h = 0.455 * safezoneH;
	};
	
	class admin_code_background: RscBackground
	{
		idc = 1800;
		x = 0.303125 * safezoneW + safezoneX;
		y = 0.255 * safezoneH + safezoneY;
		w = 0.287109 * safezoneW;
		h = 0.455 * safezoneH;
	};
	
	class admin_code_background_frame: RscBgRahmen
	{
		idc = 1800;
		text = "Code Editor";
		x = 0.303125 * safezoneW + safezoneX;
		y = 0.255 * safezoneH + safezoneY;
		w = 0.287109 * safezoneW;
		h = 0.455 * safezoneH;
	};
	class admin_players_background_frame: RscBgRahmen
	{
		idc = 1801;
		text = "Players";
		x = 0.598437 * safezoneW + safezoneX;
		y = 0.255 * safezoneH + safezoneY;
		w = 0.13125 * safezoneW;
		h = 0.455 * safezoneH;
	};	

	class admin_players_list: RscListbox
	{
		idc = 1500;
		x = 0.606641 * safezoneW + safezoneX;
		y = 0.2725 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.3675 * safezoneH;
	};
	class admin_code: dev_console_edit
	{
		idc = 1400;
		text = "Enter Code Here";
		x = 0.311328 * safezoneW + safezoneX;
		y = 0.2725 * safezoneH + safezoneY;
		w = 0.270703 * safezoneW;
		h = 0.3675 * safezoneH;
	};
	class button_self: RscButton
	{
		idc = 1600;
		text = "On Self";
		action = "call compile (ctrltext 1400)";
		x = 0.311328 * safezoneW + safezoneX;
		y = 0.6575 * safezoneH + safezoneY;
		w = 0.0738281 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class button_all: RscButton
	{
		idc = 1601;
		text = "On All";
		action = "[[], ""mp_compile_code"", [ctrlText 1400]] call mp_aware_me;";
		x = 0.409766 * safezoneW + safezoneX;
		y = 0.6575 * safezoneH + safezoneY;
		w = 0.0738281 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class button_player: RscButton
	{
		idc = 1602;
		text = "On Player";
		action = "[[(call compile lbData [1500, lbCurSel 1500])], ""mp_compile_code"", [ctrlText 1400]] call mp_aware_me;";
		x = 0.508203 * safezoneW + safezoneX;
		y = 0.6575 * safezoneH + safezoneY;
		w = 0.0738281 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class button_close: RscButton
	{
		idc = 1603;
		text = "Close Menu";
		action = "closedialog 0";
		x = 0.606641 * safezoneW + safezoneX;
		y = 0.6575 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
	};
};