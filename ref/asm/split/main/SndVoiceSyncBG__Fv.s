.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndVoiceSyncBG__Fv
/* 05B630 0015B530 F0FFBD27 */  addiu       $29, $29, -0x10
/* 05B634 0015B534 0000BF7F */  sq          $31, 0x0($29)
/* 05B638 0015B538 488E828F */  lw          $2, -0x71B8($28)
/* 05B63C 0015B53C 04004004 */  bltz        $2, .L0015B550
/* 05B640 0015B540 00000000 */   nop
/* 05B644 0015B544 4C8E828F */  lw          $2, -0x71B4($28)
/* 05B648 0015B548 04004014 */  bnez        $2, .L0015B55C
/* 05B64C 0015B54C 00000000 */   nop
.L0015B550:
/* 05B650 0015B550 28160070 */  paddub      $2, $0, $0
/* 05B654 0015B554 12000010 */  b           .L0015B5A0
/* 05B658 0015B558 00000000 */   nop
.L0015B55C:
/* 05B65C 0015B55C 8CFB040C */  jal         ReadBGSync__Fv
/* 05B660 0015B560 00000000 */   nop
/* 05B664 0015B564 04004010 */  beqz        $2, .L0015B578
/* 05B668 0015B568 00000000 */   nop
/* 05B66C 0015B56C 01000224 */  addiu       $2, $0, 0x1
/* 05B670 0015B570 0B000010 */  b           .L0015B5A0
/* 05B674 0015B574 00000000 */   nop
.L0015B578:
/* 05B678 0015B578 488E848F */  lw          $4, -0x71B8($28)
/* 05B67C 0015B57C 4C8E858F */  lw          $5, -0x71B4($28)
/* 05B680 0015B580 D001023C */  lui         $2, %hi(voice_cfg_file)
/* 05B684 0015B584 D0B44624 */  addiu       $6, $2, %lo(voice_cfg_file)
/* 05B688 0015B588 E46C050C */  jal         SetVoiceFile__FiPUiPc
/* 05B68C 0015B58C 00000000 */   nop
/* 05B690 0015B590 FFFF0224 */  addiu       $2, $0, -0x1
/* 05B694 0015B594 488E82AF */  sw          $2, -0x71B8($28)
/* 05B698 0015B598 4C8E80AF */  sw          $0, -0x71B4($28)
/* 05B69C 0015B59C 28160070 */  paddub      $2, $0, $0
.L0015B5A0:
/* 05B6A0 0015B5A0 0000BF7B */  lq          $31, 0x0($29)
/* 05B6A4 0015B5A4 1000BD27 */  addiu       $29, $29, 0x10
/* 05B6A8 0015B5A8 0800E003 */  jr          $31
/* 05B6AC 0015B5AC 00000000 */   nop
