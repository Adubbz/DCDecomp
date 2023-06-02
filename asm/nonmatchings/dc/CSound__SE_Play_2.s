.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SE_Play__6CSoundFiii
/* 458C0 001457C0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 458C4 001457C4 0000BF7F */  sq         $31, 0x0($sp)
/* 458C8 001457C8 285EE070 */  paddub     $11, $7, $0
/* 458CC 001457CC 80180600 */  sll        $3, $6, 2
/* 458D0 001457D0 CF01023C */  lui        $2, %hi(se_inf_tbl)
/* 458D4 001457D4 509F4224 */  addiu      $2, $2, %lo(se_inf_tbl)
/* 458D8 001457D8 21104300 */  addu       $2, $2, $3
/* 458DC 001457DC 00004680 */  lb         $6, 0x0($2)
/* 458E0 001457E0 CF01023C */  lui        $2, %hi(D_1CE9F51)
/* 458E4 001457E4 519F4224 */  addiu      $2, $2, %lo(D_1CE9F51)
/* 458E8 001457E8 21104300 */  addu       $2, $2, $3
/* 458EC 001457EC 00004780 */  lb         $7, 0x0($2)
/* 458F0 001457F0 CF01023C */  lui        $2, %hi(D_1CE9F52)
/* 458F4 001457F4 529F4224 */  addiu      $2, $2, %lo(D_1CE9F52)
/* 458F8 001457F8 21104300 */  addu       $2, $2, $3
/* 458FC 001457FC 00004A84 */  lh         $10, 0x0($2)
/* 45900 00145800 40000824 */  addiu      $8, $0, 0x40
/* 45904 00145804 7F000924 */  addiu      $9, $0, 0x7F
/* 45908 00145808 7C15050C */  jal        SE_Play__6CSoundFiiiiiii
/* 4590C 0014580C 00000000 */   nop
/* 45910 00145810 0000BF7B */  lq         $31, 0x0($sp)
/* 45914 00145814 1000BD27 */  addiu      $sp, $sp, 0x10
/* 45918 00145818 0800E003 */  jr         $31
/* 4591C 0014581C 00000000 */   nop
