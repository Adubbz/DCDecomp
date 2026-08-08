#include "common.h"

/* Battle support: pack loading, item name paths, battle music, floor queries. */

INCLUDE_ASM("main", LoadMDSFilePack__FPUiPcP14CDataAlloc2_1_);
INCLUDE_ASM("main", LoadCollisionFilePack__FPUiPcP14CDataAlloc2_1_);
INCLUDE_ASM("main", setCameraPassData__FP9CFrameVu1P7CCameraPcPc);
INCLUDE_ASM("main", getFramePos__FP9CFrameVu1PcPf);
INCLUDE_ASM("main", makeWeaponName__FPci);
INCLUDE_ASM("main", BtGetItemNamePath__FPcPci);
INCLUDE_ASM("main", BtGetWeaponNamePath2__FPcPcii);
INCLUDE_ASM("main", BtGetWeaponNamePath3__FPcPci);
INCLUDE_ASM("main", getAtraToSaveData__FiiP9CSaveDataii);
INCLUDE_ASM("main", createAttachVolume__Fii);
INCLUDE_ASM("main", BtBattleMusic_Init__Fv);
INCLUDE_ASM("main", BtBattleMusic_Stop__Fv);
INCLUDE_ASM("main", BtBattleMusic_Excg__FfPfPf);
INCLUDE_ASM("main", BtGetFloorLevel__Fi);
