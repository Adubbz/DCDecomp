.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddPlayTime__9CSaveDataFi
/* 57C90 00157B90 D401838C */  lw         $3, 0x1D4($4)
/* 57C94 00157B94 21186500 */  addu       $3, $3, $5
/* 57C98 00157B98 D40183AC */  sw         $3, 0x1D4($4)
/* 57C9C 00157B9C 0800E003 */  jr         $31
/* 57CA0 00157BA0 00000000 */   nop
/* 57CA4 00157BA4 00000000 */  nop
/* 57CA8 00157BA8 00000000 */  nop
/* 57CAC 00157BAC 00000000 */  nop
