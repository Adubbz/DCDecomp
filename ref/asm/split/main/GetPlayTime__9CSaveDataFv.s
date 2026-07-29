.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetPlayTime__9CSaveDataFv
/* 057CB0 00157BB0 D401828C */  lw          $2, 0x1D4($4)
/* 057CB4 00157BB4 0800E003 */  jr          $31
/* 057CB8 00157BB8 00000000 */   nop
/* 057CBC 00157BBC 00000000 */  nop
