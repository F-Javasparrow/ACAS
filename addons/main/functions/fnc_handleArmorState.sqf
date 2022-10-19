#include "script_component.hpp"
params["_unit"];

if (_unit getVariable [QGVAR(ArmorState_PFH), false]) exitWith {};
_unit setVariable [QGVAR(ArmorState_PFH), true];

if (!local _unit) then {
    ["handleArmorState", [_unit], _unit] call CBA_fnc_targetEvent;
};

[{
	params ["_args", "_idPFH"];
    _args params ["_unit"];

	if !(alive _unit) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
        _unit setVariable [QGVAR(ArmorState_PFH), nil];
    };

	// 护甲
	private _armorInfo = [_unit, "HitChest"] call EFUNC(armor,getArmorInfo);
	_armorInfo params ["_vest", "_level", "_health", "_maxHealth", "_protectionAbility", "_material", "_materialDamageFactor"];
	switch(_level) do {
		case"3": {
			_unit setVariable [QGVAR(armorSprintCoef), 0.90];
			_unit setVariable [QGVAR(armorRunCoef), 0.50];
		};
		case"4": {
			_unit setVariable [QGVAR(armorSprintCoef), 1.05];
			_unit setVariable [QGVAR(armorRunCoef), 1.00];
		};
		case"5": {
			_unit setVariable [QGVAR(armorSprintCoef), 1.15];
			_unit setVariable [QGVAR(armorRunCoef), 1.5];
		};
		case"6": {
			_unit setVariable [QGVAR(armorSprintCoef), 1.25];
			_unit setVariable [QGVAR(armorRunCoef), 2.5];
		};
	};

	// 头盔 
	private _helmetInfo = [_unit, "HitHead"] call EFUNC(helmet,getHelmetInfo);
	_helmetInfo params ["_helmet", "_level", "_health", "_maxHealth", "_protectionAbility", "_material", "_materialDamageFactor"];
	switch(_level) do {
		case"3": {
			_unit setVariable [QGVAR(helmetAimCoef), 1.00];
		};
		case"4": {
			_unit setVariable [QGVAR(helmetAimCoef), 1.20];
		};
		case"5": {
			_unit setVariable [QGVAR(helmetAimCoef), 1.75];
		};
		case"6": {
			_unit setVariable [QGVAR(helmetAimCoef), 2.00];
		};
	};
}, 5, [_unit]] call CBA_fnc_addPerFrameHandler