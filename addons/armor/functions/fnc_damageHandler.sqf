#include "script_component.hpp"
params ["_unit", "_allDamages", "_typeOfDamage"];

if ((_allDamages select 0 select 0) > 0) then {
    (_allDamages select 0) params ["_damage", "_bodyPart"];

    if (_damage isEqualTo 0 || {_bodyPart == "#structural"}) exitWith {};

    // _aceSelection is HitBody, HitLegs etc
    private _aceSelection = format ["Hit%1", _bodyPart];
    private _hitArmor = [];

    if(_aceSelection == "HitBody") then {_aceSelection = "HitChest"};
    switch(_aceSelection) do {
        case"HitHead":  {_hitArmor = [headgear _unit]};
        case"HitChest": {_hitArmor = [vest _unit, uniform _unit]};
        case"HitLegs":  {_hitArmor = [uniform _unit]};
        case"HitArms":  {_hitArmor = [uniform _unit]};
    };

    private _actualDamage = _damage;


    // _shooter and _ammo exist in the scope above
    private _damageLeft = [_unit, _damage, _actualDamage, _shooter, _ammo, _hitArmor, _aceSelection] call FUNC(receiveDamage);
    (_allDamages select 0) set [0, _damageLeft];
};

// if you want to do nothing, just exitWith {_this}. if you return nil or [] it will block further handling
if (_allDamages isEqualTo []) exitWith {[]};
[_unit, _allDamages, _typeOfDamage] //return
