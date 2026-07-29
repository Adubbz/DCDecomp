.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetSeNo__6CSoundFii
/* 043C70 00143B70 28160070 */  paddub      $2, $0, $0
/* 043C74 00143B74 0F000010 */  b           .L00143BB4
/* 043C78 00143B78 00000000 */   nop
.L00143B7C:
/* 043C7C 00143B7C 80200200 */  sll         $4, $2, 2
/* 043C80 00143B80 CF01033C */  lui         $3, %hi(se_inf_tbl)
/* 043C84 00143B84 509F6324 */  addiu       $3, $3, %lo(se_inf_tbl)
/* 043C88 00143B88 21186400 */  addu        $3, $3, $4
/* 043C8C 00143B8C 00006380 */  lb          $3, 0x0($3)
/* 043C90 00143B90 0700A314 */  bne         $5, $3, .L00143BB0
/* 043C94 00143B94 00000000 */   nop
/* 043C98 00143B98 CF01033C */  lui         $3, %hi(se_inf_tbl + 0x1)
/* 043C9C 00143B9C 519F6324 */  addiu       $3, $3, %lo(se_inf_tbl + 0x1)
/* 043CA0 00143BA0 21186400 */  addu        $3, $3, $4
/* 043CA4 00143BA4 00006380 */  lb          $3, 0x0($3)
/* 043CA8 00143BA8 0700C310 */  beq         $6, $3, .L00143BC8
/* 043CAC 00143BAC 00000000 */   nop
.L00143BB0:
/* 043CB0 00143BB0 01004224 */  addiu       $2, $2, 0x1
.L00143BB4:
/* 043CB4 00143BB4 CF01013C */  lui         $1, %hi(se_inf_tbl + 0x2EE0)
/* 043CB8 00143BB8 30CE278C */  lw          $7, %lo(se_inf_tbl + 0x2EE0)($1)
/* 043CBC 00143BBC 2A184700 */  slt         $3, $2, $7
/* 043CC0 00143BC0 EEFF6014 */  bnez        $3, .L00143B7C
/* 043CC4 00143BC4 00000000 */   nop
.L00143BC8:
/* 043CC8 00143BC8 2A084700 */  slt         $1, $2, $7
/* 043CCC 00143BCC 03002010 */  beqz        $1, .L00143BDC
/* 043CD0 00143BD0 00000000 */   nop
/* 043CD4 00143BD4 02000010 */  b           .L00143BE0
/* 043CD8 00143BD8 00000000 */   nop
.L00143BDC:
/* 043CDC 00143BDC FFFF0224 */  addiu       $2, $0, -0x1
.L00143BE0:
/* 043CE0 00143BE0 0800E003 */  jr          $31
/* 043CE4 00143BE4 00000000 */   nop
/* 043CE8 00143BE8 00000000 */  nop
/* 043CEC 00143BEC 00000000 */  nop
