#include "fishing.hpp"

#include "fish.hpp"
#include "framevu1.hpp"

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
 * Reads the fishing minigame's models and textures.
 *
 * @mangled FishingLoad__FP14CDataAlloc2_1_i
 * @address 0x1A87E0
 * @size 0x110
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingLoad__FP14CDataAlloc2_1_i);
INCLUDE_RODATA("asm/nonmatchings/fishing", @353__4);
INCLUDE_RODATA("asm/nonmatchings/fishing", @354__2);
INCLUDE_RODATA("asm/nonmatchings/fishing", @355__2);
/**
 * Reads the six fish of one fishing spot into an arena.
 *
 * @mangled FishingLoadFish__FiP14CDataAlloc2_1_i
 * @address 0x1A88F0
 * @size 0x4CC
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingLoadFish__FiP14CDataAlloc2_1_i);
INCLUDE_RODATA("asm/nonmatchings/fishing", @436__2);
INCLUDE_ASM("asm/nonmatchings/fishing", __ct__5CFishFv);
/**
 * Reads the model of the bait on the hook.
 *
 * @mangled FishingLoadEsa__FiP9CFrameVu1i
 * @address 0x1A8F50
 * @size 0xBC
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingLoadEsa__FiP9CFrameVu1i);

void FishingDeleteEsa() {
    EsaFrame = NULL;
    esa_type = -1;
}
/**
 * Gives the item the bait on the hook came from.
 *
 * @mangled FishingGetEsaItemNo__Fv
 * @address 0x1A9030
 * @size 0x38
 */
INCLUDE_ASM("asm/nonmatchings/fishing", FishingGetEsaItemNo__Fv);

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
