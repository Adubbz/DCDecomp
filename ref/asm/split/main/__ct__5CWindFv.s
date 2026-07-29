.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__5CWindFv
/* 03B6E0 0013B5E0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 03B6E4 0013B5E4 1000BF7F */  sq          $31, 0x10($29)
/* 03B6E8 0013B5E8 0000B07F */  sq          $16, 0x0($29)
/* 03B6EC 0013B5EC 28868070 */  paddub      $16, $4, $0
/* 03B6F0 0013B5F0 200080AC */  sw          $0, 0x20($4)
/* 03B6F4 0013B5F4 BE11040C */  jal         rand
/* 03B6F8 0013B5F8 00000000 */   nop
/* 03B6FC 0013B5FC 00008244 */  mtc1        $2, $f0
/* 03B700 0013B600 00000000 */  nop
/* 03B704 0013B604 60008046 */  cvt.s.w     $f1, $f0
/* 03B708 0013B608 004F023C */  lui         $2, (0x4F000000 >> 16)
/* 03B70C 0013B60C 00008244 */  mtc1        $2, $f0
/* 03B710 0013B610 00000000 */  nop
/* 03B714 0013B614 03080046 */  div.s       $f0, $f1, $f0
/* 03B718 0013B618 000000E6 */  swc1        $f0, 0x0($16)
/* 03B71C 0013B61C 28160072 */  paddub      $2, $16, $0
/* 03B720 0013B620 1000BF7B */  lq          $31, 0x10($29)
/* 03B724 0013B624 0000B07B */  lq          $16, 0x0($29)
/* 03B728 0013B628 2000BD27 */  addiu       $29, $29, 0x20
/* 03B72C 0013B62C 0800E003 */  jr          $31
/* 03B730 0013B630 00000000 */   nop
/* 03B734 0013B634 00000000 */  nop
/* 03B738 0013B638 00000000 */  nop
/* 03B73C 0013B63C 00000000 */  nop
