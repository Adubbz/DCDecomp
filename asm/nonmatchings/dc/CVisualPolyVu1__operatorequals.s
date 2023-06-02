.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __as__14CVisualPolyVu1FRC14CVisualPolyVu1
/* 43460 00143360 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 43464 00143364 1000BF7F */  sq         $31, 0x10($sp)
/* 43468 00143368 0000B07F */  sq         $16, 0x0($sp)
/* 4346C 0014336C 28868070 */  paddub     $16, $4, $0
/* 43470 00143370 E40C050C */  jal        __as__10CVisualVu1FRC10CVisualVu1
/* 43474 00143374 00000000 */   nop
/* 43478 00143378 28160072 */  paddub     $2, $16, $0
/* 4347C 0014337C 1000BF7B */  lq         $31, 0x10($sp)
/* 43480 00143380 0000B07B */  lq         $16, 0x0($sp)
/* 43484 00143384 2000BD27 */  addiu      $sp, $sp, 0x20
/* 43488 00143388 0800E003 */  jr         $31
/* 4348C 0014338C 00000000 */   nop
