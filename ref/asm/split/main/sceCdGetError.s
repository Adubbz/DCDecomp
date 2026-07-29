.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdGetError
/* 00B7F8 0010B6F8 D0FFBD27 */  addiu       $29, $29, -0x30
/* 00B7FC 0010B6FC 03000424 */  addiu       $4, $0, 0x3
/* 00B800 0010B700 2000BFFF */  sd          $31, 0x20($29)
/* 00B804 0010B704 A82B040C */  jal         scmd_prechk
/* 00B808 0010B708 1000B0FF */   sd         $16, 0x10($29)
/* 00B80C 0010B70C 03004014 */  bnez        $2, .L0010B71C
/* 00B810 0010B710 2A00023C */   lui        $2, %hi(scmdrdata)
/* 00B814 0010B714 1A000010 */  b           .L0010B780
/* 00B818 0010B718 FFFF0224 */   addiu      $2, $0, -0x1
.L0010B71C:
/* 00B81C 0010B71C 2A00043C */  lui         $4, %hi(cdrc)
/* 00B820 0010B720 40495024 */  addiu       $16, $2, %lo(scmdrdata)
/* 00B824 0010B724 604D8424 */  addiu       $4, $4, %lo(cdrc)
/* 00B828 0010B728 0000A0AF */  sw          $0, 0x0($29)
/* 00B82C 0010B72C 04000524 */  addiu       $5, $0, 0x4
/* 00B830 0010B730 2D300000 */  daddu       $6, $0, $0
/* 00B834 0010B734 2D380000 */  daddu       $7, $0, $0
/* 00B838 0010B738 2D400000 */  daddu       $8, $0, $0
/* 00B83C 0010B73C 2D480002 */  daddu       $9, $16, $0
/* 00B840 0010B740 04000A24 */  addiu       $10, $0, 0x4
/* 00B844 0010B744 2A5D040C */  jal         sceSifCallRpc
/* 00B848 0010B748 2D580000 */   daddu      $11, $0, $0
/* 00B84C 0010B74C 06004104 */  bgez        $2, .L0010B768
/* 00B850 0010B750 2500023C */   lui        $2, %hi(scmd_semid)
/* 00B854 0010B754 8402448C */  lw          $4, %lo(scmd_semid)($2)
/* 00B858 0010B758 D050040C */  jal         SignalSema
/* 00B85C 0010B75C 00000000 */   nop
/* 00B860 0010B760 07000010 */  b           .L0010B780
/* 00B864 0010B764 FFFF0224 */   addiu      $2, $0, -0x1
.L0010B768:
/* 00B868 0010B768 8402448C */  lw          $4, %lo(scmd_semid)($2)
/* 00B86C 0010B76C D050040C */  jal         SignalSema
/* 00B870 0010B770 00000000 */   nop
/* 00B874 0010B774 0020033C */  lui         $3, (0x20000000 >> 16)
/* 00B878 0010B778 25180302 */  or          $3, $16, $3
/* 00B87C 0010B77C 0000628C */  lw          $2, (0x20000000 & 0xFFFF)($3)
.L0010B780:
/* 00B880 0010B780 2000BFDF */  ld          $31, 0x20($29)
/* 00B884 0010B784 1000B0DF */  ld          $16, 0x10($29)
/* 00B888 0010B788 0800E003 */  jr          $31
/* 00B88C 0010B78C 3000BD27 */   addiu      $29, $29, 0x30
