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
static EsaInfo esa_info[13] = {
    {0xC1, 50.0f},
    {0xC5, 25.0f},
    {0xC7, 25.0f},
    {0xA6, 25.0f},
    {0xA7, 25.0f},
    {0xA8, 25.0f},
    {0xA9, 25.0f},
    {0xAA, 25.0f},
    {0xBA, 25.0f},
    {0xBB, 25.0f},
    {0xBC, 25.0f},
    {0xBD, 25.0f},
    {0xBE, 40.0f},
};

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

void FishingExit() {
    if (esa_type >= 0) {
        EdGetItem(esa_info[esa_type].item_no, 1, -1);
    }
    for (int i = 0; i < 6; i++) {
        Fish[i].Initialize();
    }
    FishingInit();
}

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

void FishingSetCPoly(CCPoly *polys, int count) {
    for (int i = 0; i < count; i++) {
        memcpy(&cpoly[i], &polys[i], sizeof(CCPoly));
    }
    cpoly_num = count;
}

void FishingSetRect(CBoxVu0 bounds) {
    memcpy(&fishing_rect, &bounds, sizeof(CBoxVu0));
}

int FishingPickUpPoly(CCPoly *polys) {
    sceVu0FVECTOR corner[8];
    sceVu0FVECTOR bound[2];

    sceVu0CopyVector(bound[0], fishing_rect.min);
    sceVu0CopyVector(bound[1], fishing_rect.max);
    for (int i = 0; i < 8; i++) {
        corner[i][3] = 1.0f;
        corner[i][0] = bound[(i & 1) != 0][0];
        corner[i][1] = bound[(i & 2) != 0][1];
        corner[i][2] = bound[(i & 4) != 0][2];
    }
    int face[8][3] = {
        {0, 1, 2},
        {1, 3, 2},
        {1, 5, 3},
        {5, 7, 3},
        {5, 4, 7},
        {4, 6, 7},
        {4, 0, 6},
        {0, 2, 6},
    };
    for (int i = 0; i < 8; i++) {
        CCPoly *poly = &polys[i];
        memset(poly, 0, sizeof(CCPoly));
        for (int j = 0; j < 3; j++) {
            sceVu0CopyVector(poly->vertex[j], corner[face[i][j]]);
        }
        PlaneNormal(poly->normal, poly->vertex[0], poly->vertex[1], poly->vertex[2]);
    }
    return 8;
}

void FishingInitFish(CBoxVu0 bounds) {
    sceVu0FVECTOR position;

    if (Fish == NULL) {
        return;
    }
    memcpy(&fish_rect, &bounds, sizeof(CBoxVu0));
    for (int i = 0; i < FishNum; i++) {
        position[0] = 0.5f * (bounds.max[0] + bounds.min[0]);
        position[1] = WaterLevel - 12.0f;
        position[2] = 0.5f * (bounds.max[2] + bounds.min[2]);
        Fish[i].SetPosition(position);
        Fish[i].SetCPoly(cpoly, cpoly_num);
    }
}

int FishingFishStatus(int *fish_no) {
    int status;

    if (Fish == NULL) {
        return -1;
    }
    status = -1;
    for (int i = 0; i < 6; i++) {
        if (fish_no != NULL) {
            *fish_no = i;
        }
        CFish *fish;
        if (status == -1) {
            fish = &Fish[i];
            if (fish->action == FISH_ACTION_EAT_FOOD) {
                status = FISH_ACTION_EAT_FOOD;
            }
        }
        fish = &Fish[i];
        if (fish->action == FISH_ACTION_BITE_HOOK) {
            return FISH_ACTION_BITE_HOOK;
        }
        if (fish->action == FISH_ACTION_BATTLE) {
            return FISH_ACTION_BATTLE;
        }
    }
    return status;
}

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

int FishingFishKind(int fish_no) {
    // The range check can never fail: it needs both bounds exceeded at once.
    if (fish_no < 0 && fish_no >= 6) {
        return -1;
    }
    return Fish[fish_no].fish_kind;
}

void FishingBattleToAngleFish(u_int *pack, CDataAlloc2<1> *alloc) {
    AngleFish = BattleFish;
    BattleFish = NULL;
    if (AngleFish != NULL) {
        if (pack != NULL) {
            CCharacter *model = &AngleFish->angle_model;
            model->LoadPackData2(pack, "info.cfg", alloc, fish_texb + 1, alloc, 0);
        }
        AngleFish->SetAngleMode();
        CFish *fish = AngleFish;
        fish->use_angle_model = 1;
    }
}

