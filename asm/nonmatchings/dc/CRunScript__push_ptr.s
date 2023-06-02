.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel push_ptr__10CRunScriptFP12RS_STACKDATA
/* 13DBC0 0023DAC0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 13DBC4 0023DAC4 2000BF7F */  sq         $31, 0x20($sp)
/* 13DBC8 0023DAC8 1000B17F */  sq         $17, 0x10($sp)
/* 13DBCC 0023DACC 0000B07F */  sq         $16, 0x0($sp)
/* 13DBD0 0023DAD0 288E8070 */  paddub     $17, $4, $0
/* 13DBD4 0023DAD4 2886A070 */  paddub     $16, $5, $0
/* 13DBD8 0023DAD8 60F6080C */  jal        check_stack__10CRunScriptFv
/* 13DBDC 0023DADC 00000000 */   nop
/* 13DBE0 0023DAE0 03000424 */  addiu      $4, $0, 0x3
/* 13DBE4 0023DAE4 1000238E */  lw         $3, 0x10($17)
/* 13DBE8 0023DAE8 000064AC */  sw         $4, 0x0($3)
/* 13DBEC 0023DAEC 1000248E */  lw         $4, 0x10($17)
/* 13DBF0 0023DAF0 08008324 */  addiu      $3, $4, 0x8
/* 13DBF4 0023DAF4 100023AE */  sw         $3, 0x10($17)
/* 13DBF8 0023DAF8 040090AC */  sw         $16, 0x4($4)
/* 13DBFC 0023DAFC 2000BF7B */  lq         $31, 0x20($sp)
/* 13DC00 0023DB00 1000B17B */  lq         $17, 0x10($sp)
/* 13DC04 0023DB04 0000B07B */  lq         $16, 0x0($sp)
/* 13DC08 0023DB08 3000BD27 */  addiu      $sp, $sp, 0x30
/* 13DC0C 0023DB0C 0800E003 */  jr         $31
/* 13DC10 0023DB10 00000000 */   nop
/* 13DC14 0023DB14 00000000 */  nop
/* 13DC18 0023DB18 00000000 */  nop
/* 13DC1C 0023DB1C 00000000 */  nop
