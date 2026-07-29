.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __deregister_frame
/* 012040 00111F40 F0FFBD27 */  addiu       $29, $29, -0x10
/* 012044 00111F44 0000BFFF */  sd          $31, 0x0($29)
/* 012048 00111F48 B247040C */  jal         __deregister_frame_info
/* 01204C 00111F4C 00000000 */   nop
/* 012050 00111F50 0000BFDF */  ld          $31, 0x0($29)
/* 012054 00111F54 2D204000 */  daddu       $4, $2, $0
/* 012058 00111F58 060A0408 */  j           free
/* 01205C 00111F5C 1000BD27 */   addiu      $29, $29, 0x10
