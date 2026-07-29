.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetFootSoundID__10CCharacterFi
/* 038310 00138210 D80D85AC */  sw          $5, 0xDD8($4)
/* 038314 00138214 0800E003 */  jr          $31
/* 038318 00138218 00000000 */   nop
/* 03831C 0013821C 00000000 */  nop
