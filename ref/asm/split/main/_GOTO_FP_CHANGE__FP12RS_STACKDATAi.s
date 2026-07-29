.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GOTO_FP_CHANGE__FP12RS_STACKDATAi
/* 08C280 0018C180 08000224 */  addiu       $2, $0, 0x8
/* 08C284 0018C184 289282AF */  sw          $2, -0x6DD8($28)
/* 08C288 0018C188 01000224 */  addiu       $2, $0, 0x1
/* 08C28C 0018C18C 0800E003 */  jr          $31
/* 08C290 0018C190 00000000 */   nop
/* 08C294 0018C194 00000000 */  nop
/* 08C298 0018C198 00000000 */  nop
/* 08C29C 0018C19C 00000000 */  nop
