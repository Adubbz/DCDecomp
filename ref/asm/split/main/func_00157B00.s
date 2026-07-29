.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel func_00157B00
/* 057C00 00157B00 F0FFBD27 */  addiu       $29, $29, -0x10
/* 057C04 00157B04 0000BF7F */  sq          $31, 0x0($29)
/* 057C08 00157B08 10008424 */  addiu       $4, $4, 0x10
/* 057C0C 00157B0C 0C86040C */  jal         sceVu0CopyVector
/* 057C10 00157B10 00000000 */   nop
/* 057C14 00157B14 0000BF7B */  lq          $31, 0x0($29)
/* 057C18 00157B18 1000BD27 */  addiu       $29, $29, 0x10
/* 057C1C 00157B1C 0800E003 */  jr          $31
/* 057C20 00157B20 00000000 */   nop
/* 057C24 00157B24 00000000 */  nop
/* 057C28 00157B28 00000000 */  nop
/* 057C2C 00157B2C 00000000 */  nop
