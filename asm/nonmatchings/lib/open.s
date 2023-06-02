.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel open
/* 14A38 00114938 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 14A3C 0011493C 0000BFFF */  sd         $31, 0x0($sp)
/* 14A40 00114940 D805040C */  jal        __errno
/* 14A44 00114944 00000000 */   nop
/* 14A48 00114948 05000324 */  addiu      $3, $0, 0x5
/* 14A4C 0011494C 0000BFDF */  ld         $31, 0x0($sp)
/* 14A50 00114950 000043AC */  sw         $3, 0x0($2)
/* 14A54 00114954 FFFF0224 */  addiu      $2, $0, -0x1
/* 14A58 00114958 0800E003 */  jr         $31
/* 14A5C 0011495C 1000BD27 */   addiu     $sp, $sp, 0x10
