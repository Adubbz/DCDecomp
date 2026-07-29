.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SQ_RePlay__6CSoundFi
/* 0456A0 001455A0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0456A4 001455A4 1000BF7F */  sq          $31, 0x10($29)
/* 0456A8 001455A8 0000B07F */  sq          $16, 0x0($29)
/* 0456AC 001455AC 2886A070 */  paddub      $16, $5, $0
/* 0456B0 001455B0 2A00023C */  lui         $2, %hi(LIT_789)
/* 0456B4 001455B4 50994424 */  addiu       $4, $2, %lo(LIT_789)
/* 0456B8 001455B8 A611040C */  jal         printf
/* 0456BC 001455BC 00000000 */   nop
/* 0456C0 001455C0 28260072 */  paddub      $4, $16, $0
/* 0456C4 001455C4 282E0070 */  paddub      $5, $0, $0
/* 0456C8 001455C8 801E050C */  jal         ezMidi__Fii
/* 0456CC 001455CC 00000000 */   nop
/* 0456D0 001455D0 1000BF7B */  lq          $31, 0x10($29)
/* 0456D4 001455D4 0000B07B */  lq          $16, 0x0($29)
/* 0456D8 001455D8 2000BD27 */  addiu       $29, $29, 0x20
/* 0456DC 001455DC 0800E003 */  jr          $31
/* 0456E0 001455E0 00000000 */   nop
/* 0456E4 001455E4 00000000 */  nop
/* 0456E8 001455E8 00000000 */  nop
/* 0456EC 001455EC 00000000 */  nop
