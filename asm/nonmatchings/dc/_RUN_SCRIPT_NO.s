.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _RUN_SCRIPT_NO__FP12RS_STACKDATAi
/* BCAF0 001BC9F0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* BCAF4 001BC9F4 3000BF7F */  sq         $31, 0x30($sp)
/* BCAF8 001BC9F8 2000B27F */  sq         $18, 0x20($sp)
/* BCAFC 001BC9FC 1000B17F */  sq         $17, 0x10($sp)
/* BCB00 001BCA00 0000B07F */  sq         $16, 0x0($sp)
/* BCB04 001BCA04 288EA070 */  paddub     $17, $5, $0
/* BCB08 001BCA08 08009224 */  addiu      $18, $4, 0x8
/* BCB0C 001BCA0C 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCB10 001BCA10 00000000 */   nop
/* BCB14 001BCA14 28864070 */  paddub     $16, $2, $0
/* BCB18 001BCA18 D501013C */  lui        $at, (0x1D56774 >> 16)
/* BCB1C 001BCA1C 746720AC */  sw         $0, (0x1D56774 & 0xFFFF)($at)
/* BCB20 001BCA20 02000224 */  addiu      $2, $0, 0x2
/* BCB24 001BCA24 07002216 */  bne        $17, $2, .L001BCA44
/* BCB28 001BCA28 00000000 */   nop
/* BCB2C 001BCA2C 28264072 */  paddub     $4, $18, $0
/* BCB30 001BCA30 08009224 */  addiu      $18, $4, 0x8
/* BCB34 001BCA34 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCB38 001BCA38 00000000 */   nop
/* BCB3C 001BCA3C D501013C */  lui        $at, (0x1D56774 >> 16)
/* BCB40 001BCA40 746722AC */  sw         $2, (0x1D56774 & 0xFFFF)($at)
.L001BCA44:
/* BCB44 001BCA44 03000224 */  addiu      $2, $0, 0x3
/* BCB48 001BCA48 0C002216 */  bne        $17, $2, .L001BCA7C
/* BCB4C 001BCA4C 00000000 */   nop
/* BCB50 001BCA50 28264072 */  paddub     $4, $18, $0
/* BCB54 001BCA54 08009224 */  addiu      $18, $4, 0x8
/* BCB58 001BCA58 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCB5C 001BCA5C 00000000 */   nop
/* BCB60 001BCA60 D501013C */  lui        $at, (0x1D56774 >> 16)
/* BCB64 001BCA64 746722AC */  sw         $2, (0x1D56774 & 0xFFFF)($at)
/* BCB68 001BCA68 28264072 */  paddub     $4, $18, $0
/* BCB6C 001BCA6C 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BCB70 001BCA70 00000000 */   nop
/* BCB74 001BCA74 D501013C */  lui        $at, (0x1D567D0 >> 16)
/* BCB78 001BCA78 D06722AC */  sw         $2, (0x1D567D0 & 0xFFFF)($at)
.L001BCA7C:
/* BCB7C 001BCA7C 05000224 */  addiu      $2, $0, 0x5
/* BCB80 001BCA80 D501013C */  lui        $at, (0x1D567D8 >> 16)
/* BCB84 001BCA84 D86722AC */  sw         $2, (0x1D567D8 & 0xFFFF)($at)
/* BCB88 001BCA88 D501013C */  lui        $at, (0x1D567DC >> 16)
/* BCB8C 001BCA8C DC6730AC */  sw         $16, (0x1D567DC & 0xFFFF)($at)
/* BCB90 001BCA90 01000224 */  addiu      $2, $0, 0x1
/* BCB94 001BCA94 3000BF7B */  lq         $31, 0x30($sp)
/* BCB98 001BCA98 2000B27B */  lq         $18, 0x20($sp)
/* BCB9C 001BCA9C 1000B17B */  lq         $17, 0x10($sp)
/* BCBA0 001BCAA0 0000B07B */  lq         $16, 0x0($sp)
/* BCBA4 001BCAA4 4000BD27 */  addiu      $sp, $sp, 0x40
/* BCBA8 001BCAA8 0800E003 */  jr         $31
/* BCBAC 001BCAAC 00000000 */   nop
