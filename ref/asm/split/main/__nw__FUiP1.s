.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __nw__FUiP1
/* 027C80 00127B80 2816A070 */  paddub      $2, $5, $0
/* 027C84 00127B84 0800E003 */  jr          $31
/* 027C88 00127B88 00000000 */   nop
/* 027C8C 00127B8C 00000000 */  nop
