.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __empty
/* D6E8 0010D5E8 0800E003 */  jr         $31
/* D6EC 0010D5EC 00000000 */   nop
