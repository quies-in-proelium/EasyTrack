#include "script_component.hpp"

PARAMS_3(_unit,_container,_item);

private ["_mapDisplay", "_btnActions"];
_mapDisplay = DISPLAY(IDD_MAINMAP);

if(GVAR(mapInitialized) && {([] call MFUNC(hasTracker))}) then {
    _btnActions = _mapDisplay displayCtrl IDC_BTN_ACTIONS;
    _btnActions ctrlShow true;
};
