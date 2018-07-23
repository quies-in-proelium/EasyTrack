#include "script_component.hpp"

PARAMS_1(_target);

private ["_getItemSides", "_playerSides", "_targetSides", "_result"];

_getItemSides = {
    PARAMS_1(_unit);
    _side = side _unit;

    _side;
};

_playerSides = [player] call _getItemSides;
_targetSides = [_target] call _getItemSides;

_result = false;
scopeName "main";
{
    _playerSide = _x;
    {
        _result = _playerSide in ([_x] call BIS_fnc_friendlySides);
        if(_result) then { breakTo "main"; };
    } foreach _targetSides;
} foreach _playerSides;

_result;
