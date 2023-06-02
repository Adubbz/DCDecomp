.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingBattleToAngleFish__FPUiP14CDataAlloc2_1_
/* A9810 001A9710 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* A9814 001A9714 0000BF7F */  sq         $31, 0x0($sp)
/* A9818 001A9718 28368070 */  paddub     $6, $4, $0
/* A981C 001A971C 283EA070 */  paddub     $7, $5, $0
/* A9820 001A9720 7093838F */  lw         $3, -0x6C90($gp)
/* A9824 001A9724 6C9383AF */  sw         $3, -0x6C94($gp)
/* A9828 001A9728 709380AF */  sw         $0, -0x6C90($gp)
/* A982C 001A972C 6C93838F */  lw         $3, -0x6C94($gp)
/* A9830 001A9730 15006010 */  beqz       $3, .L001A9788
/* A9834 001A9734 00000000 */   nop
/* A9838 001A9738 0D00C010 */  beqz       $6, .L001A9770
/* A983C 001A973C 00000000 */   nop
/* A9840 001A9740 50126424 */  addiu      $4, $3, 0x1250
/* A9844 001A9744 6093828F */  lw         $2, -0x6CA0($gp)
/* A9848 001A9748 01004824 */  addiu      $8, $2, 0x1
/* A984C 001A974C 282EC070 */  paddub     $5, $6, $0
/* A9850 001A9750 2A00023C */  lui        $2, %hi(_578_3)
/* A9854 001A9754 B0B44624 */  addiu      $6, $2, %lo(_578_3)
/* A9858 001A9758 284EE070 */  paddub     $9, $7, $0
/* A985C 001A975C 28560070 */  paddub     $10, $0, $0
/* A9860 001A9760 F012798C */  lw         $25, 0x12F0($3)
/* A9864 001A9764 BC00398F */  lw         $25, 0xBC($25)
/* A9868 001A9768 09F82003 */  jalr       $25
/* A986C 001A976C 00000000 */   nop
.L001A9770:
/* A9870 001A9770 6C93848F */  lw         $4, -0x6C94($gp)
/* A9874 001A9774 4803090C */  jal        SetAngleMode__5CFishFv
/* A9878 001A9778 00000000 */   nop
/* A987C 001A977C 6C93848F */  lw         $4, -0x6C94($gp)
/* A9880 001A9780 01000324 */  addiu      $3, $0, 0x1
/* A9884 001A9784 5C0083AC */  sw         $3, 0x5C($4)
.L001A9788:
/* A9888 001A9788 0000BF7B */  lq         $31, 0x0($sp)
/* A988C 001A978C 1000BD27 */  addiu      $sp, $sp, 0x10
/* A9890 001A9790 0800E003 */  jr         $31
/* A9894 001A9794 00000000 */   nop
/* A9898 001A9798 00000000 */  nop
/* A989C 001A979C 00000000 */  nop
