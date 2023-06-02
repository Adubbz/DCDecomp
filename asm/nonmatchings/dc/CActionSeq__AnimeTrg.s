.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AnimeTrg__10CActionSeqFi
/* 553C0 001552C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 553C4 001552C4 1000BF7F */  sq         $31, 0x10($sp)
/* 553C8 001552C8 0000B07F */  sq         $16, 0x0($sp)
/* 553CC 001552CC 2886A070 */  paddub     $16, $5, $0
/* 553D0 001552D0 4053050C */  jal        NextMoveSeq__10CActionSeqFv
/* 553D4 001552D4 00000000 */   nop
/* 553D8 001552D8 04004010 */  beqz       $2, .L001552EC
/* 553DC 001552DC 00000000 */   nop
/* 553E0 001552E0 12000324 */  addiu      $3, $0, 0x12
/* 553E4 001552E4 000043AC */  sw         $3, 0x0($2)
/* 553E8 001552E8 040050AC */  sw         $16, 0x4($2)
.L001552EC:
/* 553EC 001552EC 1000BF7B */  lq         $31, 0x10($sp)
/* 553F0 001552F0 0000B07B */  lq         $16, 0x0($sp)
/* 553F4 001552F4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 553F8 001552F8 0800E003 */  jr         $31
/* 553FC 001552FC 00000000 */   nop
