#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = "EasyRFTrack - Red Force Tracking";
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main", QUOTE(DOUBLES(PREFIX,tracking_main))};
        author = MAINAUTHOR;
        authors[] = {AUTHORS};
        url = "";
        VERSION_CONFIG;
    };
};

#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
#include "dialog.hpp"
#include "Extended_Eventhandlers.hpp"
