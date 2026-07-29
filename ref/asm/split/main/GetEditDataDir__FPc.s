.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetEditDataDir__FPc
/* 0778D0 001777D0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0778D4 001777D4 0000BF7F */  sq          $31, 0x0($29)
/* 0778D8 001777D8 D201023C */  lui         $2, %hi(EditDataDir)
/* 0778DC 001777DC E0B34524 */  addiu       $5, $2, %lo(EditDataDir)
/* 0778E0 001777E0 5A15040C */  jal         strcpy
/* 0778E4 001777E4 00000000 */   nop
/* 0778E8 001777E8 0000BF7B */  lq          $31, 0x0($29)
/* 0778EC 001777EC 1000BD27 */  addiu       $29, $29, 0x10
/* 0778F0 001777F0 0800E003 */  jr          $31
/* 0778F4 001777F4 00000000 */   nop
/* 0778F8 001777F8 00000000 */  nop
/* 0778FC 001777FC 00000000 */  nop
