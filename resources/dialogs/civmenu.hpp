class civmenu {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {
		button_disarm, 
		button_drugs, 
		button_arrest,
		button_restrain,  
		button_ticket, 
		cancel, 
		button_heal, 
		button_inventarsearch, 
		button_licenses, 
		button_drag,
		dummybutton
	};
	
	onMouseMoving = "sliderSetRange [3, 1, 25]; sliderSetSpeed [3, 1, 5];sliderSetRange [21, 1, 100]; sliderSetSpeed [21, 1, 5];";

	class DLG_BACK1: RscBackground {
		x = 0.40; y = 0.25;
		w = 0.22; h = 0.73;
	};
	
	class background : RscBgRahmen {
		x = 0.40; y = 0.25;
		w = 0.22; h = 0.73;
		text = $STRD_description_civmenu_header;
	};
	
	class button_disarm : RscButtonNice {
		idc = 1;
		x = 0.41; y = 0.28;
		w = 0.20; h = 0.04;
		text = "Disarm";
		action = "[player, civ_player_variable] call interact_disarm; closedialog 0";
	};
	
	class button_drugs : RscButtonNice {
		idc = 2;
		x = 0.41; y = 0.33;
		w = 0.20;h = 0.04;
		text = "Search"; 
		action = "[player, civ_player_variable] call interact_search_player; closedialog 0";
	};
	
	class button_arrest : RscButtonNice {
		idc = 5;
		x = 0.41; y = 0.38;
		w = 0.20; h = 0.04;
		text = $STRD_description_civmenu_arrest;
		action = "[""police_arrest""] spawn dialog_handler; closedialog 0;";
	};
	
	class button_restrain : RscButtonNice {
		idc = 6;
		x = 0.41; y = 0.43;
		w = 0.20; h = 0.04;
		text = "Restrain/Release"; 
		action = "[player, civ_player_variable] call interact_toggle_restrains; closedialog 0";
	};	
	class button_ticket : RscButtonNice {
		x = 0.41; y = 0.48;
		w = 0.20; h = 0.04;
		text = "Issue Ticket";
		action = "[""ticket_menu""] spawn dialog_handler; closedialog 0";
	};
	
	class button_heal : RscButtonNice {
		idc = 13;
		x = 0.41; y = 0.53;
		w = 0.20; h = 0.04;
		text = $STRD_description_civmenu_heal; 
		action = "[player, civ_player_variable] call interact_heal_player; closedialog 0";
	};
	
	class button_inventarsearch : RscButtonNice {
		idc = 14;
		x = 0.41; y = 0.58;
		w = 0.20; h = 0.04;
		text = "Check Inventory";
		action = "[player, civ_player_variable] call interact_check_inventory; closedialog 0";
	};
	class button_drag : RscButtonNice {
		idc = 15;
		x = 0.41; y = 0.63;
		w = 0.20; h = 0.04;
		text = "Drag | Release";
		action = "[civ_player_variable] call player_drag; closedialog 0";
	};	
	class button_licenses : RscButtonNice {
		idc = 16;
		x = 0.41; y = 0.68;
		w = 0.20; h = 0.04;
		text = "Check Licenses";
		action = "[player,civ_player_variable] call interact_check_licenses; closedialog 0";
	};
	class cancel : RscButtonNice {
		x = 0.41; y = 0.93;
		w = 0.20; h = 0.04;
		text = $STRD_description_cancel; 
		action = "closedialog 0";
	};
	
	class dummybutton : RscDummy {idc = 1006;};
};

class civmenu_esu {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {
		button_revive, 
		dummybutton
	};
	

	class DLG_BACK1: RscBackground {
		x = 0.40; y = 0.25;
		w = 0.22; h = 0.73;
	};
	
	class background : RscBgRahmen {
		x = 0.40; y = 0.25;
		w = 0.22; h = 0.73;
		text = $STRD_description_civmenu_header;
	};
	
	class button_revive : RscButtonNice {
		idc = 1;
		x = 0.41; y = 0.28;
		w = 0.20; h = 0.04;
		text = "Revive Player";
		action = "[civ_player_variable] spawn esu_revive_player; closedialog 0";
	};
	class cancel : RscButtonNice {
		x = 0.41; y = 0.93;
		w = 0.20; h = 0.04;
		text = $STRD_description_cancel; 
		action = "closedialog 0";
	};
	
	class dummybutton : RscDummy {idc = 1006;};
};


class civinteraktion {
	idd = -1;movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {button_steal, cancel, button_inventarsearch, dummybutton,button_Ziptie,button_drag_civ,button_blindfold};

	class DLG_BACK1: RscBackground {
		x = 0.40; y = 0.25;
		w = 0.22; h = 0.58;
	};
	
	class background : RscBgRahmen {
		x = 0.40; y = 0.25;
		w = 0.22; h = 0.58;
		text = $STRD_description_civmenu_header;
	
	};
	
