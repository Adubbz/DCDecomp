.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel fptodp
/* 11340 00111240 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 11344 00111244 2000BFFF */  sd         $31, 0x20($sp)
/* 11348 00111248 1000A427 */  addiu      $4, $sp, 0x10
/* 1134C 0011124C 1000ACE7 */  swc1       $f12, 0x10($sp)
/* 11350 00111250 EC41040C */  jal        __unpack_f
/* 11354 00111254 2D28A003 */   daddu     $5, $sp, $0
/* 11358 00111258 0C00A78F */  lw         $7, 0xC($sp)
/* 1135C 0011125C 0000A48F */  lw         $4, 0x0($sp)
/* 11360 00111260 3C380700 */  dsll32     $7, $7, 0
/* 11364 00111264 0400A58F */  lw         $5, 0x4($sp)
/* 11368 00111268 0800A68F */  lw         $6, 0x8($sp)
/* 1136C 0011126C 8641040C */  jal        __make_dp
/* 11370 00111270 BA380700 */   dsrl      $7, $7, 2
/* 11374 00111274 2000BFDF */  ld         $31, 0x20($sp)
/* 11378 00111278 0800E003 */  jr         $31
/* 1137C 0011127C 3000BD27 */   addiu     $sp, $sp, 0x30