INCLUDE_RODATA("asm/nonmatchings/fishing", @604);

CFish *FishingGetBattleFish() {
    return BattleFish;
}

void FishingAngleFish(int fish_no) {
    AngleFish = NULL;
    if (fish_no >= 0 && fish_no < 6) {
        CFish *fish = &Fish[fish_no];
        if (fish->action == FISH_ACTION_BITE_HOOK) {
            AngleFish = fish;
            fish->SetAngleMode();
            fish = &Fish[fish_no];
            fish->use_angle_model = 1;
        }
    }
}

int FishingGetAngleFishSize(int *size, int *fp) {
    if (AngleFish == NULL) {
        return -1;
    }
    float length = AngleFish->size;
    *size = length * 10.0f;
    *fp = AngleFish->GetFP();
    return AngleFish->fish_kind;
}

void FishingInitFishStatus() {
    if (Fish != NULL) {
        for (int i = 0; i < 6; i++) {
            CFish *fish = &Fish[i];
            fish->action = FISH_ACTION_NONE;
            fish->move_mode = FISH_MOVE_UNSET;
            fish->use_angle_model = 0;
        }
    }
}

void FishingDeleteAngleFish() {
    if (AngleFish != NULL) {
        AngleFish->fish_kind = -1;
    }
}

void FishingStepFish() {
    sceVu0FVECTOR hook;

    GetHookPos(hook);
    hook[1] -= 3.0f;
    if (Fish == NULL) {
        return;
    }
    if (AngleFish != NULL) {
        AngleFish->Step();
        return;
    }
    for (int i = 0; i < 6; i++) {
        if (esa_type < 0 || EsaFrame == NULL) {
            float radius = 0.0f;
            Fish[i].SetFoodPos(-1, hook, radius);
        } else {
            float radius = esa_info[esa_type].radius;
            Fish[i].SetFoodPos(esa_type, hook, radius);
        }
        Fish[i].Step();
    }
}

void FishingDrawFish() {
    if (Fish == NULL) {
        return;
    }
    if (AngleFish != NULL) {
        TexManager.ReloadTexture(GetVif1Packet(), fish_texb + 1);
        AngleFish->SetReference(HookFrame);
        sceVu0FVECTOR position = {0.0f, 0.0f, 0.0f, 0.0f};
        sceVu0FVECTOR rotation = {-1.57f, 1.57f, 0.0f, 0.0f};
        AngleFish->SetPosition(position);
        AngleFish->SetRotation(rotation);
        AngleFish->Draw();
        AngleFish->DeleteReference();
    } else {
        TexManager.ReloadTexture(GetVif1Packet(), fish_texb);
        if (draw_under_water) {
            for (int i = 0; i < 6; i++) {
                Fish[i].Draw();
            }
        }
    }
}

/**
 * Gives where the hook is.
 *
 * @mangled GetHookPos__FPf
 * @address 0x1A9BC0
 * @size 0x28
 */
static void GetHookPos(float *position) {
    sceVu0CopyVector(position, hookp[0]);
}

/**
 * The pairs of hook points held apart by a fixed length.
 */
static int hook_link[3][2] = {{0, 1}, {0, 2}, {1, 2}};

/**
 * The pairs of float points held apart by a fixed length.
 */
static int uki_link[6][2] = {{0, 1}, {0, 2}, {0, 3}, {1, 2}, {2, 3}, {3, 1}};

