.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdFishingWalkHelpMes__Fi
/* 073AB0 001739B0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 073AB4 001739B4 0000BF7F */  sq          $31, 0x0($29)
/* 073AB8 001739B8 848F80AF */  sw          $0, -0x707C($28)
/* 073ABC 001739BC 888F80AF */  sw          $0, -0x7078($28)
/* 073AC0 001739C0 2600023C */  lui         $2, %hi(LIT_650__2)
/* 073AC4 001739C4 A06F4224 */  addiu       $2, $2, %lo(LIT_650__2)
/* 073AC8 001739C8 1000A327 */  addiu       $3, $29, 0x10
/* 073ACC 001739CC 00004278 */  lq          $2, 0x0($2)
/* 073AD0 001739D0 0000627C */  sq          $2, 0x0($3)
/* 073AD4 001739D4 64008224 */  addiu       $2, $4, 0x64
/* 073AD8 001739D8 1000A2AF */  sw          $2, 0x10($29)
/* 073ADC 001739DC C8000224 */  addiu       $2, $0, 0xC8
/* 073AE0 001739E0 02008004 */  bltz        $4, .L001739EC
/* 073AE4 001739E4 00000000 */   nop
/* 073AE8 001739E8 01004224 */  addiu       $2, $2, 0x1
.L001739EC:
/* 073AEC 001739EC 28264070 */  paddub      $4, $2, $0
/* 073AF0 001739F0 02000524 */  addiu       $5, $0, 0x2
/* 073AF4 001739F4 09000624 */  addiu       $6, $0, 0x9
/* 073AF8 001739F8 1000A727 */  addiu       $7, $29, 0x10
/* 073AFC 001739FC FFFF0824 */  addiu       $8, $0, -0x1
/* 073B00 00173A00 28CD050C */  jal         EdSetHelpMes__FiiiPii
/* 073B04 00173A04 00000000 */   nop
/* 073B08 00173A08 0000BF7B */  lq          $31, 0x0($29)
/* 073B0C 00173A0C 2000BD27 */  addiu       $29, $29, 0x20
/* 073B10 00173A10 0800E003 */  jr          $31
/* 073B14 00173A14 00000000 */   nop
/* 073B18 00173A18 00000000 */  nop
/* 073B1C 00173A1C 00000000 */  nop
