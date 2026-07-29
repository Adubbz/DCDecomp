.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __register_frame_info
/* 011F18 00111E18 2A00023C */  lui         $2, %hi(objects)
/* 011F1C 00111E1C 904F438C */  lw          $3, %lo(objects)($2)
/* 011F20 00111E20 0800A4AC */  sw          $4, 0x8($5)
/* 011F24 00111E24 1400A3AC */  sw          $3, 0x14($5)
/* 011F28 00111E28 904F45AC */  sw          $5, %lo(objects)($2)
/* 011F2C 00111E2C 0400A0AC */  sw          $0, 0x4($5)
/* 011F30 00111E30 0000A0AC */  sw          $0, 0x0($5)
/* 011F34 00111E34 0C00A0AC */  sw          $0, 0xC($5)
/* 011F38 00111E38 0800E003 */  jr          $31
/* 011F3C 00111E3C 1000A0AC */   sw         $0, 0x10($5)
