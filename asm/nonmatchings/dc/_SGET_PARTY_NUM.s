.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SGET_PARTY_NUM__FP12RS_STACKDATAi
/* 95530 00195430 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 95534 00195434 1000BF7F */  sq         $31, 0x10($sp)
/* 95538 00195438 0000B07F */  sq         $16, 0x0($sp)
/* 9553C 0019543C 28868070 */  paddub     $16, $4, $0
/* 95540 00195440 1C8D848F */  lw         $4, -0x72E4($gp)
/* 95544 00195444 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* 95548 00195448 00000000 */   nop
/* 9554C 0019544C 28260072 */  paddub     $4, $16, $0
/* 95550 00195450 05004580 */  lb         $5, 0x5($2)
/* 95554 00195454 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 95558 00195458 00000000 */   nop
/* 9555C 0019545C 01000224 */  addiu      $2, $0, 0x1
/* 95560 00195460 1000BF7B */  lq         $31, 0x10($sp)
/* 95564 00195464 0000B07B */  lq         $16, 0x0($sp)
/* 95568 00195468 2000BD27 */  addiu      $sp, $sp, 0x20
/* 9556C 0019546C 0800E003 */  jr         $31
/* 95570 00195470 00000000 */   nop
/* 95574 00195474 00000000 */  nop
/* 95578 00195478 00000000 */  nop
/* 9557C 0019547C 00000000 */  nop
