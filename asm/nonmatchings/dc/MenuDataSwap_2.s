.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuDataSwap__FPsPs
/* 12E5E0 0022E4E0 03008010 */  beqz       $4, .L0022E4F0
/* 12E5E4 0022E4E4 00000000 */   nop
/* 12E5E8 0022E4E8 0300A014 */  bnez       $5, .L0022E4F8
/* 12E5EC 0022E4EC 00000000 */   nop
.L0022E4F0:
/* 12E5F0 0022E4F0 05000010 */  b          .L0022E508
/* 12E5F4 0022E4F4 00000000 */   nop
.L0022E4F8:
/* 12E5F8 0022E4F8 00008684 */  lh         $6, 0x0($4)
/* 12E5FC 0022E4FC 0000A384 */  lh         $3, 0x0($5)
/* 12E600 0022E500 000083A4 */  sh         $3, 0x0($4)
/* 12E604 0022E504 0000A6A4 */  sh         $6, 0x0($5)
.L0022E508:
/* 12E608 0022E508 0800E003 */  jr         $31
/* 12E60C 0022E50C 00000000 */   nop
