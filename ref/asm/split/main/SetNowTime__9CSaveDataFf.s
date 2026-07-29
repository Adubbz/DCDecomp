.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetNowTime__9CSaveDataFf
/* 057CC0 00157BC0 D0018CE4 */  swc1        $f12, 0x1D0($4)
/* 057CC4 00157BC4 0800E003 */  jr          $31
/* 057CC8 00157BC8 00000000 */   nop
/* 057CCC 00157BCC 00000000 */  nop