	class button_steal : RscButtonNice {
		idc = 1; 
		x = 0.41; y = 0.28;
		w = 0.20; h = 0.04;
		text = "Rob Inventory";
		action = "[player, civ_player_variable] call interact_rob_inventory; closedialog 0";
	};
	
	class button_inventarsearch : RscButtonNice {
		idc = 14;
		x = 0.41; y = 0.33;
		w = 0.20; h = 0.04;
		text = "Check Inventory";
		action = "[player, civ_player_variable] call interact_check_inventory; closedialog 0";
	};
	class button_Ziptie : RscButtonNice{
		idc = 15;
		x = 0.41; y = 0.38;
		w = 0.20; h = 0.04;
		text = $STRD_description_civmenu_ZipTie;
		action = "[civ_player_variable ] spawn item_ziptie; closedialog 0";};
		
	class button_drag_civ : RscButtonNice{
		idc = 16;
		x = 0.41; y = 0.43;
		w = 0.20; h = 0.04;
		text = "Drag | Release";
		action = "[civ_player_variable] call player_drag; closedialog 0";};

	class button_blindfold : RscButtonNice{
		idc = 17;
		x = 0.41; y = 0.48;
		w = 0.20; h = 0.04;
		text = "Toggle Blindfold";
		action = "[civ_player_variable] spawn player_blindfold_handler; closedialog 0";};
		
	class cancel : RscButtonNice {
		x = 0.41; y = 0.78;
		w = 0.20; h = 0.04; 
		text = $STRD_description_cancel;          
		action = "closedialog 0";
	};
	
	class dummybutton : RscDummy {
		idc = 1006;
	};

};

class civmenu_arrest {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {background_main,background_main_frame, background_reasons,background_reasons_frame};
	objects[] = { };
	controls[] = {
			button_charge_add,
			button_charge_remove,
			reason_select,
			button_arrest,
			button_cancel,
			reason_header,
			reasons_list
		};
	class background_main: RscBackground
	{
		idc = 1800;
		x = 0.393359 * safezoneW + safezoneX;
		y = 0.29 * safezoneH + safezoneY;
		w = 0.13125 * safezoneW;
		h = 0.4375 * safezoneH;
	};	
	class background_main_frame: RscBgRahmen
	{
		idc = 1800;
		text = "RGPD Booking";
		x = 0.393359 * safezoneW + safezoneX;
		y = 0.29 * safezoneH + safezoneY;
		w = 0.13125 * safezoneW;
		h = 0.4375 * safezoneH;
	};
	class background_reasons: RscBackground
	{
		idc = 1801;
		x = 0.532812 * safezoneW + safezoneX;
		y = 0.29 * safezoneH + safezoneY;
		w = 0.106641 * safezoneW;
		h = 0.4375 * safezoneH;
	};
	class background_reasons_frame: RscBgRahmen
	{
		idc = 1801;
		text = "Reasons";
		x = 0.532812 * safezoneW + safezoneX;
		y = 0.29 * safezoneH + safezoneY;
		w = 0.106641 * safezoneW;
		h = 0.4375 * safezoneH;
	};
	class button_charge_remove: RscButtonNice
	{
		idc = 9;
		text = "Remove Charge";
		action = "[lbData [3, (lbCurSel 3)]] call arrest_remove_charge;";
		x = 0.401563 * safezoneW + safezoneX;
		y = 0.43 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
	};
	
	class button_charge_add : RscButtonNice
	{
		idc = 8;
		text = "Add Charge";
		action = "[lbData [3, (lbCurSel 3)]] call arrest_add_charge;";
		x = 0.401563 * safezoneW + safezoneX;
		y = 0.3425 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
	};
	
	class reason_select: RscCombo
	{
		idc = 3;
		x = 0.401563 * safezoneW + safezoneX;
		y = 0.5175 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.035 * safezoneH;
	};
	
	class button_arrest: RscButtonNice
	{
		idc = 5;
		text = "Book Player";
		action = "[player,civ_player_variable] call interact_arrest_handler";
		x = 0.409766 * safezoneW + safezoneX;
		y = 0.6225 * safezoneH + safezoneY;
		w = 0.0984375 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class button_cancel: RscButtonNice
	{
		idc = 6;
		text = "Cancel";
		action = "closedialog 0";
		x = 0.409766 * safezoneW + safezoneX;
		y = 0.675 * safezoneH + safezoneY;
		w = 0.0984375 * safezoneW;
		h = 0.035 * safezoneH;
	};
	class reason_header: RscText
	{
		idc = 1002;
		text = "Charges";
		style = ST_CENTER;
		x = 0.401563 * safezoneW + safezoneX;
		y = 0.4825 * safezoneH + safezoneY;
		w = 0.114844 * safezoneW;
		h = 0.0175 * safezoneH;
	};
	class reasons_list: RscListbox
	{
		idc = 7;
		x = 0.541016 * safezoneW + safezoneX;
		y = 0.3075 * safezoneH + safezoneY;
		w = 0.0902344 * safezoneW;
		h = 0.4025 * safezoneH;
	};
};