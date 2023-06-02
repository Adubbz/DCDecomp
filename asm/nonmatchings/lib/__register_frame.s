.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __register_frame
/* 11F40 00111E40 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 11F44 00111E44 0000B0FF */  sd         $16, 0x0($sp)
/* 11F48 00111E48 2D808000 */  daddu      $16, $4, $0
/* 11F4C 00111E4C 1000BFFF */  sd         $31, 0x10($sp)
/* 11F50 00111E50 FC09040C */  jal        malloc
/* 11F54 00111E54 18000424 */   addiu     $4, $0, 0x18
/* 11F58 00111E58 2D200002 */  daddu      $4, $16, $0
/* 11F5C 00111E5C 1000BFDF */  ld         $31, 0x10($sp)
/* 11F60 00111E60 0000B0DF */  ld         $16, 0x0($sp)
/* 11F64 00111E64 2D284000 */  daddu      $5, $2, $0
/* 11F68 00111E68 86470408 */  j          __register_frame_info
/* 11F6C 00111E6C 2000BD27 */   addiu     $sp, $sp, 0x20
