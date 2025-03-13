#include "Awesome\Functions\constants.h"

class FacBgFrame {
	type=0;
	idc=-1;
	style=64;
	colorBackground[]={0.4, 0.4, 0.4, 0.75};
	colorText[]={1, 1, 1, 1};
	font="TahomaB";
	SizeEX=0.025;
	text="";
};

class factory_dialog {

	idd = factory_dialog_id;
	movingEnable = true;
	controlsBackground[] = {
		left_background, left_frame,
		right_background, right_frame
		
	};
	
	objects[] = { };
	controls[] = {
		items_list, 
		item_produced_label, item_produced_field,
		item_cost_label, item_cost_field,
		amount_label, amount_field,
		enqueue_button,
		create_button, 
		
		dummybutton,
		
		
		queue_list,
		in_production_label, in_production_field,
		in_production_eta_label, in_production_eta_field,
		dequeue_button,
		close_button,
		
		status_background1,
		status_frame1,
		status_field1,
		
		status_background2,
		status_frame2,
		status_field2
	};
				
	class left_background: Rscbackground {
		moving = 1;
		x = 0.30; y = 0.10;
		w = 0.39; h = 0.63;
	};
	
	class left_frame : RscBgRahmen {
		idc = factory_left_frame_id;
		moving = 1;
		x = 0.30; y = 0.10;
		w = 0.39; h = 0.63;
		text = "Factory Production";
	};

	class items_list : RscListBox {
		idc = factory_enqueue_list_id;
		x = 0.32; y = 0.14;
		w = 0.35; h = 0.30;
		onLBSelChanged = "_this call factory_update_enqueue_item;";
	};

	class item_produced_label : RscText {
		x = 0.32; y = 0.47;
		w = 0.13; h = 0.04;
		text = "Produced: ";
	};
	
	class item_produced_field: RscText {
		idc = factory_item_produced_field_id;
		x = 0.49; y = 0.47;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "0";
	};
	
	
	class item_cost_label : RscText {
		x = 0.32; y = 0.52;
		w = 0.13; h = 0.04;
		text = "Production cost: ";
	};
	
	class item_cost_field: RscText {
		idc = factory_item_cost_field_id;
		x = 0.49; y = 0.52;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "$0";
	};
	

	class amount_label : RscText {
		x = 0.32; y = 0.57;
		w = 0.13; h = 0.04;
		text = "Amount: ";
	};
	
	class amount_field_background : RscText {
		idc = factory_amount_field_id;
		x = 0.49; y = 0.57;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
	};
	
	class amount_field : RscEdit {
		idc = factory_amount_field_id;
		x = 0.49; y = 0.57;
		w = 0.18; h = 0.04;
		onKeyDown = "call factory_update_enqueue_item;";
		text = "1";
	};

	class enqueue_button : RscButton {
		idc = factory_enqueue_button_id;
		x = 0.32; y = 0.62;
		w = 0.35; h = 0.04;
		colorBackgroundDisabled[] = DISABLED_BUTTON_BACKGROUND;
		colorDisabled[] = DISABLED_BUTTON_TEXT;
		text = "Produce item";
	};
	
	class create_button : RscButton {
		idc = factory_create_button_id;
		x = 0.32; y = 0.67;
		w = 0.35; h = 0.04;
		colorBackgroundDisabled[] = DISABLED_BUTTON_BACKGROUND;
		colorDisabled[] = DISABLED_BUTTON_TEXT;
		text = "Create item";
	};


	
	
	class right_background: Rscbackground {
		moving = 1;
		x = 0.73; y = 0.10;
		w = 0.39; h = 0.63;
	};
	
	class right_frame : RscBgRahmen {
		idc = factory_right_frame_id;
		moving = 1;
		x = 0.73; y = 0.10;
		w = 0.39; h = 0.63;
		text = "Factory Production";
	};
	
	
	class queue_list : RscListBox {
		idc = factory_dequeue_list_id;
		x = 0.75; y = 0.14;
		w = 0.35; h = 0.30;
		onLBSelChanged = "_this call factory_update_dequeue_item;";
	};


	class in_production_label : RscText {
		x = 0.75; y = 0.47;
		w = 0.13; h = 0.04;
		text = "Production item: ";
	};
	
	
	class in_production_field : RscText {
		idc = factory_production_field_id;
		x = 0.92; y = 0.47;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "(none)";
	};
	
	
	class in_production_eta_label : RscText {
		x = 0.75; y = 0.52;
		w = 0.13; h = 0.04;
		text = "Production time: ";
	};
	
