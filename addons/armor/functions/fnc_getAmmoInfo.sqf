#include "script_component.hpp"
params["_ammo", "_type"];

private _output = [];
switch (_type) do {
	case "bullet": {
		_caliber = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_Caliber");
		_mass = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_bulletMass");
		_typicalSpeed = getNumber (configFile >> "CfgAmmo" >> _ammo >> "typicalSpeed");
		_armorPenetration = (getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACAS_armorPenetrationRatio")) / 100;

		_penetration = [(configFile >> "CfgAmmo" >> _ammo), "ACAS_penetration", -1] call BIS_fnc_returnConfigEntry;
		if(_penetration == -1) then{
			_penetration = (_typicalSpeed * _mass /_caliber) / 10;
		};

		_output = [_caliber, _mass, _typicalSpeed, _armorPenetration, _penetration];
	};
	case "explosive": {
		
	};
};

_output;