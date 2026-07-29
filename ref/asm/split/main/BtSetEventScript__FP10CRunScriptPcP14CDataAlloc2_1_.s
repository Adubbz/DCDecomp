.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtSetEventScript__FP10CRunScriptPcP14CDataAlloc2_1_
/* 0E67F0 001E66F0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 0E67F4 001E66F4 4000BF7F */  sq          $31, 0x40($29)
/* 0E67F8 001E66F8 3000B37F */  sq          $19, 0x30($29)
/* 0E67FC 001E66FC 2000B27F */  sq          $18, 0x20($29)
/* 0E6800 001E6700 1000B17F */  sq          $17, 0x10($29)
/* 0E6804 001E6704 0000B07F */  sq          $16, 0x0($29)
/* 0E6808 001E6708 289E8070 */  paddub      $19, $4, $0
/* 0E680C 001E670C 2896A070 */  paddub      $18, $5, $0
/* 0E6810 001E6710 288EC070 */  paddub      $17, $6, $0
/* 0E6814 001E6714 28262072 */  paddub      $4, $17, $0
/* 0E6818 001E6718 40000524 */  addiu       $5, $0, 0x40
/* 0E681C 001E671C 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0E6820 001E6720 00000000 */   nop
/* 0E6824 001E6724 28864070 */  paddub      $16, $2, $0
/* 0E6828 001E6728 28262072 */  paddub      $4, $17, $0
/* 0E682C 001E672C 80010524 */  addiu       $5, $0, 0x180
/* 0E6830 001E6730 289E040C */  jal         Alloc__14CDataAlloc2_1_Fi
/* 0E6834 001E6734 00000000 */   nop
/* 0E6838 001E6738 28266072 */  paddub      $4, $19, $0
/* 0E683C 001E673C 282E4072 */  paddub      $5, $18, $0
/* 0E6840 001E6740 28360072 */  paddub      $6, $16, $0
/* 0E6844 001E6744 80000724 */  addiu       $7, $0, 0x80
/* 0E6848 001E6748 28464070 */  paddub      $8, $2, $0
/* 0E684C 001E674C 00020924 */  addiu       $9, $0, 0x200
/* 0E6850 001E6750 70F7080C */  jal         load__10CRunScriptFP14RS_PROG_HEADERP12RS_STACKDATAiP11RS_CALLDATAi
/* 0E6854 001E6754 00000000 */   nop
/* 0E6858 001E6758 28266072 */  paddub      $4, $19, $0
/* 0E685C 001E675C D901023C */  lui         $2, %hi(ext_func)
/* 0E6860 001E6760 B0FC4524 */  addiu       $5, $2, %lo(ext_func)
/* 0E6864 001E6764 00010624 */  addiu       $6, $0, 0x100
/* 0E6868 001E6768 8CF7080C */  jal         ext_func__10CRunScriptFPPFP12RS_STACKDATAi_ii
/* 0E686C 001E676C 00000000 */   nop
/* 0E6870 001E6770 01000224 */  addiu       $2, $0, 0x1
/* 0E6874 001E6774 4000BF7B */  lq          $31, 0x40($29)
/* 0E6878 001E6778 3000B37B */  lq          $19, 0x30($29)
/* 0E687C 001E677C 2000B27B */  lq          $18, 0x20($29)
/* 0E6880 001E6780 1000B17B */  lq          $17, 0x10($29)
/* 0E6884 001E6784 0000B07B */  lq          $16, 0x0($29)
/* 0E6888 001E6788 5000BD27 */  addiu       $29, $29, 0x50
/* 0E688C 001E678C 0800E003 */  jr          $31
/* 0E6890 001E6790 00000000 */   nop
/* 0E6894 001E6794 00000000 */  nop
/* 0E6898 001E6798 00000000 */  nop
/* 0E689C 001E679C 00000000 */  nop
