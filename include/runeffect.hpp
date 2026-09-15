#pragma once

#include "common.h"

class CRunEffect {
public:
    int lighting; /**< Whether the dust takes light. */
    u8 unk_04[0xC];
    float position[8][4]; /**< World position of each puff of dust. */
    float velocity_y[8];  /**< Speed each puff is rising at, which gravity eats into. */
    int life[8];          /**< Frames each puff has left before it goes. */

    /**
     * Sets whether the running effect takes light.
     *
     * @mangled Lighting__10CRunEffectFi
     * @address 0x163470
     * @size 0xC
     */
    void Lighting(int enabled);

    /**
     * Draws the dust the player's run leaves behind.
     *
     * @mangled Draw__10CRunEffectFv
     * @address 0x163480
     * @size 0x46C
     */
    void Draw(void);

    /**
     * Starts one puff of run dust at a position.
     *
     * @mangled Set__10CRunEffectFPf
     * @address 0x1638F0
     * @size 0x8C
     */
    void Set(float *);

    /**
     * Advances the run dust by a frame.
     *
     * @mangled Step__10CRunEffectFv
     * @address 0x163980
     * @size 0x70
     */
    void Step(void);

    /**
     * Constructs the run effect with no dust standing.
     *
     * @mangled __ct__10CRunEffectFv
     * @address 0x1639F0
     * @size 0x3C
     */
    CRunEffect(void);
};

STATIC_ASSERT(sizeof(CRunEffect) == 0xD0);
