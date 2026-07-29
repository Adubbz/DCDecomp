.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CheckEffect__11CEditGroundFv
/* 0A1AC0 001A19C0 0100013C */  lui         $1, (0x15F00 >> 16)
/* 0A1AC4 001A19C4 21088100 */  addu        $1, $4, $1
/* 0A1AC8 001A19C8 005F228C */  lw          $2, (0x15F00 & 0xFFFF)($1)
/* 0A1ACC 001A19CC 2A100200 */  slt         $2, $0, $2
/* 0A1AD0 001A19D0 0800E003 */  jr          $31
/* 0A1AD4 001A19D4 00000000 */   nop
/* 0A1AD8 001A19D8 00000000 */  nop
/* 0A1ADC 001A19DC 00000000 */  nop
