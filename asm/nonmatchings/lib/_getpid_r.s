.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _getpid_r
/* 50D0 00104FD0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 50D4 00104FD4 0000BFFF */  sd         $31, 0x0($sp)
/* 50D8 00104FD8 9052040C */  jal        getpid
/* 50DC 00104FDC 00000000 */   nop
/* 50E0 00104FE0 0000BFDF */  ld         $31, 0x0($sp)
/* 50E4 00104FE4 0800E003 */  jr         $31
/* 50E8 00104FE8 1000BD27 */   addiu     $sp, $sp, 0x10
/* 50EC 00104FEC 00000000 */  nop
