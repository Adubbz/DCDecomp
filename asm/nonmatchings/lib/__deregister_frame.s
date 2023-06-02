.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __deregister_frame
/* 12040 00111F40 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 12044 00111F44 0000BFFF */  sd         $31, 0x0($sp)
/* 12048 00111F48 B247040C */  jal        __deregister_frame_info
/* 1204C 00111F4C 00000000 */   nop
/* 12050 00111F50 0000BFDF */  ld         $31, 0x0($sp)
/* 12054 00111F54 2D204000 */  daddu      $4, $2, $0
/* 12058 00111F58 060A0408 */  j          free
/* 1205C 00111F5C 1000BD27 */   addiu     $sp, $sp, 0x10
