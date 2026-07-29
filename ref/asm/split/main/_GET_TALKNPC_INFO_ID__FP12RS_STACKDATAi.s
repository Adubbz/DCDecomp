.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_TALKNPC_INFO_ID__FP12RS_STACKDATAi
/* 091590 00191490 E0FFBD27 */  addiu       $29, $29, -0x20
/* 091594 00191494 1000BF7F */  sq          $31, 0x10($29)
/* 091598 00191498 0000B07F */  sq          $16, 0x0($29)
/* 09159C 0019149C 28868070 */  paddub      $16, $4, $0
/* 0915A0 001914A0 0400A01C */  bgtz        $5, .L001914B4
/* 0915A4 001914A4 00000000 */   nop
/* 0915A8 001914A8 28160070 */  paddub      $2, $0, $0
/* 0915AC 001914AC 08000010 */  b           .L001914D0
/* 0915B0 001914B0 00000000 */   nop
.L001914B4:
/* 0915B4 001914B4 2064060C */  jal         EdNowTalkCharaInfoID__Fv
/* 0915B8 001914B8 00000000 */   nop
/* 0915BC 001914BC 28260072 */  paddub      $4, $16, $0
/* 0915C0 001914C0 282E4070 */  paddub      $5, $2, $0
/* 0915C4 001914C4 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 0915C8 001914C8 00000000 */   nop
/* 0915CC 001914CC 01000224 */  addiu       $2, $0, 0x1
.L001914D0:
/* 0915D0 001914D0 1000BF7B */  lq          $31, 0x10($29)
/* 0915D4 001914D4 0000B07B */  lq          $16, 0x0($29)
/* 0915D8 001914D8 2000BD27 */  addiu       $29, $29, 0x20
/* 0915DC 001914DC 0800E003 */  jr          $31
/* 0915E0 001914E0 00000000 */   nop
/* 0915E4 001914E4 00000000 */  nop
/* 0915E8 001914E8 00000000 */  nop
/* 0915EC 001914EC 00000000 */  nop
