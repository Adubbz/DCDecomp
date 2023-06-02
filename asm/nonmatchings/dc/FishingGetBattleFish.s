.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingGetBattleFish__Fv
/* A98A0 001A97A0 7093828F */  lw         $2, -0x6C90($gp)
/* A98A4 001A97A4 0800E003 */  jr         $31
/* A98A8 001A97A8 00000000 */   nop
/* A98AC 001A97AC 00000000 */  nop
