.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _FADE_OUT__FP12RS_STACKDATAi
/* 092E20 00192D20 A0FFBD27 */  addiu       $29, $29, -0x60
/* 092E24 00192D24 5000BF7F */  sq          $31, 0x50($29)
/* 092E28 00192D28 4000B47F */  sq          $20, 0x40($29)
/* 092E2C 00192D2C 3000B37F */  sq          $19, 0x30($29)
/* 092E30 00192D30 2000B27F */  sq          $18, 0x20($29)
/* 092E34 00192D34 1000B17F */  sq          $17, 0x10($29)
/* 092E38 00192D38 0000B07F */  sq          $16, 0x0($29)
/* 092E3C 00192D3C 289EA070 */  paddub      $19, $5, $0
/* 092E40 00192D40 08009424 */  addiu       $20, $4, 0x8
/* 092E44 00192D44 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 092E48 00192D48 00000000 */   nop
/* 092E4C 00192D4C 28964070 */  paddub      $18, $2, $0
/* 092E50 00192D50 28160070 */  paddub      $2, $0, $0
/* 092E54 00192D54 288E0070 */  paddub      $17, $0, $0
/* 092E58 00192D58 28860070 */  paddub      $16, $0, $0
/* 092E5C 00192D5C 04000324 */  addiu       $3, $0, 0x4
/* 092E60 00192D60 0E006316 */  bne         $19, $3, .L00192D9C
/* 092E64 00192D64 00000000 */   nop
/* 092E68 00192D68 28268072 */  paddub      $4, $20, $0
/* 092E6C 00192D6C 08009424 */  addiu       $20, $4, 0x8
/* 092E70 00192D70 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 092E74 00192D74 00000000 */   nop
/* 092E78 00192D78 28864070 */  paddub      $16, $2, $0
/* 092E7C 00192D7C 28268072 */  paddub      $4, $20, $0
/* 092E80 00192D80 08009424 */  addiu       $20, $4, 0x8
/* 092E84 00192D84 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 092E88 00192D88 00000000 */   nop
/* 092E8C 00192D8C 288E4070 */  paddub      $17, $2, $0
/* 092E90 00192D90 28268072 */  paddub      $4, $20, $0
/* 092E94 00192D94 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 092E98 00192D98 00000000 */   nop
.L00192D9C:
/* 092E9C 00192D9C 00009044 */  mtc1        $16, $f0
/* 092EA0 00192DA0 00000000 */  nop
/* 092EA4 00192DA4 20038046 */  cvt.s.w     $f12, $f0
/* 092EA8 00192DA8 00009144 */  mtc1        $17, $f0
/* 092EAC 00192DAC 00000000 */  nop
/* 092EB0 00192DB0 60038046 */  cvt.s.w     $f13, $f0
/* 092EB4 00192DB4 00008244 */  mtc1        $2, $f0
/* 092EB8 00192DB8 00000000 */  nop
/* 092EBC 00192DBC A0038046 */  cvt.s.w     $f14, $f0
/* 092EC0 00192DC0 28264072 */  paddub      $4, $18, $0
/* 092EC4 00192DC4 E425060C */  jal         EdFadeOut__Fifff
/* 092EC8 00192DC8 00000000 */   nop
/* 092ECC 00192DCC 01000224 */  addiu       $2, $0, 0x1
/* 092ED0 00192DD0 5000BF7B */  lq          $31, 0x50($29)
/* 092ED4 00192DD4 4000B47B */  lq          $20, 0x40($29)
/* 092ED8 00192DD8 3000B37B */  lq          $19, 0x30($29)
/* 092EDC 00192DDC 2000B27B */  lq          $18, 0x20($29)
/* 092EE0 00192DE0 1000B17B */  lq          $17, 0x10($29)
/* 092EE4 00192DE4 0000B07B */  lq          $16, 0x0($29)
/* 092EE8 00192DE8 6000BD27 */  addiu       $29, $29, 0x60
/* 092EEC 00192DEC 0800E003 */  jr          $31
/* 092EF0 00192DF0 00000000 */   nop
/* 092EF4 00192DF4 00000000 */  nop
/* 092EF8 00192DF8 00000000 */  nop
/* 092EFC 00192DFC 00000000 */  nop
