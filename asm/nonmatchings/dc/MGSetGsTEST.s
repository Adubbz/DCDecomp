.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGSetGsTEST__FP9sceGsTest
/* 2EEF0 0012EDF0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 2EEF4 0012EDF4 2000BF7F */  sq         $31, 0x20($sp)
/* 2EEF8 0012EDF8 1000B17F */  sq         $17, 0x10($sp)
/* 2EEFC 0012EDFC 0000B07F */  sq         $16, 0x0($sp)
/* 2EF00 0012EE00 288E8070 */  paddub     $17, $4, $0
/* 2EF04 0012EE04 A0B8040C */  jal        GetVif1Packet__Fv
/* 2EF08 0012EE08 00000000 */   nop
/* 2EF0C 0012EE0C 28864070 */  paddub     $16, $2, $0
/* 2EF10 0012EE10 28260072 */  paddub     $4, $16, $0
/* 2EF14 0012EE14 282E0070 */  paddub     $5, $0, $0
/* 2EF18 0012EE18 2083040C */  jal        sceVif1PkCnt
/* 2EF1C 0012EE1C 00000000 */   nop
/* 2EF20 0012EE20 28260072 */  paddub     $4, $16, $0
/* 2EF24 0012EE24 282E0070 */  paddub     $5, $0, $0
/* 2EF28 0012EE28 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 2EF2C 0012EE2C 00000000 */   nop
/* 2EF30 0012EE30 C701023C */  lui        $2, %hi(GiftagAD)
/* 2EF34 0012EE34 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 2EF38 0012EE38 28260072 */  paddub     $4, $16, $0
/* 2EF3C 0012EE3C 00004578 */  lq         $5, 0x0($2)
/* 2EF40 0012EE40 B083040C */  jal        sceVif1PkOpenGifTag
/* 2EF44 0012EE44 00000000 */   nop
/* 2EF48 0012EE48 08002012 */  beqz       $17, .L0012EE6C
/* 2EF4C 0012EE4C 00000000 */   nop
/* 2EF50 0012EE50 28260072 */  paddub     $4, $16, $0
/* 2EF54 0012EE54 47000524 */  addiu      $5, $0, 0x47
/* 2EF58 0012EE58 000026DE */  ld         $6, 0x0($17)
/* 2EF5C 0012EE5C 0A84040C */  jal        sceVif1PkAddGsAD
/* 2EF60 0012EE60 00000000 */   nop
/* 2EF64 0012EE64 07000010 */  b          .L0012EE84
/* 2EF68 0012EE68 00000000 */   nop
.L0012EE6C:
/* 2EF6C 0012EE6C E88B8227 */  addiu      $2, $gp, -0x7418
/* 2EF70 0012EE70 28260072 */  paddub     $4, $16, $0
/* 2EF74 0012EE74 47000524 */  addiu      $5, $0, 0x47
/* 2EF78 0012EE78 000046DC */  ld         $6, 0x0($2)
/* 2EF7C 0012EE7C 0A84040C */  jal        sceVif1PkAddGsAD
/* 2EF80 0012EE80 00000000 */   nop
.L0012EE84:
/* 2EF84 0012EE84 28260072 */  paddub     $4, $16, $0
/* 2EF88 0012EE88 B683040C */  jal        sceVif1PkCloseGifTag
/* 2EF8C 0012EE8C 00000000 */   nop
/* 2EF90 0012EE90 28260072 */  paddub     $4, $16, $0
/* 2EF94 0012EE94 A483040C */  jal        sceVif1PkCloseDirectCode
/* 2EF98 0012EE98 00000000 */   nop
/* 2EF9C 0012EE9C 2000BF7B */  lq         $31, 0x20($sp)
/* 2EFA0 0012EEA0 1000B17B */  lq         $17, 0x10($sp)
/* 2EFA4 0012EEA4 0000B07B */  lq         $16, 0x0($sp)
/* 2EFA8 0012EEA8 3000BD27 */  addiu      $sp, $sp, 0x30
/* 2EFAC 0012EEAC 0800E003 */  jr         $31
/* 2EFB0 0012EEB0 00000000 */   nop
/* 2EFB4 0012EEB4 00000000 */  nop
/* 2EFB8 0012EEB8 00000000 */  nop
/* 2EFBC 0012EEBC 00000000 */  nop
