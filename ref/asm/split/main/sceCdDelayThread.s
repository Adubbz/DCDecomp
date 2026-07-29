.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdDelayThread
/* 0096A0 001095A0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 0096A4 001095A4 01000224 */  addiu       $2, $0, 0x1
/* 0096A8 001095A8 3000B1FF */  sd          $17, 0x30($29)
/* 0096AC 001095AC FFFF9130 */  andi        $17, $4, 0xFFFF
/* 0096B0 001095B0 2000B0FF */  sd          $16, 0x20($29)
/* 0096B4 001095B4 0400A2AF */  sw          $2, 0x4($29)
/* 0096B8 001095B8 0800A0AF */  sw          $0, 0x8($29)
/* 0096BC 001095BC 1400A0AF */  sw          $0, 0x14($29)
/* 0096C0 001095C0 4000BFFF */  sd          $31, 0x40($29)
/* 0096C4 001095C4 C850040C */  jal         CreateSema
/* 0096C8 001095C8 2D20A003 */   daddu      $4, $29, $0
/* 0096CC 001095CC 2D804000 */  daddu       $16, $2, $0
/* 0096D0 001095D0 1100053C */  lui         $5, %hi(CB_DelayTh)
/* 0096D4 001095D4 2D300002 */  daddu       $6, $16, $0
/* 0096D8 001095D8 2D202002 */  daddu       $4, $17, $0
/* 0096DC 001095DC D053040C */  jal         SetAlarm
/* 0096E0 001095E0 9895A524 */   addiu      $5, $5, %lo(CB_DelayTh)
/* 0096E4 001095E4 D850040C */  jal         WaitSema
/* 0096E8 001095E8 2D200002 */   daddu      $4, $16, $0
/* 0096EC 001095EC CC50040C */  jal         DeleteSema
/* 0096F0 001095F0 2D200002 */   daddu      $4, $16, $0
/* 0096F4 001095F4 4000BFDF */  ld          $31, 0x40($29)
/* 0096F8 001095F8 3000B1DF */  ld          $17, 0x30($29)
/* 0096FC 001095FC 2000B0DF */  ld          $16, 0x20($29)
/* 009700 00109600 0800E003 */  jr          $31
/* 009704 00109604 5000BD27 */   addiu      $29, $29, 0x50
