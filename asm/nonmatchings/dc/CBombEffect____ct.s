.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__11CBombEffectFv
/* 43560 00143460 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 43564 00143464 1000BF7F */  sq         $31, 0x10($sp)
/* 43568 00143468 0000B07F */  sq         $16, 0x0($sp)
/* 4356C 0014346C 28868070 */  paddub     $16, $4, $0
/* 43570 00143470 240D050C */  jal        Initialize__11CBombEffectFv
/* 43574 00143474 00000000 */   nop
/* 43578 00143478 28160072 */  paddub     $2, $16, $0
/* 4357C 0014347C 1000BF7B */  lq         $31, 0x10($sp)
/* 43580 00143480 0000B07B */  lq         $16, 0x0($sp)
/* 43584 00143484 2000BD27 */  addiu      $sp, $sp, 0x20
/* 43588 00143488 0800E003 */  jr         $31
/* 4358C 0014348C 00000000 */   nop
