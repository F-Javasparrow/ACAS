class CfgWeapons {
	class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACAS_armorPlate: ACE_ItemCore  {
        scope = 2;
        scopeCurator = 2;
        scopeArsenal = 2;
        author = "Javasparrow";
        // model = QPATHTOF(data\plate.p3d);
        picture = QPATHTOF(ui\plate_ca.paa);
        displayName = "防弹插板";
        descriptionShort = "通用III级防弹插板";
        descriptionUse = "通用III级防弹插板";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };

        ACAS_level = "2.5";
        ACAS_armorMaterial = "CERAMIC";
    };
};