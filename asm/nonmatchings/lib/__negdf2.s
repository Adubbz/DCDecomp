.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __negdf2
/* 106E0 001105E0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 106E4 001105E4 2000A4FF */  sd         $4, 0x20($sp)
/* 106E8 001105E8 2D28A003 */  daddu      $5, $sp, $0
/* 106EC 001105EC 3000BFFF */  sd         $31, 0x30($sp)
/* 106F0 001105F0 B63E040C */  jal        __unpack_d
/* 106F4 001105F4 2000A427 */   addiu     $4, $sp, 0x20
/* 106F8 001105F8 0400A28F */  lw         $2, 0x4($sp)
/* 106FC 001105FC 2D20A003 */  daddu      $4, $sp, $0
/* 10700 00110600 0100422C */  sltiu      $2, $2, 0x1
/* 10704 00110604 6A3E040C */  jal        __pack_d
/* 10708 00110608 0400A2AF */   sw        $2, 0x4($sp)
/* 1070C 0011060C 3000BFDF */  ld         $31, 0x30($sp)
/* 10710 00110610 0800E003 */  jr         $31
/* 10714 00110614 4000BD27 */   addiu     $sp, $sp, 0x40
