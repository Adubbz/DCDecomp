.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _DELETE_CHARA__FP12RS_STACKDATAi
/* 08D470 0018D370 D0FFBD27 */  addiu       $29, $29, -0x30
/* 08D474 0018D374 2000BF7F */  sq          $31, 0x20($29)
/* 08D478 0018D378 1000B17F */  sq          $17, 0x10($29)
/* 08D47C 0018D37C 0000B07F */  sq          $16, 0x0($29)
/* 08D480 0018D380 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08D484 0018D384 00000000 */   nop
/* 08D488 0018D388 28864070 */  paddub      $16, $2, $0
/* 08D48C 0018D38C 28260072 */  paddub      $4, $16, $0
/* 08D490 0018D390 702C060C */  jal         GetNPC__Fi
/* 08D494 0018D394 00000000 */   nop
/* 08D498 0018D398 288E4070 */  paddub      $17, $2, $0
/* 08D49C 0018D39C 04002016 */  bnez        $17, .L0018D3B0
/* 08D4A0 0018D3A0 00000000 */   nop
/* 08D4A4 0018D3A4 28160070 */  paddub      $2, $0, $0
/* 08D4A8 0018D3A8 15000010 */  b           .L0018D400
/* 08D4AC 0018D3AC 00000000 */   nop
.L0018D3B0:
/* 08D4B0 0018D3B0 C701023C */  lui         $2, %hi(TexManager)
/* 08D4B4 0018D3B4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 08D4B8 0018D3B8 8C14258E */  lw          $5, 0x148C($17)
/* 08D4BC 0018D3BC C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 08D4C0 0018D3C0 00000000 */   nop
/* 08D4C4 0018D3C4 28262072 */  paddub      $4, $17, $0
/* 08D4C8 0018D3C8 A000398E */  lw          $25, 0xA0($17)
/* 08D4CC 0018D3CC C400398F */  lw          $25, 0xC4($25)
/* 08D4D0 0018D3D0 09F82003 */  jalr        $25
/* 08D4D4 0018D3D4 00000000 */   nop
/* 08D4D8 0018D3D8 80181000 */  sll         $3, $16, 2
/* 08D4DC 0018D3DC D401023C */  lui         $2, %hi(EdEventInfo + 0xB4)
/* 08D4E0 0018D3E0 84D24224 */  addiu       $2, $2, %lo(EdEventInfo + 0xB4)
/* 08D4E4 0018D3E4 21104300 */  addu        $2, $2, $3
/* 08D4E8 0018D3E8 000040AC */  sw          $0, 0x0($2)
/* 08D4EC 0018D3EC D401023C */  lui         $2, %hi(EdEventInfo + 0xF4)
/* 08D4F0 0018D3F0 C4D24224 */  addiu       $2, $2, %lo(EdEventInfo + 0xF4)
/* 08D4F4 0018D3F4 21104300 */  addu        $2, $2, $3
/* 08D4F8 0018D3F8 000040AC */  sw          $0, 0x0($2)
/* 08D4FC 0018D3FC 01000224 */  addiu       $2, $0, 0x1
.L0018D400:
/* 08D500 0018D400 2000BF7B */  lq          $31, 0x20($29)
/* 08D504 0018D404 1000B17B */  lq          $17, 0x10($29)
/* 08D508 0018D408 0000B07B */  lq          $16, 0x0($29)
/* 08D50C 0018D40C 3000BD27 */  addiu       $29, $29, 0x30
/* 08D510 0018D410 0800E003 */  jr          $31
/* 08D514 0018D414 00000000 */   nop
/* 08D518 0018D418 00000000 */  nop
/* 08D51C 0018D41C 00000000 */  nop
