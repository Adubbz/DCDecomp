.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel what__Q23std13bad_exceptionCFv
/* 022E90 00122D90 2A00023C */  lui         $2, %hi(LIT_1039)
/* 022E94 00122D94 0800E003 */  jr          $31
/* 022E98 00122D98 788D4224 */   addiu      $2, $2, %lo(LIT_1039)
/* 022E9C 00122D9C 00000000 */  nop
