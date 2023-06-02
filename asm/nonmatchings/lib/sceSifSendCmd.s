.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifSendCmd
/* 16AF8 001169F8 2D10C000 */  daddu      $2, $6, $0
/* 16AFC 001169FC 2D18E000 */  daddu      $3, $7, $0
/* 16B00 00116A00 2D580001 */  daddu      $11, $8, $0
/* 16B04 00116A04 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 16B08 00116A08 2D502001 */  daddu      $10, $9, $0
/* 16B0C 00116A0C 2D30A000 */  daddu      $6, $5, $0
/* 16B10 00116A10 0000BFFF */  sd         $31, 0x0($sp)
/* 16B14 00116A14 2D384000 */  daddu      $7, $2, $0
/* 16B18 00116A18 2D406000 */  daddu      $8, $3, $0
/* 16B1C 00116A1C 2D486001 */  daddu      $9, $11, $0
/* 16B20 00116A20 305A040C */  jal        _sceSifSendCmd
/* 16B24 00116A24 2D280000 */   daddu     $5, $0, $0
/* 16B28 00116A28 0000BFDF */  ld         $31, 0x0($sp)
/* 16B2C 00116A2C 0800E003 */  jr         $31
/* 16B30 00116A30 1000BD27 */   addiu     $sp, $sp, 0x10
/* 16B34 00116A34 00000000 */  nop
