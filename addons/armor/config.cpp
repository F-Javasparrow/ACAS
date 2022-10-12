#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_main",
            "ace_main"
        };
        author = "Javasparrow";
        url = "";
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgFunctions.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"

#include "ACE_Medical_Injuries.hpp"