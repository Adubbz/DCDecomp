.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel get_iob
/* 17CE0 00117BE0 1000822C */  sltiu      $2, $4, 0x10
/* 17CE4 00117BE4 03004014 */  bnez       $2, .L00117BF4
/* 17CE8 00117BE8 2B00023C */   lui       $2, %hi(D_002A8010)
/* 17CEC 00117BEC 0800E003 */  jr         $31
/* 17CF0 00117BF0 2D100000 */   daddu     $2, $0, $0
.L00117BF4:
/* 17CF4 00117BF4 00190400 */  sll        $3, $4, 4
/* 17CF8 00117BF8 10804224 */  addiu      $2, $2, %lo(D_002A8010)
/* 17CFC 00117BFC 0800E003 */  jr         $31
/* 17D00 00117C00 21106200 */   addu      $2, $3, $2
/* 17D04 00117C04 00000000 */  nop
