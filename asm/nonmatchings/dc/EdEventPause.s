.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdEventPause__Fv
/* 8A3B0 0018A2B0 3C92838F */  lw         $3, -0x6DC4($gp)
/* 8A3B4 0018A2B4 2B180300 */  sltu       $3, $0, $3
/* 8A3B8 0018A2B8 01006338 */  xori       $3, $3, 0x1
/* 8A3BC 0018A2BC FF006330 */  andi       $3, $3, 0xFF
/* 8A3C0 0018A2C0 3C9283AF */  sw         $3, -0x6DC4($gp)
/* 8A3C4 0018A2C4 0800E003 */  jr         $31
/* 8A3C8 0018A2C8 00000000 */   nop
/* 8A3CC 0018A2CC 00000000 */  nop
