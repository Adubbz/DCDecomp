.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRef__7CCameraFfff
/* 24450 00124350 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 24454 00124354 0000BF7F */  sq         $31, 0x0($sp)
/* 24458 00124358 282E0070 */  paddub     $5, $0, $0
/* 2445C 0012435C BC90040C */  jal        SetRef__7CCameraFP6CFramefff
/* 24460 00124360 00000000 */   nop
/* 24464 00124364 0000BF7B */  lq         $31, 0x0($sp)
/* 24468 00124368 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2446C 0012436C 0800E003 */  jr         $31
/* 24470 00124370 00000000 */   nop
/* 24474 00124374 00000000 */  nop
/* 24478 00124378 00000000 */  nop
/* 2447C 0012437C 00000000 */  nop
