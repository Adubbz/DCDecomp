.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StartReadBG__Fv
/* 3EDC0 0013ECC0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 3EDC4 0013ECC4 0000BF7F */  sq         $31, 0x0($sp)
/* 3EDC8 0013ECC8 94FA040C */  jal        InitReadBG__Fv
/* 3EDCC 0013ECCC 00000000 */   nop
/* 3EDD0 0013ECD0 0000BF7B */  lq         $31, 0x0($sp)
/* 3EDD4 0013ECD4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 3EDD8 0013ECD8 0800E003 */  jr         $31
/* 3EDDC 0013ECDC 00000000 */   nop
