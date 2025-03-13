class pmc_menu_create {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {pmc_menu_create_bckg,pmc_menu_create_frame};
	objects[] = { };
	controls[] = {
		pmc_select_1,
		pmc_select_2,
		pmc_payment,
		button_create_accept,
		button_close
	};


	class pmc_menu_create_bckg: RscBackground
	{
		idc = 1800;
		x = 0.36875 * safezoneW + safezoneX;
		y = 0.4125 * safezoneH + safezoneY;
		w = 0.254297 * safezoneW;
		h = 0.1925 * safezoneH;
	};	
	class pmc_menu_create_frame: RscBgRahmen
	{
		idc = 1800;
		text = "Contract Creation";
		x = 0.36875 * safezoneW + safezoneX;
		y = 0.4125 * safezoneH + safezoneY;
		w = 0.254297 * safezoneW;
		h = 0.1925 * safezoneH;
	};
	class pmc_select_1: RscCombo
	{
		idc = 2100;
		x = 0.376953 * safezoneW + safezoneX;
		y = 0.4475 * safezoneH + safezoneY;
		w = 0.0902344 * safezoneW;
		h = 0.035 * safezoneH;
		text = "Type";
	};
	class pmc_select_2: RscCombo
	{
		idc = 2101;
		x = 0.376953 * safezoneW + safezoneX;
		y = 0.5525 * safezoneH + safezoneY;
		w = 0.0902344 * safezoneW;
		h = 0.035 * safezoneH;
		text = "Target";
	};
	class pmc_payment: RscEdit
	{
		idc = 2102;
		x = 0.524609 * safezoneW + safezoneX;
		y = 0.4475 * safezoneH + safezoneY;
		w = 0.0820312 * safezoneW;
		h = 0.035 * safezoneH;
		text = "Pay (Per PMC)";
		onChar = "[_this, 1] call KeyPressHandler;";
	};

	class button_create_accept: RscButton
	{
		idc = 1600;
		text = "Create";
		x = 0.524609 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.0820312 * safezoneW;
		h = 0.035 * safezoneH;
		action = "[(lbData [2100, (lbCurSel 2100)]),(lbData [2101, (lbCurSel 2101)]),(ctrlText 2102)] call create_contract; closedialog 0";
	};
	class button_close: RscButton
	{
		idc = 1601;
		text = "Close";
		x = 0.524609 * safezoneW + safezoneX;
		y = 0.5525 * safezoneH + safezoneY;
		w = 0.0820312 * safezoneW;
		h = 0.035 * safezoneH;
		action = "closedialog 0";
	};	
};

class pmc_menu {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {contract_background,contract_background_frame};
	objects[] = { };
	controls[] = {
		contract_join,
		contract_leave, 
		contract_remove, 
		contract_create,
		contract_complete,
		contract_list,
		contract_name,
		contract_type,
		contract_target,
		contract_client,
		contract_payment,
		contract_contractors,
		dummybutton
	

	};
		class contract_background: RscBackground
		{
			idc = 1800;
			x = 0.278516 * safezoneW + safezoneX;
			y = 0.185 * safezoneH + safezoneY;
			w = 0.442969 * safezoneW;
			h = 0.63 * safezoneH;
		};
		class contract_background_frame: RscBgRahmen
		{
			idc = 1800;
			text = "PMC Contracting";
			x = 0.278516 * safezoneW + safezoneX;
			y = 0.185 * safezoneH + safezoneY;
			w = 0.442969 * safezoneW;
			h = 0.63 * safezoneH;
		};
		class contract_list: RscListbox
		{
			idc = 1500;
			x = 0.483594 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.213281 * safezoneW;
			h = 0.555 * safezoneH;
		};
		class contract_name: RscText
		{
			idc = 1000;
			text = "Name:";
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.106641 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class contract_type: RscText
		{
			idc = 1001;
			text = "Type:";
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.2725 * safezoneH + safezoneY;
			w = 0.106641 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class contract_client: RscText
		{
			idc = 1002;
			text = "Client:";
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.325 * safezoneH + safezoneY;
			w = 0.106641 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class contract_target: RscText
		{
			idc = 1003;
			text = "Target:";
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.3775 * safezoneH + safezoneY;
			w = 0.106641 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class contract_payment: RscText
		{
			idc = 1004;
			text = "Payment:";
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.106641 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class contract_contractors: RscText
		{
			idc = 1005;
			text = "Contractors:";
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.4825 * safezoneH + safezoneY;
			w = 0.106641 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class contract_join: RscButton
		{
			idc = 1600;
			text = "Join Contract";
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.5525 * safezoneH + safezoneY;
			w = 0.123047 * safezoneW;
			h = 0.035 * safezoneH;
			action = "[(lbData [1500, (lbCurSel 1500)])] call contract_join;closedialog 0";

		};
		class contract_leave: RscButton
		{
			idc = 1601;
			text = "Leave Contract";
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.605 * safezoneH + safezoneY;
			w = 0.123047 * safezoneW;
			h = 0.035 * safezoneH;
			action = "[(lbData [1500, (lbCurSel 1500)])] call contract_leave;closedialog 0";
		};
		class contract_create: RscButton
		{
			idc = 1602;
			text = "Create Contract";
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.6575 * safezoneH + safezoneY;
			w = 0.123047 * safezoneW;
			h = 0.035 * safezoneH;
			action = "[""pmcmenu_create""] spawn dialog_handler; closedialog 0";
		};
		class contract_remove: RscButton
		{
			idc = 1603;
			text = "Cancel Contract";
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.123047 * safezoneW;
			h = 0.035 * safezoneH;
			action = "[(lbData [1500, (lbCurSel 1500)])] call contract_remove;closedialog 0";
		};
		class contract_complete: RscButton
		{
			idc = 1604;
			text = "Complete Contract";
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.7625 * safezoneH + safezoneY;
			w = 0.123047 * safezoneW;
			h = 0.035 * safezoneH;
			action = "[(lbData [1500, (lbCurSel 1500)])] call contract_complete;closedialog 0";
		};
		class dummybutton : RscDummy {
		idc = 1010;
	};
};
