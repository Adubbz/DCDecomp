.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MotionTrg__10CActionSeqFi
/* 055380 00155280 E0FFBD27 */  addiu       $29, $29, -0x20
/* 055384 00155284 1000BF7F */  sq          $31, 0x10($29)
/* 055388 00155288 0000B07F */  sq          $16, 0x0($29)
/* 05538C 0015528C 2886A070 */  paddub      $16, $5, $0
/* 055390 00155290 4053050C */  jal         NextMoveSeq__10CActionSeqFv
/* 055394 00155294 00000000 */   nop
/* 055398 00155298 04004010 */  beqz        $2, .L001552AC
/* 05539C 0015529C 00000000 */   nop
/* 0553A0 001552A0 0E000324 */  addiu       $3, $0, 0xE
/* 0553A4 001552A4 000043AC */  sw          $3, 0x0($2)
/* 0553A8 001552A8 040050AC */  sw          $16, 0x4($2)
.L001552AC:
/* 0553AC 001552AC 1000BF7B */  lq          $31, 0x10($29)
/* 0553B0 001552B0 0000B07B */  lq          $16, 0x0($29)
/* 0553B4 001552B4 2000BD27 */  addiu       $29, $29, 0x20
/* 0553B8 001552B8 0800E003 */  jr          $31
/* 0553BC 001552BC 00000000 */   nop
