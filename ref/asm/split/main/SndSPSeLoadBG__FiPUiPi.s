.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndSPSeLoadBG__FiPUiPi
/* 05B860 0015B760 40FFBD27 */  addiu       $29, $29, -0xC0
/* 05B864 0015B764 3000BF7F */  sq          $31, 0x30($29)
/* 05B868 0015B768 2000B27F */  sq          $18, 0x20($29)
/* 05B86C 0015B76C 1000B17F */  sq          $17, 0x10($29)
/* 05B870 0015B770 0000B07F */  sq          $16, 0x0($29)
/* 05B874 0015B774 28968070 */  paddub      $18, $4, $0
/* 05B878 0015B778 288EA070 */  paddub      $17, $5, $0
/* 05B87C 0015B77C 2886C070 */  paddub      $16, $6, $0
/* 05B880 0015B780 02000012 */  beqz        $16, .L0015B78C
/* 05B884 0015B784 00000000 */   nop
/* 05B888 0015B788 000000AE */  sw          $0, 0x0($16)
.L0015B78C:
/* 05B88C 0015B78C 28264072 */  paddub      $4, $18, $0
/* 05B890 0015B790 4000A527 */  addiu       $5, $29, 0x40
/* 05B894 0015B794 D001023C */  lui         $2, %hi(sp_cfg_file)
/* 05B898 0015B798 F0B44624 */  addiu       $6, $2, %lo(sp_cfg_file)
/* 05B89C 0015B79C 7C6D050C */  jal         GetSPSeFile__FiPcPc
/* 05B8A0 0015B7A0 00000000 */   nop
/* 05B8A4 0015B7A4 4000A427 */  addiu       $4, $29, 0x40
/* 05B8A8 0015B7A8 282E2072 */  paddub      $5, $17, $0
/* 05B8AC 0015B7AC 28360072 */  paddub      $6, $16, $0
/* 05B8B0 0015B7B0 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 05B8B4 0015B7B4 00000000 */   nop
/* 05B8B8 0015B7B8 06004010 */  beqz        $2, .L0015B7D4
/* 05B8BC 0015B7BC 00000000 */   nop
/* 05B8C0 0015B7C0 508E92AF */  sw          $18, -0x71B0($28)
/* 05B8C4 0015B7C4 548E91AF */  sw          $17, -0x71AC($28)
/* 05B8C8 0015B7C8 01000224 */  addiu       $2, $0, 0x1
/* 05B8CC 0015B7CC 02000010 */  b           .L0015B7D8
/* 05B8D0 0015B7D0 00000000 */   nop
.L0015B7D4:
/* 05B8D4 0015B7D4 28160070 */  paddub      $2, $0, $0
.L0015B7D8:
/* 05B8D8 0015B7D8 3000BF7B */  lq          $31, 0x30($29)
/* 05B8DC 0015B7DC 2000B27B */  lq          $18, 0x20($29)
/* 05B8E0 0015B7E0 1000B17B */  lq          $17, 0x10($29)
/* 05B8E4 0015B7E4 0000B07B */  lq          $16, 0x0($29)
/* 05B8E8 0015B7E8 C000BD27 */  addiu       $29, $29, 0xC0
/* 05B8EC 0015B7EC 0800E003 */  jr          $31
/* 05B8F0 0015B7F0 00000000 */   nop
/* 05B8F4 0015B7F4 00000000 */  nop
/* 05B8F8 0015B7F8 00000000 */  nop
/* 05B8FC 0015B7FC 00000000 */  nop
