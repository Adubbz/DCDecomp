.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel ReleaseAlarm
/* 150B0 00114FB0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 150B4 00114FB4 1000BFFF */  sd         $31, 0x10($sp)
/* 150B8 00114FB8 0000B0FF */  sd         $16, 0x0($sp)
/* 150BC 00114FBC 00601040 */  mfc0       $16, $12 # handwritten instruction
/* 150C0 00114FC0 0100023C */  lui        $2, (0x10000 >> 16)
/* 150C4 00114FC4 24800202 */  and        $16, $16, $2
/* 150C8 00114FC8 08000012 */  beqz       $16, .L00114FEC
/* 150CC 00114FCC 0100033C */   lui       $3, (0x10000 >> 16)
.L00114FD0:
/* 150D0 00114FD0 39000042 */  di # handwritten instruction
/* 150D4 00114FD4 0F040000 */  sync.p
/* 150D8 00114FD8 00600240 */  mfc0       $2, $12 # handwritten instruction
/* 150DC 00114FDC 24104300 */  and        $2, $2, $3
/* 150E0 00114FE0 00000000 */  nop
/* 150E4 00114FE4 FAFF4014 */  bnez       $2, .L00114FD0
/* 150E8 00114FE8 00000000 */   nop
.L00114FEC:
/* 150EC 00114FEC 2C50040C */  jal        _ReleaseAlarm
/* 150F0 00114FF0 00000000 */   nop
/* 150F4 00114FF4 0F000000 */  sync
/* 150F8 00114FF8 03000012 */  beqz       $16, .L00115008
/* 150FC 00114FFC 1000BFDF */   ld        $31, 0x10($sp)
/* 15100 00115000 38000042 */  ei # handwritten instruction
/* 15104 00115004 1000BFDF */  ld         $31, 0x10($sp)
.L00115008:
/* 15108 00115008 0000B0DF */  ld         $16, 0x0($sp)
/* 1510C 0011500C 0800E003 */  jr         $31
/* 15110 00115010 2000BD27 */   addiu     $sp, $sp, 0x20
/* 15114 00115014 00000000 */  nop
