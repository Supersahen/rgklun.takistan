
#define FontM 			"Zeppelin32"
#define FontHTML 		"Zeppelin32"
#define CT_STATIC 		0
#define CT_BUTTON		1
#define CT_EDIT			2
#define CT_SLIDER		3
#define CT_COMBO		4
#define CT_LISTBOX		5
#define CT_TOOLBOX 		6
#define CT_CHECKBOXES 		7
#define CT_PROGRESS 		8
#define CT_HTML 		9
#define CT_STATIC_SKEW 		10
#define CT_ACTIVETEXT		11
#define CT_TREE 		12
#define CT_STRUCTURED_TEXT 	13
#define CT_CONTEXT_MENU 	14
#define CT_CONTROLS_GROUP 	15
#define CT_XKEYDESC 		40
#define CT_XBUTTON 		41
#define CT_XLISTBOX 		42
#define CT_XSLIDER 		43
#define CT_XCOMBO 		44
#define CT_ANIMATED_TEXTURE	45
#define CT_OBJECT 		80
#define CT_OBJECT_ZOOM 		81
#define CT_OBJECT_CONTAINER	82
#define CT_OBJECT_CONT_ANIM	83
#define CT_LINEBREAK		98
#define CT_USER			99
#define CT_MAP 			100
#define CT_MAP_MAIN		101
#define ST_LEFT			0
#define ST_RIGHT		1
#define ST_CENTER		2
#define ST_MULTI		16
#define ST_PICTURE		48
#define ST_FRAME		64
#define ST_SHADOW		256
#define ST_NO_RECT		512


// Respawn Dialog additions
#define CT_SHORTCUT_BUTTON 16 
#define FontM_R "TahomaB"
#define FontHTML_R "TahomaB"
#define Dlg_ROWS 36 
#define Dlg_COLS 90 
#define Dlg_CONTROLHGT ((100/Dlg_ROWS)/100)
#define Dlg_COLWIDTH ((100/Dlg_COLS)/100)
#define Dlg_TEXTHGT_MOD 0.8
#define Dlg_ROWSPACING_MOD 1.3
#define Dlg_ROWHGT (Dlg_CONTROLHGT*Dlg_ROWSPACING_MOD)
#define Dlg_TEXTHGT (Dlg_CONTROLHGT*Dlg_TEXTHGT_MOD)
#define Dlg_ICONWIDTH (Dlg_CONTROLHGT*4/5)
#define ST_POS 0x0F 
#define ST_HPOS 0x03 
#define ST_VPOS 0x0C 
#define ST_LEFT 0x00 
#define ST_RIGHT 0x01 
#define ST_CENTER 0x02 
#define ST_DOWN 0x04 
#define ST_UP 0x08 
#define ST_VCENTER 0x0c 
#define ST_TYPE 0xF0 
#define ST_SINGLE 0 
#define ST_TITLE_BAR 32
#define ST_PICTURE 48 
#define ST_FRAME 64 
#define ST_BACKGROUND 80 
#define ST_GROUP_BOX 96 
#define ST_GROUP_BOX2 112 
#define ST_HUD_BACKGROUND 128 
#define ST_TILE_PICTURE 144 
#define ST_WITH_RECT 160 
#define ST_LINE 176 
#define ST_SHADOW 0x100
#define ST_NO_RECT 0x200
#define ST_KEEP_ASPECT_RATIO 0x800
#define ST_TITLE ST_TITLE_BAR + ST_CENTER
#define SL_DIR 0x400
#define SL_VERT 0
#define SL_HORZ 0x400
#define SL_TEXTURES 0x10
#define LB_TEXTURES 0x10 
#define LB_MULTI 0x20 




//=====================================================================================

class w_RscText {

	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	colorBackground[] = { 1 , 1 , 1 , 0 };
	colorText[] = { 1 , 1 , 1 , 1 };
	font = FontM;
	sizeEx = 0.025;
	h = 0.25;
	text = "";
};


class RscText

{

type              = CT_STATIC;
idc               = -1;
style             = ST_LEFT;
colorBackground[] = {0, 0, 0, 0};
colorText[]       = {1, 1, 1, 1};
font              = FontM;
sizeEx            = 0.02;
text              = "";

};
class RscButtonPhone

