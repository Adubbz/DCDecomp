.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel InvalidDCache
/* 14E10 00114D10 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 14E14 00114D14 2D308000 */  daddu      $6, $4, $0
/* 14E18 00114D18 1000BFFF */  sd         $31, 0x10($sp)
/* 14E1C 00114D1C 0000B0FF */  sd         $16, 0x0($sp)
/* 14E20 00114D20 00601040 */  mfc0       $16, $12 # handwritten instruction
/* 14E24 00114D24 0100023C */  lui        $2, (0x10000 >> 16)
/* 14E28 00114D28 24800202 */  and        $16, $16, $2
/* 14E2C 00114D2C 09000012 */  beqz       $16, .L00114D54
/* 14E30 00114D30 0100033C */   lui       $3, (0x10000 >> 16)
/* 14E34 00114D34 00000000 */  nop
.L00114D38:
/* 14E38 00114D38 39000042 */  di # handwritten instruction
/* 14E3C 00114D3C 0F040000 */  sync.p
/* 14E40 00114D40 00600240 */  mfc0       $2, $12 # handwritten instruction
/* 14E44 00114D44 24104300 */  and        $2, $2, $3
/* 14E48 00114D48 00000000 */  nop
/* 14E4C 00114D4C FAFF4014 */  bnez       $2, .L00114D38
/* 14E50 00114D50 00000000 */   nop
.L00114D54:
/* 14E54 00114D54 FFFF043C */  lui        $4, (0xFFFFFFC0 >> 16)
/* 14E58 00114D58 C0FF8434 */  ori        $4, $4, (0xFFFFFFC0 & 0xFFFF)
/* 14E5C 00114D5C 2428A400 */  and        $5, $5, $4
/* 14E60 00114D60 1A53040C */  jal        _sceIDC
/* 14E64 00114D64 2420C400 */   and       $4, $6, $4
/* 14E68 00114D68 03000012 */  beqz       $16, .L00114D78
/* 14E6C 00114D6C 1000BFDF */   ld        $31, 0x10($sp)
/* 14E70 00114D70 38000042 */  ei # handwritten instruction
/* 14E74 00114D74 1000BFDF */  ld         $31, 0x10($sp)
.L00114D78:
/* 14E78 00114D78 0000B0DF */  ld         $16, 0x0($sp)
/* 14E7C 00114D7C 0800E003 */  jr         $31
/* 14E80 00114D80 2000BD27 */   addiu     $sp, $sp, 0x20
/* 14E84 00114D84 00000000 */  nop
