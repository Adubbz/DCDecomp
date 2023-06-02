.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FollowOn__13CCameraFollowFv
/* 24C00 00124B00 01000324 */  addiu      $3, $0, 0x1
/* 24C04 00124B04 E00283AC */  sw         $3, 0x2E0($4)
/* 24C08 00124B08 0800E003 */  jr         $31
/* 24C0C 00124B0C 00000000 */   nop
