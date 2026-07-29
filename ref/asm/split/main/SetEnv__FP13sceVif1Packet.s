.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetEnv__FP13sceVif1Packet
/* 040EA0 00140DA0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 040EA4 00140DA4 1000BF7F */  sq          $31, 0x10($29)
/* 040EA8 00140DA8 0000B07F */  sq          $16, 0x0($29)
/* 040EAC 00140DAC 28868070 */  paddub      $16, $4, $0
/* 040EB0 00140DB0 282E0070 */  paddub      $5, $0, $0
/* 040EB4 00140DB4 2083040C */  jal         sceVif1PkCnt
/* 040EB8 00140DB8 00000000 */   nop
/* 040EBC 00140DBC 28260072 */  paddub      $4, $16, $0
/* 040EC0 00140DC0 282E0070 */  paddub      $5, $0, $0
/* 040EC4 00140DC4 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 040EC8 00140DC8 00000000 */   nop
/* 040ECC 00140DCC C701023C */  lui         $2, %hi(GiftagAD)
/* 040ED0 00140DD0 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 040ED4 00140DD4 28260072 */  paddub      $4, $16, $0
/* 040ED8 00140DD8 00004578 */  lq          $5, 0x0($2)
/* 040EDC 00140DDC B083040C */  jal         sceVif1PkOpenGifTag
/* 040EE0 00140DE0 00000000 */   nop
/* 040EE4 00140DE4 E08B8227 */  addiu       $2, $28, -0x7420
/* 040EE8 00140DE8 28260072 */  paddub      $4, $16, $0
/* 040EEC 00140DEC 14000524 */  addiu       $5, $0, 0x14
/* 040EF0 00140DF0 000046DC */  ld          $6, 0x0($2)
/* 040EF4 00140DF4 0A84040C */  jal         sceVif1PkAddGsAD
/* 040EF8 00140DF8 00000000 */   nop
/* 040EFC 00140DFC E88B8227 */  addiu       $2, $28, -0x7418
/* 040F00 00140E00 28260072 */  paddub      $4, $16, $0
/* 040F04 00140E04 47000524 */  addiu       $5, $0, 0x47
/* 040F08 00140E08 000046DC */  ld          $6, 0x0($2)
/* 040F0C 00140E0C 0A84040C */  jal         sceVif1PkAddGsAD
/* 040F10 00140E10 00000000 */   nop
/* 040F14 00140E14 F08B8227 */  addiu       $2, $28, -0x7410
/* 040F18 00140E18 28260072 */  paddub      $4, $16, $0
/* 040F1C 00140E1C 4E000524 */  addiu       $5, $0, 0x4E
/* 040F20 00140E20 000046DC */  ld          $6, 0x0($2)
/* 040F24 00140E24 0A84040C */  jal         sceVif1PkAddGsAD
/* 040F28 00140E28 00000000 */   nop
/* 040F2C 00140E2C F88B8227 */  addiu       $2, $28, -0x7408
/* 040F30 00140E30 28260072 */  paddub      $4, $16, $0
/* 040F34 00140E34 42000524 */  addiu       $5, $0, 0x42
/* 040F38 00140E38 000046DC */  ld          $6, 0x0($2)
/* 040F3C 00140E3C 0A84040C */  jal         sceVif1PkAddGsAD
/* 040F40 00140E40 00000000 */   nop
/* 040F44 00140E44 28260072 */  paddub      $4, $16, $0
/* 040F48 00140E48 08000524 */  addiu       $5, $0, 0x8
/* 040F4C 00140E4C 05000624 */  addiu       $6, $0, 0x5
/* 040F50 00140E50 0A84040C */  jal         sceVif1PkAddGsAD
/* 040F54 00140E54 00000000 */   nop
/* 040F58 00140E58 28260072 */  paddub      $4, $16, $0
/* 040F5C 00140E5C B683040C */  jal         sceVif1PkCloseGifTag
/* 040F60 00140E60 00000000 */   nop
/* 040F64 00140E64 28260072 */  paddub      $4, $16, $0
/* 040F68 00140E68 A483040C */  jal         sceVif1PkCloseDirectCode
/* 040F6C 00140E6C 00000000 */   nop
/* 040F70 00140E70 1000BF7B */  lq          $31, 0x10($29)
/* 040F74 00140E74 0000B07B */  lq          $16, 0x0($29)
/* 040F78 00140E78 2000BD27 */  addiu       $29, $29, 0x20
/* 040F7C 00140E7C 0800E003 */  jr          $31
/* 040F80 00140E80 00000000 */   nop
/* 040F84 00140E84 00000000 */  nop
/* 040F88 00140E88 00000000 */  nop
/* 040F8C 00140E8C 00000000 */  nop
