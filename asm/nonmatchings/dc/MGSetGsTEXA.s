.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGSetGsTEXA__FP9sceGsTexa
/* 2F160 0012F060 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 2F164 0012F064 2000BF7F */  sq         $31, 0x20($sp)
/* 2F168 0012F068 1000B17F */  sq         $17, 0x10($sp)
/* 2F16C 0012F06C 0000B07F */  sq         $16, 0x0($sp)
/* 2F170 0012F070 288E8070 */  paddub     $17, $4, $0
/* 2F174 0012F074 A0B8040C */  jal        GetVif1Packet__Fv
/* 2F178 0012F078 00000000 */   nop
/* 2F17C 0012F07C 28864070 */  paddub     $16, $2, $0
/* 2F180 0012F080 28260072 */  paddub     $4, $16, $0
/* 2F184 0012F084 282E0070 */  paddub     $5, $0, $0
/* 2F188 0012F088 2083040C */  jal        sceVif1PkCnt
/* 2F18C 0012F08C 00000000 */   nop
/* 2F190 0012F090 28260072 */  paddub     $4, $16, $0
/* 2F194 0012F094 282E0070 */  paddub     $5, $0, $0
/* 2F198 0012F098 8E83040C */  jal        sceVif1PkOpenDirectCode
/* 2F19C 0012F09C 00000000 */   nop
/* 2F1A0 0012F0A0 C701023C */  lui        $2, %hi(GiftagAD)
/* 2F1A4 0012F0A4 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* 2F1A8 0012F0A8 28260072 */  paddub     $4, $16, $0
/* 2F1AC 0012F0AC 00004578 */  lq         $5, 0x0($2)
/* 2F1B0 0012F0B0 B083040C */  jal        sceVif1PkOpenGifTag
/* 2F1B4 0012F0B4 00000000 */   nop
/* 2F1B8 0012F0B8 08002012 */  beqz       $17, .L0012F0DC
/* 2F1BC 0012F0BC 00000000 */   nop
/* 2F1C0 0012F0C0 28260072 */  paddub     $4, $16, $0
/* 2F1C4 0012F0C4 3B000524 */  addiu      $5, $0, 0x3B
/* 2F1C8 0012F0C8 000026DE */  ld         $6, 0x0($17)
/* 2F1CC 0012F0CC 0A84040C */  jal        sceVif1PkAddGsAD
/* 2F1D0 0012F0D0 00000000 */   nop
/* 2F1D4 0012F0D4 07000010 */  b          .L0012F0F4
/* 2F1D8 0012F0D8 00000000 */   nop
.L0012F0DC:
/* 2F1DC 0012F0DC 008C8227 */  addiu      $2, $gp, -0x7400
/* 2F1E0 0012F0E0 28260072 */  paddub     $4, $16, $0
/* 2F1E4 0012F0E4 3B000524 */  addiu      $5, $0, 0x3B
/* 2F1E8 0012F0E8 000046DC */  ld         $6, 0x0($2)
/* 2F1EC 0012F0EC 0A84040C */  jal        sceVif1PkAddGsAD
/* 2F1F0 0012F0F0 00000000 */   nop
.L0012F0F4:
/* 2F1F4 0012F0F4 28260072 */  paddub     $4, $16, $0
/* 2F1F8 0012F0F8 B683040C */  jal        sceVif1PkCloseGifTag
/* 2F1FC 0012F0FC 00000000 */   nop
/* 2F200 0012F100 28260072 */  paddub     $4, $16, $0
/* 2F204 0012F104 A483040C */  jal        sceVif1PkCloseDirectCode
/* 2F208 0012F108 00000000 */   nop
/* 2F20C 0012F10C 2000BF7B */  lq         $31, 0x20($sp)
/* 2F210 0012F110 1000B17B */  lq         $17, 0x10($sp)
/* 2F214 0012F114 0000B07B */  lq         $16, 0x0($sp)
/* 2F218 0012F118 3000BD27 */  addiu      $sp, $sp, 0x30
/* 2F21C 0012F11C 0800E003 */  jr         $31
/* 2F220 0012F120 00000000 */   nop
/* 2F224 0012F124 00000000 */  nop
/* 2F228 0012F128 00000000 */  nop
/* 2F22C 0012F12C 00000000 */  nop
