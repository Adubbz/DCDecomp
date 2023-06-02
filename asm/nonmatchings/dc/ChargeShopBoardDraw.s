.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ChargeShopBoardDraw__Fiii
/* EB040 001EAF40 F0FDBD27 */  addiu      $sp, $sp, -0x210
/* EB044 001EAF44 9000BF7F */  sq         $31, 0x90($sp)
/* EB048 001EAF48 8000BE7F */  sq         $fp, 0x80($sp)
/* EB04C 001EAF4C 7000B77F */  sq         $23, 0x70($sp)
/* EB050 001EAF50 6000B67F */  sq         $22, 0x60($sp)
/* EB054 001EAF54 5000B57F */  sq         $21, 0x50($sp)
/* EB058 001EAF58 4000B47F */  sq         $20, 0x40($sp)
/* EB05C 001EAF5C 3000B37F */  sq         $19, 0x30($sp)
/* EB060 001EAF60 2000B27F */  sq         $18, 0x20($sp)
/* EB064 001EAF64 1000B17F */  sq         $17, 0x10($sp)
/* EB068 001EAF68 0000B07F */  sq         $16, 0x0($sp)
/* EB06C 001EAF6C 28AE8070 */  paddub     $21, $4, $0
/* EB070 001EAF70 28A6A070 */  paddub     $20, $5, $0
/* EB074 001EAF74 289EC070 */  paddub     $19, $6, $0
/* EB078 001EAF78 09009E26 */  addiu      $fp, $20, 0x9
/* EB07C 001EAF7C A9009726 */  addiu      $23, $20, 0xA9
/* EB080 001EAF80 1400B626 */  addiu      $22, $21, 0x14
/* EB084 001EAF84 06008626 */  addiu      $6, $20, 0x6
/* EB088 001EAF88 D901013C */  lui        $at, (0x1D90246 >> 16)
/* EB08C 001EAF8C 46022390 */  lbu        $3, (0x1D90246 & 0xFFFF)($at)
/* EB090 001EAF90 80100300 */  sll        $2, $3, 2
/* EB094 001EAF94 21104300 */  addu       $2, $2, $3
/* EB098 001EAF98 C0100200 */  sll        $2, $2, 3
/* EB09C 001EAF9C 2380C200 */  subu       $16, $6, $2
/* EB0A0 001EAFA0 00009044 */  mtc1       $16, $f0
/* EB0A4 001EAFA4 00000000 */  nop
/* EB0A8 001EAFA8 20008046 */  cvt.s.w    $f0, $f0
/* EB0AC 001EAFAC D901013C */  lui        $at, (0x1D9023C >> 16)
/* EB0B0 001EAFB0 3C0222C4 */  lwc1       $f2, (0x1D9023C & 0xFFFF)($at)
/* EB0B4 001EAFB4 41000246 */  sub.s      $f1, $f0, $f2
/* EB0B8 001EAFB8 8040023C */  lui        $2, (0x40800000 >> 16)
/* EB0BC 001EAFBC 00008244 */  mtc1       $2, $f0
/* EB0C0 001EAFC0 00000000 */  nop
/* EB0C4 001EAFC4 03080046 */  div.s      $f0, $f1, $f0
/* EB0C8 001EAFC8 00130046 */  add.s      $f12, $f2, $f0
/* EB0CC 001EAFCC D901013C */  lui        $at, (0x1D9023C >> 16)
/* EB0D0 001EAFD0 3C022CE4 */  swc1       $f12, (0x1D9023C & 0xFFFF)($at)
/* EB0D4 001EAFD4 2C44040C */  jal        fptosi
/* EB0D8 001EAFD8 00000000 */   nop
/* EB0DC 001EAFDC 28864070 */  paddub     $16, $2, $0
/* EB0E0 001EAFE0 28260070 */  paddub     $4, $0, $0
/* EB0E4 001EAFE4 64000524 */  addiu      $5, $0, 0x64
/* EB0E8 001EAFE8 2836C072 */  paddub     $6, $22, $0
/* EB0EC 001EAFEC 283E0072 */  paddub     $7, $16, $0
/* EB0F0 001EAFF0 2846C073 */  paddub     $8, $fp, $0
/* EB0F4 001EAFF4 284EE072 */  paddub     $9, $23, $0
/* EB0F8 001EAFF8 88948A8F */  lw         $10, -0x6B78($gp)
/* EB0FC 001EAFFC 285E6072 */  paddub     $11, $19, $0
/* EB100 001EB000 70C3080C */  jal        DrawPerBoardDraw__FiiiiiiP8CTexturei
/* EB104 001EB004 00000000 */   nop
/* EB108 001EB008 D901013C */  lui        $at, (0x1D900DC >> 16)
/* EB10C 001EB00C DC00318C */  lw         $17, (0x1D900DC & 0xFFFF)($at)
/* EB110 001EB010 02000224 */  addiu      $2, $0, 0x2
/* EB114 001EB014 2D002212 */  beq        $17, $2, .L001EB0CC
/* EB118 001EB018 00000000 */   nop
/* EB11C 001EB01C 1A002012 */  beqz       $17, .L001EB088
/* EB120 001EB020 00000000 */   nop
/* EB124 001EB024 01000224 */  addiu      $2, $0, 0x1
/* EB128 001EB028 03002212 */  beq        $17, $2, .L001EB038
/* EB12C 001EB02C 00000000 */   nop
/* EB130 001EB030 57000010 */  b          .L001EB190
/* EB134 001EB034 00000000 */   nop
.L001EB038:
/* EB138 001EB038 28960070 */  paddub     $18, $0, $0
/* EB13C 001EB03C 0D000010 */  b          .L001EB074
/* EB140 001EB040 00000000 */   nop
.L001EB044:
/* EB144 001EB044 8C94838F */  lw         $3, -0x6B74($gp)
/* EB148 001EB048 40111200 */  sll        $2, $18, 5
/* EB14C 001EB04C 23105200 */  subu       $2, $2, $18
/* EB150 001EB050 C0100200 */  sll        $2, $2, 3
/* EB154 001EB054 21104300 */  addu       $2, $2, $3
/* EB158 001EB058 F0004384 */  lh         $3, 0xF0($2)
/* EB15C 001EB05C 40101200 */  sll        $2, $18, 1
/* EB160 001EB060 21105D00 */  addu       $2, $2, $sp
/* EB164 001EB064 A00043A4 */  sh         $3, 0xA0($2)
/* EB168 001EB068 21105D02 */  addu       $2, $18, $sp
/* EB16C 001EB06C 900140A0 */  sb         $0, 0x190($2)
/* EB170 001EB070 01005226 */  addiu      $18, $18, 0x1
.L001EB074:
/* EB174 001EB074 1E00422A */  slti       $2, $18, 0x1E
/* EB178 001EB078 F2FF4014 */  bnez       $2, .L001EB044
/* EB17C 001EB07C 00000000 */   nop
/* EB180 001EB080 43000010 */  b          .L001EB190
/* EB184 001EB084 00000000 */   nop
.L001EB088:
/* EB188 001EB088 28960070 */  paddub     $18, $0, $0
/* EB18C 001EB08C 0A000010 */  b          .L001EB0B8
/* EB190 001EB090 00000000 */   nop
.L001EB094:
/* EB194 001EB094 40201200 */  sll        $4, $18, 1
/* EB198 001EB098 8C94828F */  lw         $2, -0x6B74($gp)
/* EB19C 001EB09C 21104400 */  addu       $2, $2, $4
/* EB1A0 001EB0A0 00004384 */  lh         $3, 0x0($2)
/* EB1A4 001EB0A4 21109D00 */  addu       $2, $4, $sp
/* EB1A8 001EB0A8 A00043A4 */  sh         $3, 0xA0($2)
/* EB1AC 001EB0AC 21105D02 */  addu       $2, $18, $sp
/* EB1B0 001EB0B0 900140A0 */  sb         $0, 0x190($2)
/* EB1B4 001EB0B4 01005226 */  addiu      $18, $18, 0x1
.L001EB0B8:
/* EB1B8 001EB0B8 3C00422A */  slti       $2, $18, 0x3C
/* EB1BC 001EB0BC F5FF4014 */  bnez       $2, .L001EB094
/* EB1C0 001EB0C0 00000000 */   nop
/* EB1C4 001EB0C4 32000010 */  b          .L001EB190
/* EB1C8 001EB0C8 00000000 */   nop
.L001EB0CC:
/* EB1CC 001EB0CC 28960070 */  paddub     $18, $0, $0
/* EB1D0 001EB0D0 23000010 */  b          .L001EB160
/* EB1D4 001EB0D4 00000000 */   nop
.L001EB0D8:
/* EB1D8 001EB0D8 8C94868F */  lw         $6, -0x6B74($gp)
/* EB1DC 001EB0DC 40291200 */  sll        $5, $18, 5
/* EB1E0 001EB0E0 2120A600 */  addu       $4, $5, $6
/* EB1E4 001EB0E4 001E8384 */  lh         $3, 0x1E00($4)
/* EB1E8 001EB0E8 40101200 */  sll        $2, $18, 1
/* EB1EC 001EB0EC 21105D00 */  addu       $2, $2, $sp
/* EB1F0 001EB0F0 A0004224 */  addiu      $2, $2, 0xA0
/* EB1F4 001EB0F4 000043A4 */  sh         $3, 0x0($2)
/* EB1F8 001EB0F8 00004384 */  lh         $3, 0x0($2)
/* EB1FC 001EB0FC 5B006228 */  slti       $2, $3, 0x5B
/* EB200 001EB100 0B004014 */  bnez       $2, .L001EB130
/* EB204 001EB104 00000000 */   nop
/* EB208 001EB108 5F006128 */  slti       $at, $3, 0x5F
/* EB20C 001EB10C 08002010 */  beqz       $at, .L001EB130
/* EB210 001EB110 00000000 */   nop
/* EB214 001EB114 40100300 */  sll        $2, $3, 1
/* EB218 001EB118 21104400 */  addu       $2, $2, $4
/* EB21C 001EB11C 521D4390 */  lbu        $3, 0x1D52($2)
/* EB220 001EB120 21105D02 */  addu       $2, $18, $sp
/* EB224 001EB124 900143A0 */  sb         $3, 0x190($2)
/* EB228 001EB128 0C000010 */  b          .L001EB15C
/* EB22C 001EB12C 00000000 */   nop
.L001EB130:
/* EB230 001EB130 5A000224 */  addiu      $2, $0, 0x5A
/* EB234 001EB134 07006214 */  bne        $3, $2, .L001EB154
/* EB238 001EB138 00000000 */   nop
/* EB23C 001EB13C 2110A600 */  addu       $2, $5, $6
/* EB240 001EB140 021E4390 */  lbu        $3, 0x1E02($2)
/* EB244 001EB144 21105D02 */  addu       $2, $18, $sp
/* EB248 001EB148 900143A0 */  sb         $3, 0x190($2)
/* EB24C 001EB14C 03000010 */  b          .L001EB15C
/* EB250 001EB150 00000000 */   nop
.L001EB154:
/* EB254 001EB154 21105D02 */  addu       $2, $18, $sp
/* EB258 001EB158 900140A0 */  sb         $0, 0x190($2)
.L001EB15C:
/* EB25C 001EB15C 01005226 */  addiu      $18, $18, 0x1
.L001EB160:
/* EB260 001EB160 1E00422A */  slti       $2, $18, 0x1E
/* EB264 001EB164 DCFF4014 */  bnez       $2, .L001EB0D8
/* EB268 001EB168 00000000 */   nop
/* EB26C 001EB16C 08000010 */  b          .L001EB190
/* EB270 001EB170 00000000 */   nop
.L001EB174:
/* EB274 001EB174 FFFF0324 */  addiu      $3, $0, -0x1
/* EB278 001EB178 40101200 */  sll        $2, $18, 1
/* EB27C 001EB17C 21105D00 */  addu       $2, $2, $sp
/* EB280 001EB180 A00043A4 */  sh         $3, 0xA0($2)
/* EB284 001EB184 21105D02 */  addu       $2, $18, $sp
/* EB288 001EB188 900140A0 */  sb         $0, 0x190($2)
/* EB28C 001EB18C 01005226 */  addiu      $18, $18, 0x1
.L001EB190:
/* EB290 001EB190 3C00422A */  slti       $2, $18, 0x3C
/* EB294 001EB194 F7FF4014 */  bnez       $2, .L001EB174
/* EB298 001EB198 00000000 */   nop
/* EB29C 001EB19C 0400C726 */  addiu      $7, $22, 0x4
/* EB2A0 001EB1A0 06000826 */  addiu      $8, $16, 0x6
/* EB2A4 001EB1A4 A000A427 */  addiu      $4, $sp, 0xA0
/* EB2A8 001EB1A8 9001A527 */  addiu      $5, $sp, 0x190
/* EB2AC 001EB1AC 80000624 */  addiu      $6, $0, 0x80
/* EB2B0 001EB1B0 284EC073 */  paddub     $9, $fp, $0
/* EB2B4 001EB1B4 2856E072 */  paddub     $10, $23, $0
/* EB2B8 001EB1B8 285EC070 */  paddub     $11, $6, $0
/* EB2BC 001EB1BC 889C070C */  jal        ShopIconDraw__FPsPUciiiiii
/* EB2C0 001EB1C0 00000000 */   nop
/* EB2C4 001EB1C4 28460070 */  paddub     $8, $0, $0
/* EB2C8 001EB1C8 02000224 */  addiu      $2, $0, 0x2
/* EB2CC 001EB1CC 0E002212 */  beq        $17, $2, .L001EB208
/* EB2D0 001EB1D0 00000000 */   nop
/* EB2D4 001EB1D4 01000224 */  addiu      $2, $0, 0x1
/* EB2D8 001EB1D8 08002212 */  beq        $17, $2, .L001EB1FC
/* EB2DC 001EB1DC 00000000 */   nop
/* EB2E0 001EB1E0 03002012 */  beqz       $17, .L001EB1F0
/* EB2E4 001EB1E4 00000000 */   nop
/* EB2E8 001EB1E8 08000010 */  b          .L001EB20C
/* EB2EC 001EB1EC 00000000 */   nop
.L001EB1F0:
/* EB2F0 001EB1F0 0C000825 */  addiu      $8, $8, 0xC
/* EB2F4 001EB1F4 05000010 */  b          .L001EB20C
/* EB2F8 001EB1F8 00000000 */   nop
.L001EB1FC:
/* EB2FC 001EB1FC 0A000825 */  addiu      $8, $8, 0xA
/* EB300 001EB200 02000010 */  b          .L001EB20C
/* EB304 001EB204 00000000 */   nop
.L001EB208:
/* EB308 001EB208 01000824 */  addiu      $8, $0, 0x1
.L001EB20C:
/* EB30C 001EB20C 28262072 */  paddub     $4, $17, $0
/* EB310 001EB210 282EA072 */  paddub     $5, $21, $0
/* EB314 001EB214 28368072 */  paddub     $6, $20, $0
/* EB318 001EB218 8894878F */  lw         $7, -0x6B78($gp)
/* EB31C 001EB21C 284E6072 */  paddub     $9, $19, $0
/* EB320 001EB220 84C0080C */  jal        PersonalBoardTagDraw__FiiiP8CTextureii
/* EB324 001EB224 00000000 */   nop
/* EB328 001EB228 2826A072 */  paddub     $4, $21, $0
/* EB32C 001EB22C 282E8072 */  paddub     $5, $20, $0
/* EB330 001EB230 8894868F */  lw         $6, -0x6B78($gp)
/* EB334 001EB234 283E6072 */  paddub     $7, $19, $0
/* EB338 001EB238 F0BF080C */  jal        PersonalBoardDrawWaku__FiiP8CTexturei
/* EB33C 001EB23C 00000000 */   nop
/* EB340 001EB240 40181100 */  sll        $3, $17, 1
/* EB344 001EB244 00888227 */  addiu      $2, $gp, -0x7800
/* EB348 001EB248 21804300 */  addu       $16, $2, $3
/* EB34C 001EB24C 00000486 */  lh         $4, 0x0($16)
/* EB350 001EB250 282EA072 */  paddub     $5, $21, $0
/* EB354 001EB254 28368072 */  paddub     $6, $20, $0
/* EB358 001EB258 D901023C */  lui        $2, %hi(D_1D90240)
/* EB35C 001EB25C 40024724 */  addiu      $7, $2, %lo(D_1D90240)
/* EB360 001EB260 D901013C */  lui        $at, (0x1D90246 >> 16)
/* EB364 001EB264 46022890 */  lbu        $8, (0x1D90246 & 0xFFFF)($at)
/* EB368 001EB268 8894898F */  lw         $9, -0x6B78($gp)
/* EB36C 001EB26C 28566072 */  paddub     $10, $19, $0
/* EB370 001EB270 C8C1080C */  jal        PersonalBoardScrlBarDraw__FiiiRfUcP8CTexturei
/* EB374 001EB274 00000000 */   nop
/* EB378 001EB278 00000486 */  lh         $4, 0x0($16)
/* EB37C 001EB27C 282EA072 */  paddub     $5, $21, $0
/* EB380 001EB280 28368072 */  paddub     $6, $20, $0
/* EB384 001EB284 283E6072 */  paddub     $7, $19, $0
/* EB388 001EB288 54AB070C */  jal        ChargeShopMaxDraw__Fiiii
/* EB38C 001EB28C 00000000 */   nop
/* EB390 001EB290 9000BF7B */  lq         $31, 0x90($sp)
/* EB394 001EB294 8000BE7B */  lq         $fp, 0x80($sp)
/* EB398 001EB298 7000B77B */  lq         $23, 0x70($sp)
/* EB39C 001EB29C 6000B67B */  lq         $22, 0x60($sp)
/* EB3A0 001EB2A0 5000B57B */  lq         $21, 0x50($sp)
/* EB3A4 001EB2A4 4000B47B */  lq         $20, 0x40($sp)
/* EB3A8 001EB2A8 3000B37B */  lq         $19, 0x30($sp)
/* EB3AC 001EB2AC 2000B27B */  lq         $18, 0x20($sp)
/* EB3B0 001EB2B0 1000B17B */  lq         $17, 0x10($sp)
/* EB3B4 001EB2B4 0000B07B */  lq         $16, 0x0($sp)
/* EB3B8 001EB2B8 1002BD27 */  addiu      $sp, $sp, 0x210
/* EB3BC 001EB2BC 0800E003 */  jr         $31
/* EB3C0 001EB2C0 00000000 */   nop
/* EB3C4 001EB2C4 00000000 */  nop
/* EB3C8 001EB2C8 00000000 */  nop
/* EB3CC 001EB2CC 00000000 */  nop
