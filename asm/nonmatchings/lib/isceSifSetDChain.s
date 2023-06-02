.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel isceSifSetDChain
/* 14810 00114710 88FF0324 */  addiu      $3, $0, -0x78
/* 14814 00114714 0C000000 */  syscall    0
/* 14818 00114718 0800E003 */  jr         $31
/* 1481C 0011471C 00000000 */   nop
