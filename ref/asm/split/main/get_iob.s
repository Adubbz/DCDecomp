.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel get_iob
/* 017CE0 00117BE0 1000822C */  sltiu       $2, $4, 0x10
/* 017CE4 00117BE4 03004014 */  bnez        $2, .L00117BF4
/* 017CE8 00117BE8 2B00023C */   lui        $2, %hi(_iob)
/* 017CEC 00117BEC 0800E003 */  jr          $31
/* 017CF0 00117BF0 2D100000 */   daddu      $2, $0, $0
.L00117BF4:
/* 017CF4 00117BF4 00190400 */  sll         $3, $4, 4
/* 017CF8 00117BF8 10804224 */  addiu       $2, $2, %lo(_iob)
/* 017CFC 00117BFC 0800E003 */  jr          $31
/* 017D00 00117C00 21106200 */   addu       $2, $3, $2
/* 017D04 00117C04 00000000 */  nop
