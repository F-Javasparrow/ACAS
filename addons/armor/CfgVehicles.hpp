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
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = "[_player] call acas_armor_fnc_checkarmor";
                };

                /*
                 class ACAS_addPlate {
                    displayName = "加装额外插板";
                    condition = "[_player] call acas_armor_fnc_canAddPlate";
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = "[_player] call acas_armor_fnc_addPlate";
                }; 
                */

                class ACAS_fixArmor {
                    displayName = "修复护甲";
                    condition = "[_player] call acas_armor_fnc_canFixArmor";
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = "[_player] call acas_armor_fnc_fixArmor";
                };
            };
        };
    };

    // 物品
    class Item_Base_F;
    class ACAS_armorPlate_Item: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        scopeArsenal = 2;
        displayName= "通用III级防弹插板";
        author = "Javasparrow";
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACAS_armorPlate,1);
        };
    };
};