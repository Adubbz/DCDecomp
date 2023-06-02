.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel DisableIntc
/* 14EA0 00114DA0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 14EA4 00114DA4 1000BFFF */  sd         $31, 0x10($sp)
/* 14EA8 00114DA8 0000B0FF */  sd         $16, 0x0($sp)
/* 14EAC 00114DAC 00601040 */  mfc0       $16, $12 # handwritten instruction
/* 14EB0 00114DB0 0100023C */  lui        $2, (0x10000 >> 16)
/* 14EB4 00114DB4 24800202 */  and        $16, $16, $2
/* 14EB8 00114DB8 08000012 */  beqz       $16, .L00114DDC
/* 14EBC 00114DBC 0100033C */   lui       $3, (0x10000 >> 16)
.L00114DC0:
/* 14EC0 00114DC0 39000042 */  di # handwritten instruction
/* 14EC4 00114DC4 0F040000 */  sync.p
/* 14EC8 00114DC8 00600240 */  mfc0       $2, $12 # handwritten instruction
/* 14ECC 00114DCC 24104300 */  and        $2, $2, $3
/* 14ED0 00114DD0 00000000 */  nop
/* 14ED4 00114DD4 FAFF4014 */  bnez       $2, .L00114DC0
/* 14ED8 00114DD8 00000000 */   nop
.L00114DDC:
/* 14EDC 00114DDC 1C50040C */  jal        _DisableIntc
/* 14EE0 00114DE0 00000000 */   nop
/* 14EE4 00114DE4 0F000000 */  sync
/* 14EE8 00114DE8 03000012 */  beqz       $16, .L00114DF8
/* 14EEC 00114DEC 1000BFDF */   ld        $31, 0x10($sp)
/* 14EF0 00114DF0 38000042 */  ei # handwritten instruction
/* 14EF4 00114DF4 1000BFDF */  ld         $31, 0x10($sp)
.L00114DF8:
/* 14EF8 00114DF8 0000B0DF */  ld         $16, 0x0($sp)
/* 14EFC 00114DFC 0800E003 */  jr         $31
/* 14F00 00114E00 2000BD27 */   addiu     $sp, $sp, 0x20
/* 14F04 00114E04 00000000 */  nop
