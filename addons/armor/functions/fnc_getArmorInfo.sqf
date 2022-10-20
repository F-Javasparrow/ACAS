#include "script_component.hpp"
#define MATERIAL_ARAMIND     ["ARAMIND",   0.25]
#define MATERIAL_UHMWPE      ["UHMWPE",    0.45]
#define MATERIAL_COMBINED    ["COMBINED",  0.50]
#define MATERIAL_TITAN       ["TITAN",     0.55]
#define MATERIAL_STEEL       ["STEEL",     0.70]
#define MATERIAL_CERAMIC     ["CERAMIC",   0.80]
#define METERIALLIST         [MATERIAL_ARAMIND, MATERIAL_UHMWPE, MATERIAL_COMBINED, MATERIAL_TITAN, MATERIAL_TITAN, MATERIAL_STEEL, MATERIAL_CERAMIC]
params["_unit", "_hitPoint"];

// 护甲
private _armorInfo = _unit getVariable [QGVAR(ArmorInfo), ["NULL", 0, 0, 0, 0, "ARAMIND", 0]];
_armorInfo params ["_vest", "_level", "_health", "_maxHealth", "_protectionAbility", "_material", "_materialDamageFactor"];

_vest = vest _unit;
_armorData = [_vest, -1, 0, 0, 0, "NULL", 0];

if!(_vest isEqualTo "") then {
    _armor = getNumber(configFile >> "CfgWeapons" >> _vest >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor");
    switch(true) do {
        case(0 <= _armor && _armor <= 6):  {_level = 0;_maxhealth = 0};
        case(6 < _armor && _armor  <= 12): {_level = 1;_maxhealth = 0};
        case(12 < _armor && _armor <= 16): {_level = 2;_maxhealth = GVAR(2_ArmorMaxHealth)};
        case(16 < _armor && _armor <= 20): {_level = 3;_maxhealth = GVAR(3_ArmorMaxHealth)};
        case(20 < _armor && _armor <= 24): {_level = 4;_maxhealth = GVAR(4_ArmorMaxHealth)};
        case(24 < _armor && _armor <= 28): {_level = 5;_maxhealth = GVAR(5_ArmorMaxHealth)};
        case(28 < _armor):                 {_level = 6;_maxhealth = GVAR(6_ArmorMaxHealth)};
    };
    if!(_vest isEqualTo _armorInfo # 0) then {_health = _maxhealth;};

    _material = getText(configFile >> "CfgWeapons" >> _vest >> "ACAS_armorMaterial");
    _materialDamageFactor = METERIALLIST # (METERIALLIST findIf {_x # 0 == _material}) # 1;

    _protectionAbility = 0;
    _h = 0;
    if(_health > 0 && _maxHealth > 0) then {
        _h = _health / _maxHealth;
    } else {
        _h = 0;
    };
    _protectionAbility = ((121 * _h ^ 2 + 1050) / (_h ^ 2 + 50)) * sqrt(sqrt(_h / 27.8)) * _level;

    _armorData = [_vest, _level, _health, _maxhealth, _protectionAbility, _material, _materialDamageFactor];
};
_unit setVariable [QGVAR(ArmorInfo), _armorData, true];

// 额外插板
private _plateInfo = _unit getVariable [QGVAR(PlateInfo), ["NULL", 0, 0, 0, 0, "NULL", 0]];
_plateInfo params ["_plate", "_level", "_health", "_maxHealth", "_protectionAbility", "_material", "_materialDamageFactor"];

_plateData = ["", -1, 0, 0, 0, "NULL", 0];

if!(_plate isEqualTo "") then {
    _level = 2.5;
    _maxhealth = GVAR(PlateMaxHealth);
    _material = "CERAMIC";
    _materialDamageFactor = METERIALLIST # (METERIALLIST findIf {_x # 0 == _material}) # 1;

    _protectionAbility = 0;
    _h = 0;
    if(_health > 0 && _maxHealth > 0) then {
        _h = _health / _maxHealth;
    } else {
        _h = 0;
    };
    _protectionAbility = (121 * _h ^ 2 + 1050) / (_h ^ 2 + 50) * sqrt(sqrt(_h / 27.8)) * _level;
    if(_protectionAbility < 0) then {_protectionAbility = 0};

    _plateData = [_vest, _level, _health, _maxhealth, _protectionAbility, _material, _materialDamageFactor];
};
_unit setVariable [QGVAR(PlateInfo), _plateData, true];

[_armorData, _plateData];