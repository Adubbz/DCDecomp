.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AlreadyPeopleTalk__Fii
/* 1186A0 002185A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1186A4 002185A4 1000BF7F */  sq         $31, 0x10($sp)
/* 1186A8 002185A8 0000B07F */  sq         $16, 0x0($sp)
/* 1186AC 002185AC 28168070 */  paddub     $2, $4, $0
/* 1186B0 002185B0 2886A070 */  paddub     $16, $5, $0
/* 1186B4 002185B4 D8FF0626 */  addiu      $6, $16, -0x28
/* 1186B8 002185B8 1C8D848F */  lw         $4, -0x72E4($gp)
/* 1186BC 002185BC 282E4070 */  paddub     $5, $2, $0
/* 1186C0 002185C0 3460050C */  jal        GetGrdNPCData__9CSaveDataFii
/* 1186C4 002185C4 00000000 */   nop
/* 1186C8 002185C8 04004010 */  beqz       $2, .L002185DC
/* 1186CC 002185CC 00000000 */   nop
/* 1186D0 002185D0 D8FF0326 */  addiu      $3, $16, -0x28
/* 1186D4 002185D4 04006104 */  bgez       $3, .L002185E8
/* 1186D8 002185D8 00000000 */   nop
.L002185DC:
/* 1186DC 002185DC 01000224 */  addiu      $2, $0, 0x1
/* 1186E0 002185E0 03000010 */  b          .L002185F0
/* 1186E4 002185E4 00000000 */   nop
.L002185E8:
/* 1186E8 002185E8 0800428C */  lw         $2, 0x8($2)
/* 1186EC 002185EC 00000000 */  nop
.L002185F0:
/* 1186F0 002185F0 1000BF7B */  lq         $31, 0x10($sp)
/* 1186F4 002185F4 0000B07B */  lq         $16, 0x0($sp)
/* 1186F8 002185F8 2000BD27 */  addiu      $sp, $sp, 0x20
/* 1186FC 002185FC 0800E003 */  jr         $31
/* 118700 00218600 00000000 */   nop
/* 118704 00218604 00000000 */  nop
/* 118708 00218608 00000000 */  nop
/* 11870C 0021860C 00000000 */  nop
