.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetScrPosFromChar__FP10CCharacterPi
/* 04CA80 0014C980 B0FFBD27 */  addiu       $29, $29, -0x50
/* 04CA84 0014C984 2000BF7F */  sq          $31, 0x20($29)
/* 04CA88 0014C988 1000B17F */  sq          $17, 0x10($29)
/* 04CA8C 0014C98C 0000B07F */  sq          $16, 0x0($29)
/* 04CA90 0014C990 288E8070 */  paddub      $17, $4, $0
/* 04CA94 0014C994 2886A070 */  paddub      $16, $5, $0
/* 04CA98 0014C998 3000A527 */  addiu       $5, $29, 0x30
/* 04CA9C 0014C99C A000398E */  lw          $25, 0xA0($17)
/* 04CAA0 0014C9A0 A000398F */  lw          $25, 0xA0($25)
/* 04CAA4 0014C9A4 09F82003 */  jalr        $25
/* 04CAA8 0014C9A8 00000000 */   nop
/* 04CAAC 0014C9AC 708181C7 */  lwc1        $f1, -0x7E90($28)
/* 04CAB0 0014C9B0 B40020C6 */  lwc1        $f0, 0xB4($17)
/* 04CAB4 0014C9B4 42080046 */  mul.s       $f1, $f1, $f0
/* 04CAB8 0014C9B8 3400A0C7 */  lwc1        $f0, 0x34($29)
/* 04CABC 0014C9BC 00000146 */  add.s       $f0, $f0, $f1
/* 04CAC0 0014C9C0 3400A0E7 */  swc1        $f0, 0x34($29)
/* 04CAC4 0014C9C4 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 04CAC8 0014C9C8 3C00A2AF */  sw          $2, 0x3C($29)
/* 04CACC 0014C9CC 4000A427 */  addiu       $4, $29, 0x40
/* 04CAD0 0014C9D0 3000A527 */  addiu       $5, $29, 0x30
/* 04CAD4 0014C9D4 28360070 */  paddub      $6, $0, $0
/* 04CAD8 0014C9D8 38B9040C */  jal         MGRotTransPers2D__FPiPfi
/* 04CADC 0014C9DC 00000000 */   nop
/* 04CAE0 0014C9E0 4000A38F */  lw          $3, 0x40($29)
/* 04CAE4 0014C9E4 000003AE */  sw          $3, 0x0($16)
/* 04CAE8 0014C9E8 4400A38F */  lw          $3, 0x44($29)
/* 04CAEC 0014C9EC 040003AE */  sw          $3, 0x4($16)
/* 04CAF0 0014C9F0 2000BF7B */  lq          $31, 0x20($29)
/* 04CAF4 0014C9F4 1000B17B */  lq          $17, 0x10($29)
/* 04CAF8 0014C9F8 0000B07B */  lq          $16, 0x0($29)
/* 04CAFC 0014C9FC 5000BD27 */  addiu       $29, $29, 0x50
/* 04CB00 0014CA00 0800E003 */  jr          $31
/* 04CB04 0014CA04 00000000 */   nop
/* 04CB08 0014CA08 00000000 */  nop
/* 04CB0C 0014CA0C 00000000 */  nop
