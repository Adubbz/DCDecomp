.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGSetAmbient__FPf
/* 2DE00 0012DD00 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2DE04 0012DD04 0000BF7F */  sq         $31, 0x0($sp)
/* 2DE08 0012DD08 282E8070 */  paddub     $5, $4, $0
/* 2DE0C 0012DD0C C701023C */  lui        $2, %hi(D_1C756B0)
/* 2DE10 0012DD10 B0564424 */  addiu      $4, $2, %lo(D_1C756B0)
/* 2DE14 0012DD14 0C86040C */  jal        sceVu0CopyVector
/* 2DE18 0012DD18 00000000 */   nop
/* 2DE1C 0012DD1C 0000BF7B */  lq         $31, 0x0($sp)
/* 2DE20 0012DD20 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2DE24 0012DD24 0800E003 */  jr         $31
/* 2DE28 0012DD28 00000000 */   nop
/* 2DE2C 0012DD2C 00000000 */  nop
