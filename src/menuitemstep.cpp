#include "menuitemstep.hpp"

#ifdef NON_MATCHING
void CMenuItemStep::Initialize(void) {
    frame = 0;
    unk_08 = -1;
    unk_04 = -1;
    enabled = 1;
    pending_volume = 0;
    for (int i = 0; i < 4; i++) {
        unk_10[i] = 0;
    }
    for (int i = 0; i < 4; i++) {
        unk_18[i] = -1;
        unk_20[i] = -1;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/menuitemstep", Initialize__13CMenuItemStepFv);
#endif
#ifdef NON_MATCHING
void CMenuItemStep::LoopStep(int interval) {
    if (enabled != 0) {
        // A negative interval asks for the default of one second.
        if (interval < 0) {
            interval = 60;
        }
        frame++;
        if (frame >= interval) {
            pending_volume++;
            frame = 0;
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/menuitemstep", LoopStep__13CMenuItemStepFi);
#endif
INCLUDE_ASM("asm/nonmatchings/menuitemstep", CheckItemVolume__13CMenuItemStepFv);
