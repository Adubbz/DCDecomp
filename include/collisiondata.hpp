#pragma once

#include "common.h"

#include <libvu0.h>

/**
 * @mangled NameExchg__FPci
 * @address 0x1B5740
 * @size 0x60
 */
char *NameExchg(char *name, int block);

/**
 * Records one hit that the collision test found.
 */
struct COLLISION_HIT {
    sceVu0FVECTOR pos;      /**< Where the hit landed. */
    sceVu0FVECTOR unk_10;
    sceVu0FVECTOR velocity; /**< The way the hit throws what it hit. */
    u8 unk_30[4];
    s32 damage;             /**< What the hit takes off. */
    float unk_38;
    float unk_3C;
    float unk_40;
    s32 life; /**< Steps the hit still tests for. */
    s32 unk_48;
    s32 kind;  /**< 2 for a small hit, 3 for a blow, 4 for a heavy blow. */
    s32 flags; /**< What the hit does besides damage. */
    s32 unk_54;
    s32 owner; /**< Identifies what dealt the hit, or -1. */
    u8 unk_5C[0x14];
    s32 unk_70;
    s32 unk_74;
    u8 unk_78[0x28];
};

STATIC_ASSERT(sizeof(COLLISION_HIT) == 0xA0);

class CCollisionData {
public:
    COLLISION_HIT hit[96]; /**< Every hit the test found this frame. */
    s32 unk_3C00[16];
    u8 unk_3C40[0x150];

    /**
     * @mangled Set__14CCollisionDataFPfiiffiiii
     * @address 0x1B57A0
     * @size 0x180
     * @unknownret
     */
    void Set(float *, int, int, float, float, int, int, int, int);

    /**
     * @mangled CheckHitUser__14CCollisionDataFPfif
     * @address 0x1B5920
     * @size 0x1C0
     * @unknownret
     */
    int CheckHitUser(float *, int, float);

    /**
     * @mangled SetKickBack__14CCollisionDataFPfffi
     * @address 0x1B5AE0
     * @size 0xB0
     * @unknownret
     */
    void SetKickBack(float *, float, float, int);
};

STATIC_ASSERT(sizeof(CCollisionData) == 0x3D90);
