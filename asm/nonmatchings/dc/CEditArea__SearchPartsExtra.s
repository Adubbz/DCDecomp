.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SearchPartsExtra__9CEditAreaFfff
/* 6ED40 0016EC40 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 6ED44 0016EC44 1000BF7F */  sq         $31, 0x10($sp)
/* 6ED48 0016EC48 0000B07F */  sq         $16, 0x0($sp)
/* 6ED4C 0016EC4C 28868070 */  paddub     $16, $4, $0
/* 6ED50 0016EC50 2000A527 */  addiu      $5, $sp, 0x20
/* 6ED54 0016EC54 20B6050C */  jal        GetPos__9CEditAreaFP11CVector3_i_fff
/* 6ED58 0016EC58 00000000 */   nop
/* 6ED5C 0016EC5C 28260072 */  paddub     $4, $16, $0
/* 6ED60 0016EC60 2000A58F */  lw         $5, 0x20($sp)
/* 6ED64 0016EC64 2800A68F */  lw         $6, 0x28($sp)
/* 6ED68 0016EC68 A4B7050C */  jal        GetPartsExtra__9CEditAreaFii
/* 6ED6C 0016EC6C 00000000 */   nop
/* 6ED70 0016EC70 1000BF7B */  lq         $31, 0x10($sp)
/* 6ED74 0016EC74 0000B07B */  lq         $16, 0x0($sp)
/* 6ED78 0016EC78 3000BD27 */  addiu      $sp, $sp, 0x30
/* 6ED7C 0016EC7C 0800E003 */  jr         $31
/* 6ED80 0016EC80 00000000 */   nop
/* 6ED84 0016EC84 00000000 */  nop
/* 6ED88 0016EC88 00000000 */  nop
/* 6ED8C 0016EC8C 00000000 */  nop
