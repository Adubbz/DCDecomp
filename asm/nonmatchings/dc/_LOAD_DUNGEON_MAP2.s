.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _LOAD_DUNGEON_MAP2__FP12RS_STACKDATAi
/* BC610 001BC510 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BC614 001BC514 0000BF7F */  sq         $31, 0x0($sp)
/* BC618 001BC518 789C838F */  lw         $3, -0x6388($gp)
/* BC61C 001BC51C FFFF0224 */  addiu      $2, $0, -0x1
/* BC620 001BC520 0100013C */  lui        $at, (0x10000 >> 16)
/* BC624 001BC524 21086100 */  addu       $at, $3, $at
/* BC628 001BC528 108B22AC */  sw         $2, -0x74F0($at)
/* BC62C 001BC52C D501023C */  lui        $2, %hi(BtLoadMapFileName)
/* BC630 001BC530 80694424 */  addiu      $4, $2, %lo(BtLoadMapFileName)
/* BC634 001BC534 38C8060C */  jal        BtMapJumpLoad__FPc
/* BC638 001BC538 00000000 */   nop
/* BC63C 001BC53C 01000224 */  addiu      $2, $0, 0x1
/* BC640 001BC540 0000BF7B */  lq         $31, 0x0($sp)
/* BC644 001BC544 1000BD27 */  addiu      $sp, $sp, 0x10
/* BC648 001BC548 0800E003 */  jr         $31
/* BC64C 001BC54C 00000000 */   nop
