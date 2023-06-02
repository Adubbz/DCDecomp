.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FrameOnOff__FP6CFramePci
/* 7DE40 0017DD40 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7DE44 0017DD44 1000BF7F */  sq         $31, 0x10($sp)
/* 7DE48 0017DD48 0000B07F */  sq         $16, 0x0($sp)
/* 7DE4C 0017DD4C 2886C070 */  paddub     $16, $6, $0
/* 7DE50 0017DD50 04008014 */  bnez       $4, .L0017DD64
/* 7DE54 0017DD54 00000000 */   nop
/* 7DE58 0017DD58 28160070 */  paddub     $2, $0, $0
/* 7DE5C 0017DD5C 0F000010 */  b          .L0017DD9C
/* 7DE60 0017DD60 00000000 */   nop
.L0017DD64:
/* 7DE64 0017DD64 0400A014 */  bnez       $5, .L0017DD78
/* 7DE68 0017DD68 00000000 */   nop
/* 7DE6C 0017DD6C 28160070 */  paddub     $2, $0, $0
/* 7DE70 0017DD70 0A000010 */  b          .L0017DD9C
/* 7DE74 0017DD74 00000000 */   nop
.L0017DD78:
/* 7DE78 0017DD78 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 7DE7C 0017DD7C 00000000 */   nop
/* 7DE80 0017DD80 04004014 */  bnez       $2, .L0017DD94
/* 7DE84 0017DD84 00000000 */   nop
/* 7DE88 0017DD88 28160070 */  paddub     $2, $0, $0
/* 7DE8C 0017DD8C 03000010 */  b          .L0017DD9C
/* 7DE90 0017DD90 00000000 */   nop
.L0017DD94:
/* 7DE94 0017DD94 B00050A4 */  sh         $16, 0xB0($2)
/* 7DE98 0017DD98 28160070 */  paddub     $2, $0, $0
.L0017DD9C:
/* 7DE9C 0017DD9C 1000BF7B */  lq         $31, 0x10($sp)
/* 7DEA0 0017DDA0 0000B07B */  lq         $16, 0x0($sp)
/* 7DEA4 0017DDA4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 7DEA8 0017DDA8 0800E003 */  jr         $31
/* 7DEAC 0017DDAC 00000000 */   nop
