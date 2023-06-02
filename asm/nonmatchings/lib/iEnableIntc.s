.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iEnableIntc
/* 15118 00115018 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1511C 0011501C 0000BFFF */  sd         $31, 0x0($sp)
/* 15120 00115020 3050040C */  jal        _iEnableIntc
/* 15124 00115024 00000000 */   nop
/* 15128 00115028 0F000000 */  sync
/* 1512C 0011502C 0000BFDF */  ld         $31, 0x0($sp)
/* 15130 00115030 0800E003 */  jr         $31
/* 15134 00115034 1000BD27 */   addiu     $sp, $sp, 0x10
