.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifLoadFileReset
/* 18D50 00118C50 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 18D54 00118C54 2500023C */  lui        $2, (0x250A20 >> 16)
/* 18D58 00118C58 FFFF0324 */  addiu      $3, $0, -0x1
/* 18D5C 00118C5C 2B00043C */  lui        $4, %hi(D_002A85A8)
/* 18D60 00118C60 0000BFFF */  sd         $31, 0x0($sp)
/* 18D64 00118C64 A8858424 */  addiu      $4, $4, %lo(D_002A85A8)
/* 18D68 00118C68 200A43AC */  sw         $3, (0x250A20 & 0xFFFF)($2)
/* 18D6C 00118C6C 2D280000 */  daddu      $5, $0, $0
/* 18D70 00118C70 5A0D040C */  jal        memset
/* 18D74 00118C74 04000624 */   addiu     $6, $0, 0x4
/* 18D78 00118C78 0000BFDF */  ld         $31, 0x0($sp)
/* 18D7C 00118C7C 2D100000 */  daddu      $2, $0, $0
/* 18D80 00118C80 0800E003 */  jr         $31
/* 18D84 00118C84 1000BD27 */   addiu     $sp, $sp, 0x10
