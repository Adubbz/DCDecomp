.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SE_Play__6CSoundFiiiii
/* 045920 00145820 F0FFBD27 */  addiu       $29, $29, -0x10
/* 045924 00145824 0000BF7F */  sq          $31, 0x0($29)
/* 045928 00145828 28560071 */  paddub      $10, $8, $0
/* 04592C 0014582C 285E2071 */  paddub      $11, $9, $0
/* 045930 00145830 40000824 */  addiu       $8, $0, 0x40
/* 045934 00145834 7F000924 */  addiu       $9, $0, 0x7F
/* 045938 00145838 7C15050C */  jal         SE_Play__6CSoundFiiiiiii
/* 04593C 0014583C 00000000 */   nop
/* 045940 00145840 0000BF7B */  lq          $31, 0x0($29)
/* 045944 00145844 1000BD27 */  addiu       $29, $29, 0x10
/* 045948 00145848 0800E003 */  jr          $31
/* 04594C 0014584C 00000000 */   nop
