#include "script_component.hpp"
params["_unit", "_hitPoint"];

private _helmetInfo = _unit getVariable [QGVAR(HelmetInfo), ["NULL", 0, 0, 0, 0, "ARAMIND", 0, 0]];
_helmetInfo params ["_helmet", "_level", "_health", "_maxHealth", "_protectionAbility", "_material", "_materialDamageFactor", "_ricochetFactor"];

// 更新数据
_helmet = headgear _unit;
if(_vest isEqualTo "") exitWith {
    _output = [_helmet, -1, 0, 0, 0, "NULL", 0];
    _unit setVariable [QGVAR(ArmorInfo), _output, true];
    systemChat str _output;
    _output;
};

_armor = getNumber(configFile >> "CfgWeapons" >> _helmet >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor");
switch(true) do {
    case(0 <= _armor && _armor<= 4):   {_level = 0;_maxhealth = 0};
    case(4 <  _armor && _armor  < 10): {_level = 1;_maxhealth = GVAR(1_ArmorMaxHealth)};
    case(10 <= _armor && _armor < 14): {_level = 2;_maxhealth = GVAR(2_ArmorMaxHealth)};
    case(14 <= _armor && _armor < 18): {_level = 3;_maxhealth = GVAR(3_ArmorMaxHealth)};
    case(18 <= _armor && _armor < 22): {_level = 4;_maxhealth = GVAR(4_ArmorMaxHealth)};
    case(22 <= _armor && _armor < 26): {_level = 5;_maxhealth = GVAR(5_ArmorMaxHealth)};
    case(26 <= _armor):                {_level = 6;_maxhealth = GVAR(6_ArmorMaxHealth)};
};
if!(_helmet isEqualTo _helmetInfo # 0) then {_health = _maxhealth;};

_material = getText(configFile >> "CfgWeapons" >> _helmet >> "ACAS_armorMaterial");
_materialInfo = METERIALLIST # (METERIALLIST findIf {_x # 0 == _material});
_materialDamageFactor = _materialInfo # 1;
_ricochetFactor       = _materialInfo # 2;

_protectionAbility = 0;
_h = 0;
if(_health > 0 && _maxHealth > 0) then {
        _h = _health / _maxHealth;
    } else {
        _h = 0;
    };
_protectionAbility = (121 * _h ^ 2 + 1050) / (_h ^ 2 + 50) * sqrt(sqrt(_h / 27.8)) * _level * (GVAR(HelmetArmorCoef) / 100);
if(_protectionAbility < 0) then {_protectionAbility = 0};

_output = [_helmet, _level, _health, _maxhealth, _protectionAbility, _material, _materialDamageFactor, _ricochetFactor];
_unit setVariable [QGVAR(HelmetInfo), _output, true];
_output;