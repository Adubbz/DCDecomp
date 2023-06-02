.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel isceSifSendCmd
/* 16B38 00116A38 2D10C000 */  daddu      $2, $6, $0
/* 16B3C 00116A3C 2D18E000 */  daddu      $3, $7, $0
/* 16B40 00116A40 2D580001 */  daddu      $11, $8, $0
/* 16B44 00116A44 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 16B48 00116A48 2D502001 */  daddu      $10, $9, $0
/* 16B4C 00116A4C 2D30A000 */  daddu      $6, $5, $0
/* 16B50 00116A50 0000BFFF */  sd         $31, 0x0($sp)
/* 16B54 00116A54 2D384000 */  daddu      $7, $2, $0
/* 16B58 00116A58 2D406000 */  daddu      $8, $3, $0
/* 16B5C 00116A5C 2D486001 */  daddu      $9, $11, $0
/* 16B60 00116A60 305A040C */  jal        _sceSifSendCmd
/* 16B64 00116A64 01000524 */   addiu     $5, $0, 0x1
/* 16B68 00116A68 0000BFDF */  ld         $31, 0x0($sp)
/* 16B6C 00116A6C 0800E003 */  jr         $31
/* 16B70 00116A70 1000BD27 */   addiu     $sp, $sp, 0x10
/* 16B74 00116A74 00000000 */  nop
