.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMidiState__6CSoundFv
/* 43C50 00143B50 CF01023C */  lui        $2, %hi(midi_state)
/* 43C54 00143B54 40824224 */  addiu      $2, $2, %lo(midi_state)
/* 43C58 00143B58 0800E003 */  jr         $31
/* 43C5C 00143B5C 00000000 */   nop
