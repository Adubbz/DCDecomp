.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _DEL_REFERENCE__FP12RS_STACKDATAi
/* E6730 001E6630 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* E6734 001E6634 0000BF7F */  sq         $31, 0x0($sp)
/* E6738 001E6638 9085070C */  jal        GetStackInt__FP12RS_STACKDATA_3
/* E673C 001E663C 00000000 */   nop
/* E6740 001E6640 E09C848F */  lw         $4, -0x6320($gp)
/* E6744 001E6644 10350324 */  addiu      $3, $0, 0x3510
/* E6748 001E6648 18104300 */  mult       $2, $2, $3
/* E674C 001E664C 21104400 */  addu       $2, $2, $4
/* E6750 001E6650 0200013C */  lui        $at, (0x20000 >> 16)
/* E6754 001E6654 21084100 */  addu       $at, $2, $at
/* E6758 001E6658 8CFD248C */  lw         $4, -0x274($at)
/* E675C 001E665C 04008014 */  bnez       $4, .L001E6670
/* E6760 001E6660 00000000 */   nop
/* E6764 001E6664 01000224 */  addiu      $2, $0, 0x1
/* E6768 001E6668 04000010 */  b          .L001E667C
/* E676C 001E666C 00000000 */   nop
.L001E6670:
/* E6770 001E6670 68A0040C */  jal        DeleteReference__6CFrameFv
/* E6774 001E6674 00000000 */   nop
/* E6778 001E6678 01000224 */  addiu      $2, $0, 0x1
.L001E667C:
/* E677C 001E667C 0000BF7B */  lq         $31, 0x0($sp)
/* E6780 001E6680 1000BD27 */  addiu      $sp, $sp, 0x10
/* E6784 001E6684 0800E003 */  jr         $31
/* E6788 001E6688 00000000 */   nop
/* E678C 001E668C 00000000 */  nop
