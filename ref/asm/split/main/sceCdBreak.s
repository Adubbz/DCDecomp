.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdBreak
/* 00B5F0 0010B4F0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 00B5F4 0010B4F4 1E000424 */  addiu       $4, $0, 0x1E
/* 00B5F8 0010B4F8 3000BFFF */  sd          $31, 0x30($29)
/* 00B5FC 0010B4FC 2000B1FF */  sd          $17, 0x20($29)
/* 00B600 0010B500 A82B040C */  jal         scmd_prechk
/* 00B604 0010B504 1000B0FF */   sd         $16, 0x10($29)
/* 00B608 0010B508 03004014 */  bnez        $2, .L0010B518
/* 00B60C 0010B50C 2A00023C */   lui        $2, %hi(scmdrdata)
/* 00B610 0010B510 1F000010 */  b           .L0010B590
/* 00B614 0010B514 2D100000 */   daddu      $2, $0, $0
.L0010B518:
/* 00B618 0010B518 2500103C */  lui         $16, %hi(sceCdCbfunc_num)
/* 00B61C 0010B51C 40495124 */  addiu       $17, $2, %lo(scmdrdata)
/* 00B620 0010B520 08000324 */  addiu       $3, $0, 0x8
/* 00B624 0010B524 2A00043C */  lui         $4, %hi(cdrc)
/* 00B628 0010B528 C00203AE */  sw          $3, %lo(sceCdCbfunc_num)($16)
/* 00B62C 0010B52C 604D8424 */  addiu       $4, $4, %lo(cdrc)
/* 00B630 0010B530 0000A0AF */  sw          $0, 0x0($29)
/* 00B634 0010B534 16000524 */  addiu       $5, $0, 0x16
/* 00B638 0010B538 2D300000 */  daddu       $6, $0, $0
/* 00B63C 0010B53C 2D380000 */  daddu       $7, $0, $0
/* 00B640 0010B540 2D400000 */  daddu       $8, $0, $0
/* 00B644 0010B544 2D482002 */  daddu       $9, $17, $0
/* 00B648 0010B548 04000A24 */  addiu       $10, $0, 0x4
/* 00B64C 0010B54C 2A5D040C */  jal         sceSifCallRpc
/* 00B650 0010B550 2D580000 */   daddu      $11, $0, $0
/* 00B654 0010B554 07004104 */  bgez        $2, .L0010B574
/* 00B658 0010B558 2500023C */   lui        $2, %hi(scmd_semid)
/* 00B65C 0010B55C 8402448C */  lw          $4, %lo(scmd_semid)($2)
/* 00B660 0010B560 D050040C */  jal         SignalSema
/* 00B664 0010B564 00000000 */   nop
/* 00B668 0010B568 C00200AE */  sw          $0, %lo(sceCdCbfunc_num)($16)
/* 00B66C 0010B56C 08000010 */  b           .L0010B590
/* 00B670 0010B570 2D100000 */   daddu      $2, $0, $0
.L0010B574:
/* 00B674 0010B574 C00200AE */  sw          $0, %lo(sceCdCbfunc_num)($16)
/* 00B678 0010B578 2500023C */  lui         $2, %hi(scmd_semid)
/* 00B67C 0010B57C D050040C */  jal         SignalSema
/* 00B680 0010B580 8402448C */   lw         $4, %lo(scmd_semid)($2)
/* 00B684 0010B584 0020033C */  lui         $3, (0x20000000 >> 16)
/* 00B688 0010B588 25182302 */  or          $3, $17, $3
/* 00B68C 0010B58C 0000628C */  lw          $2, (0x20000000 & 0xFFFF)($3)
.L0010B590:
/* 00B690 0010B590 3000BFDF */  ld          $31, 0x30($29)
/* 00B694 0010B594 2000B1DF */  ld          $17, 0x20($29)
/* 00B698 0010B598 1000B0DF */  ld          $16, 0x10($29)
/* 00B69C 0010B59C 0800E003 */  jr          $31
/* 00B6A0 0010B5A0 4000BD27 */   addiu      $29, $29, 0x40
/* 00B6A4 0010B5A4 00000000 */  nop
