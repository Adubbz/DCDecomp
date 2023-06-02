.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __ct__10CFrameAttrFv
/* 27E40 00127D40 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 27E44 00127D44 1000BF7F */  sq         $31, 0x10($sp)
/* 27E48 00127D48 0000B07F */  sq         $16, 0x0($sp)
/* 27E4C 00127D4C 28868070 */  paddub     $16, $4, $0
/* 27E50 00127D50 309F040C */  jal        Initialize__10CFrameAttrFv
/* 27E54 00127D54 00000000 */   nop
/* 27E58 00127D58 28160072 */  paddub     $2, $16, $0
/* 27E5C 00127D5C 1000BF7B */  lq         $31, 0x10($sp)
/* 27E60 00127D60 0000B07B */  lq         $16, 0x0($sp)
/* 27E64 00127D64 2000BD27 */  addiu      $sp, $sp, 0x20
/* 27E68 00127D68 0800E003 */  jr         $31
/* 27E6C 00127D6C 00000000 */   nop
