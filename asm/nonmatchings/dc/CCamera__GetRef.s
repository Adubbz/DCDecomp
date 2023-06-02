.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRef__7CCameraFPf
/* 247A0 001246A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 247A4 001246A4 0000BF7F */  sq         $31, 0x0($sp)
/* 247A8 001246A8 28168070 */  paddub     $2, $4, $0
/* 247AC 001246AC 2826A070 */  paddub     $4, $5, $0
/* 247B0 001246B0 70024524 */  addiu      $5, $2, 0x270
/* 247B4 001246B4 0C86040C */  jal        sceVu0CopyVector
/* 247B8 001246B8 00000000 */   nop
/* 247BC 001246BC 0000BF7B */  lq         $31, 0x0($sp)
/* 247C0 001246C0 1000BD27 */  addiu      $sp, $sp, 0x10
/* 247C4 001246C4 0800E003 */  jr         $31
/* 247C8 001246C8 00000000 */   nop
/* 247CC 001246CC 00000000 */  nop