	class in_production_eta_field: RscText {
		idc = factory_production_eta_field_id;
		x = 0.92; y = 0.52;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "0";
	};
	
	class dequeue_button : RscButton {
		idc = factory_dequeue_button_id;
		x = 0.75; y = 0.62;
		w = 0.35; h = 0.04;
		colorBackgroundDisabled[] = DISABLED_BUTTON_BACKGROUND;
		colorDisabled[] = DISABLED_BUTTON_TEXT;
		text = "Cancel item";
	};
	
		
	class close_button : RscButton {
		x = 0.75; y = 0.67;
		w = 0.35; h = 0.04;
		colorBackgroundDisabled[] = DISABLED_BUTTON_BACKGROUND;
		colorDisabled[] = DISABLED_BUTTON_TEXT;
		text = "Close";
		action = "closeDialog 0;";
	};
	
	class status_frame1 : FacBgFrame {
		x = 0.30; y = 0.75;
		w = 0.82; h = 0.04;
	};

	class status_background1: RscBackground {
		moving = 1;
		x = 0.30; y = 0.75;
		w = 0.82; h = 0.04;
	};
	
	class status_field1 : RscText {
		idc = factory_status_field1_id;
		x = 0.30; y = 0.75;
		w = 0.82; h =  0.04;
		SizeEX=0.024;
		text = "";
	};
	
	

	class status_frame2 : FacBgFrame {
		x = 0.30; y = 0.81;
		w = 0.82; h = 0.04;
	};

	class status_background2: RscBackground {
		moving = 1;
		x = 0.30; y = 0.81;
		w = 0.82; h = 0.04;
	};
	
	class status_field2 : RscText {
		idc = factory_status_field2_id;
		x = 0.30; y = 0.81;
		w = 0.82; h =  0.04;
		SizeEX=0.024;
		text = "";
	};
	
	

	class dummybutton : RscDummy {idc = 1030;};

};


class itemkaufdialog {

	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, DLG_BACK2, background1, background2};
	objects[] = { };
	controls[] = {itemliste, itemeingabe, submit, cancel, weight, cancel2, submit2, itemeingabe2, itemliste2, text_inventargeld, dummybutton};

	onUnload = "call trunk_close;";
	
	class DLG_BACK1: RscBackground {
		x = 0.02; y = 0.08;
		w = 0.46; h = 0.64;
	};

	class DLG_BACK2: RscBackground {
		x = 0.51; y = 0.08;
		w = 0.46; h = 0.64;
	};

	class background1 : RscBgRahmen {
		x = 0.02; y = 0.08;
		w = 0.46; h = 0.64;
		text = $STRD_inv_description_itemmenu_title;
		idc = 91;
	};
	
	class background2 : RscBgRahmen {
		x = 0.51; y = 0.08;
		w = 0.46; h = 0.64;
		idc = 92;
		text = $STRD_inv_description_itemmenu_title2;
	};

	class itemliste : RscListBox {
		idc = 1;
		x = 0.04; y = 0.10;
		w = 0.42; h = 0.48;
	};

	class itemeingabe : RscEdit {
		idc = 2;
		x = 0.04; y = 0.60;
		w = 0.20; h = 0.04;
		text = "1";
	};

	class submit : RscButton {
		idc = 3;
		x = 0.25; y = 0.60;
		w = 0.20; h = 0.04;
	};

	class cancel : RscButton {
		x = 0.25; y = 0.65;
		w = 0.20; h = 0.04;

		text = $STRD_inv_description_buyitem_close;
		action = "closedialog 0";
	};

	class weight : RscText {
		idc = 765;
		x = 0.04; y = 0.65;
		w = 0.20; h = 0.04;
	};



	class cancel2 : RscButton {
		x = 0.74; y = 0.65;
		w = 0.20; h = 0.04;
		text = $STRD_inv_description_buyitem_close;
		action = "closedialog 0;";
	};

	class submit2 : RscButton {
		idc = 103;
		x = 0.74; y = 0.60;
		w = 0.20; h = 0.04;
	};

	class itemeingabe2 : RscEdit {
		idc = 102;
		x = 0.53; y = 0.60;
		w = 0.20; h = 0.04;
		text = "1";
	};

	class itemliste2 : RscListBox 	{
		idc = 101;
		w = 0.42; h = 0.48;
		x = 0.53; y = 0.10;
	};

	class text_inventargeld : RscText {
		idc = 100;
		x = 0.535; y = 0.65;
		w = 0.20; h = 0.04;
		text="Inventory /";
	};

	class dummybutton : RscDummy {idc = 1015;};

};

