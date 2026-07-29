.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _NO_STATUS_RECOVER__FP12RS_STACKDATAi
/* 0BD620 001BD520 01000224 */  addiu       $2, $0, 0x1
/* 0BD624 001BD524 D501013C */  lui         $1, %hi(BtEventInfo + 0xB8)
/* 0BD628 001BD528 F86722AC */  sw          $2, %lo(BtEventInfo + 0xB8)($1)
/* 0BD62C 001BD52C 0800E003 */  jr          $31
/* 0BD630 001BD530 00000000 */   nop
/* 0BD634 001BD534 00000000 */  nop
/* 0BD638 001BD538 00000000 */  nop
/* 0BD63C 001BD53C 00000000 */  nop
