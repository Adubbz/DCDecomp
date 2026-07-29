.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AddPlayTime__9CSaveDataFi
/* 057C90 00157B90 D401838C */  lw          $3, 0x1D4($4)
/* 057C94 00157B94 21186500 */  addu        $3, $3, $5
/* 057C98 00157B98 D40183AC */  sw          $3, 0x1D4($4)
/* 057C9C 00157B9C 0800E003 */  jr          $31
/* 057CA0 00157BA0 00000000 */   nop
/* 057CA4 00157BA4 00000000 */  nop
/* 057CA8 00157BA8 00000000 */  nop
/* 057CAC 00157BAC 00000000 */  nop
