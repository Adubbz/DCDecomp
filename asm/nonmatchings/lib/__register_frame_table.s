.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __register_frame_table
/* 11F98 00111E98 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 11F9C 00111E9C 0000B0FF */  sd         $16, 0x0($sp)
/* 11FA0 00111EA0 2D808000 */  daddu      $16, $4, $0
/* 11FA4 00111EA4 1000BFFF */  sd         $31, 0x10($sp)
/* 11FA8 00111EA8 FC09040C */  jal        malloc
/* 11FAC 00111EAC 18000424 */   addiu     $4, $0, 0x18
/* 11FB0 00111EB0 2D200002 */  daddu      $4, $16, $0
/* 11FB4 00111EB4 1000BFDF */  ld         $31, 0x10($sp)
/* 11FB8 00111EB8 0000B0DF */  ld         $16, 0x0($sp)
/* 11FBC 00111EBC 2D284000 */  daddu      $5, $2, $0
/* 11FC0 00111EC0 9C470408 */  j          __register_frame_info_table
/* 11FC4 00111EC4 2000BD27 */   addiu     $sp, $sp, 0x20
