.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SaveMenuKeyDelete__Fv
/* 122350 00222250 01000224 */  addiu      $2, $0, 0x1
/* 122354 00222254 0800E003 */  jr         $31
/* 122358 00222258 00000000 */   nop
/* 12235C 0022225C 00000000 */  nop
