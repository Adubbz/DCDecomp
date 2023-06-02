.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel srand
/* 47E8 001046E8 2500023C */  lui        $2, (0x250000 >> 16)
/* 47EC 001046EC ECFD438C */  lw         $3, -0x214($2)
/* 47F0 001046F0 0800E003 */  jr         $31
/* 47F4 001046F4 580064AC */   sw        $4, 0x58($3)
