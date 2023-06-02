.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Save__14CEditPartsInfoFiP9CSaveData
/* 9A3C0 0019A2C0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 9A3C4 0019A2C4 5000BF7F */  sq         $31, 0x50($sp)
/* 9A3C8 0019A2C8 4000B47F */  sq         $20, 0x40($sp)
/* 9A3CC 0019A2CC 3000B37F */  sq         $19, 0x30($sp)
/* 9A3D0 0019A2D0 2000B27F */  sq         $18, 0x20($sp)
/* 9A3D4 0019A2D4 1000B17F */  sq         $17, 0x10($sp)
/* 9A3D8 0019A2D8 0000B07F */  sq         $16, 0x0($sp)
/* 9A3DC 0019A2DC 28A68070 */  paddub     $20, $4, $0
/* 9A3E0 0019A2E0 289EA070 */  paddub     $19, $5, $0
/* 9A3E4 0019A2E4 2896C070 */  paddub     $18, $6, $0
/* 9A3E8 0019A2E8 28264072 */  paddub     $4, $18, $0
/* 9A3EC 0019A2EC EC5F050C */  jal        GetGrdData__9CSaveDataFi
/* 9A3F0 0019A2F0 00000000 */   nop
/* 9A3F4 0019A2F4 288E4070 */  paddub     $17, $2, $0
/* 9A3F8 0019A2F8 32002012 */  beqz       $17, .L0019A3C4
/* 9A3FC 0019A2FC 00000000 */   nop
/* 9A400 0019A300 0000838E */  lw         $3, 0x0($20)
/* 9A404 0019A304 000023AE */  sw         $3, 0x0($17)
/* 9A408 0019A308 28860070 */  paddub     $16, $0, $0
/* 9A40C 0019A30C 2A000010 */  b          .L0019A3B8
/* 9A410 0019A310 00000000 */   nop
.L0019A314:
/* 9A414 0019A314 80201000 */  sll        $4, $16, 2
/* 9A418 0019A318 21109400 */  addu       $2, $4, $20
/* 9A41C 0019A31C 0400438C */  lw         $3, 0x4($2)
/* 9A420 0019A320 21109100 */  addu       $2, $4, $17
/* 9A424 0019A324 040043AC */  sw         $3, 0x4($2)
/* 9A428 0019A328 28264072 */  paddub     $4, $18, $0
/* 9A42C 0019A32C 282E6072 */  paddub     $5, $19, $0
/* 9A430 0019A330 28360072 */  paddub     $6, $16, $0
/* 9A434 0019A334 FC5F050C */  jal        GetEditPartsInfo__9CSaveDataFii
/* 9A438 0019A338 00000000 */   nop
/* 9A43C 0019A33C 1D004010 */  beqz       $2, .L0019A3B4
/* 9A440 0019A340 00000000 */   nop
/* 9A444 0019A344 C0181000 */  sll        $3, $16, 3
/* 9A448 0019A348 23187000 */  subu       $3, $3, $16
/* 9A44C 0019A34C 80180300 */  sll        $3, $3, 2
/* 9A450 0019A350 21187000 */  addu       $3, $3, $16
/* 9A454 0019A354 C0300300 */  sll        $6, $3, 3
/* 9A458 0019A358 2120D400 */  addu       $4, $6, $20
/* 9A45C 0019A35C 6C008384 */  lh         $3, 0x6C($4)
/* 9A460 0019A360 040043A4 */  sh         $3, 0x4($2)
/* 9A464 0019A364 6800838C */  lw         $3, 0x68($4)
/* 9A468 0019A368 000043AC */  sw         $3, 0x0($2)
/* 9A46C 0019A36C 70008384 */  lh         $3, 0x70($4)
/* 9A470 0019A370 060043A4 */  sh         $3, 0x6($2)
/* 9A474 0019A374 7C008384 */  lh         $3, 0x7C($4)
/* 9A478 0019A378 080043A4 */  sh         $3, 0x8($2)
/* 9A47C 0019A37C 282E0070 */  paddub     $5, $0, $0
/* 9A480 0019A380 09000010 */  b          .L0019A3A8
/* 9A484 0019A384 00000000 */   nop
.L0019A388:
/* 9A488 0019A388 2120D400 */  addu       $4, $6, $20
/* 9A48C 0019A38C 40190500 */  sll        $3, $5, 5
/* 9A490 0019A390 21186400 */  addu       $3, $3, $4
/* 9A494 0019A394 90006484 */  lh         $4, 0x90($3)
/* 9A498 0019A398 40180500 */  sll        $3, $5, 1
/* 9A49C 0019A39C 21186200 */  addu       $3, $3, $2
/* 9A4A0 0019A3A0 0A0064A4 */  sh         $4, 0xA($3)
/* 9A4A4 0019A3A4 0100A524 */  addiu      $5, $5, 0x1
.L0019A3A8:
/* 9A4A8 0019A3A8 0600A328 */  slti       $3, $5, 0x6
/* 9A4AC 0019A3AC F6FF6014 */  bnez       $3, .L0019A388
/* 9A4B0 0019A3B0 00000000 */   nop
.L0019A3B4:
/* 9A4B4 0019A3B4 01001026 */  addiu      $16, $16, 0x1
.L0019A3B8:
/* 9A4B8 0019A3B8 1800032A */  slti       $3, $16, 0x18
/* 9A4BC 0019A3BC D5FF6014 */  bnez       $3, .L0019A314
/* 9A4C0 0019A3C0 00000000 */   nop
.L0019A3C4:
/* 9A4C4 0019A3C4 5000BF7B */  lq         $31, 0x50($sp)
/* 9A4C8 0019A3C8 4000B47B */  lq         $20, 0x40($sp)
/* 9A4CC 0019A3CC 3000B37B */  lq         $19, 0x30($sp)
/* 9A4D0 0019A3D0 2000B27B */  lq         $18, 0x20($sp)
/* 9A4D4 0019A3D4 1000B17B */  lq         $17, 0x10($sp)
/* 9A4D8 0019A3D8 0000B07B */  lq         $16, 0x0($sp)
/* 9A4DC 0019A3DC 6000BD27 */  addiu      $sp, $sp, 0x60
/* 9A4E0 0019A3E0 0800E003 */  jr         $31
/* 9A4E4 0019A3E4 00000000 */   nop
/* 9A4E8 0019A3E8 00000000 */  nop
/* 9A4EC 0019A3EC 00000000 */  nop