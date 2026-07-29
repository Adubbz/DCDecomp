.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGSetGsZBUF__FP9sceGsZbuf
/* 02EFC0 0012EEC0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 02EFC4 0012EEC4 2000BF7F */  sq          $31, 0x20($29)
/* 02EFC8 0012EEC8 1000B17F */  sq          $17, 0x10($29)
/* 02EFCC 0012EECC 0000B07F */  sq          $16, 0x0($29)
/* 02EFD0 0012EED0 288E8070 */  paddub      $17, $4, $0
/* 02EFD4 0012EED4 A0B8040C */  jal         GetVif1Packet__Fv
/* 02EFD8 0012EED8 00000000 */   nop
/* 02EFDC 0012EEDC 28864070 */  paddub      $16, $2, $0
/* 02EFE0 0012EEE0 28260072 */  paddub      $4, $16, $0
/* 02EFE4 0012EEE4 282E0070 */  paddub      $5, $0, $0
/* 02EFE8 0012EEE8 2083040C */  jal         sceVif1PkCnt
/* 02EFEC 0012EEEC 00000000 */   nop
/* 02EFF0 0012EEF0 28260072 */  paddub      $4, $16, $0
/* 02EFF4 0012EEF4 282E0070 */  paddub      $5, $0, $0
/* 02EFF8 0012EEF8 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 02EFFC 0012EEFC 00000000 */   nop
/* 02F000 0012EF00 C701023C */  lui         $2, %hi(GiftagAD)
/* 02F004 0012EF04 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 02F008 0012EF08 28260072 */  paddub      $4, $16, $0
/* 02F00C 0012EF0C 00004578 */  lq          $5, 0x0($2)
/* 02F010 0012EF10 B083040C */  jal         sceVif1PkOpenGifTag
/* 02F014 0012EF14 00000000 */   nop
/* 02F018 0012EF18 08002012 */  beqz        $17, .L0012EF3C
/* 02F01C 0012EF1C 00000000 */   nop
/* 02F020 0012EF20 28260072 */  paddub      $4, $16, $0
/* 02F024 0012EF24 4E000524 */  addiu       $5, $0, 0x4E
/* 02F028 0012EF28 000026DE */  ld          $6, 0x0($17)
/* 02F02C 0012EF2C 0A84040C */  jal         sceVif1PkAddGsAD
/* 02F030 0012EF30 00000000 */   nop
/* 02F034 0012EF34 07000010 */  b           .L0012EF54
/* 02F038 0012EF38 00000000 */   nop
.L0012EF3C:
/* 02F03C 0012EF3C F08B8227 */  addiu       $2, $28, -0x7410
/* 02F040 0012EF40 28260072 */  paddub      $4, $16, $0
/* 02F044 0012EF44 4E000524 */  addiu       $5, $0, 0x4E
/* 02F048 0012EF48 000046DC */  ld          $6, 0x0($2)
/* 02F04C 0012EF4C 0A84040C */  jal         sceVif1PkAddGsAD
/* 02F050 0012EF50 00000000 */   nop
.L0012EF54:
/* 02F054 0012EF54 28260072 */  paddub      $4, $16, $0
/* 02F058 0012EF58 B683040C */  jal         sceVif1PkCloseGifTag
/* 02F05C 0012EF5C 00000000 */   nop
/* 02F060 0012EF60 28260072 */  paddub      $4, $16, $0
/* 02F064 0012EF64 A483040C */  jal         sceVif1PkCloseDirectCode
/* 02F068 0012EF68 00000000 */   nop
/* 02F06C 0012EF6C 2000BF7B */  lq          $31, 0x20($29)
/* 02F070 0012EF70 1000B17B */  lq          $17, 0x10($29)
/* 02F074 0012EF74 0000B07B */  lq          $16, 0x0($29)
/* 02F078 0012EF78 3000BD27 */  addiu       $29, $29, 0x30
/* 02F07C 0012EF7C 0800E003 */  jr          $31
/* 02F080 0012EF80 00000000 */   nop
/* 02F084 0012EF84 00000000 */  nop
/* 02F088 0012EF88 00000000 */  nop
/* 02F08C 0012EF8C 00000000 */  nop
