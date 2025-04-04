class civmenu_un {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {
		button_disarm, 
		button_drugs, 
		arrest_text, 
		arrest_slider,
		button_arrest_un,
		button_restrain_un, 
		cancel, 
		button_heal, 
		button_inventarsearch, 
		button_drag,
		dummybutton_un
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
	
	class button_disarm : RscButton {
		idc = 1;
		x = 0.41; y = 0.28;
		w = 0.20; h = 0.04;
		text = "Disarm";
		action = "[player, civ_player_variable] call interact_disarm; closedialog 0";
	};
	
	class button_drugs : RscButton {
		idc = 2;
		x = 0.41; y = 0.33;
		w = 0.20;h = 0.04;
		text = "Search"; 
		action = "[player, civ_player_variable] call interact_search_player; closedialog 0";
	};
	
	class arrest_text : RscText {
		idc = 4;
		x = 0.41; y = 0.38;
		w = 0.20; h = 0.04;
		style = ST_CENTER;
		text = "Prison time (min/s)";
	};
	
	class arrest_slider : RscSliderH {
		idc = 3;
		x = 0.41; y = 0.43;
		w = 0.20; h = 0.03;
		onSliderPosChanged = "ctrlSetText [4,  format[""Prison time (%1 min/s)"", (round(_this select 1))]];";
	};
	
	
	class button_arrest_un : RscButton {
		idc = 5;
		x = 0.41; y = 0.48;
		w = 0.20; h = 0.04;
		text = "Military Arrest";
		action = "[""police_arrest""] spawn dialog_handler; closedialog 0;";
	};
	
	class button_restrain_un : RscButton {
		idc = 6;
		x = 0.41; y = 0.53;
		w = 0.20; h = 0.04;
		text = "Restrain/Release"; 
		action = "[player, civ_player_variable] call interact_toggle_restrains; closedialog 0";
	};

	
	class button_heal : RscButton {
		idc = 13;
		x = 0.41; y = 0.58;
		w = 0.20; h = 0.04;
		text = $STRD_description_civmenu_heal; 
		action = "[player, civ_player_variable] call interact_heal_player; closedialog 0";
	};
	
	class button_inventarsearch : RscButton {
		idc = 14;
		x = 0.41; y = 0.63;
		w = 0.20; h = 0.04;
		text = "Check Inventory";
		action = "[player, civ_player_variable] call interact_check_inventory; closedialog 0";
	};
	class button_drag : RscButton{
		idc = 15;
		x = 0.41; y = 0.68;
		w = 0.20; h = 0.04;
		text = "Drag | Release";
		action = "[civ_player_variable] call player_drag; closedialog 0";};
	
	class cancel : RscButton {
		x = 0.41; y = 0.93;
		w = 0.20; h = 0.04;
		text = $STRD_description_cancel; 
		action = "closedialog 0";
	};
	
	class dummybutton_un : RscDummy {idc = 1006;};
};