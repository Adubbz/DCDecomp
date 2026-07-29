.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel vfiprintf
/* 006FC0 00106EC0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 006FC4 00106EC4 2000B2FF */  sd          $18, 0x20($29)
/* 006FC8 00106EC8 1000B1FF */  sd          $17, 0x10($29)
/* 006FCC 00106ECC 2D90C000 */  daddu       $18, $6, $0
/* 006FD0 00106ED0 0000B0FF */  sd          $16, 0x0($29)
/* 006FD4 00106ED4 3000BFFF */  sd          $31, 0x30($29)
/* 006FD8 00106ED8 2D808000 */  daddu       $16, $4, $0
/* 006FDC 00106EDC 5400038E */  lw          $3, 0x54($16)
/* 006FE0 00106EE0 05006014 */  bnez        $3, .L00106EF8
/* 006FE4 00106EE4 2D88A000 */   daddu      $17, $5, $0
/* 006FE8 00106EE8 2500023C */  lui         $2, %hi(_impure_ptr)
/* 006FEC 00106EEC ECFD438C */  lw          $3, %lo(_impure_ptr)($2)
/* 006FF0 00106EF0 540003AE */  sw          $3, 0x54($16)
/* 006FF4 00106EF4 00000000 */  nop
.L00106EF8:
/* 006FF8 00106EF8 3800628C */  lw          $2, 0x38($3)
/* 006FFC 00106EFC 04004054 */  bnel        $2, $0, .L00106F10
/* 007000 00106F00 5400048E */   lw         $4, 0x54($16)
/* 007004 00106F04 BC06040C */  jal         __sinit
/* 007008 00106F08 2D206000 */   daddu      $4, $3, $0
/* 00700C 00106F0C 5400048E */  lw          $4, 0x54($16)
.L00106F10:
/* 007010 00106F10 2D280002 */  daddu       $5, $16, $0
/* 007014 00106F14 2D302002 */  daddu       $6, $17, $0
/* 007018 00106F18 CE1B040C */  jal         _vfiprintf_r
/* 00701C 00106F1C 2D384002 */   daddu      $7, $18, $0
/* 007020 00106F20 3000BFDF */  ld          $31, 0x30($29)
/* 007024 00106F24 2000B2DF */  ld          $18, 0x20($29)
/* 007028 00106F28 1000B1DF */  ld          $17, 0x10($29)
/* 00702C 00106F2C 0000B0DF */  ld          $16, 0x0($29)
/* 007030 00106F30 0800E003 */  jr          $31
/* 007034 00106F34 4000BD27 */   addiu      $29, $29, 0x40
