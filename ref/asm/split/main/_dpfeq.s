.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _dpfeq
/* 0001C0 001000C0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0001C4 001000C4 0000BF7F */  sq          $31, 0x0($29)
/* 0001C8 001000C8 E840040C */  jal         dpcmp
/* 0001CC 001000CC 00000000 */   nop
/* 0001D0 001000D0 0000BF7B */  lq          $31, 0x0($29)
/* 0001D4 001000D4 26104000 */  xor         $2, $2, $0
/* 0001D8 001000D8 0100422C */  sltiu       $2, $2, 0x1
/* 0001DC 001000DC 0800E003 */  jr          $31
/* 0001E0 001000E0 1000BD27 */   addiu      $29, $29, 0x10
/* 0001E4 001000E4 00000000 */  nop
/* 0001E8 001000E8 00000000 */  nop
/* 0001EC 001000EC 00000000 */  nop
