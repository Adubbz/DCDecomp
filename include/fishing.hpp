#pragma once

#include "collision.hpp"

template <int T> class CDataAlloc2;
class CFrameVu1;

/** Initializes the fishing subsystem's runtime state. */
void FishingInit();

/** Loads shared fishing resources into an event arena. */
void FishingLoad(CDataAlloc2<1> *arena, int slot);

/** Loads the selected collection of fish models into an event arena. */
void FishingLoadFish(int set_no, CDataAlloc2<1> *arena, int slot);

/** Sets the rectangular bounds used by the fishing simulation. */
void FishingSetRect(CBoxVu0 bounds);

/** Sets the near and far water heights used by the fishing simulation. */
void FishingSetWaterLevel(float near_height, float far_height);

/** Supplies the ground collision polygons used by the fishing simulation. */
void FishingSetCPoly(CCPoly *polygons, int count);

/** Initializes a fish inside the supplied rectangular bounds. */
void FishingInitFish(CBoxVu0 bounds);

/**
 * Initializes the fishing line at a world-space point.
 *
 * @mangled FishLineInit__FPf
 * @address 0x1A9BF0
 * @size 0x43C
 */
void FishLineInit(float *position);

/** Loads the bait model attached to the fishing rod. */
void FishingLoadEsa(int item_no, CFrameVu1 *frame, int slot);

/**
 * Leaves the fishing minigame and releases its active state.
 *
 * @mangled FishingExit__Fv
 * @address 0x1A90F0
 * @size 0x98
 */
void FishingExit();
