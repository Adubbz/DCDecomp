.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadCollisionFilePack__FPUiPcP14CDataAlloc2_1_
/* 0B6F00 001B6E00 B0FFBD27 */  addiu       $29, $29, -0x50
/* 0B6F04 001B6E04 3000BF7F */  sq          $31, 0x30($29)
/* 0B6F08 001B6E08 2000B27F */  sq          $18, 0x20($29)
/* 0B6F0C 001B6E0C 1000B17F */  sq          $17, 0x10($29)
/* 0B6F10 001B6E10 0000B07F */  sq          $16, 0x0($29)
/* 0B6F14 001B6E14 2896A070 */  paddub      $18, $5, $0
/* 0B6F18 001B6E18 288EC070 */  paddub      $17, $6, $0
/* 0B6F1C 001B6E1C 4C00A627 */  addiu       $6, $29, 0x4C
/* 0B6F20 001B6E20 C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 0B6F24 001B6E24 00000000 */   nop
/* 0B6F28 001B6E28 28864070 */  paddub      $16, $2, $0
/* 0B6F2C 001B6E2C 09000016 */  bnez        $16, .L001B6E54
/* 0B6F30 001B6E30 00000000 */   nop
/* 0B6F34 001B6E34 2A00023C */  lui         $2, %hi(LIT_879__2)
/* 0B6F38 001B6E38 90BB4424 */  addiu       $4, $2, %lo(LIT_879__2)
/* 0B6F3C 001B6E3C 282E4072 */  paddub      $5, $18, $0
/* 0B6F40 001B6E40 A611040C */  jal         printf
/* 0B6F44 001B6E44 00000000 */   nop
/* 0B6F48 001B6E48 FFFF0424 */  addiu       $4, $0, -0x1
/* 0B6F4C 001B6E4C DC05040C */  jal         exit__2
/* 0B6F50 001B6E50 00000000 */   nop
.L001B6E54:
/* 0B6F54 001B6E54 28260072 */  paddub      $4, $16, $0
/* 0B6F58 001B6E58 282E2072 */  paddub      $5, $17, $0
/* 0B6F5C 001B6E5C DC9B040C */  jal         LoadCollisionFile__FPUiP14CDataAlloc2_1_
/* 0B6F60 001B6E60 00000000 */   nop
/* 0B6F64 001B6E64 3000BF7B */  lq          $31, 0x30($29)
/* 0B6F68 001B6E68 2000B27B */  lq          $18, 0x20($29)
/* 0B6F6C 001B6E6C 1000B17B */  lq          $17, 0x10($29)
/* 0B6F70 001B6E70 0000B07B */  lq          $16, 0x0($29)
/* 0B6F74 001B6E74 5000BD27 */  addiu       $29, $29, 0x50
/* 0B6F78 001B6E78 0800E003 */  jr          $31
/* 0B6F7C 001B6E7C 00000000 */   nop
