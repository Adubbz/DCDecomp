.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetNowManualMenuMode__Fv
/* 134620 00234520 DB01013C */  lui         $1, %hi(ManualMenu + 0xC)
/* 134624 00234524 7CA82284 */  lh          $2, %lo(ManualMenu + 0xC)($1)
/* 134628 00234528 0800E003 */  jr          $31
/* 13462C 0023452C 00000000 */   nop
