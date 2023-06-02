.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __register_frame_info_table
/* 11F70 00111E70 2A00033C */  lui        $3, (0x2A4F90 >> 16)
/* 11F74 00111E74 904F628C */  lw         $2, (0x2A4F90 & 0xFFFF)($3)
/* 11F78 00111E78 0C00A4AC */  sw         $4, 0xC($5)
/* 11F7C 00111E7C 1400A2AC */  sw         $2, 0x14($5)
/* 11F80 00111E80 904F65AC */  sw         $5, (0x2A4F90 & 0xFFFF)($3)
/* 11F84 00111E84 0800A4AC */  sw         $4, 0x8($5)
/* 11F88 00111E88 0400A0AC */  sw         $0, 0x4($5)
/* 11F8C 00111E8C 0000A0AC */  sw         $0, 0x0($5)
/* 11F90 00111E90 0800E003 */  jr         $31
/* 11F94 00111E94 1000A0AC */   sw        $0, 0x10($5)
