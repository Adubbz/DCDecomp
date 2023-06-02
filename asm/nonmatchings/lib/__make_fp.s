.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __make_fp
/* 11310 00111210 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 11314 00111214 0000A4AF */  sw         $4, 0x0($sp)
/* 11318 00111218 1000BFFF */  sd         $31, 0x10($sp)
/* 1131C 0011121C 2D20A003 */  daddu      $4, $sp, $0
/* 11320 00111220 0400A5AF */  sw         $5, 0x4($sp)
/* 11324 00111224 0800A6AF */  sw         $6, 0x8($sp)
/* 11328 00111228 A841040C */  jal        __pack_f
/* 1132C 0011122C 0C00A7AF */   sw        $7, 0xC($sp)
/* 11330 00111230 1000BFDF */  ld         $31, 0x10($sp)
/* 11334 00111234 0800E003 */  jr         $31
/* 11338 00111238 2000BD27 */   addiu     $sp, $sp, 0x20
/* 1133C 0011123C 00000000 */  nop
