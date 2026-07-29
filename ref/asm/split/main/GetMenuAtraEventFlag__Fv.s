.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetMenuAtraEventFlag__Fv
/* 11A190 0021A090 DB01013C */  lui         $1, %hi(MenuAtoraSel + 0x19A)
/* 11A194 0021A094 6A822284 */  lh          $2, %lo(MenuAtoraSel + 0x19A)($1)
/* 11A198 0021A098 0800E003 */  jr          $31
/* 11A19C 0021A09C 00000000 */   nop
