.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _EnableDmac
/* 14180 00114080 16000324 */  addiu      $3, $0, 0x16
/* 14184 00114084 0C000000 */  syscall    0
/* 14188 00114088 0800E003 */  jr         $31
/* 1418C 0011408C 00000000 */   nop
