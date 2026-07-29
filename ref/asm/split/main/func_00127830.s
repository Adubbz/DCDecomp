.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel func_00127830
/* 027930 00127830 28160070 */  paddub      $2, $0, $0
/* 027934 00127834 0800E003 */  jr          $31
/* 027938 00127838 00000000 */   nop
/* 02793C 0012783C 00000000 */  nop
