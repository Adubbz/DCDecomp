.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetExchangeItemList__Fi
/* 0F1350 001F1250 80180400 */  sll         $3, $4, 2
/* 0F1354 001F1254 2900023C */  lui         $2, %hi(exitemlst)
/* 0F1358 001F1258 D0294224 */  addiu       $2, $2, %lo(exitemlst)
/* 0F135C 001F125C 21104300 */  addu        $2, $2, $3
/* 0F1360 001F1260 0800E003 */  jr          $31
/* 0F1364 001F1264 00000000 */   nop
/* 0F1368 001F1268 00000000 */  nop
/* 0F136C 001F126C 00000000 */  nop
