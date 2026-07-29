.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndVoiceLoadBG__FiPUiPi
/* 05B580 0015B480 40FFBD27 */  addiu       $29, $29, -0xC0
/* 05B584 0015B484 3000BF7F */  sq          $31, 0x30($29)
/* 05B588 0015B488 2000B27F */  sq          $18, 0x20($29)
/* 05B58C 0015B48C 1000B17F */  sq          $17, 0x10($29)
/* 05B590 0015B490 0000B07F */  sq          $16, 0x0($29)
/* 05B594 0015B494 28968070 */  paddub      $18, $4, $0
/* 05B598 0015B498 288EA070 */  paddub      $17, $5, $0
/* 05B59C 0015B49C 2886C070 */  paddub      $16, $6, $0
/* 05B5A0 0015B4A0 02000012 */  beqz        $16, .L0015B4AC
/* 05B5A4 0015B4A4 00000000 */   nop
/* 05B5A8 0015B4A8 000000AE */  sw          $0, 0x0($16)
.L0015B4AC:
/* 05B5AC 0015B4AC 008E828F */  lw          $2, -0x7200($28)
/* 05B5B0 0015B4B0 04005214 */  bne         $2, $18, .L0015B4C4
/* 05B5B4 0015B4B4 00000000 */   nop
/* 05B5B8 0015B4B8 28160070 */  paddub      $2, $0, $0
/* 05B5BC 0015B4BC 14000010 */  b           .L0015B510
/* 05B5C0 0015B4C0 00000000 */   nop
.L0015B4C4:
/* 05B5C4 0015B4C4 28264072 */  paddub      $4, $18, $0
/* 05B5C8 0015B4C8 4000A527 */  addiu       $5, $29, 0x40
/* 05B5CC 0015B4CC D001023C */  lui         $2, %hi(voice_cfg_file)
/* 05B5D0 0015B4D0 D0B44624 */  addiu       $6, $2, %lo(voice_cfg_file)
/* 05B5D4 0015B4D4 C46C050C */  jal         GetVoiceFile__FiPcPc
/* 05B5D8 0015B4D8 00000000 */   nop
/* 05B5DC 0015B4DC 4000A427 */  addiu       $4, $29, 0x40
/* 05B5E0 0015B4E0 282E2072 */  paddub      $5, $17, $0
/* 05B5E4 0015B4E4 28360072 */  paddub      $6, $16, $0
/* 05B5E8 0015B4E8 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 05B5EC 0015B4EC 00000000 */   nop
/* 05B5F0 0015B4F0 06004010 */  beqz        $2, .L0015B50C
/* 05B5F4 0015B4F4 00000000 */   nop
/* 05B5F8 0015B4F8 488E92AF */  sw          $18, -0x71B8($28)
/* 05B5FC 0015B4FC 4C8E91AF */  sw          $17, -0x71B4($28)
/* 05B600 0015B500 01000224 */  addiu       $2, $0, 0x1
/* 05B604 0015B504 02000010 */  b           .L0015B510
/* 05B608 0015B508 00000000 */   nop
.L0015B50C:
/* 05B60C 0015B50C 28160070 */  paddub      $2, $0, $0
.L0015B510:
/* 05B610 0015B510 3000BF7B */  lq          $31, 0x30($29)
/* 05B614 0015B514 2000B27B */  lq          $18, 0x20($29)
/* 05B618 0015B518 1000B17B */  lq          $17, 0x10($29)
/* 05B61C 0015B51C 0000B07B */  lq          $16, 0x0($29)
/* 05B620 0015B520 C000BD27 */  addiu       $29, $29, 0xC0
/* 05B624 0015B524 0800E003 */  jr          $31
/* 05B628 0015B528 00000000 */   nop
/* 05B62C 0015B52C 00000000 */  nop
