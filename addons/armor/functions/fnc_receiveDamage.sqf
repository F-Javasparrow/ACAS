#include "script_component.hpp"
params ["_unit", "_damage", "_actualDamage", "_instigator", "_ammo", "_hitArmor", "_aceSelection"];

if (_damage <= 0) exitWith {0};

private _initialActualDamage = _actualDamage;
private _player = call CBA_fnc_currentUnit;
private _returnedDamage = [_unit, _actualDamage, _ammo, _instigator,_hitArmor, _aceSelection] call FUNC(handleArmorDamage);
_actualDamage = _returnedDamage select 0;

//_damage * (_actualDamage / _initialActualDamage);
_actualDamage;
