#include "common.h"

#include "btmisc.hpp"
#include "snd.hpp"

/* Battle support: pack loading, item name paths, battle music, floor queries. */

/**
 * Whether the battle-music transition is active.
 */
extern int BtBattleMusic_Flag;

/**
 * The delay before the next battle-music transition.
 */
extern int BtBattleMusic_Wait;

/**
 * The current battle-music volume.
 */
extern int BtBattleMusic_Vol;

INCLUDE_ASM("asm/nonmatchings/btmisc", LoadMDSFilePack__FPUiPcP14CDataAlloc2_1_);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @879__2);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @887__4);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @888__3);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @889__3);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @890__3);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @891__3);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @892__3);
INCLUDE_ASM("asm/nonmatchings/btmisc", LoadCollisionFilePack__FPUiPcP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/btmisc", setCameraPassData__FP9CFrameVu1P7CCameraPcPc);
INCLUDE_ASM("asm/nonmatchings/btmisc", getFramePos__FP9CFrameVu1PcPf);
INCLUDE_ASM("asm/nonmatchings/btmisc", makeWeaponName__FPci);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @919__2);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @920__2);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @921__2);
INCLUDE_ASM("asm/nonmatchings/btmisc", BtGetItemNamePath__FPcPci);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @928__2);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @929__2);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @930__2);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @931__3);
INCLUDE_ASM("asm/nonmatchings/btmisc", BtGetWeaponNamePath2__FPcPcii);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @946);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @947);
INCLUDE_ASM("asm/nonmatchings/btmisc", BtGetWeaponNamePath3__FPcPci);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @953);
INCLUDE_ASM("asm/nonmatchings/btmisc", getAtraToSaveData__FiiP9CSaveDataii);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @958);
INCLUDE_ASM("asm/nonmatchings/btmisc", createAttachVolume__Fii);

void BtBattleMusic_Init() {
    BtBattleMusic_Flag = 0;
    BtBattleMusic_Wait = 0;
    BtBattleMusic_Vol = 0;
}

void BtBattleMusic_Stop() {
    if (BtBattleMusic_Flag != 0) {
        SndSetBgmVolf(1.0f);
        SndAmbientSetVolf(0.0f);
        BtBattleMusic_Init();
    }
}

INCLUDE_ASM("asm/nonmatchings/btmisc", BtBattleMusic_Excg__FfPfPf);
INCLUDE_ASM("asm/nonmatchings/btmisc", BtGetFloorLevel__Fi);
