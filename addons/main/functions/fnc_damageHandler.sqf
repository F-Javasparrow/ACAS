#include "script_component.hpp"
params ["_unit", "_allDamages", "_typeOfDamage"];

{
    _x params ["_damage", "_bodyPart"];

    if (_damage <= 0 || {_bodyPart == "#structural"}) then {continue};

    private _aceSelection = format ["Hit%1", _bodyPart];
    private _hitArmor = [];
    private _damageLeft = _damage;

    if(_aceSelection == "HitBody") then {_aceSelection = "HitChest"};
    switch(_aceSelection) do {
        case"HitHead":  {
            _damageLeft = [_unit, _damageLeft, _ammo, headgear _unit, _aceSelection, _typeOfDamage] call EFUNC(helmet,receiveDamage);
        };
        case"HitChest": {
            _damageLeft = [_unit, _damageLeft, _ammo, vest _unit, _aceSelection, _typeOfDamage] call EFUNC(armor,receiveDamage);
            // _damageLeft = [_unit, _damage, _damageLeft, _ammo, uniform _unit, _aceSelection, _typeOfDamage] call EFUNC(armor, receiveDamage)
        };
        case"HitLegs":  {
            // _damageLeft = [_unit, _damage, _damageLeft, _ammo, uniform _unit, _aceSelection, _typeOfDamage] call EFUNC(armor, receiveDamage);
        };
        case"HitArms":  {
            // _damageLeft = [_unit, _damage, _damageLeft, _ammo, uniform _unit, _aceSelection, _typeOfDamage] call EFUNC(armor, receiveDamage);
        };
    };

    _x set [0, _damageLeft];
}forEach _allDamages;

if (_allDamages isEqualTo []) exitWith {[]};
[_unit, _allDamages, _typeOfDamage]
