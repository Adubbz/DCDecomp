.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __register_frame_info_table
/* 011F70 00111E70 2A00033C */  lui         $3, %hi(objects)
/* 011F74 00111E74 904F628C */  lw          $2, %lo(objects)($3)
/* 011F78 00111E78 0C00A4AC */  sw          $4, 0xC($5)
/* 011F7C 00111E7C 1400A2AC */  sw          $2, 0x14($5)
/* 011F80 00111E80 904F65AC */  sw          $5, %lo(objects)($3)
/* 011F84 00111E84 0800A4AC */  sw          $4, 0x8($5)
/* 011F88 00111E88 0400A0AC */  sw          $0, 0x4($5)
/* 011F8C 00111E8C 0000A0AC */  sw          $0, 0x0($5)
/* 011F90 00111E90 0800E003 */  jr          $31
/* 011F94 00111E94 1000A0AC */   sw         $0, 0x10($5)
