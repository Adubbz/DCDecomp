#pragma once

#include "common.h"

#include <libvu0.h>

#include "dataalloc_fwd.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
#include "bt_shot_effect.hpp"
class CFrame;

class CSHOT_EFFECT {
public:
    u8 unk_0000[0xA160] __attribute__((aligned(16)));

    /**
     * @mangled Draw__12CSHOT_EFFECTFv
     * @address 0x1ABF20
     * @size 0x260
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled Step__12CSHOT_EFFECTFv
     * @address 0x1AC180
     * @size 0x9B0
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled EndEffect__12CSHOT_EFFECTFv
     * @address 0x1ACB30
     * @size 0xE0
     * @unknownret
     */
    void EndEffect(void);

    /**
     * @mangled OffEffect__12CSHOT_EFFECTFi
     * @address 0x1ACC10
     * @size 0x60
     * @unknownret
     */
    void OffEffect(int);

    /**
     * @mangled Entry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
     * @address 0x1ACC70
     * @size 0x5F0
     * @unknownret
     */
    void Entry(BT_SHOT_EFFECT *, unsigned int *, int, CDataAlloc2<1> *, int);

    /**
     * @mangled Entry2__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
     * @address 0x1AD260
     * @size 0x5B0
     * @unknownret
     */
    int Entry2(BT_SHOT_EFFECT *, unsigned int *, int, CDataAlloc2<1> *, int);

    /**
     * @mangled ReEntry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTP14CDataAlloc2_1_
     * @address 0x1AD810
     * @size 0x510
     * @unknownret
     */
    void ReEntry(BT_SHOT_EFFECT *, CDataAlloc2<1> *);

    /**
     * @mangled SetLoop__12CSHOT_EFFECTFi
     * @address 0x1ADD20
     * @size 0x40
     * @unknownret
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
     * @mangled SetWait__12CSHOT_EFFECTFi
     * @address 0x1AE1C0
     * @size 0x50
     * @unknownret
     */
    void SetWait(int);

    /**
     * @mangled SetNoSound__12CSHOT_EFFECTFv
     * @address 0x1AE210
     * @size 0x40
     * @unknownret
     */
    void SetNoSound(void);

    /**
     * @mangled SetRandomRate__12CSHOT_EFFECTFf
     * @address 0x1AE250
     * @size 0x40
     * @unknownret
     */
    void SetRandomRate(float);

    /**
     * @mangled SetLifeTime__12CSHOT_EFFECTFi
     * @address 0x1AE290
     * @size 0x40
     * @unknownret
     */
    void SetLifeTime(int);

    /**
     * @mangled SetEnemyAttr__12CSHOT_EFFECTFi
     * @address 0x1AE2D0
     * @size 0x40
     * @unknownret
     */
    void SetEnemyAttr(int);

    /**
     * @mangled SetDmg__12CSHOT_EFFECTFi
     * @address 0x1AE310
     * @size 0x40
     * @unknownret
     */
    void SetDmg(int);

    /**
     * @mangled SetAttribute__12CSHOT_EFFECTFi
     * @address 0x1AE350
     * @size 0x30
     * @unknownret
     */
    void SetAttribute(int);

    /**
     * @mangled SetWepStatus__12CSHOT_EFFECTFi
     * @address 0x1AE380
     * @size 0x40
     * @unknownret
     */
    void SetWepStatus(int);

    /**
     * @mangled SetVsMonster__12CSHOT_EFFECTFPc
     * @address 0x1AE3C0
     * @size 0x40
     * @unknownret
     */
    void SetVsMonster(char *);

    /**
     * @mangled SetUserID2__12CSHOT_EFFECTFi
     * @address 0x1AE400
     * @size 0x40
     * @unknownret
     */
    void SetUserID2(int);

    /**
     * @mangled Initialize__12CSHOT_EFFECTFv
     * @address 0x1AE440
     * @size 0x80
     * @unknownret
     */
    void Initialize(void);
};

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
