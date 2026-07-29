.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetNowTime__9CSaveDataFv
/* 057CD0 00157BD0 D00180C4 */  lwc1        $f0, 0x1D0($4)
/* 057CD4 00157BD4 0800E003 */  jr          $31
/* 057CD8 00157BD8 00000000 */   nop
/* 057CDC 00157BDC 00000000 */  nop
