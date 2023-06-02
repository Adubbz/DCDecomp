.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceGsSyncVCallback
/* 13EE8 00113DE8 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 13EEC 00113DEC 0000B0FF */  sd         $16, 0x0($sp)
/* 13EF0 00113DF0 2000B2FF */  sd         $18, 0x20($sp)
/* 13EF4 00113DF4 1000B1FF */  sd         $17, 0x10($sp)
/* 13EF8 00113DF8 3000BFFF */  sd         $31, 0x30($sp)
/* 13EFC 00113DFC F048040C */  jal        sceGsGetGParam
/* 13F00 00113E00 2D808000 */   daddu     $16, $4, $0
/* 13F04 00113E04 2D884000 */  daddu      $17, $2, $0
/* 13F08 00113E08 2D280002 */  daddu      $5, $16, $0
/* 13F0C 00113E0C 0800328E */  lw         $18, 0x8($17)
/* 13F10 00113E10 FFFF0624 */  addiu      $6, $0, -0x1
/* 13F14 00113E14 080030AE */  sw         $16, 0x8($17)
/* 13F18 00113E18 0050040C */  jal        AddIntcHandler
/* 13F1C 00113E1C 02000424 */   addiu     $4, $0, 0x2
/* 13F20 00113E20 0C0022AE */  sw         $2, 0xC($17)
/* 13F24 00113E24 8253040C */  jal        EnableIntc
/* 13F28 00113E28 02000424 */   addiu     $4, $0, 0x2
/* 13F2C 00113E2C 2D104002 */  daddu      $2, $18, $0
/* 13F30 00113E30 3000BFDF */  ld         $31, 0x30($sp)
/* 13F34 00113E34 2000B2DF */  ld         $18, 0x20($sp)
/* 13F38 00113E38 1000B1DF */  ld         $17, 0x10($sp)
/* 13F3C 00113E3C 0000B0DF */  ld         $16, 0x0($sp)
/* 13F40 00113E40 0800E003 */  jr         $31
/* 13F44 00113E44 4000BD27 */   addiu     $sp, $sp, 0x40
