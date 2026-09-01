#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 604

#include "shot_utils.hpp"

INCLUDE_ASM("asm/nonmatchings/shot_utils", checkCollision__FPfPfPfif);
INCLUDE_ASM("asm/nonmatchings/shot_utils", set3DCellModel__FPfPcfiiiiUc);
