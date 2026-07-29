.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_TALKNPC_ID__FP12RS_STACKDATAi
/* 0915F0 001914F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0915F4 001914F4 0000BF7F */  sq          $31, 0x0($29)
/* 0915F8 001914F8 0400A01C */  bgtz        $5, .L0019150C
/* 0915FC 001914FC 00000000 */   nop
/* 091600 00191500 28160070 */  paddub      $2, $0, $0
/* 091604 00191504 06000010 */  b           .L00191520
/* 091608 00191508 00000000 */   nop
.L0019150C:
/* 09160C 0019150C D401013C */  lui         $1, %hi(EdEventInfo + 0x260)
/* 091610 00191510 30D4258C */  lw          $5, %lo(EdEventInfo + 0x260)($1)
/* 091614 00191514 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 091618 00191518 00000000 */   nop
/* 09161C 0019151C 01000224 */  addiu       $2, $0, 0x1
.L00191520:
/* 091620 00191520 0000BF7B */  lq          $31, 0x0($29)
/* 091624 00191524 1000BD27 */  addiu       $29, $29, 0x10
/* 091628 00191528 0800E003 */  jr          $31
/* 09162C 0019152C 00000000 */   nop
