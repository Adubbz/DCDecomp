.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _dpfne
/* 0001F0 001000F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0001F4 001000F4 0000BF7F */  sq          $31, 0x0($29)
/* 0001F8 001000F8 E840040C */  jal         dpcmp
/* 0001FC 001000FC 00000000 */   nop
/* 000200 00100100 0000BF7B */  lq          $31, 0x0($29)
/* 000204 00100104 2B100200 */  sltu        $2, $0, $2
/* 000208 00100108 0800E003 */  jr          $31
/* 00020C 0010010C 1000BD27 */   addiu      $29, $29, 0x10