{

type                      = CT_BUTTON;
idc                       = -1;
style                     = ST_CENTER;
shadow = 0;

font = "Zeppelin32";
sizeEx = 0.03921;
default                   = false;
text                      = "";
action                    = "";
colorActive[]             = {0, 0, 0, 0};

colorText[] = {0,0,0,0};
colorDisabled[] = {0,0,0,0};
colorBackground[] = {0,0,0,0};
colorBackgroundActive[] = {0,0,0,0};
colorBackgroundDisabled[] = {0,0,0,0};

soundEnter[] = {"\ca\ui\data\sound\onover", 0.09, 1};
soundPush[] = {"\ca\ui\data\sound\new1", 0.0, 0};
soundClick[] = {"\ca\ui\data\sound\onclick", 0.07, 1};
soundEscape[] = {"\ca\ui\data\sound\onescape", 0.09, 1};

offsetX = 0.003;
offsetY = 0.003;
offsetPressedX = 0.002;
offsetPressedY = 0.002;
colorFocused[] = {0,0,0,0};
colorShadow[] = {0,0,0,0};
colorBorder[] = {0,0,0,0};
borderSize = 0.0;


};
class RscTextCenter

{

type              = CT_STATIC;
idc               = -1;
style             = ST_CENTER;
colorBackground[] = {0, 0, 0, 0};
colorText[]       = {1, 1, 1, 1};
font              = FontM;
sizeEx            = 0.03;
text              = "";

};

class RscBgRahmen

{

type              = CT_STATIC;
idc               = -1;
style             = ST_FRAME;
colorBackground[] = {1.0, 1.0, 1.0, 0.75};
colorText[]       = {1, 1, 1, 1};
font              = FontM;
SizeEX            = 0.025;
text              = "";

};

class RscBackground

{
// hud color
colorBackground[] = {0.0078 ,0.1803 ,.5607, .80};
text              = "";
type              = CT_STATIC;
idc               = -1;
style             = ST_LEFT;
colorText[]       = {1, 1, 1, 1};
font              = FontM;
sizeEx            = 0.04;

};

class RscPicture

{

type              = CT_STATIC;
idc               =  -1;
style             = ST_PICTURE;
colorBackground[] = {0, 0, 0, 0};
colorText[]       = {1, 1, 1, 1};
font              = FontM;
sizeEx            = 0.02;
text              = "";

};

class RscPictureKeepAspect : RscPicture
{
	style = 0x30 + 0x800;
};

class RscBackgroundPicture

{

type              = CT_STATIC;
idc               =  -1;
style             = ST_PICTURE;
colorBackground[] = {0, 0, 0, 0};
colorText[]       = {1, 1, 1, 1};
font              = FontM;
sizeEx            = 0.02;
text              = "dbg.pac";

};

class RscButton

{

type                      = CT_BUTTON;
idc                       = -1;
style                     = ST_CENTER;
colorText[]               = {1, 1, 1, 1};
font                      = FontHTML;
sizeEx                    = 0.025;
soundPush[]               = {"", 0.2, 1};
soundClick[]              = {"ui\ui_ok", 0.2, 1};
soundEscape[]             = {"ui\ui_cc", 0.2, 1};
default                   = false;
text                      = "";
action                    = "";
colorActive[]             = {0, 0, 0, 0};
colorDisabled[]           = {0, 0, 0, 0.1};
colorBackground[]         = {0.8,0.8,0.8,0.3};
colorBackgroundActive[]   = {0.7,0.7,0.7,1};
colorBackgroundDisabled[] = {1,1,1,0.5};
colorFocused[]            = {0.84,1,0.55,1};
colorShadow[]             = {0, 0, 0, 0.1};
colorBorder[]             = {1, 1, 1, 0.1};
offsetX                   = 0;
offsetY                   = 0;
offsetPressedX            = 0;
offsetPressedY            = 0;
borderSize                = 0;
soundEnter[]              = {"", 0.15, 1};

};
class RscButtonNice

{

type                      = CT_BUTTON;
idc                       = -1;
style                     = ST_CENTER;
colorText[]               = {1, 1, 1, 1};
font                      = FontM;
sizeEx                    = 0.03;
soundPush[]               = {"", 0.2, 1};
soundClick[]              = {"ui\ui_ok", 0.2, 1};
soundEscape[]             = {"ui\ui_cc", 0.2, 1};
default                   = false;
text                      = "";
action                    = "";
colorActive[]             = {0, 0, 0, 0};
colorDisabled[]           = {0, 0, 0, 0.1};
colorBackground[]         = {0.8,0.8,0.8,0.3};
colorBackgroundActive[]   = {0.7,0.7,0.7,1};
colorBackgroundDisabled[] = {1,1,1,0.5};
colorFocused[]            = {0.84,1,0.55,1};
colorShadow[]             = {0, 0, 0, 0.1};
colorBorder[]             = {1, 1, 1, 0.1};
offsetX                   = 0;
offsetY                   = 0;
offsetPressedX            = 0;
offsetPressedY            = 0;
borderSize                = 0;
soundEnter[]              = {"", 0.15, 1};

};

