.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_URA_DUNGEON__FP12RS_STACKDATAi
/* 0BC400 001BC300 02000224 */  addiu       $2, $0, 0x2
/* 0BC404 001BC304 D501013C */  lui         $1, %hi(BtEventInfo + 0x98)
/* 0BC408 001BC308 D86722AC */  sw          $2, %lo(BtEventInfo + 0x98)($1)
/* 0BC40C 001BC30C 01000224 */  addiu       $2, $0, 0x1
/* 0BC410 001BC310 0800E003 */  jr          $31
/* 0BC414 001BC314 00000000 */   nop
/* 0BC418 001BC318 00000000 */  nop
/* 0BC41C 001BC31C 00000000 */  nop
