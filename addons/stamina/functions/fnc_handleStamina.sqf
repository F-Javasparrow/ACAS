#include "script_component.hpp"
/*
 * Author: Javasparrow
 * Handling stamina systems
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget] call acas_stamina_fnc_handleStamina;
 *
 * Public: No
 */
params ["_unit"];

if (_unit getVariable [QGVAR(handleStamina_PFH), false]) exitWith {};
_unit setVariable [QGVAR(handleStamina_PFH), true];

if (!local _unit) then {
    ["handleStamina", [_unit], _unit] call CBA_fnc_targetEvent;
};

_unit setVariable [QGVAR(exhaustionEnd), 10e10];

[{
	params ["_args", "_idPFH"];
    _args params ["_unit"];

	private _defaultStamina = getNumber (configFile >> "CfgMovesFatigue" >> "staminaDuration");
	private _runCD = getNumber (configFile >> "CfgMovesFatigue" >> "staminaCooldown");
	private _exhaustionEnd = _unit getVariable [QGVAR(exhaustionEnd), 10e10];

	_unit enableAimPrecision FALSE;

    if (!alive _unit && isNull _unit && vehicle _unit != _unit) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
        _unit setVariable [QGVAR(handleStamina_PFH), nil];
    };

	private _armorSprintCoef = _unit getVariable [QEGVAR(main,armorSprintCoef), 1];
	private _armorRunCoef    = _unit getVariable [QEGVAR(main,armorRunCoef), 1];
	private _helmetAimCoef   = _unit getVariable [QEGVAR(main,helmetAimCoef), 1];

	private _maxStamina = _defaultStamina - (_defaultStamina * load _unit);
	private _curStamina = getStamina _unit;

	private _noSprintLim = _maxStamina * GVAR(noSprintCoef) * _armorSprintCoef;	// --- sprint treshold
	private _noRunLim = _maxStamina * GVAR(noRunCoef) * _armorRunCoef;		   	// --- run treshold

	if (_curStamina <= _noRunLim) then {
		if !(isForcedWalk _unit) then {
			_unit forceWalk TRUE;
			_exhaustionEnd = time + _runCD;
			_unit setVariable [QGVAR(exhaustionEnd), _exhaustionEnd];

			setStaminaScheme "Exhausted";
		};
	} else {
		if (isForcedWalk _unit && time > _exhaustionEnd) then {
			_unit forceWalk FALSE;

			setStaminaScheme "FastDrain";
		};
		if (_curStamina <= _noSprintLim) then {
			if (isSprintAllowed _unit) then {
				_unit allowSprint FALSE;

				setStaminaScheme "FastDrain";
			};
		} else {
			if !(isSprintAllowed _unit) then {
				_unit allowSprint TRUE;

				setStaminaScheme "Default";
			};
		};
		if (_curStamina > _noSprintLim) then {
		_unit forceWalk FALSE;
		_unit allowSprint TRUE;

		setStaminaScheme "Default";
		};
	};

	// --- slow down animations based on stamina level
	_animSpeedCoef = 0.75 + (0.25 * (_curStamina / _maxStamina));
	_maxSlowdown = getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> animationState player >> "relSpeedMin");

	if (_maxSlowdown > 0 && _maxSlowdown > _animSpeedCoef) then {
		_animSpeedCoef = _maxSlowdown;
	};
	_unit setAnimSpeedCoef _animSpeedCoef;

	// --- weapon sway
	_staminaPerc = _curStamina / _maxStamina;
	_stanceAimPrecision = getAnimAimPrecision player;
	_unit setCustomAimCoef ((5 - (_staminaPerc * 5) + _stanceAimPrecision) * _helmetAimCoef);

}, 1, [_unit]] call CBA_fnc_addPerFrameHandler;