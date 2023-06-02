.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdGetError
/* B7F8 0010B6F8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* B7FC 0010B6FC 03000424 */  addiu      $4, $0, 0x3
/* B800 0010B700 2000BFFF */  sd         $31, 0x20($sp)
/* B804 0010B704 A82B040C */  jal        scmd_prechk
/* B808 0010B708 1000B0FF */   sd        $16, 0x10($sp)
/* B80C 0010B70C 03004014 */  bnez       $2, .L0010B71C
/* B810 0010B710 2A00023C */   lui       $2, %hi(D_002A4940)
/* B814 0010B714 1A000010 */  b          .L0010B780
/* B818 0010B718 FFFF0224 */   addiu     $2, $0, -0x1
.L0010B71C:
/* B81C 0010B71C 2A00043C */  lui        $4, %hi(D_002A4D60)
/* B820 0010B720 40495024 */  addiu      $16, $2, %lo(D_002A4940)
/* B824 0010B724 604D8424 */  addiu      $4, $4, %lo(D_002A4D60)
/* B828 0010B728 0000A0AF */  sw         $0, 0x0($sp)
/* B82C 0010B72C 04000524 */  addiu      $5, $0, 0x4
/* B830 0010B730 2D300000 */  daddu      $6, $0, $0
/* B834 0010B734 2D380000 */  daddu      $7, $0, $0
/* B838 0010B738 2D400000 */  daddu      $8, $0, $0
/* B83C 0010B73C 2D480002 */  daddu      $9, $16, $0
/* B840 0010B740 04000A24 */  addiu      $10, $0, 0x4
/* B844 0010B744 2A5D040C */  jal        sceSifCallRpc
/* B848 0010B748 2D580000 */   daddu     $11, $0, $0
/* B84C 0010B74C 06004104 */  bgez       $2, .L0010B768
/* B850 0010B750 2500023C */   lui       $2, (0x250284 >> 16)
/* B854 0010B754 8402448C */  lw         $4, (0x250284 & 0xFFFF)($2)
/* B858 0010B758 D050040C */  jal        SignalSema
/* B85C 0010B75C 00000000 */   nop
/* B860 0010B760 07000010 */  b          .L0010B780
/* B864 0010B764 FFFF0224 */   addiu     $2, $0, -0x1
.L0010B768:
/* B868 0010B768 8402448C */  lw         $4, (0x250284 & 0xFFFF)($2)
/* B86C 0010B76C D050040C */  jal        SignalSema
/* B870 0010B770 00000000 */   nop
/* B874 0010B774 0020033C */  lui        $3, (0x20000000 >> 16)
/* B878 0010B778 25180302 */  or         $3, $16, $3
/* B87C 0010B77C 0000628C */  lw         $2, (0x20000000 & 0xFFFF)($3)
.L0010B780:
/* B880 0010B780 2000BFDF */  ld         $31, 0x20($sp)
/* B884 0010B784 1000B0DF */  ld         $16, 0x10($sp)
/* B888 0010B788 0800E003 */  jr         $31
/* B88C 0010B78C 3000BD27 */   addiu     $sp, $sp, 0x30
