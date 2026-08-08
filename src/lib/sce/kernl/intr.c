#include "common.h"

INCLUDE_ASM("main", DisableIntc);
INCLUDE_ASM("main", EnableIntc);
INCLUDE_ASM("main", DisableDmac);
INCLUDE_ASM("main", EnableDmac);
INCLUDE_ASM("main", SetAlarm);
INCLUDE_ASM("main", ReleaseAlarm);
INCLUDE_ASM("main", iEnableIntc);
INCLUDE_ASM("main", iDisableIntc);
INCLUDE_ASM("main", iEnableDmac);
INCLUDE_ASM("main", iDisableDmac);
INCLUDE_ASM("main", iSetAlarm);
INCLUDE_ASM("main", iReleaseAlarm);
