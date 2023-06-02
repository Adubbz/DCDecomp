.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MotionTrg__10CActionSeqFi
/* 55380 00155280 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 55384 00155284 1000BF7F */  sq         $31, 0x10($sp)
/* 55388 00155288 0000B07F */  sq         $16, 0x0($sp)
/* 5538C 0015528C 2886A070 */  paddub     $16, $5, $0
/* 55390 00155290 4053050C */  jal        NextMoveSeq__10CActionSeqFv
/* 55394 00155294 00000000 */   nop
/* 55398 00155298 04004010 */  beqz       $2, .L001552AC
/* 5539C 0015529C 00000000 */   nop
/* 553A0 001552A0 0E000324 */  addiu      $3, $0, 0xE
/* 553A4 001552A4 000043AC */  sw         $3, 0x0($2)
/* 553A8 001552A8 040050AC */  sw         $16, 0x4($2)
.L001552AC:
/* 553AC 001552AC 1000BF7B */  lq         $31, 0x10($sp)
/* 553B0 001552B0 0000B07B */  lq         $16, 0x0($sp)
/* 553B4 001552B4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 553B8 001552B8 0800E003 */  jr         $31
/* 553BC 001552BC 00000000 */   nop
