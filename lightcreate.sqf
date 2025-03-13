_markers = [
"light_blackmarket",
"light_internment",
"light_opfdonor",
"light_opfhq",
"light_southciv",
"light_insfob",
"light_inshq",
"light_southvip",
"light_opffob",
"light_pmc",
"light_southcivdonor",
"light_civdonor",
"light_civspawn",
"light_vip",
"light_colescrib",
"light_cophq",
"light_copdonor",
"light_srt"
];
{
 _marker = _x;
 _light = "#lightpoint" createVehicleLocal (getMarkerPos _marker);
 _light setLightBrightness 0.25;
 _light setLightAmbient [1,1,0.5];
 _light setLightColor [3,3,3];
} foreach _markers;