void FishLineInit(float *position) {
    sceVu0FVECTOR p;
    int i;

    set_uki_pos = 0;
    set_hook_pos = 0;
    pull_hook = 0.0f;
    sceVu0FVECTOR zero = {0.0f, 0.0f, 0.0f, 0.0f};
    sceVu0CopyVector(rod_top, position);
    sceVu0CopyVector(p, position);
    p[3] = 1.0f;
    for (i = 0; i < 24; i++) {
        sceVu0CopyVector(point[i], p);
        sceVu0CopyVector(old_p[i], p);
        sceVu0CopyVector(velo[i], zero);
        p[1] -= distp;
    }
    for (i = 0; i < 3; i++) {
        sceVu0CopyVector(hookp[i], point[23]);
    }
    for (i = 1; i < 3; i++) {
        hookp[i][1] -= 2.0f;
    }
    hookp[1][0] -= 1.0f;
    hookp[2][0] += 1.0f;
    for (i = 0; i < 3; i++) {
        sceVu0CopyVector(hookop[i], hookp[i]);
        sceVu0CopyVector(hookv[i], zero);
    }
    for (i = 0; i < 3; i++) {
        hook_dist[i] = DistVector(hookp[hook_link[i][0]], hookp[hook_link[i][1]]);
    }
    for (i = 0; i < 4; i++) {
        sceVu0CopyVector(ukip[i], point[18]);
    }
    for (i = 1; i < 4; i++) {
        ukip[i][1] -= 0.866f;
    }
    ukip[1][2] += 1.005f;
    ukip[2][0] += 0.866f;
    ukip[2][2] -= 0.5f;
    ukip[3][0] -= 0.866f;
    ukip[3][2] -= 0.5f;
    for (i = 0; i < 4; i++) {
        sceVu0CopyVector(ukiop[i], ukip[i]);
        sceVu0CopyVector(ukiv[i], zero);
    }
    for (i = 0; i < 6; i++) {
        uki_dist[i] = DistVector(ukip[uki_link[i][0]], ukip[uki_link[i][1]]);
    }
}

void FishLineSetUki(float *position, float rate) {
    sceVu0FVECTOR offset;

    if (rate < 0.0f) {
        set_uki_pos = 0;
        return;
    }
    sceVu0SubVector(offset, position, ukip[0]);
    sceVu0ScaleVector(offset, offset, rate);
    sceVu0AddVector(uki, ukip[0], offset);
    set_uki_pos = 1;
}

void FishLineSetHook(float *position, float rate) {
    sceVu0FVECTOR offset;

    if (rate < 0.0f) {
        set_hook_pos = 0;
        return;
    }
    sceVu0SubVector(offset, position, hookp[0]);
    sceVu0ScaleVector(offset, offset, rate);
    sceVu0AddVector(fishhook, hookp[0], offset);
    set_hook_pos = 1;
}

void FishPullHook(float tension) {
    pull_hook = tension;
}

void FishLineGetUki(float *position) {
    sceVu0CopyVector(position, point[18]);
}

void FishLineGetHook(float *position) {
    sceVu0CopyVector(position, point[23]);
}

int FishingCheckUkiHook() {
    sceVu0FVECTOR uki_pos;
    sceVu0FVECTOR hook_pos;
    float water;

    FishLineGetUki(uki_pos);
    FishLineGetHook(hook_pos);
    for (int i = 0; i < 3; i++) {
        if (fishing_rect.max[i] < uki_pos[i]) {
            return 1;
        }
        if (fishing_rect.max[i] < hook_pos[i]) {
            return 1;
        }
        if (fishing_rect.min[i] > uki_pos[i]) {
            return 1;
        }
        if (fishing_rect.min[i] > hook_pos[i]) {
            return 1;
        }
    }
    water = 5.0f + FishingGetWaterLevel();
    if (hook_pos[1] > water) {
        return 1;
    }
    if (uki_pos[1] > water) {
        return 1;
    }
    return 0;
}

/**
 * Advances the line, float and hook one step from the rod's position.
 *
 * @mangled FishLineStep__FPfPf
 * @address 0x1AA340
 * @size 0xDA8
 */
#ifdef NON_MATCHING
extern float LineGroundLevel;

