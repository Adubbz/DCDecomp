.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel fpadd
/* 010B78 00110A78 A0FFBD27 */  addiu       $29, $29, -0x60
/* 010B7C 00110A7C 4000B0FF */  sd          $16, 0x40($29)
/* 010B80 00110A80 3000A427 */  addiu       $4, $29, 0x30
/* 010B84 00110A84 5000BFFF */  sd          $31, 0x50($29)
/* 010B88 00110A88 2D28A003 */  daddu       $5, $29, $0
/* 010B8C 00110A8C 3000ACE7 */  swc1        $f12, 0x30($29)
/* 010B90 00110A90 EC41040C */  jal         __unpack_f
/* 010B94 00110A94 3400ADE7 */   swc1       $f13, 0x34($29)
/* 010B98 00110A98 1000B027 */  addiu       $16, $29, 0x10
/* 010B9C 00110A9C 3400A427 */  addiu       $4, $29, 0x34
/* 010BA0 00110AA0 EC41040C */  jal         __unpack_f
/* 010BA4 00110AA4 2D280002 */   daddu      $5, $16, $0
/* 010BA8 00110AA8 2D280002 */  daddu       $5, $16, $0
/* 010BAC 00110AAC 2000A627 */  addiu       $6, $29, 0x20
/* 010BB0 00110AB0 1042040C */  jal         _fpadd_parts__2
/* 010BB4 00110AB4 2D20A003 */   daddu      $4, $29, $0
/* 010BB8 00110AB8 A841040C */  jal         __pack_f
/* 010BBC 00110ABC 2D204000 */   daddu      $4, $2, $0
/* 010BC0 00110AC0 5000BFDF */  ld          $31, 0x50($29)
/* 010BC4 00110AC4 4000B0DF */  ld          $16, 0x40($29)
/* 010BC8 00110AC8 0800E003 */  jr          $31
/* 010BCC 00110ACC 6000BD27 */   addiu      $29, $29, 0x60
