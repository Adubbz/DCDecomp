.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SndExit__Fv
/* 059390 00159290 F0FFBD27 */  addiu       $29, $29, -0x10
/* 059394 00159294 0000BF7F */  sq          $31, 0x0($29)
/* 059398 00159298 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05939C 0015929C 282E0070 */  paddub      $5, $0, $0
/* 0593A0 001592A0 441A050C */  jal         Stop__6CSoundFi
/* 0593A4 001592A4 00000000 */   nop
/* 0593A8 001592A8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0593AC 001592AC 0F000524 */  addiu       $5, $0, 0xF
/* 0593B0 001592B0 441A050C */  jal         Stop__6CSoundFi
/* 0593B4 001592B4 00000000 */   nop
/* 0593B8 001592B8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0593BC 001592BC 01000524 */  addiu       $5, $0, 0x1
/* 0593C0 001592C0 441A050C */  jal         Stop__6CSoundFi
/* 0593C4 001592C4 00000000 */   nop
/* 0593C8 001592C8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0593CC 001592CC 0E000524 */  addiu       $5, $0, 0xE
/* 0593D0 001592D0 441A050C */  jal         Stop__6CSoundFi
/* 0593D4 001592D4 00000000 */   nop
/* 0593D8 001592D8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0593DC 001592DC 0A000524 */  addiu       $5, $0, 0xA
/* 0593E0 001592E0 441A050C */  jal         Stop__6CSoundFi
/* 0593E4 001592E4 00000000 */   nop
/* 0593E8 001592E8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0593EC 001592EC 0D000524 */  addiu       $5, $0, 0xD
/* 0593F0 001592F0 441A050C */  jal         Stop__6CSoundFi
/* 0593F4 001592F4 00000000 */   nop
/* 0593F8 001592F8 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 0593FC 001592FC 0C000524 */  addiu       $5, $0, 0xC
/* 059400 00159300 441A050C */  jal         Stop__6CSoundFi
/* 059404 00159304 00000000 */   nop
/* 059408 00159308 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05940C 0015930C 282E0070 */  paddub      $5, $0, $0
/* 059410 00159310 FC0E050C */  jal         StopVoice__6CSoundFi
/* 059414 00159314 00000000 */   nop
/* 059418 00159318 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05941C 0015931C 01000524 */  addiu       $5, $0, 0x1
/* 059420 00159320 FC0E050C */  jal         StopVoice__6CSoundFi
/* 059424 00159324 00000000 */   nop
/* 059428 00159328 B46B050C */  jal         SndSeSeqInit__Fv
/* 05942C 0015932C 00000000 */   nop
/* 059430 00159330 4C66050C */  jal         SndBgmInit__Fv
/* 059434 00159334 00000000 */   nop
/* 059438 00159338 3C6C050C */  jal         SndAmbientInit__Fv
/* 05943C 0015933C 00000000 */   nop
/* 059440 00159340 0000BF7B */  lq          $31, 0x0($29)
/* 059444 00159344 1000BD27 */  addiu       $29, $29, 0x10
/* 059448 00159348 0800E003 */  jr          $31
/* 05944C 0015934C 00000000 */   nop
