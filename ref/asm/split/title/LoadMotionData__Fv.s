.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadMotionData__Fv
/* 00D3E0 01DB90E0 50FFBD27 */  addiu       $29, $29, -0xB0
/* 00D3E4 01DB90E4 0000BF7F */  sq          $31, 0x0($29)
/* 00D3E8 01DB90E8 DD01033C */  lui         $3, %hi(LIT_1256)
/* 00D3EC 01DB90EC 80696724 */  addiu       $7, $3, %lo(LIT_1256)
/* 00D3F0 01DB90F0 1000A627 */  addiu       $6, $29, 0x10
/* 00D3F4 01DB90F4 05000524 */  addiu       $5, $0, 0x5
.L01DB90F8_2BE8F8:
/* 00D3F8 01DB90F8 0000E478 */  lq          $4, 0x0($7)
/* 00D3FC 01DB90FC 1000E378 */  lq          $3, 0x10($7)
/* 00D400 01DB9100 2000E724 */  addiu       $7, $7, 0x20
/* 00D404 01DB9104 FFFFA524 */  addiu       $5, $5, -0x1
/* 00D408 01DB9108 0000C47C */  sq          $4, 0x0($6)
/* 00D40C 01DB910C 1000C37C */  sq          $3, 0x10($6)
/* 00D410 01DB9110 2000C624 */  addiu       $6, $6, 0x20
/* 00D414 01DB9114 F8FFA01C */  bgtz        $5, .L01DB90F8_2BE8F8
/* 00D418 01DB9118 00000000 */   nop
/* 00D41C 01DB911C E898848F */  lw          $4, -0x6718($28)
/* 00D420 01DB9120 0A008128 */  slti        $1, $4, 0xA
/* 00D424 01DB9124 A3002010 */  beqz        $1, .L01DB93B4_2BEBB4
/* 00D428 01DB9128 00000000 */   nop
/* 00D42C 01DB912C DF01013C */  lui         $1, %hi(UraEventMan + 0xD94)
/* 00D430 01DB9130 446C238C */  lw          $3, %lo(UraEventMan + 0xD94)($1)
/* 00D434 01DB9134 0400638C */  lw          $3, 0x4($3)
/* 00D438 01DB9138 FFFF6324 */  addiu       $3, $3, -0x1
/* 00D43C 01DB913C 00008344 */  mtc1        $3, $f0
/* 00D440 01DB9140 00000000 */  nop
/* 00D444 01DB9144 60008046 */  cvt.s.w     $f1, $f0
/* 00D448 01DB9148 DF01013C */  lui         $1, %hi(UraEventMan + 0xD40)
/* 00D44C 01DB914C F06B20C4 */  lwc1        $f0, %lo(UraEventMan + 0xD40)($1)
/* 00D450 01DB9150 36000146 */  c.le.s      $f0, $f1
/* 00D454 01DB9154 00000000 */  nop
/* 00D458 01DB9158 70000145 */  bc1t        .L01DB931C_2BEB1C
/* 00D45C 01DB915C 00000000 */   nop
/* 00D460 01DB9160 02000324 */  addiu       $3, $0, 0x2
/* 00D464 01DB9164 21008310 */  beq         $4, $3, .L01DB91EC_2BE9EC
/* 00D468 01DB9168 00000000 */   nop
/* 00D46C 01DB916C DF01013C */  lui         $1, %hi(CharaDataBuffer__2 + 0x68)
/* 00D470 01DB9170 68FE20AC */  sw          $0, %lo(CharaDataBuffer__2 + 0x68)($1)
/* 00D474 01DB9174 948B828F */  lw          $2, -0x746C($28)
/* 00D478 01DB9178 1000013C */  lui         $1, (0x10C900 >> 16)
/* 00D47C 01DB917C 00C92134 */  ori         $1, $1, (0x10C900 & 0xFFFF)
/* 00D480 01DB9180 21284100 */  addu        $5, $2, $1
/* 00D484 01DB9184 C0100400 */  sll         $2, $4, 3
/* 00D488 01DB9188 21185D00 */  addu        $3, $2, $29
/* 00D48C 01DB918C DF01023C */  lui         $2, %hi(UraEventMan + 0xA50)
/* 00D490 01DB9190 00694424 */  addiu       $4, $2, %lo(UraEventMan + 0xA50)
/* 00D494 01DB9194 1400668C */  lw          $6, 0x14($3)
/* 00D498 01DB9198 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x40)
/* 00D49C 01DB919C 40FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x40)
/* 00D4A0 01DB91A0 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 00D4A4 01DB91A4 60FE4824 */  addiu       $8, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 00D4A8 01DB91A8 284E0070 */  paddub      $9, $0, $0
/* 00D4AC 01DB91AC 08E6040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_
/* 00D4B0 01DB91B0 00000000 */   nop
/* 00D4B4 01DB91B4 E898828F */  lw          $2, -0x6718($28)
/* 00D4B8 01DB91B8 C0100200 */  sll         $2, $2, 3
/* 00D4BC 01DB91BC 21185D00 */  addu        $3, $2, $29
/* 00D4C0 01DB91C0 DF01023C */  lui         $2, %hi(UraEventMan + 0x1C00)
/* 00D4C4 01DB91C4 B07A4424 */  addiu       $4, $2, %lo(UraEventMan + 0x1C00)
/* 00D4C8 01DB91C8 948B858F */  lw          $5, -0x746C($28)
/* 00D4CC 01DB91CC 6400668C */  lw          $6, 0x64($3)
/* 00D4D0 01DB91D0 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x40)
/* 00D4D4 01DB91D4 40FE4724 */  addiu       $7, $2, %lo(CharaDataBuffer__2 + 0x40)
/* 00D4D8 01DB91D8 DF01023C */  lui         $2, %hi(CharaDataBuffer__2 + 0x60)
/* 00D4DC 01DB91DC 60FE4824 */  addiu       $8, $2, %lo(CharaDataBuffer__2 + 0x60)
/* 00D4E0 01DB91E0 284E0070 */  paddub      $9, $0, $0
/* 00D4E4 01DB91E4 08E6040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_
/* 00D4E8 01DB91E8 00000000 */   nop
.L01DB91EC_2BE9EC:
/* 00D4EC 01DB91EC E898838F */  lw          $3, -0x6718($28)
/* 00D4F0 01DB91F0 00210300 */  sll         $4, $3, 4
/* 00D4F4 01DB91F4 DD01033C */  lui         $3, %hi(noroi)
/* 00D4F8 01DB91F8 40616324 */  addiu       $3, $3, %lo(noroi)
/* 00D4FC 01DB91FC 21186400 */  addu        $3, $3, $4
/* 00D500 01DB9200 0000648C */  lw          $4, 0x0($3)
/* 00D504 01DB9204 DF01013C */  lui         $1, %hi(UraEventMan + 0xD94)
/* 00D508 01DB9208 446C238C */  lw          $3, %lo(UraEventMan + 0xD94)($1)
/* 00D50C 01DB920C 000064AC */  sw          $4, 0x0($3)
/* 00D510 01DB9210 E898838F */  lw          $3, -0x6718($28)
/* 00D514 01DB9214 00210300 */  sll         $4, $3, 4
/* 00D518 01DB9218 DD01033C */  lui         $3, %hi(noroi + 0x4)
/* 00D51C 01DB921C 44616324 */  addiu       $3, $3, %lo(noroi + 0x4)
/* 00D520 01DB9220 21186400 */  addu        $3, $3, $4
/* 00D524 01DB9224 0000648C */  lw          $4, 0x0($3)
/* 00D528 01DB9228 DF01013C */  lui         $1, %hi(UraEventMan + 0xD94)
/* 00D52C 01DB922C 446C238C */  lw          $3, %lo(UraEventMan + 0xD94)($1)
/* 00D530 01DB9230 040064AC */  sw          $4, 0x4($3)
/* 00D534 01DB9234 DF01013C */  lui         $1, %hi(UraEventMan + 0xD94)
/* 00D538 01DB9238 446C238C */  lw          $3, %lo(UraEventMan + 0xD94)($1)
/* 00D53C 01DB923C 000060C4 */  lwc1        $f0, 0x0($3)
/* 00D540 01DB9240 20008046 */  cvt.s.w     $f0, $f0
/* 00D544 01DB9244 DF01013C */  lui         $1, %hi(UraEventMan + 0xD40)
/* 00D548 01DB9248 F06B20E4 */  swc1        $f0, %lo(UraEventMan + 0xD40)($1)
/* 00D54C 01DB924C E898838F */  lw          $3, -0x6718($28)
/* 00D550 01DB9250 00210300 */  sll         $4, $3, 4
/* 00D554 01DB9254 DD01033C */  lui         $3, %hi(dancer)
/* 00D558 01DB9258 E0616324 */  addiu       $3, $3, %lo(dancer)
/* 00D55C 01DB925C 21186400 */  addu        $3, $3, $4
/* 00D560 01DB9260 0000648C */  lw          $4, 0x0($3)
/* 00D564 01DB9264 DF01013C */  lui         $1, %hi(UraEventMan + 0x1F44)
/* 00D568 01DB9268 F47D238C */  lw          $3, %lo(UraEventMan + 0x1F44)($1)
/* 00D56C 01DB926C 000064AC */  sw          $4, 0x0($3)
/* 00D570 01DB9270 E898838F */  lw          $3, -0x6718($28)
/* 00D574 01DB9274 00210300 */  sll         $4, $3, 4
/* 00D578 01DB9278 DD01033C */  lui         $3, %hi(dancer + 0x4)
/* 00D57C 01DB927C E4616324 */  addiu       $3, $3, %lo(dancer + 0x4)
/* 00D580 01DB9280 21186400 */  addu        $3, $3, $4
/* 00D584 01DB9284 0000648C */  lw          $4, 0x0($3)
/* 00D588 01DB9288 DF01013C */  lui         $1, %hi(UraEventMan + 0x1F44)
/* 00D58C 01DB928C F47D238C */  lw          $3, %lo(UraEventMan + 0x1F44)($1)
/* 00D590 01DB9290 040064AC */  sw          $4, 0x4($3)
/* 00D594 01DB9294 DF01013C */  lui         $1, %hi(UraEventMan + 0x1F44)
/* 00D598 01DB9298 F47D238C */  lw          $3, %lo(UraEventMan + 0x1F44)($1)
/* 00D59C 01DB929C 000060C4 */  lwc1        $f0, 0x0($3)
/* 00D5A0 01DB92A0 20008046 */  cvt.s.w     $f0, $f0
/* 00D5A4 01DB92A4 DF01013C */  lui         $1, %hi(UraEventMan + 0x1EF0)
/* 00D5A8 01DB92A8 A07D20E4 */  swc1        $f0, %lo(UraEventMan + 0x1EF0)($1)
/* 00D5AC 01DB92AC E898838F */  lw          $3, -0x6718($28)
/* 00D5B0 01DB92B0 01006324 */  addiu       $3, $3, 0x1
/* 00D5B4 01DB92B4 E89883AF */  sw          $3, -0x6718($28)
/* 00D5B8 01DB92B8 E898848F */  lw          $4, -0x6718($28)
/* 00D5BC 01DB92BC 03000324 */  addiu       $3, $0, 0x3
/* 00D5C0 01DB92C0 16008310 */  beq         $4, $3, .L01DB931C_2BEB1C
/* 00D5C4 01DB92C4 00000000 */   nop
/* 00D5C8 01DB92C8 0A008128 */  slti        $1, $4, 0xA
/* 00D5CC 01DB92CC 13002010 */  beqz        $1, .L01DB931C_2BEB1C
/* 00D5D0 01DB92D0 00000000 */   nop
/* 00D5D4 01DB92D4 C0100400 */  sll         $2, $4, 3
/* 00D5D8 01DB92D8 21185D00 */  addu        $3, $2, $29
/* 00D5DC 01DB92DC 948B828F */  lw          $2, -0x746C($28)
/* 00D5E0 01DB92E0 1000013C */  lui         $1, (0x10C900 >> 16)
/* 00D5E4 01DB92E4 00C92134 */  ori         $1, $1, (0x10C900 & 0xFFFF)
/* 00D5E8 01DB92E8 21284100 */  addu        $5, $2, $1
/* 00D5EC 01DB92EC 1000648C */  lw          $4, 0x10($3)
/* 00D5F0 01DB92F0 28360070 */  paddub      $6, $0, $0
/* 00D5F4 01DB92F4 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 00D5F8 01DB92F8 00000000 */   nop
/* 00D5FC 01DB92FC E898828F */  lw          $2, -0x6718($28)
/* 00D600 01DB9300 C0100200 */  sll         $2, $2, 3
/* 00D604 01DB9304 21105D00 */  addu        $2, $2, $29
/* 00D608 01DB9308 948B858F */  lw          $5, -0x746C($28)
/* 00D60C 01DB930C 6000448C */  lw          $4, 0x60($2)
/* 00D610 01DB9310 28360070 */  paddub      $6, $0, $0
/* 00D614 01DB9314 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 00D618 01DB9318 00000000 */   nop
.L01DB931C_2BEB1C:
/* 00D61C 01DB931C DF01013C */  lui         $1, %hi(UraEventMan + 0x16B8)
/* 00D620 01DB9320 687520AC */  sw          $0, %lo(UraEventMan + 0x16B8)($1)
/* 00D624 01DB9324 DF01013C */  lui         $1, %hi(UraEventMan + 0x16B4)
/* 00D628 01DB9328 647520AC */  sw          $0, %lo(UraEventMan + 0x16B4)($1)
/* 00D62C 01DB932C 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 00D630 01DB9330 DF01013C */  lui         $1, %hi(UraEventMan + 0x16B0)
/* 00D634 01DB9334 607523AC */  sw          $3, %lo(UraEventMan + 0x16B0)($1)
/* 00D638 01DB9338 DF01013C */  lui         $1, %hi(UraEventMan + 0xD40)
/* 00D63C 01DB933C F06B21C4 */  lwc1        $f1, %lo(UraEventMan + 0xD40)($1)
/* 00D640 01DB9340 6143033C */  lui         $3, (0x43610000 >> 16)
/* 00D644 01DB9344 00008344 */  mtc1        $3, $f0
/* 00D648 01DB9348 00000000 */  nop
/* 00D64C 01DB934C 36080046 */  c.le.s      $f1, $f0
/* 00D650 01DB9350 00000000 */  nop
/* 00D654 01DB9354 03000145 */  bc1t        .L01DB9364_2BEB64
/* 00D658 01DB9358 00000000 */   nop
/* 00D65C 01DB935C 01000324 */  addiu       $3, $0, 0x1
/* 00D660 01DB9360 EC9883AF */  sw          $3, -0x6714($28)
.L01DB9364_2BEB64:
/* 00D664 01DB9364 EC98848F */  lw          $4, -0x6714($28)
/* 00D668 01DB9368 01000324 */  addiu       $3, $0, 0x1
/* 00D66C 01DB936C 0A008314 */  bne         $4, $3, .L01DB9398_2BEB98
/* 00D670 01DB9370 00000000 */   nop
/* 00D674 01DB9374 E001013C */  lui         $1, %hi(main_lightcolor + 0x28)
/* 00D678 01DB9378 188720AC */  sw          $0, %lo(main_lightcolor + 0x28)($1)
/* 00D67C 01DB937C E001013C */  lui         $1, %hi(main_lightcolor + 0x24)
/* 00D680 01DB9380 148720AC */  sw          $0, %lo(main_lightcolor + 0x24)($1)
/* 00D684 01DB9384 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 00D688 01DB9388 E001013C */  lui         $1, %hi(main_lightcolor + 0x20)
/* 00D68C 01DB938C 108723AC */  sw          $3, %lo(main_lightcolor + 0x20)($1)
/* 00D690 01DB9390 08000010 */  b           .L01DB93B4_2BEBB4
/* 00D694 01DB9394 00000000 */   nop
.L01DB9398_2BEB98:
/* 00D698 01DB9398 E001013C */  lui         $1, %hi(main_lightcolor + 0x28)
/* 00D69C 01DB939C 188723AC */  sw          $3, %lo(main_lightcolor + 0x28)($1)
/* 00D6A0 01DB93A0 E001013C */  lui         $1, %hi(main_lightcolor + 0x24)
/* 00D6A4 01DB93A4 148720AC */  sw          $0, %lo(main_lightcolor + 0x24)($1)
/* 00D6A8 01DB93A8 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 00D6AC 01DB93AC E001013C */  lui         $1, %hi(main_lightcolor + 0x20)
/* 00D6B0 01DB93B0 108723AC */  sw          $3, %lo(main_lightcolor + 0x20)($1)
.L01DB93B4_2BEBB4:
/* 00D6B4 01DB93B4 0000BF7B */  lq          $31, 0x0($29)
/* 00D6B8 01DB93B8 B000BD27 */  addiu       $29, $29, 0xB0
/* 00D6BC 01DB93BC 0800E003 */  jr          $31
/* 00D6C0 01DB93C0 00000000 */   nop
/* 00D6C4 01DB93C4 00000000 */  nop
/* 00D6C8 01DB93C8 00000000 */  nop
/* 00D6CC 01DB93CC 00000000 */  nop
