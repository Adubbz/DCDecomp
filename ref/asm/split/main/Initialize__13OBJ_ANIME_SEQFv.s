.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Initialize__13OBJ_ANIME_SEQFv
/* 065D90 00165C90 FFFF0324 */  addiu       $3, $0, -0x1
/* 065D94 00165C94 100083AC */  sw          $3, 0x10($4)
/* 065D98 00165C98 880080AC */  sw          $0, 0x88($4)
/* 065D9C 00165C9C 0800E003 */  jr          $31
/* 065DA0 00165CA0 00000000 */   nop
/* 065DA4 00165CA4 00000000 */  nop
/* 065DA8 00165CA8 00000000 */  nop
/* 065DAC 00165CAC 00000000 */  nop
