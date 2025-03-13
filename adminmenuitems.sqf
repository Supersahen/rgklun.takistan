#define AdminConsol 1000
#define AdminPlayers 2006

adminCMD = lbData[AdminConsol, lbCurSel AdminConsol];
TarGetPLayer = ctrlText 2000;

_selectedplayer = (call compile lbData [AdminPlayers, lbCurSel AdminPlayers]);
_inputText = ctrlText 2000;

[] call compile adminCMD;

uiSleep 1;
hint "Code Activated";