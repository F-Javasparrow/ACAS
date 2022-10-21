#include "script_component.hpp"
params["_unit"];

GVAR(fixArmor_blackList) = [];

if((vest _unit) isEqualTo "") exitwith {false};
if!(('ACAS_armorPlate' in (uniformItems _unit)) || ('ACAS_armorPlate' in (vestItems _unit)) || ('ACAS_armorPlate' in (backpackItems _unit))) exitwith {false};
if((vest _unit) in GVAR(fixArmor_blackList)) exitwith {false};

true;