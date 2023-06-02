.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _EB_INTRO_START__FP12RS_STACKDATAi
/* 968E0 001967E0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 968E4 001967E4 0000BF7F */  sq         $31, 0x0($sp)
/* 968E8 001967E8 80A0050C */  jal        EBInitIntro__Fv
/* 968EC 001967EC 00000000 */   nop
/* 968F0 001967F0 01000224 */  addiu      $2, $0, 0x1
/* 968F4 001967F4 0000BF7B */  lq         $31, 0x0($sp)
/* 968F8 001967F8 1000BD27 */  addiu      $sp, $sp, 0x10
/* 968FC 001967FC 0800E003 */  jr         $31
/* 96900 00196800 00000000 */   nop
/* 96904 00196804 00000000 */  nop
/* 96908 00196808 00000000 */  nop
/* 9690C 0019680C 00000000 */  nop
