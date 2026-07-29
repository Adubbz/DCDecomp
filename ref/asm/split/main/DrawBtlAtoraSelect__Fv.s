.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawBtlAtoraSelect__Fv
/* 0F5910 001F5810 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0F5914 001F5814 0000BF7F */  sq          $31, 0x0($29)
/* 0F5918 001F5818 A06A080C */  jal         DrawMenuAtoraSelect__Fv
/* 0F591C 001F581C 00000000 */   nop
/* 0F5920 001F5820 0000BF7B */  lq          $31, 0x0($29)
/* 0F5924 001F5824 1000BD27 */  addiu       $29, $29, 0x10
/* 0F5928 001F5828 0800E003 */  jr          $31
/* 0F592C 001F582C 00000000 */   nop
