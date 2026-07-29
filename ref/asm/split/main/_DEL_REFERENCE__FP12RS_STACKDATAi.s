.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _DEL_REFERENCE__FP12RS_STACKDATAi
/* 0E6730 001E6630 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0E6734 001E6634 0000BF7F */  sq          $31, 0x0($29)
/* 0E6738 001E6638 9085070C */  jal         GetStackInt__FP12RS_STACKDATA__3
/* 0E673C 001E663C 00000000 */   nop
/* 0E6740 001E6640 E09C848F */  lw          $4, -0x6320($28)
/* 0E6744 001E6644 10350324 */  addiu       $3, $0, 0x3510
/* 0E6748 001E6648 18104300 */  mult        $2, $2, $3
/* 0E674C 001E664C 21104400 */  addu        $2, $2, $4
/* 0E6750 001E6650 0200013C */  lui         $1, (0x20000 >> 16)
/* 0E6754 001E6654 21084100 */  addu        $1, $2, $1
/* 0E6758 001E6658 8CFD248C */  lw          $4, -0x274($1)
/* 0E675C 001E665C 04008014 */  bnez        $4, .L001E6670
/* 0E6760 001E6660 00000000 */   nop
/* 0E6764 001E6664 01000224 */  addiu       $2, $0, 0x1
/* 0E6768 001E6668 04000010 */  b           .L001E667C
/* 0E676C 001E666C 00000000 */   nop
.L001E6670:
/* 0E6770 001E6670 68A0040C */  jal         DeleteReference__6CFrameFv
/* 0E6774 001E6674 00000000 */   nop
/* 0E6778 001E6678 01000224 */  addiu       $2, $0, 0x1
.L001E667C:
/* 0E677C 001E667C 0000BF7B */  lq          $31, 0x0($29)
/* 0E6780 001E6680 1000BD27 */  addiu       $29, $29, 0x10
/* 0E6784 001E6684 0800E003 */  jr          $31
/* 0E6788 001E6688 00000000 */   nop
/* 0E678C 001E668C 00000000 */  nop
