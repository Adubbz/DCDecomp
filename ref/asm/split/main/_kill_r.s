.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _kill_r
/* 005070 00104F70 D0FFBD27 */  addiu       $29, $29, -0x30
/* 005074 00104F74 0000B0FF */  sd          $16, 0x0($29)
/* 005078 00104F78 1000B1FF */  sd          $17, 0x10($29)
/* 00507C 00104F7C 2D808000 */  daddu       $16, $4, $0
/* 005080 00104F80 2D20A000 */  daddu       $4, $5, $0
/* 005084 00104F84 DB01113C */  lui         $17, %hi(errno)
/* 005088 00104F88 2000BFFF */  sd          $31, 0x20($29)
/* 00508C 00104F8C 2D28C000 */  daddu       $5, $6, $0
/* 005090 00104F90 9252040C */  jal         kill
/* 005094 00104F94 94BC20AE */   sw         $0, %lo(errno)($17)
/* 005098 00104F98 2D184000 */  daddu       $3, $2, $0
/* 00509C 00104F9C FFFF0224 */  addiu       $2, $0, -0x1
/* 0050A0 00104FA0 05006214 */  bne         $3, $2, .L00104FB8
/* 0050A4 00104FA4 2000BFDF */   ld         $31, 0x20($29)
/* 0050A8 00104FA8 94BC228E */  lw          $2, %lo(errno)($17)
/* 0050AC 00104FAC 02004054 */  bnel        $2, $0, .L00104FB8
/* 0050B0 00104FB0 000002AE */   sw         $2, 0x0($16)
/* 0050B4 00104FB4 2000BFDF */  ld          $31, 0x20($29)
.L00104FB8:
/* 0050B8 00104FB8 2D106000 */  daddu       $2, $3, $0
/* 0050BC 00104FBC 1000B1DF */  ld          $17, 0x10($29)
/* 0050C0 00104FC0 0000B0DF */  ld          $16, 0x0($29)
/* 0050C4 00104FC4 0800E003 */  jr          $31
/* 0050C8 00104FC8 3000BD27 */   addiu      $29, $29, 0x30
/* 0050CC 00104FCC 00000000 */  nop
