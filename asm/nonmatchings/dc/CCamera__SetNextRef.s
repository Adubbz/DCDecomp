.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetNextRef__7CCameraFP6CFramefff
/* 24480 00124380 90028CE4 */  swc1       $f12, 0x290($4)
/* 24484 00124384 94028DE4 */  swc1       $f13, 0x294($4)
/* 24488 00124388 98028EE4 */  swc1       $f14, 0x298($4)
/* 2448C 0012438C 0800E003 */  jr         $31
/* 24490 00124390 00000000 */   nop
/* 24494 00124394 00000000 */  nop
/* 24498 00124398 00000000 */  nop
/* 2449C 0012439C 00000000 */  nop
