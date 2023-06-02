.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtSetMapJumpFloor__Fi
/* BBA20 001BB920 F49384AF */  sw         $4, -0x6C0C($gp)
/* BBA24 001BB924 0800E003 */  jr         $31
/* BBA28 001BB928 00000000 */   nop
/* BBA2C 001BB92C 00000000 */  nop
