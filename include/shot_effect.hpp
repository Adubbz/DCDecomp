#pragma once

#include "common.h"

#include <libvu0.h>

#include "dataalloc_fwd.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
#include "bt_shot_effect.hpp"
class CFrame;

/**
 * Manages the eight active projectile-effect slots.
 */
class CSHOT_EFFECT {
public:
    BT_SHOT_EFFECT *unk_0000;
    u8 unk_0004[0x9FFC];
    s16 unk_A000[8];
    s32 unk_A010[8];
    s32 unk_A030[8];
    s16 unk_A050[8];
    s16 unk_A060[8];
    s32 unk_A070[8];
    char *unk_A090[8];
    s32 unk_A0B0[8];
    float unk_A0D0[8];
    s32 unk_A0F0[8];
    s32 unk_A110[8];
    u8 unk_A130[8];
    u8 unk_A138[8];
    u8 unk_A140[8];
    s32 unk_A148;
    s32 unk_A14C;
    s32 unk_A150;
    s32 unk_A154;
    u8 unk_A158[8];

    /**
     * Draws every active projectile-effect slot.
     *
     * @mangled Draw__12CSHOT_EFFECTFv
     * @address 0x1ABF20
     * @size 0x260
     * @unknownret
     */
    void Draw(void);

    /**
     * Advances every active projectile-effect slot.
     *
     * @mangled Step__12CSHOT_EFFECTFv
     * @address 0x1AC180
     * @size 0x9B0
     * @unknownret
     */
    void Step(void);

    /**
     * Moves eligible active projectile effects into their ending phase.
     *
     * @mangled EndEffect__12CSHOT_EFFECTFv
     * @address 0x1ACB30
     * @size 0xE0
     * @unknownret
     */
    void EndEffect(void);

    /**
     * Disables one projectile-effect slot, or every slot when given -1.
     *
     * @mangled OffEffect__12CSHOT_EFFECTFi
     * @address 0x1ACC10
     * @size 0x60
     * @unknownret
     */
    void OffEffect(int);

    /**
     * Loads projectile-effect resources and initializes their runtime slots.
     *
     * @mangled Entry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
     * @address 0x1ACC70
     * @size 0x5F0
     * @unknownret
     */
    void Entry(BT_SHOT_EFFECT *, unsigned int *, int, CDataAlloc2<1> *, int);

    /**
     * Initializes projectile-effect slots from an already loaded resource.
     *
     * @mangled Entry2__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
     * @address 0x1AD260
     * @size 0x5B0
     * @unknownret
     */
    int Entry2(BT_SHOT_EFFECT *, unsigned int *, int, CDataAlloc2<1> *, int);

    /**
     * Reinitializes projectile-effect slots from a replacement description.
     *
     * @mangled ReEntry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTP14CDataAlloc2_1_
     * @address 0x1AD810
     * @size 0x510
     * @unknownret
     */
    void ReEntry(BT_SHOT_EFFECT *, CDataAlloc2<1> *);

    /**
     * Selects whether the current projectile effect loops.
     *
     * @mangled SetLoop__12CSHOT_EFFECTFi
     * @address 0x1ADD20
     * @size 0x40
     */
    void SetLoop(int);

    /**
     * Starts one shot effect and gives back the slot it went into, or -1
     * where none was free.
     *
     * @mangled Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
     * @address 0x1ADD60
     * @size 0x460
     */
    int Set(float *, float *, int, int, int, CFrame *, int);

    /**
     * Delays the current projectile effect and clears its secondary wait state.
     *
     * @mangled SetWait__12CSHOT_EFFECTFi
     * @address 0x1AE1C0
     * @size 0x50
     */
    void SetWait(int);

    /**
     * Suppresses sound for the current projectile effect.
     *
     * @mangled SetNoSound__12CSHOT_EFFECTFv
     * @address 0x1AE210
     * @size 0x40
     */
    void SetNoSound(void);

    /**
     * Sets the randomization rate for the current projectile effect.
     *
     * @mangled SetRandomRate__12CSHOT_EFFECTFf
     * @address 0x1AE250
     * @size 0x40
     */
    void SetRandomRate(float);

    /**
     * Sets the lifetime of the current projectile effect.
     *
     * @mangled SetLifeTime__12CSHOT_EFFECTFi
     * @address 0x1AE290
     * @size 0x40
     */
    void SetLifeTime(int);

    /**
     * Sets the enemy attribute of the current projectile effect.
     *
     * @mangled SetEnemyAttr__12CSHOT_EFFECTFi
     * @address 0x1AE2D0
     * @size 0x40
     */
    void SetEnemyAttr(int);

    /**
     * Sets the damage dealt by the current projectile effect.
     *
     * @mangled SetDmg__12CSHOT_EFFECTFi
     * @address 0x1AE310
     * @size 0x40
     */
    void SetDmg(int);

    /**
     * Sets the source effect's attribute when an effect slot is selected.
     *
     * @mangled SetAttribute__12CSHOT_EFFECTFi
     * @address 0x1AE350
     * @size 0x30
     */
    void SetAttribute(int);

    /**
     * Sets the weapon status of the current projectile effect.
     *
     * @mangled SetWepStatus__12CSHOT_EFFECTFi
     * @address 0x1AE380
     * @size 0x40
     */
    void SetWepStatus(int);

    /**
     * Sets the monster-effectiveness table of the current projectile effect.
     *
     * @mangled SetVsMonster__12CSHOT_EFFECTFPc
     * @address 0x1AE3C0
     * @size 0x40
     */
    void SetVsMonster(char *);

    /**
     * Sets the secondary user identifier of the current projectile effect.
     *
     * @mangled SetUserID2__12CSHOT_EFFECTFi
     * @address 0x1AE400
     * @size 0x40
     */
    void SetUserID2(int);

    /**
     * @mangled Initialize__12CSHOT_EFFECTFv
     * @address 0x1AE440
     * @size 0x80
     * @unknownret
     */
    void Initialize(void);
} __attribute__((aligned(16)));

STATIC_ASSERT(sizeof(CSHOT_EFFECT) == 0xA160);

class CSHOT {
public:
    u8 unk_000[0x40];
    sceVu0FVECTOR pos[12]; /**< Where each shot is. */
    sceVu0FVECTOR unk_100[12];
    sceVu0FVECTOR vector[12]; /**< The way each shot flies, and how fast. */
    s32 unk_280[12];
    s32 life[12];   /**< How long each shot has left, in frames. */
    s32 damage[12]; /**< What each shot takes off what it hits. */
    float unk_09[12];
    s32 unk_30[12];
    s32 unk_370[12];
    s32 unk_3A0[12];
    s32 used[12]; /**< 1 while the slot holds a shot. */

    /**
     * @mangled draw__5CSHOTFv
     * @address 0x1ABC40
     * @size 0xD0
     * @unknownret
     */
    void draw(void);

    /**
     * @mangled step__5CSHOTFv
     * @address 0x1ABD10
     * @size 0x210
     * @unknownret
     */
    void step(void);
};

STATIC_ASSERT(sizeof(CSHOT) == 0x400);

class CSHOT_MACHINGUN {
public:
    u8 unk_000[0x200];
    s32 unk_200[16];
    s32 unk_240[16];
    s32 unk_280[16];

    /**
     * @mangled Set__15CSHOT_MACHINGUNFPfPfii
     * @address 0x1AE660
     * @size 0xF0
     * @unknownret
     */
    void Set(float *, float *, int, int);

    /**
     * @mangled Step__15CSHOT_MACHINGUNFv
     * @address 0x1AE750
     * @size 0x230
     * @unknownret
     */
    void Step(void);
};
