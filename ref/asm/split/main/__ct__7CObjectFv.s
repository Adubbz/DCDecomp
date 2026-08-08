.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__7CObjectFv
/* 043750 00143650 F0FFBD27 */  addiu       $29, $29, -0x10
/* 043754 00143654 0000BF7F */  sq          $31, 0x0($29)
/* 043758 00143658 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 04375C 0014365C 00608244 */  mtc1        $2, $f12
/* 043760 00143660 045C050C */  jal         __ct__7CObjectFf
/* 043764 00143664 00000000 */   nop
/* 043768 00143668 0000BF7B */  lq          $31, 0x0($29)
/* 04376C 0014366C 1000BD27 */  addiu       $29, $29, 0x10
/* 043770 00143670 0800E003 */  jr          $31
/* 043774 00143674 00000000 */   nop
/* 043778 00143678 00000000 */  nop
/* 04377C 0014367C 00000000 */  nop
