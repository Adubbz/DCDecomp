.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GO_DUNGEON__FP12RS_STACKDATAi
/* 0BC580 001BC480 04000224 */  addiu       $2, $0, 0x4
/* 0BC584 001BC484 D501013C */  lui         $1, %hi(BtEventInfo + 0x98)
/* 0BC588 001BC488 D86722AC */  sw          $2, %lo(BtEventInfo + 0x98)($1)
/* 0BC58C 001BC48C 01000224 */  addiu       $2, $0, 0x1
/* 0BC590 001BC490 0800E003 */  jr          $31
/* 0BC594 001BC494 00000000 */   nop
/* 0BC598 001BC498 00000000 */  nop
/* 0BC59C 001BC49C 00000000 */  nop
