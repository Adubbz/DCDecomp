.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DeleteReference__5CFishFv
/* 1411F0 002410F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1411F4 002410F4 1000BF7F */  sq         $31, 0x10($sp)
/* 1411F8 002410F8 0000B07F */  sq         $16, 0x0($sp)
/* 1411FC 002410FC 28868070 */  paddub     $16, $4, $0
/* 141200 00241100 5C01848C */  lw         $4, 0x15C($4)
/* 141204 00241104 03008010 */  beqz       $4, .L00241114
/* 141208 00241108 00000000 */   nop
/* 14120C 0024110C 68A0040C */  jal        DeleteReference__6CFrameFv
/* 141210 00241110 00000000 */   nop
.L00241114:
/* 141214 00241114 0C13048E */  lw         $4, 0x130C($16)
/* 141218 00241118 03008010 */  beqz       $4, .L00241128
/* 14121C 0024111C 00000000 */   nop
/* 141220 00241120 68A0040C */  jal        DeleteReference__6CFrameFv
/* 141224 00241124 00000000 */   nop
.L00241128:
/* 141228 00241128 1000BF7B */  lq         $31, 0x10($sp)
/* 14122C 0024112C 0000B07B */  lq         $16, 0x0($sp)
/* 141230 00241130 2000BD27 */  addiu      $sp, $sp, 0x20
/* 141234 00241134 0800E003 */  jr         $31
/* 141238 00241138 00000000 */   nop
/* 14123C 0024113C 00000000 */  nop
