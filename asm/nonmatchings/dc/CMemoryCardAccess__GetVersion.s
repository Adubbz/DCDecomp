.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetVersion__17CMemoryCardAccessFv
/* 113EE0 00213DE0 1C008224 */  addiu      $2, $4, 0x1C
/* 113EE4 00213DE4 0800E003 */  jr         $31
/* 113EE8 00213DE8 00000000 */   nop
/* 113EEC 00213DEC 00000000 */  nop
