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
    /* ?ret */ void Draw(void); // @ 0x1ABF20 (0x260 bytes) -- mangled: Draw__12CSHOT_EFFECTFv
    /* ?ret */ void Step(void); // @ 0x1AC180 (0x9B0 bytes) -- mangled: Step__12CSHOT_EFFECTFv
    /* ?ret */ void EndEffect(void); // @ 0x1ACB30 (0xE0 bytes) -- mangled: EndEffect__12CSHOT_EFFECTFv
    /* ?ret */ void OffEffect(int); // @ 0x1ACC10 (0x60 bytes) -- mangled: OffEffect__12CSHOT_EFFECTFi
    /* ?ret */ void Entry(BT_SHOT_EFFECT *, unsigned int *, int, CDataAlloc2_1_ *, int); // @ 0x1ACC70 (0x5F0 bytes) -- mangled: Entry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
    /* ?ret */ void Entry2(BT_SHOT_EFFECT *, unsigned int *, int, CDataAlloc2_1_ *, int); // @ 0x1AD260 (0x5B0 bytes) -- mangled: Entry2__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
    /* ?ret */ void ReEntry(BT_SHOT_EFFECT *, CDataAlloc2_1_ *); // @ 0x1AD810 (0x510 bytes) -- mangled: ReEntry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTP14CDataAlloc2_1_
    /* ?ret */ void SetLoop(int); // @ 0x1ADD20 (0x40 bytes) -- mangled: SetLoop__12CSHOT_EFFECTFi
    /* ?ret */ void Set(float *, float *, int, int, int, CFrame *, int); // @ 0x1ADD60 (0x460 bytes) -- mangled: Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
    /* ?ret */ void SetWait(int); // @ 0x1AE1C0 (0x50 bytes) -- mangled: SetWait__12CSHOT_EFFECTFi
    /* ?ret */ void SetNoSound(void); // @ 0x1AE210 (0x40 bytes) -- mangled: SetNoSound__12CSHOT_EFFECTFv
    /* ?ret */ void SetRandomRate(float); // @ 0x1AE250 (0x40 bytes) -- mangled: SetRandomRate__12CSHOT_EFFECTFf
    /* ?ret */ void SetLifeTime(int); // @ 0x1AE290 (0x40 bytes) -- mangled: SetLifeTime__12CSHOT_EFFECTFi
    /* ?ret */ void SetEnemyAttr(int); // @ 0x1AE2D0 (0x40 bytes) -- mangled: SetEnemyAttr__12CSHOT_EFFECTFi
    /* ?ret */ void SetDmg(int); // @ 0x1AE310 (0x40 bytes) -- mangled: SetDmg__12CSHOT_EFFECTFi
    /* ?ret */ void SetAttribute(int); // @ 0x1AE350 (0x30 bytes) -- mangled: SetAttribute__12CSHOT_EFFECTFi
    /* ?ret */ void SetWepStatus(int); // @ 0x1AE380 (0x40 bytes) -- mangled: SetWepStatus__12CSHOT_EFFECTFi
    /* ?ret */ void SetVsMonster(char *); // @ 0x1AE3C0 (0x40 bytes) -- mangled: SetVsMonster__12CSHOT_EFFECTFPc
    /* ?ret */ void SetUserID2(int); // @ 0x1AE400 (0x40 bytes) -- mangled: SetUserID2__12CSHOT_EFFECTFi
    /* ?ret */ void Initialize(void); // @ 0x1AE440 (0x80 bytes) -- mangled: Initialize__12CSHOT_EFFECTFv
};

class CSHOT {
public:
    /* ?ret */ void draw(void); // @ 0x1ABC40 (0xD0 bytes) -- mangled: draw__5CSHOTFv
    /* ?ret */ void step(void); // @ 0x1ABD10 (0x210 bytes) -- mangled: step__5CSHOTFv
};

class CSHOT_MACHINGUN {
public:
    /* ?ret */ void Set(float *, float *, int, int); // @ 0x1AE660 (0xF0 bytes) -- mangled: Set__15CSHOT_MACHINGUNFPfPfii
    /* ?ret */ void Step(void); // @ 0x1AE750 (0x230 bytes) -- mangled: Step__15CSHOT_MACHINGUNFv
};
