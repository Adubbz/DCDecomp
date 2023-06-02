.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel EnableDmac
/* 14FD8 00114ED8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 14FDC 00114EDC 1000BFFF */  sd         $31, 0x10($sp)
/* 14FE0 00114EE0 0000B0FF */  sd         $16, 0x0($sp)
/* 14FE4 00114EE4 00601040 */  mfc0       $16, $12 # handwritten instruction
/* 14FE8 00114EE8 0100023C */  lui        $2, (0x10000 >> 16)
/* 14FEC 00114EEC 24800202 */  and        $16, $16, $2
/* 14FF0 00114EF0 08000012 */  beqz       $16, .L00114F14
/* 14FF4 00114EF4 0100033C */   lui       $3, (0x10000 >> 16)
.L00114EF8:
/* 14FF8 00114EF8 39000042 */  di # handwritten instruction
/* 14FFC 00114EFC 0F040000 */  sync.p
/* 15000 00114F00 00600240 */  mfc0       $2, $12 # handwritten instruction
/* 15004 00114F04 24104300 */  and        $2, $2, $3
/* 15008 00114F08 00000000 */  nop
/* 1500C 00114F0C FAFF4014 */  bnez       $2, .L00114EF8
/* 15010 00114F10 00000000 */   nop
.L00114F14:
/* 15014 00114F14 2050040C */  jal        _EnableDmac
/* 15018 00114F18 00000000 */   nop
/* 1501C 00114F1C 0F000000 */  sync
/* 15020 00114F20 03000012 */  beqz       $16, .L00114F30
/* 15024 00114F24 1000BFDF */   ld        $31, 0x10($sp)
/* 15028 00114F28 38000042 */  ei # handwritten instruction
/* 1502C 00114F2C 1000BFDF */  ld         $31, 0x10($sp)
.L00114F30:
/* 15030 00114F30 0000B0DF */  ld         $16, 0x0($sp)
/* 15034 00114F34 0800E003 */  jr         $31
/* 15038 00114F38 2000BD27 */   addiu     $sp, $sp, 0x20
/* 1503C 00114F3C 00000000 */  nop
