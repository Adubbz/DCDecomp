#include "common.h"

#include <libvu0.h>

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "btmisc.hpp"
#include "camera.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dngstatusdata.hpp"
#include "dun/gameloop.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "itemdata.hpp"
#include "mds.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#ifdef NON_MATCHING // draft includes
#include "menu_save.hpp"
#endif

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
extern float BtBattleMusic_Vol;

CFrame *LoadMDSFilePack(unsigned int *pack, char *name, CDataAlloc2<1> *buffer) {
    int size;
    unsigned int *file = GetPackFile(pack, name, &size);

    if (file == NULL) {
        printf("Model NotFound!!%s\n", name);
        exit__2(-1);
    }
    return (CFrame *) LoadMDSFile(file, buffer, 0, NULL, NULL);
}
INCLUDE_RODATA("asm/nonmatchings/btmisc", @887__4);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @888__3);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @889__3);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @890__3);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @891__3);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @892__3);
CFrame *LoadCollisionFilePack(unsigned int *pack, char *name, CDataAlloc2<1> *buffer) {
    int size;
    unsigned int *file = GetPackFile(pack, name, &size);

    if (file == NULL) {
        printf("Model NotFound!!%s\n", name);
        exit__2(-1);
    }
    return (CFrame *) LoadCollisionFile(file, buffer);
}
/**
 * Puts the camera on the two named frames of a model's path.
 *
 * @mangled setCameraPassData__FP9CFrameVu1P7CCameraPcPc
 * @address 0x1B6E80
 * @size 0xA4
 */
void setCameraPassData(CFrameVu1 *frame, CCamera *camera, char *position_name,
                       char *reference_name) {
    sceVu0FMATRIX matrix;

    // A matrix's fourth row is where the frame stands.
    frame->SearchFrame(reference_name)->GetLWMatrix(matrix);
    camera->SetRef(matrix[3]);
    frame->SearchFrame(position_name)->GetLWMatrix(matrix);
    camera->SetPos(matrix[3]);
}

/**
 * Gives the world position of one frame of a model.
 *
 * @mangled getFramePos__FP9CFrameVu1PcPf
 * @address 0x1B6F30
 * @size 0x50
 */
void getFramePos(CFrameVu1 *frame, char *name, float *position) {
    CFrame *found = frame->SearchFrame(name);
    sceVu0FVECTOR origin;

    // The position wanted is the frame's own origin.
    origin[0] = origin[1] = origin[2] = 0.0f;
    origin[3] = 0.0f;
    found->GetWorldPosition(position, origin);
}
/**
 * Builds the resource name of one weapon.
 *
 * @mangled makeWeaponName__FPci
 * @address 0x1B6F80
 * @size 0x198
 */
#ifdef NON_MATCHING
void makeWeaponName(char *name, int weapon_no) {
    char *prefix[6] = {"c01w", "c04w", "c06w", "c05w", "c10w", "c18w"};
    int first[6] = {0x101, 0x12B, 0x13A, 0x14B, 0x15B, 0x16B};
    char number[32];
    int chara_no = 0;

    if (weapon_no >= 0x101) {
        if (weapon_no >= 0x101 && weapon_no < 0x12B) {
        }
        if (weapon_no >= 0x12B && weapon_no < 0x13A) {
            chara_no = 1;
        }
        if (weapon_no >= 0x13A && weapon_no < 0x14B) {
            chara_no = 2;
        }
        if (weapon_no >= 0x14B && weapon_no < 0x15B) {
            chara_no = 3;
        }
        if (weapon_no >= 0x15B && weapon_no < 0x16B) {
            chara_no = 4;
        }
        if (weapon_no >= 0x16B) {
            chara_no = 5;
        }
    }
    strcpy(name, "dun/item/main_wep/");
    strcat(name, prefix[chara_no]);
    int offset = weapon_no - first[chara_no];
    if (offset < 10) {
        sprintf(number, "0%d", offset);
    } else {
        sprintf(number, "%2d", offset);
    }
    strcat(name, number);
}
#else
INCLUDE_ASM("asm/nonmatchings/btmisc", makeWeaponName__FPci);
#endif
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
#ifdef NON_MATCHING
/** Base name of each item's model and texture files, beginning with attachments. */
extern char *ITEM_NAME_TBL_NEW[];

