#include "script_component.hpp"
params ["_unit", "_damage", "_ammo", "_hitArmor", "_hitPoint", "_typeOfDamage"];

private _damageLeft = _damage * GVAR(damageCoef);
private _gear = vest _unit;

// 获取子弹数据
private _ammoInfo = [_ammo, _typeOfDamage] call EFUNC(armor,getAmmoInfo);
_ammoInfo params ["_caliber", "_mass", "_typicalSpeed", "_armorPenetration", "_penetration"];

// 获取护甲数据
private _helmetInfo = [_unit, "hitHead"] call FUNC(getHelmetInfo);
_helmetInfo params ["_helmet", "_level", "_health", "_maxHealth", "_protectionAbility", "_material", "_materialDamageFactor"];

// 护甲机制
switch(true) do {
	case(_protectionAbility <= _penetration): {_b = (100 + _penetration / (0.9 * _protectionAbility - _penetration))};
	case(_protectionAbility-15 <= _penetration && _penetration < _protectionAbility): {_b = (_protectionAbility - _penetration - 15) ^ 2 * 0.4};
	case(_penetration <= _protectionAbility-15): {_b = 0};
};
if(random 100 < _b) then {
	_health = _penetration * _armorPenetration  * _materialDamageFactor * (_penetration / _protectionAbility);
	_damageLeft = _damageLeft * 0.35 * (_penetration - _protectionAbility);
	_penetration = _penetration - (_protectionAbility * GVAR(mmPennedBreakdownCoef));
} else {
	_health = _penetration * _armorPenetration  * _materialDamageFactor;
	_damageLeft = _damageLeft * 0.15;
	_penetration = 0;
};

if(_health < 0) then {_health = 0};

// 更新玩家护甲数据
_unit setVariable [QGVAR(HelmetInfo), [_level, _health, _maxHealth, _material, _materialDamageFactor], true];

_damageLeft;