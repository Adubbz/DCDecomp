.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndStep__Fv
/* 059450 00159350 F0FFBD27 */  addiu       $29, $29, -0x10
/* 059454 00159354 0000BF7F */  sq          $31, 0x0($29)
/* 059458 00159358 E467050C */  jal         SndBgmFadeInOut__Fv
/* 05945C 0015935C 00000000 */   nop
/* 059460 00159360 E86B050C */  jal         SndSeSeqStep__Fv
/* 059464 00159364 00000000 */   nop
/* 059468 00159368 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05946C 0015936C C817050C */  jal         Step__6CSoundFv
/* 059470 00159370 00000000 */   nop
/* 059474 00159374 0000BF7B */  lq          $31, 0x0($29)
/* 059478 00159378 1000BD27 */  addiu       $29, $29, 0x10
/* 05947C 0015937C 0800E003 */  jr          $31
/* 059480 00159380 00000000 */   nop
/* 059484 00159384 00000000 */  nop
/* 059488 00159388 00000000 */  nop
/* 05948C 0015938C 00000000 */  nop
