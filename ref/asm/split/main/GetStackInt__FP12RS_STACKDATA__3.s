.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetStackInt__FP12RS_STACKDATA__3
/* 0E1740 001E1640 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E1744 001E1644 0000BF7F */  sq          $31, 0x0($29)
/* 0E1748 001E1648 0000838C */  lw          $3, 0x0($4)
/* 0E174C 001E164C 01000224 */  addiu       $2, $0, 0x1
/* 0E1750 001E1650 06006214 */  bne         $3, $2, .L001E166C
/* 0E1754 001E1654 00000000 */   nop
/* 0E1758 001E1658 04008CC4 */  lwc1        $f12, 0x4($4)
/* 0E175C 001E165C 2C44040C */  jal         fptosi
/* 0E1760 001E1660 00000000 */   nop
/* 0E1764 001E1664 03000010 */  b           .L001E1674
/* 0E1768 001E1668 00000000 */   nop
.L001E166C:
/* 0E176C 001E166C 0400828C */  lw          $2, 0x4($4)
/* 0E1770 001E1670 00000000 */  nop
.L001E1674:
/* 0E1774 001E1674 0000BF7B */  lq          $31, 0x0($29)
/* 0E1778 001E1678 1000BD27 */  addiu       $29, $29, 0x10
/* 0E177C 001E167C 0800E003 */  jr          $31
/* 0E1780 001E1680 00000000 */   nop
/* 0E1784 001E1684 00000000 */  nop
/* 0E1788 001E1688 00000000 */  nop
/* 0E178C 001E168C 00000000 */  nop
