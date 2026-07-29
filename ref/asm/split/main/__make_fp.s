.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __make_fp
/* 011310 00111210 E0FFBD27 */  addiu       $29, $29, -0x20
/* 011314 00111214 0000A4AF */  sw          $4, 0x0($29)
/* 011318 00111218 1000BFFF */  sd          $31, 0x10($29)
/* 01131C 0011121C 2D20A003 */  daddu       $4, $29, $0
/* 011320 00111220 0400A5AF */  sw          $5, 0x4($29)
/* 011324 00111224 0800A6AF */  sw          $6, 0x8($29)
/* 011328 00111228 A841040C */  jal         __pack_f
/* 01132C 0011122C 0C00A7AF */   sw         $7, 0xC($29)
/* 011330 00111230 1000BFDF */  ld          $31, 0x10($29)
/* 011334 00111234 0800E003 */  jr          $31
/* 011338 00111238 2000BD27 */   addiu      $29, $29, 0x20
/* 01133C 0011123C 00000000 */  nop
