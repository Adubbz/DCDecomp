.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FollowOff__13CCameraFollowFv
/* 24C10 00124B10 E00280AC */  sw         $0, 0x2E0($4)
/* 24C14 00124B14 0800E003 */  jr         $31
/* 24C18 00124B18 00000000 */   nop
/* 24C1C 00124B1C 00000000 */  nop
