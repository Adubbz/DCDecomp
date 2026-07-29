.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel dpadd
/* 00FEB8 0010FDB8 70FFBD27 */  addiu       $29, $29, -0x90
/* 00FEBC 0010FDBC 6000A4FF */  sd          $4, 0x60($29)
/* 00FEC0 0010FDC0 6800A5FF */  sd          $5, 0x68($29)
/* 00FEC4 0010FDC4 6000A427 */  addiu       $4, $29, 0x60
/* 00FEC8 0010FDC8 7000B0FF */  sd          $16, 0x70($29)
/* 00FECC 0010FDCC 8000BFFF */  sd          $31, 0x80($29)
/* 00FED0 0010FDD0 B63E040C */  jal         __unpack_d
/* 00FED4 0010FDD4 2D28A003 */   daddu      $5, $29, $0
/* 00FED8 0010FDD8 2000B027 */  addiu       $16, $29, 0x20
/* 00FEDC 0010FDDC 6800A427 */  addiu       $4, $29, 0x68
/* 00FEE0 0010FDE0 B63E040C */  jal         __unpack_d
/* 00FEE4 0010FDE4 2D280002 */   daddu      $5, $16, $0
/* 00FEE8 0010FDE8 2D280002 */  daddu       $5, $16, $0
/* 00FEEC 0010FDEC 4000A627 */  addiu       $6, $29, 0x40
/* 00FEF0 0010FDF0 DE3E040C */  jal         _fpadd_parts
/* 00FEF4 0010FDF4 2D20A003 */   daddu      $4, $29, $0
/* 00FEF8 0010FDF8 6A3E040C */  jal         __pack_d
/* 00FEFC 0010FDFC 2D204000 */   daddu      $4, $2, $0
/* 00FF00 0010FE00 8000BFDF */  ld          $31, 0x80($29)
/* 00FF04 0010FE04 7000B0DF */  ld          $16, 0x70($29)
/* 00FF08 0010FE08 0800E003 */  jr          $31
/* 00FF0C 0010FE0C 9000BD27 */   addiu      $29, $29, 0x90
