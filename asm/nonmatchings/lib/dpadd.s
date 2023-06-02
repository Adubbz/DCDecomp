.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel dpadd
/* FEB8 0010FDB8 70FFBD27 */  addiu      $sp, $sp, -0x90
/* FEBC 0010FDBC 6000A4FF */  sd         $4, 0x60($sp)
/* FEC0 0010FDC0 6800A5FF */  sd         $5, 0x68($sp)
/* FEC4 0010FDC4 6000A427 */  addiu      $4, $sp, 0x60
/* FEC8 0010FDC8 7000B0FF */  sd         $16, 0x70($sp)
/* FECC 0010FDCC 8000BFFF */  sd         $31, 0x80($sp)
/* FED0 0010FDD0 B63E040C */  jal        __unpack_d
/* FED4 0010FDD4 2D28A003 */   daddu     $5, $sp, $0
/* FED8 0010FDD8 2000B027 */  addiu      $16, $sp, 0x20
/* FEDC 0010FDDC 6800A427 */  addiu      $4, $sp, 0x68
/* FEE0 0010FDE0 B63E040C */  jal        __unpack_d
/* FEE4 0010FDE4 2D280002 */   daddu     $5, $16, $0
/* FEE8 0010FDE8 2D280002 */  daddu      $5, $16, $0
/* FEEC 0010FDEC 4000A627 */  addiu      $6, $sp, 0x40
/* FEF0 0010FDF0 DE3E040C */  jal        _fpadd_parts
/* FEF4 0010FDF4 2D20A003 */   daddu     $4, $sp, $0
/* FEF8 0010FDF8 6A3E040C */  jal        __pack_d
/* FEFC 0010FDFC 2D204000 */   daddu     $4, $2, $0
/* FF00 0010FE00 8000BFDF */  ld         $31, 0x80($sp)
/* FF04 0010FE04 7000B0DF */  ld         $16, 0x70($sp)
/* FF08 0010FE08 0800E003 */  jr         $31
/* FF0C 0010FE0C 9000BD27 */   addiu     $sp, $sp, 0x90
