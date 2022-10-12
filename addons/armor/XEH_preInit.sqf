#include "script_component.hpp"
ADDON = false;

#include "XEH_PREP.hpp"

// Settings
private _category = LLSTRING(category);
[
    QGVAR(timeToCheckArmor),
    "SLIDER",
    [LLSTRING(timeToCheckArmor), LLSTRING(timeToCheckArmor_desc)],
    _category,
    [0, 30, 8, 1],
    true
] call CBA_fnc_addSetting;

ADDON = true;