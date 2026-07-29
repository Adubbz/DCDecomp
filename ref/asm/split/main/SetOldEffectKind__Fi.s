.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetOldEffectKind__Fi
/* 10D190 0020D090 E49584A7 */  sh          $4, -0x6A1C($28)
/* 10D194 0020D094 0800E003 */  jr          $31
/* 10D198 0020D098 00000000 */   nop
/* 10D19C 0020D09C 00000000 */  nop
