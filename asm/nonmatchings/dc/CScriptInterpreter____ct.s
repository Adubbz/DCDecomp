.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__18CScriptInterpreterFv
/* 5F3B0 0015F2B0 040080AC */  sw         $0, 0x4($4)
/* 5F3B4 0015F2B4 080080AC */  sw         $0, 0x8($4)
/* 5F3B8 0015F2B8 000080AC */  sw         $0, 0x0($4)
/* 5F3BC 0015F2BC 000080AC */  sw         $0, 0x0($4)
/* 5F3C0 0015F2C0 040080AC */  sw         $0, 0x4($4)
/* 5F3C4 0015F2C4 080080AC */  sw         $0, 0x8($4)
/* 5F3C8 0015F2C8 100080AC */  sw         $0, 0x10($4)
/* 5F3CC 0015F2CC FFFF0224 */  addiu      $2, $0, -0x1
/* 5F3D0 0015F2D0 0C0082AC */  sw         $2, 0xC($4)
/* 5F3D4 0015F2D4 180480AC */  sw         $0, 0x418($4)
/* 5F3D8 0015F2D8 1C0480AC */  sw         $0, 0x41C($4)
/* 5F3DC 0015F2DC 28168070 */  paddub     $2, $4, $0
/* 5F3E0 0015F2E0 0800E003 */  jr         $31
/* 5F3E4 0015F2E4 00000000 */   nop
/* 5F3E8 0015F2E8 00000000 */  nop
/* 5F3EC 0015F2EC 00000000 */  nop
