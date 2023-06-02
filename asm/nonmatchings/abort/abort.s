.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel abort
/* 2A8 001001A8 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2AC 001001AC 0000BFFF */  sd         $31, 0x0($sp)
.L001001B0:
/* 2B0 001001B0 B213040C */  jal        raise
/* 2B4 001001B4 06000424 */   addiu     $4, $0, 0x6
/* 2B8 001001B8 2C00040C */  jal        func_001000B0
/* 2BC 001001BC 01000424 */   addiu     $4, $0, 0x1
/* 2C0 001001C0 FBFF0010 */  b          .L001001B0
/* 2C4 001001C4 00000000 */   nop
