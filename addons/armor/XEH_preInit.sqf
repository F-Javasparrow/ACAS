#include "script_component.hpp"
ADDON = false;

#include "XEH_PREP.hpp"

private _category = "ACAS-护甲设置";

// Basic Settings
private _subCategory = "基础设置";
[
    QGVAR(timeToCheckArmor),
    "SLIDER",
    ["检查护甲", "检查护甲"],
    [_category, _subCategory],
    [0, 30, 8, 1],
    true
] call CBA_fnc_addSetting;
[
    QGVAR(fixArmor_addHealth),
    "SLIDER",
    ["护甲维修耐久", "护甲维修耐久"],
    [_category, _subCategory],
    [0, 80, 40, 1],
    true
] call CBA_fnc_addSetting;
[
    GVAR(fixArmor_addLowHealth),
    "SLIDER",
    ["护甲维修上限", "可以进行护甲维修的耐久上限"],
    [_category, _subCategory],
    [0, 100, 50, 1],
    true
] call CBA_fnc_addSetting;

// Armor Default Setting
[
    QGVAR(2_ArmorMaxHealth),
    "SLIDER",
    ["护甲耐久", "护甲耐久"],
    [_category, "2"],
    [0, 80, 30, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(3_ArmorMaxHealth),
    "SLIDER",
    ["护甲耐久", "护甲耐久"],
    [_category, "3"],
    [0, 80, 40, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(4_ArmorMaxHealth),
    "SLIDER",
    ["护甲耐久", "护甲耐久"],
    [_category, "4"],
    [0, 80, 50, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(5_ArmorMaxHealth),
    "SLIDER",
    ["护甲耐久", "护甲耐久"],
    [_category, "5"],
    [0, 80, 70, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(6_ArmorMaxHealth),
    "SLIDER",
    ["护甲耐久", "护甲耐久"],
    [_category, "6"],
    [0, 80, 75, 1],
    true
] call CBA_fnc_addSetting;

ADDON = true;