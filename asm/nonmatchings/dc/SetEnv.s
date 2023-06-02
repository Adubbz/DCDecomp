.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetEnv__FP13sceVif1Packet
/* 40EA0 00140DA0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 40EA4 00140DA4 1000BF7F */  sq         $31, 0x10($sp)
/* 40EA8 00140DA8 0000B07F */  sq         $16, 0x0($sp)
/* 40EAC 00140DAC 28868070 */  paddub     $16, $4, $0
/* 40EB0 00140DB0 282E0070 */  paddub     $5, $0, $0
/* 40EB4 00140DB4 2083040C */  jal        sceVif1PkCnt
/* 40EB8 00140DB8 00000000 */   nop
/* 40EBC 00140DBC 28260072 */  paddub     $4, $16, $0
/* 40EC0 00140DC0 282E0070 */  paddub     $5, $0, $0
/* 40EC4 00140DC4 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 40EC8 00140DC8 00000000 */   nop
/* 40ECC 00140DCC C701023C */  lui        $2, %hi(GiftagAD)
/* 40ED0 00140DD0 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 40ED4 00140DD4 28260072 */  paddub     $4, $16, $0
/* 40ED8 00140DD8 00004578 */  lq         $5, 0x0($2)
/* 40EDC 00140DDC B083040C */  jal        sceVif1PkOpenGifTag
/* 40EE0 00140DE0 00000000 */   nop
/* 40EE4 00140DE4 E08B8227 */  addiu      $2, $gp, -0x7420
/* 40EE8 00140DE8 28260072 */  paddub     $4, $16, $0
/* 40EEC 00140DEC 14000524 */  addiu      $5, $0, 0x14
/* 40EF0 00140DF0 000046DC */  ld         $6, 0x0($2)
/* 40EF4 00140DF4 0A84040C */  jal        sceVif1PkAddGsAD
/* 40EF8 00140DF8 00000000 */   nop
/* 40EFC 00140DFC E88B8227 */  addiu      $2, $gp, -0x7418
/* 40F00 00140E00 28260072 */  paddub     $4, $16, $0
/* 40F04 00140E04 47000524 */  addiu      $5, $0, 0x47
/* 40F08 00140E08 000046DC */  ld         $6, 0x0($2)
/* 40F0C 00140E0C 0A84040C */  jal        sceVif1PkAddGsAD
/* 40F10 00140E10 00000000 */   nop
/* 40F14 00140E14 F08B8227 */  addiu      $2, $gp, -0x7410
/* 40F18 00140E18 28260072 */  paddub     $4, $16, $0
/* 40F1C 00140E1C 4E000524 */  addiu      $5, $0, 0x4E
/* 40F20 00140E20 000046DC */  ld         $6, 0x0($2)
/* 40F24 00140E24 0A84040C */  jal        sceVif1PkAddGsAD
/* 40F28 00140E28 00000000 */   nop
/* 40F2C 00140E2C F88B8227 */  addiu      $2, $gp, -0x7408
/* 40F30 00140E30 28260072 */  paddub     $4, $16, $0
/* 40F34 00140E34 42000524 */  addiu      $5, $0, 0x42
/* 40F38 00140E38 000046DC */  ld         $6, 0x0($2)
/* 40F3C 00140E3C 0A84040C */  jal        sceVif1PkAddGsAD
/* 40F40 00140E40 00000000 */   nop
/* 40F44 00140E44 28260072 */  paddub     $4, $16, $0
/* 40F48 00140E48 08000524 */  addiu      $5, $0, 0x8
/* 40F4C 00140E4C 05000624 */  addiu      $6, $0, 0x5
/* 40F50 00140E50 0A84040C */  jal        sceVif1PkAddGsAD
/* 40F54 00140E54 00000000 */   nop
/* 40F58 00140E58 28260072 */  paddub     $4, $16, $0
/* 40F5C 00140E5C B683040C */  jal        sceVif1PkCloseGifTag
/* 40F60 00140E60 00000000 */   nop
/* 40F64 00140E64 28260072 */  paddub     $4, $16, $0
/* 40F68 00140E68 A483040C */  jal        sceVif1PkCloseDirectCode
/* 40F6C 00140E6C 00000000 */   nop
/* 40F70 00140E70 1000BF7B */  lq         $31, 0x10($sp)
/* 40F74 00140E74 0000B07B */  lq         $16, 0x0($sp)
/* 40F78 00140E78 2000BD27 */  addiu      $sp, $sp, 0x20
/* 40F7C 00140E7C 0800E003 */  jr         $31
/* 40F80 00140E80 00000000 */   nop
/* 40F84 00140E84 00000000 */  nop
/* 40F88 00140E88 00000000 */  nop
/* 40F8C 00140E8C 00000000 */  nop
