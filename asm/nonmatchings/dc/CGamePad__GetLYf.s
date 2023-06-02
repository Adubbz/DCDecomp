.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetLYf__8CGamePadFv
/* 2B850 0012B750 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2B854 0012B754 0000BF7F */  sq         $31, 0x0($sp)
/* 2B858 0012B758 D0AC040C */  jal        GetLY__8CGamePadFv
/* 2B85C 0012B75C 00000000 */   nop
/* 2B860 0012B760 00008244 */  mtc1       $2, $f0
/* 2B864 0012B764 00000000 */  nop
/* 2B868 0012B768 60008046 */  cvt.s.w    $f1, $f0
/* 2B86C 0012B76C 0043023C */  lui        $2, (0x43000000 >> 16)
/* 2B870 0012B770 00008244 */  mtc1       $2, $f0
/* 2B874 0012B774 00000000 */  nop
/* 2B878 0012B778 03080046 */  div.s      $f0, $f1, $f0
/* 2B87C 0012B77C 0000BF7B */  lq         $31, 0x0($sp)
/* 2B880 0012B780 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2B884 0012B784 0800E003 */  jr         $31
/* 2B888 0012B788 00000000 */   nop
/* 2B88C 0012B78C 00000000 */  nop
