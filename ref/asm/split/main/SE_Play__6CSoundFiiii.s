.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SE_Play__6CSoundFiiii
/* 045950 00145850 F0FFBD27 */  addiu       $29, $29, -0x10
/* 045954 00145854 0000BF7F */  sq          $31, 0x0($29)
/* 045958 00145858 285E0071 */  paddub      $11, $8, $0
/* 04595C 0014585C 40000824 */  addiu       $8, $0, 0x40
/* 045960 00145860 7F000924 */  addiu       $9, $0, 0x7F
/* 045964 00145864 28562071 */  paddub      $10, $9, $0
/* 045968 00145868 7C15050C */  jal         SE_Play__6CSoundFiiiiiii
/* 04596C 0014586C 00000000 */   nop
/* 045970 00145870 0000BF7B */  lq          $31, 0x0($29)
/* 045974 00145874 1000BD27 */  addiu       $29, $29, 0x10
/* 045978 00145878 0800E003 */  jr          $31
/* 04597C 0014587C 00000000 */   nop
