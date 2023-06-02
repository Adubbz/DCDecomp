.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetGradationColorInfo2__Fi
/* F3FE0 001F3EE0 00190400 */  sll        $3, $4, 4
/* F3FE4 001F3EE4 2900023C */  lui        $2, %hi(MenuColorInfo2)
/* F3FE8 001F3EE8 B02C4224 */  addiu      $2, $2, %lo(MenuColorInfo2)
/* F3FEC 001F3EEC 21104300 */  addu       $2, $2, $3
/* F3FF0 001F3EF0 0800E003 */  jr         $31
/* F3FF4 001F3EF4 00000000 */   nop
/* F3FF8 001F3EF8 00000000 */  nop
/* F3FFC 001F3EFC 00000000 */  nop
