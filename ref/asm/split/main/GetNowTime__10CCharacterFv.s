.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetNowTime__10CCharacterFv
/* 0385E0 001384E0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0385E4 001384E4 0000BF7F */  sq          $31, 0x0($29)
/* 0385E8 001384E8 680C858C */  lw          $5, 0xC68($4)
/* 0385EC 001384EC 1C00A627 */  addiu       $6, $29, 0x1C
/* 0385F0 001384F0 283E0070 */  paddub      $7, $0, $0
/* 0385F4 001384F4 28460070 */  paddub      $8, $0, $0
/* 0385F8 001384F8 284E0070 */  paddub      $9, $0, $0
/* 0385FC 001384FC ECE0040C */  jal         GetMotionParam__10CCharacterFiPiPiPiPi
/* 038600 00138500 00000000 */   nop
/* 038604 00138504 04004010 */  beqz        $2, .L00138518
/* 038608 00138508 00000000 */   nop
/* 03860C 0013850C 100040C4 */  lwc1        $f0, 0x10($2)
/* 038610 00138510 02000010 */  b           .L0013851C
/* 038614 00138514 00000000 */   nop
.L00138518:
/* 038618 00138518 00008044 */  mtc1        $0, $f0
.L0013851C:
/* 03861C 0013851C 0000BF7B */  lq          $31, 0x0($29)
/* 038620 00138520 2000BD27 */  addiu       $29, $29, 0x20
/* 038624 00138524 0800E003 */  jr          $31
/* 038628 00138528 00000000 */   nop
/* 03862C 0013852C 00000000 */  nop
