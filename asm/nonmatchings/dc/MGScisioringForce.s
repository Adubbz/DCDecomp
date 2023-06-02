.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MGScisioringForce__Fi
/* 2E370 0012E270 C701013C */  lui        $at, (0x1C75838 >> 16)
/* 2E374 0012E274 385824AC */  sw         $4, (0x1C75838 & 0xFFFF)($at)
/* 2E378 0012E278 0800E003 */  jr         $31
/* 2E37C 0012E27C 00000000 */   nop
