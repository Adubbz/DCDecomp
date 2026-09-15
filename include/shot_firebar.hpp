#pragma once

#include "common.h"

/**
 *
 * Manages the particle state and rendering for Ozumond's fire stream.
 *
 */
class CSHOT_FIREBAR {
public:
    float position[64][4]; /**< World positions for the fire particles. */
    float velocity[64][4]; /**< Per-step movement vectors for the fire particles. */
    float size[64]; /**< Display sizes for the fire particles. */
    float opacity[64]; /**< Current opacity values, with element 63 also retaining the initialization damage argument. */
    s32 damage[64]; /**< Collision damage values, with element 63 also retaining the initialization texture-cell argument. */
    s32 texture_cell[64]; /**< Texture cells selected for the fire particles. */
    s32 state[64]; /**< Activity states for the fire particles. */
    s32 start_index; /**< First particle slot populated by initialization and emission. */
    u8 unk_D04[0xC];

    /**
     *
     * Initializes a 24-particle fire stream from a position and direction.
     *
     * @mangled Init__13CSHOT_FIREBARFPfPfii
     * @address 0x1AEB20
     * @size 0x21C
     */
    int Init(float *origin, float *direction, int damage, int texture_cell);

    /**
     *
     * Emits a 24-particle fire stream from a position and direction.
     *
     * @mangled Set__13CSHOT_FIREBARFPfPfii
     * @address 0x1AED40
     * @size 0x21C
     */
    int Set(float *origin, float *direction, int damage, int texture_cell);

    /**
     *
     * Marks the first 24 fire-particle slots as inactive.
     *
     * @mangled Rset__13CSHOT_FIREBARFv
     * @address 0x1AEF60
     * @size 0x34
     */
    void Rset(void);

    /**
     *
     * Advances active fire particles and applies their periodic collision damage.
     *
     * @mangled Step__13CSHOT_FIREBARFv
     * @address 0x1AEFA0
     * @size 0x238
     */
    void Step(void);

    /**
     *
     * Draws the active fire particles with their selected texture cells.
     *
     * @mangled Draw__13CSHOT_FIREBARFv
     * @address 0x1AF1E0
     * @size 0x180
     */
    void Draw(void);
};
