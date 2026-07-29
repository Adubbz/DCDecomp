.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetMidiState__6CSoundFv
/* 043C50 00143B50 CF01023C */  lui         $2, %hi(midi_state)
/* 043C54 00143B54 40824224 */  addiu       $2, $2, %lo(midi_state)
/* 043C58 00143B58 0800E003 */  jr          $31
/* 043C5C 00143B5C 00000000 */   nop
