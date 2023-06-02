.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iPollSema
/* 14480 00114380 BAFF0324 */  addiu      $3, $0, -0x46
/* 14484 00114384 0C000000 */  syscall    0
/* 14488 00114388 0800E003 */  jr         $31
/* 1448C 0011438C 00000000 */   nop
