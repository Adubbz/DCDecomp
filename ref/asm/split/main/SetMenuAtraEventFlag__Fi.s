.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetMenuAtraEventFlag__Fi
/* 11A1A0 0021A0A0 DB01013C */  lui         $1, %hi(MenuAtoraSel + 0x19A)
/* 11A1A4 0021A0A4 6A8224A4 */  sh          $4, %lo(MenuAtoraSel + 0x19A)($1)
/* 11A1A8 0021A0A8 0800E003 */  jr          $31
/* 11A1AC 0021A0AC 00000000 */   nop
