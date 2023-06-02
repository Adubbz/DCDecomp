.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_URA_DUNGEON__FP12RS_STACKDATAi
/* BC400 001BC300 02000224 */  addiu      $2, $0, 0x2
/* BC404 001BC304 D501013C */  lui        $at, (0x1D567D8 >> 16)
/* BC408 001BC308 D86722AC */  sw         $2, (0x1D567D8 & 0xFFFF)($at)
/* BC40C 001BC30C 01000224 */  addiu      $2, $0, 0x1
/* BC410 001BC310 0800E003 */  jr         $31
/* BC414 001BC314 00000000 */   nop
/* BC418 001BC318 00000000 */  nop
/* BC41C 001BC31C 00000000 */  nop
