#include "script_component.hpp"

if(local player) then {
    [player] call FUNC(handleStamina);
};

// ["handleStamina", {_this call FUNC(handleStamina)}] call CBA_fnc_addEventHandler;
