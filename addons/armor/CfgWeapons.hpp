class CfgWeapons {
	class InventoryItem_Base_F {};
	class VestItem: InventoryItem_Base_F {};
	class Default {};
	class ItemCore: Default {};
	class Vest_Camo_Base: ItemCore {
		class ItemInfo: VestItem {
			armorMaterial = "STELL";
		};
	};
	class Vest_NoCamo_Base: ItemCore {
		class ItemInfo: VestItem {
			armorMaterial = "STELL";
		};
	};
};
