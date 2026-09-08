#pragma once

#include "common.h"

#include <libvu0.h>

#include "object.hpp"

/**
 * @file
 * Declares the marks that a hit throws off.
 */

/** Number of marks that one hit can throw off. */
#define HIT_MARK_MAX 32

/**
 * Throws a burst of sprites off the point of a hit and carries each one until
 * it shrinks away.
 */
class CHitMark : public CObject {
public:
    sceVu0FVECTOR offset[HIT_MARK_MAX];   /**< Distance of each mark from the point of the hit. */
    sceVu0FVECTOR velocity[HIT_MARK_MAX]; /**< Distance that each mark moves each step. */
    float size[HIT_MARK_MAX];             /**< Width of each mark on the screen. */
    u8 unk_530[144];
    float unk_5C0;
    float unk_5C4;
    float gravity; /**< Downward speed that a mark gains each step. */
    float speed;   /**< Speed that the burst throws its marks at. */
    s32 unk_5D0;
    s32 used[HIT_MARK_MAX]; /**< 1 while the mark of the slot still draws. */
    s32 count;              /**< Number of marks that still draw. */
    s32 kind;               /**< Part of the texture that every mark draws. */
    float floor_y;          /**< Height that a mark bounces off. */

    /**
     * Moves every mark, and drops the ones that have shrunk away.
     *
     * @mangled Step__8CHitMarkFv
     * @address 0x1B3490
     * @size 0x140
     */
    virtual void Step(void);

    /**
     * Throws a burst of marks off a point, each one in its own direction.
     *
     * @mangled Set__8CHitMarkFPfPfiffffif
     * @address 0x1B2E90
     * @size 0x310
     */
    void Set(float *position, float *direction, int kind, float spread, float shrink,
             float gravity, float speed, int count, float floor_y);

    /**
     * Draws every mark that the burst still holds.
     *
     * @mangled Draw__8CHitMarkFv
     * @address 0x1B31A0
     * @size 0x2F0
     */
    void Draw(void);

    /**
     * Empties every slot, so that the burst throws nothing.
     *
     * @mangled Initialize__8CHitMarkFv
     * @address 0x1B35D0
     * @size 0x40
     */
    void Initialize(void);
};

STATIC_ASSERT(sizeof(CHitMark) == 0x660);

/**
 * Blinks one mark over the point that the player last hit.
 */
class CHitPointMark {
public:
    float pos[4]; /**< World position of the mark. */
    s32 timer;    /**< Steps that the mark still draws for. */
    s32 blink;    /**< 1 while the mark shows; 0 while it is hidden. */
    s32 on;       /**< 1 while the mark is in use. */
    s32 unk_1C;

    /**
     * Draws the mark, unless the blink hides it.
     *
     * @mangled Draw__13CHitPointMarkFv
     * @address 0x1B3610
     * @size 0x100
     */
    void Draw(void);

    /**
     * Counts the mark down, and turns the blink over every fourth step.
     *
     * @mangled Step__13CHitPointMarkFv
     * @address 0x1B3710
     * @size 0x70
     */
    void Step(void);
};

STATIC_ASSERT(sizeof(CHitPointMark) == 0x20);

extern "C" CHitMark HitMark[16];
extern "C" CHitPointMark HitPointMark[16];
extern "C" int hitCnt;
