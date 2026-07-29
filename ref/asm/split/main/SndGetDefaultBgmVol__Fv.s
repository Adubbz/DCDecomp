.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndGetDefaultBgmVol__Fv
/* 059EF0 00159DF0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 059EF4 00159DF4 0000BF7F */  sq          $31, 0x0($29)
/* 059EF8 00159DF8 048E828F */  lw          $2, -0x71FC($28)
/* 059EFC 00159DFC 04004104 */  bgez        $2, .L00159E10
/* 059F00 00159E00 00000000 */   nop
/* 059F04 00159E04 28160070 */  paddub      $2, $0, $0
/* 059F08 00159E08 07000010 */  b           .L00159E28
/* 059F0C 00159E0C 00000000 */   nop
.L00159E10:
/* 059F10 00159E10 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 059F14 00159E14 D40E050C */  jal         GetMidiState__6CSoundFv
/* 059F18 00159E18 00000000 */   nop
/* 059F1C 00159E1C 3000428C */  lw          $2, 0x30($2)
/* 059F20 00159E20 0C00428C */  lw          $2, 0xC($2)
/* 059F24 00159E24 00000000 */  nop
.L00159E28:
/* 059F28 00159E28 0000BF7B */  lq          $31, 0x0($29)
/* 059F2C 00159E2C 1000BD27 */  addiu       $29, $29, 0x10
/* 059F30 00159E30 0800E003 */  jr          $31
/* 059F34 00159E34 00000000 */   nop
/* 059F38 00159E38 00000000 */  nop
/* 059F3C 00159E3C 00000000 */  nop
