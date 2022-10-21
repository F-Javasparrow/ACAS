#include "script_component.hpp"
params ["_unit", "_damage", "_ammo", "_hitArmor", "_hitPoint", "_typeOfDamage"];

if (_damage <= 0) exitWith {0};
private _returnedDamage = _damage;

switch (_typeOfDamage) do {
	case "bullet":   {_returnedDamage = [_unit, _returnedDamage, _ammo, _hitArmor, _hitPoint] call FUNC(calculateDamage)};
	case "explosive":{_returnedDamage = [_unit, _returnedDamage, _ammo, _hitArmor, _hitPoint] call FUNC(calculateExplosive)};
	case "grenade":  {_returnedDamage = [_unit, _returnedDamage, _ammo, _hitArmor, _hitPoint] call FUNC(calculateExplosive)};
	case "shell":    {_returnedDamage = [_unit, _returnedDamage, _ammo, _hitArmor, _hitPoint] call FUNC(calculateExplosive)};
};

_returnedDamage;
