.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddAlt__9CEditAreaFiii
/* 70290 00170190 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 70294 00170194 4000BF7F */  sq         $31, 0x40($sp)
/* 70298 00170198 3000B37F */  sq         $19, 0x30($sp)
/* 7029C 0017019C 2000B27F */  sq         $18, 0x20($sp)
/* 702A0 001701A0 1000B17F */  sq         $17, 0x10($sp)
/* 702A4 001701A4 0000B07F */  sq         $16, 0x0($sp)
/* 702A8 001701A8 289E8070 */  paddub     $19, $4, $0
/* 702AC 001701AC 2896A070 */  paddub     $18, $5, $0
/* 702B0 001701B0 288EC070 */  paddub     $17, $6, $0
/* 702B4 001701B4 2886E070 */  paddub     $16, $7, $0
/* 702B8 001701B8 38B7050C */  jal        GetAlt_i__9CEditAreaFii
/* 702BC 001701BC 00000000 */   nop
/* 702C0 001701C0 21380202 */  addu       $7, $16, $2
/* 702C4 001701C4 28266072 */  paddub     $4, $19, $0
/* 702C8 001701C8 282E4072 */  paddub     $5, $18, $0
/* 702CC 001701CC 28362072 */  paddub     $6, $17, $0
/* 702D0 001701D0 14B7050C */  jal        SetAlt__9CEditAreaFiii
/* 702D4 001701D4 00000000 */   nop
/* 702D8 001701D8 4000BF7B */  lq         $31, 0x40($sp)
/* 702DC 001701DC 3000B37B */  lq         $19, 0x30($sp)
/* 702E0 001701E0 2000B27B */  lq         $18, 0x20($sp)
/* 702E4 001701E4 1000B17B */  lq         $17, 0x10($sp)
/* 702E8 001701E8 0000B07B */  lq         $16, 0x0($sp)
/* 702EC 001701EC 5000BD27 */  addiu      $sp, $sp, 0x50
/* 702F0 001701F0 0800E003 */  jr         $31
/* 702F4 001701F4 00000000 */   nop
/* 702F8 001701F8 00000000 */  nop
/* 702FC 001701FC 00000000 */  nop
