.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AtoraTipOnlyMsgNoGet__Fii
/* 1190A0 00218FA0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1190A4 00218FA4 1000BF7F */  sq         $31, 0x10($sp)
/* 1190A8 00218FA8 0000B07F */  sq         $16, 0x0($sp)
/* 1190AC 00218FAC 2886A070 */  paddub     $16, $5, $0
/* 1190B0 00218FB0 A063050C */  jal        GetEditAtraChipData__Fii
/* 1190B4 00218FB4 00000000 */   nop
/* 1190B8 00218FB8 04004014 */  bnez       $2, .L00218FCC
/* 1190BC 00218FBC 00000000 */   nop
/* 1190C0 00218FC0 FFFF0224 */  addiu      $2, $0, -0x1
/* 1190C4 00218FC4 07000010 */  b          .L00218FE4
/* 1190C8 00218FC8 00000000 */   nop
.L00218FCC:
/* 1190CC 00218FCC 0400428C */  lw         $2, 0x4($2)
/* 1190D0 00218FD0 28004224 */  addiu      $2, $2, 0x28
/* 1190D4 00218FD4 2800032A */  slti       $3, $16, 0x28
/* 1190D8 00218FD8 02006014 */  bnez       $3, .L00218FE4
/* 1190DC 00218FDC 00000000 */   nop
/* 1190E0 00218FE0 28004224 */  addiu      $2, $2, 0x28
.L00218FE4:
/* 1190E4 00218FE4 1000BF7B */  lq         $31, 0x10($sp)
/* 1190E8 00218FE8 0000B07B */  lq         $16, 0x0($sp)
/* 1190EC 00218FEC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 1190F0 00218FF0 0800E003 */  jr         $31
/* 1190F4 00218FF4 00000000 */   nop
/* 1190F8 00218FF8 00000000 */  nop
/* 1190FC 00218FFC 00000000 */  nop
