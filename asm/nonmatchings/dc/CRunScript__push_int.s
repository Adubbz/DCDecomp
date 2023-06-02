.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel push_int__10CRunScriptFi
/* 13DB10 0023DA10 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 13DB14 0023DA14 2000BF7F */  sq         $31, 0x20($sp)
/* 13DB18 0023DA18 1000B17F */  sq         $17, 0x10($sp)
/* 13DB1C 0023DA1C 0000B07F */  sq         $16, 0x0($sp)
/* 13DB20 0023DA20 288E8070 */  paddub     $17, $4, $0
/* 13DB24 0023DA24 2886A070 */  paddub     $16, $5, $0
/* 13DB28 0023DA28 60F6080C */  jal        check_stack__10CRunScriptFv
/* 13DB2C 0023DA2C 00000000 */   nop
/* 13DB30 0023DA30 1000238E */  lw         $3, 0x10($17)
/* 13DB34 0023DA34 000060AC */  sw         $0, 0x0($3)
/* 13DB38 0023DA38 1000248E */  lw         $4, 0x10($17)
/* 13DB3C 0023DA3C 08008324 */  addiu      $3, $4, 0x8
/* 13DB40 0023DA40 100023AE */  sw         $3, 0x10($17)
/* 13DB44 0023DA44 040090AC */  sw         $16, 0x4($4)
/* 13DB48 0023DA48 2000BF7B */  lq         $31, 0x20($sp)
/* 13DB4C 0023DA4C 1000B17B */  lq         $17, 0x10($sp)
/* 13DB50 0023DA50 0000B07B */  lq         $16, 0x0($sp)
/* 13DB54 0023DA54 3000BD27 */  addiu      $sp, $sp, 0x30
/* 13DB58 0023DA58 0800E003 */  jr         $31
/* 13DB5C 0023DA5C 00000000 */   nop
