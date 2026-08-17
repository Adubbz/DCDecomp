#include "common.h"

/* Battle support: pack loading, item name paths, battle music, floor queries. */

INCLUDE_ASM("asm/nonmatchings/btmisc", LoadMDSFilePack__FPUiPcP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/btmisc", LoadCollisionFilePack__FPUiPcP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/btmisc", setCameraPassData__FP9CFrameVu1P7CCameraPcPc);
INCLUDE_ASM("asm/nonmatchings/btmisc", getFramePos__FP9CFrameVu1PcPf);
INCLUDE_ASM("asm/nonmatchings/btmisc", makeWeaponName__FPci);
INCLUDE_ASM("asm/nonmatchings/btmisc", BtGetItemNamePath__FPcPci);
INCLUDE_ASM("asm/nonmatchings/btmisc", BtGetWeaponNamePath2__FPcPcii);
INCLUDE_ASM("asm/nonmatchings/btmisc", BtGetWeaponNamePath3__FPcPci);
INCLUDE_ASM("asm/nonmatchings/btmisc", getAtraToSaveData__FiiP9CSaveDataii);
INCLUDE_ASM("asm/nonmatchings/btmisc", createAttachVolume__Fii);
INCLUDE_ASM("asm/nonmatchings/btmisc", BtBattleMusic_Init__Fv);
INCLUDE_ASM("asm/nonmatchings/btmisc", BtBattleMusic_Stop__Fv);
INCLUDE_ASM("asm/nonmatchings/btmisc", BtBattleMusic_Excg__FfPfPf);
INCLUDE_ASM("asm/nonmatchings/btmisc", BtGetFloorLevel__Fi);
