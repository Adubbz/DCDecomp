.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__8CTextureFv
/* 30FF0 00130EF0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 30FF4 00130EF4 1000BF7F */  sq         $31, 0x10($sp)
/* 30FF8 00130EF8 0000B07F */  sq         $16, 0x0($sp)
/* 30FFC 00130EFC 28868070 */  paddub     $16, $4, $0
/* 31000 00130F00 C8C3040C */  jal        Initialize__8CTextureFv
/* 31004 00130F04 00000000 */   nop
/* 31008 00130F08 28160072 */  paddub     $2, $16, $0
/* 3100C 00130F0C 1000BF7B */  lq         $31, 0x10($sp)
/* 31010 00130F10 0000B07B */  lq         $16, 0x0($sp)
/* 31014 00130F14 2000BD27 */  addiu      $sp, $sp, 0x20
/* 31018 00130F18 0800E003 */  jr         $31
/* 3101C 00130F1C 00000000 */   nop