void FishLineStep(float *rod_position, float *unused) {
    sceVu0FVECTOR from;
    sceVu0FVECTOR to;
    sceVu0FVECTOR hit;
    sceVu0FVECTOR normal;
    sceVu0FVECTOR delta;
    sceVu0FVECTOR move_a;
    sceVu0FVECTOR move_b;
    int i;
    int iteration;
    float water;
    float pull;

    if (cpoly != NULL) {
        int poly;

        sceVu0CopyVector(from, point[23]);
        sceVu0CopyVector(to, point[23]);
        from[1] += 40.0f;
        to[1] -= 40.0f;
        poly = CheckHit(cpoly, cpoly_num, from, to, hit, 1, 0);
        if (poly >= 0) {
            sceVu0Normalize(normal, cpoly[poly].normal);
            float slope = normal[1];
            if (slope < 0.0f) {
                slope = -slope;
            }
            if (slope > 0.2f) {
                HookGroundLevel = 0.2f + hit[1];
            }
        }
        sceVu0CopyVector(from, point[18]);
        sceVu0CopyVector(to, point[18]);
        from[1] += 40.0f;
        to[1] -= 40.0f;
        poly = CheckHit(cpoly, cpoly_num, from, to, hit, 1, 0);
        if (poly >= 0) {
            sceVu0Normalize(normal, cpoly[poly].normal);
            float slope = normal[1];
            if (slope < 0.0f) {
                slope = -slope;
            }
            if (slope > 0.2f) {
                UkiGroundLevel = 1.0f + hit[1];
            }
        }
    }
    if (UkiGroundLevel < HookGroundLevel) {
        LineGroundLevel = UkiGroundLevel;
    } else {
        LineGroundLevel = HookGroundLevel;
    }
    water = WaterLevel;
    sceVu0CopyVector(rod_top, rod_position);
    rod_top[3] = 1.0f;
    fishhook[3] = 1.0f;

    for (i = 0; i < 24; i++) {
        velo[i][1] += -0.1f;
        velo[i][3] = 0.0f;
        sceVu0AddVector(point[i], point[i], velo[i]);
    }
    pull = pull_hook;
    point[23][1] += pull;
    for (i = 0; i < 3; i++) {
        hookv[i][1] += -0.1f + pull;
        hookv[i][3] = 0.0f;
        sceVu0AddVector(hookp[i], hookp[i], hookv[i]);
    }
    for (i = 0; i < 4; i++) {
        ukiv[i][1] += -0.1f + pull;
        ukiv[i][3] = 0.0f;
        sceVu0AddVector(ukip[i], ukip[i], ukiv[i]);
    }

    for (iteration = 0; iteration < 16; iteration++) {
        sceVu0CopyVector(point[0], rod_top);
        sceVu0CopyVector(old_p[0], rod_top);
        for (i = 1; i < 24; i++) {
            float rate = 0.5f;
            if (i == 23) {
                rate = 0.9f;
            }
            sceVu0SubVector(delta, point[i - 1], point[i]);
            float length = DistVector(delta);
            float stretch = length - distp;
            sceVu0ScaleVector(move_a, delta, ((1.0f - rate) * stretch) / length);
            sceVu0ScaleVector(move_b, delta, (rate * stretch) / length);
            sceVu0SubVector(point[i - 1], point[i - 1], move_a);
            sceVu0AddVector(point[i], point[i], move_b);
        }

        sceVu0CopyVector(hookp[0], point[23]);
        for (i = 0; i < 3; i++) {
            sceVu0SubVector(delta, hookp[hook_link[i][0]], hookp[hook_link[i][1]]);
            float length = DistVector(delta);
            sceVu0ScaleVector(move_a, delta, (0.5f * (length - hook_dist[i])) / length);
            sceVu0SubVector(hookp[hook_link[i][0]], hookp[hook_link[i][0]], move_a);
            sceVu0AddVector(hookp[hook_link[i][1]], hookp[hook_link[i][1]], move_a);
        }

        sceVu0SubVector(delta, point[18], ukip[0]);
        float length = DistVector(delta);
        float uki_rate = (length * 0.2f) / length;
        sceVu0ScaleVector(move_a, delta, (length * 0.8f) / length);
        sceVu0ScaleVector(move_b, delta, uki_rate);
        sceVu0SubVector(point[18], point[18], move_a);
        sceVu0AddVector(ukip[0], ukip[0], move_b);
        for (i = 0; i < 6; i++) {
            sceVu0SubVector(delta, ukip[uki_link[i][0]], ukip[uki_link[i][1]]);
            float link_length = DistVector(delta);
            sceVu0ScaleVector(move_a, delta, (0.5f * (link_length - uki_dist[i])) / link_length);
            sceVu0SubVector(ukip[uki_link[i][0]], ukip[uki_link[i][0]], move_a);
            sceVu0AddVector(ukip[uki_link[i][1]], ukip[uki_link[i][1]], move_a);
        }

        if (set_hook_pos != 0) {
            sceVu0CopyVector(point[23], fishhook);
            sceVu0CopyVector(hookp[0], fishhook);
        }
        if (set_uki_pos != 0) {
            sceVu0CopyVector(point[18], uki);
            sceVu0CopyVector(ukip[0], uki);
        }
    }

    for (i = 0; i < 24; i++) {
        sceVu0SubVector(velo[i], point[i], old_p[i]);
        if (i != 23) {
            sceVu0ScaleVector(velo[i], velo[i], 0.96f);
        } else {
            sceVu0ScaleVector(velo[i], velo[i], 0.999f);
        }
        if (point[i][1] < LineGroundLevel) {
            point[i][1] = LineGroundLevel;
            velo[i][0] *= 0.4f;
            velo[i][1] *= -0.4f;
            velo[i][2] *= 0.4f;
        }
        if (point[i][1] < water) {
            sceVu0ScaleVector(velo[i], velo[i], 0.4f);
            if (i < 19) {
                velo[i][1] += 0.1f;
            }
        }
        sceVu0CopyVector(old_p[i], point[i]);
    }

    for (i = 0; i < 3; i++) {
        sceVu0SubVector(hookv[i], hookp[i], hookop[i]);
        if (hookp[i][1] < HookGroundLevel) {
            hookp[i][1] = HookGroundLevel;
            hookv[i][0] *= 0.8f;
            hookv[i][1] *= -0.6f;
            hookv[i][2] *= 0.8f;
        }
        sceVu0CopyVector(hookop[i], hookp[i]);
        sceVu0ScaleVector(hookv[i], hookv[i], 0.99f);
    }

    for (i = 0; i < 4; i++) {
        sceVu0SubVector(ukiv[i], ukip[i], ukiop[i]);
        if (ukip[i][1] < UkiGroundLevel) {
            ukip[i][1] = UkiGroundLevel;
            ukiv[i][0] *= 0.6f;
            ukiv[i][1] *= -0.8f;
            ukiv[i][2] *= 0.6f;
        }
        if (i != 0 && ukip[i][1] < water && ukip[0][1] < water) {
            sceVu0ScaleVector(ukiv[i], ukiv[i], 0.6f);
            ukiv[i][1] += 0.3f;
        }
        if (ukip[0][1] < water && !(ukip[i][1] < water)) {
            float height = ukip[0][1] - ukip[i][1];
            float distance = height;
            if (height < 0.0f) {
                distance = -height;
            }
            ukiv[i][0] *= 0.6f;
            ukiv[i][2] *= 0.6f;
            if (height < 0.0f) {
                height = -height;
            }
            if (height > 0.001f) {
                ukiv[i][1] += (0.3f * (water - ukip[0][1])) / distance;
            }
        }
        float height = ukip[i][1];
        if (height < water && !(ukip[0][1] < water)) {
            float distance = height - ukip[0][1];
            if (distance < 0.0f) {
                distance = -distance;
            }
            float gap = ukip[0][1] - height;
            if (gap < 0.0f) {
                gap = -gap;
            }
            if (gap > 0.001f) {
                ukiv[i][1] += (0.3f * (water - height)) / distance;
            }
        }
        sceVu0CopyVector(ukiop[i], ukip[i]);
        sceVu0ScaleVector(ukiv[i], ukiv[i], 0.999f);
    }

    UkiGroundLevel = GroundLevel;
    HookGroundLevel = GroundLevel;
    LineGroundLevel = GroundLevel;
    set_uki_pos = 0;
    set_hook_pos = 0;
    pull_hook = 0.0f;
}
#else
INCLUDE_ASM("asm/nonmatchings/fishing", FishLineStep__FPfPf);
#endif

