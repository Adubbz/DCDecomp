.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iDisableIntc
/* 15138 00115038 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1513C 0011503C 0000BFFF */  sd         $31, 0x0($sp)
/* 15140 00115040 3450040C */  jal        _iDisableIntc
/* 15144 00115044 00000000 */   nop
/* 15148 00115048 0F000000 */  sync
/* 1514C 0011504C 0000BFDF */  ld         $31, 0x0($sp)
/* 15150 00115050 0800E003 */  jr         $31
/* 15154 00115054 1000BD27 */   addiu     $sp, $sp, 0x10
