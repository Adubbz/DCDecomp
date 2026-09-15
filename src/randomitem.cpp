#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 1383

#include "randomitem.hpp"

INCLUDE_ASM("asm/nonmatchings/randomitem", Draw__11CRandomItemFv);
INCLUDE_ASM("asm/nonmatchings/randomitem", MapSymbolDraw__11CRandomItemFv);
INCLUDE_RODATA("asm/nonmatchings/randomitem", @1383);
#ifdef NON_MATCHING
int CRandomItem::checkEvent(void) {
    for (int i = 0; i < 32; i++) {
        int event = pickup_event[i];
        if (event != -1) {
            pickup_event[i] = -1;
            return event;
        }
    }
    return -1;
}
#else
INCLUDE_ASM("asm/nonmatchings/randomitem", checkEvent__11CRandomItemFv);
#endif
#ifdef NON_MATCHING
int CRandomItem::checkErr(void) {
    for (int i = 0; i < 32; i++) {
        if (state[i] > 0 && state[i] < 3) {
            state[i] = 3;
            return 1;
        }
    }
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/randomitem", checkErr__11CRandomItemFv);
#endif
INCLUDE_ASM("asm/nonmatchings/randomitem", CheckPosition__11CRandomItemFv);
INCLUDE_ASM("asm/nonmatchings/randomitem", Set__11CRandomItemFPfiii);
INCLUDE_ASM("asm/nonmatchings/randomitem", CheckID__11CRandomItemFv);
INCLUDE_ASM("asm/nonmatchings/randomitem", CheckItemNo__11CRandomItemFi);
INCLUDE_ASM("asm/nonmatchings/randomitem", Step__11CRandomItemFv);
