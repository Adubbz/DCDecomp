.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtSetEventScript__FP10CRunScriptPcP14CDataAlloc2_1_
/* E67F0 001E66F0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* E67F4 001E66F4 4000BF7F */  sq         $31, 0x40($sp)
/* E67F8 001E66F8 3000B37F */  sq         $19, 0x30($sp)
/* E67FC 001E66FC 2000B27F */  sq         $18, 0x20($sp)
/* E6800 001E6700 1000B17F */  sq         $17, 0x10($sp)
/* E6804 001E6704 0000B07F */  sq         $16, 0x0($sp)
/* E6808 001E6708 289E8070 */  paddub     $19, $4, $0
/* E680C 001E670C 2896A070 */  paddub     $18, $5, $0
/* E6810 001E6710 288EC070 */  paddub     $17, $6, $0
/* E6814 001E6714 28262072 */  paddub     $4, $17, $0
/* E6818 001E6718 40000524 */  addiu      $5, $0, 0x40
/* E681C 001E671C 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* E6820 001E6720 00000000 */   nop
/* E6824 001E6724 28864070 */  paddub     $16, $2, $0
/* E6828 001E6728 28262072 */  paddub     $4, $17, $0
/* E682C 001E672C 80010524 */  addiu      $5, $0, 0x180
/* E6830 001E6730 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* E6834 001E6734 00000000 */   nop
/* E6838 001E6738 28266072 */  paddub     $4, $19, $0
/* E683C 001E673C 282E4072 */  paddub     $5, $18, $0
/* E6840 001E6740 28360072 */  paddub     $6, $16, $0
/* E6844 001E6744 80000724 */  addiu      $7, $0, 0x80
/* E6848 001E6748 28464070 */  paddub     $8, $2, $0
/* E684C 001E674C 00020924 */  addiu      $9, $0, 0x200
/* E6850 001E6750 70F7080C */  jal        load__10CRunScriptFP14RS_PROG_HEADERP12RS_STACKDATAiP11RS_CALLDATAi
/* E6854 001E6754 00000000 */   nop
/* E6858 001E6758 28266072 */  paddub     $4, $19, $0
/* E685C 001E675C D901023C */  lui        $2, %hi(ext_func)
/* E6860 001E6760 B0FC4524 */  addiu      $5, $2, %lo(ext_func)
/* E6864 001E6764 00010624 */  addiu      $6, $0, 0x100
/* E6868 001E6768 8CF7080C */  jal        ext_func__10CRunScriptFPPFP12RS_STACKDATAi_ii
/* E686C 001E676C 00000000 */   nop
/* E6870 001E6770 01000224 */  addiu      $2, $0, 0x1
/* E6874 001E6774 4000BF7B */  lq         $31, 0x40($sp)
/* E6878 001E6778 3000B37B */  lq         $19, 0x30($sp)
/* E687C 001E677C 2000B27B */  lq         $18, 0x20($sp)
/* E6880 001E6780 1000B17B */  lq         $17, 0x10($sp)
/* E6884 001E6784 0000B07B */  lq         $16, 0x0($sp)
/* E6888 001E6788 5000BD27 */  addiu      $sp, $sp, 0x50
/* E688C 001E678C 0800E003 */  jr         $31
/* E6890 001E6790 00000000 */   nop
/* E6894 001E6794 00000000 */  nop
/* E6898 001E6798 00000000 */  nop
/* E689C 001E679C 00000000 */  nop
