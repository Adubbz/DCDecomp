.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetFollow__13CCameraFollowFfff
/* 24BE0 00124AE0 C0028CE4 */  swc1       $f12, 0x2C0($4)
/* 24BE4 00124AE4 C4028DE4 */  swc1       $f13, 0x2C4($4)
/* 24BE8 00124AE8 C8028EE4 */  swc1       $f14, 0x2C8($4)
/* 24BEC 00124AEC 0800E003 */  jr         $31
/* 24BF0 00124AF0 00000000 */   nop
/* 24BF4 00124AF4 00000000 */  nop
/* 24BF8 00124AF8 00000000 */  nop
/* 24BFC 00124AFC 00000000 */  nop
