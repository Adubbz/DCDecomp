.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__13CVisualMDTVu1Fv
/* 35070 00134F70 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 35074 00134F74 1000BF7F */  sq         $31, 0x10($sp)
/* 35078 00134F78 0000B07F */  sq         $16, 0x0($sp)
/* 3507C 00134F7C 28868070 */  paddub     $16, $4, $0
/* 35080 00134F80 B0D3040C */  jal        Initialize__10CVisualVu1Fv
/* 35084 00134F84 00000000 */   nop
/* 35088 00134F88 240000AE */  sw         $0, 0x24($16)
/* 3508C 00134F8C 200000AE */  sw         $0, 0x20($16)
/* 35090 00134F90 2C0000AE */  sw         $0, 0x2C($16)
/* 35094 00134F94 280000AE */  sw         $0, 0x28($16)
/* 35098 00134F98 1000BF7B */  lq         $31, 0x10($sp)
/* 3509C 00134F9C 0000B07B */  lq         $16, 0x0($sp)
/* 350A0 00134FA0 2000BD27 */  addiu      $sp, $sp, 0x20
/* 350A4 00134FA4 0800E003 */  jr         $31
/* 350A8 00134FA8 00000000 */   nop
/* 350AC 00134FAC 00000000 */  nop
