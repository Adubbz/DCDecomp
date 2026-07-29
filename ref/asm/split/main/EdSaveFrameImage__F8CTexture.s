.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdSaveFrameImage__F8CTexture
/* 073F00 00173E00 B0FFBD27 */  addiu       $29, $29, -0x50
/* 073F04 00173E04 0000A727 */  addiu       $7, $29, 0x0
/* 073F08 00173E08 05000624 */  addiu       $6, $0, 0x5
.L00173E0C:
/* 073F0C 00173E0C 000085DC */  ld          $5, 0x0($4)
/* 073F10 00173E10 080083DC */  ld          $3, 0x8($4)
/* 073F14 00173E14 10008424 */  addiu       $4, $4, 0x10
/* 073F18 00173E18 FFFFC624 */  addiu       $6, $6, -0x1
/* 073F1C 00173E1C 0000E5FC */  sd          $5, 0x0($7)
/* 073F20 00173E20 0800E3FC */  sd          $3, 0x8($7)
/* 073F24 00173E24 1000E724 */  addiu       $7, $7, 0x10
/* 073F28 00173E28 F8FFC01C */  bgtz        $6, .L00173E0C
/* 073F2C 00173E2C 00000000 */   nop
/* 073F30 00173E30 01000324 */  addiu       $3, $0, 0x1
/* 073F34 00173E34 BC8F83AF */  sw          $3, -0x7044($28)
/* 073F38 00173E38 0000A627 */  addiu       $6, $29, 0x0
/* 073F3C 00173E3C D201033C */  lui         $3, %hi(frame_image_tex)
/* 073F40 00173E40 A09A6524 */  addiu       $5, $3, %lo(frame_image_tex)
/* 073F44 00173E44 05000424 */  addiu       $4, $0, 0x5
.L00173E48:
/* 073F48 00173E48 0000C378 */  lq          $3, 0x0($6)
/* 073F4C 00173E4C 1000C624 */  addiu       $6, $6, 0x10
/* 073F50 00173E50 FFFF8424 */  addiu       $4, $4, -0x1
/* 073F54 00173E54 0000A37C */  sq          $3, 0x0($5)
/* 073F58 00173E58 1000A524 */  addiu       $5, $5, 0x10
/* 073F5C 00173E5C FAFF801C */  bgtz        $4, .L00173E48
/* 073F60 00173E60 00000000 */   nop
/* 073F64 00173E64 5000BD27 */  addiu       $29, $29, 0x50
/* 073F68 00173E68 0800E003 */  jr          $31
/* 073F6C 00173E6C 00000000 */   nop
