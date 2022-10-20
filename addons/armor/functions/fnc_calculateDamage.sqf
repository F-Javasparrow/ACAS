#include "script_component.hpp"
params ["_unit", "_damage", "_ammo", "_hitArmor", "_hitPoint", "_typeOfDamage"];

private _damageLeft = _damage * 3;

// 获取子弹数据
private _ammoInfo = [_ammo, _typeOfDamage] call FUNC(getAmmoInfo);
_ammoInfo params ["_caliber", "_mass", "_typicalSpeed", "_armorPenetration", "_penetration"];

// 获取护甲数据
private _armorInfo = [_unit, _hitPoint] call FUNC(getArmorInfo);
(_armorInfo # 0) params ["", "", "_health", "_maxHealth", "_protectionAbility", "", "_materialDamageFactor"];
(_armorInfo # 1) params ["", "", "_pHealth", "_pMaxHealth", "_pProtectionAbility", "", "_pMaterialDamageFactor"];

systemChat str (_armorInfo # 0);

// 护甲机制
if(0 < _pHealth && _pHealth <= _pMaxHealth) then {
	private _b = 0;
	switch(true) do {
		case(_protectionAbility <= _penetration): {_b = (_penetration / (0.9 * _protectionAbility - _penetration)) + 100};
		case(_protectionAbility - 15 <= _penetration && _penetration < _protectionAbility): {_b = (_protectionAbility - _penetration - 15) ^ 2 * 0.4};
		case(_penetration <= _protectionAbility - 15): {_b = 0};
	};
	if(random 100 < _b) then {
		(_armorInfo # 1) set [2, (_health - _penetration * _armorPenetration * _materialDamageFactor * (_penetration / _protectionAbility))];
		_damageLeft = _damageLeft * 0.90;
	} else {
		(_armorInfo # 1) set [2, (_health - _penetration * _armorPenetration * _materialDamageFactor)];
		_damageLeft = _damageLeft * 0.75;
	};
};

if(0 < _health && _health <= _maxHealth) then {
	private _b = 0;
	switch(true) do {
		case(_protectionAbility <= _penetration): {_b = (_penetration / (0.9 * _protectionAbility - _penetration)) + 100};
		case(_protectionAbility - 15 <= _penetration && _penetration < _protectionAbility): {_b = (_protectionAbility - _penetration - 15) ^ 2 * 0.4};
		case(_penetration <= _protectionAbility - 15): {_b = 0};
	};
	if(random 100 < _b) then {
		(_armorInfo # 0) set [2, (_health - _penetration * _armorPenetration * _materialDamageFactor * (_penetration / _protectionAbility))];

		_d = 1 - (0.25 * (_penetration - _protectionAbility));
		if(_d < 0) then {_d = 0};
		_damageLeft = _damageLeft * _d;

		hint str[_penetration, _b, "Breakdown"];
	} else {
		(_armorInfo # 0) set [2, (_health - _penetration * _armorPenetration * _materialDamageFactor)];
		_damageLeft = _damageLeft * 0.15;

		hint str[_penetration, _b, "NotBreakdown"];
	};
};
if(_health < 0) then {_health = 0};

// 更新玩家护甲数据
_unit setVariable [QGVAR(ArmorInfo), (_armorInfo # 0), true];
_unit setVariable [QGVAR(PlateInfo), (_armorInfo # 1), true];

_damageLeft;