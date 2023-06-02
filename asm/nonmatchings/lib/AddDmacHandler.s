.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddDmacHandler
/* 14130 00114030 12000324 */  addiu      $3, $0, 0x12
/* 14134 00114034 0C000000 */  syscall    0
/* 14138 00114038 0800E003 */  jr         $31
/* 1413C 0011403C 00000000 */   nop
