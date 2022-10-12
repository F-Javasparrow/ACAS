class CfgWeapons {
	class Default {};
	class ItemCore: Default {};
	class InventoryItem_Base_F {};
	class VestItem: InventoryItem_Base_F {};

	// 头盔
	class HelmetBase: ItemCore {
		class ItemInfo: VestItem {
			armorMaterial = "POLYMERS";
		};
	};

    // 护甲
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

	// 衣服
	class Uniform_Base: ItemCore {
		class ItemInfo: VestItem {
			armorMaterial = "CLOTH";
		};
	};
};
