#include "script_component.hpp"
params["_ammo", "_typeOfDamage"];

_caliber = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_Caliber");
_mass = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_bulletMass");
_typicalSpeed = getNumber (configFile >> "CfgAmmo" >> _ammo >> "typicalSpeed");
_armorPenetration = (getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACAS_armorPenetrationRatio")) / 100;

_penetration = [(configFile >> "CfgAmmo" >> _ammo), "ACAS_penetration", -1] call BIS_fnc_returnConfigEntry;
if(_penetration == -1) then{
	_penetration = (_typicalSpeed * _mass /_caliber) / 10;
};

[_caliber, _mass, _typicalSpeed, _armorPenetration, _penetration];