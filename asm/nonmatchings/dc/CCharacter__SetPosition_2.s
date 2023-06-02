.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPosition__10CCharacterFPf
/* 391E0 001390E0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 391E4 001390E4 0000BF7F */  sq         $31, 0x0($sp)
/* 391E8 001390E8 0000ACC4 */  lwc1       $f12, 0x0($5)
/* 391EC 001390EC 0400ADC4 */  lwc1       $f13, 0x4($5)
/* 391F0 001390F0 0800AEC4 */  lwc1       $f14, 0x8($5)
/* 391F4 001390F4 ECE3040C */  jal        SetPosition__10CCharacterFfff
/* 391F8 001390F8 00000000 */   nop
/* 391FC 001390FC 0000BF7B */  lq         $31, 0x0($sp)
/* 39200 00139100 1000BD27 */  addiu      $sp, $sp, 0x10
/* 39204 00139104 0800E003 */  jr         $31
/* 39208 00139108 00000000 */   nop
/* 3920C 0013910C 00000000 */  nop
