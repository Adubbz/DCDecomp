#pragma once

#include "common.h"

#include <libvu0.h>

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCamera;

class CMajinBeem {
public:
    /**
     * Clears the effect. The compiler writes this one, for the members that
     * have constructors of their own; retail's copy stands in main.
     *
     * @mangled __ct__10CMajinBeemFv
     * @address 0x1434C0
     * @size 0x30
     */
    CMajinBeem();
    /**
     * Draws the beam trail as camera-facing sprites.
     *
     * @mangled Draw__10CMajinBeemFP7CCamera
     * @address 0x1DADD50
     * @size 0x250
     */
    void Draw(CCamera *);

    /**
     * Draws and contracts the beam's leading sprite.
     *
     * @mangled Draw2__10CMajinBeemFP7CCameraPfPf
     * @address 0x1DADFA0
     * @size 0x3A0
     */
    void Draw2(CCamera *, float *, float *);

    /**
     * Advances the beam and records its trail positions.
     *
     * @mangled Step__10CMajinBeemFv
     * @address 0x1DAE340
     * @size 0x250
     */
    void Step(void);

    sceVu0FVECTOR positions[60]; /**< Recorded positions forming the beam trail. */
    sceVu0FVECTOR target;        /**< Destination used to establish the beam direction. */
    int state;                   /**< Current movement state. */
    int counters[60];            /**< Ages of the recorded trail elements. */
    float sizes[60];             /**< Draw sizes of the trail elements. */
    float alphas[60];            /**< Alpha values of the trail elements. */
    int active;                  /**< Whether the beam is active. */
    float pitch;                 /**< Vertical travel angle. */
    float yaw;                   /**< Horizontal travel angle. */
    float speed;                 /**< Distance travelled during each update. */
    u8 unk_6b4[0xc];
};

STATIC_ASSERT(sizeof(CMajinBeem) == 0x6c0);
