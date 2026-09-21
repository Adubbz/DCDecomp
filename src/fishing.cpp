#include "fishing.hpp"

#include <libgraph.h>
#include <libpkt.h>
#include <libvu0.h>

#include <cstdlib>
#include <cstring>

#include "boxvu0.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "edit.hpp"
#include "editloop3.hpp"
#include "fish.hpp"
#include "framevu1.hpp"
#include "mathutil.hpp"
#include "mds.hpp"
#include "mglib.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"

/**
 * Describes one kind of bait that can be put on the hook.
 */
struct EsaInfo {
    int item_no;  /**< Item the bait is made from. */
    float radius; /**< Distance from which fish notice the bait. */
};

/**
 * The kinds of bait, indexed by esa_type.
 */
extern EsaInfo esa_info[13];

/**
 * The water surface height used by the fishing simulation.
 */
extern float WaterLevel;

/**
 * The terrain height used by the fishing simulation.
 */
extern float GroundLevel;

/**
 * The ground height under the float.
 */
extern float UkiGroundLevel;

/**
 * The ground height under the hook.
 */
extern float HookGroundLevel;

/**
 * The fish fighting the line, or null when none is.
 */
extern CFish *BattleFish;

/**
 * The fish displayed after an angling battle, or null when none is displayed.
 */
extern CFish *AngleFish;

/**
 * The current tension applied to the fishing hook.
 */
extern float pull_hook;

/**
 * The model of the bait on the hook, or null when the hook is bare.
 */
extern CFrameVu1 *EsaFrame;

/**
 * The kind of bait on the hook, or -1 when the hook is bare.
 */
extern int esa_type;

/**
 * The line's hook model.
 */
extern CFrame *HookFrame;

/**
 * The line's float model.
 */
extern CFrame *UkiFrame;

/**
 * The texture slot of the rod, float and hook, or -99 before they are read.
 */
extern int fishing_texb;

/**
 * The texture slot of the fish, or -99 before they are read.
 */
extern int fish_texb;

/**
 * The texture slot of the bait, or -99 before it is read.
 */
extern int esa_texb;

/**
 * The fish of the fishing spot.
 */
extern CFish *Fish;

/**
 * The number of fish read for the fishing spot.
 */
extern int FishNum;

/**
 * The collision polygons the fish move against.
 */
extern CCPoly *cpoly;

/**
 * The number of collision polygons in cpoly.
 */
extern int cpoly_num;

/**
 * The frame the float's model hangs from.
 */
extern CFrameVu1 UkiFrameTop;

/**
 * The fishing rod.
 */
extern CCharacter Rod;

/**
 * The box the float and hook must stay within.
 */
extern CBoxVu0 fishing_rect;

/**
 * The box the fish swim within.
 */
extern CBoxVu0 fish_rect;

/**
 * The points of the line from the rod tip to the hook.
 */
extern sceVu0FVECTOR point[24];

/**
 * The points of the float's body.
 */
extern sceVu0FVECTOR ukip[4];

/**
 * The points of the hook's body.
 */
extern sceVu0FVECTOR hookp[3];

/**
 * The position the float is being pulled to.
 */
extern sceVu0FVECTOR uki;

/**
 * The position the hook is being pulled to.
 */
extern sceVu0FVECTOR fishhook;

/**
 * Whether the float is being pulled towards uki.
 */
extern int set_uki_pos;

/**
 * Whether the hook is being pulled towards fishhook.
 */
extern int set_hook_pos;

/**
 * The world position of the rod tip.
 */
extern sceVu0FVECTOR rod_top;

/**
 * The previous positions of the line's points.
 */
extern sceVu0FVECTOR old_p[24];

/**
 * The velocities of the line's points.
 */
extern sceVu0FVECTOR velo[24];

/**
 * The previous positions of the hook's points.
 */
extern sceVu0FVECTOR hookop[3];

/**
 * The velocities of the hook's points.
 */
extern sceVu0FVECTOR hookv[3];

/**
 * The previous positions of the float's points.
 */
extern sceVu0FVECTOR ukiop[4];

/**
 * The velocities of the float's points.
 */
extern sceVu0FVECTOR ukiv[4];

/**
 * The rest lengths of the hook's links.
 */
extern float hook_dist[3];

/**
 * The rest lengths of the float's links.
 */
extern float uki_dist[6];

/**
 * The spacing between neighbouring points of the line.
 */
extern float distp;

/**
 * Whether the fish are drawn while none is being landed.
 */
extern int draw_under_water;

/**
 * Gives the greatest coordinates of three points on each axis.
 *
 * @mangled VectorMax__FPfPfPfPf
 * @address 0x122FD0
 * @size 0x20
 */
void VectorMax(float *max, float *a, float *b, float *c);

static void GetHookPos(float *position);

