class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACAS_CheckArmor {
                    displayName = "检查护甲";
                    condition = "(stance _player) != 'PRONE'";
                    exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                    statement = "[_player] call acas_armor_fnc_checkarmor";
                };
            };
        };
    };
};