.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifLoadModule
/* 19178 00119078 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1917C 0011907C 0000BFFF */  sd         $31, 0x0($sp)
/* 19180 00119080 9E63040C */  jal        _sceSifLoadModule
/* 19184 00119084 2D380000 */   daddu     $7, $0, $0
/* 19188 00119088 0000BFDF */  ld         $31, 0x0($sp)
/* 1918C 0011908C 0800E003 */  jr         $31
/* 19190 00119090 1000BD27 */   addiu     $sp, $sp, 0x10
/* 19194 00119094 00000000 */  nop
