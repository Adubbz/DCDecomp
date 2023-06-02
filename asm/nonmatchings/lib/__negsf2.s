.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __negsf2
/* 112D8 001111D8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 112DC 001111DC 2000BFFF */  sd         $31, 0x20($sp)
/* 112E0 001111E0 1000A427 */  addiu      $4, $sp, 0x10
/* 112E4 001111E4 1000ACE7 */  swc1       $f12, 0x10($sp)
/* 112E8 001111E8 EC41040C */  jal        __unpack_f
/* 112EC 001111EC 2D28A003 */   daddu     $5, $sp, $0
/* 112F0 001111F0 0400A28F */  lw         $2, 0x4($sp)
/* 112F4 001111F4 2D20A003 */  daddu      $4, $sp, $0
/* 112F8 001111F8 0100422C */  sltiu      $2, $2, 0x1
/* 112FC 001111FC A841040C */  jal        __pack_f
/* 11300 00111200 0400A2AF */   sw        $2, 0x4($sp)
/* 11304 00111204 2000BFDF */  ld         $31, 0x20($sp)
/* 11308 00111208 0800E003 */  jr         $31
/* 1130C 0011120C 3000BD27 */   addiu     $sp, $sp, 0x30
