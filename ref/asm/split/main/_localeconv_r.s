.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _localeconv_r
/* 0026D8 001025D8 2900023C */  lui         $2, %hi(lconv)
/* 0026DC 001025DC 0800E003 */  jr          $31
/* 0026E0 001025E0 20694224 */   addiu      $2, $2, %lo(lconv)
/* 0026E4 001025E4 00000000 */  nop
