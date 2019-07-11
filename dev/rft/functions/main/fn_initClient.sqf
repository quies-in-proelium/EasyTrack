#include "script_component.hpp"

[
    {!((isNull player) or (isNull (finddisplay 46)))},
    {	// JIP
        private _getMarkers = [missionNamespace, QGVAR(markers), []] spawn BIS_fnc_getServerVariable;
        [{scriptDone _getMarkers}, {
            { SET_MARKER(MARKER_GET_ID(_x), _x) } foreach GVAR(markers);
        }] call CBA_fnc_waitUntilAndExecute;
        [missionNamespace, QGVAR(currentMarkerID), 0] spawn BIS_fnc_getServerVariable;
    }
] call CBA_fnc_waitUntilAndExecute;

[] spawn {
    private ['_GPSOpened','_UAVOpened','_ArtilleryOpened','_TaoTabletOpened'];
    _GPSOpened = FALSE;
    _UAVOpened = FALSE;
    _ArtilleryOpened = FALSE;
    _TaoTabletOpened = FALSE;
    disableSerialization;
    for '_x' from 0 to 1 step 0 do {
        if (!(_GPSOpened)) then {
            if (!isNull ((findDisplay 311) displayCtrl 101)) then {
                _GPSOpened = TRUE;
                ((findDisplay 311) displayCtrl 101) ctrlAddEventHandler ['Draw', FUNC(handleDraw)];
            };
        } else {
            if (isNull ((findDisplay 311) displayCtrl 51)) then {
                _GPSOpened = FALSE;
            };
        };
        if (!(_UAVOpened)) then {
            if (!isNull ((findDisplay 160) displayCtrl 51)) then {
                _UAVOpened = TRUE;
                ((findDisplay 160) displayCtrl 51) ctrlAddEventHandler ['Draw', FUNC(handleDraw)];
            };
        } else {
            if (isNull ((findDisplay 160) displayCtrl 51)) then {
                _UAVOpened = FALSE;
            };
        };
        if (!(_ArtilleryOpened)) then {
            if (!isNull ((findDisplay -1) displayCtrl 500)) then {
                _ArtilleryOpened = TRUE;
                ((findDisplay -1) displayCtrl 500) ctrlAddEventHandler ['Draw', FUNC(handleDraw)];
            };
        } else {
            if (isNull ((findDisplay -1) displayCtrl 500)) then {
                _ArtilleryOpened = FALSE;
            };
        };
        if (!(_TaoTabletOpened)) then {
            if (!isNull (((uiNamespace getVariable "Tao_FoldMap") displayCtrl 40)) || {!isNull (((uiNamespace getVariable "Tao_FoldMap") displayCtrl 41))}) then {
                _TaoTabletOpened = TRUE;
                // DAYMAP 40; Nightmap 41
                ((uiNamespace getVariable "Tao_FoldMap") displayCtrl 40) ctrlAddEventHandler ['Draw', FUNC(handleDraw)];
                ((uiNamespace getVariable "Tao_FoldMap") displayCtrl 41) ctrlAddEventHandler ['Draw', FUNC(handleDraw)];
            };
        } else {
            if (isNull (((uiNamespace getVariable "Tao_FoldMap") displayCtrl 40)) || {isNull (((uiNamespace getVariable "Tao_FoldMap") displayCtrl 41))}) then {
                _TaoTabletOpened = FALSE;
            };
        };

        uiSleep 0.25;
    };
};
