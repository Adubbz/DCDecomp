.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel buildDummyModel__11CDungeonMapFv
/* C9120 001C9020 70FFBD27 */  addiu      $sp, $sp, -0x90
/* C9124 001C9024 6000BF7F */  sq         $31, 0x60($sp)
/* C9128 001C9028 5000B57F */  sq         $21, 0x50($sp)
/* C912C 001C902C 4000B47F */  sq         $20, 0x40($sp)
/* C9130 001C9030 3000B37F */  sq         $19, 0x30($sp)
/* C9134 001C9034 2000B27F */  sq         $18, 0x20($sp)
/* C9138 001C9038 1000B17F */  sq         $17, 0x10($sp)
/* C913C 001C903C 0000B07F */  sq         $16, 0x0($sp)
/* C9140 001C9040 28AE8070 */  paddub     $21, $4, $0
/* C9144 001C9044 288E0070 */  paddub     $17, $0, $0
/* C9148 001C9048 28960070 */  paddub     $18, $0, $0
/* C914C 001C904C 600480AC */  sw         $0, 0x460($4)
/* C9150 001C9050 52010010 */  b          .L001C959C
/* C9154 001C9054 00000000 */   nop
.L001C9058:
/* C9158 001C9058 BE11040C */  jal        rand
/* C915C 001C905C 00000000 */   nop
/* C9160 001C9060 00008244 */  mtc1       $2, $f0
/* C9164 001C9064 00000000 */  nop
/* C9168 001C9068 60008046 */  cvt.s.w    $f1, $f0
/* C916C 001C906C A841023C */  lui        $2, (0x41A80000 >> 16)
/* C9170 001C9070 00008244 */  mtc1       $2, $f0
/* C9174 001C9074 00000000 */  nop
/* C9178 001C9078 42000146 */  mul.s      $f1, $f0, $f1
/* C917C 001C907C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* C9180 001C9080 00008244 */  mtc1       $2, $f0
/* C9184 001C9084 00000000 */  nop
/* C9188 001C9088 030B0046 */  div.s      $f12, $f1, $f0
/* C918C 001C908C 2C44040C */  jal        fptosi
/* C9190 001C9090 00000000 */   nop
/* C9194 001C9094 FFFF5324 */  addiu      $19, $2, -0x1
/* C9198 001C9098 BE11040C */  jal        rand
/* C919C 001C909C 00000000 */   nop
/* C91A0 001C90A0 00008244 */  mtc1       $2, $f0
/* C91A4 001C90A4 00000000 */  nop
/* C91A8 001C90A8 60008046 */  cvt.s.w    $f1, $f0
/* C91AC 001C90AC A841023C */  lui        $2, (0x41A80000 >> 16)
/* C91B0 001C90B0 00008244 */  mtc1       $2, $f0
/* C91B4 001C90B4 00000000 */  nop
/* C91B8 001C90B8 42000146 */  mul.s      $f1, $f0, $f1
/* C91BC 001C90BC 004F023C */  lui        $2, (0x4F000000 >> 16)
/* C91C0 001C90C0 00008244 */  mtc1       $2, $f0
/* C91C4 001C90C4 00000000 */  nop
/* C91C8 001C90C8 030B0046 */  div.s      $f12, $f1, $f0
/* C91CC 001C90CC 2C44040C */  jal        fptosi
/* C91D0 001C90D0 00000000 */   nop
/* C91D4 001C90D4 FFFF5424 */  addiu      $20, $2, -0x1
/* C91D8 001C90D8 BE11040C */  jal        rand
/* C91DC 001C90DC 00000000 */   nop
/* C91E0 001C90E0 00008244 */  mtc1       $2, $f0
/* C91E4 001C90E4 00000000 */  nop
/* C91E8 001C90E8 60008046 */  cvt.s.w    $f1, $f0
/* C91EC 001C90EC 4040023C */  lui        $2, (0x40400000 >> 16)
/* C91F0 001C90F0 00008244 */  mtc1       $2, $f0
/* C91F4 001C90F4 00000000 */  nop
/* C91F8 001C90F8 42000146 */  mul.s      $f1, $f0, $f1
/* C91FC 001C90FC 004F023C */  lui        $2, (0x4F000000 >> 16)
/* C9200 001C9100 00008244 */  mtc1       $2, $f0
/* C9204 001C9104 00000000 */  nop
/* C9208 001C9108 030B0046 */  div.s      $f12, $f1, $f0
/* C920C 001C910C 2C44040C */  jal        fptosi
/* C9210 001C9110 00000000 */   nop
/* C9214 001C9114 FFFF1024 */  addiu      $16, $0, -0x1
/* C9218 001C9118 02000324 */  addiu      $3, $0, 0x2
/* C921C 001C911C 73004310 */  beq        $2, $3, .L001C92EC
/* C9220 001C9120 00000000 */   nop
/* C9224 001C9124 01000324 */  addiu      $3, $0, 0x1
/* C9228 001C9128 3C004310 */  beq        $2, $3, .L001C921C
/* C922C 001C912C 00000000 */   nop
/* C9230 001C9130 03004010 */  beqz       $2, .L001C9140
/* C9234 001C9134 00000000 */   nop
/* C9238 001C9138 A1000010 */  b          .L001C93C0
/* C923C 001C913C 00000000 */   nop
.L001C9140:
/* C9240 001C9140 28860070 */  paddub     $16, $0, $0
/* C9244 001C9144 28260070 */  paddub     $4, $0, $0
/* C9248 001C9148 18000010 */  b          .L001C91AC
/* C924C 001C914C 00000000 */   nop
.L001C9150:
/* C9250 001C9150 281E0070 */  paddub     $3, $0, $0
/* C9254 001C9154 11000010 */  b          .L001C919C
/* C9258 001C9158 00000000 */   nop
.L001C915C:
/* C925C 001C915C 21309400 */  addu       $6, $4, $20
/* C9260 001C9160 80280600 */  sll        $5, $6, 2
/* C9264 001C9164 2128A600 */  addu       $5, $5, $6
/* C9268 001C9168 80280500 */  sll        $5, $5, 2
/* C926C 001C916C 21286500 */  addu       $5, $3, $5
/* C9270 001C9170 21286502 */  addu       $5, $19, $5
/* C9274 001C9174 00290500 */  sll        $5, $5, 4
/* C9278 001C9178 2128B500 */  addu       $5, $5, $21
/* C927C 001C917C 0100013C */  lui        $at, (0x10000 >> 16)
/* C9280 001C9180 2108A100 */  addu       $at, $5, $at
/* C9284 001C9184 509C268C */  lw         $6, -0x63B0($at)
/* C9288 001C9188 FFFF0524 */  addiu      $5, $0, -0x1
/* C928C 001C918C 0200C510 */  beq        $6, $5, .L001C9198
/* C9290 001C9190 00000000 */   nop
/* C9294 001C9194 2886A070 */  paddub     $16, $5, $0
.L001C9198:
/* C9298 001C9198 01006324 */  addiu      $3, $3, 0x1
.L001C919C:
/* C929C 001C919C 02006528 */  slti       $5, $3, 0x2
/* C92A0 001C91A0 EEFFA014 */  bnez       $5, .L001C915C
/* C92A4 001C91A4 00000000 */   nop
/* C92A8 001C91A8 01008424 */  addiu      $4, $4, 0x1
.L001C91AC:
/* C92AC 001C91AC 02008328 */  slti       $3, $4, 0x2
/* C92B0 001C91B0 E7FF6014 */  bnez       $3, .L001C9150
/* C92B4 001C91B4 00000000 */   nop
/* C92B8 001C91B8 FFFF0324 */  addiu      $3, $0, -0x1
/* C92BC 001C91BC 80000312 */  beq        $16, $3, .L001C93C0
/* C92C0 001C91C0 00000000 */   nop
/* C92C4 001C91C4 2043033C */  lui        $3, (0x43200000 >> 16)
/* C92C8 001C91C8 00108344 */  mtc1       $3, $f2
/* C92CC 001C91CC 00009344 */  mtc1       $19, $f0
/* C92D0 001C91D0 00000000 */  nop
/* C92D4 001C91D4 20008046 */  cvt.s.w    $f0, $f0
/* C92D8 001C91D8 02100046 */  mul.s      $f0, $f2, $f0
/* C92DC 001C91DC A042033C */  lui        $3, (0x42A00000 >> 16)
/* C92E0 001C91E0 00088344 */  mtc1       $3, $f1
/* C92E4 001C91E4 00000000 */  nop
/* C92E8 001C91E8 00080046 */  add.s      $f0, $f1, $f0
/* C92EC 001C91EC 7000A0E7 */  swc1       $f0, 0x70($sp)
/* C92F0 001C91F0 7400A0AF */  sw         $0, 0x74($sp)
/* C92F4 001C91F4 00009444 */  mtc1       $20, $f0
/* C92F8 001C91F8 00000000 */  nop
/* C92FC 001C91FC 20008046 */  cvt.s.w    $f0, $f0
/* C9300 001C9200 02100046 */  mul.s      $f0, $f2, $f0
/* C9304 001C9204 00080046 */  add.s      $f0, $f1, $f0
/* C9308 001C9208 7800A0E7 */  swc1       $f0, 0x78($sp)
/* C930C 001C920C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* C9310 001C9210 7C00A3AF */  sw         $3, 0x7C($sp)
/* C9314 001C9214 6A000010 */  b          .L001C93C0
/* C9318 001C9218 00000000 */   nop
.L001C921C:
/* C931C 001C921C 28866070 */  paddub     $16, $3, $0
/* C9320 001C9220 28260070 */  paddub     $4, $0, $0
/* C9324 001C9224 18000010 */  b          .L001C9288
/* C9328 001C9228 00000000 */   nop
.L001C922C:
/* C932C 001C922C 281E0070 */  paddub     $3, $0, $0
/* C9330 001C9230 11000010 */  b          .L001C9278
/* C9334 001C9234 00000000 */   nop
.L001C9238:
/* C9338 001C9238 21309400 */  addu       $6, $4, $20
/* C933C 001C923C 80280600 */  sll        $5, $6, 2
/* C9340 001C9240 2128A600 */  addu       $5, $5, $6
/* C9344 001C9244 80280500 */  sll        $5, $5, 2
/* C9348 001C9248 21286500 */  addu       $5, $3, $5
/* C934C 001C924C 21286502 */  addu       $5, $19, $5
/* C9350 001C9250 00290500 */  sll        $5, $5, 4
/* C9354 001C9254 2128B500 */  addu       $5, $5, $21
/* C9358 001C9258 0100013C */  lui        $at, (0x10000 >> 16)
/* C935C 001C925C 2108A100 */  addu       $at, $5, $at
/* C9360 001C9260 509C268C */  lw         $6, -0x63B0($at)
/* C9364 001C9264 FFFF0524 */  addiu      $5, $0, -0x1
/* C9368 001C9268 0200C510 */  beq        $6, $5, .L001C9274
/* C936C 001C926C 00000000 */   nop
/* C9370 001C9270 2886A070 */  paddub     $16, $5, $0
.L001C9274:
/* C9374 001C9274 01006324 */  addiu      $3, $3, 0x1
.L001C9278:
/* C9378 001C9278 02006528 */  slti       $5, $3, 0x2
/* C937C 001C927C EEFFA014 */  bnez       $5, .L001C9238
/* C9380 001C9280 00000000 */   nop
/* C9384 001C9284 01008424 */  addiu      $4, $4, 0x1
.L001C9288:
/* C9388 001C9288 02008328 */  slti       $3, $4, 0x2
/* C938C 001C928C E7FF6014 */  bnez       $3, .L001C922C
/* C9390 001C9290 00000000 */   nop
/* C9394 001C9294 FFFF0324 */  addiu      $3, $0, -0x1
/* C9398 001C9298 49000312 */  beq        $16, $3, .L001C93C0
/* C939C 001C929C 00000000 */   nop
/* C93A0 001C92A0 2043033C */  lui        $3, (0x43200000 >> 16)
/* C93A4 001C92A4 00088344 */  mtc1       $3, $f1
/* C93A8 001C92A8 00009344 */  mtc1       $19, $f0
/* C93AC 001C92AC 00000000 */  nop
/* C93B0 001C92B0 20008046 */  cvt.s.w    $f0, $f0
/* C93B4 001C92B4 02080046 */  mul.s      $f0, $f1, $f0
/* C93B8 001C92B8 00080046 */  add.s      $f0, $f1, $f0
/* C93BC 001C92BC 7000A0E7 */  swc1       $f0, 0x70($sp)
/* C93C0 001C92C0 7400A0AF */  sw         $0, 0x74($sp)
/* C93C4 001C92C4 00009444 */  mtc1       $20, $f0
/* C93C8 001C92C8 00000000 */  nop
/* C93CC 001C92CC 20008046 */  cvt.s.w    $f0, $f0
/* C93D0 001C92D0 02080046 */  mul.s      $f0, $f1, $f0
/* C93D4 001C92D4 00080046 */  add.s      $f0, $f1, $f0
/* C93D8 001C92D8 7800A0E7 */  swc1       $f0, 0x78($sp)
/* C93DC 001C92DC 803F033C */  lui        $3, (0x3F800000 >> 16)
/* C93E0 001C92E0 7C00A3AF */  sw         $3, 0x7C($sp)
/* C93E4 001C92E4 36000010 */  b          .L001C93C0
/* C93E8 001C92E8 00000000 */   nop
.L001C92EC:
/* C93EC 001C92EC 28866070 */  paddub     $16, $3, $0
/* C93F0 001C92F0 28260070 */  paddub     $4, $0, $0
/* C93F4 001C92F4 18000010 */  b          .L001C9358
/* C93F8 001C92F8 00000000 */   nop
.L001C92FC:
/* C93FC 001C92FC 281E0070 */  paddub     $3, $0, $0
/* C9400 001C9300 11000010 */  b          .L001C9348
/* C9404 001C9304 00000000 */   nop
.L001C9308:
/* C9408 001C9308 21309400 */  addu       $6, $4, $20
/* C940C 001C930C 80280600 */  sll        $5, $6, 2
/* C9410 001C9310 2128A600 */  addu       $5, $5, $6
/* C9414 001C9314 80280500 */  sll        $5, $5, 2
/* C9418 001C9318 21286500 */  addu       $5, $3, $5
/* C941C 001C931C 21286502 */  addu       $5, $19, $5
/* C9420 001C9320 00290500 */  sll        $5, $5, 4
/* C9424 001C9324 2128B500 */  addu       $5, $5, $21
/* C9428 001C9328 0100013C */  lui        $at, (0x10000 >> 16)
/* C942C 001C932C 2108A100 */  addu       $at, $5, $at
/* C9430 001C9330 509C268C */  lw         $6, -0x63B0($at)
/* C9434 001C9334 FFFF0524 */  addiu      $5, $0, -0x1
/* C9438 001C9338 0200C510 */  beq        $6, $5, .L001C9344
/* C943C 001C933C 00000000 */   nop
/* C9440 001C9340 2886A070 */  paddub     $16, $5, $0
.L001C9344:
/* C9444 001C9344 01006324 */  addiu      $3, $3, 0x1
.L001C9348:
/* C9448 001C9348 03006528 */  slti       $5, $3, 0x3
/* C944C 001C934C EEFFA014 */  bnez       $5, .L001C9308
/* C9450 001C9350 00000000 */   nop
/* C9454 001C9354 01008424 */  addiu      $4, $4, 0x1
.L001C9358:
/* C9458 001C9358 03008328 */  slti       $3, $4, 0x3
/* C945C 001C935C E7FF6014 */  bnez       $3, .L001C92FC
/* C9460 001C9360 00000000 */   nop
/* C9464 001C9364 FFFF0324 */  addiu      $3, $0, -0x1
/* C9468 001C9368 15000312 */  beq        $16, $3, .L001C93C0
/* C946C 001C936C 00000000 */   nop
/* C9470 001C9370 2043033C */  lui        $3, (0x43200000 >> 16)
/* C9474 001C9374 00108344 */  mtc1       $3, $f2
/* C9478 001C9378 00009344 */  mtc1       $19, $f0
/* C947C 001C937C 00000000 */  nop
/* C9480 001C9380 20008046 */  cvt.s.w    $f0, $f0
/* C9484 001C9384 02100046 */  mul.s      $f0, $f2, $f0
/* C9488 001C9388 7043033C */  lui        $3, (0x43700000 >> 16)
/* C948C 001C938C 00088344 */  mtc1       $3, $f1
/* C9490 001C9390 00000000 */  nop
/* C9494 001C9394 00080046 */  add.s      $f0, $f1, $f0
/* C9498 001C9398 7000A0E7 */  swc1       $f0, 0x70($sp)
/* C949C 001C939C 7400A0AF */  sw         $0, 0x74($sp)
/* C94A0 001C93A0 00009444 */  mtc1       $20, $f0
/* C94A4 001C93A4 00000000 */  nop
/* C94A8 001C93A8 20008046 */  cvt.s.w    $f0, $f0
/* C94AC 001C93AC 02100046 */  mul.s      $f0, $f2, $f0
/* C94B0 001C93B0 00080046 */  add.s      $f0, $f1, $f0
/* C94B4 001C93B4 7800A0E7 */  swc1       $f0, 0x78($sp)
/* C94B8 001C93B8 803F033C */  lui        $3, (0x3F800000 >> 16)
/* C94BC 001C93BC 7C00A3AF */  sw         $3, 0x7C($sp)
.L001C93C0:
/* C94C0 001C93C0 FFFF0324 */  addiu      $3, $0, -0x1
/* C94C4 001C93C4 71000312 */  beq        $16, $3, .L001C958C
/* C94C8 001C93C8 00000000 */   nop
/* C94CC 001C93CC 289E0070 */  paddub     $19, $0, $0
/* C94D0 001C93D0 15000010 */  b          .L001C9428
/* C94D4 001C93D4 00000000 */   nop
.L001C93D8:
/* C94D8 001C93D8 00111300 */  sll        $2, $19, 4
/* C94DC 001C93DC 2110A202 */  addu       $2, $21, $2
/* C94E0 001C93E0 7000A427 */  addiu      $4, $sp, 0x70
/* C94E4 001C93E4 C0034524 */  addiu      $5, $2, 0x3C0
/* C94E8 001C93E8 648D040C */  jal        DistVector__FPfPf
/* C94EC 001C93EC 00000000 */   nop
/* C94F0 001C93F0 2042033C */  lui        $3, (0x42200000 >> 16)
/* C94F4 001C93F4 00108344 */  mtc1       $3, $f2
/* C94F8 001C93F8 00089044 */  mtc1       $16, $f1
/* C94FC 001C93FC 00000000 */  nop
/* C9500 001C9400 60088046 */  cvt.s.w    $f1, $f1
/* C9504 001C9404 42100146 */  mul.s      $f1, $f2, $f1
/* C9508 001C9408 34000146 */  c.lt.s     $f0, $f1
/* C950C 001C940C 00000000 */  nop
/* C9510 001C9410 04000045 */  bc1f       .L001C9424
/* C9514 001C9414 00000000 */   nop
/* C9518 001C9418 FFFF1024 */  addiu      $16, $0, -0x1
/* C951C 001C941C 05000010 */  b          .L001C9434
/* C9520 001C9420 00000000 */   nop
.L001C9424:
/* C9524 001C9424 01007326 */  addiu      $19, $19, 0x1
.L001C9428:
/* C9528 001C9428 2A187102 */  slt        $3, $19, $17
/* C952C 001C942C EAFF6014 */  bnez       $3, .L001C93D8
/* C9530 001C9430 00000000 */   nop
.L001C9434:
/* C9534 001C9434 289E0070 */  paddub     $19, $0, $0
/* C9538 001C9438 3C000010 */  b          .L001C952C
/* C953C 001C943C 00000000 */   nop
.L001C9440:
/* C9540 001C9440 28A60070 */  paddub     $20, $0, $0
/* C9544 001C9444 35000010 */  b          .L001C951C
/* C9548 001C9448 00000000 */   nop
.L001C944C:
/* C954C 001C944C 80181300 */  sll        $3, $19, 2
/* C9550 001C9450 21187300 */  addu       $3, $3, $19
/* C9554 001C9454 80180300 */  sll        $3, $3, 2
/* C9558 001C9458 21188302 */  addu       $3, $20, $3
/* C955C 001C945C 00190300 */  sll        $3, $3, 4
/* C9560 001C9460 21187500 */  addu       $3, $3, $21
/* C9564 001C9464 0100013C */  lui        $at, (0x10000 >> 16)
/* C9568 001C9468 21086100 */  addu       $at, $3, $at
/* C956C 001C946C 509C248C */  lw         $4, -0x63B0($at)
/* C9570 001C9470 28000324 */  addiu      $3, $0, 0x28
/* C9574 001C9474 28008314 */  bne        $4, $3, .L001C9518
/* C9578 001C9478 00000000 */   nop
/* C957C 001C947C 2043023C */  lui        $2, (0x43200000 >> 16)
/* C9580 001C9480 00108244 */  mtc1       $2, $f2
/* C9584 001C9484 00009444 */  mtc1       $20, $f0
/* C9588 001C9488 00000000 */  nop
/* C958C 001C948C 20008046 */  cvt.s.w    $f0, $f0
/* C9590 001C9490 02100046 */  mul.s      $f0, $f2, $f0
/* C9594 001C9494 A042023C */  lui        $2, (0x42A00000 >> 16)
/* C9598 001C9498 00088244 */  mtc1       $2, $f1
/* C959C 001C949C 00000000 */  nop
/* C95A0 001C94A0 00080046 */  add.s      $f0, $f1, $f0
/* C95A4 001C94A4 8000A0E7 */  swc1       $f0, 0x80($sp)
/* C95A8 001C94A8 8400A0AF */  sw         $0, 0x84($sp)
/* C95AC 001C94AC 00009344 */  mtc1       $19, $f0
/* C95B0 001C94B0 00000000 */  nop
/* C95B4 001C94B4 20008046 */  cvt.s.w    $f0, $f0
/* C95B8 001C94B8 02100046 */  mul.s      $f0, $f2, $f0
/* C95BC 001C94BC 00080046 */  add.s      $f0, $f1, $f0
/* C95C0 001C94C0 8800A0E7 */  swc1       $f0, 0x88($sp)
/* C95C4 001C94C4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* C95C8 001C94C8 8C00A2AF */  sw         $2, 0x8C($sp)
/* C95CC 001C94CC 8000A427 */  addiu      $4, $sp, 0x80
/* C95D0 001C94D0 7000A527 */  addiu      $5, $sp, 0x70
/* C95D4 001C94D4 648D040C */  jal        DistVector__FPfPf
/* C95D8 001C94D8 00000000 */   nop
/* C95DC 001C94DC 02000326 */  addiu      $3, $16, 0x2
/* C95E0 001C94E0 00088344 */  mtc1       $3, $f1
/* C95E4 001C94E4 00000000 */  nop
/* C95E8 001C94E8 A0088046 */  cvt.s.w    $f2, $f1
/* C95EC 001C94EC 2043033C */  lui        $3, (0x43200000 >> 16)
/* C95F0 001C94F0 00088344 */  mtc1       $3, $f1
/* C95F4 001C94F4 00000000 */  nop
/* C95F8 001C94F8 42080246 */  mul.s      $f1, $f1, $f2
/* C95FC 001C94FC 34000146 */  c.lt.s     $f0, $f1
/* C9600 001C9500 00000000 */  nop
/* C9604 001C9504 04000045 */  bc1f       .L001C9518
/* C9608 001C9508 00000000 */   nop
/* C960C 001C950C 15001324 */  addiu      $19, $0, 0x15
/* C9610 001C9510 28A66072 */  paddub     $20, $19, $0
/* C9614 001C9514 FFFF1024 */  addiu      $16, $0, -0x1
.L001C9518:
/* C9618 001C9518 01009426 */  addiu      $20, $20, 0x1
.L001C951C:
/* C961C 001C951C 1400832A */  slti       $3, $20, 0x14
/* C9620 001C9520 CAFF6014 */  bnez       $3, .L001C944C
/* C9624 001C9524 00000000 */   nop
/* C9628 001C9528 01007326 */  addiu      $19, $19, 0x1
.L001C952C:
/* C962C 001C952C 1400632A */  slti       $3, $19, 0x14
/* C9630 001C9530 C3FF6014 */  bnez       $3, .L001C9440
/* C9634 001C9534 00000000 */   nop
/* C9638 001C9538 FFFF0324 */  addiu      $3, $0, -0x1
/* C963C 001C953C 13000312 */  beq        $16, $3, .L001C958C
/* C9640 001C9540 00000000 */   nop
/* C9644 001C9544 6004A38E */  lw         $3, 0x460($21)
/* C9648 001C9548 08006128 */  slti       $at, $3, 0x8
/* C964C 001C954C 0E002010 */  beqz       $at, .L001C9588
/* C9650 001C9550 00000000 */   nop
/* C9654 001C9554 00110300 */  sll        $2, $3, 4
/* C9658 001C9558 2110A202 */  addu       $2, $21, $2
/* C965C 001C955C C0034424 */  addiu      $4, $2, 0x3C0
/* C9660 001C9560 7000A527 */  addiu      $5, $sp, 0x70
/* C9664 001C9564 0C86040C */  jal        sceVu0CopyVector
/* C9668 001C9568 00000000 */   nop
/* C966C 001C956C 6004A38E */  lw         $3, 0x460($21)
/* C9670 001C9570 80180300 */  sll        $3, $3, 2
/* C9674 001C9574 21187500 */  addu       $3, $3, $21
/* C9678 001C9578 400470AC */  sw         $16, 0x440($3)
/* C967C 001C957C 6004A38E */  lw         $3, 0x460($21)
/* C9680 001C9580 01006324 */  addiu      $3, $3, 0x1
/* C9684 001C9584 6004A3AE */  sw         $3, 0x460($21)
.L001C9588:
/* C9688 001C9588 01003126 */  addiu      $17, $17, 0x1
.L001C958C:
/* C968C 001C958C 1127412A */  slti       $at, $18, 0x2711
/* C9690 001C9590 05002010 */  beqz       $at, .L001C95A8
/* C9694 001C9594 00000000 */   nop
/* C9698 001C9598 01005226 */  addiu      $18, $18, 0x1
.L001C959C:
/* C969C 001C959C 0800232A */  slti       $3, $17, 0x8
/* C96A0 001C95A0 ADFE6014 */  bnez       $3, .L001C9058
/* C96A4 001C95A4 00000000 */   nop
.L001C95A8:
/* C96A8 001C95A8 6000BF7B */  lq         $31, 0x60($sp)
/* C96AC 001C95AC 5000B57B */  lq         $21, 0x50($sp)
/* C96B0 001C95B0 4000B47B */  lq         $20, 0x40($sp)
/* C96B4 001C95B4 3000B37B */  lq         $19, 0x30($sp)
/* C96B8 001C95B8 2000B27B */  lq         $18, 0x20($sp)
/* C96BC 001C95BC 1000B17B */  lq         $17, 0x10($sp)
/* C96C0 001C95C0 0000B07B */  lq         $16, 0x0($sp)
/* C96C4 001C95C4 9000BD27 */  addiu      $sp, $sp, 0x90
/* C96C8 001C95C8 0800E003 */  jr         $31
/* C96CC 001C95CC 00000000 */   nop
