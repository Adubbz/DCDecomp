.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel initialize_data__Fv
/* 041180 00141080 F0FFBD27 */  addiu       $29, $29, -0x10
/* 041184 00141084 0000BF7F */  sq          $31, 0x0($29)
/* 041188 00141088 DC03050C */  jal         LoadSystemMessage__Fv
/* 04118C 0014108C 00000000 */   nop
/* 041190 00141090 FFFF0224 */  addiu       $2, $0, -0x1
/* 041194 00141094 F49382AF */  sw          $2, -0x6C0C($28)
/* 041198 00141098 A403050C */  jal         LoadSndTxt__Fv
/* 04119C 0014109C 00000000 */   nop
/* 0411A0 001410A0 0000BF7B */  lq          $31, 0x0($29)
/* 0411A4 001410A4 1000BD27 */  addiu       $29, $29, 0x10
/* 0411A8 001410A8 0800E003 */  jr          $31
/* 0411AC 001410AC 00000000 */   nop
