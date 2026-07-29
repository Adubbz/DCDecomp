.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdEventPause__Fv
/* 08A3B0 0018A2B0 3C92838F */  lw          $3, -0x6DC4($28)
/* 08A3B4 0018A2B4 2B180300 */  sltu        $3, $0, $3
/* 08A3B8 0018A2B8 01006338 */  xori        $3, $3, 0x1
/* 08A3BC 0018A2BC FF006330 */  andi        $3, $3, 0xFF
/* 08A3C0 0018A2C0 3C9283AF */  sw          $3, -0x6DC4($28)
/* 08A3C4 0018A2C4 0800E003 */  jr          $31
/* 08A3C8 0018A2C8 00000000 */   nop
/* 08A3CC 0018A2CC 00000000 */  nop
