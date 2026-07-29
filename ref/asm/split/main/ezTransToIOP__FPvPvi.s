.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ezTransToIOP__FPvPvi
/* 047BE0 00147AE0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 047BE4 00147AE4 1000BF7F */  sq          $31, 0x10($29)
/* 047BE8 00147AE8 0000B07F */  sq          $16, 0x0($29)
/* 047BEC 00147AEC CF01013C */  lui         $1, %hi(transData)
/* 047BF0 00147AF0 F0CE25AC */  sw          $5, %lo(transData)($1)
/* 047BF4 00147AF4 CF01013C */  lui         $1, %hi(transData + 0x4)
/* 047BF8 00147AF8 F4CE24AC */  sw          $4, %lo(transData + 0x4)($1)
/* 047BFC 00147AFC CF01013C */  lui         $1, %hi(transData + 0x8)
/* 047C00 00147B00 F8CE26AC */  sw          $6, %lo(transData + 0x8)($1)
/* 047C04 00147B04 CF01013C */  lui         $1, %hi(transData + 0xC)
/* 047C08 00147B08 FCCE20AC */  sw          $0, %lo(transData + 0xC)($1)
/* 047C0C 00147B0C 28260070 */  paddub      $4, $0, $0
/* 047C10 00147B10 6851040C */  jal         FlushCache
/* 047C14 00147B14 00000000 */   nop
/* 047C18 00147B18 CF01023C */  lui         $2, %hi(transData)
/* 047C1C 00147B1C F0CE4424 */  addiu       $4, $2, %lo(transData)
/* 047C20 00147B20 01000524 */  addiu       $5, $0, 0x1
/* 047C24 00147B24 B851040C */  jal         sceSifSetDma
/* 047C28 00147B28 00000000 */   nop
/* 047C2C 00147B2C 28864070 */  paddub      $16, $2, $0
/* 047C30 00147B30 04000016 */  bnez        $16, .L00147B44
/* 047C34 00147B34 00000000 */   nop
/* 047C38 00147B38 FFFF0224 */  addiu       $2, $0, -0x1
/* 047C3C 00147B3C 07000010 */  b           .L00147B5C
/* 047C40 00147B40 00000000 */   nop
.L00147B44:
/* 047C44 00147B44 28260072 */  paddub      $4, $16, $0
/* 047C48 00147B48 B051040C */  jal         sceSifDmaStat
/* 047C4C 00147B4C 00000000 */   nop
/* 047C50 00147B50 FCFF4104 */  bgez        $2, .L00147B44
/* 047C54 00147B54 00000000 */   nop
/* 047C58 00147B58 28160070 */  paddub      $2, $0, $0
.L00147B5C:
/* 047C5C 00147B5C 1000BF7B */  lq          $31, 0x10($29)
/* 047C60 00147B60 0000B07B */  lq          $16, 0x0($29)
/* 047C64 00147B64 2000BD27 */  addiu       $29, $29, 0x20
/* 047C68 00147B68 0800E003 */  jr          $31
/* 047C6C 00147B6C 00000000 */   nop
