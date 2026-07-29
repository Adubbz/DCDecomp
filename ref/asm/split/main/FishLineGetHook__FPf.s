.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishLineGetHook__FPf
/* 0AA2B0 001AA1B0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0AA2B4 001AA1B4 0000BF7F */  sq          $31, 0x0($29)
/* 0AA2B8 001AA1B8 D501023C */  lui         $2, %hi(point + 0x170)
/* 0AA2BC 001AA1BC A05F4524 */  addiu       $5, $2, %lo(point + 0x170)
/* 0AA2C0 001AA1C0 0C86040C */  jal         sceVu0CopyVector
/* 0AA2C4 001AA1C4 00000000 */   nop
/* 0AA2C8 001AA1C8 0000BF7B */  lq          $31, 0x0($29)
/* 0AA2CC 001AA1CC 1000BD27 */  addiu       $29, $29, 0x10
/* 0AA2D0 001AA1D0 0800E003 */  jr          $31
/* 0AA2D4 001AA1D4 00000000 */   nop
/* 0AA2D8 001AA1D8 00000000 */  nop
/* 0AA2DC 001AA1DC 00000000 */  nop
