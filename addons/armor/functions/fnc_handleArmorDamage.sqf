#include "script_component.hpp"
params ["_unit", "_damage", "_ammo", "_instigator", "_hitArmor", "_hitPoint"];

private _receivedDamage = false;
private _vest = vestContainer _unit;

// 获取命中子弹穿深参数
private _penetrationMult = GVAR(ammoPenCache) getOrDefault [_ammo, -1];
if (_penetrationMult isEqualTo -1) then {
    // cache multiplier
    private _caliber = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_Caliber");
    private _mass = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_bulletMass");
    if (_caliber isEqualTo 0) then {
        // handle none ace configured bullets
        _caliber = getNumber (configFile >> "CfgAmmo" >> _ammo >> "caliber");
        _mass = (getNumber (configFile >> "CfgAmmo" >> _ammo >> "hit")) / 2;
    };
    _penetrationMult = _caliber * _mass;
    GVAR(ammoPenCache) set [_ammo, _penetrationMult];
};

private _mmPenned = (_damage * _penetrationMult) * (125 / 1000);

// 多次计算可命中护甲减伤
private _damageLeft = _damage;
private _healthList = [];
{ 
    private _gear = _x;

    // 如非可命中护甲就跳过计算步骤
    if(_gear isEqualTo "") then {continue};

    // 获取玩家护甲数据
    private _armorInfo = [_gear, _hitPoint] call FUNC(getArmorInfo);
    _armorInfo params ["_level", "_maxhealth", "_strength", "_thickness", "_material", "_breakdownValue", "_notBreakdownValue"];

    private _health = _maxhealth;
    private _savedHealthList = _unit getVariable [GVAR(ArmorHealth), []];
    private _index = _savedHealthList findIf {_x # 0 == _gear};
    if(_index != -1) then {
        _health = _savedHealthList # _index # 1;
    };

    // 护甲机制
    if(_health > 0) then {
        if(_health > _maxhealth) then {_health = _maxhealth};

        if (random 1 > _strength) then {
            _mmPenned = 999;
        };

        if (_mmPenned > _thickness) then {
            _health = _health - (_damageLeft * _breakdownValue);
            //_strength = _strength - (_mmPenned * _breakdownValue);
            _mmPenned = _mmPenned - _thickness * 0.75;

            _damageLeft = _damageLeft * (1 - _breakdownValue);
        } else {
            _health = _health - (_damageLeft * _notBreakdownValue);
            //_strength = _strength - (_mmPenned * _notBreakdownValue);
            _mmPenned = 0;

            _damageLeft = _damageLeft * 0.05;
        };

        if(_health < 0) then {_health = 0};
    };

    _healthList pushBack [_gear, _health];
}forEach _hitArmor;

// 更新玩家护甲数据
_unit setVariable [GVAR(ArmorHealth), _healthList];

[_damageLeft, _receivedDamage];
