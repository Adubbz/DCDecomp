.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetLXf__8CGamePadFv
/* 2B810 0012B710 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2B814 0012B714 0000BF7F */  sq         $31, 0x0($sp)
/* 2B818 0012B718 C4AC040C */  jal        GetLX__8CGamePadFv
/* 2B81C 0012B71C 00000000 */   nop
/* 2B820 0012B720 00008244 */  mtc1       $2, $f0
/* 2B824 0012B724 00000000 */  nop
/* 2B828 0012B728 60008046 */  cvt.s.w    $f1, $f0
/* 2B82C 0012B72C 0043023C */  lui        $2, (0x43000000 >> 16)
/* 2B830 0012B730 00008244 */  mtc1       $2, $f0
/* 2B834 0012B734 00000000 */  nop
/* 2B838 0012B738 03080046 */  div.s      $f0, $f1, $f0
/* 2B83C 0012B73C 0000BF7B */  lq         $31, 0x0($sp)
/* 2B840 0012B740 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2B844 0012B744 0800E003 */  jr         $31
/* 2B848 0012B748 00000000 */   nop
/* 2B84C 0012B74C 00000000 */  nop
