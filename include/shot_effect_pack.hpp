#pragma once

#include "common.h"

#include "dataalloc_fwd.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct BT_SHOT_EFFECT;

class CSHOT_EFFECT_PACK {
public:
    /**
     * @mangled Entry__17CSHOT_EFFECT_PACKFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
     * @address 0x1AE4C0
     * @size 0x100
     * Returns an existing/new slot (0..4), or -1 when full.
     */
    int Entry(BT_SHOT_EFFECT *, unsigned int *, int, CDataAlloc2<1> *, int);

    /**
     * @mangled SetUserID2__17CSHOT_EFFECT_PACKFi
     * @address 0x1AE5C0
     * @size 0x50
     * @unknownret
     */
    void SetUserID2(int);

    /**
     * @mangled SetDmg__17CSHOT_EFFECT_PACKFi
     * @address 0x1AE610
     * @size 0x50
     * @unknownret
     */
    void SetDmg(int);
};

extern "C" CSHOT_EFFECT_PACK *NowShotEffect;
