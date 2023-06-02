.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdCheckItemOver__Fv
/* 73310 00173210 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 73314 00173214 0000BF7F */  sq         $31, 0x0($sp)
/* 73318 00173218 1C8D848F */  lw         $4, -0x72E4($gp)
/* 7331C 0017321C 7860050C */  jal        GetDngStatus__9CSaveDataFv
/* 73320 00173220 00000000 */   nop
/* 73324 00173224 1C43428C */  lw         $2, 0x431C($2)
/* 73328 00173228 0000BF7B */  lq         $31, 0x0($sp)
/* 7332C 0017322C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 73330 00173230 0800E003 */  jr         $31
/* 73334 00173234 00000000 */   nop
/* 73338 00173238 00000000 */  nop
/* 7333C 0017323C 00000000 */  nop
