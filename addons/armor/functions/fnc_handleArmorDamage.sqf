#include "script_component.hpp"
params ["_unit", "_damage", "_ammo", "_instigator", "_hitArmor", "_hitPoint"];

private _receivedDamage = false;
private _vest = vestContainer _unit;

// 获取命中子弹穿深参数
private _caliber = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_Caliber");
private _mass = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_bulletMass");
if (_caliber isEqualTo 0) then {
    _caliber = getNumber (configFile >> "CfgAmmo" >> _ammo >> "caliber");
    _mass = (getNumber (configFile >> "CfgAmmo" >> _ammo >> "hit")) / 2;
};
private _mmPenned = (_caliber * _mass) * (GVAR(mmPennedCoef) / 100);

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

        systemChat str [_damage, _mmPenned, _hitArmor, _hitPoint];
        systemChat str [_level, _maxhealth, _strength, _thickness, _material, _breakdownValue, _notBreakdownValue];
        systemChat str _savedHealthList;

        // 护甲机制
        if(_health > 0) then {
            if(_health > _maxhealth) then {_health = _maxhealth};

            if (random 1 > _strength) then {
                _mmPenned = _mmPenned * GVAR(strengthToLowCoef);
            };

            if (_mmPenned > _thickness) then {
                _health = _health - (_damageLeft * _breakdownValue * 100);
                //_strength = _strength - (_mmPenned * _breakdownValue);
                _mmPenned = _mmPenned - (_thickness * GVAR(mmPennedBreakdownCoef));

                _damageLeft = _damageLeft * (1 - _breakdownValue);
            } else {
                _health = _health - (_damageLeft * _notBreakdownValue * 100);
                //_strength = _strength - (_mmPenned * _notBreakdownValue);
                _mmPenned = 0;

                _damageLeft = _damageLeft * GVAR(damageLeftNotBreakdownCoef);
            };

            if(_health < 0) then {_health = 0};
        };
    };

    _healthList pushBack [_gear, _health];
}forEach [headgear _unit, vest _unit, uniform _unit];

// 更新玩家护甲数据
_unit setVariable [QGVAR(ArmorHealth), _healthList, true];

[_damageLeft, _receivedDamage];
