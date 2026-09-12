.include "macro.inc"

.set noat
.set noreorder

glabel FishingGetWaterLevel__Fv
    /* 0A92D0 001A91D0 389380C7 */  lwc1       $f0, -0x6CC8($28)
    /* 0A92D4 001A91D4 0800E003 */  jr         $31
    /* 0A92D8 001A91D8 00000000 */   nop
    /* 0A92DC 001A91DC 00000000 */  nop
