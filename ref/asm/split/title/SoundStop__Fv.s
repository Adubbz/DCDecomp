.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SoundStop__Fv
/* 0041D0 01DAFED0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0041D4 01DAFED4 0000BF7F */  sq          $31, 0x0($29)
/* 0041D8 01DAFED8 1469050C */  jal         SndStopAllSe__Fv
/* 0041DC 01DAFEDC 00000000 */   nop
/* 0041E0 01DAFEE0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0041E4 01DAFEE4 282E0070 */  paddub      $5, $0, $0
/* 0041E8 01DAFEE8 441A050C */  jal         Stop__6CSoundFi
/* 0041EC 01DAFEEC 00000000 */   nop
/* 0041F0 01DAFEF0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0041F4 01DAFEF4 282E0070 */  paddub      $5, $0, $0
/* 0041F8 01DAFEF8 FC0E050C */  jal         StopVoice__6CSoundFi
/* 0041FC 01DAFEFC 00000000 */   nop
/* 004200 01DAFF00 0000BF7B */  lq          $31, 0x0($29)
/* 004204 01DAFF04 1000BD27 */  addiu       $29, $29, 0x10
/* 004208 01DAFF08 0800E003 */  jr          $31
/* 00420C 01DAFF0C 00000000 */   nop
