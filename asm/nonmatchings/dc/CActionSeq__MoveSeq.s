.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MoveSeq__10CActionSeqFPfi
/* 54F50 00154E50 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 54F54 00154E54 4000BF7F */  sq         $31, 0x40($sp)
/* 54F58 00154E58 3000B37F */  sq         $19, 0x30($sp)
/* 54F5C 00154E5C 2000B27F */  sq         $18, 0x20($sp)
/* 54F60 00154E60 1000B17F */  sq         $17, 0x10($sp)
/* 54F64 00154E64 0000B07F */  sq         $16, 0x0($sp)
/* 54F68 00154E68 289E8070 */  paddub     $19, $4, $0
/* 54F6C 00154E6C 2896A070 */  paddub     $18, $5, $0
/* 54F70 00154E70 288EC070 */  paddub     $17, $6, $0
/* 54F74 00154E74 4053050C */  jal        NextMoveSeq__10CActionSeqFv
/* 54F78 00154E78 00000000 */   nop
/* 54F7C 00154E7C 28864070 */  paddub     $16, $2, $0
/* 54F80 00154E80 0C000012 */  beqz       $16, .L00154EB4
/* 54F84 00154E84 00000000 */   nop
/* 54F88 00154E88 02000224 */  addiu      $2, $0, 0x2
/* 54F8C 00154E8C 000002AE */  sw         $2, 0x0($16)
/* 54F90 00154E90 10000426 */  addiu      $4, $16, 0x10
/* 54F94 00154E94 282E4072 */  paddub     $5, $18, $0
/* 54F98 00154E98 0C86040C */  jal        sceVu0CopyVector
/* 54F9C 00154E9C 00000000 */   nop
/* 54FA0 00154EA0 30006426 */  addiu      $4, $19, 0x30
/* 54FA4 00154EA4 282E4072 */  paddub     $5, $18, $0
/* 54FA8 00154EA8 0C86040C */  jal        sceVu0CopyVector
/* 54FAC 00154EAC 00000000 */   nop
/* 54FB0 00154EB0 040011AE */  sw         $17, 0x4($16)
.L00154EB4:
/* 54FB4 00154EB4 4000BF7B */  lq         $31, 0x40($sp)
/* 54FB8 00154EB8 3000B37B */  lq         $19, 0x30($sp)
/* 54FBC 00154EBC 2000B27B */  lq         $18, 0x20($sp)
/* 54FC0 00154EC0 1000B17B */  lq         $17, 0x10($sp)
/* 54FC4 00154EC4 0000B07B */  lq         $16, 0x0($sp)
/* 54FC8 00154EC8 5000BD27 */  addiu      $sp, $sp, 0x50
/* 54FCC 00154ECC 0800E003 */  jr         $31
/* 54FD0 00154ED0 00000000 */   nop
/* 54FD4 00154ED4 00000000 */  nop
/* 54FD8 00154ED8 00000000 */  nop
/* 54FDC 00154EDC 00000000 */  nop
