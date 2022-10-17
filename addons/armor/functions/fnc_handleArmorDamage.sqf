#include "script_component.hpp"
params ["_unit", "_damage", "_ammo", "_instigator", "_hitArmor", "_hitPoint", "_typeOfDamage"];

private _receivedDamage = false;
private _vest = vestContainer _unit;

_damage = _damage * GVAR(damageCoef);

private _caliber = 1;
private _mass = 2;
private _typicalSpeed = 380;
private _armorPenetrationRatio = 0.3;
private _mmPenned = 0;
switch(_typeOfDamage) do {
    case "bullet": {
        _caliber = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_Caliber");
        _mass = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_bulletMass");
        _typicalSpeed = getNumber (configFile >> "CfgAmmo" >> _ammo >> "typicalSpeed");
        _armorPenetrationRatio = (getNumber (configFile >> "CfgAmmo" >> _ammo >> "armorPenetrationRatio")) / 100;

        _mmPenned = _typicalSpeed * _mass /_caliber * GVAR(mmPennedCoef) / 10;
    };
    case "grenade": {

    };
    case "explosive": {

    };
    case "shell": {
        _mmPenned = 1024;
        _armorPenetrationRatio = 0.1;
    };
};

// 获取命中子弹穿深参数


// 多次计算可命中护甲减伤
private _damageLeft = _damage;
private _healthList = [];
{
    private _gear = _x;

    // 获取玩家护甲数据
    private _armorInfo = [_gear, _hitPoint] call FUNC(getArmorInfo);
    _armorInfo params ["_level", "_maxhealth", "_strength", "_thickness", "_material", "_breakdownValue", "_notBreakdownValue"];

    private _health = _maxhealth;
    private _savedHealthList = _unit getVariable [QGVAR(ArmorHealth), [["", -1], ["", -1], ["", -1]]];
    private _index = _savedHealthList findIf {_x # 0 == _gear};
    if(_index != -1) then {
        _health = _savedHealthList # _index # 1;
    };

    // 只有可命中护甲才进行计算步骤
    if((_hitArmor findIf {_x isEqualTo _gear}) != -1) then {

        systemChat str [_damage, _mmPenned, _typeOfDamage];
        systemChat str [_level, _maxhealth, _strength, _thickness, _material];
        systemChat str _savedHealthList;

        private _bodyDamage = _damageLeft * (1 - _armorPenetrationRatio);
        private _armorDamage = _damageLeft * _armorPenetrationRatio;

        // 护甲机制
        if(_health > 0) then {
            if(_health > _maxhealth) then {_health = _maxhealth};

            if (random 1 > _strength) then {
                _mmPenned = _mmPenned * GVAR(strengthToLowCoef);
            };

            if (_mmPenned > _thickness) then {
                _health = _health - (_armorDamage * _breakdownValue * 100);
                _mmPenned = _mmPenned - (_thickness * GVAR(mmPennedBreakdownCoef));

                _damageLeft = _bodyDamage / 2;
            } else {
                _health = _health - (_armorDamage * _notBreakdownValue * 100);
                _mmPenned = 0;

                _damageLeft = _bodyDamage * GVAR(damageLeftNotBreakdownCoef);
            };

            if(_health < 0) then {_health = 0};
        };
    };

    _healthList pushBack [_gear, _health];
}forEach [headgear _unit, vest _unit, uniform _unit];

// 更新玩家护甲数据
_unit setVariable [QGVAR(ArmorHealth), _healthList, true];

[_damageLeft, _receivedDamage];
