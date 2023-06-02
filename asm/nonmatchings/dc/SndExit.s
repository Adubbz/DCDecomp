.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndExit__Fv
/* 59390 00159290 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 59394 00159294 0000BF7F */  sq         $31, 0x0($sp)
/* 59398 00159298 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5939C 0015929C 282E0070 */  paddub     $5, $0, $0
/* 593A0 001592A0 441A050C */  jal        Stop__6CSoundFi
/* 593A4 001592A4 00000000 */   nop
/* 593A8 001592A8 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 593AC 001592AC 0F000524 */  addiu      $5, $0, 0xF
/* 593B0 001592B0 441A050C */  jal        Stop__6CSoundFi
/* 593B4 001592B4 00000000 */   nop
/* 593B8 001592B8 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 593BC 001592BC 01000524 */  addiu      $5, $0, 0x1
/* 593C0 001592C0 441A050C */  jal        Stop__6CSoundFi
/* 593C4 001592C4 00000000 */   nop
/* 593C8 001592C8 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 593CC 001592CC 0E000524 */  addiu      $5, $0, 0xE
/* 593D0 001592D0 441A050C */  jal        Stop__6CSoundFi
/* 593D4 001592D4 00000000 */   nop
/* 593D8 001592D8 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 593DC 001592DC 0A000524 */  addiu      $5, $0, 0xA
/* 593E0 001592E0 441A050C */  jal        Stop__6CSoundFi
/* 593E4 001592E4 00000000 */   nop
/* 593E8 001592E8 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 593EC 001592EC 0D000524 */  addiu      $5, $0, 0xD
/* 593F0 001592F0 441A050C */  jal        Stop__6CSoundFi
/* 593F4 001592F4 00000000 */   nop
/* 593F8 001592F8 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 593FC 001592FC 0C000524 */  addiu      $5, $0, 0xC
/* 59400 00159300 441A050C */  jal        Stop__6CSoundFi
/* 59404 00159304 00000000 */   nop
/* 59408 00159308 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5940C 0015930C 282E0070 */  paddub     $5, $0, $0
/* 59410 00159310 FC0E050C */  jal        StopVoice__6CSoundFi
/* 59414 00159314 00000000 */   nop
/* 59418 00159318 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5941C 0015931C 01000524 */  addiu      $5, $0, 0x1
/* 59420 00159320 FC0E050C */  jal        StopVoice__6CSoundFi
/* 59424 00159324 00000000 */   nop
/* 59428 00159328 B46B050C */  jal        SndSeSeqInit__Fv
/* 5942C 0015932C 00000000 */   nop
/* 59430 00159330 4C66050C */  jal        SndBgmInit__Fv
/* 59434 00159334 00000000 */   nop
/* 59438 00159338 3C6C050C */  jal        SndAmbientInit__Fv
/* 5943C 0015933C 00000000 */   nop
/* 59440 00159340 0000BF7B */  lq         $31, 0x0($sp)
/* 59444 00159344 1000BD27 */  addiu      $sp, $sp, 0x10
/* 59448 00159348 0800E003 */  jr         $31
/* 5944C 0015934C 00000000 */   nop
