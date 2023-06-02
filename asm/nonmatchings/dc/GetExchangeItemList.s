.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetExchangeItemList__Fi
/* F1350 001F1250 80180400 */  sll        $3, $4, 2
/* F1354 001F1254 2900023C */  lui        $2, %hi(exitemlst)
/* F1358 001F1258 D0294224 */  addiu      $2, $2, %lo(exitemlst)
/* F135C 001F125C 21104300 */  addu       $2, $2, $3
/* F1360 001F1260 0800E003 */  jr         $31
/* F1364 001F1264 00000000 */   nop
/* F1368 001F1268 00000000 */  nop
/* F136C 001F126C 00000000 */  nop