class RscDummy : RscButton

{

x   = -1.0;
y   = -1.0;
idc = -1;
w   = 0.01;
h   = 0.01;
default = true;

};

class RscEdit

{

type = CT_EDIT;
idc = -1;
style = ST_LEFT;
font = FontHTML;
sizeEx = 0.02;
colorText[] = {1, 1, 1, 1};
colorSelection[] = {0.5, 0.5, 0.5, 1};
autocomplete = false;text = "";

};
class dev_console_edit
{
	type = CT_EDIT;
	style = ST_LEFT+ST_MULTI;
	idc = -1;
	font = "Zeppelin32";
	sizeEx = 0.026;
	htmlControl = true;
	lineSpacing = 0.004;
	x = 0.0; w = 0.3;
	y = 0.0; h = 0.06;
	colorText[] = {0.85, 0.85, 0.85, 1};
	colorSelection[] = {1, 1, 1, 1};
	autocomplete = "scripting";
	text = "Type Commands Here";
};
class RscEditPhone

{
	type = CT_EDIT;
	idc = -1;
	font = FontHTML;
	style = ST_LEFT;
	sizeEx = 0.02;
	colorText[] = {0, 0, 0, 1};
	colorSelection[] = {0.5, 0.5, 0.5, 1};
	autocomplete = false;
	text = "";
};

class RscLB_C

{

style                   = ST_LEFT;
idc                     = -1;
colorSelect[]           = {0, 0, 0, 1.0};
colorSelectBackground[] = {0.5, 0.5, 0.5, 1};
colorText[]             = {1, 1, 1, 1};
colorBackground[]       = {0.5, 0.5, 0.5, 1};
colorScrollbar[] 	= {Dlg_Color_White,1};
font                    = FontHTML;
sizeEx                  = 0.025;
rowHeight               = 0.04;
period 			= 1.200000;
maxHistoryDelay 	= 1.000000;
autoScrollSpeed 	= -1;
autoScrollDelay 	= 5;
autoScrollRewind 	= 0;

class ScrollBar {};

};
class RscLB_C_phone

{

style                   = ST_LEFT;
idc                     = -1;
colorSelect[]           = {0, 0, 0, 1.0};
colorSelectBackground[] = {0.7, 0.7, 0.7, 1};
colorText[]             = {0,0, 0, 1};
colorBackground[]       = {0.8, 0.8, 0.8, 1};
colorScrollbar[] 	= {Dlg_Color_White,1};
font                    = FontHTML;
sizeEx                  = 0.025;
rowHeight               = 0.04;
period 			= 1.200000;
maxHistoryDelay 	= 1.000000;
autoScrollSpeed 	= -1;
autoScrollDelay 	= 5;
autoScrollRewind 	= 0;

class ScrollBar {};

};
class RscListBox: RscLB_C

{

soundSelect[] = {"", 0.1, 1};
type          = CT_LISTBOX;

};

class RscCombo: RscLB_C

{

type            = CT_COMBO;
wholeHeight     = 0.3;
soundSelect[]   = {"", 0.15, 1};
soundExpand[]   = {"", 0.15, 1};
soundCollapse[] = {"", 0.15, 1};
arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";

};
class RscComboPhone: RscLB_C_phone

{

type            = CT_COMBO;
wholeHeight     = 0.3;
soundSelect[]   = {"", 0.15, 1};
soundExpand[]   = {"", 0.15, 1};
soundCollapse[] = {"", 0.15, 1};
arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";

};

class RscSliderH

{

access  = ReadandWrite;
type    = CT_SLIDER;
idc     = -1;
sizeEx  = 0.025;
style   = 1024;
color[] = {0.2, 0.2, 0.2, 1};
colorActive[] = {1, 1, 1, 1};

};

class RscSliderV

{

access  = ReadandWrite;
type    = CT_SLIDER;
idc     = -1;
sizeEx  = 0.025;
style   = 0;
color[] = {0.2, 0.2, 0.2, 1};
colorActive[] = {1, 1, 1, 1};

};