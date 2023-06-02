.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iReleaseAlarm
/* 151B8 001150B8 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 151BC 001150BC 0000BFFF */  sd         $31, 0x0($sp)
/* 151C0 001150C0 4450040C */  jal        _iReleaseAlarm
/* 151C4 001150C4 00000000 */   nop
/* 151C8 001150C8 0F000000 */  sync
/* 151CC 001150CC 0000BFDF */  ld         $31, 0x0($sp)
/* 151D0 001150D0 0800E003 */  jr         $31
/* 151D4 001150D4 1000BD27 */   addiu     $sp, $sp, 0x10
