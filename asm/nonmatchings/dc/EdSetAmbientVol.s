.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdSetAmbientVol__Ff
/* 71710 00171610 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 71714 00171614 0000BF7F */  sq         $31, 0x0($sp)
/* 71718 00171618 906C050C */  jal        SndAmbientSetVolf__Ff
/* 7171C 0017161C 00000000 */   nop
/* 71720 00171620 0000BF7B */  lq         $31, 0x0($sp)
/* 71724 00171624 1000BD27 */  addiu      $sp, $sp, 0x10
/* 71728 00171628 0800E003 */  jr         $31
/* 7172C 0017162C 00000000 */   nop
