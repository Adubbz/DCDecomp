.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SearchPTS__FPUii
/* 03E6C0 0013E5C0 04008014 */  bnez        $4, .L0013E5D4
/* 03E6C4 0013E5C4 00000000 */   nop
/* 03E6C8 0013E5C8 28160070 */  paddub      $2, $0, $0
/* 03E6CC 0013E5CC 0E000010 */  b           .L0013E608
/* 03E6D0 0013E5D0 00000000 */   nop
.L0013E5D4:
/* 03E6D4 0013E5D4 0400828C */  lw          $2, 0x4($4)
/* 03E6D8 0013E5D8 2A10A200 */  slt         $2, $5, $2
/* 03E6DC 0013E5DC 04004014 */  bnez        $2, .L0013E5F0
/* 03E6E0 0013E5E0 00000000 */   nop
/* 03E6E4 0013E5E4 28160070 */  paddub      $2, $0, $0
/* 03E6E8 0013E5E8 07000010 */  b           .L0013E608
/* 03E6EC 0013E5EC 00000000 */   nop
.L0013E5F0:
/* 03E6F0 0013E5F0 40100500 */  sll         $2, $5, 1
/* 03E6F4 0013E5F4 21104500 */  addu        $2, $2, $5
/* 03E6F8 0013E5F8 00110200 */  sll         $2, $2, 4
/* 03E6FC 0013E5FC 21108200 */  addu        $2, $4, $2
/* 03E700 0013E600 2000428C */  lw          $2, 0x20($2)
/* 03E704 0013E604 21108200 */  addu        $2, $4, $2
.L0013E608:
/* 03E708 0013E608 0800E003 */  jr          $31
/* 03E70C 0013E60C 00000000 */   nop
