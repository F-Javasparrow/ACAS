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

// Armor Default Setting
private _subCategory = "2";
[
    QGVAR(2_ArmorMaxHealth),
    "SLIDER",
    ["护甲血量", "护甲血量"],
    [_category, _subCategory],
    [0, 80, 30, 1],
    true
] call CBA_fnc_addSetting;

private _subCategory = "3";
[
    QGVAR(3_ArmorMaxHealth),
    "SLIDER",
    ["护甲血量", "护甲血量"],
    [_category, _subCategory],
    [0, 80, 40, 1],
    true
] call CBA_fnc_addSetting;

private _subCategory = "4";
[
    QGVAR(4_ArmorMaxHealth),
    "SLIDER",
    ["护甲血量", "护甲血量"],
    [_category, _subCategory],
    [0, 80, 50, 1],
    true
] call CBA_fnc_addSetting;

private _subCategory = "5";
[
    QGVAR(5_ArmorMaxHealth),
    "SLIDER",
    ["护甲血量", "护甲血量"],
    [_category, _subCategory],
    [0, 80, 70, 1],
    true
] call CBA_fnc_addSetting;s

private _subCategory = "6";
[
    QGVAR(6_ArmorMaxHealth),
    "SLIDER",
    ["护甲血量", "护甲血量"],
    [_category, _subCategory],
    [0, 80, 75, 1],
    true
] call CBA_fnc_addSetting;

ADDON = true;