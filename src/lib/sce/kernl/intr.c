#include "common.h"

INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/intr", DisableIntc);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/intr", EnableIntc);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/intr", DisableDmac);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/intr", EnableDmac);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/intr", SetAlarm);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/intr", ReleaseAlarm);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/intr", iEnableIntc);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/intr", iDisableIntc);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/intr", iEnableDmac);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/intr", iDisableDmac);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/intr", iSetAlarm);
INCLUDE_ASM("asm/nonmatchings/lib/sce/kernl/intr", iReleaseAlarm);
