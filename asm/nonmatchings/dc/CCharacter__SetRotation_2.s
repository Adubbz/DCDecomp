.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotation__10CCharacterFPf
/* 392E0 001391E0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 392E4 001391E4 0000BF7F */  sq         $31, 0x0($sp)
/* 392E8 001391E8 0000ACC4 */  lwc1       $f12, 0x0($5)
/* 392EC 001391EC 0400ADC4 */  lwc1       $f13, 0x4($5)
/* 392F0 001391F0 0800AEC4 */  lwc1       $f14, 0x8($5)
/* 392F4 001391F4 54E4040C */  jal        SetRotation__10CCharacterFfff
/* 392F8 001391F8 00000000 */   nop
/* 392FC 001391FC 0000BF7B */  lq         $31, 0x0($sp)
/* 39300 00139200 1000BD27 */  addiu      $sp, $sp, 0x10
/* 39304 00139204 0800E003 */  jr         $31
/* 39308 00139208 00000000 */   nop
/* 3930C 0013920C 00000000 */  nop
