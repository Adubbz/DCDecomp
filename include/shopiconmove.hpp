#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct MENU_ITEMDATA;


class ShopIconMove {
public:
    /* ?ret */ void IconMoveTarSet(int, int, int, MENU_ITEMDATA *, float, float, int); // @ 0x1E6930 (0x70 bytes) -- mangled: IconMoveTarSet__12ShopIconMoveFiiiP13MENU_ITEMDATAffi
    /* ?ret */ void IconAutoMove(int, int); // @ 0x1E69A0 (0x460 bytes) -- mangled: IconAutoMove__12ShopIconMoveFii
    /* ?ret */ void IconAutoMoveDraw(void); // @ 0x1E6E00 (0xF0 bytes) -- mangled: IconAutoMoveDraw__12ShopIconMoveFv
};
