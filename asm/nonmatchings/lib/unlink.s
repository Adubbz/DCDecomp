.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel unlink
/* 14B98 00114A98 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 14B9C 00114A9C 0000BFFF */  sd         $31, 0x0($sp)
/* 14BA0 00114AA0 D805040C */  jal        __errno
/* 14BA4 00114AA4 00000000 */   nop
/* 14BA8 00114AA8 05000324 */  addiu      $3, $0, 0x5
/* 14BAC 00114AAC 0000BFDF */  ld         $31, 0x0($sp)
/* 14BB0 00114AB0 000043AC */  sw         $3, 0x0($2)
/* 14BB4 00114AB4 FFFF0224 */  addiu      $2, $0, -0x1
/* 14BB8 00114AB8 0800E003 */  jr         $31
/* 14BBC 00114ABC 1000BD27 */   addiu     $sp, $sp, 0x10