class storage_dialog {

	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, DLG_BACK2, background1, background2};
	objects[] = { };
	controls[] = {itemliste, itemeingabe, submit, cancel, weight, cancel2, submit2, itemeingabe2, itemliste2, text_inventargeld, dummybutton};

	onUnload = "call trunk_close;";
	
	class DLG_BACK1: RscBackground {
		x = 0.02; y = 0.08;
		w = 0.46; h = 0.64;
	};

	class DLG_BACK2: RscBackground {
		x = 0.51; y = 0.08;
		w = 0.46; h = 0.64;
	};

	class background1 : RscBgRahmen {
		x = 0.02; y = 0.08;
		w = 0.46; h = 0.64;
		text = $STRD_inv_description_itemmenu_title_storage;
		idc = 91;
	};
	
	class background2 : RscBgRahmen {
		x = 0.51; y = 0.08;
		w = 0.46; h = 0.64;
		idc = 92;
		text = $STRD_inv_description_itemmenu_title_player;
	};

	class itemliste : RscListBox {
		idc = 1;
		x = 0.04; y = 0.10;
		w = 0.42; h = 0.48;
	};

	class itemeingabe : RscEdit {
		idc = 2;
		x = 0.04; y = 0.60;
		w = 0.20; h = 0.04;
		text = "1";
	};

	class submit : RscButton {
		idc = 3;
		x = 0.25; y = 0.60;
		w = 0.20; h = 0.04;
		text = "Submit";
	};

	class cancel : RscButton {
		x = 0.25; y = 0.65;
		w = 0.20; h = 0.04;

		text = $STRD_inv_description_buyitem_close;
		action = "closedialog 0";
	};

	class weight : RscText {
		idc = 765;
		x = 0.04; y = 0.65;
		w = 0.20; h = 0.04;
	};



	class cancel2 : RscButton {
		x = 0.74; y = 0.65;
		w = 0.20; h = 0.04;
		text = $STRD_inv_description_buyitem_close;
		action = "closedialog 0;";
	};

	class submit2 : RscButton {
		idc = 103;
		x = 0.74; y = 0.60;
		w = 0.20; h = 0.04;
	};

	class itemeingabe2 : RscEdit {
		idc = 102;
		x = 0.53; y = 0.60;
		w = 0.20; h = 0.04;
		text = "1";
	};

	class itemliste2 : RscListBox 	{
		idc = 101;
		w = 0.42; h = 0.48;
		x = 0.53; y = 0.10;
	};

	class text_inventargeld : RscText {
		idc = 100;
		x = 0.535; y = 0.65;
		w = 0.20; h = 0.04;
		text="Inventory /";
	};

	class dummybutton : RscDummy {idc = 1015;};

};


class inventar {										
	idd = 1000;														
	movingEnable = true;								
	controlsBackground[] = {MainBackground};									
	objects[] = { };															
	controls[] = {
		TextStatusRight,
		itemList,
		itemEdit,
		iNearPlayers,
		DropButton,
		UseButton,
		RemoveButton,
		ButtonClose
	};																					
		
		class MainBackground:RscPictureKeepAspect {
			idc = -1;
			text = "resources\images\phone\phone.paa";
			colorBackground[] = {0, 0, 0, 0};
			x = 0;
			y = -0.15;
			w = 1;
			h = 1.3;
		};
	
		class TextStatusRight : RscStructuredText
		{
			idc = 202;
			x = 0.35; y = 0.675;
			w = 1 - (0.34 * 2) - 0.02; h = 0.05;
		};

		class itemList : RscListBox
		{
			idc = 1;
			sizeEx = 0.030;
			x = 00.4725 - (0.08 * 2);
			y = 00.05;
			w = 1.05 - ((0.5 - (0.08 * 2)) * 2);
			h = 0.6;
		};

		class itemEdit : RscEdit {

			idc = 501;
			text = "1";
			sizeEx = 0.030;
			x = 00.4725 - (0.08 * 2);
			y = 0.725;
			w = 1.05 - ((0.5 - (0.08 * 2)) * 2);
			h = 0.03;

		};
		class iNearPlayers : RscCombo
		{
			idc = 99;

