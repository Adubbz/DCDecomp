.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdInitGotoInterior__FP13ED_EVENT_INFOP14ED_EVENT_PARAM
/* 6D8F0 0016D7F0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 6D8F4 0016D7F4 2000BF7F */  sq         $31, 0x20($sp)
/* 6D8F8 0016D7F8 1000B17F */  sq         $17, 0x10($sp)
/* 6D8FC 0016D7FC 0000B07F */  sq         $16, 0x0($sp)
/* 6D900 0016D800 288E8070 */  paddub     $17, $4, $0
/* 6D904 0016D804 2886A070 */  paddub     $16, $5, $0
/* 6D908 0016D808 C0032426 */  addiu      $4, $17, 0x3C0
/* 6D90C 0016D80C 10000526 */  addiu      $5, $16, 0x10
/* 6D910 0016D810 0C86040C */  jal        sceVu0CopyVector
/* 6D914 0016D814 00000000 */   nop
/* 6D918 0016D818 D0032426 */  addiu      $4, $17, 0x3D0
/* 6D91C 0016D81C 30000526 */  addiu      $5, $16, 0x30
/* 6D920 0016D820 0C86040C */  jal        sceVu0CopyVector
/* 6D924 0016D824 00000000 */   nop
/* 6D928 0016D828 E0032426 */  addiu      $4, $17, 0x3E0
/* 6D92C 0016D82C 20000526 */  addiu      $5, $16, 0x20
/* 6D930 0016D830 0C86040C */  jal        sceVu0CopyVector
/* 6D934 0016D834 00000000 */   nop
/* 6D938 0016D838 5000028E */  lw         $2, 0x50($16)
/* 6D93C 0016D83C 2400428C */  lw         $2, 0x24($2)
/* 6D940 0016D840 2000BF7B */  lq         $31, 0x20($sp)
/* 6D944 0016D844 1000B17B */  lq         $17, 0x10($sp)
/* 6D948 0016D848 0000B07B */  lq         $16, 0x0($sp)
/* 6D94C 0016D84C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 6D950 0016D850 0800E003 */  jr         $31
/* 6D954 0016D854 00000000 */   nop
/* 6D958 0016D858 00000000 */  nop
/* 6D95C 0016D85C 00000000 */  nop
