.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMenuItemUseVolume__Fv
/* 10C4D0 0020C3D0 D895828F */  lw         $2, -0x6A28($gp)
/* 10C4D4 0020C3D4 0800E003 */  jr         $31
/* 10C4D8 0020C3D8 00000000 */   nop
/* 10C4DC 0020C3DC 00000000 */  nop
