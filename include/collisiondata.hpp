#pragma once

#include "common.h"

#include <libvu0.h>

#include "mathutil.hpp"

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
    sceVu0FVECTOR pos; /**< Where the hit landed. */
    sceVu0FVECTOR unk_10;
    sceVu0FVECTOR velocity; /**< The way the hit throws what it hit. */
    u8 unk_30[4];
    s32 damage; /**< What the hit takes off. */
    float unk_38;
    float radius; /**< How far from its position the hit reaches. */
    float unk_40;
    s32 life; /**< Steps the hit still tests for. */
    s32 unk_48;
    s32 kind;  /**< 2 for a small hit, 3 for a blow, 4 for a heavy blow. */
    s32 flags; /**< What the hit does besides damage. */
    s32 unk_54;
    s32 owner;      /**< Identifies what dealt the hit, or -1. */
    s32 monster_no; /**< Monster that dealt the hit, or -1. */
    s32 unk_60;
    char *vs_monster; /**< The attacker's monster-effectiveness table. */
    s32 target_kind;  /**< Attachment family the hit only harms, or -1. */
    s32 weapon_flags; /**< Flags of the weapon that dealt the hit. */
    s32 unk_70;
    s32 unk_74;
    u8 unk_78[8];
    sceVu0FVECTOR knockback_origin; /**< Point the hit pushes what it hit away from. */
    float knockback_speed;          /**< Distance the push moves each step at first. */
    float knockback_decay;          /**< Amount the push slows by each step. */
    s32 knockback_mode;             /**< 2 for a hit that pushes what it hit. */
    u8 unk_9C[4];
};

STATIC_ASSERT(sizeof(COLLISION_HIT) == 0xA0);

/**
 * Holds the hits the collision test found this frame.
 */
class CCollisionData {
public:
    /**
     * Monster that dealt a hit, or -1.
     */
    int GetMonsterOwner(int index) { return hit[index].monster_no; }

    /**
     * What a hit does besides damage.
     */
    int GetFlags(int index) { return hit[index].flags; }

    /**
     * What dealt a hit, or -1.
     */
    int GetUserID(int index) { return hit[index].owner; }

    /**
     * Names what deals the hit being filled in.
     */
    void SetUserID(int id, int sub_id) {
        hit[now_hit].owner = id;
        hit[now_hit].unk_60 = sub_id;
    }

    /**
     * The record of one hit.
     */
    COLLISION_HIT *Get(int index) { return &hit[index]; }

    /**
     * Sets the way a hit throws what it hit.
     */
    void SetVelocity(int index, float *direction, float scale) {
        sceVu0FVECTOR normalized;
        sceVu0Normalize(normalized, direction);
        sceVu0ScaleVectorXYZ(hit[index].velocity, normalized, scale);
    }

    /**
     * Finds an active hit that reaches a sphere, or -1.
     */
    int FindMonsterHit(float *position, float radius) {
        for (int i = 0; i < 96; i++) {
            if (active[i] != 0 && (hit[i].unk_48 & 2) && hit[i].unk_70 == hit[i].unk_74 &&
                DistVector(position, hit[i].pos) <= radius + hit[i].radius) {
                return i;
            }
        }
        return -1;
    }

    COLLISION_HIT hit[96]; /**< Every hit the test found this frame. */
    s32 active[96];        /**< Nonzero while each hit is still in use. */
    s32 now_hit;           /**< Indexes the hit record being filled in. */
    u8 unk_3D84[0xC];

    /**
     * Records a hit, and returns the index of its record.
     *
     * @mangled Set__14CCollisionDataFPfiiffiiii
     * @address 0x1B57A0
     * @size 0x180
     */
    int Set(float *, int, int, float, float, int, int, int, int);

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

/**
 * Tells whether a key item may be dropped on the floor.
 *
 * @mangled SetGateKeyStack__Fi
 * @address 0x1B5680
 * @size 0xB4
 */
int SetGateKeyStack(int item);
