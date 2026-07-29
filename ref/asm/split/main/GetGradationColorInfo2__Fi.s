.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetGradationColorInfo2__Fi
/* 0F3FE0 001F3EE0 00190400 */  sll         $3, $4, 4
/* 0F3FE4 001F3EE4 2900023C */  lui         $2, %hi(MenuColorInfo2)
/* 0F3FE8 001F3EE8 B02C4224 */  addiu       $2, $2, %lo(MenuColorInfo2)
/* 0F3FEC 001F3EEC 21104300 */  addu        $2, $2, $3
/* 0F3FF0 001F3EF0 0800E003 */  jr          $31
/* 0F3FF4 001F3EF4 00000000 */   nop
/* 0F3FF8 001F3EF8 00000000 */  nop
/* 0F3FFC 001F3EFC 00000000 */  nop