void FishingLoad(CDataAlloc2<1> *alloc, int slot) {
    LoadFile("chara/fishing.pak", read_buffer, NULL);
    fishing_texb = slot;
    HookFrame = LoadMDSFile(GetPackFile(read_buffer, "hari.mds", NULL), alloc, 0, NULL, NULL);
    UkiFrame = LoadMDSFile(GetPackFile(read_buffer, "uki.mds", NULL), alloc, 0, NULL, NULL);
    CFrameAttr attr;
    attr.unk_14 = 1;
    if (UkiFrame != NULL) {
        UkiFrame->SetAttr(attr, 1, 0x200);
    }
    cpoly = (CCPoly *) alloc->Alloc(0x1800);
    cpoly_num = 0;
    SndSPSeLoad(0x2F);
}

void FishingLoadFish(int spot, CDataAlloc2<1> *alloc, int slot) {
    int interval;
    int loaded;

    draw_under_water = 1;
    if (spot == 3) {
        draw_under_water = 0;
    }
    Fish = new ((u_long128 *) alloc->Alloc(0xD8C)) CFish[6];
    fish_texb = slot;
    FishNum = 5;
    if (spot == 0) {
        FishNum = 4;
    }
    if (spot == 4) {
        FishNum = 4;
    }
    interval = 30;
    switch (EdGetTime(SaveData->GetNowTime())) {
        case 0:
            interval = 50;
            break;
        case 1:
            interval = 20;
            break;
        case 2:
            interval = 35;
            break;
        case 3:
            interval = 25;
            break;
    }
    loaded = 0;
    LoadFile("chara/f00s.chr", read_buffer, NULL);
    for (int i = 0; i < FishNum; i++) {
        int kind = -1;
        int r = rand();
        switch (spot) {
            case 0:
                switch ((int) (3.99999f * rnd())) {
                    case 0:
                        kind = 1;
                        break;
                    case 1:
                        kind = 2;
                        break;
                    case 2:
                        kind = 6;
                        break;
                    case 3:
                        kind = 7;
                        break;
                }
                break;
            case 1: {
                int roll = 100.0f * rnd();
                if (roll < 35) {
                    kind = 1;
                } else if (roll < 70) {
                    kind = 4;
                } else if (roll < 80) {
                    kind = 9;
                } else if (roll < 100) {
                    kind = 10;
                }
                break;
            }
            case 2:
                if (r % interval == 0) {
                    if (rand() % 5 == 0) {
                        kind = 17;
                    } else {
                        kind = 5;
                    }
                } else {
                    r %= 3;
                    if (r == 0) {
                        kind = 2;
                    }
                    if (r == 1) {
                        kind = 4;
                    }
                    if (r == 2) {
                        kind = 6;
                    }
                }
                break;
            case 3: {
                int roll = r % 100;
                if (roll < 20) {
                    kind = 0;
                } else if (roll < 40) {
                    kind = 3;
                } else if (roll < 60) {
                    kind = 11;
                } else if (roll < 80) {
                    kind = 12;
                } else {
                    kind = 13;
                }
                break;
            }
            case 4:
                if (r % interval == 0) {
                    if (rand() % 5 == 0) {
                        kind = 17;
                    } else {
                        kind = 5;
                    }
                } else {
                    int roll = r % 100;
                    if (roll < 40) {
                        kind = 14;
                    } else if (roll < 70) {
                        kind = 15;
                    } else if (roll < 100) {
                        kind = 16;
                    }
                }
                break;
        }
        LoadFish(&Fish[i], kind, slot, alloc, loaded);
        loaded = 1;
    }
}

CFish::CFish() {
    Initialize();
}

void FishingLoadEsa(int item_no, CFrameVu1 *frame, int slot) {
    if (esa_type >= 0) {
        EdGetItem(esa_info[esa_type].item_no, 1, -1);
    }
    EsaFrame = frame;
    esa_texb = slot;
    esa_type = 0;
    for (int i = 0; i < 13; i++) {
        if (item_no == esa_info[i].item_no) {
            esa_type = i;
            return;
        }
    }
}

void FishingDeleteEsa() {
    EsaFrame = NULL;
    esa_type = -1;
}

int FishingGetEsaItemNo() {
    if (esa_type < 0) {
        return -1;
    }
    return esa_info[esa_type].item_no;
}

void FishingInit() {
    WaterLevel = 0.0f;
    GroundLevel = 0.0f;
    HookFrame = NULL;
    UkiFrame = NULL;
    EsaFrame = NULL;
    esa_type = -1;
    UkiFrameTop.Initialize();
    Rod.Initialize();
    esa_texb = -99;
    fish_texb = -99;
    fishing_texb = -99;
    Fish = NULL;
    FishNum = 0;
    AngleFish = NULL;
    BattleFish = NULL;
    cpoly = NULL;
    cpoly_num = 0;
}

INCLUDE_ASM("asm/nonmatchings/fishing", FishingExit__Fv);

void FishingSetWaterLevel(float water_level, float ground_level) {
    WaterLevel = water_level;
    GroundLevel = ground_level;
    FishingSetGroundLevel(ground_level, ground_level);
}

void FishingSetGroundLevel(float uki_height, float hook_height) {
    UkiGroundLevel = uki_height;
    HookGroundLevel = hook_height;
}

float FishingGetWaterLevel() {
    return WaterLevel;
}

