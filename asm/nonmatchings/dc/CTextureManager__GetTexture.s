.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetTexture__15CTextureManagerFi
/* 31390 00131290 0500A004 */  bltz       $5, .L001312A8
/* 31394 00131294 00000000 */   nop
/* 31398 00131298 0000828C */  lw         $2, 0x0($4)
/* 3139C 0013129C 2A10A200 */  slt        $2, $5, $2
/* 313A0 001312A0 04004014 */  bnez       $2, .L001312B4
/* 313A4 001312A4 00000000 */   nop
.L001312A8:
/* 313A8 001312A8 F8108224 */  addiu      $2, $4, 0x10F8
/* 313AC 001312AC 06000010 */  b          .L001312C8
/* 313B0 001312B0 00000000 */   nop
.L001312B4:
/* 313B4 001312B4 80100500 */  sll        $2, $5, 2
/* 313B8 001312B8 21104500 */  addu       $2, $2, $5
/* 313BC 001312BC 00110200 */  sll        $2, $2, 4
/* 313C0 001312C0 21108200 */  addu       $2, $4, $2
/* 313C4 001312C4 F8104224 */  addiu      $2, $2, 0x10F8
.L001312C8:
/* 313C8 001312C8 0800E003 */  jr         $31
/* 313CC 001312CC 00000000 */   nop
