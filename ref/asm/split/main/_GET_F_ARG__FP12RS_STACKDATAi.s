.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_F_ARG__FP12RS_STACKDATAi
/* 096690 00196590 E0FFBD27 */  addiu       $29, $29, -0x20
/* 096694 00196594 1000BF7F */  sq          $31, 0x10($29)
/* 096698 00196598 0000B07F */  sq          $16, 0x0($29)
/* 09669C 0019659C 08009024 */  addiu       $16, $4, 0x8
/* 0966A0 001965A0 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0966A4 001965A4 00000000 */   nop
/* 0966A8 001965A8 04004004 */  bltz        $2, .L001965BC
/* 0966AC 001965AC 00000000 */   nop
/* 0966B0 001965B0 08004328 */  slti        $3, $2, 0x8
/* 0966B4 001965B4 04006014 */  bnez        $3, .L001965C8
/* 0966B8 001965B8 00000000 */   nop
.L001965BC:
/* 0966BC 001965BC 28160070 */  paddub      $2, $0, $0
/* 0966C0 001965C0 0A000010 */  b           .L001965EC
/* 0966C4 001965C4 00000000 */   nop
.L001965C8:
/* 0966C8 001965C8 28260072 */  paddub      $4, $16, $0
/* 0966CC 001965CC 80180200 */  sll         $3, $2, 2
/* 0966D0 001965D0 D401023C */  lui         $2, %hi(EdEventInfo + 0x420)
/* 0966D4 001965D4 F0D54224 */  addiu       $2, $2, %lo(EdEventInfo + 0x420)
/* 0966D8 001965D8 21104300 */  addu        $2, $2, $3
/* 0966DC 001965DC 0000458C */  lw          $5, 0x0($2)
/* 0966E0 001965E0 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 0966E4 001965E4 00000000 */   nop
/* 0966E8 001965E8 01000224 */  addiu       $2, $0, 0x1
.L001965EC:
/* 0966EC 001965EC 1000BF7B */  lq          $31, 0x10($29)
/* 0966F0 001965F0 0000B07B */  lq          $16, 0x0($29)
/* 0966F4 001965F4 2000BD27 */  addiu       $29, $29, 0x20
/* 0966F8 001965F8 0800E003 */  jr          $31
/* 0966FC 001965FC 00000000 */   nop
