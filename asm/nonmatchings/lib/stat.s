.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel stat
/* 14B70 00114A70 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 14B74 00114A74 0000BFFF */  sd         $31, 0x0($sp)
/* 14B78 00114A78 D805040C */  jal        __errno
/* 14B7C 00114A7C 00000000 */   nop
/* 14B80 00114A80 05000324 */  addiu      $3, $0, 0x5
/* 14B84 00114A84 0000BFDF */  ld         $31, 0x0($sp)
/* 14B88 00114A88 000043AC */  sw         $3, 0x0($2)
/* 14B8C 00114A8C FFFF0224 */  addiu      $2, $0, -0x1
/* 14B90 00114A90 0800E003 */  jr         $31
/* 14B94 00114A94 1000BD27 */   addiu     $sp, $sp, 0x10
