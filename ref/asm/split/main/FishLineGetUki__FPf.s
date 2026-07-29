.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishLineGetUki__FPf
/* 0AA280 001AA180 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0AA284 001AA184 0000BF7F */  sq          $31, 0x0($29)
/* 0AA288 001AA188 D501023C */  lui         $2, %hi(point + 0x120)
/* 0AA28C 001AA18C 505F4524 */  addiu       $5, $2, %lo(point + 0x120)
/* 0AA290 001AA190 0C86040C */  jal         sceVu0CopyVector
/* 0AA294 001AA194 00000000 */   nop
/* 0AA298 001AA198 0000BF7B */  lq          $31, 0x0($29)
/* 0AA29C 001AA19C 1000BD27 */  addiu       $29, $29, 0x10
/* 0AA2A0 001AA1A0 0800E003 */  jr          $31
/* 0AA2A4 001AA1A4 00000000 */   nop
/* 0AA2A8 001AA1A8 00000000 */  nop
/* 0AA2AC 001AA1AC 00000000 */  nop
