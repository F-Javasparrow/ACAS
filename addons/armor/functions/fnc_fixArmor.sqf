#include "script_component.hpp"
params["_unit"];

GVAR(fixArmor_blackList) = [];

private _armorInfo = [_unit, "HitChest"] call FUNC(getArmorInfo);
(_armorInfo # 0) params ["_vest", "_level", "_health", "_maxHealth", "_protectionAbility", "_material", "_materialDamageFactor"];

if(_material in ALLOWFIXMETERIALLIST) then {
	if(_maxHealth * (GVAR(fixArmor_addLowHealth) / 100) >= _health) then {
		_health = _health + GVAR(fixArmor_addHealth);
		if(_health > _maxHealth) then {_health = _maxHealth};
		(_armorInfo # 0) set [2, _health];
		[
			GVAR(timeToFixArmor), 
			[_unit, _health], 
			{
				(_this # 0) params["_unit", "_health"];
				_unit removeItem ACAS_armorPlate;
				_unit setVariable [QGVAR(ArmorInfo), (_armorInfo # 0), true];
			},
			{},
			"检查中",
			{
				(_this # 0) params["_unit", ""];
				(stance _unit) != "PRONE";
			}
		] call ace_common_fnc_progressBar;
	};
};