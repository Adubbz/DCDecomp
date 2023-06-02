.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw_Holy__14CWeaponElementFv
/* B8390 001B8290 00FFBD27 */  addiu      $sp, $sp, -0x100
/* B8394 001B8294 8000BF7F */  sq         $31, 0x80($sp)
/* B8398 001B8298 7000B77F */  sq         $23, 0x70($sp)
/* B839C 001B829C 6000B67F */  sq         $22, 0x60($sp)
/* B83A0 001B82A0 5000B57F */  sq         $21, 0x50($sp)
/* B83A4 001B82A4 4000B47F */  sq         $20, 0x40($sp)
/* B83A8 001B82A8 3000B37F */  sq         $19, 0x30($sp)
/* B83AC 001B82AC 2000B27F */  sq         $18, 0x20($sp)
/* B83B0 001B82B0 1000B17F */  sq         $17, 0x10($sp)
/* B83B4 001B82B4 0000B07F */  sq         $16, 0x0($sp)
/* B83B8 001B82B8 28AE8070 */  paddub     $21, $4, $0
/* B83BC 001B82BC C701023C */  lui        $2, %hi(TexManager)
/* B83C0 001B82C0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* B83C4 001B82C4 2A00023C */  lui        $2, %hi(_1182)
/* B83C8 001B82C8 88BC4524 */  addiu      $5, $2, %lo(_1182)
/* B83CC 001B82CC FFFF0624 */  addiu      $6, $0, -0x1
/* B83D0 001B82D0 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* B83D4 001B82D4 00000000 */   nop
/* B83D8 001B82D8 28864070 */  paddub     $16, $2, $0
/* B83DC 001B82DC D000A427 */  addiu      $4, $sp, 0xD0
/* B83E0 001B82E0 0000A58E */  lw         $5, 0x0($21)
/* B83E4 001B82E4 0C86040C */  jal        sceVu0CopyVector
/* B83E8 001B82E8 00000000 */   nop
/* B83EC 001B82EC 803F033C */  lui        $3, (0x3F800000 >> 16)
/* B83F0 001B82F0 EC00A3AF */  sw         $3, 0xEC($sp)
/* B83F4 001B82F4 288E0070 */  paddub     $17, $0, $0
/* B83F8 001B82F8 51000010 */  b          .L001B8440
/* B83FC 001B82FC 00000000 */   nop
.L001B8300:
/* B8400 001B8300 40181100 */  sll        $3, $17, 1
/* B8404 001B8304 21187500 */  addu       $3, $3, $21
/* B8408 001B8308 FA067284 */  lh         $18, 0x6FA($3)
/* B840C 001B830C 80181100 */  sll        $3, $17, 2
/* B8410 001B8310 21187500 */  addu       $3, $3, $21
/* B8414 001B8314 20057424 */  addiu      $20, $3, 0x520
/* B8418 001B8318 200561C4 */  lwc1       $f1, 0x520($3)
/* B841C 001B831C 00008044 */  mtc1       $0, $f0
/* B8420 001B8320 00000000 */  nop
/* B8424 001B8324 36080046 */  c.le.s     $f1, $f0
/* B8428 001B8328 00000000 */  nop
/* B842C 001B832C 43000145 */  bc1t       .L001B843C
/* B8430 001B8330 00000000 */   nop
/* B8434 001B8334 200461C4 */  lwc1       $f1, 0x420($3)
/* B8438 001B8338 A00460C4 */  lwc1       $f0, 0x4A0($3)
/* B843C 001B833C 42080046 */  mul.s      $f1, $f1, $f0
/* B8440 001B8340 B005A0C6 */  lwc1       $f0, 0x5B0($21)
/* B8444 001B8344 02030146 */  mul.s      $f12, $f0, $f1
/* B8448 001B8348 00111100 */  sll        $2, $17, 4
/* B844C 001B834C 21105500 */  addu       $2, $2, $21
/* B8450 001B8350 200041C4 */  lwc1       $f1, 0x20($2)
/* B8454 001B8354 D000A0C7 */  lwc1       $f0, 0xD0($sp)
/* B8458 001B8358 00000146 */  add.s      $f0, $f0, $f1
/* B845C 001B835C E000A0E7 */  swc1       $f0, 0xE0($sp)
/* B8460 001B8360 240041C4 */  lwc1       $f1, 0x24($2)
/* B8464 001B8364 D400A0C7 */  lwc1       $f0, 0xD4($sp)
/* B8468 001B8368 00000146 */  add.s      $f0, $f0, $f1
/* B846C 001B836C E400A0E7 */  swc1       $f0, 0xE4($sp)
/* B8470 001B8370 280041C4 */  lwc1       $f1, 0x28($2)
/* B8474 001B8374 D800A0C7 */  lwc1       $f0, 0xD8($sp)
/* B8478 001B8378 00000146 */  add.s      $f0, $f0, $f1
/* B847C 001B837C E800A0E7 */  swc1       $f0, 0xE8($sp)
/* B8480 001B8380 C000B327 */  addiu      $19, $sp, 0xC0
/* B8484 001B8384 0040023C */  lui        $2, (0x40000000 >> 16)
/* B8488 001B8388 00008244 */  mtc1       $2, $f0
/* B848C 001B838C 00000000 */  nop
/* B8490 001B8390 43630046 */  div.s      $f13, $f12, $f0
/* B8494 001B8394 9000A427 */  addiu      $4, $sp, 0x90
/* B8498 001B8398 282E6072 */  paddub     $5, $19, $0
/* B849C 001B839C E000A627 */  addiu      $6, $sp, 0xE0
/* B84A0 001B83A0 283E0070 */  paddub     $7, $0, $0
/* B84A4 001B83A4 D0B9040C */  jal        MGRotTransPers3DSprite__FPiPiPfffi
/* B84A8 001B83A8 00000000 */   nop
/* B84AC 001B83AC 01000324 */  addiu      $3, $0, 0x1
/* B84B0 001B83B0 22004314 */  bne        $2, $3, .L001B843C
/* B84B4 001B83B4 00000000 */   nop
/* B84B8 001B83B8 0000628E */  lw         $2, 0x0($19)
/* B84BC 001B83BC A000B627 */  addiu      $22, $sp, 0xA0
/* B84C0 001B83C0 0000C2AE */  sw         $2, 0x0($22)
/* B84C4 001B83C4 9400A28F */  lw         $2, 0x94($sp)
/* B84C8 001B83C8 A400A2AF */  sw         $2, 0xA4($sp)
/* B84CC 001B83CC 9800A28F */  lw         $2, 0x98($sp)
/* B84D0 001B83D0 A800A2AF */  sw         $2, 0xA8($sp)
/* B84D4 001B83D4 9000A28F */  lw         $2, 0x90($sp)
/* B84D8 001B83D8 B000B727 */  addiu      $23, $sp, 0xB0
/* B84DC 001B83DC 0000E2AE */  sw         $2, 0x0($23)
/* B84E0 001B83E0 C400A28F */  lw         $2, 0xC4($sp)
/* B84E4 001B83E4 B400A2AF */  sw         $2, 0xB4($sp)
/* B84E8 001B83E8 C800A28F */  lw         $2, 0xC8($sp)
/* B84EC 001B83EC B800A2AF */  sw         $2, 0xB8($sp)
/* B84F0 001B83F0 D0000224 */  addiu      $2, $0, 0xD0
/* B84F4 001B83F4 F000A2AF */  sw         $2, 0xF0($sp)
/* B84F8 001B83F8 F400B2AF */  sw         $18, 0xF4($sp)
/* B84FC 001B83FC 30000224 */  addiu      $2, $0, 0x30
/* B8500 001B8400 F800A2AF */  sw         $2, 0xF8($sp)
/* B8504 001B8404 FC00A2AF */  sw         $2, 0xFC($sp)
/* B8508 001B8408 00008CC6 */  lwc1       $f12, 0x0($20)
/* B850C 001B840C 5044040C */  jal        fptoui
/* B8510 001B8410 00000000 */   nop
/* B8514 001B8414 D48B848F */  lw         $4, -0x742C($gp)
/* B8518 001B8418 282E0072 */  paddub     $5, $16, $0
/* B851C 001B841C F000A627 */  addiu      $6, $sp, 0xF0
/* B8520 001B8420 9000A727 */  addiu      $7, $sp, 0x90
/* B8524 001B8424 2846C072 */  paddub     $8, $22, $0
/* B8528 001B8428 284EE072 */  paddub     $9, $23, $0
/* B852C 001B842C 28566072 */  paddub     $10, $19, $0
/* B8530 001B8430 285E4070 */  paddub     $11, $2, $0
/* B8534 001B8434 1C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* B8538 001B8438 00000000 */   nop
.L001B843C:
/* B853C 001B843C 01003126 */  addiu      $17, $17, 0x1
.L001B8440:
/* B8540 001B8440 2000232A */  slti       $3, $17, 0x20
/* B8544 001B8444 AEFF6014 */  bnez       $3, .L001B8300
/* B8548 001B8448 00000000 */   nop
/* B854C 001B844C 8000BF7B */  lq         $31, 0x80($sp)
/* B8550 001B8450 7000B77B */  lq         $23, 0x70($sp)
/* B8554 001B8454 6000B67B */  lq         $22, 0x60($sp)
/* B8558 001B8458 5000B57B */  lq         $21, 0x50($sp)
/* B855C 001B845C 4000B47B */  lq         $20, 0x40($sp)
/* B8560 001B8460 3000B37B */  lq         $19, 0x30($sp)
/* B8564 001B8464 2000B27B */  lq         $18, 0x20($sp)
/* B8568 001B8468 1000B17B */  lq         $17, 0x10($sp)
/* B856C 001B846C 0000B07B */  lq         $16, 0x0($sp)
/* B8570 001B8470 0001BD27 */  addiu      $sp, $sp, 0x100
/* B8574 001B8474 0800E003 */  jr         $31
/* B8578 001B8478 00000000 */   nop
/* B857C 001B847C 00000000 */  nop
