.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingGetWaterLevel__Fv
/* A92D0 001A91D0 389380C7 */  lwc1       $f0, -0x6CC8($gp)
/* A92D4 001A91D4 0800E003 */  jr         $31
/* A92D8 001A91D8 00000000 */   nop
/* A92DC 001A91DC 00000000 */  nop
