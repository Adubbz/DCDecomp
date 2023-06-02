.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel SyncDCache
/* 14CD8 00114BD8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 14CDC 00114BDC 2D308000 */  daddu      $6, $4, $0
/* 14CE0 00114BE0 1000BFFF */  sd         $31, 0x10($sp)
/* 14CE4 00114BE4 0000B0FF */  sd         $16, 0x0($sp)
/* 14CE8 00114BE8 00601040 */  mfc0       $16, $12 # handwritten instruction
/* 14CEC 00114BEC 0100023C */  lui        $2, (0x10000 >> 16)
/* 14CF0 00114BF0 24800202 */  and        $16, $16, $2
/* 14CF4 00114BF4 09000012 */  beqz       $16, .L00114C1C
/* 14CF8 00114BF8 0100033C */   lui       $3, (0x10000 >> 16)
/* 14CFC 00114BFC 00000000 */  nop
.L00114C00:
/* 14D00 00114C00 39000042 */  di # handwritten instruction
/* 14D04 00114C04 0F040000 */  sync.p
/* 14D08 00114C08 00600240 */  mfc0       $2, $12 # handwritten instruction
/* 14D0C 00114C0C 24104300 */  and        $2, $2, $3
/* 14D10 00114C10 00000000 */  nop
/* 14D14 00114C14 FAFF4014 */  bnez       $2, .L00114C00
/* 14D18 00114C18 00000000 */   nop
.L00114C1C:
/* 14D1C 00114C1C FFFF043C */  lui        $4, (0xFFFFFFC0 >> 16)
/* 14D20 00114C20 C0FF8434 */  ori        $4, $4, (0xFFFFFFC0 & 0xFFFF)
/* 14D24 00114C24 2428A400 */  and        $5, $5, $4
/* 14D28 00114C28 CC52040C */  jal        _sceSDC
/* 14D2C 00114C2C 2420C400 */   and       $4, $6, $4
/* 14D30 00114C30 03000012 */  beqz       $16, .L00114C40
/* 14D34 00114C34 1000BFDF */   ld        $31, 0x10($sp)
/* 14D38 00114C38 38000042 */  ei # handwritten instruction
/* 14D3C 00114C3C 1000BFDF */  ld         $31, 0x10($sp)
.L00114C40:
/* 14D40 00114C40 0000B0DF */  ld         $16, 0x0($sp)
/* 14D44 00114C44 0800E003 */  jr         $31
/* 14D48 00114C48 2000BD27 */   addiu     $sp, $sp, 0x20
/* 14D4C 00114C4C 00000000 */  nop
