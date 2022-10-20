class CfgAmmo {
	// ToDo: 增加更多子弹类型的甲肉伤比率

// 子弹
	#define JHP   40
	#define FMJ   25
	#define subAP 15
	#define AP    10

  class BulletCore;
  class BulletBase: BulletCore {
    ACAS_penetration = 28;
	  ACAS_armorPenetrationRatio = FMJ;
  };

// ACE 及 原版
  class B_556x45_Ball: BulletBase {
    ACAS_penetration = 28;
  };
  class B_556x45_dual: B_556x45_Ball {
    ACAS_penetration = 23;
  };
  class ACE_556x45_Ball_Mk262: B_556x45_Ball {
    ACAS_penetration = 49;
    ACAS_armorPenetrationRatio = subAP;
  };
  class ACE_556x45_Ball_Mk318: B_556x45_Ball {
    ACAS_penetration = 44;
    ACAS_armorPenetrationRatio = subAP;
	};
  class ACE_556x45_Ball_M995_AP: B_556x45_Ball {
    ACAS_penetration = 53;
		ACAS_armorPenetrationRatio = AP;
	};
  class B_545x39_Ball_F: BulletBase {
    ACAS_penetration = 37;
  };
  class ACE_580x42_DBP88_Ball: B_580x42_Ball_F {};
  class B_65x39_Caseless: BulletBase {
    ACAS_penetration = 30;
  };
  class B_762x51_Ball: BulletBase {
    ACAS_penetration = 41;
  };
  class ACE_762x51_Ball_M118LR: B_762x51_Ball {
    ACAS_penetration = 41;
  };
  class ACE_762x51_Ball_Mk316_Mod_0: B_762x51_Ball {
    ACAS_penetration = 64;
    ACAS_armorPenetrationRatio = AP;
  };
  class ACE_762x51_Ball_Mk319_Mod_0: B_762x51_Ball {
    ACAS_penetration = 44;
    ACAS_armorPenetrationRatio = subAP;
  };
  class ACE_762x51_Ball_M993_AP: B_762x51_Ball {
    ACAS_penetration = 70;
		ACAS_armorPenetrationRatio = AP;
	};
  class ACE_762x51_Ball_Subsonic: B_762x51_Ball {
    ACAS_penetration = 31;
  };
  class ACE_762x67_Ball_Mk248_Mod_0: B_762x51_Ball {
    ACAS_penetration = 44;
  };
  class ACE_762x67_Ball_Mk248_Mod_1: B_762x51_Ball {
    ACAS_penetration = 47;
  };
  class ACE_762x67_Ball_Berger_Hybrid_OTM: B_762x51_Ball {
    ACAS_penetration = 46;
  };
  class B_762x54_Ball: B_762x51_Ball {
    ACAS_penetration = 42;
  };
  class ACE_762x54_Ball_7T2: B_762x54_Tracer_Green {
    ACAS_penetration = 	42;
  };
  class B_762x39_Ball_F: BulletBase {
    ACAS_penetration = 	33;
  };
  class B_9x21_Ball: BulletBase {
    ACAS_penetration = 	35;
  };
  class ACE_9x19_Ball: B_9x21_Ball {
    ACAS_penetration = 	20;
  };
  class B_338_Ball: BulletBase {
    ACAS_penetration = 47;
  };
  class B_338_NM_Ball: BulletBase {
    ACAS_penetration = 45;
  };
  class ACE_338_Ball: B_338_Ball {};
  class ACE_338_Ball_API526: B_338_Ball {
    ACAS_penetration = 79;
    ACAS_armorPenetrationRatio = AP;
  };
  class B_127x54_Ball: BulletBase {
    ACAS_penetration = 100;
    ACAS_armorPenetrationRatio = AP;
  };
  class B_127x99_Ball: BulletBase {
    ACAS_penetration = 100;
    ACAS_armorPenetrationRatio = AP;
  };
  class ACE_127x99_API: B_127x99_Ball {
    ACAS_penetration = 100;
    ACAS_armorPenetrationRatio = AP;
  };
  class ACE_127x99_Ball_AMAX: B_127x99_Ball {
    ACAS_penetration = 100;
    ACAS_armorPenetrationRatio = AP;
  };
  class B_127x108_Ball: BulletBase {
    ACAS_penetration = 100;
    ACAS_armorPenetrationRatio = AP;
  };
  class B_127x108_APDS: B_127x108_Ball {
    ACAS_penetration = 100;
    ACAS_armorPenetrationRatio = AP;
  };
  class B_45ACP_Ball: BulletBase {
    ACAS_penetration = 25;
  };
  class B_50BW_Ball_F: BulletBase {
    ACAS_penetration = 44;
  };

	// 蓝锤
	class rhsusf_ammo_127x99_M33_Ball: B_127x99_Ball {
    ACAS_penetration = 100;
    ACAS_armorPenetrationRatio = AP;
  };
	class rhsusf_ammo_127x99_mk211: rhsusf_ammo_127x99_M33_Ball {
    ACAS_penetration = 100;
    ACAS_armorPenetrationRatio = AP;
  };
  class rhsusf_B_300winmag: B_762x54_Ball {
    ACAS_penetration = 45;
  };
  class rhs_ammo_556x45_M855_Ball: B_556x45_Ball {
    ACAS_penetration = 28;
  };
  class rhs_ammo_556x45_M855A1_Ball: B_556x45_Ball {
    ACAS_penetration = 44;
  };
  class rhs_ammo_556x45_Mk318_Ball: B_556x45_Ball {
    ACAS_penetration = 44;
		ACAS_armorPenetrationRatio = subAP;
	};
  class rhs_ammo_556x45_Mk262_Ball: B_556x45_Ball {
    ACAS_penetration = 49;
    ACAS_armorPenetrationRatio = subAP;
  };
  class rhs_ammo_762x51_M80_Ball: BulletBase {
    ACAS_penetration = 41;
  };
	class rhs_ammo_762x51_M61_AP: rhs_ammo_762x51_M80_Ball {
    ACAS_penetration = 64;
		ACAS_armorPenetrationRatio = AP;
	};
  class rhs_ammo_762x51_M62_tracer: rhs_ammo_762x51_M80_Ball {
    ACAS_penetration = 44;
		ACAS_armorPenetrationRatio = subAP;
	};
  class rhs_ammo_762x51_M80A1EPR_Ball: rhs_ammo_762x51_M80_Ball {
    ACAS_penetration = 41;
  };
  class rhs_ammo_762x51_M118_Special_Ball: rhs_ammo_762x51_M80_Ball {
    ACAS_penetration = 41;
  };
  class rhs_ammo_762x51_M993_Ball: rhs_ammo_762x51_M80_Ball {
    ACAS_penetration = 70;
		ACAS_armorPenetrationRatio = AP;
	};
  class rhs_ammo_46x30_FMJ: rhs_ammo_556x45_M855A1_Ball {
    ACAS_penetration = 40;
  };
  class rhs_ammo_46x30_JHP: rhs_ammo_46x30_FMJ {
    ACAS_penetration = 18;
    ACAS_armorPenetrationRatio = JHP;
  };
  class rhs_ammo_46x30_AP: rhs_ammo_46x30_FMJ {
    ACAS_penetration = 53;
		ACAS_armorPenetrationRatio = AP;
	};
  class rhs_ammo_45ACP_MHP: BulletBase {
    ACAS_penetration = 13;
  };
  class rhs_ammo_9x19_FMJ: BulletBase {
    ACAS_penetration = 20;
  };
  class rhs_ammo_9x19_JHP: BulletBase {
    ACAS_penetration = 2;
    ACAS_armorPenetrationRatio = JHP;
  };

	// 红锤
  class rhs_B_545x39_Ball: B_556x45_Ball {
    ACAS_penetration = 37;
  };
  class rhs_B_545x39_Ball_Tracer_Green: rhs_B_545x39_Ball {};
  class rhs_B_762x54_Ball: B_762x51_Ball {
    ACAS_penetration = 42;
  };
  class rhs_B_762x54_Ball_Tracer_Green: rhs_B_762x54_Ball {};
  class rhs_B_762x54_7N1_Ball: rhs_B_762x54_Ball {
    ACAS_penetration = 45;
		ACAS_armorPenetrationRatio = AP;
	};
  class rhs_B_762x39_Ball: B_762x51_Ball {
    ACAS_penetration = 30;
  };
  class rhs_B_9x19_7N21: B_9x21_Ball {
    ACAS_penetration = 34;
  };
  class rhs_B_9x18_57N181S: B_9x21_Ball {
    ACAS_penetration = 12;
  };
  class rhs_B_545x39_7U1_Ball: rhs_B_545x39_Ball {
    ACAS_penetration = 62;
		ACAS_armorPenetrationRatio = AP;
	};
  class rhs_B_762x39_U_Ball: rhs_B_762x39_Ball {
    ACAS_penetration = 29;
  };
  class rhs_B_9x39_SP5: rhs_B_762x39_Ball {
    ACAS_penetration = 28;
  };
  class rhs_B_9x39_SP6: rhs_B_9x39_SP5 {
    ACAS_penetration = 46;
		ACAS_armorPenetrationRatio = AP;
	};

	// 绿锤
  class rhs_ammo_762x25_Ball: BulletBase {
    ACAS_penetration = 14;
  };
  class rhs_ammo_792x57_Ball: BulletBase {
    ACAS_penetration = 33;
  };
};
