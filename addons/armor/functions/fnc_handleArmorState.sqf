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

	private _headgear = headgear _unit;
	private _vest = vest _unit;
	private _uniform = uniform _unit;

	private _healthList = [];

	{
		// 获取护甲数据
		private _gear = _x # 0;
		private _hitPoint = _x # 1;
		private _armorInfo = [_gear, _hitPoint] call FUNC(getArmorInfo);
    	_armorInfo params ["_level", "_maxhealth", "_strength", "_thickness", "_material", "_breakdownValue", "_notBreakdownValue"];

		private _health = _maxhealth;
		private _savedHealthList = _unit getVariable [QGVAR(ArmorHealth), [["", -1], ["", -1], ["", -1]]];
		private _index = _savedHealthList findIf {_x # 0 == _gear};
		if(_index != -1) then {
			_health = _savedHealthList # _index # 1;
		};

		switch(_forEachIndex) do {
			case "1": {
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
			};
			case "2": {
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
			};
			case "3": {

			};
		};

		_healthList pushBack [_gear, _health];
	}forEach [[_headgear, "HitHead"], [_vest, "HitChest"], [_uniform, "HitChest"]];

	_unit setVariable [QGVAR(ArmorHealth), _healthList, true];
}, 3, [_unit]] call CBA_fnc_addPerFrameHandler