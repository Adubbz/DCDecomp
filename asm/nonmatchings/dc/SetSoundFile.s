.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetSoundFile__FiPUiPc
/* 5A3C0 0015A2C0 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 5A3C4 0015A2C4 3000BF7F */  sq         $31, 0x30($sp)
/* 5A3C8 0015A2C8 2000B27F */  sq         $18, 0x20($sp)
/* 5A3CC 0015A2CC 1000B17F */  sq         $17, 0x10($sp)
/* 5A3D0 0015A2D0 0000B07F */  sq         $16, 0x0($sp)
/* 5A3D4 0015A2D4 28968070 */  paddub     $18, $4, $0
/* 5A3D8 0015A2D8 288EA070 */  paddub     $17, $5, $0
/* 5A3DC 0015A2DC 2886C070 */  paddub     $16, $6, $0
/* 5A3E0 0015A2E0 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A3E4 0015A2E4 282E0072 */  paddub     $5, $16, $0
/* 5A3E8 0015A2E8 28362072 */  paddub     $6, $17, $0
/* 5A3EC 0015A2EC 3410050C */  jal        LoadSoundFileFromPack__6CSoundFPcPUi
/* 5A3F0 0015A2F0 00000000 */   nop
/* 5A3F4 0015A2F4 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A3F8 0015A2F8 0F000524 */  addiu      $5, $0, 0xF
/* 5A3FC 0015A2FC 00010624 */  addiu      $6, $0, 0x100
/* 5A400 0015A300 581A050C */  jal        SetVol__6CSoundFii
/* 5A404 0015A304 00000000 */   nop
/* 5A408 0015A308 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A40C 0015A30C 0E000524 */  addiu      $5, $0, 0xE
/* 5A410 0015A310 00010624 */  addiu      $6, $0, 0x100
/* 5A414 0015A314 581A050C */  jal        SetVol__6CSoundFii
/* 5A418 0015A318 00000000 */   nop
/* 5A41C 0015A31C 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A420 0015A320 0A000524 */  addiu      $5, $0, 0xA
/* 5A424 0015A324 00010624 */  addiu      $6, $0, 0x100
/* 5A428 0015A328 581A050C */  jal        SetVol__6CSoundFii
/* 5A42C 0015A32C 00000000 */   nop
/* 5A430 0015A330 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A434 0015A334 0D000524 */  addiu      $5, $0, 0xD
/* 5A438 0015A338 00010624 */  addiu      $6, $0, 0x100
/* 5A43C 0015A33C 581A050C */  jal        SetVol__6CSoundFii
/* 5A440 0015A340 00000000 */   nop
/* 5A444 0015A344 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A448 0015A348 0C000524 */  addiu      $5, $0, 0xC
/* 5A44C 0015A34C 00010624 */  addiu      $6, $0, 0x100
/* 5A450 0015A350 581A050C */  jal        SetVol__6CSoundFii
/* 5A454 0015A354 00000000 */   nop
/* 5A458 0015A358 FC8D92AF */  sw         $18, -0x7204($gp)
/* 5A45C 0015A35C F88D80AF */  sw         $0, -0x7208($gp)
/* 5A460 0015A360 FFFF0224 */  addiu      $2, $0, -0x1
/* 5A464 0015A364 208E82AF */  sw         $2, -0x71E0($gp)
/* 5A468 0015A368 1469050C */  jal        SndStopAllSe__Fv
/* 5A46C 0015A36C 00000000 */   nop
/* 5A470 0015A370 4000A427 */  addiu      $4, $sp, 0x40
/* 5A474 0015A374 09000010 */  b          .L0015A39C
/* 5A478 0015A378 00000000 */   nop
.L0015A37C:
/* 5A47C 0015A37C 3C1E0500 */  dsll32     $3, $5, 24
/* 5A480 0015A380 3F1E0300 */  dsra32     $3, $3, 24
/* 5A484 0015A384 2E000224 */  addiu      $2, $0, 0x2E
/* 5A488 0015A388 07006210 */  beq        $3, $2, .L0015A3A8
/* 5A48C 0015A38C 00000000 */   nop
/* 5A490 0015A390 000085A0 */  sb         $5, 0x0($4)
/* 5A494 0015A394 01001026 */  addiu      $16, $16, 0x1
/* 5A498 0015A398 01008424 */  addiu      $4, $4, 0x1
.L0015A39C:
/* 5A49C 0015A39C 00000582 */  lb         $5, 0x0($16)
/* 5A4A0 0015A3A0 F6FFA014 */  bnez       $5, .L0015A37C
/* 5A4A4 0015A3A4 00000000 */   nop
.L0015A3A8:
/* 5A4A8 0015A3A8 000080A0 */  sb         $0, 0x0($4)
/* 5A4AC 0015A3AC 4000A427 */  addiu      $4, $sp, 0x40
/* 5A4B0 0015A3B0 2A00023C */  lui        $2, %hi(_362)
/* 5A4B4 0015A3B4 809F4524 */  addiu      $5, $2, %lo(_362)
/* 5A4B8 0015A3B8 BC14040C */  jal        strcat
/* 5A4BC 0015A3BC 00000000 */   nop
/* 5A4C0 0015A3C0 28262072 */  paddub     $4, $17, $0
/* 5A4C4 0015A3C4 4000A527 */  addiu      $5, $sp, 0x40
/* 5A4C8 0015A3C8 9C00A627 */  addiu      $6, $sp, 0x9C
/* 5A4CC 0015A3CC C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 5A4D0 0015A3D0 00000000 */   nop
/* 5A4D4 0015A3D4 282E4070 */  paddub     $5, $2, $0
/* 5A4D8 0015A3D8 0F00A010 */  beqz       $5, .L0015A418
/* 5A4DC 0015A3DC 00000000 */   nop
/* 5A4E0 0015A3E0 8000A427 */  addiu      $4, $sp, 0x80
/* 5A4E4 0015A3E4 9C00A68F */  lw         $6, 0x9C($sp)
/* 5A4E8 0015A3E8 AC6E050C */  jal        LoadSoundInfo__FP8SND_INFOPci
/* 5A4EC 0015A3EC 00000000 */   nop
/* 5A4F0 0015A3F0 3C8D8427 */  addiu      $4, $gp, -0x72C4
/* 5A4F4 0015A3F4 01000524 */  addiu      $5, $0, 0x1
/* 5A4F8 0015A3F8 8000A68F */  lw         $6, 0x80($sp)
/* 5A4FC 0015A3FC 8400A78F */  lw         $7, 0x84($sp)
/* 5A500 0015A400 140F050C */  jal        SetReverb__6CSoundFiii
/* 5A504 0015A404 00000000 */   nop
/* 5A508 0015A408 8800A38F */  lw         $3, 0x88($sp)
/* 5A50C 0015A40C 348E83AF */  sw         $3, -0x71CC($gp)
/* 5A510 0015A410 8C00A38F */  lw         $3, 0x8C($sp)
/* 5A514 0015A414 308E83AF */  sw         $3, -0x71D0($gp)
.L0015A418:
/* 5A518 0015A418 3000BF7B */  lq         $31, 0x30($sp)
/* 5A51C 0015A41C 2000B27B */  lq         $18, 0x20($sp)
/* 5A520 0015A420 1000B17B */  lq         $17, 0x10($sp)
/* 5A524 0015A424 0000B07B */  lq         $16, 0x0($sp)
/* 5A528 0015A428 A000BD27 */  addiu      $sp, $sp, 0xA0
/* 5A52C 0015A42C 0800E003 */  jr         $31
/* 5A530 0015A430 00000000 */   nop
/* 5A534 0015A434 00000000 */  nop
/* 5A538 0015A438 00000000 */  nop
/* 5A53C 0015A43C 00000000 */  nop
