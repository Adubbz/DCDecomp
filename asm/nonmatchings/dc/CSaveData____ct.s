.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__9CSaveDataFv
/* 58E30 00158D30 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 58E34 00158D34 1000BF7F */  sq         $31, 0x10($sp)
/* 58E38 00158D38 0000B07F */  sq         $16, 0x0($sp)
/* 58E3C 00158D3C 28868070 */  paddub     $16, $4, $0
/* 58E40 00158D40 500680A4 */  sh         $0, 0x650($4)
/* 58E44 00158D44 50060426 */  addiu      $4, $16, 0x650
/* 58E48 00158D48 B862050C */  jal        InitPos__11CMenuCursorFv
/* 58E4C 00158D4C 00000000 */   nop
/* 58E50 00158D50 28260072 */  paddub     $4, $16, $0
/* 58E54 00158D54 D862050C */  jal        Initialize__9CSaveDataFv
/* 58E58 00158D58 00000000 */   nop
/* 58E5C 00158D5C 28160072 */  paddub     $2, $16, $0
/* 58E60 00158D60 1000BF7B */  lq         $31, 0x10($sp)
/* 58E64 00158D64 0000B07B */  lq         $16, 0x0($sp)
/* 58E68 00158D68 2000BD27 */  addiu      $sp, $sp, 0x20
/* 58E6C 00158D6C 0800E003 */  jr         $31
/* 58E70 00158D70 00000000 */   nop
/* 58E74 00158D74 00000000 */  nop
/* 58E78 00158D78 00000000 */  nop
/* 58E7C 00158D7C 00000000 */  nop
