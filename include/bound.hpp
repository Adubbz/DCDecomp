#pragma once

#include "common.h"

#include <libvu0.h>

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrame;

/**
 * An oriented exclusion box used by the cloth simulation.
 */
class CBound {
public:
    CBound *next; /**< 0x00: Next exclusion box in the cloth list. */
    s32 unk_04;
    u8 unk_08[8];
    sceVu0FVECTOR extent;     /**< 0x10: Half extents of the box. */
    sceVu0FVECTOR reciprocal; /**< 0x20: Reciprocals used to normalize each axis. */
    float friction;           /**< 0x30: Contact friction read by the cloth solver. */
    u8 unk_34[12];
    sceVu0FMATRIX matrix;    /**< 0x40: Local-to-world orientation. */
    sceVu0FMATRIX inverse;   /**< 0x80: World-to-local orientation. */
    sceVu0FVECTOR position;  /**< 0xC0: World-space center. */
    sceVu0FVECTOR direction; /**< 0xD0: Direction used to update orientation. */
    s32 state;               /**< 0xE0: Frame-following update mode. */
    CFrame *frame0;          /**< 0xE4: Primary attachment frame. */
    CFrame *frame1;          /**< 0xE8: Optional secondary attachment frame. */
    u8 unk_EC[4];
    sceVu0FVECTOR from; /**< 0xF0: Start of the attachment direction. */
    sceVu0FVECTOR to;   /**< 0x100: End of the attachment direction. */
    sceVu0FVECTOR up;   /**< 0x110: Up vector for the attachment orientation. */
    float length0;      /**< 0x120: First attachment distance scale. */
    float length1;      /**< 0x124: Second attachment distance scale. */

    /**
     * Returns the storage required for this cloth exclusion box.
     *
     * @mangled Sizeof__6CBoundFv
     * @address 0x13DE90
     * @size 0xC
     */
    virtual int Sizeof(void);

    /**
     * Tests a point against the box and writes the corrected contact point.
     *
     * @mangled InCheck__6CBoundFPfPf
     * @address 0x13D250
     * @size 0x268
     */
    virtual int InCheck(float *position, float *result);

    /**
     * Attaches the box to one frame, stores the span it follows, and sets its
     * horizontal half extents.
     *
     * @mangled SetDir__6CBoundFP6CFramePfPfPfff
     * @address 0x13D4C0
     * @size 0x100
     */
    void SetDir(CFrame *frame, float *from_position, float *to_position, float *up_direction,
                float half_width, float half_height);

    /**
     * Stores the endpoints and up vector used to orient the box.
     *
     * @mangled ChangeDir__6CBoundFPfPfPf
     * @address 0x13D5C0
     * @size 0x68
     */
    void ChangeDir(float *from_position, float *to_position, float *up_direction);

    /**
     * Centres the box between its two endpoints in world space and orients it
     * along the span between them.
     *
     * @mangled UpDateDir__6CBoundFv
     * @address 0x13D630
     * @size 0x208
     */
    void UpDateDir(void);

    /**
     * Orients the box along a facing direction, using an up vector to settle
     * the roll.
     *
     * @mangled SetDir__6CBoundFPfPf
     * @address 0x13D840
     * @size 0x60
     */
    void SetDir(float *direction, float *up_direction);

    /**
     * Rebuilds the box's orientation from its stored facing direction; the
     * argument is not read.
     *
     * @mangled SetDir__6CBoundFPf
     * @address 0x13D8A0
     * @size 0x148
     */
    void SetDir(float *direction);

    /**
     * Centres the box between the two frames its endpoints follow and stretches
     * its span by the two length scales.
     *
     * @mangled UpDateDirPos__6CBoundFv
     * @address 0x13D9F0
     * @size 0x27C
     */
    void UpDateDirPos(void);

    /**
     * Updates this box and the remaining boxes in its linked list.
     *
     * @mangled UpDate__6CBoundFv
     * @address 0x13DC70
     * @size 0x74
     */
    void UpDate(void);

    /**
     * Initializes the box's links, transform inputs, friction, and extension scales.
     *
     * @mangled InitParam__6CBoundFv
     * @address 0x13DCF0
     * @size 0x7C
     */
    void InitParam(void);

    /**
     * Initializes the box and gives it the half extents it excludes cloth
     * within.
     *
     * @mangled __ct__6CBoundFfff
     * @address 0x13DD70
     * @size 0x11C
     */
    CBound(float half_width, float half_height, float half_depth);
};

STATIC_ASSERT(sizeof(CBound) == 0x130);
