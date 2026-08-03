#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct BT_SHOT_EFFECT;
class CDataAlloc2_1_;


class CSHOT_EFFECT_PACK {
public:
    /**
     * @mangled Entry__17CSHOT_EFFECT_PACKFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
     * @address 0x1AE4C0
     * @size 0x100
     * @unknownret
     */
    void Entry(BT_SHOT_EFFECT *, unsigned int *, int, CDataAlloc2_1_ *, int);

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
