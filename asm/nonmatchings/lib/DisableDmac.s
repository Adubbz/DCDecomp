.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel DisableDmac
/* 14F70 00114E70 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 14F74 00114E74 1000BFFF */  sd         $31, 0x10($sp)
/* 14F78 00114E78 0000B0FF */  sd         $16, 0x0($sp)
/* 14F7C 00114E7C 00601040 */  mfc0       $16, $12 # handwritten instruction
/* 14F80 00114E80 0100023C */  lui        $2, (0x10000 >> 16)
/* 14F84 00114E84 24800202 */  and        $16, $16, $2
/* 14F88 00114E88 08000012 */  beqz       $16, .L00114EAC
/* 14F8C 00114E8C 0100033C */   lui       $3, (0x10000 >> 16)
.L00114E90:
/* 14F90 00114E90 39000042 */  di # handwritten instruction
/* 14F94 00114E94 0F040000 */  sync.p
/* 14F98 00114E98 00600240 */  mfc0       $2, $12 # handwritten instruction
/* 14F9C 00114E9C 24104300 */  and        $2, $2, $3
/* 14FA0 00114EA0 00000000 */  nop
/* 14FA4 00114EA4 FAFF4014 */  bnez       $2, .L00114E90
/* 14FA8 00114EA8 00000000 */   nop
.L00114EAC:
/* 14FAC 00114EAC 2450040C */  jal        _DisableDmac
/* 14FB0 00114EB0 00000000 */   nop
/* 14FB4 00114EB4 0F000000 */  sync
/* 14FB8 00114EB8 03000012 */  beqz       $16, .L00114EC8
/* 14FBC 00114EBC 1000BFDF */   ld        $31, 0x10($sp)
/* 14FC0 00114EC0 38000042 */  ei # handwritten instruction
/* 14FC4 00114EC4 1000BFDF */  ld         $31, 0x10($sp)
.L00114EC8:
/* 14FC8 00114EC8 0000B0DF */  ld         $16, 0x0($sp)
/* 14FCC 00114ECC 0800E003 */  jr         $31
/* 14FD0 00114ED0 2000BD27 */   addiu     $sp, $sp, 0x20
/* 14FD4 00114ED4 00000000 */  nop
