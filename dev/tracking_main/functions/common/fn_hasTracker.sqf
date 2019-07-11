#include "script_component.hpp"

if ((isDedicated) || !(isServer || hasInterface)) exitWith {true};

private _hasGPSDevice = ("ACE_microDAGR" in items player) || {
	{
		if (_x isKindOf ["ItemGPS", configFile >> "CfgWeapons"] || {_x isKindOf ["UavTerminal_base", configFile >> "CfgWeapons"]} || {_x isKindOf ["ItemcTab", configFile >> "CfgWeapons"]}) exitWith {true};
		false
	} forEach assignedItems player;
};

_hasGPSDevice;
