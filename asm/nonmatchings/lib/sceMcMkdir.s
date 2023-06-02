.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceMcMkdir
/* 1E400 0011E300 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1E404 0011E304 0000BFFF */  sd         $31, 0x0($sp)
/* 1E408 0011E308 8678040C */  jal        sceMcOpen
/* 1E40C 0011E30C 40000724 */   addiu     $7, $0, 0x40
/* 1E410 0011E310 2D204000 */  daddu      $4, $2, $0
/* 1E414 0011E314 04008014 */  bnez       $4, .L0011E328
/* 1E418 0011E318 0000BFDF */   ld        $31, 0x0($sp)
/* 1E41C 0011E31C 2500033C */  lui        $3, (0x250A38 >> 16)
/* 1E420 0011E320 0B000224 */  addiu      $2, $0, 0xB
/* 1E424 0011E324 380A62AC */  sw         $2, (0x250A38 & 0xFFFF)($3)
.L0011E328:
/* 1E428 0011E328 2D108000 */  daddu      $2, $4, $0
/* 1E42C 0011E32C 0800E003 */  jr         $31
/* 1E430 0011E330 1000BD27 */   addiu     $sp, $sp, 0x10
/* 1E434 0011E334 00000000 */  nop
