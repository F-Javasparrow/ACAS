# 子弹数据

## ACE & 原版:

| 弹药变量名                        | 穿透力 | 甲伤比例% | 碎弹率% [WIP] |
| --------------------------------- | ------ | --------- | -------------- |
| B_556x45_Ball                     | 28     |           |                |
| B_556x45_dual                     | 23     |           |                |
| ACE_556x45_Ball_Mk262             | 49     | 15        |                |
| ACE_556x45_Ball_Mk318             | 44     | 15        |                |
| ACE_556x45_Ball_M995_AP           | 53     | 10        |                |
| B_545x39_Ball_F                   | 37     |           |                |
| B_65x39_Caseless                  | 30     |           |                |
| B_762x51_Ball                     | 41     |           |                |
| ACE_762x51_Ball_M118LR            | 41     |           |                |
| ACE_762x51_Ball_Mk316_Mod_0       | 64     | 10        |                |
| ACE_762x51_Ball_Mk319_Mod_0       | 44     | 15        |                |
| ACE_762x51_Ball_M993_AP           | 70     | 10        |                |
| ACE_762x51_Ball_Subsonic          | 31     |           |                |
| ACE_762x67_Ball_Mk248_Mod_0       | 44     |           |                |
| ACE_762x67_Ball_Mk248_Mod_1       | 47     |           |                |
| ACE_762x67_Ball_Berger_Hybrid_OTM | 46     |           |                |
| B_762x54_Ball                     | 42     |           |                |
| ACE_762x54_Ball_7T2               | 42     |           |                |
| B_762x39_Ball_F                   | 33     |           |                |
| B_9x21_Ball                       | 35     |           |                |
| ACE_9x19_Ball                     | 20     |           |                |
| B_338_Ball                        | 47     |           |                |
| B_338_NM_Ball                     | 45     |           |                |
| ACE_338_Ball_API526               | 79     | 10        |                |
| B_127x54_Ball                     | 100    | 10        |                |
| B_127x99_Ball                     | 100    | 10        |                |
| ACE_127x99_API                    | 100    | 10        |                |
| ACE_127x99_Ball_AMAX              | 100    | 10        |                |
| B_127x108_Ball                    | 100    | 10        |                |
| B_127x108_APDS                    | 100    | 10        |                |
| B_45ACP_Ball                      | 25     |           |                |
| B_50BW_Ball_F                     | 44     |           |                |

## RHSUSAF:

| 弹药变量名                        | 穿透力 | 甲伤比例% | 碎弹率% [WIP] |
| --------------------------------- | ------ | --------- | -------------- |
| rhsusf_ammo_127x99_M33_Ball       | 100    | 10        |                |
| rhsusf_ammo_127x99_mk211          | 100    | 10        |                |
| rhsusf_B_300winmag                | 45     |           |                |
| rhs_ammo_556x45_M855_Ball         | 28     |           |                |
| rhs_ammo_556x45_M855A1_Ball       | 44     |           |                |
| rhs_ammo_556x45_Mk318_Ball        | 44     | 15        |                |
| rhs_ammo_556x45_Mk262_Ball        | 49     | 15        |                |
| rhs_ammo_762x51_M80_Ball          | 41     |           |                |
| rhs_ammo_762x51_M61_AP            | 64     | 10        |                |
| rhs_ammo_762x51_M62_tracer        | 44     | 15        |                |
| rhs_ammo_762x51_M80A1EPR_Ball     | 41     |           |                |
| rhs_ammo_762x51_M118_Special_Ball | 41     |           |                |
| rhs_ammo_762x51_M993_Ball         | 70     | 10        |                |
| rhs_ammo_46x30_FMJ                | 40     |           |                |
| rhs_ammo_46x30_JHP                | 18     | 40        |                |
| rhs_ammo_46x30_AP                 | 53     | 10        |                |
| rhs_ammo_45ACP_MHP                | 13     |           |                |
| rhs_ammo_9x19_FMJ                 | 20     |           |                |
| rhs_ammo_9x19_JHP                 | 2      | 40        |                |

## RHS:

| 弹药变量名            | 穿透力 | 甲伤比例% | 碎弹率% [WIP] |
| --------------------- | ------ | --------- | -------------- |
| rhs_B_545x39_Ball     | 37     |           |                |
| rhs_B_762x54_Ball     | 42     |           |                |
| rhs_B_762x54_7N1_Ball | 45     | 10        |                |
| rhs_B_762x39_Ball     | 30     |           |                |
| rhs_B_9x19_7N21       | 34     |           |                |
| rhs_B_9x18_57N181S    | 12     |           |                |
| rhs_B_545x39_7U1_Ball | 62     | 10        |                |
| rhs_B_762x39_U_Ball   | 29     |           |                |
| rhs_B_9x39_SP5        | 28     |           |                |
| rhs_B_9x39_SP6        | 46     | 10        |                |

## RHSGREF:

| 弹药变量名           | 穿透力 | 甲伤比例% | 碎弹率% [WIP] |
| -------------------- | ------ | --------- | -------------- |
| rhs_ammo_762x25_Ball | 14     |           |                |
| rhs_ammo_792x57_Ball | 33     |           |                |


## 注:

子弹数据遵循继承机制

未注明 [穿透力] = (_typicalSpeed * _mass / _caliber) / 10

未注明 [甲伤比例%] 均为 [25]

未注明 [碎弹率%] 均为 [0]
