#include "script_component.hpp"
ADDON = false;

#include "XEH_PREP.hpp"

private _category = "ACAS-头盔设置";

// Basic Settings
private _subCategory = "基础设定";
[
    QGVAR(timeToCheckHelmet),
    "SLIDER",
    ["检查头盔", "检查头盔"],
    [_category, _subCategory],
    [0, 30, 4, 1],
    true
] call CBA_fnc_addSetting;

// 头盔护甲数据
private _category = "头盔护甲数据";

private _subCategory = "参数";
[
    GVAR(HelmetArmorCoef),
    "SLIDER",
    ["头盔防护值参数", "头盔防护值参数 %"],
    [_category, _subCategory],
    [0, 100, 75, 1],
    true
] call CBA_fnc_addSetting;

private _subCategory = "1";
[
    QGVAR(1_ArmorMaxHealth),
    "SLIDER",
    ["护甲血量", "护甲血量"],
    [_category, _subCategory],
    [0, 50, 15, 1],
    true
] call CBA_fnc_addSetting;
private _subCategory = "2";
[
    QGVAR(2_ArmorMaxHealth),
    "SLIDER",
    ["护甲血量", "护甲血量"],
    [_category, _subCategory],
    [0, 50, 25, 1],
    true
] call CBA_fnc_addSetting;
private _subCategory = "3";
[
    QGVAR(3_ArmorMaxHealth),
    "SLIDER",
    ["护甲血量", "护甲血量"],
    [_category, _subCategory],
    [0, 50, 30, 1],
    true
] call CBA_fnc_addSetting;
private _subCategory = "4";
[
    QGVAR(4_ArmorMaxHealth),
    "SLIDER",
    ["护甲血量", "护甲血量"],
    [_category, _subCategory],
    [0, 50, 30, 1],
    true
] call CBA_fnc_addSetting;
private _subCategory = "5";
[
    QGVAR(5_ArmorMaxHealth),
    "SLIDER",
    ["护甲血量", "护甲血量"],
    [_category, _subCategory],
    [0, 50, 30, 1],
    true
] call CBA_fnc_addSetting;
private _subCategory = "6";
[
    QGVAR(6_ArmorMaxHealth),
    "SLIDER",
    ["护甲血量", "护甲血量"],
    [_category, _subCategory],
    [0, 50, 35, 1],
    true
] call CBA_fnc_addSetting;

ADDON = true;