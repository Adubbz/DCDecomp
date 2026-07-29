.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _LOAD_SYNC__FP12RS_STACKDATAi
/* 08C570 0018C470 E0FFBD27 */  addiu       $29, $29, -0x20
/* 08C574 0018C474 1000BF7F */  sq          $31, 0x10($29)
/* 08C578 0018C478 0000B07F */  sq          $16, 0x0($29)
/* 08C57C 0018C47C 28868070 */  paddub      $16, $4, $0
/* 08C580 0018C480 0400A01C */  bgtz        $5, .L0018C494
/* 08C584 0018C484 00000000 */   nop
/* 08C588 0018C488 28160070 */  paddub      $2, $0, $0
/* 08C58C 0018C48C 09000010 */  b           .L0018C4B4
/* 08C590 0018C490 00000000 */   nop
.L0018C494:
/* 08C594 0018C494 8CFB040C */  jal         ReadBGSync__Fv
/* 08C598 0018C498 00000000 */   nop
/* 08C59C 0018C49C 28260072 */  paddub      $4, $16, $0
/* 08C5A0 0018C4A0 282E4070 */  paddub      $5, $2, $0
/* 08C5A4 0018C4A4 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 08C5A8 0018C4A8 00000000 */   nop
/* 08C5AC 0018C4AC 209280AF */  sw          $0, -0x6DE0($28)
/* 08C5B0 0018C4B0 01000224 */  addiu       $2, $0, 0x1
.L0018C4B4:
/* 08C5B4 0018C4B4 1000BF7B */  lq          $31, 0x10($29)
/* 08C5B8 0018C4B8 0000B07B */  lq          $16, 0x0($29)
/* 08C5BC 0018C4BC 2000BD27 */  addiu       $29, $29, 0x20
/* 08C5C0 0018C4C0 0800E003 */  jr          $31
/* 08C5C4 0018C4C4 00000000 */   nop
/* 08C5C8 0018C4C8 00000000 */  nop
/* 08C5CC 0018C4CC 00000000 */  nop
