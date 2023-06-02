.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __register_frame_info
/* 11F18 00111E18 2A00023C */  lui        $2, (0x2A4F90 >> 16)
/* 11F1C 00111E1C 904F438C */  lw         $3, (0x2A4F90 & 0xFFFF)($2)
/* 11F20 00111E20 0800A4AC */  sw         $4, 0x8($5)
/* 11F24 00111E24 1400A3AC */  sw         $3, 0x14($5)
/* 11F28 00111E28 904F45AC */  sw         $5, (0x2A4F90 & 0xFFFF)($2)
/* 11F2C 00111E2C 0400A0AC */  sw         $0, 0x4($5)
/* 11F30 00111E30 0000A0AC */  sw         $0, 0x0($5)
/* 11F34 00111E34 0C00A0AC */  sw         $0, 0xC($5)
/* 11F38 00111E38 0800E003 */  jr         $31
/* 11F3C 00111E3C 1000A0AC */   sw        $0, 0x10($5)
