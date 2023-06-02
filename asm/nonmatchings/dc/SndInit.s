.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndInit__Fv
/* 592A0 001591A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 592A4 001591A4 0000BF7F */  sq         $31, 0x0($sp)
/* 592A8 001591A8 588E838F */  lw         $3, -0x71A8($gp)
/* 592AC 001591AC 10006014 */  bnez       $3, .L001591F0
/* 592B0 001591B0 00000000 */   nop
/* 592B4 001591B4 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 592B8 001591B8 282E0070 */  paddub     $5, $0, $0
/* 592BC 001591BC 28360070 */  paddub     $6, $0, $0
/* 592C0 001591C0 283E0070 */  paddub     $7, $0, $0
/* 592C4 001591C4 28460070 */  paddub     $8, $0, $0
/* 592C8 001591C8 5813050C */  jal        Init__6CSoundFiiii
/* 592CC 001591CC 00000000 */   nop
/* 592D0 001591D0 01000224 */  addiu      $2, $0, 0x1
/* 592D4 001591D4 588E82AF */  sw         $2, -0x71A8($gp)
/* 592D8 001591D8 04000424 */  addiu      $4, $0, 0x4
/* 592DC 001591DC 1E000524 */  addiu      $5, $0, 0x1E
/* 592E0 001591E0 28368070 */  paddub     $6, $4, $0
/* 592E4 001591E4 05000724 */  addiu      $7, $0, 0x5
/* 592E8 001591E8 8064050C */  jal        SndInitialize__Fiiii
/* 592EC 001591EC 00000000 */   nop
.L001591F0:
/* 592F0 001591F0 0000BF7B */  lq         $31, 0x0($sp)
/* 592F4 001591F4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 592F8 001591F8 0800E003 */  jr         $31
/* 592FC 001591FC 00000000 */   nop
