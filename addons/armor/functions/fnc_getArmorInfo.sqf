#include "script_component.hpp"
params["_gear", "_hitPoint"];

private _level = "0";
private _armorInfo = ArmorLevel_0;
private _materialInfo = ArmorType_CLOTH;

private _armor = [_gear, _hitPoint] call ace_medical_engine_fnc_getItemArmor;

switch(true) do {
    case(_armor <= 4 ): {_level = "0"; _armorInfo = ArmorLevel_0  };
    case(4 < _armor && _armor <= 10): {_level = "1"; _armorInfo = ArmorLevel_1};
    case(10 < _armor && _armor <= 14): {_level = "2"; _armorInfo = ArmorLevel_2};
    case(14 < _armor && _armor <= 18): {_level = "3"; _armorInfo = ArmorLevel_3};
    case(18 < _armor && _armor <= 22): {_level = "4"; _armorInfo = ArmorLevel_4};
    case(22 < _armor && _armor <= 26): {_level = "5"; _armorInfo = ArmorLevel_5};
    case(26 < _armor && _armor <= 30): {_level = "6"; _armorInfo = ArmorLevel_6};
    case(30 < _armor && _armor <= 75): {_level = "6P"; _armorInfo = ArmorLevel_6P};
    case(75 < _armor): {_level="EOD"; _armorInfo = ArmorLevel_EOD};
};

private _material = getText(configFile >> "CfgWeapons" >> _gear >> "ItemInfo" >> "armorMaterial");
switch(_material) do {
    case"CLOTH":    {_materialInfo = ArmorType_CLOTH   };
    case"KEVLAR":   {_materialInfo = ArmorType_KEVLAR  };
    case"POLYMERS": {_materialInfo = ArmorType_POLYMERS};
    case"STELL":    {_materialInfo = ArmorType_STELL   };
    case"CERAMICS": {_materialInfo = ArmorType_CERAMICS};
};

private _ouput = [_level];
_ouput append _armorInfo;
_ouput append _materialInfo;
_ouput;