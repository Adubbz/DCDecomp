.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdInitGotoInterior__FP13ED_EVENT_INFOP14ED_EVENT_PARAM
/* 06D8F0 0016D7F0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 06D8F4 0016D7F4 2000BF7F */  sq          $31, 0x20($29)
/* 06D8F8 0016D7F8 1000B17F */  sq          $17, 0x10($29)
/* 06D8FC 0016D7FC 0000B07F */  sq          $16, 0x0($29)
/* 06D900 0016D800 288E8070 */  paddub      $17, $4, $0
/* 06D904 0016D804 2886A070 */  paddub      $16, $5, $0
/* 06D908 0016D808 C0032426 */  addiu       $4, $17, 0x3C0
/* 06D90C 0016D80C 10000526 */  addiu       $5, $16, 0x10
/* 06D910 0016D810 0C86040C */  jal         sceVu0CopyVector
/* 06D914 0016D814 00000000 */   nop
/* 06D918 0016D818 D0032426 */  addiu       $4, $17, 0x3D0
/* 06D91C 0016D81C 30000526 */  addiu       $5, $16, 0x30
/* 06D920 0016D820 0C86040C */  jal         sceVu0CopyVector
/* 06D924 0016D824 00000000 */   nop
/* 06D928 0016D828 E0032426 */  addiu       $4, $17, 0x3E0
/* 06D92C 0016D82C 20000526 */  addiu       $5, $16, 0x20
/* 06D930 0016D830 0C86040C */  jal         sceVu0CopyVector
/* 06D934 0016D834 00000000 */   nop
/* 06D938 0016D838 5000028E */  lw          $2, 0x50($16)
/* 06D93C 0016D83C 2400428C */  lw          $2, 0x24($2)
/* 06D940 0016D840 2000BF7B */  lq          $31, 0x20($29)
/* 06D944 0016D844 1000B17B */  lq          $17, 0x10($29)
/* 06D948 0016D848 0000B07B */  lq          $16, 0x0($29)
/* 06D94C 0016D84C 3000BD27 */  addiu       $29, $29, 0x30
/* 06D950 0016D850 0800E003 */  jr          $31
/* 06D954 0016D854 00000000 */   nop
/* 06D958 0016D858 00000000 */  nop
/* 06D95C 0016D85C 00000000 */  nop
