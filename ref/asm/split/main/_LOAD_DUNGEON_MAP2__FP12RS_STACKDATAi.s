.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _LOAD_DUNGEON_MAP2__FP12RS_STACKDATAi
/* 0BC610 001BC510 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BC614 001BC514 0000BF7F */  sq          $31, 0x0($29)
/* 0BC618 001BC518 789C838F */  lw          $3, -0x6388($28)
/* 0BC61C 001BC51C FFFF0224 */  addiu       $2, $0, -0x1
/* 0BC620 001BC520 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BC624 001BC524 21086100 */  addu        $1, $3, $1
/* 0BC628 001BC528 108B22AC */  sw          $2, -0x74F0($1)
/* 0BC62C 001BC52C D501023C */  lui         $2, %hi(BtLoadMapFileName)
/* 0BC630 001BC530 80694424 */  addiu       $4, $2, %lo(BtLoadMapFileName)
/* 0BC634 001BC534 38C8060C */  jal         BtMapJumpLoad__FPc
/* 0BC638 001BC538 00000000 */   nop
/* 0BC63C 001BC53C 01000224 */  addiu       $2, $0, 0x1
/* 0BC640 001BC540 0000BF7B */  lq          $31, 0x0($29)
/* 0BC644 001BC544 1000BD27 */  addiu       $29, $29, 0x10
/* 0BC648 001BC548 0800E003 */  jr          $31
/* 0BC64C 001BC54C 00000000 */   nop
