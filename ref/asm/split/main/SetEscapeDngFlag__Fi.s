.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetEscapeDngFlag__Fi
/* 0F40A0 001F3FA0 649584A7 */  sh          $4, -0x6A9C($28)
/* 0F40A4 001F3FA4 0800E003 */  jr          $31
/* 0F40A8 001F3FA8 00000000 */   nop
/* 0F40AC 001F3FAC 00000000 */  nop
