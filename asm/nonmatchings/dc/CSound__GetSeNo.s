.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetSeNo__6CSoundFii
/* 43C70 00143B70 28160070 */  paddub     $2, $0, $0
/* 43C74 00143B74 0F000010 */  b          .L00143BB4
/* 43C78 00143B78 00000000 */   nop
.L00143B7C:
/* 43C7C 00143B7C 80200200 */  sll        $4, $2, 2
/* 43C80 00143B80 CF01033C */  lui        $3, %hi(se_inf_tbl)
/* 43C84 00143B84 509F6324 */  addiu      $3, $3, %lo(se_inf_tbl)
/* 43C88 00143B88 21186400 */  addu       $3, $3, $4
/* 43C8C 00143B8C 00006380 */  lb         $3, 0x0($3)
/* 43C90 00143B90 0700A314 */  bne        $5, $3, .L00143BB0
/* 43C94 00143B94 00000000 */   nop
/* 43C98 00143B98 CF01033C */  lui        $3, %hi(D_1CE9F51)
/* 43C9C 00143B9C 519F6324 */  addiu      $3, $3, %lo(D_1CE9F51)
/* 43CA0 00143BA0 21186400 */  addu       $3, $3, $4
/* 43CA4 00143BA4 00006380 */  lb         $3, 0x0($3)
/* 43CA8 00143BA8 0700C310 */  beq        $6, $3, .L00143BC8
/* 43CAC 00143BAC 00000000 */   nop
.L00143BB0:
/* 43CB0 00143BB0 01004224 */  addiu      $2, $2, 0x1
.L00143BB4:
/* 43CB4 00143BB4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 43CB8 00143BB8 30CE278C */  lw         $7, -0x31D0($at)
/* 43CBC 00143BBC 2A184700 */  slt        $3, $2, $7
/* 43CC0 00143BC0 EEFF6014 */  bnez       $3, .L00143B7C
/* 43CC4 00143BC4 00000000 */   nop
.L00143BC8:
/* 43CC8 00143BC8 2A084700 */  slt        $at, $2, $7
/* 43CCC 00143BCC 03002010 */  beqz       $at, .L00143BDC
/* 43CD0 00143BD0 00000000 */   nop
/* 43CD4 00143BD4 02000010 */  b          .L00143BE0
/* 43CD8 00143BD8 00000000 */   nop
.L00143BDC:
/* 43CDC 00143BDC FFFF0224 */  addiu      $2, $0, -0x1
.L00143BE0:
/* 43CE0 00143BE0 0800E003 */  jr         $31
/* 43CE4 00143BE4 00000000 */   nop
/* 43CE8 00143BE8 00000000 */  nop
/* 43CEC 00143BEC 00000000 */  nop
