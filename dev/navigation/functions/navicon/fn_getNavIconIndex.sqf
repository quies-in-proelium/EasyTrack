#include "script_component.hpp"

params ["_id"];

{
    if(NAVICON_GET_ID(_x) == _id) exitWith {
        _foreachIndex;
    };
} foreach GVAR(navIcons);