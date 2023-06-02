.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel vfiprintf
/* 6FC0 00106EC0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 6FC4 00106EC4 2000B2FF */  sd         $18, 0x20($sp)
/* 6FC8 00106EC8 1000B1FF */  sd         $17, 0x10($sp)
/* 6FCC 00106ECC 2D90C000 */  daddu      $18, $6, $0
/* 6FD0 00106ED0 0000B0FF */  sd         $16, 0x0($sp)
/* 6FD4 00106ED4 3000BFFF */  sd         $31, 0x30($sp)
/* 6FD8 00106ED8 2D808000 */  daddu      $16, $4, $0
/* 6FDC 00106EDC 5400038E */  lw         $3, 0x54($16)
/* 6FE0 00106EE0 05006014 */  bnez       $3, .L00106EF8
/* 6FE4 00106EE4 2D88A000 */   daddu     $17, $5, $0
/* 6FE8 00106EE8 2500023C */  lui        $2, (0x250000 >> 16)
/* 6FEC 00106EEC ECFD438C */  lw         $3, -0x214($2)
/* 6FF0 00106EF0 540003AE */  sw         $3, 0x54($16)
/* 6FF4 00106EF4 00000000 */  nop
.L00106EF8:
/* 6FF8 00106EF8 3800628C */  lw         $2, 0x38($3)
/* 6FFC 00106EFC 04004054 */  bnel       $2, $0, .L00106F10
/* 7000 00106F00 5400048E */   lw        $4, 0x54($16)
/* 7004 00106F04 BC06040C */  jal        __sinit
/* 7008 00106F08 2D206000 */   daddu     $4, $3, $0
/* 700C 00106F0C 5400048E */  lw         $4, 0x54($16)
.L00106F10:
/* 7010 00106F10 2D280002 */  daddu      $5, $16, $0
/* 7014 00106F14 2D302002 */  daddu      $6, $17, $0
/* 7018 00106F18 CE1B040C */  jal        _vfiprintf_r
/* 701C 00106F1C 2D384002 */   daddu     $7, $18, $0
/* 7020 00106F20 3000BFDF */  ld         $31, 0x30($sp)
/* 7024 00106F24 2000B2DF */  ld         $18, 0x20($sp)
/* 7028 00106F28 1000B1DF */  ld         $17, 0x10($sp)
/* 702C 00106F2C 0000B0DF */  ld         $16, 0x0($sp)
/* 7030 00106F30 0800E003 */  jr         $31
/* 7034 00106F34 4000BD27 */   addiu     $sp, $sp, 0x40
