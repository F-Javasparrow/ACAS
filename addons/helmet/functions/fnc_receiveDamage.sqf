#include "script_component.hpp"
params ["_unit", "_damage", "_ammo", "_hitArmor", "_hitPoint", "_typeOfDamage"];

if (_damage <= 0) exitWith {0};

private _returnedDamage = [_unit, _damage, _ammo, _hitArmor, _hitPoint, _typeOfDamage] call FUNC(calculateDamage);

_returnedDamage;
