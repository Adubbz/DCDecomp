.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel push_str__10CRunScriptFPc
/* 13DB60 0023DA60 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 13DB64 0023DA64 2000BF7F */  sq         $31, 0x20($sp)
/* 13DB68 0023DA68 1000B17F */  sq         $17, 0x10($sp)
/* 13DB6C 0023DA6C 0000B07F */  sq         $16, 0x0($sp)
/* 13DB70 0023DA70 288E8070 */  paddub     $17, $4, $0
/* 13DB74 0023DA74 2886A070 */  paddub     $16, $5, $0
/* 13DB78 0023DA78 60F6080C */  jal        check_stack__10CRunScriptFv
/* 13DB7C 0023DA7C 00000000 */   nop
/* 13DB80 0023DA80 02000424 */  addiu      $4, $0, 0x2
/* 13DB84 0023DA84 1000238E */  lw         $3, 0x10($17)
/* 13DB88 0023DA88 000064AC */  sw         $4, 0x0($3)
/* 13DB8C 0023DA8C 1000248E */  lw         $4, 0x10($17)
/* 13DB90 0023DA90 08008324 */  addiu      $3, $4, 0x8
/* 13DB94 0023DA94 100023AE */  sw         $3, 0x10($17)
/* 13DB98 0023DA98 040090AC */  sw         $16, 0x4($4)
/* 13DB9C 0023DA9C 2000BF7B */  lq         $31, 0x20($sp)
/* 13DBA0 0023DAA0 1000B17B */  lq         $17, 0x10($sp)
/* 13DBA4 0023DAA4 0000B07B */  lq         $16, 0x0($sp)
/* 13DBA8 0023DAA8 3000BD27 */  addiu      $sp, $sp, 0x30
/* 13DBAC 0023DAAC 0800E003 */  jr         $31
/* 13DBB0 0023DAB0 00000000 */   nop
/* 13DBB4 0023DAB4 00000000 */  nop
/* 13DBB8 0023DAB8 00000000 */  nop
/* 13DBBC 0023DABC 00000000 */  nop
