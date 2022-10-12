#include "script_component.hpp"
ADDON = false;

#include "XEH_PREP.hpp"

// Settings
private _category = LLSTRING(category);
[
    QGVAR(timeToCheckArmor),
    "SLIDER",
    ["检查护甲的时间", "检查护甲操作的所需时间"],
    _category,
    [0, 30, 8, 1],
    true
] call CBA_fnc_addSetting;

// coef
[
    QGVAR(mmPennedCoef),
    "SLIDER",
    ["穿深参数", "穿深调整参数"],
    _category,
    [0, 100, 12.5, 1],
    true
] call CBA_fnc_addSetting;
[
    QGVAR(strengthToLowCoef),
    "SLIDER",
    ["护甲强度参数", "护甲强度过低调整参数"],
    _category,
    [0, 10, 2, 1],
    true
] call CBA_fnc_addSetting;
[
    QGVAR(mmPennedBreakdownCoef),
    "SLIDER",
    ["护甲击穿穿深调整参数", "护甲击穿后穿深削减调整参数"],
    _category,
    [0, 100, 75, 1],
    true
] call CBA_fnc_addSetting;
[
    QGVAR(damageLeftNotBreakdownCoef),
    "SLIDER",
    ["护甲未击穿伤害调整参数", "护甲未击穿后伤害调整参数"],
    _category,
    [0, 100, 5, 1],
    true
] call CBA_fnc_addSetting;

ADDON = true;