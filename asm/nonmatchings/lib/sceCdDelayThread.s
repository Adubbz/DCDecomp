.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdDelayThread
/* 96A0 001095A0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 96A4 001095A4 01000224 */  addiu      $2, $0, 0x1
/* 96A8 001095A8 3000B1FF */  sd         $17, 0x30($sp)
/* 96AC 001095AC FFFF9130 */  andi       $17, $4, 0xFFFF
/* 96B0 001095B0 2000B0FF */  sd         $16, 0x20($sp)
/* 96B4 001095B4 0400A2AF */  sw         $2, 0x4($sp)
/* 96B8 001095B8 0800A0AF */  sw         $0, 0x8($sp)
/* 96BC 001095BC 1400A0AF */  sw         $0, 0x14($sp)
/* 96C0 001095C0 4000BFFF */  sd         $31, 0x40($sp)
/* 96C4 001095C4 C850040C */  jal        CreateSema
/* 96C8 001095C8 2D20A003 */   daddu     $4, $sp, $0
/* 96CC 001095CC 2D804000 */  daddu      $16, $2, $0
/* 96D0 001095D0 1100053C */  lui        $5, %hi(CB_DelayTh)
/* 96D4 001095D4 2D300002 */  daddu      $6, $16, $0
/* 96D8 001095D8 2D202002 */  daddu      $4, $17, $0
/* 96DC 001095DC D053040C */  jal        SetAlarm
/* 96E0 001095E0 9895A524 */   addiu     $5, $5, %lo(CB_DelayTh)
/* 96E4 001095E4 D850040C */  jal        WaitSema
/* 96E8 001095E8 2D200002 */   daddu     $4, $16, $0
/* 96EC 001095EC CC50040C */  jal        DeleteSema
/* 96F0 001095F0 2D200002 */   daddu     $4, $16, $0
/* 96F4 001095F4 4000BFDF */  ld         $31, 0x40($sp)
/* 96F8 001095F8 3000B1DF */  ld         $17, 0x30($sp)
/* 96FC 001095FC 2000B0DF */  ld         $16, 0x20($sp)
/* 9700 00109600 0800E003 */  jr         $31
/* 9704 00109604 5000BD27 */   addiu     $sp, $sp, 0x50
