.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetSoundFile__FiPUiPc
/* 05A3C0 0015A2C0 60FFBD27 */  addiu       $29, $29, -0xA0
/* 05A3C4 0015A2C4 3000BF7F */  sq          $31, 0x30($29)
/* 05A3C8 0015A2C8 2000B27F */  sq          $18, 0x20($29)
/* 05A3CC 0015A2CC 1000B17F */  sq          $17, 0x10($29)
/* 05A3D0 0015A2D0 0000B07F */  sq          $16, 0x0($29)
/* 05A3D4 0015A2D4 28968070 */  paddub      $18, $4, $0
/* 05A3D8 0015A2D8 288EA070 */  paddub      $17, $5, $0
/* 05A3DC 0015A2DC 2886C070 */  paddub      $16, $6, $0
/* 05A3E0 0015A2E0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05A3E4 0015A2E4 282E0072 */  paddub      $5, $16, $0
/* 05A3E8 0015A2E8 28362072 */  paddub      $6, $17, $0
/* 05A3EC 0015A2EC 3410050C */  jal         LoadSoundFileFromPack__6CSoundFPcPUi
/* 05A3F0 0015A2F0 00000000 */   nop
/* 05A3F4 0015A2F4 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05A3F8 0015A2F8 0F000524 */  addiu       $5, $0, 0xF
/* 05A3FC 0015A2FC 00010624 */  addiu       $6, $0, 0x100
/* 05A400 0015A300 581A050C */  jal         SetVol__6CSoundFii
/* 05A404 0015A304 00000000 */   nop
/* 05A408 0015A308 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05A40C 0015A30C 0E000524 */  addiu       $5, $0, 0xE
/* 05A410 0015A310 00010624 */  addiu       $6, $0, 0x100
/* 05A414 0015A314 581A050C */  jal         SetVol__6CSoundFii
/* 05A418 0015A318 00000000 */   nop
/* 05A41C 0015A31C 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05A420 0015A320 0A000524 */  addiu       $5, $0, 0xA
/* 05A424 0015A324 00010624 */  addiu       $6, $0, 0x100
/* 05A428 0015A328 581A050C */  jal         SetVol__6CSoundFii
/* 05A42C 0015A32C 00000000 */   nop
/* 05A430 0015A330 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05A434 0015A334 0D000524 */  addiu       $5, $0, 0xD
/* 05A438 0015A338 00010624 */  addiu       $6, $0, 0x100
/* 05A43C 0015A33C 581A050C */  jal         SetVol__6CSoundFii
/* 05A440 0015A340 00000000 */   nop
/* 05A444 0015A344 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05A448 0015A348 0C000524 */  addiu       $5, $0, 0xC
/* 05A44C 0015A34C 00010624 */  addiu       $6, $0, 0x100
/* 05A450 0015A350 581A050C */  jal         SetVol__6CSoundFii
/* 05A454 0015A354 00000000 */   nop
/* 05A458 0015A358 FC8D92AF */  sw          $18, -0x7204($28)
/* 05A45C 0015A35C F88D80AF */  sw          $0, -0x7208($28)
/* 05A460 0015A360 FFFF0224 */  addiu       $2, $0, -0x1
/* 05A464 0015A364 208E82AF */  sw          $2, -0x71E0($28)
/* 05A468 0015A368 1469050C */  jal         SndStopAllSe__Fv
/* 05A46C 0015A36C 00000000 */   nop
/* 05A470 0015A370 4000A427 */  addiu       $4, $29, 0x40
/* 05A474 0015A374 09000010 */  b           .L0015A39C
/* 05A478 0015A378 00000000 */   nop
.L0015A37C:
/* 05A47C 0015A37C 3C1E0500 */  dsll32      $3, $5, 24
/* 05A480 0015A380 3F1E0300 */  dsra32      $3, $3, 24
/* 05A484 0015A384 2E000224 */  addiu       $2, $0, 0x2E
/* 05A488 0015A388 07006210 */  beq         $3, $2, .L0015A3A8
/* 05A48C 0015A38C 00000000 */   nop
/* 05A490 0015A390 000085A0 */  sb          $5, 0x0($4)
/* 05A494 0015A394 01001026 */  addiu       $16, $16, 0x1
/* 05A498 0015A398 01008424 */  addiu       $4, $4, 0x1
.L0015A39C:
/* 05A49C 0015A39C 00000582 */  lb          $5, 0x0($16)
/* 05A4A0 0015A3A0 F6FFA014 */  bnez        $5, .L0015A37C
/* 05A4A4 0015A3A4 00000000 */   nop
.L0015A3A8:
/* 05A4A8 0015A3A8 000080A0 */  sb          $0, 0x0($4)
/* 05A4AC 0015A3AC 4000A427 */  addiu       $4, $29, 0x40
/* 05A4B0 0015A3B0 2A00023C */  lui         $2, %hi(LIT_362)
/* 05A4B4 0015A3B4 809F4524 */  addiu       $5, $2, %lo(LIT_362)
/* 05A4B8 0015A3B8 BC14040C */  jal         strcat
/* 05A4BC 0015A3BC 00000000 */   nop
/* 05A4C0 0015A3C0 28262072 */  paddub      $4, $17, $0
/* 05A4C4 0015A3C4 4000A527 */  addiu       $5, $29, 0x40
/* 05A4C8 0015A3C8 9C00A627 */  addiu       $6, $29, 0x9C
/* 05A4CC 0015A3CC C8FD040C */  jal         GetPackFile__FPUiPcPi
/* 05A4D0 0015A3D0 00000000 */   nop
/* 05A4D4 0015A3D4 282E4070 */  paddub      $5, $2, $0
/* 05A4D8 0015A3D8 0F00A010 */  beqz        $5, .L0015A418
/* 05A4DC 0015A3DC 00000000 */   nop
/* 05A4E0 0015A3E0 8000A427 */  addiu       $4, $29, 0x80
/* 05A4E4 0015A3E4 9C00A68F */  lw          $6, 0x9C($29)
/* 05A4E8 0015A3E8 AC6E050C */  jal         LoadSoundInfo__FP8SND_INFOPci
/* 05A4EC 0015A3EC 00000000 */   nop
/* 05A4F0 0015A3F0 3C8D8427 */  addiu       $4, $28, -0x72C4
/* 05A4F4 0015A3F4 01000524 */  addiu       $5, $0, 0x1
/* 05A4F8 0015A3F8 8000A68F */  lw          $6, 0x80($29)
/* 05A4FC 0015A3FC 8400A78F */  lw          $7, 0x84($29)
/* 05A500 0015A400 140F050C */  jal         SetReverb__6CSoundFiii
/* 05A504 0015A404 00000000 */   nop
/* 05A508 0015A408 8800A38F */  lw          $3, 0x88($29)
/* 05A50C 0015A40C 348E83AF */  sw          $3, -0x71CC($28)
/* 05A510 0015A410 8C00A38F */  lw          $3, 0x8C($29)
/* 05A514 0015A414 308E83AF */  sw          $3, -0x71D0($28)
.L0015A418:
/* 05A518 0015A418 3000BF7B */  lq          $31, 0x30($29)
/* 05A51C 0015A41C 2000B27B */  lq          $18, 0x20($29)
/* 05A520 0015A420 1000B17B */  lq          $17, 0x10($29)
/* 05A524 0015A424 0000B07B */  lq          $16, 0x0($29)
/* 05A528 0015A428 A000BD27 */  addiu       $29, $29, 0xA0
/* 05A52C 0015A42C 0800E003 */  jr          $31
/* 05A530 0015A430 00000000 */   nop
/* 05A534 0015A434 00000000 */  nop
/* 05A538 0015A438 00000000 */  nop
/* 05A53C 0015A43C 00000000 */  nop
