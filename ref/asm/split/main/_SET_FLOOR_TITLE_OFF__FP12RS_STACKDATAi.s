.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_FLOOR_TITLE_OFF__FP12RS_STACKDATAi
/* 0BD170 001BD070 01000224 */  addiu       $2, $0, 0x1
/* 0BD174 001BD074 D501013C */  lui         $1, %hi(BtEventInfo + 0x8C)
/* 0BD178 001BD078 CC6722AC */  sw          $2, %lo(BtEventInfo + 0x8C)($1)
/* 0BD17C 001BD07C 0800E003 */  jr          $31
/* 0BD180 001BD080 00000000 */   nop
/* 0BD184 001BD084 00000000 */  nop
/* 0BD188 001BD088 00000000 */  nop
/* 0BD18C 001BD08C 00000000 */  nop
