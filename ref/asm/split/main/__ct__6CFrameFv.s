.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__6CFrameFv
/* 02A2C0 0012A1C0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 02A2C4 0012A1C4 1000BF7F */  sq          $31, 0x10($29)
/* 02A2C8 0012A1C8 0000B07F */  sq          $16, 0x0($29)
/* 02A2CC 0012A1CC 28868070 */  paddub      $16, $4, $0
/* 02A2D0 0012A1D0 2A00023C */  lui         $2, %hi(__vt__6CFrame)
/* 02A2D4 0012A1D4 30114224 */  addiu       $2, $2, %lo(__vt__6CFrame)
/* 02A2D8 0012A1D8 500282AC */  sw          $2, 0x250($4)
/* 02A2DC 0012A1DC B0000426 */  addiu       $4, $16, 0xB0
/* 02A2E0 0012A1E0 509F040C */  jal         __ct__10CFrameAttrFv
/* 02A2E4 0012A1E4 00000000 */   nop
/* 02A2E8 0012A1E8 28260072 */  paddub      $4, $16, $0
/* 02A2EC 0012A1EC 5C9F040C */  jal         Initialize__6CFrameFv
/* 02A2F0 0012A1F0 00000000 */   nop
/* 02A2F4 0012A1F4 28160072 */  paddub      $2, $16, $0
/* 02A2F8 0012A1F8 1000BF7B */  lq          $31, 0x10($29)
/* 02A2FC 0012A1FC 0000B07B */  lq          $16, 0x0($29)
/* 02A300 0012A200 2000BD27 */  addiu       $29, $29, 0x20
/* 02A304 0012A204 0800E003 */  jr          $31
/* 02A308 0012A208 00000000 */   nop
/* 02A30C 0012A20C 00000000 */  nop
