.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iSetAlarm
/* 15198 00115098 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 1519C 0011509C 0000BFFF */  sd         $31, 0x0($sp)
/* 151A0 001150A0 4050040C */  jal        _iSetAlarm
/* 151A4 001150A4 FFFF8430 */   andi      $4, $4, 0xFFFF
/* 151A8 001150A8 0F000000 */  sync
/* 151AC 001150AC 0000BFDF */  ld         $31, 0x0($sp)
/* 151B0 001150B0 0800E003 */  jr         $31
/* 151B4 001150B4 1000BD27 */   addiu     $sp, $sp, 0x10
