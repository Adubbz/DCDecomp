.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MotionProcess__Fv__2
/* 01D3A0 01DC90A0 00FFBD27 */  addiu       $29, $29, -0x100
/* 01D3A4 01DC90A4 4000BF7F */  sq          $31, 0x40($29)
/* 01D3A8 01DC90A8 3000B37F */  sq          $19, 0x30($29)
/* 01D3AC 01DC90AC 2000B27F */  sq          $18, 0x20($29)
/* 01D3B0 01DC90B0 1000B17F */  sq          $17, 0x10($29)
/* 01D3B4 01DC90B4 0000B07F */  sq          $16, 0x0($29)
/* 01D3B8 01DC90B8 E301013C */  lui         $1, %hi(CScript + 0x8)
/* 01D3BC 01DC90BC C8E9238C */  lw          $3, %lo(CScript + 0x8)($1)
/* 01D3C0 01DC90C0 04000224 */  addiu       $2, $0, 0x4
/* 01D3C4 01DC90C4 2D006210 */  beq         $3, $2, .L01DC917C_2CE97C
/* 01D3C8 01DC90C8 00000000 */   nop
/* 01D3CC 01DC90CC 03000224 */  addiu       $2, $0, 0x3
/* 01D3D0 01DC90D0 1F006210 */  beq         $3, $2, .L01DC9150_2CE950
/* 01D3D4 01DC90D4 00000000 */   nop
/* 01D3D8 01DC90D8 02000224 */  addiu       $2, $0, 0x2
/* 01D3DC 01DC90DC 11006210 */  beq         $3, $2, .L01DC9124_2CE924
/* 01D3E0 01DC90E0 00000000 */   nop
/* 01D3E4 01DC90E4 01000224 */  addiu       $2, $0, 0x1
/* 01D3E8 01DC90E8 03006210 */  beq         $3, $2, .L01DC90F8_2CE8F8
/* 01D3EC 01DC90EC 00000000 */   nop
/* 01D3F0 01DC90F0 2B000010 */  b           .L01DC91A0_2CE9A0
/* 01D3F4 01DC90F4 00000000 */   nop
.L01DC90F8_2CE8F8:
/* 01D3F8 01DC90F8 E301023C */  lui         $2, %hi(DispFade__2)
/* 01D3FC 01DC90FC 70E94424 */  addiu       $4, $2, %lo(DispFade__2)
/* 01D400 01DC9100 E301013C */  lui         $1, %hi(CScript + 0xC)
/* 01D404 01DC9104 CCE92CC4 */  lwc1        $f12, %lo(CScript + 0xC)($1)
/* 01D408 01DC9108 282E0070 */  paddub      $5, $0, $0
/* 01D40C 01DC910C 80B4760C */  jal         FadeInStart__9CDispFadeFfi
/* 01D410 01DC9110 00000000 */   nop
/* 01D414 01DC9114 E301013C */  lui         $1, %hi(CScript + 0x8)
/* 01D418 01DC9118 C8E920AC */  sw          $0, %lo(CScript + 0x8)($1)
/* 01D41C 01DC911C 20000010 */  b           .L01DC91A0_2CE9A0
/* 01D420 01DC9120 00000000 */   nop
.L01DC9124_2CE924:
/* 01D424 01DC9124 E301023C */  lui         $2, %hi(DispFade__2)
/* 01D428 01DC9128 70E94424 */  addiu       $4, $2, %lo(DispFade__2)
/* 01D42C 01DC912C E301013C */  lui         $1, %hi(CScript + 0xC)
/* 01D430 01DC9130 CCE92CC4 */  lwc1        $f12, %lo(CScript + 0xC)($1)
/* 01D434 01DC9134 282E0070 */  paddub      $5, $0, $0
/* 01D438 01DC9138 78B4760C */  jal         FadeOutStart__9CDispFadeFfi
/* 01D43C 01DC913C 00000000 */   nop
/* 01D440 01DC9140 E301013C */  lui         $1, %hi(CScript + 0x8)
/* 01D444 01DC9144 C8E920AC */  sw          $0, %lo(CScript + 0x8)($1)
/* 01D448 01DC9148 15000010 */  b           .L01DC91A0_2CE9A0
/* 01D44C 01DC914C 00000000 */   nop
.L01DC9150_2CE950:
/* 01D450 01DC9150 E301023C */  lui         $2, %hi(DispFade__2)
/* 01D454 01DC9154 70E94424 */  addiu       $4, $2, %lo(DispFade__2)
/* 01D458 01DC9158 E301013C */  lui         $1, %hi(CScript + 0xC)
/* 01D45C 01DC915C CCE92CC4 */  lwc1        $f12, %lo(CScript + 0xC)($1)
/* 01D460 01DC9160 01000524 */  addiu       $5, $0, 0x1
/* 01D464 01DC9164 80B4760C */  jal         FadeInStart__9CDispFadeFfi
/* 01D468 01DC9168 00000000 */   nop
/* 01D46C 01DC916C E301013C */  lui         $1, %hi(CScript + 0x8)
/* 01D470 01DC9170 C8E920AC */  sw          $0, %lo(CScript + 0x8)($1)
/* 01D474 01DC9174 0A000010 */  b           .L01DC91A0_2CE9A0
/* 01D478 01DC9178 00000000 */   nop
.L01DC917C_2CE97C:
/* 01D47C 01DC917C E301023C */  lui         $2, %hi(DispFade__2)
/* 01D480 01DC9180 70E94424 */  addiu       $4, $2, %lo(DispFade__2)
/* 01D484 01DC9184 E301013C */  lui         $1, %hi(CScript + 0xC)
/* 01D488 01DC9188 CCE92CC4 */  lwc1        $f12, %lo(CScript + 0xC)($1)
/* 01D48C 01DC918C 01000524 */  addiu       $5, $0, 0x1
/* 01D490 01DC9190 78B4760C */  jal         FadeOutStart__9CDispFadeFfi
/* 01D494 01DC9194 00000000 */   nop
/* 01D498 01DC9198 E301013C */  lui         $1, %hi(CScript + 0x8)
/* 01D49C 01DC919C C8E920AC */  sw          $0, %lo(CScript + 0x8)($1)
.L01DC91A0_2CE9A0:
/* 01D4A0 01DC91A0 E301023C */  lui         $2, %hi(DispFade__2)
/* 01D4A4 01DC91A4 70E94424 */  addiu       $4, $2, %lo(DispFade__2)
/* 01D4A8 01DC91A8 90B4760C */  jal         GetRate__9CDispFadeFv
/* 01D4AC 01DC91AC 00000000 */   nop
/* 01D4B0 01DC91B0 06030046 */  mov.s       $f12, $f0
/* 01D4B4 01DC91B4 9044040C */  jal         fptodp
/* 01D4B8 01DC91B8 00000000 */   nop
/* 01D4BC 01DC91BC 6040033C */  lui         $3, (0x40600000 >> 16)
/* 01D4C0 01DC91C0 3C200300 */  dsll32      $4, $3, 0
/* 01D4C4 01DC91C4 282E4070 */  paddub      $5, $2, $0
/* 01D4C8 01DC91C8 3000040C */  jal         _dpfeq
/* 01D4CC 01DC91CC 00000000 */   nop
/* 01D4D0 01DC91D0 1F034014 */  bnez        $2, .L01DC9E50_2CF650
/* 01D4D4 01DC91D4 00000000 */   nop
/* 01D4D8 01DC91D8 E301013C */  lui         $1, %hi(CScript + 0x18)
/* 01D4DC 01DC91DC D8E9248C */  lw          $4, %lo(CScript + 0x18)($1)
/* 01D4E0 01DC91E0 09000324 */  addiu       $3, $0, 0x9
/* 01D4E4 01DC91E4 1A038310 */  beq         $4, $3, .L01DC9E50_2CF650
/* 01D4E8 01DC91E8 00000000 */   nop
/* 01D4EC 01DC91EC E301013C */  lui         $1, %hi(CScript + 0x4E8)
/* 01D4F0 01DC91F0 A8EE2290 */  lbu         $2, %lo(CScript + 0x4E8)($1)
/* 01D4F4 01DC91F4 28004010 */  beqz        $2, .L01DC9298_2CEA98
/* 01D4F8 01DC91F8 00000000 */   nop
/* 01D4FC 01DC91FC E301013C */  lui         $1, %hi(CScript + 0x4DC)
/* 01D500 01DC9200 9CEE248C */  lw          $4, %lo(CScript + 0x4DC)($1)
/* 01D504 01DC9204 E501013C */  lui         $1, %hi(MotionInfo)
/* 01D508 01DC9208 B00A24AC */  sw          $4, %lo(MotionInfo)($1)
/* 01D50C 01DC920C E301013C */  lui         $1, %hi(CScript + 0x4E0)
/* 01D510 01DC9210 A0EE228C */  lw          $2, %lo(CScript + 0x4E0)($1)
/* 01D514 01DC9214 E501013C */  lui         $1, %hi(MotionInfo + 0x4)
/* 01D518 01DC9218 B40A22AC */  sw          $2, %lo(MotionInfo + 0x4)($1)
/* 01D51C 01DC921C E301013C */  lui         $1, %hi(CScript + 0x4E4)
/* 01D520 01DC9220 A4EE20C4 */  lwc1        $f0, %lo(CScript + 0x4E4)($1)
/* 01D524 01DC9224 E501013C */  lui         $1, %hi(MotionInfo + 0x8)
/* 01D528 01DC9228 B80A20E4 */  swc1        $f0, %lo(MotionInfo + 0x8)($1)
/* 01D52C 01DC922C E301013C */  lui         $1, %hi(CScript + 0x4)
/* 01D530 01DC9230 C4E9238C */  lw          $3, %lo(CScript + 0x4)($1)
/* 01D534 01DC9234 E301013C */  lui         $1, %hi(CScript)
/* 01D538 01DC9238 C0E9228C */  lw          $2, %lo(CScript)($1)
/* 01D53C 01DC923C 04006210 */  beq         $3, $2, .L01DC9250_2CEA50
/* 01D540 01DC9240 00000000 */   nop
/* 01D544 01DC9244 C09B828F */  lw          $2, -0x6440($28)
/* 01D548 01DC9248 01004224 */  addiu       $2, $2, 0x1
/* 01D54C 01DC924C C09B82AF */  sw          $2, -0x6440($28)
.L01DC9250_2CEA50:
/* 01D550 01DC9250 00008444 */  mtc1        $4, $f0
/* 01D554 01DC9254 00000000 */  nop
/* 01D558 01DC9258 20008046 */  cvt.s.w     $f0, $f0
/* 01D55C 01DC925C C09B838F */  lw          $3, -0x6440($28)
/* 01D560 01DC9260 B0110224 */  addiu       $2, $0, 0x11B0
/* 01D564 01DC9264 18206200 */  mult        $4, $3, $2
/* 01D568 01DC9268 E501023C */  lui         $2, %hi(Cam + 0x2F0)
/* 01D56C 01DC926C E0C64224 */  addiu       $2, $2, %lo(Cam + 0x2F0)
/* 01D570 01DC9270 21104400 */  addu        $2, $2, $4
/* 01D574 01DC9274 000040E4 */  swc1        $f0, 0x0($2)
/* 01D578 01DC9278 E301023C */  lui         $2, %hi(MainCamera__3)
/* 01D57C 01DC927C 80E64324 */  addiu       $3, $2, %lo(MainCamera__3)
/* 01D580 01DC9280 E501023C */  lui         $2, %hi(Cam + 0x310)
/* 01D584 01DC9284 00C74224 */  addiu       $2, $2, %lo(Cam + 0x310)
/* 01D588 01DC9288 21104400 */  addu        $2, $2, $4
/* 01D58C 01DC928C 000043AC */  sw          $3, 0x0($2)
/* 01D590 01DC9290 E301013C */  lui         $1, %hi(CScript + 0x4E8)
/* 01D594 01DC9294 A8EE20A0 */  sb          $0, %lo(CScript + 0x4E8)($1)
.L01DC9298_2CEA98:
/* 01D598 01DC9298 C09B838F */  lw          $3, -0x6440($28)
/* 01D59C 01DC929C B0110224 */  addiu       $2, $0, 0x11B0
/* 01D5A0 01DC92A0 18186200 */  mult        $3, $3, $2
/* 01D5A4 01DC92A4 E501023C */  lui         $2, %hi(Cam + 0x2F0)
/* 01D5A8 01DC92A8 E0C64224 */  addiu       $2, $2, %lo(Cam + 0x2F0)
/* 01D5AC 01DC92AC 21184300 */  addu        $3, $2, $3
/* 01D5B0 01DC92B0 000061C4 */  lwc1        $f1, 0x0($3)
/* 01D5B4 01DC92B4 E301013C */  lui         $1, %hi(CScript + 0x4E0)
/* 01D5B8 01DC92B8 A0EE228C */  lw          $2, %lo(CScript + 0x4E0)($1)
/* 01D5BC 01DC92BC FFFF4224 */  addiu       $2, $2, -0x1
/* 01D5C0 01DC92C0 00008244 */  mtc1        $2, $f0
/* 01D5C4 01DC92C4 00000000 */  nop
/* 01D5C8 01DC92C8 20008046 */  cvt.s.w     $f0, $f0
/* 01D5CC 01DC92CC 36080046 */  c.le.s      $f1, $f0
/* 01D5D0 01DC92D0 00000000 */  nop
/* 01D5D4 01DC92D4 02000145 */  bc1t        .L01DC92E0_2CEAE0
/* 01D5D8 01DC92D8 00000000 */   nop
/* 01D5DC 01DC92DC 000060E4 */  swc1        $f0, 0x0($3)
.L01DC92E0_2CEAE0:
/* 01D5E0 01DC92E0 28860070 */  paddub      $16, $0, $0
/* 01D5E4 01DC92E4 0A000010 */  b           .L01DC9310_2CEB10
/* 01D5E8 01DC92E8 00000000 */   nop
.L01DC92EC_2CEAEC:
/* 01D5EC 01DC92EC C0101000 */  sll         $2, $16, 3
/* 01D5F0 01DC92F0 21105000 */  addu        $2, $2, $16
/* 01D5F4 01DC92F4 00190200 */  sll         $3, $2, 4
/* 01D5F8 01DC92F8 E201023C */  lui         $2, %hi(OP_AnimeSeq)
/* 01D5FC 01DC92FC 20C54224 */  addiu       $2, $2, %lo(OP_AnimeSeq)
/* 01D600 01DC9300 21204300 */  addu        $4, $2, $3
/* 01D604 01DC9304 7898050C */  jal         ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 01D608 01DC9308 00000000 */   nop
/* 01D60C 01DC930C 01001026 */  addiu       $16, $16, 0x1
.L01DC9310_2CEB10:
/* 01D610 01DC9310 B498828F */  lw          $2, -0x674C($28)
/* 01D614 01DC9314 FFFF4224 */  addiu       $2, $2, -0x1
/* 01D618 01DC9318 2A100202 */  slt         $2, $16, $2
/* 01D61C 01DC931C F3FF4014 */  bnez        $2, .L01DC92EC_2CEAEC
/* 01D620 01DC9320 00000000 */   nop
/* 01D624 01DC9324 28160070 */  paddub      $2, $0, $0
/* 01D628 01DC9328 84000010 */  b           .L01DC953C_2CED3C
/* 01D62C 01DC932C 00000000 */   nop
.L01DC9330_2CEB30:
/* 01D630 01DC9330 40180200 */  sll         $3, $2, 1
/* 01D634 01DC9334 21186200 */  addu        $3, $3, $2
/* 01D638 01DC9338 80180300 */  sll         $3, $3, 2
/* 01D63C 01DC933C 21186200 */  addu        $3, $3, $2
/* 01D640 01DC9340 80180300 */  sll         $3, $3, 2
/* 01D644 01DC9344 E301043C */  lui         $4, %hi(CScript + 0x30)
/* 01D648 01DC9348 F0E98424 */  addiu       $4, $4, %lo(CScript + 0x30)
/* 01D64C 01DC934C 21208300 */  addu        $4, $4, $3
/* 01D650 01DC9350 00008490 */  lbu         $4, 0x0($4)
/* 01D654 01DC9354 78008010 */  beqz        $4, .L01DC9538_2CED38
/* 01D658 01DC9358 00000000 */   nop
/* 01D65C 01DC935C E301043C */  lui         $4, %hi(CScript + 0x38)
/* 01D660 01DC9360 F8E98424 */  addiu       $4, $4, %lo(CScript + 0x38)
/* 01D664 01DC9364 21208300 */  addu        $4, $4, $3
/* 01D668 01DC9368 0000888C */  lw          $8, 0x0($4)
/* 01D66C 01DC936C FFFF0524 */  addiu       $5, $0, -0x1
/* 01D670 01DC9370 20000511 */  beq         $8, $5, .L01DC93F4_2CEBF4
/* 01D674 01DC9374 00000000 */   nop
/* 01D678 01DC9378 B0110524 */  addiu       $5, $0, 0x11B0
/* 01D67C 01DC937C 18384500 */  mult        $7, $2, $5
/* 01D680 01DC9380 DF01053C */  lui         $5, %hi(Chara__3 + 0x344)
/* 01D684 01DC9384 2402A524 */  addiu       $5, $5, %lo(Chara__3 + 0x344)
/* 01D688 01DC9388 2128A700 */  addu        $5, $5, $7
/* 01D68C 01DC938C 0000A68C */  lw          $6, 0x0($5)
/* 01D690 01DC9390 E301053C */  lui         $5, %hi(CScript + 0x34)
/* 01D694 01DC9394 F4E9A524 */  addiu       $5, $5, %lo(CScript + 0x34)
/* 01D698 01DC9398 2148A300 */  addu        $9, $5, $3
/* 01D69C 01DC939C 0000258D */  lw          $5, 0x0($9)
/* 01D6A0 01DC93A0 00290500 */  sll         $5, $5, 4
/* 01D6A4 01DC93A4 2128A600 */  addu        $5, $5, $6
/* 01D6A8 01DC93A8 0400A58C */  lw          $5, 0x4($5)
/* 01D6AC 01DC93AC FFFFA524 */  addiu       $5, $5, -0x1
/* 01D6B0 01DC93B0 00008544 */  mtc1        $5, $f0
/* 01D6B4 01DC93B4 00000000 */  nop
/* 01D6B8 01DC93B8 60008046 */  cvt.s.w     $f1, $f0
/* 01D6BC 01DC93BC DF01053C */  lui         $5, %hi(Chara__3 + 0x2F0)
/* 01D6C0 01DC93C0 D001A524 */  addiu       $5, $5, %lo(Chara__3 + 0x2F0)
/* 01D6C4 01DC93C4 2128A700 */  addu        $5, $5, $7
/* 01D6C8 01DC93C8 0000A0C4 */  lwc1        $f0, 0x0($5)
/* 01D6CC 01DC93CC 36000146 */  c.le.s      $f0, $f1
/* 01D6D0 01DC93D0 01000524 */  addiu       $5, $0, 0x1
/* 01D6D4 01DC93D4 02000045 */  bc1f        .L01DC93E0_2CEBE0
/* 01D6D8 01DC93D8 00000000 */   nop
/* 01D6DC 01DC93DC 282E0070 */  paddub      $5, $0, $0
.L01DC93E0_2CEBE0:
/* 01D6E0 01DC93E0 0400A010 */  beqz        $5, .L01DC93F4_2CEBF4
/* 01D6E4 01DC93E4 00000000 */   nop
/* 01D6E8 01DC93E8 000028AD */  sw          $8, 0x0($9)
/* 01D6EC 01DC93EC FFFF0524 */  addiu       $5, $0, -0x1
/* 01D6F0 01DC93F0 000085AC */  sw          $5, 0x0($4)
.L01DC93F4_2CEBF4:
/* 01D6F4 01DC93F4 E301043C */  lui         $4, %hi(CScript + 0x60)
/* 01D6F8 01DC93F8 20EA8424 */  addiu       $4, $4, %lo(CScript + 0x60)
/* 01D6FC 01DC93FC 21208300 */  addu        $4, $4, $3
/* 01D700 01DC9400 000081C4 */  lwc1        $f1, 0x0($4)
/* 01D704 01DC9404 B0110424 */  addiu       $4, $0, 0x11B0
/* 01D708 01DC9408 18204400 */  mult        $4, $2, $4
/* 01D70C 01DC940C DF01053C */  lui         $5, %hi(Chara__3 + 0x2F8)
/* 01D710 01DC9410 D801A524 */  addiu       $5, $5, %lo(Chara__3 + 0x2F8)
/* 01D714 01DC9414 2128A400 */  addu        $5, $5, $4
/* 01D718 01DC9418 0000A1E4 */  swc1        $f1, 0x0($5)
/* 01D71C 01DC941C 803F053C */  lui         $5, (0x3F800000 >> 16)
/* 01D720 01DC9420 00008544 */  mtc1        $5, $f0
/* 01D724 01DC9424 00000000 */  nop
/* 01D728 01DC9428 32000146 */  c.eq.s      $f0, $f1
/* 01D72C 01DC942C 00000000 */  nop
/* 01D730 01DC9430 30000045 */  bc1f        .L01DC94F4_2CECF4
/* 01D734 01DC9434 00000000 */   nop
/* 01D738 01DC9438 E301053C */  lui         $5, %hi(CScript + 0x34)
/* 01D73C 01DC943C F4E9A524 */  addiu       $5, $5, %lo(CScript + 0x34)
/* 01D740 01DC9440 2118A300 */  addu        $3, $5, $3
/* 01D744 01DC9444 0000668C */  lw          $6, 0x0($3)
/* 01D748 01DC9448 DF01033C */  lui         $3, %hi(Chara__3 + 0xC68)
/* 01D74C 01DC944C 480B6324 */  addiu       $3, $3, %lo(Chara__3 + 0xC68)
/* 01D750 01DC9450 21386400 */  addu        $7, $3, $4
/* 01D754 01DC9454 0000E38C */  lw          $3, 0x0($7)
/* 01D758 01DC9458 1A00C310 */  beq         $6, $3, .L01DC94C4_2CECC4
/* 01D75C 01DC945C 00000000 */   nop
/* 01D760 01DC9460 DF01033C */  lui         $3, %hi(Chara__3 + 0x344)
/* 01D764 01DC9464 24026324 */  addiu       $3, $3, %lo(Chara__3 + 0x344)
/* 01D768 01DC9468 21186400 */  addu        $3, $3, $4
/* 01D76C 01DC946C 00290600 */  sll         $5, $6, 4
/* 01D770 01DC9470 0000638C */  lw          $3, 0x0($3)
/* 01D774 01DC9474 21186500 */  addu        $3, $3, $5
/* 01D778 01DC9478 000060C4 */  lwc1        $f0, 0x0($3)
/* 01D77C 01DC947C 20008046 */  cvt.s.w     $f0, $f0
/* 01D780 01DC9480 DF01033C */  lui         $3, %hi(Chara__3 + 0x2F0)
/* 01D784 01DC9484 D0016324 */  addiu       $3, $3, %lo(Chara__3 + 0x2F0)
/* 01D788 01DC9488 21186400 */  addu        $3, $3, $4
/* 01D78C 01DC948C 000060E4 */  swc1        $f0, 0x0($3)
/* 01D790 01DC9490 0000E6AC */  sw          $6, 0x0($7)
/* 01D794 01DC9494 04000524 */  addiu       $5, $0, 0x4
/* 01D798 01DC9498 DF01033C */  lui         $3, %hi(Chara__3 + 0xC64)
/* 01D79C 01DC949C 440B6324 */  addiu       $3, $3, %lo(Chara__3 + 0xC64)
/* 01D7A0 01DC94A0 21186400 */  addu        $3, $3, $4
/* 01D7A4 01DC94A4 000065AC */  sw          $5, 0x0($3)
/* 01D7A8 01DC94A8 80BF053C */  lui         $5, (0xBF800000 >> 16)
/* 01D7AC 01DC94AC DF01033C */  lui         $3, %hi(Chara__3 + 0xC60)
/* 01D7B0 01DC94B0 400B6324 */  addiu       $3, $3, %lo(Chara__3 + 0xC60)
/* 01D7B4 01DC94B4 21186400 */  addu        $3, $3, $4
/* 01D7B8 01DC94B8 000065AC */  sw          $5, 0x0($3)
/* 01D7BC 01DC94BC 1E000010 */  b           .L01DC9538_2CED38
/* 01D7C0 01DC94C0 00000000 */   nop
.L01DC94C4_2CECC4:
/* 01D7C4 01DC94C4 0000E6AC */  sw          $6, 0x0($7)
/* 01D7C8 01DC94C8 DF01033C */  lui         $3, %hi(Chara__3 + 0xC64)
/* 01D7CC 01DC94CC 440B6324 */  addiu       $3, $3, %lo(Chara__3 + 0xC64)
/* 01D7D0 01DC94D0 21186400 */  addu        $3, $3, $4
/* 01D7D4 01DC94D4 000060AC */  sw          $0, 0x0($3)
/* 01D7D8 01DC94D8 80BF053C */  lui         $5, (0xBF800000 >> 16)
/* 01D7DC 01DC94DC DF01033C */  lui         $3, %hi(Chara__3 + 0xC60)
/* 01D7E0 01DC94E0 400B6324 */  addiu       $3, $3, %lo(Chara__3 + 0xC60)
/* 01D7E4 01DC94E4 21186400 */  addu        $3, $3, $4
/* 01D7E8 01DC94E8 000065AC */  sw          $5, 0x0($3)
/* 01D7EC 01DC94EC 12000010 */  b           .L01DC9538_2CED38
/* 01D7F0 01DC94F0 00000000 */   nop
.L01DC94F4_2CECF4:
/* 01D7F4 01DC94F4 E301053C */  lui         $5, %hi(CScript + 0x34)
/* 01D7F8 01DC94F8 F4E9A524 */  addiu       $5, $5, %lo(CScript + 0x34)
/* 01D7FC 01DC94FC 2118A300 */  addu        $3, $5, $3
/* 01D800 01DC9500 0000658C */  lw          $5, 0x0($3)
/* 01D804 01DC9504 DF01033C */  lui         $3, %hi(Chara__3 + 0xC68)
/* 01D808 01DC9508 480B6324 */  addiu       $3, $3, %lo(Chara__3 + 0xC68)
/* 01D80C 01DC950C 21186400 */  addu        $3, $3, $4
/* 01D810 01DC9510 000065AC */  sw          $5, 0x0($3)
/* 01D814 01DC9514 DF01033C */  lui         $3, %hi(Chara__3 + 0xC64)
/* 01D818 01DC9518 440B6324 */  addiu       $3, $3, %lo(Chara__3 + 0xC64)
/* 01D81C 01DC951C 21186400 */  addu        $3, $3, $4
/* 01D820 01DC9520 000060AC */  sw          $0, 0x0($3)
/* 01D824 01DC9524 80BF053C */  lui         $5, (0xBF800000 >> 16)
/* 01D828 01DC9528 DF01033C */  lui         $3, %hi(Chara__3 + 0xC60)
/* 01D82C 01DC952C 400B6324 */  addiu       $3, $3, %lo(Chara__3 + 0xC60)
/* 01D830 01DC9530 21186400 */  addu        $3, $3, $4
/* 01D834 01DC9534 000065AC */  sw          $5, 0x0($3)
.L01DC9538_2CED38:
/* 01D838 01DC9538 01004224 */  addiu       $2, $2, 0x1
.L01DC953C_2CED3C:
/* 01D83C 01DC953C 09004328 */  slti        $3, $2, 0x9
/* 01D840 01DC9540 7BFF6014 */  bnez        $3, .L01DC9330_2CEB30
/* 01D844 01DC9544 00000000 */   nop
/* 01D848 01DC9548 C09B838F */  lw          $3, -0x6440($28)
/* 01D84C 01DC954C B0110224 */  addiu       $2, $0, 0x11B0
/* 01D850 01DC9550 18206200 */  mult        $4, $3, $2
/* 01D854 01DC9554 E501023C */  lui         $2, %hi(Cam)
/* 01D858 01DC9558 F0C34224 */  addiu       $2, $2, %lo(Cam)
/* 01D85C 01DC955C 21184400 */  addu        $3, $2, $4
/* 01D860 01DC9560 E501023C */  lui         $2, %hi(Cam + 0xBC)
/* 01D864 01DC9564 ACC44224 */  addiu       $2, $2, %lo(Cam + 0xBC)
/* 01D868 01DC9568 21104400 */  addu        $2, $2, $4
/* 01D86C 01DC956C 0000448C */  lw          $4, 0x0($2)
/* 01D870 01DC9570 E0026524 */  addiu       $5, $3, 0x2E0
/* 01D874 01DC9574 E501023C */  lui         $2, %hi(MotionInfo)
/* 01D878 01DC9578 B00A4624 */  addiu       $6, $2, %lo(MotionInfo)
/* 01D87C 01DC957C F0026724 */  addiu       $7, $3, 0x2F0
/* 01D880 01DC9580 E401023C */  lui         $2, %hi(frame_info_cam__2)
/* 01D884 01DC9584 30D04824 */  addiu       $8, $2, %lo(frame_info_cam__2)
/* 01D888 01DC9588 4023050C */  jal         SetMotionEX__FP6CFrameP14tagMOTION_TYPEP11MOTION_INFOP12MOTION_STATEP12tagFRAME_INF
/* 01D88C 01DC958C 00000000 */   nop
/* 01D890 01DC9590 E301013C */  lui         $1, %hi(CScript + 0x18)
/* 01D894 01DC9594 D8E9228C */  lw          $2, %lo(CScript + 0x18)($1)
/* 01D898 01DC9598 09004014 */  bnez        $2, .L01DC95C0_2CEDC0
/* 01D89C 01DC959C 00000000 */   nop
/* 01D8A0 01DC95A0 9C8080C7 */  lwc1        $f0, -0x7F64($28)
/* 01D8A4 01DC95A4 5000A0E7 */  swc1        $f0, 0x50($29)
/* 01D8A8 01DC95A8 CC8180C7 */  lwc1        $f0, -0x7E34($28)
/* 01D8AC 01DC95AC 5800A0E7 */  swc1        $f0, 0x58($29)
/* 01D8B0 01DC95B0 5400A0AF */  sw          $0, 0x54($29)
/* 01D8B4 01DC95B4 5C00A0AF */  sw          $0, 0x5C($29)
/* 01D8B8 01DC95B8 07000010 */  b           .L01DC95D8_2CEDD8
/* 01D8BC 01DC95BC 00000000 */   nop
.L01DC95C0_2CEDC0:
/* 01D8C0 01DC95C0 CC8180C7 */  lwc1        $f0, -0x7E34($28)
/* 01D8C4 01DC95C4 5000A0E7 */  swc1        $f0, 0x50($29)
/* 01D8C8 01DC95C8 9C8080C7 */  lwc1        $f0, -0x7F64($28)
/* 01D8CC 01DC95CC 5800A0E7 */  swc1        $f0, 0x58($29)
/* 01D8D0 01DC95D0 5400A0AF */  sw          $0, 0x54($29)
/* 01D8D4 01DC95D4 5C00A0AF */  sw          $0, 0x5C($29)
.L01DC95D8_2CEDD8:
/* 01D8D8 01DC95D8 E401023C */  lui         $2, %hi(Wind__4)
/* 01D8DC 01DC95DC C0CC4424 */  addiu       $4, $2, %lo(Wind__4)
/* 01D8E0 01DC95E0 5000A527 */  addiu       $5, $29, 0x50
/* 01D8E4 01DC95E4 20ED040C */  jal         SetDir__5CWindFPf
/* 01D8E8 01DC95E8 00000000 */   nop
/* 01D8EC 01DC95EC E301013C */  lui         $1, %hi(CScript + 0x18)
/* 01D8F0 01DC95F0 D8E9248C */  lw          $4, %lo(CScript + 0x18)($1)
/* 01D8F4 01DC95F4 0A00812C */  sltiu       $1, $4, 0xA
/* 01D8F8 01DC95F8 4C002010 */  beqz        $1, .L01DC972C_2CEF2C
/* 01D8FC 01DC95FC 00000000 */   nop
/* 01D900 01DC9600 DE01023C */  lui         $2, %hi(LIT_575__6)
/* 01D904 01DC9604 00FF4324 */  addiu       $3, $2, %lo(LIT_575__6)
/* 01D908 01DC9608 80100400 */  sll         $2, $4, 2
/* 01D90C 01DC960C 21104300 */  addu        $2, $2, $3
/* 01D910 01DC9610 0000428C */  lw          $2, 0x0($2)
/* 01D914 01DC9614 08004000 */  jr          $2
/* 01D918 01DC9618 00000000 */   nop
/* 01D91C 01DC961C E401023C */  lui         $2, %hi(Wind__4)
/* 01D920 01DC9620 C0CC4424 */  addiu       $4, $2, %lo(Wind__4)
/* 01D924 01DC9624 D0818CC7 */  lwc1        $f12, -0x7E30($28)
/* 01D928 01DC9628 2CED040C */  jal         SetVelocity__5CWindFf
/* 01D92C 01DC962C 00000000 */   nop
/* 01D930 01DC9630 3E000010 */  b           .L01DC972C_2CEF2C
/* 01D934 01DC9634 00000000 */   nop
/* 01D938 01DC9638 E401023C */  lui         $2, %hi(Wind__4)
/* 01D93C 01DC963C C0CC4424 */  addiu       $4, $2, %lo(Wind__4)
/* 01D940 01DC9640 D4818CC7 */  lwc1        $f12, -0x7E2C($28)
/* 01D944 01DC9644 2CED040C */  jal         SetVelocity__5CWindFf
/* 01D948 01DC9648 00000000 */   nop
/* 01D94C 01DC964C 37000010 */  b           .L01DC972C_2CEF2C
/* 01D950 01DC9650 00000000 */   nop
/* 01D954 01DC9654 E401023C */  lui         $2, %hi(Wind__4)
/* 01D958 01DC9658 C0CC4424 */  addiu       $4, $2, %lo(Wind__4)
/* 01D95C 01DC965C D4818CC7 */  lwc1        $f12, -0x7E2C($28)
/* 01D960 01DC9660 2CED040C */  jal         SetVelocity__5CWindFf
/* 01D964 01DC9664 00000000 */   nop
/* 01D968 01DC9668 30000010 */  b           .L01DC972C_2CEF2C
/* 01D96C 01DC966C 00000000 */   nop
/* 01D970 01DC9670 E401023C */  lui         $2, %hi(Wind__4)
/* 01D974 01DC9674 C0CC4424 */  addiu       $4, $2, %lo(Wind__4)
/* 01D978 01DC9678 D4818CC7 */  lwc1        $f12, -0x7E2C($28)
/* 01D97C 01DC967C 2CED040C */  jal         SetVelocity__5CWindFf
/* 01D980 01DC9680 00000000 */   nop
/* 01D984 01DC9684 29000010 */  b           .L01DC972C_2CEF2C
/* 01D988 01DC9688 00000000 */   nop
/* 01D98C 01DC968C 00608044 */  mtc1        $0, $f12
/* 01D990 01DC9690 E401023C */  lui         $2, %hi(Wind__4)
/* 01D994 01DC9694 C0CC4424 */  addiu       $4, $2, %lo(Wind__4)
/* 01D998 01DC9698 2CED040C */  jal         SetVelocity__5CWindFf
/* 01D99C 01DC969C 00000000 */   nop
/* 01D9A0 01DC96A0 22000010 */  b           .L01DC972C_2CEF2C
/* 01D9A4 01DC96A4 00000000 */   nop
/* 01D9A8 01DC96A8 E401023C */  lui         $2, %hi(Wind__4)
/* 01D9AC 01DC96AC C0CC4424 */  addiu       $4, $2, %lo(Wind__4)
/* 01D9B0 01DC96B0 D4818CC7 */  lwc1        $f12, -0x7E2C($28)
/* 01D9B4 01DC96B4 2CED040C */  jal         SetVelocity__5CWindFf
/* 01D9B8 01DC96B8 00000000 */   nop
/* 01D9BC 01DC96BC 1B000010 */  b           .L01DC972C_2CEF2C
/* 01D9C0 01DC96C0 00000000 */   nop
/* 01D9C4 01DC96C4 E401023C */  lui         $2, %hi(Wind__4)
/* 01D9C8 01DC96C8 C0CC4424 */  addiu       $4, $2, %lo(Wind__4)
/* 01D9CC 01DC96CC D4818CC7 */  lwc1        $f12, -0x7E2C($28)
/* 01D9D0 01DC96D0 2CED040C */  jal         SetVelocity__5CWindFf
/* 01D9D4 01DC96D4 00000000 */   nop
/* 01D9D8 01DC96D8 14000010 */  b           .L01DC972C_2CEF2C
/* 01D9DC 01DC96DC 00000000 */   nop
/* 01D9E0 01DC96E0 E401023C */  lui         $2, %hi(Wind__4)
/* 01D9E4 01DC96E4 C0CC4424 */  addiu       $4, $2, %lo(Wind__4)
/* 01D9E8 01DC96E8 D4818CC7 */  lwc1        $f12, -0x7E2C($28)
/* 01D9EC 01DC96EC 2CED040C */  jal         SetVelocity__5CWindFf
/* 01D9F0 01DC96F0 00000000 */   nop
/* 01D9F4 01DC96F4 0D000010 */  b           .L01DC972C_2CEF2C
/* 01D9F8 01DC96F8 00000000 */   nop
/* 01D9FC 01DC96FC E401023C */  lui         $2, %hi(Wind__4)
/* 01DA00 01DC9700 C0CC4424 */  addiu       $4, $2, %lo(Wind__4)
/* 01DA04 01DC9704 D4818CC7 */  lwc1        $f12, -0x7E2C($28)
/* 01DA08 01DC9708 2CED040C */  jal         SetVelocity__5CWindFf
/* 01DA0C 01DC970C 00000000 */   nop
/* 01DA10 01DC9710 06000010 */  b           .L01DC972C_2CEF2C
/* 01DA14 01DC9714 00000000 */   nop
/* 01DA18 01DC9718 E401023C */  lui         $2, %hi(Wind__4)
/* 01DA1C 01DC971C C0CC4424 */  addiu       $4, $2, %lo(Wind__4)
/* 01DA20 01DC9720 7C808CC7 */  lwc1        $f12, -0x7F84($28)
/* 01DA24 01DC9724 2CED040C */  jal         SetVelocity__5CWindFf
/* 01DA28 01DC9728 00000000 */   nop
.L01DC972C_2CEF2C:
/* 01DA2C 01DC972C E301013C */  lui         $1, %hi(CScript + 0x18)
/* 01DA30 01DC9730 D8E9238C */  lw          $3, %lo(CScript + 0x18)($1)
/* 01DA34 01DC9734 07000224 */  addiu       $2, $0, 0x7
/* 01DA38 01DC9738 07006214 */  bne         $3, $2, .L01DC9758_2CEF58
/* 01DA3C 01DC973C 00000000 */   nop
/* 01DA40 01DC9740 E401023C */  lui         $2, %hi(Wind__4)
/* 01DA44 01DC9744 C0CC4224 */  addiu       $2, $2, %lo(Wind__4)
/* 01DA48 01DC9748 DF01013C */  lui         $1, %hi(Chara__3 + 0x1E48)
/* 01DA4C 01DC974C 281D22AC */  sw          $2, %lo(Chara__3 + 0x1E48)($1)
/* 01DA50 01DC9750 05000010 */  b           .L01DC9768_2CEF68
/* 01DA54 01DC9754 00000000 */   nop
.L01DC9758_2CEF58:
/* 01DA58 01DC9758 E401023C */  lui         $2, %hi(Wind__4)
/* 01DA5C 01DC975C C0CC4224 */  addiu       $2, $2, %lo(Wind__4)
/* 01DA60 01DC9760 DF01013C */  lui         $1, %hi(Chara__3 + 0xC98)
/* 01DA64 01DC9764 780B22AC */  sw          $2, %lo(Chara__3 + 0xC98)($1)
.L01DC9768_2CEF68:
/* 01DA68 01DC9768 E401023C */  lui         $2, %hi(Wind__4)
/* 01DA6C 01DC976C C0CC4424 */  addiu       $4, $2, %lo(Wind__4)
/* 01DA70 01DC9770 4CED040C */  jal         Step__5CWindFv
/* 01DA74 01DC9774 00000000 */   nop
/* 01DA78 01DC9778 DE01033C */  lui         $3, %hi(LIT_451__4)
/* 01DA7C 01DC977C 20B16624 */  addiu       $6, $3, %lo(LIT_451__4)
/* 01DA80 01DC9780 6000A527 */  addiu       $5, $29, 0x60
/* 01DA84 01DC9784 02000424 */  addiu       $4, $0, 0x2
.L01DC9788_2CEF88:
/* 01DA88 01DC9788 0000C378 */  lq          $3, 0x0($6)
/* 01DA8C 01DC978C 1000C624 */  addiu       $6, $6, 0x10
/* 01DA90 01DC9790 FFFF8424 */  addiu       $4, $4, -0x1
/* 01DA94 01DC9794 0000A37C */  sq          $3, 0x0($5)
/* 01DA98 01DC9798 1000A524 */  addiu       $5, $5, 0x10
/* 01DA9C 01DC979C FAFF801C */  bgtz        $4, .L01DC9788_2CEF88
/* 01DAA0 01DC97A0 00000000 */   nop
/* 01DAA4 01DC97A4 0000C3C4 */  lwc1        $f3, 0x0($6)
/* 01DAA8 01DC97A8 0000A3E4 */  swc1        $f3, 0x0($5)
/* 01DAAC 01DC97AC DE01033C */  lui         $3, %hi(LIT_461__3)
/* 01DAB0 01DC97B0 50B16624 */  addiu       $6, $3, %lo(LIT_461__3)
/* 01DAB4 01DC97B4 9000A527 */  addiu       $5, $29, 0x90
/* 01DAB8 01DC97B8 02000424 */  addiu       $4, $0, 0x2
.L01DC97BC_2CEFBC:
/* 01DABC 01DC97BC 0000C378 */  lq          $3, 0x0($6)
/* 01DAC0 01DC97C0 1000C624 */  addiu       $6, $6, 0x10
/* 01DAC4 01DC97C4 FFFF8424 */  addiu       $4, $4, -0x1
/* 01DAC8 01DC97C8 0000A37C */  sq          $3, 0x0($5)
/* 01DACC 01DC97CC 1000A524 */  addiu       $5, $5, 0x10
/* 01DAD0 01DC97D0 FAFF801C */  bgtz        $4, .L01DC97BC_2CEFBC
/* 01DAD4 01DC97D4 00000000 */   nop
/* 01DAD8 01DC97D8 0000C3C4 */  lwc1        $f3, 0x0($6)
/* 01DADC 01DC97DC 0000A3E4 */  swc1        $f3, 0x0($5)
/* 01DAE0 01DC97E0 288E0070 */  paddub      $17, $0, $0
/* 01DAE4 01DC97E4 73000010 */  b           .L01DC99B4_2CF1B4
/* 01DAE8 01DC97E8 00000000 */   nop
.L01DC97EC_2CEFEC:
/* 01DAEC 01DC97EC 40181100 */  sll         $3, $17, 1
/* 01DAF0 01DC97F0 21187100 */  addu        $3, $3, $17
/* 01DAF4 01DC97F4 80180300 */  sll         $3, $3, 2
/* 01DAF8 01DC97F8 21187100 */  addu        $3, $3, $17
/* 01DAFC 01DC97FC 80200300 */  sll         $4, $3, 2
/* 01DB00 01DC9800 E301033C */  lui         $3, %hi(CScript + 0x30)
/* 01DB04 01DC9804 F0E96324 */  addiu       $3, $3, %lo(CScript + 0x30)
/* 01DB08 01DC9808 21186400 */  addu        $3, $3, $4
/* 01DB0C 01DC980C 00006390 */  lbu         $3, 0x0($3)
/* 01DB10 01DC9810 67006010 */  beqz        $3, .L01DC99B0_2CF1B0
/* 01DB14 01DC9814 00000000 */   nop
/* 01DB18 01DC9818 E301013C */  lui         $1, %hi(CScript + 0x18)
/* 01DB1C 01DC981C D8E9228C */  lw          $2, %lo(CScript + 0x18)($1)
/* 01DB20 01DC9820 10004014 */  bnez        $2, .L01DC9864_2CF064
/* 01DB24 01DC9824 00000000 */   nop
/* 01DB28 01DC9828 C09B838F */  lw          $3, -0x6440($28)
/* 01DB2C 01DC982C B0110224 */  addiu       $2, $0, 0x11B0
/* 01DB30 01DC9830 18186200 */  mult        $3, $3, $2
/* 01DB34 01DC9834 E501023C */  lui         $2, %hi(Cam + 0xBC)
/* 01DB38 01DC9838 ACC44224 */  addiu       $2, $2, %lo(Cam + 0xBC)
/* 01DB3C 01DC983C 21184300 */  addu        $3, $2, $3
/* 01DB40 01DC9840 80101100 */  sll         $2, $17, 2
/* 01DB44 01DC9844 21105D00 */  addu        $2, $2, $29
/* 01DB48 01DC9848 0000648C */  lw          $4, 0x0($3)
/* 01DB4C 01DC984C 6000458C */  lw          $5, 0x60($2)
/* 01DB50 01DC9850 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01DB54 01DC9854 00000000 */   nop
/* 01DB58 01DC9858 28864070 */  paddub      $16, $2, $0
/* 01DB5C 01DC985C 0E000010 */  b           .L01DC9898_2CF098
/* 01DB60 01DC9860 00000000 */   nop
.L01DC9864_2CF064:
/* 01DB64 01DC9864 C09B838F */  lw          $3, -0x6440($28)
/* 01DB68 01DC9868 B0110224 */  addiu       $2, $0, 0x11B0
/* 01DB6C 01DC986C 18186200 */  mult        $3, $3, $2
/* 01DB70 01DC9870 E501023C */  lui         $2, %hi(Cam + 0xBC)
/* 01DB74 01DC9874 ACC44224 */  addiu       $2, $2, %lo(Cam + 0xBC)
/* 01DB78 01DC9878 21184300 */  addu        $3, $2, $3
/* 01DB7C 01DC987C 80101100 */  sll         $2, $17, 2
/* 01DB80 01DC9880 21105D00 */  addu        $2, $2, $29
/* 01DB84 01DC9884 0000648C */  lw          $4, 0x0($3)
/* 01DB88 01DC9888 9000458C */  lw          $5, 0x90($2)
/* 01DB8C 01DC988C C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01DB90 01DC9890 00000000 */   nop
/* 01DB94 01DC9894 28864070 */  paddub      $16, $2, $0
.L01DC9898_2CF098:
/* 01DB98 01DC9898 45000012 */  beqz        $16, .L01DC99B0_2CF1B0
/* 01DB9C 01DC989C 00000000 */   nop
/* 01DBA0 01DC98A0 E301013C */  lui         $1, %hi(CScript + 0x18)
/* 01DBA4 01DC98A4 D8E9228C */  lw          $2, %lo(CScript + 0x18)($1)
/* 01DBA8 01DC98A8 0B004010 */  beqz        $2, .L01DC98D8_2CF0D8
/* 01DBAC 01DC98AC 00000000 */   nop
/* 01DBB0 01DC98B0 E301013C */  lui         $1, %hi(CScript)
/* 01DBB4 01DC98B4 C0E9238C */  lw          $3, %lo(CScript)($1)
/* 01DBB8 01DC98B8 10000224 */  addiu       $2, $0, 0x10
/* 01DBBC 01DC98BC 06006210 */  beq         $3, $2, .L01DC98D8_2CF0D8
/* 01DBC0 01DC98C0 00000000 */   nop
/* 01DBC4 01DC98C4 11000224 */  addiu       $2, $0, 0x11
/* 01DBC8 01DC98C8 1F006214 */  bne         $3, $2, .L01DC9948_2CF148
/* 01DBCC 01DC98CC 00000000 */   nop
/* 01DBD0 01DC98D0 1D002016 */  bnez        $17, .L01DC9948_2CF148
/* 01DBD4 01DC98D4 00000000 */   nop
.L01DC98D8_2CF0D8:
/* 01DBD8 01DC98D8 00608044 */  mtc1        $0, $f12
/* 01DBDC 01DC98DC 00000000 */  nop
/* 01DBE0 01DC98E0 46630046 */  mov.s       $f13, $f12
/* 01DBE4 01DC98E4 86630046 */  mov.s       $f14, $f12
/* 01DBE8 01DC98E8 B0110224 */  addiu       $2, $0, 0x11B0
/* 01DBEC 01DC98EC 18902202 */  mult        $18, $17, $2
/* 01DBF0 01DC98F0 DF01023C */  lui         $2, %hi(Chara__3)
/* 01DBF4 01DC98F4 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 01DBF8 01DC98F8 21985200 */  addu        $19, $2, $18
/* 01DBFC 01DC98FC 28266072 */  paddub      $4, $19, $0
/* 01DC00 01DC9900 ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 01DC04 01DC9904 00000000 */   nop
/* 01DC08 01DC9908 00608044 */  mtc1        $0, $f12
/* 01DC0C 01DC990C 00000000 */  nop
/* 01DC10 01DC9910 46630046 */  mov.s       $f13, $f12
/* 01DC14 01DC9914 86630046 */  mov.s       $f14, $f12
/* 01DC18 01DC9918 28266072 */  paddub      $4, $19, $0
/* 01DC1C 01DC991C 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 01DC20 01DC9920 00000000 */   nop
/* 01DC24 01DC9924 DF01023C */  lui         $2, %hi(Chara__3 + 0xBC)
/* 01DC28 01DC9928 9CFF4224 */  addiu       $2, $2, %lo(Chara__3 + 0xBC)
/* 01DC2C 01DC992C 21105200 */  addu        $2, $2, $18
/* 01DC30 01DC9930 0000448C */  lw          $4, 0x0($2)
/* 01DC34 01DC9934 282E0072 */  paddub      $5, $16, $0
/* 01DC38 01DC9938 60A0040C */  jal         SetReference__6CFrameFP6CFrame
/* 01DC3C 01DC993C 00000000 */   nop
/* 01DC40 01DC9940 1B000010 */  b           .L01DC99B0_2CF1B0
/* 01DC44 01DC9944 00000000 */   nop
.L01DC9948_2CF148:
/* 01DC48 01DC9948 28260072 */  paddub      $4, $16, $0
/* 01DC4C 01DC994C C000A527 */  addiu       $5, $29, 0xC0
/* 01DC50 01DC9950 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 01DC54 01DC9954 00000000 */   nop
/* 01DC58 01DC9958 E000ACC7 */  lwc1        $f12, 0xE0($29)
/* 01DC5C 01DC995C E800ADC7 */  lwc1        $f13, 0xE8($29)
/* 01DC60 01DC9960 5077040C */  jal         atan2f
/* 01DC64 01DC9964 00000000 */   nop
/* 01DC68 01DC9968 B0110224 */  addiu       $2, $0, 0x11B0
/* 01DC6C 01DC996C 18182202 */  mult        $3, $17, $2
/* 01DC70 01DC9970 DF01023C */  lui         $2, %hi(Chara__3)
/* 01DC74 01DC9974 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 01DC78 01DC9978 21804300 */  addu        $16, $2, $3
/* 01DC7C 01DC997C 00608044 */  mtc1        $0, $f12
/* 01DC80 01DC9980 00000000 */  nop
/* 01DC84 01DC9984 86630046 */  mov.s       $f14, $f12
/* 01DC88 01DC9988 28260072 */  paddub      $4, $16, $0
/* 01DC8C 01DC998C 46030046 */  mov.s       $f13, $f0
/* 01DC90 01DC9990 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 01DC94 01DC9994 00000000 */   nop
/* 01DC98 01DC9998 F000ACC7 */  lwc1        $f12, 0xF0($29)
/* 01DC9C 01DC999C F400ADC7 */  lwc1        $f13, 0xF4($29)
/* 01DCA0 01DC99A0 F800AEC7 */  lwc1        $f14, 0xF8($29)
/* 01DCA4 01DC99A4 28260072 */  paddub      $4, $16, $0
/* 01DCA8 01DC99A8 ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 01DCAC 01DC99AC 00000000 */   nop
.L01DC99B0_2CF1B0:
/* 01DCB0 01DC99B0 01003126 */  addiu       $17, $17, 0x1
.L01DC99B4_2CF1B4:
/* 01DCB4 01DC99B4 0900232A */  slti        $3, $17, 0x9
/* 01DCB8 01DC99B8 8CFF6014 */  bnez        $3, .L01DC97EC_2CEFEC
/* 01DCBC 01DC99BC 00000000 */   nop
/* 01DCC0 01DC99C0 E301013C */  lui         $1, %hi(CScript + 0x18)
/* 01DCC4 01DC99C4 D8E9318C */  lw          $17, %lo(CScript + 0x18)($1)
/* 01DCC8 01DC99C8 01000324 */  addiu       $3, $0, 0x1
/* 01DCCC 01DC99CC 0A002312 */  beq         $17, $3, .L01DC99F8_2CF1F8
/* 01DCD0 01DC99D0 00000000 */   nop
/* 01DCD4 01DC99D4 03000324 */  addiu       $3, $0, 0x3
/* 01DCD8 01DC99D8 07002312 */  beq         $17, $3, .L01DC99F8_2CF1F8
/* 01DCDC 01DC99DC 00000000 */   nop
/* 01DCE0 01DC99E0 05000324 */  addiu       $3, $0, 0x5
/* 01DCE4 01DC99E4 04002312 */  beq         $17, $3, .L01DC99F8_2CF1F8
/* 01DCE8 01DC99E8 00000000 */   nop
/* 01DCEC 01DC99EC 07000324 */  addiu       $3, $0, 0x7
/* 01DCF0 01DC99F0 3B002316 */  bne         $17, $3, .L01DC9AE0_2CF2E0
/* 01DCF4 01DC99F4 00000000 */   nop
.L01DC99F8_2CF1F8:
/* 01DCF8 01DC99F8 07000224 */  addiu       $2, $0, 0x7
/* 01DCFC 01DC99FC 0A002212 */  beq         $17, $2, .L01DC9A28_2CF228
/* 01DD00 01DC9A00 00000000 */   nop
/* 01DD04 01DC9A04 DF01013C */  lui         $1, %hi(Chara__3 + 0xBC)
/* 01DD08 01DC9A08 9CFF248C */  lw          $4, %lo(Chara__3 + 0xBC)($1)
/* 01DD0C 01DC9A0C DE01023C */  lui         $2, %hi(LIT_569__4)
/* 01DD10 01DC9A10 F0FE4524 */  addiu       $5, $2, %lo(LIT_569__4)
/* 01DD14 01DC9A14 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01DD18 01DC9A18 00000000 */   nop
/* 01DD1C 01DC9A1C 28864070 */  paddub      $16, $2, $0
/* 01DD20 01DC9A20 08000010 */  b           .L01DC9A44_2CF244
/* 01DD24 01DC9A24 00000000 */   nop
.L01DC9A28_2CF228:
/* 01DD28 01DC9A28 DF01013C */  lui         $1, %hi(Chara__3 + 0x126C)
/* 01DD2C 01DC9A2C 4C11248C */  lw          $4, %lo(Chara__3 + 0x126C)($1)
/* 01DD30 01DC9A30 DE01023C */  lui         $2, %hi(LIT_569__4)
/* 01DD34 01DC9A34 F0FE4524 */  addiu       $5, $2, %lo(LIT_569__4)
/* 01DD38 01DC9A38 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01DD3C 01DC9A3C 00000000 */   nop
/* 01DD40 01DC9A40 28864070 */  paddub      $16, $2, $0
.L01DC9A44_2CF244:
/* 01DD44 01DC9A44 26000012 */  beqz        $16, .L01DC9AE0_2CF2E0
/* 01DD48 01DC9A48 00000000 */   nop
/* 01DD4C 01DC9A4C 28260072 */  paddub      $4, $16, $0
/* 01DD50 01DC9A50 C000A527 */  addiu       $5, $29, 0xC0
/* 01DD54 01DC9A54 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 01DD58 01DC9A58 00000000 */   nop
/* 01DD5C 01DC9A5C C000A427 */  addiu       $4, $29, 0xC0
/* 01DD60 01DC9A60 282E8070 */  paddub      $5, $4, $0
/* 01DD64 01DC9A64 9285040C */  jal         sceVu0Normalize
/* 01DD68 01DC9A68 00000000 */   nop
/* 01DD6C 01DC9A6C D000A427 */  addiu       $4, $29, 0xD0
/* 01DD70 01DC9A70 282E8070 */  paddub      $5, $4, $0
/* 01DD74 01DC9A74 9285040C */  jal         sceVu0Normalize
/* 01DD78 01DC9A78 00000000 */   nop
/* 01DD7C 01DC9A7C E000A427 */  addiu       $4, $29, 0xE0
/* 01DD80 01DC9A80 282E8070 */  paddub      $5, $4, $0
/* 01DD84 01DC9A84 9285040C */  jal         sceVu0Normalize
/* 01DD88 01DC9A88 00000000 */   nop
/* 01DD8C 01DC9A8C 00608044 */  mtc1        $0, $f12
/* 01DD90 01DC9A90 00000000 */  nop
/* 01DD94 01DC9A94 46630046 */  mov.s       $f13, $f12
/* 01DD98 01DC9A98 86630046 */  mov.s       $f14, $f12
/* 01DD9C 01DC9A9C E001023C */  lui         $2, %hi(MainMonstorUnit + 0x490)
/* 01DDA0 01DC9AA0 608C4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x490)
/* 01DDA4 01DC9AA4 ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 01DDA8 01DC9AA8 00000000 */   nop
/* 01DDAC 01DC9AAC 00608044 */  mtc1        $0, $f12
/* 01DDB0 01DC9AB0 00000000 */  nop
/* 01DDB4 01DC9AB4 46630046 */  mov.s       $f13, $f12
/* 01DDB8 01DC9AB8 86630046 */  mov.s       $f14, $f12
/* 01DDBC 01DC9ABC E001023C */  lui         $2, %hi(MainMonstorUnit + 0x490)
/* 01DDC0 01DC9AC0 608C4424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x490)
/* 01DDC4 01DC9AC4 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 01DDC8 01DC9AC8 00000000 */   nop
/* 01DDCC 01DC9ACC E001013C */  lui         $1, %hi(MainMonstorUnit + 0x54C)
/* 01DDD0 01DC9AD0 1C8D248C */  lw          $4, %lo(MainMonstorUnit + 0x54C)($1)
/* 01DDD4 01DC9AD4 C000A527 */  addiu       $5, $29, 0xC0
/* 01DDD8 01DC9AD8 58A1040C */  jal         SetTransMatrix__6CFrameFPA4_f
/* 01DDDC 01DC9ADC 00000000 */   nop
.L01DC9AE0_2CF2E0:
/* 01DDE0 01DC9AE0 01000524 */  addiu       $5, $0, 0x1
/* 01DDE4 01DC9AE4 82002516 */  bne         $17, $5, .L01DC9CF0_2CF4F0
/* 01DDE8 01DC9AE8 00000000 */   nop
/* 01DDEC 01DC9AEC E301013C */  lui         $1, %hi(CScript)
/* 01DDF0 01DC9AF0 C0E9248C */  lw          $4, %lo(CScript)($1)
/* 01DDF4 01DC9AF4 05000324 */  addiu       $3, $0, 0x5
/* 01DDF8 01DC9AF8 03008314 */  bne         $4, $3, .L01DC9B08_2CF308
/* 01DDFC 01DC9AFC 00000000 */   nop
/* 01DE00 01DC9B00 E301013C */  lui         $1, %hi(CScript + 0x19C)
/* 01DE04 01DC9B04 5CEB25A0 */  sb          $5, %lo(CScript + 0x19C)($1)
.L01DC9B08_2CF308:
/* 01DE08 01DC9B08 E301013C */  lui         $1, %hi(CScript + 0x19C)
/* 01DE0C 01DC9B0C 5CEB2390 */  lbu         $3, %lo(CScript + 0x19C)($1)
/* 01DE10 01DC9B10 77006010 */  beqz        $3, .L01DC9CF0_2CF4F0
/* 01DE14 01DC9B14 00000000 */   nop
/* 01DE18 01DC9B18 DF01013C */  lui         $1, %hi(Chara__3 + 0xBC)
/* 01DE1C 01DC9B1C 9CFF248C */  lw          $4, %lo(Chara__3 + 0xBC)($1)
/* 01DE20 01DC9B20 DE01023C */  lui         $2, %hi(LIT_570__3)
/* 01DE24 01DC9B24 F8FE4524 */  addiu       $5, $2, %lo(LIT_570__3)
/* 01DE28 01DC9B28 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01DE2C 01DC9B2C 00000000 */   nop
/* 01DE30 01DC9B30 28864070 */  paddub      $16, $2, $0
/* 01DE34 01DC9B34 26000012 */  beqz        $16, .L01DC9BD0_2CF3D0
/* 01DE38 01DC9B38 00000000 */   nop
/* 01DE3C 01DC9B3C 28260072 */  paddub      $4, $16, $0
/* 01DE40 01DC9B40 C000A527 */  addiu       $5, $29, 0xC0
/* 01DE44 01DC9B44 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 01DE48 01DC9B48 00000000 */   nop
/* 01DE4C 01DC9B4C C000A427 */  addiu       $4, $29, 0xC0
/* 01DE50 01DC9B50 282E8070 */  paddub      $5, $4, $0
/* 01DE54 01DC9B54 9285040C */  jal         sceVu0Normalize
/* 01DE58 01DC9B58 00000000 */   nop
/* 01DE5C 01DC9B5C D000A427 */  addiu       $4, $29, 0xD0
/* 01DE60 01DC9B60 282E8070 */  paddub      $5, $4, $0
/* 01DE64 01DC9B64 9285040C */  jal         sceVu0Normalize
/* 01DE68 01DC9B68 00000000 */   nop
/* 01DE6C 01DC9B6C E000A427 */  addiu       $4, $29, 0xE0
/* 01DE70 01DC9B70 282E8070 */  paddub      $5, $4, $0
/* 01DE74 01DC9B74 9285040C */  jal         sceVu0Normalize
/* 01DE78 01DC9B78 00000000 */   nop
/* 01DE7C 01DC9B7C 00608044 */  mtc1        $0, $f12
/* 01DE80 01DC9B80 00000000 */  nop
/* 01DE84 01DC9B84 86630046 */  mov.s       $f14, $f12
/* 01DE88 01DC9B88 46630046 */  mov.s       $f13, $f12
/* 01DE8C 01DC9B8C DF01023C */  lui         $2, %hi(UraEventMan + 0x1C00)
/* 01DE90 01DC9B90 B07A4424 */  addiu       $4, $2, %lo(UraEventMan + 0x1C00)
/* 01DE94 01DC9B94 ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 01DE98 01DC9B98 00000000 */   nop
/* 01DE9C 01DC9B9C 00608044 */  mtc1        $0, $f12
/* 01DEA0 01DC9BA0 00000000 */  nop
/* 01DEA4 01DC9BA4 46630046 */  mov.s       $f13, $f12
/* 01DEA8 01DC9BA8 86630046 */  mov.s       $f14, $f12
/* 01DEAC 01DC9BAC DF01023C */  lui         $2, %hi(UraEventMan + 0x1C00)
/* 01DEB0 01DC9BB0 B07A4424 */  addiu       $4, $2, %lo(UraEventMan + 0x1C00)
/* 01DEB4 01DC9BB4 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 01DEB8 01DC9BB8 00000000 */   nop
/* 01DEBC 01DC9BBC DF01013C */  lui         $1, %hi(UraEventMan + 0x1CBC)
/* 01DEC0 01DC9BC0 6C7B248C */  lw          $4, %lo(UraEventMan + 0x1CBC)($1)
/* 01DEC4 01DC9BC4 C000A527 */  addiu       $5, $29, 0xC0
/* 01DEC8 01DC9BC8 58A1040C */  jal         SetTransMatrix__6CFrameFPA4_f
/* 01DECC 01DC9BCC 00000000 */   nop
.L01DC9BD0_2CF3D0:
/* 01DED0 01DC9BD0 E09B8283 */  lb          $2, -0x6420($28)
/* 01DED4 01DC9BD4 04004014 */  bnez        $2, .L01DC9BE8_2CF3E8
/* 01DED8 01DC9BD8 00000000 */   nop
/* 01DEDC 01DC9BDC DC9B80AF */  sw          $0, -0x6424($28)
/* 01DEE0 01DC9BE0 01000224 */  addiu       $2, $0, 0x1
/* 01DEE4 01DC9BE4 E09B82A3 */  sb          $2, -0x6420($28)
.L01DC9BE8_2CF3E8:
/* 01DEE8 01DC9BE8 C09B838F */  lw          $3, -0x6440($28)
/* 01DEEC 01DC9BEC B0110224 */  addiu       $2, $0, 0x11B0
/* 01DEF0 01DC9BF0 18186200 */  mult        $3, $3, $2
/* 01DEF4 01DC9BF4 E501023C */  lui         $2, %hi(Cam + 0x2F0)
/* 01DEF8 01DC9BF8 E0C64224 */  addiu       $2, $2, %lo(Cam + 0x2F0)
/* 01DEFC 01DC9BFC 21104300 */  addu        $2, $2, $3
/* 01DF00 01DC9C00 00004CC4 */  lwc1        $f12, 0x0($2)
/* 01DF04 01DC9C04 2C44040C */  jal         fptosi
/* 01DF08 01DC9C08 00000000 */   nop
/* 01DF0C 01DC9C0C DC9B848F */  lw          $4, -0x6424($28)
/* 01DF10 01DC9C10 1A008210 */  beq         $4, $2, .L01DC9C7C_2CF47C
/* 01DF14 01DC9C14 00000000 */   nop
/* 01DF18 01DC9C18 0C000324 */  addiu       $3, $0, 0xC
/* 01DF1C 01DC9C1C 0A004310 */  beq         $2, $3, .L01DC9C48_2CF448
/* 01DF20 01DC9C20 00000000 */   nop
/* 01DF24 01DC9C24 11000324 */  addiu       $3, $0, 0x11
/* 01DF28 01DC9C28 07004310 */  beq         $2, $3, .L01DC9C48_2CF448
/* 01DF2C 01DC9C2C 00000000 */   nop
/* 01DF30 01DC9C30 34000324 */  addiu       $3, $0, 0x34
/* 01DF34 01DC9C34 04004310 */  beq         $2, $3, .L01DC9C48_2CF448
/* 01DF38 01DC9C38 00000000 */   nop
/* 01DF3C 01DC9C3C 6F000324 */  addiu       $3, $0, 0x6F
/* 01DF40 01DC9C40 0E004314 */  bne         $2, $3, .L01DC9C7C_2CF47C
/* 01DF44 01DC9C44 00000000 */   nop
.L01DC9C48_2CF448:
/* 01DF48 01DC9C48 E301013C */  lui         $1, %hi(CScript + 0x1A0)
/* 01DF4C 01DC9C4C 60EB20AC */  sw          $0, %lo(CScript + 0x1A0)($1)
/* 01DF50 01DC9C50 E001013C */  lui         $1, %hi(main_lightcolor + 0x28)
/* 01DF54 01DC9C54 188720AC */  sw          $0, %lo(main_lightcolor + 0x28)($1)
/* 01DF58 01DC9C58 04000324 */  addiu       $3, $0, 0x4
/* 01DF5C 01DC9C5C E001013C */  lui         $1, %hi(main_lightcolor + 0x24)
/* 01DF60 01DC9C60 148723AC */  sw          $3, %lo(main_lightcolor + 0x24)($1)
/* 01DF64 01DC9C64 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 01DF68 01DC9C68 E001013C */  lui         $1, %hi(main_lightcolor + 0x20)
/* 01DF6C 01DC9C6C 108723AC */  sw          $3, %lo(main_lightcolor + 0x20)($1)
/* 01DF70 01DC9C70 DC9B82AF */  sw          $2, -0x6424($28)
/* 01DF74 01DC9C74 1E000010 */  b           .L01DC9CF0_2CF4F0
/* 01DF78 01DC9C78 00000000 */   nop
.L01DC9C7C_2CF47C:
/* 01DF7C 01DC9C7C 12008210 */  beq         $4, $2, .L01DC9CC8_2CF4C8
/* 01DF80 01DC9C80 00000000 */   nop
/* 01DF84 01DC9C84 77000324 */  addiu       $3, $0, 0x77
/* 01DF88 01DC9C88 0F004314 */  bne         $2, $3, .L01DC9CC8_2CF4C8
/* 01DF8C 01DC9C8C 00000000 */   nop
/* 01DF90 01DC9C90 01000324 */  addiu       $3, $0, 0x1
/* 01DF94 01DC9C94 E301013C */  lui         $1, %hi(CScript + 0x1A0)
/* 01DF98 01DC9C98 60EB23AC */  sw          $3, %lo(CScript + 0x1A0)($1)
/* 01DF9C 01DC9C9C E001013C */  lui         $1, %hi(main_lightcolor + 0x28)
/* 01DFA0 01DC9CA0 188723AC */  sw          $3, %lo(main_lightcolor + 0x28)($1)
/* 01DFA4 01DC9CA4 04000324 */  addiu       $3, $0, 0x4
/* 01DFA8 01DC9CA8 E001013C */  lui         $1, %hi(main_lightcolor + 0x24)
/* 01DFAC 01DC9CAC 148723AC */  sw          $3, %lo(main_lightcolor + 0x24)($1)
/* 01DFB0 01DC9CB0 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 01DFB4 01DC9CB4 E001013C */  lui         $1, %hi(main_lightcolor + 0x20)
/* 01DFB8 01DC9CB8 108723AC */  sw          $3, %lo(main_lightcolor + 0x20)($1)
/* 01DFBC 01DC9CBC DC9B82AF */  sw          $2, -0x6424($28)
/* 01DFC0 01DC9CC0 0B000010 */  b           .L01DC9CF0_2CF4F0
/* 01DFC4 01DC9CC4 00000000 */   nop
.L01DC9CC8_2CF4C8:
/* 01DFC8 01DC9CC8 E301013C */  lui         $1, %hi(CScript + 0x1A0)
/* 01DFCC 01DC9CCC 60EB238C */  lw          $3, %lo(CScript + 0x1A0)($1)
/* 01DFD0 01DC9CD0 E001013C */  lui         $1, %hi(main_lightcolor + 0x28)
/* 01DFD4 01DC9CD4 188723AC */  sw          $3, %lo(main_lightcolor + 0x28)($1)
/* 01DFD8 01DC9CD8 02000324 */  addiu       $3, $0, 0x2
/* 01DFDC 01DC9CDC E001013C */  lui         $1, %hi(main_lightcolor + 0x24)
/* 01DFE0 01DC9CE0 148723AC */  sw          $3, %lo(main_lightcolor + 0x24)($1)
/* 01DFE4 01DC9CE4 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 01DFE8 01DC9CE8 E001013C */  lui         $1, %hi(main_lightcolor + 0x20)
/* 01DFEC 01DC9CEC 108723AC */  sw          $3, %lo(main_lightcolor + 0x20)($1)
.L01DC9CF0_2CF4F0:
/* 01DFF0 01DC9CF0 E89B8383 */  lb          $3, -0x6418($28)
/* 01DFF4 01DC9CF4 04006014 */  bnez        $3, .L01DC9D08_2CF508
/* 01DFF8 01DC9CF8 00000000 */   nop
/* 01DFFC 01DC9CFC E49B80AF */  sw          $0, -0x641C($28)
/* 01E000 01DC9D00 01000324 */  addiu       $3, $0, 0x1
/* 01E004 01DC9D04 E89B83A3 */  sb          $3, -0x6418($28)
.L01DC9D08_2CF508:
/* 01E008 01DC9D08 E301013C */  lui         $1, %hi(CScript)
/* 01E00C 01DC9D0C C0E9248C */  lw          $4, %lo(CScript)($1)
/* 01E010 01DC9D10 13000324 */  addiu       $3, $0, 0x13
/* 01E014 01DC9D14 4D008314 */  bne         $4, $3, .L01DC9E4C_2CF64C
/* 01E018 01DC9D18 00000000 */   nop
/* 01E01C 01DC9D1C E49B838F */  lw          $3, -0x641C($28)
/* 01E020 01DC9D20 1A006014 */  bnez        $3, .L01DC9D8C_2CF58C
/* 01E024 01DC9D24 00000000 */   nop
/* 01E028 01DC9D28 DF01023C */  lui         $2, %hi(Chara__3 + 0x2360)
/* 01E02C 01DC9D2C 40224424 */  addiu       $4, $2, %lo(Chara__3 + 0x2360)
/* 01E030 01DC9D30 D8818CC7 */  lwc1        $f12, -0x7E28($28)
/* 01E034 01DC9D34 DC818DC7 */  lwc1        $f13, -0x7E24($28)
/* 01E038 01DC9D38 E0818EC7 */  lwc1        $f14, -0x7E20($28)
/* 01E03C 01DC9D3C ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 01E040 01DC9D40 00000000 */   nop
/* 01E044 01DC9D44 00608044 */  mtc1        $0, $f12
/* 01E048 01DC9D48 00000000 */  nop
/* 01E04C 01DC9D4C 86630046 */  mov.s       $f14, $f12
/* 01E050 01DC9D50 DF01023C */  lui         $2, %hi(Chara__3 + 0x2360)
/* 01E054 01DC9D54 40224424 */  addiu       $4, $2, %lo(Chara__3 + 0x2360)
/* 01E058 01DC9D58 E4818DC7 */  lwc1        $f13, -0x7E1C($28)
/* 01E05C 01DC9D5C 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 01E060 01DC9D60 00000000 */   nop
/* 01E064 01DC9D64 DF01013C */  lui         $1, %hi(Chara__3 + 0x2FC8)
/* 01E068 01DC9D68 A82E20AC */  sw          $0, %lo(Chara__3 + 0x2FC8)($1)
/* 01E06C 01DC9D6C DF01013C */  lui         $1, %hi(Chara__3 + 0x2FC4)
/* 01E070 01DC9D70 A42E20AC */  sw          $0, %lo(Chara__3 + 0x2FC4)($1)
/* 01E074 01DC9D74 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 01E078 01DC9D78 DF01013C */  lui         $1, %hi(Chara__3 + 0x2FC0)
/* 01E07C 01DC9D7C A02E23AC */  sw          $3, %lo(Chara__3 + 0x2FC0)($1)
/* 01E080 01DC9D80 0040033C */  lui         $3, (0x40000000 >> 16)
/* 01E084 01DC9D84 DF01013C */  lui         $1, %hi(Chara__3 + 0x2650)
/* 01E088 01DC9D88 302523AC */  sw          $3, %lo(Chara__3 + 0x2650)($1)
.L01DC9D8C_2CF58C:
/* 01E08C 01DC9D8C E49B848F */  lw          $4, -0x641C($28)
/* 01E090 01DC9D90 4A010324 */  addiu       $3, $0, 0x14A
/* 01E094 01DC9D94 1C008314 */  bne         $4, $3, .L01DC9E08_2CF608
/* 01E098 01DC9D98 00000000 */   nop
/* 01E09C 01DC9D9C DF01023C */  lui         $2, %hi(Chara__3 + 0x2360)
/* 01E0A0 01DC9DA0 40224424 */  addiu       $4, $2, %lo(Chara__3 + 0x2360)
/* 01E0A4 01DC9DA4 D8818CC7 */  lwc1        $f12, -0x7E28($28)
/* 01E0A8 01DC9DA8 DC818DC7 */  lwc1        $f13, -0x7E24($28)
/* 01E0AC 01DC9DAC E0818EC7 */  lwc1        $f14, -0x7E20($28)
/* 01E0B0 01DC9DB0 ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 01E0B4 01DC9DB4 00000000 */   nop
/* 01E0B8 01DC9DB8 00608044 */  mtc1        $0, $f12
/* 01E0BC 01DC9DBC 00000000 */  nop
/* 01E0C0 01DC9DC0 86630046 */  mov.s       $f14, $f12
/* 01E0C4 01DC9DC4 DF01023C */  lui         $2, %hi(Chara__3 + 0x2360)
/* 01E0C8 01DC9DC8 40224424 */  addiu       $4, $2, %lo(Chara__3 + 0x2360)
/* 01E0CC 01DC9DCC E4818DC7 */  lwc1        $f13, -0x7E1C($28)
/* 01E0D0 01DC9DD0 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 01E0D4 01DC9DD4 00000000 */   nop
/* 01E0D8 01DC9DD8 01000324 */  addiu       $3, $0, 0x1
/* 01E0DC 01DC9DDC DF01013C */  lui         $1, %hi(Chara__3 + 0x2FC8)
/* 01E0E0 01DC9DE0 A82E23AC */  sw          $3, %lo(Chara__3 + 0x2FC8)($1)
/* 01E0E4 01DC9DE4 04000324 */  addiu       $3, $0, 0x4
/* 01E0E8 01DC9DE8 DF01013C */  lui         $1, %hi(Chara__3 + 0x2FC4)
/* 01E0EC 01DC9DEC A42E23AC */  sw          $3, %lo(Chara__3 + 0x2FC4)($1)
/* 01E0F0 01DC9DF0 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 01E0F4 01DC9DF4 DF01013C */  lui         $1, %hi(Chara__3 + 0x2FC0)
/* 01E0F8 01DC9DF8 A02E23AC */  sw          $3, %lo(Chara__3 + 0x2FC0)($1)
/* 01E0FC 01DC9DFC 0040033C */  lui         $3, (0x40000000 >> 16)
/* 01E100 01DC9E00 DF01013C */  lui         $1, %hi(Chara__3 + 0x2650)
/* 01E104 01DC9E04 302523AC */  sw          $3, %lo(Chara__3 + 0x2650)($1)
.L01DC9E08_2CF608:
/* 01E108 01DC9E08 E49B848F */  lw          $4, -0x641C($28)
/* 01E10C 01DC9E0C 4B010324 */  addiu       $3, $0, 0x14B
/* 01E110 01DC9E10 09008314 */  bne         $4, $3, .L01DC9E38_2CF638
/* 01E114 01DC9E14 00000000 */   nop
/* 01E118 01DC9E18 01000324 */  addiu       $3, $0, 0x1
/* 01E11C 01DC9E1C DF01013C */  lui         $1, %hi(Chara__3 + 0x2FC8)
/* 01E120 01DC9E20 A82E23AC */  sw          $3, %lo(Chara__3 + 0x2FC8)($1)
/* 01E124 01DC9E24 DF01013C */  lui         $1, %hi(Chara__3 + 0x2FC4)
/* 01E128 01DC9E28 A42E20AC */  sw          $0, %lo(Chara__3 + 0x2FC4)($1)
/* 01E12C 01DC9E2C 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 01E130 01DC9E30 DF01013C */  lui         $1, %hi(Chara__3 + 0x2FC0)
/* 01E134 01DC9E34 A02E23AC */  sw          $3, %lo(Chara__3 + 0x2FC0)($1)
.L01DC9E38_2CF638:
/* 01E138 01DC9E38 E49B838F */  lw          $3, -0x641C($28)
/* 01E13C 01DC9E3C 01006324 */  addiu       $3, $3, 0x1
/* 01E140 01DC9E40 E49B83AF */  sw          $3, -0x641C($28)
/* 01E144 01DC9E44 02000010 */  b           .L01DC9E50_2CF650
/* 01E148 01DC9E48 00000000 */   nop
.L01DC9E4C_2CF64C:
/* 01E14C 01DC9E4C E49B80AF */  sw          $0, -0x641C($28)
.L01DC9E50_2CF650:
/* 01E150 01DC9E50 4000BF7B */  lq          $31, 0x40($29)
/* 01E154 01DC9E54 3000B37B */  lq          $19, 0x30($29)
/* 01E158 01DC9E58 2000B27B */  lq          $18, 0x20($29)
/* 01E15C 01DC9E5C 1000B17B */  lq          $17, 0x10($29)
/* 01E160 01DC9E60 0000B07B */  lq          $16, 0x0($29)
/* 01E164 01DC9E64 0001BD27 */  addiu       $29, $29, 0x100
/* 01E168 01DC9E68 0800E003 */  jr          $31
/* 01E16C 01DC9E6C 00000000 */   nop
