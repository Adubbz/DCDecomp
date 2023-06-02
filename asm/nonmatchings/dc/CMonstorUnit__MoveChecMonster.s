.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MoveChecMonster__12CMonstorUnitFv
/* DD240 001DD140 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* DD244 001DD144 5000BF7F */  sq         $31, 0x50($sp)
/* DD248 001DD148 4000B47F */  sq         $20, 0x40($sp)
/* DD24C 001DD14C 3000B37F */  sq         $19, 0x30($sp)
/* DD250 001DD150 2000B27F */  sq         $18, 0x20($sp)
/* DD254 001DD154 1000B17F */  sq         $17, 0x10($sp)
/* DD258 001DD158 0000B07F */  sq         $16, 0x0($sp)
/* DD25C 001DD15C 28A68070 */  paddub     $20, $4, $0
/* DD260 001DD160 9000838C */  lw         $3, 0x90($4)
/* DD264 001DD164 10350224 */  addiu      $2, $0, 0x3510
/* DD268 001DD168 18106200 */  mult       $2, $3, $2
/* DD26C 001DD16C 21108200 */  addu       $2, $4, $2
/* DD270 001DD170 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DD274 001DD174 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DD278 001DD178 21204100 */  addu       $4, $2, $at
/* DD27C 001DD17C 8000A527 */  addiu      $5, $sp, 0x80
/* DD280 001DD180 A000998C */  lw         $25, 0xA0($4)
/* DD284 001DD184 A000398F */  lw         $25, 0xA0($25)
/* DD288 001DD188 09F82003 */  jalr       $25
/* DD28C 001DD18C 00000000 */   nop
/* DD290 001DD190 9000838E */  lw         $3, 0x90($20)
/* DD294 001DD194 80100300 */  sll        $2, $3, 2
/* DD298 001DD198 21184300 */  addu       $3, $2, $3
/* DD29C 001DD19C 80100300 */  sll        $2, $3, 2
/* DD2A0 001DD1A0 21106200 */  addu       $2, $3, $2
/* DD2A4 001DD1A4 00110200 */  sll        $2, $2, 4
/* DD2A8 001DD1A8 21105400 */  addu       $2, $2, $20
/* DD2AC 001DD1AC 0200013C */  lui        $at, (0x20000 >> 16)
/* DD2B0 001DD1B0 21084100 */  addu       $at, $2, $at
/* DD2B4 001DD1B4 30E421C4 */  lwc1       $f1, -0x1BD0($at)
/* DD2B8 001DD1B8 0200013C */  lui        $at, (0x20000 >> 16)
/* DD2BC 001DD1BC 21084100 */  addu       $at, $2, $at
/* DD2C0 001DD1C0 50E420C4 */  lwc1       $f0, -0x1BB0($at)
/* DD2C4 001DD1C4 02080046 */  mul.s      $f0, $f1, $f0
/* DD2C8 001DD1C8 8000A2C7 */  lwc1       $f2, 0x80($sp)
/* DD2CC 001DD1CC 00100046 */  add.s      $f0, $f2, $f0
/* DD2D0 001DD1D0 7000A0E7 */  swc1       $f0, 0x70($sp)
/* DD2D4 001DD1D4 9000838E */  lw         $3, 0x90($20)
/* DD2D8 001DD1D8 80100300 */  sll        $2, $3, 2
/* DD2DC 001DD1DC 21184300 */  addu       $3, $2, $3
/* DD2E0 001DD1E0 80100300 */  sll        $2, $3, 2
/* DD2E4 001DD1E4 21106200 */  addu       $2, $3, $2
/* DD2E8 001DD1E8 00110200 */  sll        $2, $2, 4
/* DD2EC 001DD1EC 21105400 */  addu       $2, $2, $20
/* DD2F0 001DD1F0 0200013C */  lui        $at, (0x20000 >> 16)
/* DD2F4 001DD1F4 21084100 */  addu       $at, $2, $at
/* DD2F8 001DD1F8 34E421C4 */  lwc1       $f1, -0x1BCC($at)
/* DD2FC 001DD1FC 0200013C */  lui        $at, (0x20000 >> 16)
/* DD300 001DD200 21084100 */  addu       $at, $2, $at
/* DD304 001DD204 50E420C4 */  lwc1       $f0, -0x1BB0($at)
/* DD308 001DD208 42080046 */  mul.s      $f1, $f1, $f0
/* DD30C 001DD20C 8400A0C7 */  lwc1       $f0, 0x84($sp)
/* DD310 001DD210 00000146 */  add.s      $f0, $f0, $f1
/* DD314 001DD214 7400B227 */  addiu      $18, $sp, 0x74
/* DD318 001DD218 000040E6 */  swc1       $f0, 0x0($18)
/* DD31C 001DD21C 9000838E */  lw         $3, 0x90($20)
/* DD320 001DD220 80100300 */  sll        $2, $3, 2
/* DD324 001DD224 21184300 */  addu       $3, $2, $3
/* DD328 001DD228 80100300 */  sll        $2, $3, 2
/* DD32C 001DD22C 21106200 */  addu       $2, $3, $2
/* DD330 001DD230 00110200 */  sll        $2, $2, 4
/* DD334 001DD234 21105400 */  addu       $2, $2, $20
/* DD338 001DD238 0200013C */  lui        $at, (0x20000 >> 16)
/* DD33C 001DD23C 21084100 */  addu       $at, $2, $at
/* DD340 001DD240 38E421C4 */  lwc1       $f1, -0x1BC8($at)
/* DD344 001DD244 0200013C */  lui        $at, (0x20000 >> 16)
/* DD348 001DD248 21084100 */  addu       $at, $2, $at
/* DD34C 001DD24C 50E420C4 */  lwc1       $f0, -0x1BB0($at)
/* DD350 001DD250 02080046 */  mul.s      $f0, $f1, $f0
/* DD354 001DD254 8800B327 */  addiu      $19, $sp, 0x88
/* DD358 001DD258 000061C6 */  lwc1       $f1, 0x0($19)
/* DD35C 001DD25C 00080046 */  add.s      $f0, $f1, $f0
/* DD360 001DD260 7800A227 */  addiu      $2, $sp, 0x78
/* DD364 001DD264 000040E4 */  swc1       $f0, 0x0($2)
/* DD368 001DD268 7000A0C7 */  lwc1       $f0, 0x70($sp)
/* DD36C 001DD26C 01000246 */  sub.s      $f0, $f0, $f2
/* DD370 001DD270 A000A0E7 */  swc1       $f0, 0xA0($sp)
/* DD374 001DD274 A400A0AF */  sw         $0, 0xA4($sp)
/* DD378 001DD278 000040C4 */  lwc1       $f0, 0x0($2)
/* DD37C 001DD27C 01000146 */  sub.s      $f0, $f0, $f1
/* DD380 001DD280 A800A0E7 */  swc1       $f0, 0xA8($sp)
/* DD384 001DD284 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DD388 001DD288 AC00A2AF */  sw         $2, 0xAC($sp)
/* DD38C 001DD28C A000A427 */  addiu      $4, $sp, 0xA0
/* DD390 001DD290 282E8070 */  paddub     $5, $4, $0
/* DD394 001DD294 9285040C */  jal        sceVu0Normalize
/* DD398 001DD298 00000000 */   nop
/* DD39C 001DD29C 9000838E */  lw         $3, 0x90($20)
/* DD3A0 001DD2A0 80100300 */  sll        $2, $3, 2
/* DD3A4 001DD2A4 21184300 */  addu       $3, $2, $3
/* DD3A8 001DD2A8 80100300 */  sll        $2, $3, 2
/* DD3AC 001DD2AC 21106200 */  addu       $2, $3, $2
/* DD3B0 001DD2B0 00110200 */  sll        $2, $2, 4
/* DD3B4 001DD2B4 21108202 */  addu       $2, $20, $2
/* DD3B8 001DD2B8 9000A427 */  addiu      $4, $sp, 0x90
/* DD3BC 001DD2BC 0100013C */  lui        $at, (0x1E430 >> 16)
/* DD3C0 001DD2C0 30E42134 */  ori        $at, $at, (0x1E430 & 0xFFFF)
/* DD3C4 001DD2C4 21284100 */  addu       $5, $2, $at
/* DD3C8 001DD2C8 9285040C */  jal        sceVu0Normalize
/* DD3CC 001DD2CC 00000000 */   nop
/* DD3D0 001DD2D0 D000A427 */  addiu      $4, $sp, 0xD0
/* DD3D4 001DD2D4 7000A527 */  addiu      $5, $sp, 0x70
/* DD3D8 001DD2D8 0C86040C */  jal        sceVu0CopyVector
/* DD3DC 001DD2DC 00000000 */   nop
/* DD3E0 001DD2E0 803F033C */  lui        $3, (0x3F800000 >> 16)
/* DD3E4 001DD2E4 D400A3AF */  sw         $3, 0xD4($sp)
/* DD3E8 001DD2E8 28860070 */  paddub     $16, $0, $0
/* DD3EC 001DD2EC 87000010 */  b          .L001DD50C
/* DD3F0 001DD2F0 00000000 */   nop
.L001DD2F4:
/* DD3F4 001DD2F4 80181000 */  sll        $3, $16, 2
/* DD3F8 001DD2F8 21207000 */  addu       $4, $3, $16
/* DD3FC 001DD2FC 80180400 */  sll        $3, $4, 2
/* DD400 001DD300 21188300 */  addu       $3, $4, $3
/* DD404 001DD304 00890300 */  sll        $17, $3, 4
/* DD408 001DD308 21183402 */  addu       $3, $17, $20
/* DD40C 001DD30C 0200013C */  lui        $at, (0x20000 >> 16)
/* DD410 001DD310 21086100 */  addu       $at, $3, $at
/* DD414 001DD314 D0E3248C */  lw         $4, -0x1C30($at)
/* DD418 001DD318 02000324 */  addiu      $3, $0, 0x2
/* DD41C 001DD31C 7A008314 */  bne        $4, $3, .L001DD508
/* DD420 001DD320 00000000 */   nop
/* DD424 001DD324 9000838E */  lw         $3, 0x90($20)
/* DD428 001DD328 77000312 */  beq        $16, $3, .L001DD508
/* DD42C 001DD32C 00000000 */   nop
/* DD430 001DD330 10350224 */  addiu      $2, $0, 0x3510
/* DD434 001DD334 18100202 */  mult       $2, $16, $2
/* DD438 001DD338 21108202 */  addu       $2, $20, $2
/* DD43C 001DD33C 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DD440 001DD340 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DD444 001DD344 21204100 */  addu       $4, $2, $at
/* DD448 001DD348 6000A527 */  addiu      $5, $sp, 0x60
/* DD44C 001DD34C A000998C */  lw         $25, 0xA0($4)
/* DD450 001DD350 A000398F */  lw         $25, 0xA0($25)
/* DD454 001DD354 09F82003 */  jalr       $25
/* DD458 001DD358 00000000 */   nop
/* DD45C 001DD35C C000A427 */  addiu      $4, $sp, 0xC0
/* DD460 001DD360 6000A527 */  addiu      $5, $sp, 0x60
/* DD464 001DD364 0C86040C */  jal        sceVu0CopyVector
/* DD468 001DD368 00000000 */   nop
/* DD46C 001DD36C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DD470 001DD370 C400A2AF */  sw         $2, 0xC4($sp)
/* DD474 001DD374 C000A427 */  addiu      $4, $sp, 0xC0
/* DD478 001DD378 D000A527 */  addiu      $5, $sp, 0xD0
/* DD47C 001DD37C 648D040C */  jal        DistVector__FPfPf
/* DD480 001DD380 00000000 */   nop
/* DD484 001DD384 9000848E */  lw         $4, 0x90($20)
/* DD488 001DD388 80180400 */  sll        $3, $4, 2
/* DD48C 001DD38C 21206400 */  addu       $4, $3, $4
/* DD490 001DD390 80180400 */  sll        $3, $4, 2
/* DD494 001DD394 21188300 */  addu       $3, $4, $3
/* DD498 001DD398 00190300 */  sll        $3, $3, 4
/* DD49C 001DD39C 21187400 */  addu       $3, $3, $20
/* DD4A0 001DD3A0 0200013C */  lui        $at, (0x20000 >> 16)
/* DD4A4 001DD3A4 21086100 */  addu       $at, $3, $at
/* DD4A8 001DD3A8 18E421C4 */  lwc1       $f1, -0x1BE8($at)
/* DD4AC 001DD3AC 21183402 */  addu       $3, $17, $20
/* DD4B0 001DD3B0 0200013C */  lui        $at, (0x20000 >> 16)
/* DD4B4 001DD3B4 21086100 */  addu       $at, $3, $at
/* DD4B8 001DD3B8 18E423C4 */  lwc1       $f3, -0x1BE8($at)
/* DD4BC 001DD3BC 40180146 */  add.s      $f1, $f3, $f1
/* DD4C0 001DD3C0 36000146 */  c.le.s     $f0, $f1
/* DD4C4 001DD3C4 00000000 */  nop
/* DD4C8 001DD3C8 4F000045 */  bc1f       .L001DD508
/* DD4CC 001DD3CC 00000000 */   nop
/* DD4D0 001DD3D0 000042C6 */  lwc1       $f2, 0x0($18)
/* DD4D4 001DD3D4 6400A1C7 */  lwc1       $f1, 0x64($sp)
/* DD4D8 001DD3D8 0040033C */  lui        $3, (0x40000000 >> 16)
/* DD4DC 001DD3DC 00008344 */  mtc1       $3, $f0
/* DD4E0 001DD3E0 00000000 */  nop
/* DD4E4 001DD3E4 02000346 */  mul.s      $f0, $f0, $f3
/* DD4E8 001DD3E8 00080046 */  add.s      $f0, $f1, $f0
/* DD4EC 001DD3EC 34100046 */  c.lt.s     $f2, $f0
/* DD4F0 001DD3F0 00000000 */  nop
/* DD4F4 001DD3F4 44000045 */  bc1f       .L001DD508
/* DD4F8 001DD3F8 00000000 */   nop
/* DD4FC 001DD3FC 6000A1C7 */  lwc1       $f1, 0x60($sp)
/* DD500 001DD400 8000A0C7 */  lwc1       $f0, 0x80($sp)
/* DD504 001DD404 01080046 */  sub.s      $f0, $f1, $f0
/* DD508 001DD408 B000A0E7 */  swc1       $f0, 0xB0($sp)
/* DD50C 001DD40C 6800A1C7 */  lwc1       $f1, 0x68($sp)
/* DD510 001DD410 000060C6 */  lwc1       $f0, 0x0($19)
/* DD514 001DD414 01080046 */  sub.s      $f0, $f1, $f0
/* DD518 001DD418 B800A0E7 */  swc1       $f0, 0xB8($sp)
/* DD51C 001DD41C B400A0AF */  sw         $0, 0xB4($sp)
/* DD520 001DD420 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DD524 001DD424 BC00A2AF */  sw         $2, 0xBC($sp)
/* DD528 001DD428 B000A427 */  addiu      $4, $sp, 0xB0
/* DD52C 001DD42C 282E8070 */  paddub     $5, $4, $0
/* DD530 001DD430 9285040C */  jal        sceVu0Normalize
/* DD534 001DD434 00000000 */   nop
/* DD538 001DD438 A000A427 */  addiu      $4, $sp, 0xA0
/* DD53C 001DD43C B000A527 */  addiu      $5, $sp, 0xB0
/* DD540 001DD440 8885040C */  jal        sceVu0InnerProduct
/* DD544 001DD444 00000000 */   nop
/* DD548 001DD448 00088044 */  mtc1       $0, $f1
/* DD54C 001DD44C 00000000 */  nop
/* DD550 001DD450 36000146 */  c.le.s     $f0, $f1
/* DD554 001DD454 00000000 */  nop
/* DD558 001DD458 2B000145 */  bc1t       .L001DD508
/* DD55C 001DD45C 00000000 */   nop
/* DD560 001DD460 9000848E */  lw         $4, 0x90($20)
/* DD564 001DD464 80180400 */  sll        $3, $4, 2
/* DD568 001DD468 21206400 */  addu       $4, $3, $4
/* DD56C 001DD46C 80180400 */  sll        $3, $4, 2
/* DD570 001DD470 21188300 */  addu       $3, $4, $3
/* DD574 001DD474 00190300 */  sll        $3, $3, 4
/* DD578 001DD478 21187400 */  addu       $3, $3, $20
/* DD57C 001DD47C 0200013C */  lui        $at, (0x20000 >> 16)
/* DD580 001DD480 21086100 */  addu       $at, $3, $at
/* DD584 001DD484 30E420AC */  sw         $0, -0x1BD0($at)
/* DD588 001DD488 9000848E */  lw         $4, 0x90($20)
/* DD58C 001DD48C 80180400 */  sll        $3, $4, 2
/* DD590 001DD490 21206400 */  addu       $4, $3, $4
/* DD594 001DD494 80180400 */  sll        $3, $4, 2
/* DD598 001DD498 21188300 */  addu       $3, $4, $3
/* DD59C 001DD49C 00190300 */  sll        $3, $3, 4
/* DD5A0 001DD4A0 21187400 */  addu       $3, $3, $20
/* DD5A4 001DD4A4 0200013C */  lui        $at, (0x20000 >> 16)
/* DD5A8 001DD4A8 21086100 */  addu       $at, $3, $at
/* DD5AC 001DD4AC 34E420AC */  sw         $0, -0x1BCC($at)
/* DD5B0 001DD4B0 9000848E */  lw         $4, 0x90($20)
/* DD5B4 001DD4B4 80180400 */  sll        $3, $4, 2
/* DD5B8 001DD4B8 21206400 */  addu       $4, $3, $4
/* DD5BC 001DD4BC 80180400 */  sll        $3, $4, 2
/* DD5C0 001DD4C0 21188300 */  addu       $3, $4, $3
/* DD5C4 001DD4C4 00190300 */  sll        $3, $3, 4
/* DD5C8 001DD4C8 21187400 */  addu       $3, $3, $20
/* DD5CC 001DD4CC 0200013C */  lui        $at, (0x20000 >> 16)
/* DD5D0 001DD4D0 21086100 */  addu       $at, $3, $at
/* DD5D4 001DD4D4 38E420AC */  sw         $0, -0x1BC8($at)
/* DD5D8 001DD4D8 9000848E */  lw         $4, 0x90($20)
/* DD5DC 001DD4DC 80180400 */  sll        $3, $4, 2
/* DD5E0 001DD4E0 21206400 */  addu       $4, $3, $4
/* DD5E4 001DD4E4 80180400 */  sll        $3, $4, 2
/* DD5E8 001DD4E8 21188300 */  addu       $3, $4, $3
/* DD5EC 001DD4EC 00190300 */  sll        $3, $3, 4
/* DD5F0 001DD4F0 21187400 */  addu       $3, $3, $20
/* DD5F4 001DD4F4 0200013C */  lui        $at, (0x20000 >> 16)
/* DD5F8 001DD4F8 21086100 */  addu       $at, $3, $at
/* DD5FC 001DD4FC 50E420AC */  sw         $0, -0x1BB0($at)
/* DD600 001DD500 05000010 */  b          .L001DD518
/* DD604 001DD504 00000000 */   nop
.L001DD508:
/* DD608 001DD508 01001026 */  addiu      $16, $16, 0x1
.L001DD50C:
/* DD60C 001DD50C 1000032A */  slti       $3, $16, 0x10
/* DD610 001DD510 78FF6014 */  bnez       $3, .L001DD2F4
/* DD614 001DD514 00000000 */   nop
.L001DD518:
/* DD618 001DD518 5000BF7B */  lq         $31, 0x50($sp)
/* DD61C 001DD51C 4000B47B */  lq         $20, 0x40($sp)
/* DD620 001DD520 3000B37B */  lq         $19, 0x30($sp)
/* DD624 001DD524 2000B27B */  lq         $18, 0x20($sp)
/* DD628 001DD528 1000B17B */  lq         $17, 0x10($sp)
/* DD62C 001DD52C 0000B07B */  lq         $16, 0x0($sp)
/* DD630 001DD530 E000BD27 */  addiu      $sp, $sp, 0xE0
/* DD634 001DD534 0800E003 */  jr         $31
/* DD638 001DD538 00000000 */   nop
/* DD63C 001DD53C 00000000 */  nop
