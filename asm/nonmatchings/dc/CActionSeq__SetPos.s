.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPos__10CActionSeqFPf
/* 550C0 00154FC0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 550C4 00154FC4 3000BF7F */  sq         $31, 0x30($sp)
/* 550C8 00154FC8 2000B27F */  sq         $18, 0x20($sp)
/* 550CC 00154FCC 1000B17F */  sq         $17, 0x10($sp)
/* 550D0 00154FD0 0000B07F */  sq         $16, 0x0($sp)
/* 550D4 00154FD4 28968070 */  paddub     $18, $4, $0
/* 550D8 00154FD8 288EA070 */  paddub     $17, $5, $0
/* 550DC 00154FDC 4053050C */  jal        NextMoveSeq__10CActionSeqFv
/* 550E0 00154FE0 00000000 */   nop
/* 550E4 00154FE4 28864070 */  paddub     $16, $2, $0
/* 550E8 00154FE8 0C000012 */  beqz       $16, .L0015501C
/* 550EC 00154FEC 00000000 */   nop
/* 550F0 00154FF0 01000224 */  addiu      $2, $0, 0x1
/* 550F4 00154FF4 000002AE */  sw         $2, 0x0($16)
/* 550F8 00154FF8 10000426 */  addiu      $4, $16, 0x10
/* 550FC 00154FFC 282E2072 */  paddub     $5, $17, $0
/* 55100 00155000 0C86040C */  jal        sceVu0CopyVector
/* 55104 00155004 00000000 */   nop
/* 55108 00155008 30004426 */  addiu      $4, $18, 0x30
/* 5510C 0015500C 282E2072 */  paddub     $5, $17, $0
/* 55110 00155010 0C86040C */  jal        sceVu0CopyVector
/* 55114 00155014 00000000 */   nop
/* 55118 00155018 040000AE */  sw         $0, 0x4($16)
.L0015501C:
/* 5511C 0015501C 3000BF7B */  lq         $31, 0x30($sp)
/* 55120 00155020 2000B27B */  lq         $18, 0x20($sp)
/* 55124 00155024 1000B17B */  lq         $17, 0x10($sp)
/* 55128 00155028 0000B07B */  lq         $16, 0x0($sp)
/* 5512C 0015502C 4000BD27 */  addiu      $sp, $sp, 0x40
/* 55130 00155030 0800E003 */  jr         $31
/* 55134 00155034 00000000 */   nop
/* 55138 00155038 00000000 */  nop
/* 5513C 0015503C 00000000 */  nop
