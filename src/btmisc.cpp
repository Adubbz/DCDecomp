#include "common.h"

#include "btmisc.hpp"

#include <cstdio>
#include <cstdlib>

#include <libvu0.h>

#include "camera.hpp"
#include "dataread.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "itemdata.hpp"
#include "mds.hpp"
#include "dataalloc.hpp"
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

#ifdef NON_MATCHING
CFrame *LoadMDSFilePack(unsigned int *pack, char *name, CDataAlloc2<1> *buffer) {
    int size;
    unsigned int *file = GetPackFile(pack, name, &size);

    if (file == NULL) {
        printf("Model NotFound!!%s\n", name);
        exit__2(-1);
    }
    return (CFrame *) LoadMDSFile(file, buffer, 0, NULL, NULL);
}
#else
INCLUDE_ASM("asm/nonmatchings/btmisc", LoadMDSFilePack__FPUiPcP14CDataAlloc2_1_);
#endif
INCLUDE_RODATA("asm/nonmatchings/btmisc", @879__2);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @887__4);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @888__3);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @889__3);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @890__3);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @891__3);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @892__3);
#ifdef NON_MATCHING
CFrame *LoadCollisionFilePack(unsigned int *pack, char *name, CDataAlloc2<1> *buffer) {
    int size;
    unsigned int *file = GetPackFile(pack, name, &size);

    if (file == NULL) {
        printf("Model NotFound!!%s\n", name);
        exit__2(-1);
    }
    return (CFrame *) LoadCollisionFile(file, buffer);
}
#else
INCLUDE_ASM("asm/nonmatchings/btmisc", LoadCollisionFilePack__FPUiPcP14CDataAlloc2_1_);
#endif
/**
 * Puts the camera on the two named frames of a model's path.
 *
 * @mangled setCameraPassData__FP9CFrameVu1P7CCameraPcPc
 * @address 0x1B6E80
 * @size 0xA4
 */
#ifdef NON_MATCHING
void setCameraPassData(CFrameVu1 *frame, CCamera *camera, char *position_name,
                       char *reference_name) {
    sceVu0FMATRIX matrix;

    // A matrix's fourth row is where the frame stands.
    frame->SearchFrame(reference_name)->GetLWMatrix(matrix);
    camera->SetRef(matrix[3]);
    frame->SearchFrame(position_name)->GetLWMatrix(matrix);
    camera->SetPos(matrix[3]);
}
#else
INCLUDE_ASM("asm/nonmatchings/btmisc", setCameraPassData__FP9CFrameVu1P7CCameraPcPc);
#endif
#ifdef NON_MATCHING
void getFramePos(CFrameVu1 *frame, char *name, float *position) {
    sceVu0FVECTOR origin = {0.0f, 0.0f, 0.0f, 0.0f};

    frame->SearchFrame(name)->GetWorldPosition(position, origin);
}
#else
INCLUDE_ASM("asm/nonmatchings/btmisc", getFramePos__FP9CFrameVu1PcPf);
#endif
/**
 * Builds the resource name of one weapon.
 *
 * @mangled makeWeaponName__FPci
 * @address 0x1B6F80
 * @size 0x198
 */
INCLUDE_ASM("asm/nonmatchings/btmisc", makeWeaponName__FPci);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @919__2);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @920__2);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @921__2);
/**
 * Builds the model and texture paths of one item.
 *
 * @mangled BtGetItemNamePath__FPcPci
 * @address 0x1B7120
 * @size 0x124
 */
INCLUDE_ASM("asm/nonmatchings/btmisc", BtGetItemNamePath__FPcPci);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @928__2);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @929__2);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @930__2);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @931__3);
INCLUDE_ASM("asm/nonmatchings/btmisc", BtGetWeaponNamePath2__FPcPcii);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @946);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @947);
#ifdef NON_MATCHING
void BtGetWeaponNamePath3(char *name, char *effect_name, int weapon_no) {
    static int defWeapon[6] = {0x101, 0x12B, 0x13A, 0x14B, 0x15B, 0x16B};

    if (weapon_no < 0x101) {
        return;
    }

    WEAPON_DATA *weapon = GetWeaponData(weapon_no);
    if (weapon != NULL) {
        // The identifier counts on from the first weapon of the chain.
        int chara_no = weapon->owner;
        int offset = weapon_no - defWeapon[chara_no];

        printf("offset %d\n", offset);
        BtGetWeaponNamePath2(name, effect_name, chara_no, offset);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/btmisc", BtGetWeaponNamePath3__FPcPci);
#endif
INCLUDE_RODATA("asm/nonmatchings/btmisc", @953);
/**
 * Records in the save file that an Atla has been collected.
 *
 * @mangled getAtraToSaveData__FiiP9CSaveDataii
 * @address 0x1B7470
 * @size 0xBC
 */
INCLUDE_ASM("asm/nonmatchings/btmisc", getAtraToSaveData__FiiP9CSaveDataii);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @958);
/**
 * Gives how much of an attachment one item yields.
 *
 * @mangled createAttachVolume__Fii
 * @address 0x1B7530
 * @size 0xE8
 */
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

/**
 * Crossfades between the field and battle music as the party nears a monster.
 *
 * @mangled BtBattleMusic_Excg__FfPfPf
 * @address 0x1B7690
 * @size 0x12C
 */
INCLUDE_ASM("asm/nonmatchings/btmisc", BtBattleMusic_Excg__FfPfPf);
INCLUDE_ASM("asm/nonmatchings/btmisc", BtGetFloorLevel__Fi);
