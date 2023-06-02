.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GOTO_FP_CHANGE__FP12RS_STACKDATAi
/* 8C280 0018C180 08000224 */  addiu      $2, $0, 0x8
/* 8C284 0018C184 289282AF */  sw         $2, -0x6DD8($gp)
/* 8C288 0018C188 01000224 */  addiu      $2, $0, 0x1
/* 8C28C 0018C18C 0800E003 */  jr         $31
/* 8C290 0018C190 00000000 */   nop
/* 8C294 0018C194 00000000 */  nop
/* 8C298 0018C198 00000000 */  nop
/* 8C29C 0018C19C 00000000 */  nop