			x = 00.4725 - (0.08 * 2);
			y = 0.775;
			w = 1.05 - ((0.5 - (0.08 * 2)) * 2);
			h = 0.03;
		};

		class DropButton : RscButton {

			idc = 246;
			text = "Give";
			colorBackground[] = {0.0078 ,0.1803 ,.5607, .80};
			x = 00.4725 - (0.08 * 2);
			y = 0.830;
			w = 1.05 - ((0.5 - (0.08 * 2)) * 2);
			h = (1 / 25);

		};

		class UseButton : RscButton {

			text = "Use";
			idc = 3;
			colorBackground[] = {0.0078 ,0.1803 ,.5607, .80};

			x = 00.4725 - (0.08 * 2);
			y = 0.880;
			w = 1.05 - ((0.5 - (0.08 * 2)) * 2);
			h = (1 / 25);

		};

		class RemoveButton : RscButton {

			text = "Drop";
			idc = 4;
			colorBackground[] = {0.0078 ,0.1803 ,.5607, .80};

			x = 00.4725 - (0.08 * 2);
			y = 0.930;
			w = 1.05 - ((0.5 - (0.08 * 2)) * 2);
			h = (1 / 25);

		};

		class ButtonClose : RscButtonPhone {
			idc = -1;
			shortcuts[] = {0x00050000 + 2};
			text = "";
			onButtonClick = "closeDialog 0;";
			tooltip = "Go back to home screen";
			x = 0.5 - ((6.25 / 40) / 2);
			y = 0.99;
			w = (6.25 / 40);
			h = (6.25 / 40);
		};
		class dummybutton : RscDummy {
			idc = 1001;
	};
};

class INV_list
{						
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {liste, close, dummybutton};
														
	class DLG_BACK1: RscBackground {
		x = 0.21; y = 0.05;																												
		w = 0.52; h = 0.84;									
	};										

	class background : RscBgRahmen {																														
		x = 0.21; y = 0.05;						
		w = 0.52; h = 0.84;						
		text = "List";					
	};						

	class liste : RscListBox {												
		idc = 1;																				
		x = 0.22; y = 0.08;																														
		w = 0.50; h = 0.73;																				
		SizeEX = 0.0195; 																
		RowHeight = 0.03; 			
	};										

	class close : RscButton {						
		idc = 2;																								
		x = 0.39; y = 0.83;										
		w = 0.20; h = 0.04;																										
		text = $STRD_inv_description_buyitem_close;																														
		action = "closedialog 0;";															
	};			

	class dummybutton : RscDummy {idc = 2017;};

};

class INV_ItemListDialog
{													
	idd = -1;														
	movingEnable = true;									
	controlsBackground[] = {DLG_BACK1, background};							
	objects[] = { };											
	controls[] = {Itemlist, InfoText, InfoGewicht, list_needed, button_cancel, dummybutton};									
	
	class DLG_BACK1: Rscbackground {																										
		x = 0.05; y = 0.05;															   
		w = 0.90; h = 0.90;				
	};									
	
	class background : RscBgRahmen {												
		x = 0.05; y = 0.05;													    
		w = 0.90; h = 0.90;																										
		text = "Item Information";												
	};																						
	
	class Itemlist : RscListBox {										
		idc = 1;										
		x = 0.10; y = 0.10;																										
		w = 0.20; h = 0.70;														
	};																								
	
	class InfoText : RscText {										
		idc = 2;																								
		x = 0.35; y = 0.10;		   
		w = 0.55; h = 0.34;												
		style = ST_MULTI;												
		lineSpacing = 1;							
	};																												
	
	class InfoGewicht : RscText {																						
		idc = 3;								
		x = 0.66; y = 0.55;		   
		w = 0.25; h = 0.04;																				
		style = ST_RIGHT;										
	};																		
	
	class list_needed : RscListBox {										
		idc = 4;										
		x = 0.35; y = 0.45;																						
		w = 0.30; h = 0.35;						
	};																	
	
	class button_cancel : RscButton {																
		x = 0.40; y = 0.90;								
		w = 0.20; h = 0.04;														
		idc = 5;																						
		action = "closedialog 0;";			
	};						
	
	class dummybutton : RscDummy {idc = 1038;};
};
