.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetLXf__8CGamePadFv
/* 02B810 0012B710 F0FFBD27 */  addiu       $29, $29, -0x10
/* 02B814 0012B714 0000BF7F */  sq          $31, 0x0($29)
/* 02B818 0012B718 C4AC040C */  jal         GetLX__8CGamePadFv
/* 02B81C 0012B71C 00000000 */   nop
/* 02B820 0012B720 00008244 */  mtc1        $2, $f0
/* 02B824 0012B724 00000000 */  nop
/* 02B828 0012B728 60008046 */  cvt.s.w     $f1, $f0
/* 02B82C 0012B72C 0043023C */  lui         $2, (0x43000000 >> 16)
/* 02B830 0012B730 00008244 */  mtc1        $2, $f0
/* 02B834 0012B734 00000000 */  nop
/* 02B838 0012B738 03080046 */  div.s       $f0, $f1, $f0
/* 02B83C 0012B73C 0000BF7B */  lq          $31, 0x0($29)
/* 02B840 0012B740 1000BD27 */  addiu       $29, $29, 0x10
/* 02B844 0012B744 0800E003 */  jr          $31
/* 02B848 0012B748 00000000 */   nop
/* 02B84C 0012B74C 00000000 */  nop
