.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel dpsub
/* FF10 0010FE10 70FFBD27 */  addiu      $sp, $sp, -0x90
/* FF14 0010FE14 6000A4FF */  sd         $4, 0x60($sp)
/* FF18 0010FE18 6800A5FF */  sd         $5, 0x68($sp)
/* FF1C 0010FE1C 6000A427 */  addiu      $4, $sp, 0x60
/* FF20 0010FE20 7000B0FF */  sd         $16, 0x70($sp)
/* FF24 0010FE24 8000BFFF */  sd         $31, 0x80($sp)
/* FF28 0010FE28 B63E040C */  jal        __unpack_d
/* FF2C 0010FE2C 2D28A003 */   daddu     $5, $sp, $0
/* FF30 0010FE30 2000B027 */  addiu      $16, $sp, 0x20
/* FF34 0010FE34 6800A427 */  addiu      $4, $sp, 0x68
/* FF38 0010FE38 B63E040C */  jal        __unpack_d
/* FF3C 0010FE3C 2D280002 */   daddu     $5, $16, $0
/* FF40 0010FE40 2400A28F */  lw         $2, 0x24($sp)
/* FF44 0010FE44 2D280002 */  daddu      $5, $16, $0
/* FF48 0010FE48 4000A627 */  addiu      $6, $sp, 0x40
/* FF4C 0010FE4C 2D20A003 */  daddu      $4, $sp, $0
/* FF50 0010FE50 01004238 */  xori       $2, $2, 0x1
/* FF54 0010FE54 DE3E040C */  jal        _fpadd_parts
/* FF58 0010FE58 2400A2AF */   sw        $2, 0x24($sp)
/* FF5C 0010FE5C 6A3E040C */  jal        __pack_d
/* FF60 0010FE60 2D204000 */   daddu     $4, $2, $0
/* FF64 0010FE64 8000BFDF */  ld         $31, 0x80($sp)
/* FF68 0010FE68 7000B0DF */  ld         $16, 0x70($sp)
/* FF6C 0010FE6C 0800E003 */  jr         $31
/* FF70 0010FE70 9000BD27 */   addiu     $sp, $sp, 0x90
/* FF74 0010FE74 00000000 */  nop
