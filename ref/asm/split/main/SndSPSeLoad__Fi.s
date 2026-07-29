.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndSPSeLoad__Fi
/* 05B7D0 0015B6D0 40FFBD27 */  addiu       $29, $29, -0xC0
/* 05B7D4 0015B6D4 1000BF7F */  sq          $31, 0x10($29)
/* 05B7D8 0015B6D8 0000B07F */  sq          $16, 0x0($29)
/* 05B7DC 0015B6DC 28868070 */  paddub      $16, $4, $0
/* 05B7E0 0015B6E0 2C8E828F */  lw          $2, -0x71D4($28)
/* 05B7E4 0015B6E4 04005014 */  bne         $2, $16, .L0015B6F8
/* 05B7E8 0015B6E8 00000000 */   nop
/* 05B7EC 0015B6EC 28160070 */  paddub      $2, $0, $0
/* 05B7F0 0015B6F0 16000010 */  b           .L0015B74C
/* 05B7F4 0015B6F4 00000000 */   nop
.L0015B6F8:
/* 05B7F8 0015B6F8 2000A527 */  addiu       $5, $29, 0x20
/* 05B7FC 0015B6FC A000A627 */  addiu       $6, $29, 0xA0
/* 05B800 0015B700 7C6D050C */  jal         GetSPSeFile__FiPcPc
/* 05B804 0015B704 00000000 */   nop
/* 05B808 0015B708 2000A427 */  addiu       $4, $29, 0x20
/* 05B80C 0015B70C F08D858F */  lw          $5, -0x7210($28)
/* 05B810 0015B710 28360070 */  paddub      $6, $0, $0
/* 05B814 0015B714 283E0070 */  paddub      $7, $0, $0
/* 05B818 0015B718 F4FC040C */  jal         LoadFile2__FPcPvPii
/* 05B81C 0015B71C 00000000 */   nop
/* 05B820 0015B720 09004010 */  beqz        $2, .L0015B748
/* 05B824 0015B724 00000000 */   nop
/* 05B828 0015B728 28260072 */  paddub      $4, $16, $0
/* 05B82C 0015B72C F08D858F */  lw          $5, -0x7210($28)
/* 05B830 0015B730 A000A627 */  addiu       $6, $29, 0xA0
/* 05B834 0015B734 9C6D050C */  jal         SetSPSeFile__FiPUiPc
/* 05B838 0015B738 00000000 */   nop
/* 05B83C 0015B73C 01000224 */  addiu       $2, $0, 0x1
/* 05B840 0015B740 02000010 */  b           .L0015B74C
/* 05B844 0015B744 00000000 */   nop
.L0015B748:
/* 05B848 0015B748 28160070 */  paddub      $2, $0, $0
.L0015B74C:
/* 05B84C 0015B74C 1000BF7B */  lq          $31, 0x10($29)
/* 05B850 0015B750 0000B07B */  lq          $16, 0x0($29)
/* 05B854 0015B754 C000BD27 */  addiu       $29, $29, 0xC0
/* 05B858 0015B758 0800E003 */  jr          $31
/* 05B85C 0015B75C 00000000 */   nop
