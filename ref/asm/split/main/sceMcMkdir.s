.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceMcMkdir
/* 01E400 0011E300 F0FFBD27 */  addiu       $29, $29, -0x10
/* 01E404 0011E304 0000BFFF */  sd          $31, 0x0($29)
/* 01E408 0011E308 8678040C */  jal         sceMcOpen
/* 01E40C 0011E30C 40000724 */   addiu      $7, $0, 0x40
/* 01E410 0011E310 2D204000 */  daddu       $4, $2, $0
/* 01E414 0011E314 04008014 */  bnez        $4, .L0011E328
/* 01E418 0011E318 0000BFDF */   ld         $31, 0x0($29)
/* 01E41C 0011E31C 2500033C */  lui         $3, %hi(mcRunCmdNo)
/* 01E420 0011E320 0B000224 */  addiu       $2, $0, 0xB
/* 01E424 0011E324 380A62AC */  sw          $2, %lo(mcRunCmdNo)($3)
.L0011E328:
/* 01E428 0011E328 2D108000 */  daddu       $2, $4, $0
/* 01E42C 0011E32C 0800E003 */  jr          $31
/* 01E430 0011E330 1000BD27 */   addiu      $29, $29, 0x10
/* 01E434 0011E334 00000000 */  nop
