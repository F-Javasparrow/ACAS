class CfgAmmo {
	// ToDo: 增加更多子弹类型的甲肉伤比率

// 子弹
	#define JHP   10
	#define FMJ   25
	#define subAP 35
	#define AP    40

    class BulletCore;
    class BulletBase: BulletCore {
        timeToLive=6;
		armorPenetrationRatio = FMJ;
    };

	// ACE 及 原版
    class B_556x45_Ball: BulletBase {};
    class B_556x45_dual: B_556x45_Ball {};
    class ACE_556x45_Ball_Mk262: B_556x45_Ball {};
    class ACE_556x45_Ball_Mk318: B_556x45_Ball {
		armorPenetrationRatio = subAP;
	};
    class ACE_556x45_Ball_M995_AP: B_556x45_Ball {
		armorPenetrationRatio = AP;
	};
    class B_545x39_Ball_F: BulletBase {};
    class B_580x42_Ball_F: BulletBase {};
    class ACE_580x42_DBP88_Ball: B_580x42_Ball_F {};
    class B_65x39_Caseless: BulletBase {};
    class B_65x39_Case_yellow;
    class B_65x39_Caseless_green;
    class ACE_65x47_Ball_Scenar: B_65x39_Caseless {};
    class ACE_65_Creedmor_Ball: B_65x39_Caseless {};
    class B_762x51_Ball: BulletBase {};
    class ACE_762x51_Ball_M118LR: B_762x51_Ball {};
    class ACE_762x51_Ball_Mk316_Mod_0: B_762x51_Ball {};
    class ACE_762x51_Ball_Mk319_Mod_0: B_762x51_Ball {};
    class ACE_762x51_Ball_M993_AP: B_762x51_Ball {
		armorPenetrationRatio = AP;
	};
    class ACE_762x51_Ball_Subsonic: B_762x51_Ball {};
    class ACE_762x67_Ball_Mk248_Mod_0: B_762x51_Ball {};
    class ACE_762x67_Ball_Mk248_Mod_1: B_762x51_Ball {};
    class ACE_762x67_Ball_Berger_Hybrid_OTM: B_762x51_Ball {};
    class B_762x54_Ball: B_762x51_Ball {};
    class ACE_762x54_Ball_7T2: B_762x54_Tracer_Green {};
    class B_762x39_Ball_F: BulletBase {};
    class B_9x21_Ball: BulletBase {};
    class ACE_9x19_Ball: B_9x21_Ball {};
    class B_93x64_Ball: BulletBase {};
    class B_408_Ball: BulletBase {};
    class ACE_408_Ball: BulletBase {};
    class B_338_Ball: BulletBase {};
    class B_338_NM_Ball: BulletBase {};
    class ACE_338_Ball: B_338_Ball {};
    class ACE_338_Ball_API526: B_338_Ball {};
    class B_127x54_Ball: BulletBase {};
    class B_127x99_Ball: BulletBase {};
    class ACE_127x99_API: B_127x99_Ball {};
    class ACE_127x99_Ball_AMAX: B_127x99_Ball {};
    class B_127x108_Ball: BulletBase {};
    class B_127x108_APDS: B_127x108_Ball {};
    class B_45ACP_Ball: BulletBase {};
    class B_50BW_Ball_F: BulletBase {};
    class B_570x28_Ball: BulletBase {};

	// 蓝锤
	class rhsusf_ammo_127x99_M33_Ball: B_127x99_Ball {};
	class rhsusf_ammo_127x99_mk211: rhsusf_ammo_127x99_M33_Ball {};
    class rhsusf_B_300winmag: B_762x54_Ball {};
    class rhs_ammo_556x45_M855_Ball: B_556x45_Ball {};
    class rhs_ammo_556x45_M855A1_Ball: B_556x45_Ball {};
    class rhs_ammo_556x45_Mk318_Ball: B_556x45_Ball {
		armorPenetrationRatio = subAP;
	};
    class rhs_ammo_556x45_Mk262_Ball: B_556x45_Ball {};
    class rhs_ammo_762x51_M80_Ball: BulletBase {};
	class rhs_ammo_762x51_M61_AP: rhs_ammo_762x51_M80_Ball {
		armorPenetrationRatio = AP;
	};
    class rhs_ammo_762x51_M62_tracer: rhs_ammo_762x51_M80_Ball {
		armorPenetrationRatio = subAP;
	};
    class rhs_ammo_762x51_M80A1EPR_Ball: rhs_ammo_762x51_M80_Ball {};
    class rhs_ammo_762x51_M118_Special_Ball: rhs_ammo_762x51_M80_Ball {};
    class rhs_ammo_762x51_M993_Ball: rhs_ammo_762x51_M80_Ball {
		armorPenetrationRatio = AP;
	};
    class rhs_ammo_46x30_FMJ: rhs_ammo_556x45_M855A1_Ball {};
    class rhs_ammo_46x30_JHP: rhs_ammo_46x30_FMJ {};
    class rhs_ammo_46x30_AP: rhs_ammo_46x30_FMJ {
		armorPenetrationRatio = AP;
	};
    class rhs_ammo_45ACP_MHP: BulletBase {};
    class rhs_ammo_9x19_FMJ: BulletBase {};
    class rhs_ammo_9x19_JHP: BulletBase {};

	// 红锤
    class rhs_B_545x39_Ball: B_556x45_Ball {};
    class rhs_B_545x39_Ball_Tracer_Green: rhs_B_545x39_Ball {};
    class B_762x51_Ball;
    class rhs_B_762x54_Ball: B_762x51_Ball {};
    class rhs_B_762x54_Ball_Tracer_Green: rhs_B_762x54_Ball {};
    class rhs_B_762x54_7N1_Ball: rhs_B_762x54_Ball {
		armorPenetrationRatio = AP;
	};
    class rhs_B_762x39_Ball: B_762x51_Ball {};
    class B_9x21_Ball;
    class rhs_B_9x19_7N21: B_9x21_Ball {};
    class rhs_B_9x18_57N181S: B_9x21_Ball {};
    class rhs_B_545x39_7U1_Ball: rhs_B_545x39_Ball {
		armorPenetrationRatio = subAP;
	};
    class rhs_B_762x39_U_Ball: rhs_B_762x39_Ball {};
    class rhs_B_9x39_SP5: rhs_B_762x39_Ball {};
    class rhs_B_9x39_SP6: rhs_B_9x39_SP5 {
		armorPenetrationRatio = AP;
	};

	// 绿锤
    class rhs_ammo_762x25_Ball: BulletBase {};
    class rhs_ammo_792x57_Ball: BulletBase {};

};
