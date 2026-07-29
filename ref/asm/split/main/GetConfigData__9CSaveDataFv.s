.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetConfigData__9CSaveDataFv
/* 057C30 00157B30 28168070 */  paddub      $2, $4, $0
/* 057C34 00157B34 0800E003 */  jr          $31
/* 057C38 00157B38 00000000 */   nop
/* 057C3C 00157B3C 00000000 */  nop
