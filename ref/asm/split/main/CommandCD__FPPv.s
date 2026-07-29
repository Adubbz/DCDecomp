.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandCD__FPPv
/* 0742A0 001741A0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0742A4 001741A4 0000BF7F */  sq          $31, 0x0($29)
/* 0742A8 001741A8 0000858C */  lw          $5, 0x0($4)
/* 0742AC 001741AC D201023C */  lui         $2, %hi(CurrentDir__3)
/* 0742B0 001741B0 F09A4424 */  addiu       $4, $2, %lo(CurrentDir__3)
/* 0742B4 001741B4 5A15040C */  jal         strcpy
/* 0742B8 001741B8 00000000 */   nop
/* 0742BC 001741BC 0000BF7B */  lq          $31, 0x0($29)
/* 0742C0 001741C0 1000BD27 */  addiu       $29, $29, 0x10
/* 0742C4 001741C4 0800E003 */  jr          $31
/* 0742C8 001741C8 00000000 */   nop
/* 0742CC 001741CC 00000000 */  nop
