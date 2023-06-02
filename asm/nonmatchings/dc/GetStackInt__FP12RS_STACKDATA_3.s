.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetStackInt__FP12RS_STACKDATA_3
/* E1740 001E1640 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E1744 001E1644 0000BF7F */  sq         $31, 0x0($sp)
/* E1748 001E1648 0000838C */  lw         $3, 0x0($4)
/* E174C 001E164C 01000224 */  addiu      $2, $0, 0x1
/* E1750 001E1650 06006214 */  bne        $3, $2, .L001E166C
/* E1754 001E1654 00000000 */   nop
/* E1758 001E1658 04008CC4 */  lwc1       $f12, 0x4($4)
/* E175C 001E165C 2C44040C */  jal        fptosi
/* E1760 001E1660 00000000 */   nop
/* E1764 001E1664 03000010 */  b          .L001E1674
/* E1768 001E1668 00000000 */   nop
.L001E166C:
/* E176C 001E166C 0400828C */  lw         $2, 0x4($4)
/* E1770 001E1670 00000000 */  nop
.L001E1674:
/* E1774 001E1674 0000BF7B */  lq         $31, 0x0($sp)
/* E1778 001E1678 1000BD27 */  addiu      $sp, $sp, 0x10
/* E177C 001E167C 0800E003 */  jr         $31
/* E1780 001E1680 00000000 */   nop
/* E1784 001E1684 00000000 */  nop
/* E1788 001E1688 00000000 */  nop
/* E178C 001E168C 00000000 */  nop
