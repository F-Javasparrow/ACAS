#include "script_component.hpp"

GVAR(ammoPenCache) = createHashMap;

["CAManBase", "InitPost", {
    params ["_unit"];
    _unit setVariable ["ace_medical_engine_$#structural", [0, 0]];
    private _id = _unit addEventHandler ["HandleDamage", {
        _this call FUNC(handleDamageEh);
    }];
    _unit setVariable ["AAS_HandleDamageEHID", _id];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["handleArmor", {_this call FUNC(handleArmor)}] call CBA_fnc_addEventHandler;
