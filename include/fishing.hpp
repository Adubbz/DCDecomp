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

/** Sets the rectangular bounds used by the fishing simulation. */
void FishingSetRect(CBoxVu0 bounds);

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

/** Supplies the ground collision polygons used by the fishing simulation. */
void FishingSetCPoly(CCPoly *polygons, int count);

/** Initializes a fish inside the supplied rectangular bounds. */
void FishingInitFish(CBoxVu0 bounds);

/** Initializes the fishing line at a world-space point. */
void FishLineInit(float *position);

/** Loads the bait model attached to the fishing rod. */
void FishingLoadEsa(int item_no, CFrameVu1 *frame, int slot);

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
