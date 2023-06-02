.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __sprint
/* 6EC0 00106DC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6EC4 00106DC4 0000B0FF */  sd         $16, 0x0($sp)
/* 6EC8 00106DC8 1000BFFF */  sd         $31, 0x10($sp)
/* 6ECC 00106DCC 2D80A000 */  daddu      $16, $5, $0
/* 6ED0 00106DD0 0800028E */  lw         $2, 0x8($16)
/* 6ED4 00106DD4 03004014 */  bnez       $2, .L00106DE4
/* 6ED8 00106DD8 2D100000 */   daddu     $2, $0, $0
/* 6EDC 00106DDC 05000010 */  b          .L00106DF4
/* 6EE0 00106DE0 040000AE */   sw        $0, 0x4($16)
.L00106DE4:
/* 6EE4 00106DE4 3808040C */  jal        __sfvwrite
/* 6EE8 00106DE8 2D280002 */   daddu     $5, $16, $0
/* 6EEC 00106DEC 040000AE */  sw         $0, 0x4($16)
/* 6EF0 00106DF0 080000AE */  sw         $0, 0x8($16)
.L00106DF4:
/* 6EF4 00106DF4 1000BFDF */  ld         $31, 0x10($sp)
/* 6EF8 00106DF8 0000B0DF */  ld         $16, 0x0($sp)
/* 6EFC 00106DFC 0800E003 */  jr         $31
/* 6F00 00106E00 2000BD27 */   addiu     $sp, $sp, 0x20
/* 6F04 00106E04 00000000 */  nop
