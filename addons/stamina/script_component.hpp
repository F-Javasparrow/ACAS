#define COMPONENT stamina
#define COMPONENT_BEAUTIFIED ACAS - Stamina
#include "\x\acas\addons\main\script_mod.hpp"
#include "\x\acas\addons\main\define.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_CIRCULATION
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_CIRCULATION
    #define DEBUG_SETTINGS DEBUG_SETTINGS_CIRCULATION
#endif

#include "\x\acas\addons\main\script_macros.hpp"

// Returns a text config entry as compiled code or variable from missionNamespace
#define GET_FUNCTION(var,cfg) \
    private var = getText (cfg); \
    if (isNil var) then { \
        var = compile var; \
    } else { \
        var = missionNamespace getVariable var; \
    }

// Returns a number config entry with default value of 0
// If entry is a string, will get the variable from missionNamespace
#define GET_NUMBER_ENTRY(cfg) \
    if (isText (cfg)) then { \
        missionNamespace getVariable [getText (cfg), 0]; \
    } else { \
        getNumber (cfg); \
    }