.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel fpcmp
/* 110A8 00110FA8 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 110AC 00110FAC 3000B0FF */  sd         $16, 0x30($sp)
/* 110B0 00110FB0 2000A427 */  addiu      $4, $sp, 0x20
/* 110B4 00110FB4 4000BFFF */  sd         $31, 0x40($sp)
/* 110B8 00110FB8 2D28A003 */  daddu      $5, $sp, $0
/* 110BC 00110FBC 2000ACE7 */  swc1       $f12, 0x20($sp)
/* 110C0 00110FC0 EC41040C */  jal        __unpack_f
/* 110C4 00110FC4 2400ADE7 */   swc1      $f13, 0x24($sp)
/* 110C8 00110FC8 1000B027 */  addiu      $16, $sp, 0x10
/* 110CC 00110FCC 2400A427 */  addiu      $4, $sp, 0x24
/* 110D0 00110FD0 EC41040C */  jal        __unpack_f
/* 110D4 00110FD4 2D280002 */   daddu     $5, $16, $0
/* 110D8 00110FD8 2D280002 */  daddu      $5, $16, $0
/* 110DC 00110FDC A443040C */  jal        __fpcmp_parts_f
/* 110E0 00110FE0 2D20A003 */   daddu     $4, $sp, $0
/* 110E4 00110FE4 4000BFDF */  ld         $31, 0x40($sp)
/* 110E8 00110FE8 3000B0DF */  ld         $16, 0x30($sp)
/* 110EC 00110FEC 0800E003 */  jr         $31
/* 110F0 00110FF0 5000BD27 */   addiu     $sp, $sp, 0x50
/* 110F4 00110FF4 00000000 */  nop
