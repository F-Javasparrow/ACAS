#include "script_component.hpp"

// 设置伤害介入EH
["CAManBase", "InitPost", {
    params ["_unit"];

    _unit setVariable ["ace_medical_engine_$#structural", [0, 0]];
    private _id = _unit addEventHandler ["HandleDamage", {
        _this call FUNC(handleDamageEh);
    }];
}, true, [], true] call CBA_fnc_addClassEventHandler;

if(local player) then {
    [player] call FUNC(handleArmorState);
};

["handleArmorState", {_this call FUNC(handleArmorState)}] call CBA_fnc_addEventHandler;
