.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetFuncNo__17CMemoryCardAccessFv
/* 113CE0 00213BE0 BC00828C */  lw         $2, 0xBC($4)
/* 113CE4 00213BE4 0800E003 */  jr         $31
/* 113CE8 00213BE8 00000000 */   nop
/* 113CEC 00213BEC 00000000 */  nop
