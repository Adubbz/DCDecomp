.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdCheckItem__Fi
/* 073370 00173270 D0FFBD27 */  addiu       $29, $29, -0x30
/* 073374 00173274 2000BF7F */  sq          $31, 0x20($29)
/* 073378 00173278 1000B17F */  sq          $17, 0x10($29)
/* 07337C 0017327C 0000B07F */  sq          $16, 0x0($29)
/* 073380 00173280 288E8070 */  paddub      $17, $4, $0
/* 073384 00173284 1C8D848F */  lw          $4, -0x72E4($28)
/* 073388 00173288 7860050C */  jal         GetDngStatus__9CSaveDataFv
/* 07338C 0017328C 00000000 */   nop
/* 073390 00173290 28864070 */  paddub      $16, $2, $0
/* 073394 00173294 28262072 */  paddub      $4, $17, $0
/* 073398 00173298 E4CA050C */  jal         ConvertItemNo__Fi
/* 07339C 0017329C 00000000 */   nop
/* 0733A0 001732A0 07004004 */  bltz        $2, .L001732C0
/* 0733A4 001732A4 00000000 */   nop
/* 0733A8 001732A8 28260072 */  paddub      $4, $16, $0
/* 0733AC 001732AC 282E4070 */  paddub      $5, $2, $0
/* 0733B0 001732B0 50F6060C */  jal         SearchItemIndexNo__14CDngStatusDataFi
/* 0733B4 001732B4 00000000 */   nop
/* 0733B8 001732B8 02000010 */  b           .L001732C4
/* 0733BC 001732BC 00000000 */   nop
.L001732C0:
/* 0733C0 001732C0 FFFF0224 */  addiu       $2, $0, -0x1
.L001732C4:
/* 0733C4 001732C4 2000BF7B */  lq          $31, 0x20($29)
/* 0733C8 001732C8 1000B17B */  lq          $17, 0x10($29)
/* 0733CC 001732CC 0000B07B */  lq          $16, 0x0($29)
/* 0733D0 001732D0 3000BD27 */  addiu       $29, $29, 0x30
/* 0733D4 001732D4 0800E003 */  jr          $31
/* 0733D8 001732D8 00000000 */   nop
/* 0733DC 001732DC 00000000 */  nop
