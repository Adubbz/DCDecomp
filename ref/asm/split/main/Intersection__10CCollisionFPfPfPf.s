.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Intersection__10CCollisionFPfPfPf
/* 027950 00127850 28160070 */  paddub      $2, $0, $0
/* 027954 00127854 0800E003 */  jr          $31
/* 027958 00127858 00000000 */   nop
/* 02795C 0012785C 00000000 */  nop
