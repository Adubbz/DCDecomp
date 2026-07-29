.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel setCameraPassData__FP9CFrameVu1P7CCameraPcPc
/* 0B6F80 001B6E80 70FFBD27 */  addiu       $29, $29, -0x90
/* 0B6F84 001B6E84 4000BF7F */  sq          $31, 0x40($29)
/* 0B6F88 001B6E88 3000B37F */  sq          $19, 0x30($29)
/* 0B6F8C 001B6E8C 2000B27F */  sq          $18, 0x20($29)
/* 0B6F90 001B6E90 1000B17F */  sq          $17, 0x10($29)
/* 0B6F94 001B6E94 0000B07F */  sq          $16, 0x0($29)
/* 0B6F98 001B6E98 289E8070 */  paddub      $19, $4, $0
/* 0B6F9C 001B6E9C 2896A070 */  paddub      $18, $5, $0
/* 0B6FA0 001B6EA0 288EC070 */  paddub      $17, $6, $0
/* 0B6FA4 001B6EA4 282EE070 */  paddub      $5, $7, $0
/* 0B6FA8 001B6EA8 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 0B6FAC 001B6EAC 00000000 */   nop
/* 0B6FB0 001B6EB0 28264070 */  paddub      $4, $2, $0
/* 0B6FB4 001B6EB4 5000A527 */  addiu       $5, $29, 0x50
/* 0B6FB8 001B6EB8 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 0B6FBC 001B6EBC 00000000 */   nop
/* 0B6FC0 001B6EC0 8000B027 */  addiu       $16, $29, 0x80
/* 0B6FC4 001B6EC4 28264072 */  paddub      $4, $18, $0
/* 0B6FC8 001B6EC8 282E0072 */  paddub      $5, $16, $0
/* 0B6FCC 001B6ECC C490040C */  jal         SetRef__7CCameraFPf
/* 0B6FD0 001B6ED0 00000000 */   nop
/* 0B6FD4 001B6ED4 28266072 */  paddub      $4, $19, $0
/* 0B6FD8 001B6ED8 282E2072 */  paddub      $5, $17, $0
/* 0B6FDC 001B6EDC C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 0B6FE0 001B6EE0 00000000 */   nop
/* 0B6FE4 001B6EE4 28264070 */  paddub      $4, $2, $0
/* 0B6FE8 001B6EE8 5000A527 */  addiu       $5, $29, 0x50
/* 0B6FEC 001B6EEC 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 0B6FF0 001B6EF0 00000000 */   nop
/* 0B6FF4 001B6EF4 28264072 */  paddub      $4, $18, $0
/* 0B6FF8 001B6EF8 282E0072 */  paddub      $5, $16, $0
/* 0B6FFC 001B6EFC A490040C */  jal         SetPos__7CCameraFPf
/* 0B7000 001B6F00 00000000 */   nop
/* 0B7004 001B6F04 4000BF7B */  lq          $31, 0x40($29)
/* 0B7008 001B6F08 3000B37B */  lq          $19, 0x30($29)
/* 0B700C 001B6F0C 2000B27B */  lq          $18, 0x20($29)
/* 0B7010 001B6F10 1000B17B */  lq          $17, 0x10($29)
/* 0B7014 001B6F14 0000B07B */  lq          $16, 0x0($29)
/* 0B7018 001B6F18 9000BD27 */  addiu       $29, $29, 0x90
/* 0B701C 001B6F1C 0800E003 */  jr          $31
/* 0B7020 001B6F20 00000000 */   nop
/* 0B7024 001B6F24 00000000 */  nop
/* 0B7028 001B6F28 00000000 */  nop
/* 0B702C 001B6F2C 00000000 */  nop
