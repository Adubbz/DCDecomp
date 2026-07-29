.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel isceSifSendCmd
/* 016B38 00116A38 2D10C000 */  daddu       $2, $6, $0
/* 016B3C 00116A3C 2D18E000 */  daddu       $3, $7, $0
/* 016B40 00116A40 2D580001 */  daddu       $11, $8, $0
/* 016B44 00116A44 F0FFBD27 */  addiu       $29, $29, -0x10
/* 016B48 00116A48 2D502001 */  daddu       $10, $9, $0
/* 016B4C 00116A4C 2D30A000 */  daddu       $6, $5, $0
/* 016B50 00116A50 0000BFFF */  sd          $31, 0x0($29)
/* 016B54 00116A54 2D384000 */  daddu       $7, $2, $0
/* 016B58 00116A58 2D406000 */  daddu       $8, $3, $0
/* 016B5C 00116A5C 2D486001 */  daddu       $9, $11, $0
/* 016B60 00116A60 305A040C */  jal         _sceSifSendCmd
/* 016B64 00116A64 01000524 */   addiu      $5, $0, 0x1
/* 016B68 00116A68 0000BFDF */  ld          $31, 0x0($29)
/* 016B6C 00116A6C 0800E003 */  jr          $31
/* 016B70 00116A70 1000BD27 */   addiu      $29, $29, 0x10
/* 016B74 00116A74 00000000 */  nop
