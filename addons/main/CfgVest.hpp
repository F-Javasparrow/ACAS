class Default {};
class ItemCore: Default {};
class InventoryItem_Base_F {};
class VestItem: InventoryItem_Base_F {};

class Vest_Camo_Base: ItemCore {
	class ItemInfo: VestItem {
		ACAS_armorMaterial = "STEEL";
	};
};
class Vest_NoCamo_Base: ItemCore {
	class ItemInfo: VestItem {
		ACAS_armorMaterial = "STEEL";
	};
};