#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = "EasyRFTrack";
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main"};
        author = MAINAUTHOR;
        authors[] = {AUTHORS};
        url = "";
        VERSION_CONFIG;
    };
};

#include "CfgFactionClasses.hpp"
#include "CfgFunctions.hpp"
#include "dialog.hpp"
#include "Extended_Eventhandlers.hpp"
