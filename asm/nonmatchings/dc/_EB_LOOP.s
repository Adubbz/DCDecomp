.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _EB_LOOP__FP12RS_STACKDATAi
/* 968A0 001967A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 968A4 001967A4 1000BF7F */  sq         $31, 0x10($sp)
/* 968A8 001967A8 0000B07F */  sq         $16, 0x0($sp)
/* 968AC 001967AC 28868070 */  paddub     $16, $4, $0
/* 968B0 001967B0 A4A1050C */  jal        EBLoop__Fv
/* 968B4 001967B4 00000000 */   nop
/* 968B8 001967B8 28260072 */  paddub     $4, $16, $0
/* 968BC 001967BC 282E4070 */  paddub     $5, $2, $0
/* 968C0 001967C0 F828060C */  jal        SetStack__FP12RS_STACKDATAi
/* 968C4 001967C4 00000000 */   nop
/* 968C8 001967C8 01000224 */  addiu      $2, $0, 0x1
/* 968CC 001967CC 1000BF7B */  lq         $31, 0x10($sp)
/* 968D0 001967D0 0000B07B */  lq         $16, 0x0($sp)
/* 968D4 001967D4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 968D8 001967D8 0800E003 */  jr         $31
/* 968DC 001967DC 00000000 */   nop
