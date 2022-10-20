class CfgWeapons {
	class ItemCore;
    class CBA_MiscItem ;
    class CBA_MiscItem_ItemInfo;

    class GVAR(plate): CBA_MiscItem  {
        scope = 2;
        author = "Javasparrow";
        // model = QPATHTOF(data\armor_plate.p3d);
        // picture = QPATHTOF(ui\armor_plate_ca.paa);
        displayName = "防弹插板";
        descriptionShort = "通用III级防弹插板";
        descriptionUse = "通用III级防弹插板";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };
};