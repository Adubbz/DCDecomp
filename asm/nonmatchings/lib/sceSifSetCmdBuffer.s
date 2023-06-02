.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifSetCmdBuffer
/* 16938 00116838 2A00033C */  lui        $3, %hi(D_002A5918)
/* 1693C 0011683C 18596324 */  addiu      $3, $3, %lo(D_002A5918)
/* 16940 00116840 1400628C */  lw         $2, 0x14($3)
/* 16944 00116844 180065AC */  sw         $5, 0x18($3)
/* 16948 00116848 0800E003 */  jr         $31
/* 1694C 0011684C 140064AC */   sw        $4, 0x14($3)
