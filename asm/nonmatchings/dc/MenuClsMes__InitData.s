.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitData__10MenuClsMesFv
/* 10B6A0 0020B5A0 6E010324 */  addiu      $3, $0, 0x16E
/* 10B6A4 0020B5A4 080083AC */  sw         $3, 0x8($4)
/* 10B6A8 0020B5A8 A6000324 */  addiu      $3, $0, 0xA6
/* 10B6AC 0020B5AC 0C0083AC */  sw         $3, 0xC($4)
/* 10B6B0 0020B5B0 000080A0 */  sb         $0, 0x0($4)
/* 10B6B4 0020B5B4 100080AC */  sw         $0, 0x10($4)
/* 10B6B8 0020B5B8 040080A4 */  sh         $0, 0x4($4)
/* 10B6BC 0020B5BC 060080A4 */  sh         $0, 0x6($4)
/* 10B6C0 0020B5C0 0800E003 */  jr         $31
/* 10B6C4 0020B5C4 00000000 */   nop
/* 10B6C8 0020B5C8 00000000 */  nop
/* 10B6CC 0020B5CC 00000000 */  nop
