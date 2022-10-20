class CfgVehicles {
    // 护甲
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACAS_Armor {
                displayName = "护甲";
                condition = "";
                statement = "";
                class ACAS_CheckArmor {
                    displayName = "检查护甲";
                    condition = "(stance _player) != 'PRONE'";
                    exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                    statement = "[_player] call acas_armor_fnc_checkarmor";
                };
            };
        };
    };

    // 物品
    class Item_Base_F;
    class GVAR(plateItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "防弹插板";
        author = "Javasparrow";
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(plate,1);
        };
    };
};