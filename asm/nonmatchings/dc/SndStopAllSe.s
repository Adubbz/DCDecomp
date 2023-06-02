.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndStopAllSe__Fv
/* 5A550 0015A450 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 5A554 0015A454 0000BF7F */  sq         $31, 0x0($sp)
/* 5A558 0015A458 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A55C 0015A45C 0F000524 */  addiu      $5, $0, 0xF
/* 5A560 0015A460 441A050C */  jal        Stop__6CSoundFi
/* 5A564 0015A464 00000000 */   nop
/* 5A568 0015A468 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A56C 0015A46C 01000524 */  addiu      $5, $0, 0x1
/* 5A570 0015A470 441A050C */  jal        Stop__6CSoundFi
/* 5A574 0015A474 00000000 */   nop
/* 5A578 0015A478 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A57C 0015A47C 0E000524 */  addiu      $5, $0, 0xE
/* 5A580 0015A480 441A050C */  jal        Stop__6CSoundFi
/* 5A584 0015A484 00000000 */   nop
/* 5A588 0015A488 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A58C 0015A48C 0A000524 */  addiu      $5, $0, 0xA
/* 5A590 0015A490 441A050C */  jal        Stop__6CSoundFi
/* 5A594 0015A494 00000000 */   nop
/* 5A598 0015A498 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A59C 0015A49C 0D000524 */  addiu      $5, $0, 0xD
/* 5A5A0 0015A4A0 441A050C */  jal        Stop__6CSoundFi
/* 5A5A4 0015A4A4 00000000 */   nop
/* 5A5A8 0015A4A8 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A5AC 0015A4AC 0C000524 */  addiu      $5, $0, 0xC
/* 5A5B0 0015A4B0 441A050C */  jal        Stop__6CSoundFi
/* 5A5B4 0015A4B4 00000000 */   nop
/* 5A5B8 0015A4B8 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A5BC 0015A4BC 0B000524 */  addiu      $5, $0, 0xB
/* 5A5C0 0015A4C0 441A050C */  jal        Stop__6CSoundFi
/* 5A5C4 0015A4C4 00000000 */   nop
/* 5A5C8 0015A4C8 3C6C050C */  jal        SndAmbientInit__Fv
/* 5A5CC 0015A4CC 00000000 */   nop
/* 5A5D0 0015A4D0 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A5D4 0015A4D4 01000524 */  addiu      $5, $0, 0x1
/* 5A5D8 0015A4D8 FC0E050C */  jal        StopVoice__6CSoundFi
/* 5A5DC 0015A4DC 00000000 */   nop
/* 5A5E0 0015A4E0 0000BF7B */  lq         $31, 0x0($sp)
/* 5A5E4 0015A4E4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 5A5E8 0015A4E8 0800E003 */  jr         $31
/* 5A5EC 0015A4EC 00000000 */   nop
