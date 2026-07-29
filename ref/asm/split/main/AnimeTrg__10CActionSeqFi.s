.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AnimeTrg__10CActionSeqFi
/* 0553C0 001552C0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0553C4 001552C4 1000BF7F */  sq          $31, 0x10($29)
/* 0553C8 001552C8 0000B07F */  sq          $16, 0x0($29)
/* 0553CC 001552CC 2886A070 */  paddub      $16, $5, $0
/* 0553D0 001552D0 4053050C */  jal         NextMoveSeq__10CActionSeqFv
/* 0553D4 001552D4 00000000 */   nop
/* 0553D8 001552D8 04004010 */  beqz        $2, .L001552EC
/* 0553DC 001552DC 00000000 */   nop
/* 0553E0 001552E0 12000324 */  addiu       $3, $0, 0x12
/* 0553E4 001552E4 000043AC */  sw          $3, 0x0($2)
/* 0553E8 001552E8 040050AC */  sw          $16, 0x4($2)
.L001552EC:
/* 0553EC 001552EC 1000BF7B */  lq          $31, 0x10($29)
/* 0553F0 001552F0 0000B07B */  lq          $16, 0x0($29)
/* 0553F4 001552F4 2000BD27 */  addiu       $29, $29, 0x20
/* 0553F8 001552F8 0800E003 */  jr          $31
/* 0553FC 001552FC 00000000 */   nop
