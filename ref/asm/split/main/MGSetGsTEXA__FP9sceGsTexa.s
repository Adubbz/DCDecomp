.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGSetGsTEXA__FP9sceGsTexa
/* 02F160 0012F060 D0FFBD27 */  addiu       $29, $29, -0x30
/* 02F164 0012F064 2000BF7F */  sq          $31, 0x20($29)
/* 02F168 0012F068 1000B17F */  sq          $17, 0x10($29)
/* 02F16C 0012F06C 0000B07F */  sq          $16, 0x0($29)
/* 02F170 0012F070 288E8070 */  paddub      $17, $4, $0
/* 02F174 0012F074 A0B8040C */  jal         GetVif1Packet__Fv
/* 02F178 0012F078 00000000 */   nop
/* 02F17C 0012F07C 28864070 */  paddub      $16, $2, $0
/* 02F180 0012F080 28260072 */  paddub      $4, $16, $0
/* 02F184 0012F084 282E0070 */  paddub      $5, $0, $0
/* 02F188 0012F088 2083040C */  jal         sceVif1PkCnt
/* 02F18C 0012F08C 00000000 */   nop
/* 02F190 0012F090 28260072 */  paddub      $4, $16, $0
/* 02F194 0012F094 282E0070 */  paddub      $5, $0, $0
/* 02F198 0012F098 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 02F19C 0012F09C 00000000 */   nop
/* 02F1A0 0012F0A0 C701023C */  lui         $2, %hi(GiftagAD)
/* 02F1A4 0012F0A4 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 02F1A8 0012F0A8 28260072 */  paddub      $4, $16, $0
/* 02F1AC 0012F0AC 00004578 */  lq          $5, 0x0($2)
/* 02F1B0 0012F0B0 B083040C */  jal         sceVif1PkOpenGifTag
/* 02F1B4 0012F0B4 00000000 */   nop
/* 02F1B8 0012F0B8 08002012 */  beqz        $17, .L0012F0DC
/* 02F1BC 0012F0BC 00000000 */   nop
/* 02F1C0 0012F0C0 28260072 */  paddub      $4, $16, $0
/* 02F1C4 0012F0C4 3B000524 */  addiu       $5, $0, 0x3B
/* 02F1C8 0012F0C8 000026DE */  ld          $6, 0x0($17)
/* 02F1CC 0012F0CC 0A84040C */  jal         sceVif1PkAddGsAD
/* 02F1D0 0012F0D0 00000000 */   nop
/* 02F1D4 0012F0D4 07000010 */  b           .L0012F0F4
/* 02F1D8 0012F0D8 00000000 */   nop
.L0012F0DC:
/* 02F1DC 0012F0DC 008C8227 */  addiu       $2, $28, -0x7400
/* 02F1E0 0012F0E0 28260072 */  paddub      $4, $16, $0
/* 02F1E4 0012F0E4 3B000524 */  addiu       $5, $0, 0x3B
/* 02F1E8 0012F0E8 000046DC */  ld          $6, 0x0($2)
/* 02F1EC 0012F0EC 0A84040C */  jal         sceVif1PkAddGsAD
/* 02F1F0 0012F0F0 00000000 */   nop
.L0012F0F4:
/* 02F1F4 0012F0F4 28260072 */  paddub      $4, $16, $0
/* 02F1F8 0012F0F8 B683040C */  jal         sceVif1PkCloseGifTag
/* 02F1FC 0012F0FC 00000000 */   nop
/* 02F200 0012F100 28260072 */  paddub      $4, $16, $0
/* 02F204 0012F104 A483040C */  jal         sceVif1PkCloseDirectCode
/* 02F208 0012F108 00000000 */   nop
/* 02F20C 0012F10C 2000BF7B */  lq          $31, 0x20($29)
/* 02F210 0012F110 1000B17B */  lq          $17, 0x10($29)
/* 02F214 0012F114 0000B07B */  lq          $16, 0x0($29)
/* 02F218 0012F118 3000BD27 */  addiu       $29, $29, 0x30
/* 02F21C 0012F11C 0800E003 */  jr          $31
/* 02F220 0012F120 00000000 */   nop
/* 02F224 0012F124 00000000 */  nop
/* 02F228 0012F128 00000000 */  nop
/* 02F22C 0012F12C 00000000 */  nop
