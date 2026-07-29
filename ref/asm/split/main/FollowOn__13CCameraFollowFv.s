.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FollowOn__13CCameraFollowFv
/* 024C00 00124B00 01000324 */  addiu       $3, $0, 0x1
/* 024C04 00124B04 E00283AC */  sw          $3, 0x2E0($4)
/* 024C08 00124B08 0800E003 */  jr          $31
/* 024C0C 00124B0C 00000000 */   nop
