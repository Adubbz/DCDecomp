.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_ATRA__FP12RS_STACKDATAi
/* 0BC980 001BC880 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0BC984 001BC884 0000BF7F */  sq          $31, 0x0($29)
/* 0BC988 001BC888 08008324 */  addiu       $3, $4, 0x8
/* 0BC98C 001BC88C 60EE060C */  jal         GetStackFloat__FP12RS_STACKDATA__2
/* 0BC990 001BC890 00000000 */   nop
/* 0BC994 001BC894 1000A0E7 */  swc1        $f0, 0x10($29)
/* 0BC998 001BC898 28266070 */  paddub      $4, $3, $0
/* 0BC99C 001BC89C 08008324 */  addiu       $3, $4, 0x8
/* 0BC9A0 001BC8A0 60EE060C */  jal         GetStackFloat__FP12RS_STACKDATA__2
/* 0BC9A4 001BC8A4 00000000 */   nop
/* 0BC9A8 001BC8A8 1400A0E7 */  swc1        $f0, 0x14($29)
/* 0BC9AC 001BC8AC 28266070 */  paddub      $4, $3, $0
/* 0BC9B0 001BC8B0 08008324 */  addiu       $3, $4, 0x8
/* 0BC9B4 001BC8B4 60EE060C */  jal         GetStackFloat__FP12RS_STACKDATA__2
/* 0BC9B8 001BC8B8 00000000 */   nop
/* 0BC9BC 001BC8BC 1800A0E7 */  swc1        $f0, 0x18($29)
/* 0BC9C0 001BC8C0 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0BC9C4 001BC8C4 1C00A2AF */  sw          $2, 0x1C($29)
/* 0BC9C8 001BC8C8 28266070 */  paddub      $4, $3, $0
/* 0BC9CC 001BC8CC 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BC9D0 001BC8D0 00000000 */   nop
/* 0BC9D4 001BC8D4 C89C848F */  lw          $4, -0x6338($28)
/* 0BC9D8 001BC8D8 1000A527 */  addiu       $5, $29, 0x10
/* 0BC9DC 001BC8DC 28364070 */  paddub      $6, $2, $0
/* 0BC9E0 001BC8E0 2020070C */  jal         SetAtraBoll__11CDungeonMapFPfi
/* 0BC9E4 001BC8E4 00000000 */   nop
/* 0BC9E8 001BC8E8 01000224 */  addiu       $2, $0, 0x1
/* 0BC9EC 001BC8EC 0000BF7B */  lq          $31, 0x0($29)
/* 0BC9F0 001BC8F0 2000BD27 */  addiu       $29, $29, 0x20
/* 0BC9F4 001BC8F4 0800E003 */  jr          $31
/* 0BC9F8 001BC8F8 00000000 */   nop
/* 0BC9FC 001BC8FC 00000000 */  nop
