#pragma once

#include "collision.hpp"

template <int T> class CDataAlloc2;
class CFish;
class CFrameVu1;

/**
 * Initializes the fishing subsystem's runtime state.
 *
 * @mangled FishingInit__Fv
 * @address 0x1A9070
 * @size 0x7C
 */
void FishingInit();

/**
 * Sets the water surface and terrain heights used by the fishing simulation.
 *
 * @mangled FishingSetWaterLevel__Fff
 * @address 0x1A9190
 * @size 0x2C
 */
void FishingSetWaterLevel(float near_height, float far_height);

/**
 * Sets the ground heights under the float and under the hook.
 *
 * @mangled FishingSetGroundLevel__Fff
 * @address 0x1A91C0
 * @size 0x10
 */
void FishingSetGroundLevel(float uki_height, float hook_height);

/**
 * Returns the water surface height used by the fishing simulation.
 *
 * @mangled FishingGetWaterLevel__Fv
 * @address 0x1A91D0
 * @size 0xC
 */
float FishingGetWaterLevel();

/** Initializes the fishing line at a world-space point. */
void FishLineInit(float *position);

/**
 * Takes the bait off the hook.
 *
 * @mangled FishingDeleteEsa__Fv
 * @address 0x1A9010
 * @size 0x14
 */
void FishingDeleteEsa();

/**
 * Makes a fish that has bitten the hook the one fighting the line.
 *
 * @mangled FishingBattleFish__Fi
 * @address 0x1A9650
 * @size 0x68
 */
void FishingBattleFish(int fish_no);

/**
 * Returns the fish fighting the line, or null when none is.
 *
 * @mangled FishingGetBattleFish__Fv
 * @address 0x1A97A0
 * @size 0xC
 */
CFish *FishingGetBattleFish();

/**
 * Removes the fish displayed after an angling battle.
 *
 * @mangled FishingDeleteAngleFish__Fv
 * @address 0x1A9920
 * @size 0x1C
 */
void FishingDeleteAngleFish();

/**
 * Sets the current tension applied to the fishing hook.
 *
 * @mangled FishPullHook__Ff
 * @address 0x1AA170
 * @size 0xC
 */
void FishPullHook(float tension);

/**
 * Leaves the fishing minigame and releases its active state.
 *
 * @mangled FishingExit__Fv
 * @address 0x1A90F0
 * @size 0x98
 */
void FishingExit();

/**
 * Reads the hook and float models and the fishing sounds, and sets aside room for the collision polygons.
 *
 * @mangled FishingLoad__FP14CDataAlloc2_1_i
 * @address 0x1A87E0
 * @size 0x110
 */
void FishingLoad(CDataAlloc2<1> *alloc, int slot);

/**
 * Reads the fish of one fishing spot into an arena, choosing their kinds by the spot and the time of day.
 *
 * @mangled FishingLoadFish__FiP14CDataAlloc2_1_i
 * @address 0x1A88F0
 * @size 0x4CC
 */
void FishingLoadFish(int spot, CDataAlloc2<1> *alloc, int slot);

/**
 * Puts a bait item on the hook, giving any bait already there back to the inventory.
 *
 * @mangled FishingLoadEsa__FiP9CFrameVu1i
 * @address 0x1A8F50
 * @size 0xBC
 */
void FishingLoadEsa(int item_no, CFrameVu1 *frame, int slot);

/**
 * Returns the item the bait on the hook came from, or -1 when the hook is bare.
 *
 * @mangled FishingGetEsaItemNo__Fv
 * @address 0x1A9030
 * @size 0x38
 */
int FishingGetEsaItemNo();

/**
 * Copies the collision polygons the fish move against.
 *
 * @mangled FishingSetCPoly__FP6CCPolyi
 * @address 0x1A91E0
 * @size 0x7C
 */
void FishingSetCPoly(CCPoly *polys, int count);

/**
 * Sets the box the float and hook must stay within.
 *
 * @mangled FishingSetRect__F7CBoxVu0
 * @address 0x1A9260
 * @size 0x40
 */
void FishingSetRect(CBoxVu0 bounds);

/**
 * Sets the box the fish swim within and puts every fish at its centre, under the water surface.
 *
 * @mangled FishingInitFish__F7CBoxVu0
 * @address 0x1A9460
 * @size 0x108
 */
void FishingInitFish(CBoxVu0 bounds);

/**
 * Returns whether a fish is fighting the line, biting the hook or eating the bait, and which fish it is.
 *
 * @mangled FishingFishStatus__FPi
 * @address 0x1A9570
 * @size 0xD8
 */
int FishingFishStatus(int *fish_no);

/**
 * Returns the kind of one of the six fish.
 *
 * @mangled FishingFishKind__Fi
 * @address 0x1A96C0
 * @size 0x4C
 */
int FishingFishKind(int fish_no);

/**
 * Turns the fish fighting the line into the one being landed, reading its landing model from a pack.
 *
 * @mangled FishingBattleToAngleFish__FPUiP14CDataAlloc2_1_
 * @address 0x1A9710
 * @size 0x88
 */
void FishingBattleToAngleFish(u_int *pack, CDataAlloc2<1> *alloc);
