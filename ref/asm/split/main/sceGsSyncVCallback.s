.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceGsSyncVCallback
/* 013EE8 00113DE8 C0FFBD27 */  addiu       $29, $29, -0x40
/* 013EEC 00113DEC 0000B0FF */  sd          $16, 0x0($29)
/* 013EF0 00113DF0 2000B2FF */  sd          $18, 0x20($29)
/* 013EF4 00113DF4 1000B1FF */  sd          $17, 0x10($29)
/* 013EF8 00113DF8 3000BFFF */  sd          $31, 0x30($29)
/* 013EFC 00113DFC F048040C */  jal         sceGsGetGParam
/* 013F00 00113E00 2D808000 */   daddu      $16, $4, $0
/* 013F04 00113E04 2D884000 */  daddu       $17, $2, $0
/* 013F08 00113E08 2D280002 */  daddu       $5, $16, $0
/* 013F0C 00113E0C 0800328E */  lw          $18, 0x8($17)
/* 013F10 00113E10 FFFF0624 */  addiu       $6, $0, -0x1
/* 013F14 00113E14 080030AE */  sw          $16, 0x8($17)
/* 013F18 00113E18 0050040C */  jal         AddIntcHandler
/* 013F1C 00113E1C 02000424 */   addiu      $4, $0, 0x2
/* 013F20 00113E20 0C0022AE */  sw          $2, 0xC($17)
/* 013F24 00113E24 8253040C */  jal         EnableIntc
/* 013F28 00113E28 02000424 */   addiu      $4, $0, 0x2
/* 013F2C 00113E2C 2D104002 */  daddu       $2, $18, $0
/* 013F30 00113E30 3000BFDF */  ld          $31, 0x30($29)
/* 013F34 00113E34 2000B2DF */  ld          $18, 0x20($29)
/* 013F38 00113E38 1000B1DF */  ld          $17, 0x10($29)
/* 013F3C 00113E3C 0000B0DF */  ld          $16, 0x0($29)
/* 013F40 00113E40 0800E003 */  jr          $31
/* 013F44 00113E44 4000BD27 */   addiu      $29, $29, 0x40
