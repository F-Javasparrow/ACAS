#include "script_component.hpp"
params ["_player"];

private _gear = vest _player;

_armorInfo = [_gear, "HitChest"] call FUNC(getArmorInfo);
_armorInfo params ["_level", "_maxhealth", "_strength", "_thickness", "_material", "_breakdownValue", "_notBreakdownValue"];

private _health = _maxhealth;
private _savedHealthList = _player getVariable [QGVAR(ArmorHealth), [["", -1], ["", -1], ["", -1]]];
private _index = _savedHealthList findIf {_x # 0 == _gear};
if(_index != -1) then {
    _health = _savedHealthList # _index # 1;
};

private _output = format ["%1级%2护甲耐久:%3 / %4", _level, _material, _health, _maxhealth];

[
    GVAR(timeToCheckArmor), 
    [_output, _player], 
    {
        params["_output", "_player"];
        [_output, 1.5, _player] call ace_common_fnc_displayTextStructured;
    },
    {},
    "检查中",
    {(stance _player) != "PRONE"}
] call ace_common_fnc_progressBar;
