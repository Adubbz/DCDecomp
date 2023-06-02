.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ShopPersonReadStart__Fii
/* E80A0 001E7FA0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* E80A4 001E7FA4 1000BF7F */  sq         $31, 0x10($sp)
/* E80A8 001E7FA8 0000B07F */  sq         $16, 0x0($sp)
/* E80AC 001E7FAC 2000A627 */  addiu      $6, $sp, 0x20
/* E80B0 001E7FB0 A0B6070C */  jal        ItemShopGetPacFileName__FiiPc
/* E80B4 001E7FB4 00000000 */   nop
/* E80B8 001E7FB8 D901013C */  lui        $at, (0x1D900B8 >> 16)
/* E80BC 001E7FBC B800228C */  lw         $2, (0x1D900B8 & 0xFFFF)($at)
/* E80C0 001E7FC0 00190200 */  sll        $3, $2, 4
/* E80C4 001E7FC4 D901013C */  lui        $at, (0x1D900B0 >> 16)
/* E80C8 001E7FC8 B000228C */  lw         $2, (0x1D900B0 & 0xFFFF)($at)
/* E80CC 001E7FCC 21804300 */  addu       $16, $2, $3
/* E80D0 001E7FD0 28260072 */  paddub     $4, $16, $0
/* E80D4 001E7FD4 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* E80D8 001E7FD8 00000000 */   nop
/* E80DC 001E7FDC 28864070 */  paddub     $16, $2, $0
/* E80E0 001E7FE0 30FB040C */  jal        StartReadBG__Fv
/* E80E4 001E7FE4 00000000 */   nop
/* E80E8 001E7FE8 2000A427 */  addiu      $4, $sp, 0x20
/* E80EC 001E7FEC 282E0072 */  paddub     $5, $16, $0
/* E80F0 001E7FF0 6C00A627 */  addiu      $6, $sp, 0x6C
/* E80F4 001E7FF4 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* E80F8 001E7FF8 00000000 */   nop
/* E80FC 001E7FFC 04004014 */  bnez       $2, .L001E8010
/* E8100 001E8000 00000000 */   nop
/* E8104 001E8004 28160070 */  paddub     $2, $0, $0
/* E8108 001E8008 06000010 */  b          .L001E8024
/* E810C 001E800C 00000000 */   nop
.L001E8010:
/* E8110 001E8010 38FB040C */  jal        ReadBG__Fv
/* E8114 001E8014 00000000 */   nop
/* E8118 001E8018 D901013C */  lui        $at, (0x1D90264 >> 16)
/* E811C 001E801C 640220A4 */  sh         $0, (0x1D90264 & 0xFFFF)($at)
/* E8120 001E8020 01000224 */  addiu      $2, $0, 0x1
.L001E8024:
/* E8124 001E8024 1000BF7B */  lq         $31, 0x10($sp)
/* E8128 001E8028 0000B07B */  lq         $16, 0x0($sp)
/* E812C 001E802C 7000BD27 */  addiu      $sp, $sp, 0x70
/* E8130 001E8030 0800E003 */  jr         $31
/* E8134 001E8034 00000000 */   nop
/* E8138 001E8038 00000000 */  nop
/* E813C 001E803C 00000000 */  nop
