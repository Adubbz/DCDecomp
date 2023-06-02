.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _NO_STATUS_RECOVER__FP12RS_STACKDATAi
/* BD620 001BD520 01000224 */  addiu      $2, $0, 0x1
/* BD624 001BD524 D501013C */  lui        $at, (0x1D567F8 >> 16)
/* BD628 001BD528 F86722AC */  sw         $2, (0x1D567F8 & 0xFFFF)($at)
/* BD62C 001BD52C 0800E003 */  jr         $31
/* BD630 001BD530 00000000 */   nop
/* BD634 001BD534 00000000 */  nop
/* BD638 001BD538 00000000 */  nop
/* BD63C 001BD53C 00000000 */  nop
