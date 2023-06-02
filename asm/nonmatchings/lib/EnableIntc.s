.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel EnableIntc
/* 14F08 00114E08 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 14F0C 00114E0C 1000BFFF */  sd         $31, 0x10($sp)
/* 14F10 00114E10 0000B0FF */  sd         $16, 0x0($sp)
/* 14F14 00114E14 00601040 */  mfc0       $16, $12 # handwritten instruction
/* 14F18 00114E18 0100023C */  lui        $2, (0x10000 >> 16)
/* 14F1C 00114E1C 24800202 */  and        $16, $16, $2
/* 14F20 00114E20 08000012 */  beqz       $16, .L00114E44
/* 14F24 00114E24 0100033C */   lui       $3, (0x10000 >> 16)
.L00114E28:
/* 14F28 00114E28 39000042 */  di # handwritten instruction
/* 14F2C 00114E2C 0F040000 */  sync.p
/* 14F30 00114E30 00600240 */  mfc0       $2, $12 # handwritten instruction
/* 14F34 00114E34 24104300 */  and        $2, $2, $3
/* 14F38 00114E38 00000000 */  nop
/* 14F3C 00114E3C FAFF4014 */  bnez       $2, .L00114E28
/* 14F40 00114E40 00000000 */   nop
.L00114E44:
/* 14F44 00114E44 1850040C */  jal        _EnableIntc
/* 14F48 00114E48 00000000 */   nop
/* 14F4C 00114E4C 0F000000 */  sync
/* 14F50 00114E50 03000012 */  beqz       $16, .L00114E60
/* 14F54 00114E54 1000BFDF */   ld        $31, 0x10($sp)
/* 14F58 00114E58 38000042 */  ei # handwritten instruction
/* 14F5C 00114E5C 1000BFDF */  ld         $31, 0x10($sp)
.L00114E60:
/* 14F60 00114E60 0000B0DF */  ld         $16, 0x0($sp)
/* 14F64 00114E64 0800E003 */  jr         $31
/* 14F68 00114E68 2000BD27 */   addiu     $sp, $sp, 0x20
/* 14F6C 00114E6C 00000000 */  nop
