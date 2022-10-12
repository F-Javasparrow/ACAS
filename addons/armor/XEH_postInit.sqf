#include "script_component.hpp"

// 设置护甲血量监视
["CAManBase", "Local", {
    params ["_unit", "_isLocal"];

    if (_isLocal || !alive _unit) exitWith {};
    private _healthList = [];
    {
        private _gear = _x;
        private _health = -1;
        private _savedHealthList = _unit getVariable [QGVAR(ArmorHealth), [["", -1], ["", -1], ["", -1]]];
        private _index = _savedHealthList findIf {_x # 0 == _gear};
        if(_index != -1) then {
            _health = _savedHealthList # _index # 1;
        };

        _healthList pushBack [_gear, _health];
    }forEach [headgear _unit, vest _unit, uniform _unit];

    [QGVAR(ArmorHealthSync), [_unit, _healthList], _unit] call CBA_fnc_targetEvent;
}, true, [], true] call CBA_fnc_addClassEventHandler;

[QGVAR(ArmorHealthSync), {
    params ["_unit", "_healthList"];
    _unit setVariable [QGVAR(ArmorHealth), _healthList];
}] call CBA_fnc_addEventHandlerArgs;

// 设置伤害介入EH
["CAManBase", "InitPost", {
    params ["_unit"];

    _unit setVariable ["ace_medical_engine_$#structural", [0, 0]];
    private _id = _unit addEventHandler ["HandleDamage", {
        _this call FUNC(handleDamageEh);
    }];

    _unit setVariable ["ACAS_HandleDamageEHID", _id];
}, true, [], true] call CBA_fnc_addClassEventHandler;
