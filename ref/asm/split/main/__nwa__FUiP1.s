.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __nwa__FUiP1
/* 027C90 00127B90 2816A070 */  paddub      $2, $5, $0
/* 027C94 00127B94 0800E003 */  jr          $31
/* 027C98 00127B98 00000000 */   nop
/* 027C9C 00127B9C 00000000 */  nop
