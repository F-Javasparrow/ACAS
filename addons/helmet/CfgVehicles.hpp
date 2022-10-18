class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACAS_CheckHelmet {
                    displayName = "检查头盔";
                    condition = "(stance _player) != 'PRONE'";
                    exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                    statement = "[_player] call acas_helmet_fnc_checkHelmet";
                };
            };
        };
    };
};