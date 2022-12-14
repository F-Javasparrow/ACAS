#include "script_component.hpp"
params ["_player"];

private _armorInfo = [_player, "HitChest"] call FUNC(getArmorInfo);
_armorInfo params ["_vest", "_level", "_health", "_maxHealth", "_protectionAbility", "_material", "_materialDamageFactor"];

private _output = formatText ["%1级%2护甲%3耐久:%4 / %5", _level, _material, lineBreak, _health, _maxHealth];

[
    GVAR(timeToCheckArmor), 
    [_output, _player], 
    {
        (_this # 0) params["_output", "_player"];
        [_output, 1.5, _player, 10] call ace_common_fnc_displaytextstructured;
    },
    {},
    "检查中",
    {
        (_this # 0) params["_output", "_player"];
        (stance _player) != "PRONE";
    }
] call ace_common_fnc_progressBar;
