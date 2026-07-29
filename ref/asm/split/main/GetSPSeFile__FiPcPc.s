.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetSPSeFile__FiPcPc
/* 05B6F0 0015B5F0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 05B6F4 0015B5F4 2000BF7F */  sq          $31, 0x20($29)
/* 05B6F8 0015B5F8 1000B17F */  sq          $17, 0x10($29)
/* 05B6FC 0015B5FC 0000B07F */  sq          $16, 0x0($29)
/* 05B700 0015B600 281E8070 */  paddub      $3, $4, $0
/* 05B704 0015B604 288EA070 */  paddub      $17, $5, $0
/* 05B708 0015B608 2886C070 */  paddub      $16, $6, $0
/* 05B70C 0015B60C 3000A427 */  addiu       $4, $29, 0x30
/* 05B710 0015B610 2A00023C */  lui         $2, %hi(LIT_751)
/* 05B714 0015B614 F89F4524 */  addiu       $5, $2, %lo(LIT_751)
/* 05B718 0015B618 28366070 */  paddub      $6, $3, $0
/* 05B71C 0015B61C 1614040C */  jal         sprintf
/* 05B720 0015B620 00000000 */   nop
/* 05B724 0015B624 28262072 */  paddub      $4, $17, $0
/* 05B728 0015B628 2A00023C */  lui         $2, %hi(LIT_752)
/* 05B72C 0015B62C 00A04524 */  addiu       $5, $2, %lo(LIT_752)
/* 05B730 0015B630 3000A627 */  addiu       $6, $29, 0x30
/* 05B734 0015B634 1614040C */  jal         sprintf
/* 05B738 0015B638 00000000 */   nop
/* 05B73C 0015B63C 28260072 */  paddub      $4, $16, $0
/* 05B740 0015B640 2A00023C */  lui         $2, %hi(LIT_350)
/* 05B744 0015B644 789F4524 */  addiu       $5, $2, %lo(LIT_350)
/* 05B748 0015B648 3000A627 */  addiu       $6, $29, 0x30
/* 05B74C 0015B64C 1614040C */  jal         sprintf
/* 05B750 0015B650 00000000 */   nop
/* 05B754 0015B654 2000BF7B */  lq          $31, 0x20($29)
/* 05B758 0015B658 1000B17B */  lq          $17, 0x10($29)
/* 05B75C 0015B65C 0000B07B */  lq          $16, 0x0($29)
/* 05B760 0015B660 4000BD27 */  addiu       $29, $29, 0x40
/* 05B764 0015B664 0800E003 */  jr          $31
/* 05B768 0015B668 00000000 */   nop
/* 05B76C 0015B66C 00000000 */  nop
