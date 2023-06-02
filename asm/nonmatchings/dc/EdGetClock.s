.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdGetClock__Fv
/* 78240 00178140 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 78244 00178144 0000BF7F */  sq         $31, 0x0($sp)
/* 78248 00178148 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7824C 0017814C 54D0050C */  jal        InvertTime__Ff
/* 78250 00178150 00000000 */   nop
/* 78254 00178154 0000BF7B */  lq         $31, 0x0($sp)
/* 78258 00178158 1000BD27 */  addiu      $sp, $sp, 0x10
/* 7825C 0017815C 0800E003 */  jr         $31
/* 78260 00178160 00000000 */   nop
/* 78264 00178164 00000000 */  nop
/* 78268 00178168 00000000 */  nop
/* 7826C 0017816C 00000000 */  nop
