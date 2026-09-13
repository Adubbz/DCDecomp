#include "spritetable.hpp"

INCLUDE_ASM("asm/nonmatchings/spritetable", DrawTable__12CSpriteTableFv);
INCLUDE_ASM("asm/nonmatchings/spritetable", AddTable__12CSpriteTableFiiP9MG_SPRITEii);
INCLUDE_ASM("asm/nonmatchings/spritetable", AddTable__12CSpriteTableFiiP9sceGsTex0P4RECTii);
INCLUDE_ASM("asm/nonmatchings/spritetable", Initialize__12CSpriteTableFP12SPRITE_TABLEii);

SPRITE_TABLE *CSpriteTable::GetNext() {
    SPRITE_TABLE *next = NULL;

    if ((u_int) current < (u_int) end) {
        next = current;
        current++;
    }
    return next;
}

INCLUDE_ASM("asm/nonmatchings/spritetable", ClearPointer__12CSpriteTableFv);