/**
 * Copies the collision polygons the fishing water stands on.
 *
 * @mangled FishingSetCPoly__FP6CCPolyi
 * @address 0x1A91E0
 * @size 0x7C
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingSetCPoly__FP6CCPolyi);

/**
 * Sets the box the fish may swim within.
 *
 * @mangled FishingSetRect__F7CBoxVu0
 * @address 0x1A9260
 * @size 0x40
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingSetRect__F7CBoxVu0);

/**
 * Collects the collision polygons around the fishing spot.
 *
 * @mangled FishingPickUpPoly__FP6CCPoly
 * @address 0x1A92A0
 * @size 0x1BC
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingPickUpPoly__FP6CCPoly);

/**
 * Places the six fish at random within the fishing box.
 *
 * @mangled FishingInitFish__F7CBoxVu0
 * @address 0x1A9460
 * @size 0x108
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingInitFish__F7CBoxVu0);

/**
 * Gives what the nearest fish is doing and how interested it is.
 *
 * @mangled FishingFishStatus__FPi
 * @address 0x1A9570
 * @size 0xD8
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingFishStatus__FPi);

void FishingBattleFish(int fish_no) {
    BattleFish = NULL;
    if (fish_no >= 0 && fish_no < 6) {
        CFish *fish = &Fish[fish_no];
        if (fish->action == FISH_ACTION_BITE_HOOK) {
            BattleFish = fish;
            fish->SetBattleMode();
        }
    }
}

/**
 * Gives the kind of one of the six fish.
 *
 * @mangled FishingFishKind__Fi
 * @address 0x1A96C0
 * @size 0x4C
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingFishKind__Fi);

/**
 * Turns the fighting fish into the one being landed.
 *
 * @mangled FishingBattleToAngleFish__FPUiP14CDataAlloc2_1_
 * @address 0x1A9710
 * @size 0x88
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingBattleToAngleFish__FPUiP14CDataAlloc2_1_);
INCLUDE_RODATA("asm/nonmatchings/fishing", @578__3);

INCLUDE_RODATA("asm/nonmatchings/fishing", @604);

CFish *FishingGetBattleFish() {
    return BattleFish;
}

/**
 * Marks one fish as the one being landed.
 *
 * @mangled FishingAngleFish__Fi
 * @address 0x1A97B0
 * @size 0x80
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingAngleFish__Fi);

/**
 * Gives the kind and size of the fish being landed.
 *
 * @mangled FishingGetAngleFishSize__FPiPi
 * @address 0x1A9830
 * @size 0x84
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingGetAngleFishSize__FPiPi);

/**
 * Puts the six fish back to swimming.
 *
 * @mangled FishingInitFishStatus__Fv
 * @address 0x1A98C0
 * @size 0x5C
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingInitFishStatus__Fv);

void FishingDeleteAngleFish() {
    if (AngleFish != NULL) {
        AngleFish->fish_kind = -1;
    }
}

/**
 * Advances the six fish one step, steering them by the hook.
 *
 * @mangled FishingStepFish__Fv
 * @address 0x1A9940
 * @size 0x138
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingStepFish__Fv);

/**
 * Draws the six fish.
 *
 * @mangled FishingDrawFish__Fv
 * @address 0x1A9A80
 * @size 0x13C
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingDrawFish__Fv);

/**
 * Gives where the hook is.
 *
 * @mangled GetHookPos__FPf
 * @address 0x1A9BC0
 * @size 0x28
 */
INCLUDE_ASM("asm/nonmatchings/fishing", GetHookPos__FPf);

/**
 * Casts the line, putting the float and hook at a position.
 *
 * @mangled FishLineInit__FPf
 * @address 0x1A9BF0
 * @size 0x43C
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishLineInit__FPf);

/**
 * Pulls the float towards a position by a share of the distance.
 *
 * @mangled FishLineSetUki__FPff
 * @address 0x1AA030
 * @size 0x98
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishLineSetUki__FPff);

/**
 * Pulls the hook towards a position by a share of the distance.
 *
 * @mangled FishLineSetHook__FPff
 * @address 0x1AA0D0
 * @size 0x98
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishLineSetHook__FPff);

void FishPullHook(float tension) {
    pull_hook = tension;
}

/**
 * Gives where the float is.
 *
 * @mangled FishLineGetUki__FPf
 * @address 0x1AA180
 * @size 0x28
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishLineGetUki__FPf);

/**
 * Gives where the hook is.
 *
 * @mangled FishLineGetHook__FPf
 * @address 0x1AA1B0
 * @size 0x28
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishLineGetHook__FPf);

/**
 * Reports whether the float and hook are clear of the ground.
 *
 * @mangled FishingCheckUkiHook__Fv
 * @address 0x1AA1E0
 * @size 0x158
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingCheckUkiHook__Fv);

/**
 * Advances the line, float and hook one step from the rod's position.
 *
 * @mangled FishLineStep__FPfPf
 * @address 0x1AA340
 * @size 0xDA8
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishLineStep__FPfPf);

/**
 * Draws the line between the rod, the float and the hook.
 *
 * @mangled FishLineDraw__Fi
 * @address 0x1AB0F0
 * @size 0x64C
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishLineDraw__Fi);
