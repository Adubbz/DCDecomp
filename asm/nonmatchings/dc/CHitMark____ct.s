.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__8CHitMarkFv
/* 437E0 001436E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 437E4 001436E4 1000BF7F */  sq         $31, 0x10($sp)
/* 437E8 001436E8 0000B07F */  sq         $16, 0x0($sp)
/* 437EC 001436EC 28868070 */  paddub     $16, $4, $0
/* 437F0 001436F0 940D050C */  jal        __ct__7CObjectFv
/* 437F4 001436F4 00000000 */   nop
/* 437F8 001436F8 2A00023C */  lui        $2, %hi(__vt__8CHitMark)
/* 437FC 001436FC 20174224 */  addiu      $2, $2, %lo(__vt__8CHitMark)
/* 43800 00143700 A00002AE */  sw         $2, 0xA0($16)
/* 43804 00143704 28160072 */  paddub     $2, $16, $0
/* 43808 00143708 1000BF7B */  lq         $31, 0x10($sp)
/* 4380C 0014370C 0000B07B */  lq         $16, 0x0($sp)
/* 43810 00143710 2000BD27 */  addiu      $sp, $sp, 0x20
/* 43814 00143714 0800E003 */  jr         $31
/* 43818 00143718 00000000 */   nop
/* 4381C 0014371C 00000000 */  nop
