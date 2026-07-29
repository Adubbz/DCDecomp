.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndSoundSyncBG__Fv
/* 05A730 0015A630 F0FFBD27 */  addiu       $29, $29, -0x10
/* 05A734 0015A634 0000BF7F */  sq          $31, 0x0($29)
/* 05A738 0015A638 408E828F */  lw          $2, -0x71C0($28)
/* 05A73C 0015A63C 04004004 */  bltz        $2, .L0015A650
/* 05A740 0015A640 00000000 */   nop
/* 05A744 0015A644 448E828F */  lw          $2, -0x71BC($28)
/* 05A748 0015A648 04004014 */  bnez        $2, .L0015A65C
/* 05A74C 0015A64C 00000000 */   nop
.L0015A650:
/* 05A750 0015A650 28160070 */  paddub      $2, $0, $0
/* 05A754 0015A654 12000010 */  b           .L0015A6A0
/* 05A758 0015A658 00000000 */   nop
.L0015A65C:
/* 05A75C 0015A65C 8CFB040C */  jal         ReadBGSync__Fv
/* 05A760 0015A660 00000000 */   nop
/* 05A764 0015A664 04004010 */  beqz        $2, .L0015A678
/* 05A768 0015A668 00000000 */   nop
/* 05A76C 0015A66C 01000224 */  addiu       $2, $0, 0x1
/* 05A770 0015A670 0B000010 */  b           .L0015A6A0
/* 05A774 0015A674 00000000 */   nop
.L0015A678:
/* 05A778 0015A678 408E848F */  lw          $4, -0x71C0($28)
/* 05A77C 0015A67C 448E858F */  lw          $5, -0x71BC($28)
/* 05A780 0015A680 D001023C */  lui         $2, %hi(snd_cfg_file)
/* 05A784 0015A684 B0B44624 */  addiu       $6, $2, %lo(snd_cfg_file)
/* 05A788 0015A688 B068050C */  jal         SetSoundFile__FiPUiPc
/* 05A78C 0015A68C 00000000 */   nop
/* 05A790 0015A690 FFFF0224 */  addiu       $2, $0, -0x1
/* 05A794 0015A694 408E82AF */  sw          $2, -0x71C0($28)
/* 05A798 0015A698 448E80AF */  sw          $0, -0x71BC($28)
/* 05A79C 0015A69C 28160070 */  paddub      $2, $0, $0
.L0015A6A0:
/* 05A7A0 0015A6A0 0000BF7B */  lq          $31, 0x0($29)
/* 05A7A4 0015A6A4 1000BD27 */  addiu       $29, $29, 0x10
/* 05A7A8 0015A6A8 0800E003 */  jr          $31
/* 05A7AC 0015A6AC 00000000 */   nop
