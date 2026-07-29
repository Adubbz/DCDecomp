.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceGifPkReset
/* 020860 00120760 0400828C */  lw          $2, 0x4($4)
/* 020864 00120764 080080AC */  sw          $0, 0x8($4)
/* 020868 00120768 0800E003 */  jr          $31
/* 02086C 0012076C 000082AC */   sw         $2, 0x0($4)
