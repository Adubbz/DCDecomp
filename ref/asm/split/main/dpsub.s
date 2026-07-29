.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel dpsub
/* 00FF10 0010FE10 70FFBD27 */  addiu       $29, $29, -0x90
/* 00FF14 0010FE14 6000A4FF */  sd          $4, 0x60($29)
/* 00FF18 0010FE18 6800A5FF */  sd          $5, 0x68($29)
/* 00FF1C 0010FE1C 6000A427 */  addiu       $4, $29, 0x60
/* 00FF20 0010FE20 7000B0FF */  sd          $16, 0x70($29)
/* 00FF24 0010FE24 8000BFFF */  sd          $31, 0x80($29)
/* 00FF28 0010FE28 B63E040C */  jal         __unpack_d
/* 00FF2C 0010FE2C 2D28A003 */   daddu      $5, $29, $0
/* 00FF30 0010FE30 2000B027 */  addiu       $16, $29, 0x20
/* 00FF34 0010FE34 6800A427 */  addiu       $4, $29, 0x68
/* 00FF38 0010FE38 B63E040C */  jal         __unpack_d
/* 00FF3C 0010FE3C 2D280002 */   daddu      $5, $16, $0
/* 00FF40 0010FE40 2400A28F */  lw          $2, 0x24($29)
/* 00FF44 0010FE44 2D280002 */  daddu       $5, $16, $0
/* 00FF48 0010FE48 4000A627 */  addiu       $6, $29, 0x40
/* 00FF4C 0010FE4C 2D20A003 */  daddu       $4, $29, $0
/* 00FF50 0010FE50 01004238 */  xori        $2, $2, 0x1
/* 00FF54 0010FE54 DE3E040C */  jal         _fpadd_parts
/* 00FF58 0010FE58 2400A2AF */   sw         $2, 0x24($29)
/* 00FF5C 0010FE5C 6A3E040C */  jal         __pack_d
/* 00FF60 0010FE60 2D204000 */   daddu      $4, $2, $0
/* 00FF64 0010FE64 8000BFDF */  ld          $31, 0x80($29)
/* 00FF68 0010FE68 7000B0DF */  ld          $16, 0x70($29)
/* 00FF6C 0010FE6C 0800E003 */  jr          $31
/* 00FF70 0010FE70 9000BD27 */   addiu      $29, $29, 0x90
/* 00FF74 0010FE74 00000000 */  nop
