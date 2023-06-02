.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifSetSysCmdBuffer
/* 16950 00116850 2A00033C */  lui        $3, %hi(D_002A5918)
/* 16954 00116854 18596324 */  addiu      $3, $3, %lo(D_002A5918)
/* 16958 00116858 0C00628C */  lw         $2, 0xC($3)
/* 1695C 0011685C 100065AC */  sw         $5, 0x10($3)
/* 16960 00116860 0800E003 */  jr         $31
/* 16964 00116864 0C0064AC */   sw        $4, 0xC($3)