void BtGetItemNamePath(char *model_path, char *texture_path, int item_no) {
    item_no = TransWepNo(item_no);
    if (item_no >= 0x101) {
        makeWeaponName(model_path, item_no);
    } else {
        if (ITEM_NAME_TBL_NEW[item_no - ITEM_ATTACH_START] == NULL) {
            item_no = 0x91;
        }
        strcpy(model_path, "dun/item/main_data/");
        strcat(model_path, ITEM_NAME_TBL_NEW[item_no - ITEM_ATTACH_START]);
    }
    strcpy(texture_path, model_path);
    strcat(model_path, ".mds");
    strcat(texture_path, ".img");
    printf("mds = %s\n", model_path);
    printf("img = %s\n", texture_path);
}
#else
INCLUDE_ASM("asm/nonmatchings/btmisc", BtGetItemNamePath__FPcPci);
#endif
INCLUDE_RODATA("asm/nonmatchings/btmisc", @928__2);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @929__2);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @930__2);
INCLUDE_RODATA("asm/nonmatchings/btmisc", @931__3);
extern char nameWepBuff_mds[];
extern char nameWepBuff_img[];

#ifdef NON_MATCHING
void BtGetWeaponNamePath2(char *name, char *path, int chara, int weapon) {
    char *prefix[6] = {"c01w", "c04w", "c06w", "c05w", "c10w", "c18w"};
    char number[32];
    char *base = prefix[chara];

    strcpy(nameWepBuff_mds, base);
    strcpy(nameWepBuff_img, base);
    if (weapon < 10) {
        sprintf(number, "0%d", weapon);
    } else {
        sprintf(number, "%2d", weapon);
    }
    strcat(nameWepBuff_mds, number);
    strcat(nameWepBuff_mds, ".chr");
    strcat(nameWepBuff_img, number);
    strcat(nameWepBuff_img, ".cfg");
    strcpy(name, nameWepBuff_mds);
    strcpy(path, nameWepBuff_img);
}
#else
INCLUDE_ASM("asm/nonmatchings/btmisc", BtGetWeaponNamePath2__FPcPcii);
#endif
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
void getAtraToSaveData(int atra, int atra_no, CSaveData *save, int dungeon, int floor) {
    printf("GET ATRA [%d] !!\n", atra);
    if (atra < 0x28) {
        save->AtraPartsGet(dungeon, atra);
    } else {
        save->AtraChipGet(dungeon, atra - 0x28);
    }
    ((CDngStatusData *) UserStatus)->GetAtraData(dungeon, floor, atra_no);
}
/**
 * Gives how much of an attachment one item yields.
 *
 * @mangled createAttachVolume__Fii
 * @address 0x1B7530
 * @size 0xE8
 */
int createAttachVolume(int item_no, int unused) {
    int volume;

    if (item_no < 0x5B || item_no > 0x5E) {
        return 0;
    }
    int total = (int) ((50.0f * (float) rand()) / 2.1474836e9f);
    total += (int) ((50.0f * (float) rand()) / 2.1474836e9f);
    volume = 1;
    if (total < 31) {
        volume = 2;
    }
    if (total < 16) {
        volume = 3;
    }
    return volume;
}

void BtBattleMusic_Init() {
    BtBattleMusic_Flag = 0;
    BtBattleMusic_Wait = 0;
    BtBattleMusic_Vol = 0.0f;
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
void BtBattleMusic_Excg(float distance, float *field_volume, float *battle_volume) {
    if (BtBattleMusic_Flag != 0) {
        if (distance >= 110.0f) {
            if (BtBattleMusic_Wait == 0) {
                BtBattleMusic_Vol -= 1.0f / 30.0f;
                if (BtBattleMusic_Vol < 0.1f) {
                    BtBattleMusic_Flag = 0;
                    BtBattleMusic_Vol = 0.0f;
                }
            } else {
                BtBattleMusic_Wait--;
            }
        } else if (BtBattleMusic_Vol < 0.9f) {
            BtBattleMusic_Vol += 1.0f / 30.0f;
        }
    }
    if (BtBattleMusic_Flag == 0 && distance <= 100.0f) {
        BtBattleMusic_Flag = 1;
    }
    if (BtBattleMusic_Vol >= 0.9f) {
        BtBattleMusic_Vol = 0.9f;
    }
    if (BtBattleMusic_Vol <= 0.0f) {
        BtBattleMusic_Vol = 0.0f;
    }
    *field_volume = 1.0f - BtBattleMusic_Vol;
    *battle_volume = BtBattleMusic_Vol;
}

extern int yearFloorTbl[25];

int BtGetFloorLevel(int dungeon_no) {
    if (dungeon_no >= 0 && dungeon_no < 25) {
        return yearFloorTbl[dungeon_no];
    }
    return 0;
}
