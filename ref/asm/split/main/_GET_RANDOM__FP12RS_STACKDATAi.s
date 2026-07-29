.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_RANDOM__FP12RS_STACKDATAi
/* 08BBC0 0018BAC0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 08BBC4 0018BAC4 1000BF7F */  sq          $31, 0x10($29)
/* 08BBC8 0018BAC8 0000B07F */  sq          $16, 0x0($29)
/* 08BBCC 0018BACC 28868070 */  paddub      $16, $4, $0
/* 08BBD0 0018BAD0 0400A01C */  bgtz        $5, .L0018BAE4
/* 08BBD4 0018BAD4 00000000 */   nop
/* 08BBD8 0018BAD8 28160070 */  paddub      $2, $0, $0
/* 08BBDC 0018BADC 08000010 */  b           .L0018BB00
/* 08BBE0 0018BAE0 00000000 */   nop
.L0018BAE4:
/* 08BBE4 0018BAE4 BE11040C */  jal         rand
/* 08BBE8 0018BAE8 00000000 */   nop
/* 08BBEC 0018BAEC 28260072 */  paddub      $4, $16, $0
/* 08BBF0 0018BAF0 282E4070 */  paddub      $5, $2, $0
/* 08BBF4 0018BAF4 F828060C */  jal         SetStack__FP12RS_STACKDATAi
/* 08BBF8 0018BAF8 00000000 */   nop
/* 08BBFC 0018BAFC 01000224 */  addiu       $2, $0, 0x1
.L0018BB00:
/* 08BC00 0018BB00 1000BF7B */  lq          $31, 0x10($29)
/* 08BC04 0018BB04 0000B07B */  lq          $16, 0x0($29)
/* 08BC08 0018BB08 2000BD27 */  addiu       $29, $29, 0x20
/* 08BC0C 0018BB0C 0800E003 */  jr          $31
/* 08BC10 0018BB10 00000000 */   nop
/* 08BC14 0018BB14 00000000 */  nop
/* 08BC18 0018BB18 00000000 */  nop
/* 08BC1C 0018BB1C 00000000 */  nop
