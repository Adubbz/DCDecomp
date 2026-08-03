#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct BT_SHOT_EFFECT;
class CDataAlloc2_1_;
class CFrame;


class CSHOT_EFFECT {
public:
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
    void Entry(BT_SHOT_EFFECT *, unsigned int *, int, CDataAlloc2_1_ *, int);

    /**
     * @mangled Entry2__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
     * @address 0x1AD260
     * @size 0x5B0
     * @unknownret
     */
    void Entry2(BT_SHOT_EFFECT *, unsigned int *, int, CDataAlloc2_1_ *, int);

    /**
     * @mangled ReEntry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTP14CDataAlloc2_1_
     * @address 0x1AD810
     * @size 0x510
     * @unknownret
     */
    void ReEntry(BT_SHOT_EFFECT *, CDataAlloc2_1_ *);

    /**
     * @mangled SetLoop__12CSHOT_EFFECTFi
     * @address 0x1ADD20
     * @size 0x40
     * @unknownret
     */
    void SetLoop(int);

    /**
     * @mangled Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
     * @address 0x1ADD60
     * @size 0x460
     * @unknownret
     */
    void Set(float *, float *, int, int, int, CFrame *, int);

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

class CSHOT {
public:
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

class CSHOT_MACHINGUN {
public:
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
