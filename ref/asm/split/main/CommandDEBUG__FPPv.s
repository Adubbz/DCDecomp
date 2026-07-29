.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandDEBUG__FPPv
/* 0A0230 001A0130 01000324 */  addiu       $3, $0, 0x1
/* 0A0234 001A0134 209383AF */  sw          $3, -0x6CE0($28)
/* 0A0238 001A0138 0800E003 */  jr          $31
/* 0A023C 001A013C 00000000 */   nop
