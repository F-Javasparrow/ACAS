#include "script_component.hpp"
params ["_player"];

private _armorInfo = [_player, "HitChest"] call FUNC(getArmorInfo);
_armorInfo params ["_vest", "_level", "_health", "_maxHealth", "_protectionAbility", "_material", "_materialDamageFactor"];

private _output = format ["%1级%2护甲耐久:%3 / %4", _level, _material, _health, _maxHealth];

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
