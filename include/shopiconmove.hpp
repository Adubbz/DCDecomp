#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct MENU_ITEMDATA;


class ShopIconMove {
public:
    /**
     * @mangled IconMoveTarSet__12ShopIconMoveFiiiP13MENU_ITEMDATAffi
     * @address 0x1E6930
     * @size 0x70
     * @unknownret
     */
    void IconMoveTarSet(int, int, int, MENU_ITEMDATA *, float, float, int);

    /**
     * @mangled IconAutoMove__12ShopIconMoveFii
     * @address 0x1E69A0
     * @size 0x460
     * @unknownret
     */
    void IconAutoMove(int, int);

    /**
     * @mangled IconAutoMoveDraw__12ShopIconMoveFv
     * @address 0x1E6E00
     * @size 0xF0
     * @unknownret
     */
    void IconAutoMoveDraw(void);
};
