.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GO_DUNGEON__FP12RS_STACKDATAi
/* BC580 001BC480 04000224 */  addiu      $2, $0, 0x4
/* BC584 001BC484 D501013C */  lui        $at, (0x1D567D8 >> 16)
/* BC588 001BC488 D86722AC */  sw         $2, (0x1D567D8 & 0xFFFF)($at)
/* BC58C 001BC48C 01000224 */  addiu      $2, $0, 0x1
/* BC590 001BC490 0800E003 */  jr         $31
/* BC594 001BC494 00000000 */   nop
/* BC598 001BC498 00000000 */  nop
/* BC59C 001BC49C 00000000 */  nop
