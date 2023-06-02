.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ezTransToIOP__FPvPvi
/* 47BE0 00147AE0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 47BE4 00147AE4 1000BF7F */  sq         $31, 0x10($sp)
/* 47BE8 00147AE8 0000B07F */  sq         $16, 0x0($sp)
/* 47BEC 00147AEC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 47BF0 00147AF0 F0CE25AC */  sw         $5, -0x3110($at)
/* 47BF4 00147AF4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 47BF8 00147AF8 F4CE24AC */  sw         $4, -0x310C($at)
/* 47BFC 00147AFC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 47C00 00147B00 F8CE26AC */  sw         $6, -0x3108($at)
/* 47C04 00147B04 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 47C08 00147B08 FCCE20AC */  sw         $0, -0x3104($at)
/* 47C0C 00147B0C 28260070 */  paddub     $4, $0, $0
/* 47C10 00147B10 6851040C */  jal        FlushCache
/* 47C14 00147B14 00000000 */   nop
/* 47C18 00147B18 CF01023C */  lui        $2, %hi(transData)
/* 47C1C 00147B1C F0CE4424 */  addiu      $4, $2, %lo(transData)
/* 47C20 00147B20 01000524 */  addiu      $5, $0, 0x1
/* 47C24 00147B24 B851040C */  jal        sceSifSetDma
/* 47C28 00147B28 00000000 */   nop
/* 47C2C 00147B2C 28864070 */  paddub     $16, $2, $0
/* 47C30 00147B30 04000016 */  bnez       $16, .L00147B44
/* 47C34 00147B34 00000000 */   nop
/* 47C38 00147B38 FFFF0224 */  addiu      $2, $0, -0x1
/* 47C3C 00147B3C 07000010 */  b          .L00147B5C
/* 47C40 00147B40 00000000 */   nop
.L00147B44:
/* 47C44 00147B44 28260072 */  paddub     $4, $16, $0
/* 47C48 00147B48 B051040C */  jal        sceSifDmaStat
/* 47C4C 00147B4C 00000000 */   nop
/* 47C50 00147B50 FCFF4104 */  bgez       $2, .L00147B44
/* 47C54 00147B54 00000000 */   nop
/* 47C58 00147B58 28160070 */  paddub     $2, $0, $0
.L00147B5C:
/* 47C5C 00147B5C 1000BF7B */  lq         $31, 0x10($sp)
/* 47C60 00147B60 0000B07B */  lq         $16, 0x0($sp)
/* 47C64 00147B64 2000BD27 */  addiu      $sp, $sp, 0x20
/* 47C68 00147B68 0800E003 */  jr         $31
/* 47C6C 00147B6C 00000000 */   nop
