.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceGifPkReset
/* 20860 00120760 0400828C */  lw         $2, 0x4($4)
/* 20864 00120764 080080AC */  sw         $0, 0x8($4)
/* 20868 00120768 0800E003 */  jr         $31
/* 2086C 0012076C 000082AC */   sw        $2, 0x0($4)
