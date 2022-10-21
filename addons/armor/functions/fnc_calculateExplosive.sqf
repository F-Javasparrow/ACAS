#include "script_component.hpp"
params ["_unit", "_damage", "_ammo", "_hitArmor", "_hitPoint"];

private _damageLeft = _damage;

// 获取数据
private _armorInfo = [_unit, _hitPoint] call FUNC(getArmorInfo);
(_armorInfo # 0) params ["", "", "_health", "_maxHealth", "", "", "", "_materialExplosiveDamageFactor"];
(_armorInfo # 1) params ["", "", "_pHealth", "_pMaxHealth", "", "", "", ""];

// systemChat str (_armorInfo # 0);

// 护甲机制
if(0 < _health && _health <= _maxHealth) then {
	(_armorInfo # 0) set [2, (_health - _penetration * _armorPenetration * _materialExplosiveDamageFactor)];
	_damageLeft = _damageLeft * 0.15;
};
if(_health < 0) then {_health = 0};

// 更新玩家护甲数据
_unit setVariable [QGVAR(ArmorInfo), (_armorInfo # 0), true];
_unit setVariable [QGVAR(PlateInfo), (_armorInfo # 1), true];

_damageLeft;