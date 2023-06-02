.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndSPSeSyncBG__Fv
/* 5B900 0015B800 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 5B904 0015B804 0000BF7F */  sq         $31, 0x0($sp)
/* 5B908 0015B808 508E828F */  lw         $2, -0x71B0($gp)
/* 5B90C 0015B80C 04004004 */  bltz       $2, .L0015B820
/* 5B910 0015B810 00000000 */   nop
/* 5B914 0015B814 548E828F */  lw         $2, -0x71AC($gp)
/* 5B918 0015B818 04004014 */  bnez       $2, .L0015B82C
/* 5B91C 0015B81C 00000000 */   nop
.L0015B820:
/* 5B920 0015B820 28160070 */  paddub     $2, $0, $0
/* 5B924 0015B824 12000010 */  b          .L0015B870
/* 5B928 0015B828 00000000 */   nop
.L0015B82C:
/* 5B92C 0015B82C 8CFB040C */  jal        ReadBGSync__Fv
/* 5B930 0015B830 00000000 */   nop
/* 5B934 0015B834 04004010 */  beqz       $2, .L0015B848
/* 5B938 0015B838 00000000 */   nop
/* 5B93C 0015B83C 01000224 */  addiu      $2, $0, 0x1
/* 5B940 0015B840 0B000010 */  b          .L0015B870
/* 5B944 0015B844 00000000 */   nop
.L0015B848:
/* 5B948 0015B848 508E848F */  lw         $4, -0x71B0($gp)
/* 5B94C 0015B84C 548E858F */  lw         $5, -0x71AC($gp)
/* 5B950 0015B850 D001023C */  lui        $2, %hi(sp_cfg_file)
/* 5B954 0015B854 F0B44624 */  addiu      $6, $2, %lo(sp_cfg_file)
/* 5B958 0015B858 9C6D050C */  jal        SetSPSeFile__FiPUiPc
/* 5B95C 0015B85C 00000000 */   nop
/* 5B960 0015B860 FFFF0224 */  addiu      $2, $0, -0x1
/* 5B964 0015B864 508E82AF */  sw         $2, -0x71B0($gp)
/* 5B968 0015B868 548E80AF */  sw         $0, -0x71AC($gp)
/* 5B96C 0015B86C 28160070 */  paddub     $2, $0, $0
.L0015B870:
/* 5B970 0015B870 0000BF7B */  lq         $31, 0x0($sp)
/* 5B974 0015B874 1000BD27 */  addiu      $sp, $sp, 0x10
/* 5B978 0015B878 0800E003 */  jr         $31
/* 5B97C 0015B87C 00000000 */   nop
