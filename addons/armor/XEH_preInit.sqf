#include "script_component.hpp"
ADDON = false;

#include "XEH_PREP.hpp"

private _category = LLSTRING(Main_category);
// Basic Settings
private _subCategory = LLSTRING(Basic_subcategory);
[
    QGVAR(timeToCheckArmor),
    "SLIDER",
    [LLSTRING(Action_CheckArmor_Display), LLSTRING(Action_CheckArmor_Desc)],
    [_category, _subCategory],
    [0, 30, 8, 1],
    true
] call CBA_fnc_addSetting;

// coef
private _subCategory = LLSTRING(Coef_subcategory);
[
    QGVAR(damageCoef),
    "SLIDER",
    ["伤害参数", "ACE伤害调整参数"],
    [_category, _subCategory],
    [0, 10, 3, 1],
    true
] call CBA_fnc_addSetting;
[
    QGVAR(mmPennedCoef),
    "SLIDER",
    ["穿深参数", "穿深调整参数"],
    [_category, _subCategory],
    [0, 1, 0.125, 1],
    true
] call CBA_fnc_addSetting;
[
    QGVAR(strengthToLowCoef),
    "SLIDER",
    ["护甲强度参数", "护甲强度过低调整参数"],
    [_category, _subCategory],
    [0, 10, 2, 1],
    true
] call CBA_fnc_addSetting;
[
    QGVAR(mmPennedBreakdownCoef),
    "SLIDER",
    ["护甲击穿穿深调整参数", "护甲击穿后穿深削减调整参数"],
    [_category, _subCategory],
    [0, 100, 75, 1],
    true
] call CBA_fnc_addSetting;
[
    QGVAR(damageLeftNotBreakdownCoef),
    "SLIDER",
    ["护甲未击穿伤害调整参数", "护甲未击穿后伤害调整参数"],
    [_category, _subCategory],
    [0, 100, 5, 1],
    true
] call CBA_fnc_addSetting;

private _category = LLSTRING(Data_category);
// Armor Default Setting

private _subCategory = "2";
[
    QGVAR(2_ArmorMaxHealth),
    "SLIDER",
    ["护甲血量", "护甲血量"],
    [_category, _subCategory],
    [0, 80, 25, 1],
    true
] call CBA_fnc_addSetting;
[
    QGVAR(2_ArmorThickness),
    "SLIDER",
    ["护甲厚度", "护甲厚度"],
    [_category, _subCategory],
    [0, 200, 25, 1],
    true
] call CBA_fnc_addSetting;

private _subCategory = "3";
[
    QGVAR(3_ArmorMaxHealth),
    "SLIDER",
    ["护甲血量", "护甲血量"],
    [_category, _subCategory],
    [0, 80, 35, 1],
    true
] call CBA_fnc_addSetting;
[
    QGVAR(3_ArmorThickness),
    "SLIDER",
    ["护甲厚度", "护甲厚度"],
    [_category, _subCategory],
    [0, 200, 45, 1],
    true
] call CBA_fnc_addSetting;

private _subCategory = "4";
[
    QGVAR(4_ArmorMaxHealth),
    "SLIDER",
    ["护甲血量", "护甲血量"],
    [_category, _subCategory],
    [0, 80, 55, 1],
    true
] call CBA_fnc_addSetting;
[
    QGVAR(4_ArmorThickness),
    "SLIDER",
    ["护甲厚度", "护甲厚度"],
    [_category, _subCategory],
    [0, 200, 70, 1],
    true
] call CBA_fnc_addSetting;

private _subCategory = "5";
[
    QGVAR(5_ArmorMaxHealth),
    "SLIDER",
    ["护甲血量", "护甲血量"],
    [_category, _subCategory],
    [0, 80, 55, 1],
    true
] call CBA_fnc_addSetting;
[
    QGVAR(5_ArmorThickness),
    "SLIDER",
    ["护甲厚度", "护甲厚度"],
    [_category, _subCategory],
    [0, 200, 100, 1],
    true
] call CBA_fnc_addSetting;

private _subCategory = "6";
[
    QGVAR(6_ArmorMaxHealth),
    "SLIDER",
    ["护甲血量", "护甲血量"],
    [_category, _subCategory],
    [0, 80, 60, 1],
    true
] call CBA_fnc_addSetting;
[
    QGVAR(6_ArmorThickness),
    "SLIDER",
    ["护甲厚度", "护甲厚度"],
    [_category, _subCategory],
    [0, 200, 130, 1],
    true
] call CBA_fnc_addSetting;

ADDON = true;