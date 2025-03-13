class chief_election {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {spielerliste, submit, cancel, dummybutton};

	class DLG_BACK1: Rscbackground	{
		x = 0.36; y = 0.06;
		w = 0.30; h = 0.80;		
	};

	class background : RscBgRahmen	{
		x = 0.36; y = 0.06;
		w = 0.30; h = 0.80;
		text = $STRD_description_wahl_header;
	};

	class spielerliste : RscListBox	{
		idc = 1;
		x = 0.38; y = 0.09;
		w = 0.27; h = 0.61;
	};

	class submit : RscButton {
		x = 0.42; y = 0.72;
		w = 0.20; h = 0.04;
		text = $STRD_description_wahl_submit;
		action = "[0,1,2,[""ClientWahlc"", lbData [1, (lbCurSel 1)]]] execVM ""core\loops\chief.sqf""; closedialog 0";
	};
	
	class cancel : RscButton {
		x = 0.42; y = 0.79;
		w = 0.20; h = 0.04;

		text = $STRD_description_buyitem_close;
		action = "closedialog 0;";
	};

	class dummybutton : RscDummy {
		idc = 1070;
	};
};

class commander_election {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {spielerliste, submit, cancel, dummybutton};

	class DLG_BACK1: Rscbackground	{
		x = 0.36; y = 0.06;
		w = 0.30; h = 0.80;		
	};

	class background : RscBgRahmen	{
		x = 0.36; y = 0.06;
		w = 0.30; h = 0.80;
		text = $STRD_description_wahl_header;
	};

	class spielerliste : RscListBox	{
		idc = 1;
		x = 0.38; y = 0.09;
		w = 0.27; h = 0.61;
	};

	class submit : RscButton {
		x = 0.42; y = 0.72;
		w = 0.20; h = 0.04;
		text = $STRD_description_wahl_submit;
		action = "[0,1,2,[""ClientWahlc"", lbData [1, (lbCurSel 1)]]] execVM ""core\loops\commander.sqf""; closedialog 0";
	};
	
	class cancel : RscButton {
		x = 0.42; y = 0.79;
		w = 0.20; h = 0.04;

		text = $STRD_description_buyitem_close;
		action = "closedialog 0;";
	};

	class dummybutton : RscDummy {
		idc = 1070;
	};
};

class president_election {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {spielerliste, submit, cancel, dummybutton};

	class DLG_BACK1: Rscbackground {
		x = 0.36; y = 0.06;
		w = 0.30; h = 0.80;
	};

	class background : RscBgRahmen {
		x = 0.36; y = 0.06;
		w = 0.30; h = 0.80;

		text = $STRD_description_wahl_header;
	};

	class spielerliste : RscListBox {
		idc = 1;
		x = 0.38; y = 0.09;
		w = 0.27; h = 0.61;
	};

	class submit : RscButton {
		x = 0.42; y = 0.72;
		w = 0.20; h = 0.04;

		text = $STRD_description_wahl_submit;
		action = "[player, (missionNamespace getVariable (lbData [1, (lbCurSel 1)]))] call interact_president_elect; closedialog 0";
	};

	class cancel : RscButton {
		x = 0.42; y = 0.79;
		w = 0.20; h = 0.04;

		text = $STRD_description_buyitem_close;
		action = "closedialog 0;";
	};

	class dummybutton : RscDummy {
		idc = 1031;
	};
};