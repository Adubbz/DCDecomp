.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ASQ_SET_POS__FP12RS_STACKDATAi
/* 942D0 001941D0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 942D4 001941D4 2000BF7F */  sq         $31, 0x20($sp)
/* 942D8 001941D8 1000B17F */  sq         $17, 0x10($sp)
/* 942DC 001941DC 0000B07F */  sq         $16, 0x0($sp)
/* 942E0 001941E0 08009124 */  addiu      $17, $4, 0x8
/* 942E4 001941E4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 942E8 001941E8 00000000 */   nop
/* 942EC 001941EC 28264070 */  paddub     $4, $2, $0
/* 942F0 001941F0 242C060C */  jal        GetActSeq__Fi
/* 942F4 001941F4 00000000 */   nop
/* 942F8 001941F8 28864070 */  paddub     $16, $2, $0
/* 942FC 001941FC 04000016 */  bnez       $16, .L00194210
/* 94300 00194200 00000000 */   nop
/* 94304 00194204 28160070 */  paddub     $2, $0, $0
/* 94308 00194208 0A000010 */  b          .L00194234
/* 9430C 0019420C 00000000 */   nop
.L00194210:
/* 94310 00194210 28262072 */  paddub     $4, $17, $0
/* 94314 00194214 3000A527 */  addiu      $5, $sp, 0x30
/* 94318 00194218 7C2D060C */  jal        GetPosition__FP12RS_STACKDATAPf
/* 9431C 0019421C 00000000 */   nop
/* 94320 00194220 28260072 */  paddub     $4, $16, $0
/* 94324 00194224 3000A527 */  addiu      $5, $sp, 0x30
/* 94328 00194228 F053050C */  jal        SetPos__10CActionSeqFPf
/* 9432C 0019422C 00000000 */   nop
/* 94330 00194230 01000224 */  addiu      $2, $0, 0x1
.L00194234:
/* 94334 00194234 2000BF7B */  lq         $31, 0x20($sp)
/* 94338 00194238 1000B17B */  lq         $17, 0x10($sp)
/* 9433C 0019423C 0000B07B */  lq         $16, 0x0($sp)
/* 94340 00194240 4000BD27 */  addiu      $sp, $sp, 0x40
/* 94344 00194244 0800E003 */  jr         $31
/* 94348 00194248 00000000 */   nop
/* 9434C 0019424C 00000000 */  nop
