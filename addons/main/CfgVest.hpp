class Default {};
class ItemCore: Default {};
class InventoryItem_Base_F {};
class VestItem: InventoryItem_Base_F {};

class Vest_Camo_Base: ItemCore {
	ACAS_armorMaterial = "ARAMIND";
	ACAS_armorType = "Normal";
};
class Vest_NoCamo_Base: ItemCore {
	ACAS_armorMaterial = "ARAMIND";
	ACAS_armorType = "Normal";
};

// BI
class V_TacVest_khk: Vest_Camo_Base {
	ACAS_armorMaterial = "UHMWPE";
};
class V_RebreatherB: Vest_Camo_Base {
	ACAS_armorMaterial = "STEEL";
};
class V_PlateCarrier1_rgr: Vest_Camo_Base {
	ACAS_armorMaterial = "TITAN";
};
class V_EOD_base_F: Vest_Camo_Base {
	ACAS_armorMaterial = "CERAMIC";
	ACAS_armorType = "EOD";
};
class V_PlateCarrierSpec_rgr: Vest_Camo_Base {
	ACAS_armorMaterial = "CERAMIC";
	ACAS_armorType = "Heavy";
};
class V_Press_F: Vest_Camo_Base{
	ACAS_armorMaterial = "COMBINED";
};

// RHS
class rhs_6b23: Vest_Camo_Base {
	ACAS_armorMaterial = "CERAMIC";
};
class rhs_6b13: rhs_6b23 {
	ACAS_armorMaterial = "TITAN";
};
class rhs_6b2: Vest_Camo_Base {
	ACAS_armorMaterial = "ARAMIND";
};
class rhs_6b3: rhs_6b2 {
	ACAS_armorMaterial = "TITAN";

	class ItemInfo: VestItem {
		class HitpointsProtectionInfo {
			class Chest {
				armor = 20;
			};
		};
	};
};
class rhs_6b43: rhs_6b23 {
	ACAS_armorMaterial = "TITAN";
};
class rhs_6b45: rhs_6b43 {
	ACAS_armorMaterial = "CERAMIC";
};
class rhs_6b5: rhs_6b23 {
	ACAS_armorMaterial = "TITAN";

	class ItemInfo: VestItem {
		class HitpointsProtectionInfo {
			class Chest {
				armor = 24;
			};
		};
	};
};

// RHSUSAF
class rhsusf_iotv_ocp_base: Vest_Camo_Base {
	ACAS_armorMaterial = "TITAN";
};
class rhsusf_plateframe_sapi: rhsusf_iotv_ocp_base {
	ACAS_armorMaterial = "CERAMIC";
};
class rhsusf_spc: rhsusf_iotv_ocp_base {
	ACAS_armorMaterial = "CERAMIC";
};