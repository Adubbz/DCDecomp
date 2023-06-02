.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndStep__Fv
/* 59450 00159350 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 59454 00159354 0000BF7F */  sq         $31, 0x0($sp)
/* 59458 00159358 E467050C */  jal        SndBgmFadeInOut__Fv
/* 5945C 0015935C 00000000 */   nop
/* 59460 00159360 E86B050C */  jal        SndSeSeqStep__Fv
/* 59464 00159364 00000000 */   nop
/* 59468 00159368 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5946C 0015936C C817050C */  jal        Step__6CSoundFv
/* 59470 00159370 00000000 */   nop
/* 59474 00159374 0000BF7B */  lq         $31, 0x0($sp)
/* 59478 00159378 1000BD27 */  addiu      $sp, $sp, 0x10
/* 5947C 0015937C 0800E003 */  jr         $31
/* 59480 00159380 00000000 */   nop
/* 59484 00159384 00000000 */  nop
/* 59488 00159388 00000000 */  nop
/* 5948C 0015938C 00000000 */  nop
