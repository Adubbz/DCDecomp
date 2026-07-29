.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __register_frame_table
/* 011F98 00111E98 E0FFBD27 */  addiu       $29, $29, -0x20
/* 011F9C 00111E9C 0000B0FF */  sd          $16, 0x0($29)
/* 011FA0 00111EA0 2D808000 */  daddu       $16, $4, $0
/* 011FA4 00111EA4 1000BFFF */  sd          $31, 0x10($29)
/* 011FA8 00111EA8 FC09040C */  jal         malloc
/* 011FAC 00111EAC 18000424 */   addiu      $4, $0, 0x18
/* 011FB0 00111EB0 2D200002 */  daddu       $4, $16, $0
/* 011FB4 00111EB4 1000BFDF */  ld          $31, 0x10($29)
/* 011FB8 00111EB8 0000B0DF */  ld          $16, 0x0($29)
/* 011FBC 00111EBC 2D284000 */  daddu       $5, $2, $0
/* 011FC0 00111EC0 9C470408 */  j           __register_frame_info_table
/* 011FC4 00111EC4 2000BD27 */   addiu      $29, $29, 0x20
