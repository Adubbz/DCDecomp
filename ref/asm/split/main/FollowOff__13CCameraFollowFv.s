.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FollowOff__13CCameraFollowFv
/* 024C10 00124B10 E00280AC */  sw          $0, 0x2E0($4)
/* 024C14 00124B14 0800E003 */  jr          $31
/* 024C18 00124B18 00000000 */   nop
/* 024C1C 00124B1C 00000000 */  nop
