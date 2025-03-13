class gangswar {
    idd = -1;
    movingEnable = true;
	
    controlsBackground[] = {
        background_gangwar,RscFrame_1800
    };
	
    objects[] = { };

    controls[] = {
    War_Text,RscCombo_3,Button_Cancel,Declare_War
    };
    class background_gangwar : RscBackground {
		x = 0.1875;
		y = 0.175;
		w = 0.61318;
		h = 0.21318;
    };
class RscFrame_1800: RscFrame
	{
		idc = 1800;
		text = "Gang War";
		x = 0.1875;
		y = 0.175;
		w = 0.61318;
		h = 0.21318;
	};
class War_Text: RscText
	{
		idc = 1000;
		text = "Please select the gang you wish to declare war on:";
		x = 0.203125;
		y = 0.2;
		w = 0.575768;
		h = 0.0468085;
	};
class RscCombo_3: RscCombo
	{
		idc = 3;
		x = 0.203125;
		y = 0.25;
		w = 0.580201;
		h = 0.0448385;
	};
class Button_Cancel: RscButton
	{
		idc = 1600;
		text = "Cancel";
		action = "closeDialog 0";
		x = 0.59375;
		y = 0.325;
		w = 0.181265;
		h = 0.0468085;
	};
class Declare_War: RscButton
	{
		idc = 1601;
		text = "Declare War";
		action = "[lbData [3, (lbCurSel 3)];] call gangs_declare_war";
		x = 0.203125;
		y = 0.325;
		w = 0.181265;
		h = 0.0468085;
	};
};