#include "script_component.hpp"
#define MATERIAL_ARAMIND     ["ARAMIND",   0.25]
#define MATERIAL_UHMWPE      ["UHMWPE",    0.45]
#define MATERIAL_COMBINED    ["COMBINED",  0.50]
#define MATERIAL_TITAN       ["TITAN",     0.55]
#define MATERIAL_STEEL       ["STEEL",     0.70]
#define MATERIAL_CERAMIC     ["CERAMIC",   0.80]
params["_unit", "_hitPoint"];

private _armorInfo = _unit getVariable [QGVAR(HelmetInfo), ["NULL", 0, 100, 0, 0, "ARAMIND", 0]];
_armorInfo params ["_helmet", "_level", "_health", "_maxHealth", "_protectionAbility", "_material", "_materialDamageFactor"];

// 更新数据
_helmet = headgear _unit;
_armor = getNumber(configFile >> "CfgWeapons" >> _helmet >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor");
switch(true) do {
    case(0 <= _armor && _armor < 4):   {_level = 0;_maxhealth = 0};
    case(4 <= _armor && _armor  < 10): {_level = 1;_maxhealth = 0};
    case(10 <= _armor && _armor < 14): {_level = 2;_maxhealth = 20};
    case(14 <= _armor && _armor < 18): {_level = 3;_maxhealth = 25};
    case(18 <= _armor && _armor < 22): {_level = 4;_maxhealth = 25};
    case(22 <= _armor && _armor < 26): {_level = 5;_maxhealth = 30};
    case(26 <= _armor):                {_level = 6;_maxhealth = 35};
};
if(_health > _maxhealth) then {_health = _maxhealth;};
if!(_helmet isEqualTo _armorInfo # 0) then {_health = _maxhealth;};

_material = getText(configFile >> "CfgWeapons" >> _helmet >> "ItemInfo" >> "armorMaterial");
_meterialList = [MATERIAL_ARAMIND, MATERIAL_UHMWPE, MATERIAL_COMBINED, MATERIAL_TITAN, MATERIAL_TITAN, MATERIAL_STEEL, MATERIAL_CERAMIC];
_materialDamageFactor = _meterialList # (_meterialList findIf {_x # 0 == _material}) # 1;

_protectionAbility = 0;
_h = 0;
if(_health * _maxHealth != 0) then {_h = _health/_maxHealth * 100} 
else {_h = 0};
_protectionAbility = (121 - 5000 / (_h ^ 2 + 45)) * sqrt(sqrt(_h / 2780)) * _level;

_output = [_helmet, _level, _health, _maxhealth, _protectionAbility, _material, _materialDamageFactor];
_unit setVariable [QGVAR(HelmetInfo), _output, true];
_output;