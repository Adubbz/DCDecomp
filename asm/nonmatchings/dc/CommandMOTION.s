.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandMOTION__FPPv
/* 3A330 0013A230 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* 3A334 0013A234 8000BF7F */  sq         $31, 0x80($sp)
/* 3A338 0013A238 7000B77F */  sq         $23, 0x70($sp)
/* 3A33C 0013A23C 6000B67F */  sq         $22, 0x60($sp)
/* 3A340 0013A240 5000B57F */  sq         $21, 0x50($sp)
/* 3A344 0013A244 4000B47F */  sq         $20, 0x40($sp)
/* 3A348 0013A248 3000B37F */  sq         $19, 0x30($sp)
/* 3A34C 0013A24C 2000B27F */  sq         $18, 0x20($sp)
/* 3A350 0013A250 1000B17F */  sq         $17, 0x10($sp)
/* 3A354 0013A254 0000B07F */  sq         $16, 0x0($sp)
/* 3A358 0013A258 28968070 */  paddub     $18, $4, $0
/* 3A35C 0013A25C A08C848F */  lw         $4, -0x7360($gp)
/* 3A360 0013A260 BC00838C */  lw         $3, 0xBC($4)
/* 3A364 0013A264 62006010 */  beqz       $3, .L0013A3F0
/* 3A368 0013A268 00000000 */   nop
/* 3A36C 0013A26C 0000428E */  lw         $2, 0x0($18)
/* 3A370 0013A270 0000428C */  lw         $2, 0x0($2)
/* 3A374 0013A274 C88C82AF */  sw         $2, -0x7338($gp)
/* 3A378 0013A278 C88C858F */  lw         $5, -0x7338($gp)
/* 3A37C 0013A27C C0E0040C */  jal        ClearEvent__10CCharacterFi
/* 3A380 0013A280 00000000 */   nop
/* 3A384 0013A284 C88C848F */  lw         $4, -0x7338($gp)
/* 3A388 0013A288 04008004 */  bltz       $4, .L0013A29C
/* 3A38C 0013A28C 00000000 */   nop
/* 3A390 0013A290 08008328 */  slti       $3, $4, 0x8
/* 3A394 0013A294 03006014 */  bnez       $3, .L0013A2A4
/* 3A398 0013A298 00000000 */   nop
.L0013A29C:
/* 3A39C 0013A29C 54000010 */  b          .L0013A3F0
/* 3A3A0 0013A2A0 00000000 */   nop
.L0013A2A4:
/* 3A3A4 0013A2A4 08008018 */  blez       $4, .L0013A2C8
/* 3A3A8 0013A2A8 00000000 */   nop
/* 3A3AC 0013A2AC A08C858F */  lw         $5, -0x7360($gp)
/* 3A3B0 0013A2B0 C0110400 */  sll        $2, $4, 7
/* 3A3B4 0013A2B4 2110A200 */  addu       $2, $5, $2
/* 3A3B8 0013A2B8 20044324 */  addiu      $3, $2, 0x420
/* 3A3BC 0013A2BC 80100400 */  sll        $2, $4, 2
/* 3A3C0 0013A2C0 21104500 */  addu       $2, $2, $5
/* 3A3C4 0013A2C4 200C43AC */  sw         $3, 0xC20($2)
.L0013A2C8:
/* 3A3C8 0013A2C8 A08C838F */  lw         $3, -0x7360($gp)
/* 3A3CC 0013A2CC C88C828F */  lw         $2, -0x7338($gp)
/* 3A3D0 0013A2D0 80100200 */  sll        $2, $2, 2
/* 3A3D4 0013A2D4 21104300 */  addu       $2, $2, $3
/* 3A3D8 0013A2D8 200C508C */  lw         $16, 0xC20($2)
/* 3A3DC 0013A2DC 28260072 */  paddub     $4, $16, $0
/* 3A3E0 0013A2E0 282E0070 */  paddub     $5, $0, $0
/* 3A3E4 0013A2E4 80000624 */  addiu      $6, $0, 0x80
/* 3A3E8 0013A2E8 5A0D040C */  jal        memset
/* 3A3EC 0013A2EC 00000000 */   nop
/* 3A3F0 0013A2F0 0400518E */  lw         $17, 0x4($18)
/* 3A3F4 0013A2F4 0800458E */  lw         $5, 0x8($18)
/* 3A3F8 0013A2F8 0C00528E */  lw         $18, 0xC($18)
/* 3A3FC 0013A2FC 9C00B727 */  addiu      $23, $sp, 0x9C
/* 3A400 0013A300 0000F1AE */  sw         $17, 0x0($23)
/* 3A404 0013A304 9000A5AF */  sw         $5, 0x90($sp)
/* 3A408 0013A308 A800B627 */  addiu      $22, $sp, 0xA8
/* 3A40C 0013A30C 0000D2AE */  sw         $18, 0x0($22)
/* 3A410 0013A310 9800B327 */  addiu      $19, $sp, 0x98
/* 3A414 0013A314 000060AE */  sw         $0, 0x0($19)
/* 3A418 0013A318 A400B427 */  addiu      $20, $sp, 0xA4
/* 3A41C 0013A31C 000080AE */  sw         $0, 0x0($20)
/* 3A420 0013A320 B000B527 */  addiu      $21, $sp, 0xB0
/* 3A424 0013A324 0000A0AE */  sw         $0, 0x0($21)
/* 3A428 0013A328 B08C848F */  lw         $4, -0x7350($gp)
/* 3A42C 0013A32C 28366072 */  paddub     $6, $19, $0
/* 3A430 0013A330 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 3A434 0013A334 00000000 */   nop
/* 3A438 0013A338 9400A2AF */  sw         $2, 0x94($sp)
/* 3A43C 0013A33C B08C848F */  lw         $4, -0x7350($gp)
/* 3A440 0013A340 282E2072 */  paddub     $5, $17, $0
/* 3A444 0013A344 28368072 */  paddub     $6, $20, $0
/* 3A448 0013A348 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 3A44C 0013A34C 00000000 */   nop
/* 3A450 0013A350 A000A2AF */  sw         $2, 0xA0($sp)
/* 3A454 0013A354 B08C848F */  lw         $4, -0x7350($gp)
/* 3A458 0013A358 282E4072 */  paddub     $5, $18, $0
/* 3A45C 0013A35C 2836A072 */  paddub     $6, $21, $0
/* 3A460 0013A360 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 3A464 0013A364 00000000 */   nop
/* 3A468 0013A368 AC00A2AF */  sw         $2, 0xAC($sp)
/* 3A46C 0013A36C 0000628E */  lw         $2, 0x0($19)
/* 3A470 0013A370 02004014 */  bnez       $2, .L0013A37C
/* 3A474 0013A374 00000000 */   nop
/* 3A478 0013A378 9000A0AF */  sw         $0, 0x90($sp)
.L0013A37C:
/* 3A47C 0013A37C 0000828E */  lw         $2, 0x0($20)
/* 3A480 0013A380 02004014 */  bnez       $2, .L0013A38C
/* 3A484 0013A384 00000000 */   nop
/* 3A488 0013A388 0000E0AE */  sw         $0, 0x0($23)
.L0013A38C:
/* 3A48C 0013A38C 0000A28E */  lw         $2, 0x0($21)
/* 3A490 0013A390 02004014 */  bnez       $2, .L0013A39C
/* 3A494 0013A394 00000000 */   nop
/* 3A498 0013A398 0000C0AE */  sw         $0, 0x0($22)
.L0013A39C:
/* 3A49C 0013A39C 28260072 */  paddub     $4, $16, $0
/* 3A4A0 0013A3A0 908C858F */  lw         $5, -0x7370($gp)
/* 3A4A4 0013A3A4 9000A627 */  addiu      $6, $sp, 0x90
/* 3A4A8 0013A3A8 2424050C */  jal        CreateAnimeDataEX__FP14tagMOTION_TYPEP14CDataAlloc2_1_P16MOTION_FILE_INFO
/* 3A4AC 0013A3AC 00000000 */   nop
/* 3A4B0 0013A3B0 A08C848F */  lw         $4, -0x7360($gp)
/* 3A4B4 0013A3B4 CC028724 */  addiu      $7, $4, 0x2CC
/* 3A4B8 0013A3B8 CC02838C */  lw         $3, 0x2CC($4)
/* 3A4BC 0013A3BC 06006014 */  bnez       $3, .L0013A3D8
/* 3A4C0 0013A3C0 00000000 */   nop
/* 3A4C4 0013A3C4 BC00848C */  lw         $4, 0xBC($4)
/* 3A4C8 0013A3C8 282E0072 */  paddub     $5, $16, $0
/* 3A4CC 0013A3CC 8C8C868F */  lw         $6, -0x7374($gp)
/* 3A4D0 0013A3D0 C024050C */  jal        AnimeDataInit__FP6CFrameP14tagMOTION_TYPEP14CDataAlloc2_1_PP12tagFRAME_INF
/* 3A4D4 0013A3D4 00000000 */   nop
.L0013A3D8:
/* 3A4D8 0013A3D8 A08C838F */  lw         $3, -0x7360($gp)
/* 3A4DC 0013A3DC CC02638C */  lw         $3, 0x2CC($3)
/* 3A4E0 0013A3E0 600003AE */  sw         $3, 0x60($16)
/* 3A4E4 0013A3E4 B48C80AF */  sw         $0, -0x734C($gp)
/* 3A4E8 0013A3E8 BC8C80AF */  sw         $0, -0x7344($gp)
/* 3A4EC 0013A3EC C08C80AF */  sw         $0, -0x7340($gp)
.L0013A3F0:
/* 3A4F0 0013A3F0 8000BF7B */  lq         $31, 0x80($sp)
/* 3A4F4 0013A3F4 7000B77B */  lq         $23, 0x70($sp)
/* 3A4F8 0013A3F8 6000B67B */  lq         $22, 0x60($sp)
/* 3A4FC 0013A3FC 5000B57B */  lq         $21, 0x50($sp)
/* 3A500 0013A400 4000B47B */  lq         $20, 0x40($sp)
/* 3A504 0013A404 3000B37B */  lq         $19, 0x30($sp)
/* 3A508 0013A408 2000B27B */  lq         $18, 0x20($sp)
/* 3A50C 0013A40C 1000B17B */  lq         $17, 0x10($sp)
/* 3A510 0013A410 0000B07B */  lq         $16, 0x0($sp)
/* 3A514 0013A414 C000BD27 */  addiu      $sp, $sp, 0xC0
/* 3A518 0013A418 0800E003 */  jr         $31
/* 3A51C 0013A41C 00000000 */   nop
