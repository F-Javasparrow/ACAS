#include "script_component.hpp"
ADDON = false;

#include "XEH_PREP.hpp"

private _category = LLSTRING(Stamina_category);
private _subCategory = LLSTRING(Basic_subcategory);
[
    QGVAR(noSprintCoef),
    "SLIDER",
    [],
    [_category, _subCategory],
    [0, 1, 0.25, 1],
    true
] call CBA_fnc_addSetting;
[
    QGVAR(noRunCoef),
    "SLIDER",
    [],
    [_category, _subCategory],
    [0, 1, 0.05, 1],
    true
] call CBA_fnc_addSetting;

ADDON = true;