void FishLineDraw(int above_water) {
    int screen[4];
    sceVu0FVECTOR center;
    sceVu0FVECTOR direction;
    sceVu0FMATRIX matrix;
    sceVu0FVECTOR uki_top;
    sceVu0FVECTOR hook_top;
    sceVu0FVECTOR esa_position;
    sceGsTest test;
    int draw;
    int visible;
    int prev_visible;
    int i;
    sceVif1Packet *packet;

    TexManager.ReloadTexture(GetVif1Packet(), fishing_texb);
    prev_visible = 0;
    packet = GetVif1Packet();
    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, SCE_GS_PRIM, SCE_GS_SET_PRIM(2, 1, 0, 0, 1, 0, 1, 0, 0));
    sceVif1PkAddGsAD(packet, SCE_GS_RGBAQ, SCE_GS_SET_RGBAQ(0x80, 0x80, 0x80, 0x80, 0));
    test = mgPixelTest;
    test.bits.aref = 0;
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &test);
    for (i = 0; i < 24; i++) {
        visible = MGRotTransPers(screen, point[i], 0);
        u_char above = point[i][1] > WaterLevel;
        int reg = SCE_GS_XYZF2;
        if (visible == 0 || prev_visible == 0) {
            reg = SCE_GS_XYZF3;
        }
        if (above_water) {
            if (!above) {
                reg = SCE_GS_XYZF3;
            }
        } else if (above || draw_under_water == 0) {
            reg = SCE_GS_XYZF3;
        }
        sceVif1PkAddGsAD(packet, reg,
                         (u_long) screen[0] | ((u_long) screen[1] << 16) | ((u_long) screen[2] << 32));
        prev_visible = visible;
    }
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);

    draw = 1;
    VectorMax(uki_top, ukip[0], ukip[1], ukip[2], ukip[3]);
    if (above_water) {
        if (uki_top[1] < WaterLevel) {
            draw = 0;
        }
    } else if (uki_top[1] > WaterLevel || draw_under_water == 0) {
        draw = 0;
    }
    if (UkiFrame != NULL && draw) {
        sceVu0AddVector(center, ukip[1], ukip[2]);
        sceVu0AddVector(center, center, ukip[3]);
        sceVu0ScaleVector(center, center, 0.333333f);
        sceVu0SubVector(direction, ukip[0], center);
        sceVu0Normalize(matrix[1], direction);
        matrix[1][3] = 0.0f;
        sceVu0SubVector(direction, center, ukip[1]);
        sceVu0Normalize(matrix[2], direction);
        sceVu0OuterProduct(matrix[0], matrix[1], matrix[2]);
        matrix[0][3] = 0.0f;
        matrix[3][0] = matrix[3][1] = matrix[3][2] = 0.0f;
        matrix[3][3] = 1.0f;
        UkiFrameTop.Initialize();
        UkiFrameTop.SetTransMatrix(matrix);
        UkiFrameTop.SetPosition(ukip[0]);
        UkiFrame->SetReference(&UkiFrameTop);
        MGDraw(UkiFrame);
    }

    draw = 1;
    VectorMax(hook_top, hookp[0], hookp[1], hookp[2]);
    if (above_water) {
        if (hook_top[1] < WaterLevel) {
            draw = 0;
        }
    } else if (hook_top[1] > WaterLevel || draw_under_water == 0) {
        draw = 0;
    }
    if (HookFrame != NULL && draw) {
        sceVu0AddVector(center, hookp[1], hookp[2]);
        sceVu0ScaleVector(center, center, 0.5f);
        sceVu0SubVector(direction, hookp[0], center);
        sceVu0Normalize(matrix[1], direction);
        matrix[1][3] = 0.0f;
        sceVu0SubVector(center, hookp[1], hookp[0]);
        sceVu0SubVector(direction, hookp[2], hookp[0]);
        sceVu0OuterProduct(matrix[2], center, direction);
        sceVu0Normalize(matrix[2], matrix[2]);
        matrix[2][3] = 0.0f;
        sceVu0OuterProduct(matrix[0], matrix[1], matrix[2]);
        matrix[0][3] = 0.0f;
        matrix[3][0] = matrix[3][1] = matrix[3][2] = 0.0f;
        matrix[3][3] = 1.0f;
        HookFrame->SetTransMatrix(matrix);
        HookFrame->SetPosition(hookp[0]);
        MGDraw(HookFrame);
        if (EsaFrame != NULL) {
            sceVu0AddVector(esa_position, hookp[0], hookp[1]);
            sceVu0AddVector(esa_position, esa_position, hookp[2]);
            sceVu0ScaleVector(esa_position, esa_position, 0.3333f);
            EsaFrame->SetTransMatrix(matrix);
            EsaFrame->SetPosition(esa_position);
            TexManager.ReloadTexture(GetVif1Packet(), esa_texb);
            MGDraw(EsaFrame);
        }
    }
}
