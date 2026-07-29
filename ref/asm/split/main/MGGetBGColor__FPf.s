.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MGGetBGColor__FPf
/* 02E340 0012E240 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02E344 0012E244 0000BF7F */  sq          $31, 0x0($29)
/* 02E348 0012E248 C701023C */  lui         $2, %hi(mgBackColor)
/* 02E34C 0012E24C 00554524 */  addiu       $5, $2, %lo(mgBackColor)
/* 02E350 0012E250 0C86040C */  jal         sceVu0CopyVector
/* 02E354 0012E254 00000000 */   nop
/* 02E358 0012E258 0000BF7B */  lq          $31, 0x0($29)
/* 02E35C 0012E25C 1000BD27 */  addiu       $29, $29, 0x10
/* 02E360 0012E260 0800E003 */  jr          $31
/* 02E364 0012E264 00000000 */   nop
/* 02E368 0012E268 00000000 */  nop
/* 02E36C 0012E26C 00000000 */  nop
