.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGSetGsALPHA__FP10sceGsAlpha
/* 2F090 0012EF90 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 2F094 0012EF94 2000BF7F */  sq         $31, 0x20($sp)
/* 2F098 0012EF98 1000B17F */  sq         $17, 0x10($sp)
/* 2F09C 0012EF9C 0000B07F */  sq         $16, 0x0($sp)
/* 2F0A0 0012EFA0 288E8070 */  paddub     $17, $4, $0
/* 2F0A4 0012EFA4 A0B8040C */  jal        GetVif1Packet__Fv
/* 2F0A8 0012EFA8 00000000 */   nop
/* 2F0AC 0012EFAC 28864070 */  paddub     $16, $2, $0
/* 2F0B0 0012EFB0 28260072 */  paddub     $4, $16, $0
/* 2F0B4 0012EFB4 282E0070 */  paddub     $5, $0, $0
/* 2F0B8 0012EFB8 2083040C */  jal        sceVif1PkCnt
/* 2F0BC 0012EFBC 00000000 */   nop
/* 2F0C0 0012EFC0 28260072 */  paddub     $4, $16, $0
/* 2F0C4 0012EFC4 282E0070 */  paddub     $5, $0, $0
/* 2F0C8 0012EFC8 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 2F0CC 0012EFCC 00000000 */   nop
/* 2F0D0 0012EFD0 C701023C */  lui        $2, %hi(GiftagAD)
/* 2F0D4 0012EFD4 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 2F0D8 0012EFD8 28260072 */  paddub     $4, $16, $0
/* 2F0DC 0012EFDC 00004578 */  lq         $5, 0x0($2)
/* 2F0E0 0012EFE0 B083040C */  jal        sceVif1PkOpenGifTag
/* 2F0E4 0012EFE4 00000000 */   nop
/* 2F0E8 0012EFE8 08002012 */  beqz       $17, .L0012F00C
/* 2F0EC 0012EFEC 00000000 */   nop
/* 2F0F0 0012EFF0 28260072 */  paddub     $4, $16, $0
/* 2F0F4 0012EFF4 42000524 */  addiu      $5, $0, 0x42
/* 2F0F8 0012EFF8 000026DE */  ld         $6, 0x0($17)
/* 2F0FC 0012EFFC 0A84040C */  jal        sceVif1PkAddGsAD
/* 2F100 0012F000 00000000 */   nop
/* 2F104 0012F004 07000010 */  b          .L0012F024
/* 2F108 0012F008 00000000 */   nop
.L0012F00C:
/* 2F10C 0012F00C F88B8227 */  addiu      $2, $gp, -0x7408
/* 2F110 0012F010 28260072 */  paddub     $4, $16, $0
/* 2F114 0012F014 42000524 */  addiu      $5, $0, 0x42
/* 2F118 0012F018 000046DC */  ld         $6, 0x0($2)
/* 2F11C 0012F01C 0A84040C */  jal        sceVif1PkAddGsAD
/* 2F120 0012F020 00000000 */   nop
.L0012F024:
/* 2F124 0012F024 28260072 */  paddub     $4, $16, $0
/* 2F128 0012F028 B683040C */  jal        sceVif1PkCloseGifTag
/* 2F12C 0012F02C 00000000 */   nop
/* 2F130 0012F030 28260072 */  paddub     $4, $16, $0
/* 2F134 0012F034 A483040C */  jal        sceVif1PkCloseDirectCode
/* 2F138 0012F038 00000000 */   nop
/* 2F13C 0012F03C 2000BF7B */  lq         $31, 0x20($sp)
/* 2F140 0012F040 1000B17B */  lq         $17, 0x10($sp)
/* 2F144 0012F044 0000B07B */  lq         $16, 0x0($sp)
/* 2F148 0012F048 3000BD27 */  addiu      $sp, $sp, 0x30
/* 2F14C 0012F04C 0800E003 */  jr         $31
/* 2F150 0012F050 00000000 */   nop
/* 2F154 0012F054 00000000 */  nop
/* 2F158 0012F058 00000000 */  nop
/* 2F15C 0012F05C 00000000 */  nop
