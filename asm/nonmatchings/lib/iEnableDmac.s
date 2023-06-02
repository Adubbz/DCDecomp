.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iEnableDmac
/* 15158 00115058 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1515C 0011505C 0000BFFF */  sd         $31, 0x0($sp)
/* 15160 00115060 3850040C */  jal        _iEnableDmac
/* 15164 00115064 00000000 */   nop
/* 15168 00115068 0F000000 */  sync
/* 1516C 0011506C 0000BFDF */  ld         $31, 0x0($sp)
/* 15170 00115070 0800E003 */  jr         $31
/* 15174 00115074 1000BD27 */   addiu     $sp, $sp, 0x10
