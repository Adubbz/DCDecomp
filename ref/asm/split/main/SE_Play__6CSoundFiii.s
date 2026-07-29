.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SE_Play__6CSoundFiii
/* 0458C0 001457C0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0458C4 001457C4 0000BF7F */  sq          $31, 0x0($29)
/* 0458C8 001457C8 285EE070 */  paddub      $11, $7, $0
/* 0458CC 001457CC 80180600 */  sll         $3, $6, 2
/* 0458D0 001457D0 CF01023C */  lui         $2, %hi(se_inf_tbl)
/* 0458D4 001457D4 509F4224 */  addiu       $2, $2, %lo(se_inf_tbl)
/* 0458D8 001457D8 21104300 */  addu        $2, $2, $3
/* 0458DC 001457DC 00004680 */  lb          $6, 0x0($2)
/* 0458E0 001457E0 CF01023C */  lui         $2, %hi(se_inf_tbl + 0x1)
/* 0458E4 001457E4 519F4224 */  addiu       $2, $2, %lo(se_inf_tbl + 0x1)
/* 0458E8 001457E8 21104300 */  addu        $2, $2, $3
/* 0458EC 001457EC 00004780 */  lb          $7, 0x0($2)
/* 0458F0 001457F0 CF01023C */  lui         $2, %hi(se_inf_tbl + 0x2)
/* 0458F4 001457F4 529F4224 */  addiu       $2, $2, %lo(se_inf_tbl + 0x2)
/* 0458F8 001457F8 21104300 */  addu        $2, $2, $3
/* 0458FC 001457FC 00004A84 */  lh          $10, 0x0($2)
/* 045900 00145800 40000824 */  addiu       $8, $0, 0x40
/* 045904 00145804 7F000924 */  addiu       $9, $0, 0x7F
/* 045908 00145808 7C15050C */  jal         SE_Play__6CSoundFiiiiiii
/* 04590C 0014580C 00000000 */   nop
/* 045910 00145810 0000BF7B */  lq          $31, 0x0($29)
/* 045914 00145814 1000BD27 */  addiu       $29, $29, 0x10
/* 045918 00145818 0800E003 */  jr          $31
/* 04591C 0014581C 00000000 */   nop
