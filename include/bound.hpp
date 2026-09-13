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
     * @mangled SetDir__6CBoundFP6CFramePfPfPfff
     * @address 0x13D4C0
     * @size 0x100
     * @unknownret
     */
    void SetDir(CFrame *, float *, float *, float *, float, float);

    /**
     * Stores the endpoints and up vector used to orient the box.
     *
     * @mangled ChangeDir__6CBoundFPfPfPf
     * @address 0x13D5C0
     * @size 0x70
     */
    void ChangeDir(float *from_position, float *to_position, float *up_direction);

    /**
     * @mangled UpDateDir__6CBoundFv
     * @address 0x13D630
     * @size 0x210
     * @unknownret
     */
    void UpDateDir(void);

    /**
     * @mangled SetDir__6CBoundFPfPf
     * @address 0x13D840
     * @size 0x60
     * @unknownret
     */
    void SetDir(float *, float *);

    /**
     * @mangled SetDir__6CBoundFPf
     * @address 0x13D8A0
     * @size 0x150
     * @unknownret
     */
    void SetDir(float *);

    /**
     * @mangled UpDateDirPos__6CBoundFv
     * @address 0x13D9F0
     * @size 0x280
     * @unknownret
     */
    void UpDateDirPos(void);

    /**
     * @mangled UpDate__6CBoundFv
     * @address 0x13DC70
     * @size 0x80
     * @unknownret
     */
    void UpDate(void);

    /**
     * @mangled InitParam__6CBoundFv
     * @address 0x13DCF0
     * @size 0x80
     * @unknownret
     */
    void InitParam(void);

    /**
     * @mangled __ct__6CBoundFfff
     * @address 0x13DD70
     * @size 0x120
     */
    CBound(float, float, float);
};

STATIC_ASSERT(sizeof(CBound) == 0x130);
