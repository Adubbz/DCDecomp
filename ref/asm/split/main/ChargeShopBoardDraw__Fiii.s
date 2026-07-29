.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ChargeShopBoardDraw__Fiii
/* 0EB040 001EAF40 F0FDBD27 */  addiu       $29, $29, -0x210
/* 0EB044 001EAF44 9000BF7F */  sq          $31, 0x90($29)
/* 0EB048 001EAF48 8000BE7F */  sq          $30, 0x80($29)
/* 0EB04C 001EAF4C 7000B77F */  sq          $23, 0x70($29)
/* 0EB050 001EAF50 6000B67F */  sq          $22, 0x60($29)
/* 0EB054 001EAF54 5000B57F */  sq          $21, 0x50($29)
/* 0EB058 001EAF58 4000B47F */  sq          $20, 0x40($29)
/* 0EB05C 001EAF5C 3000B37F */  sq          $19, 0x30($29)
/* 0EB060 001EAF60 2000B27F */  sq          $18, 0x20($29)
/* 0EB064 001EAF64 1000B17F */  sq          $17, 0x10($29)
/* 0EB068 001EAF68 0000B07F */  sq          $16, 0x0($29)
/* 0EB06C 001EAF6C 28AE8070 */  paddub      $21, $4, $0
/* 0EB070 001EAF70 28A6A070 */  paddub      $20, $5, $0
/* 0EB074 001EAF74 289EC070 */  paddub      $19, $6, $0
/* 0EB078 001EAF78 09009E26 */  addiu       $30, $20, 0x9
/* 0EB07C 001EAF7C A9009726 */  addiu       $23, $20, 0xA9
/* 0EB080 001EAF80 1400B626 */  addiu       $22, $21, 0x14
/* 0EB084 001EAF84 06008626 */  addiu       $6, $20, 0x6
/* 0EB088 001EAF88 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0EB08C 001EAF8C 46022390 */  lbu         $3, %lo(ShopMenu + 0x176)($1)
/* 0EB090 001EAF90 80100300 */  sll         $2, $3, 2
/* 0EB094 001EAF94 21104300 */  addu        $2, $2, $3
/* 0EB098 001EAF98 C0100200 */  sll         $2, $2, 3
/* 0EB09C 001EAF9C 2380C200 */  subu        $16, $6, $2
/* 0EB0A0 001EAFA0 00009044 */  mtc1        $16, $f0
/* 0EB0A4 001EAFA4 00000000 */  nop
/* 0EB0A8 001EAFA8 20008046 */  cvt.s.w     $f0, $f0
/* 0EB0AC 001EAFAC D901013C */  lui         $1, %hi(ShopMenu + 0x16C)
/* 0EB0B0 001EAFB0 3C0222C4 */  lwc1        $f2, %lo(ShopMenu + 0x16C)($1)
/* 0EB0B4 001EAFB4 41000246 */  sub.s       $f1, $f0, $f2
/* 0EB0B8 001EAFB8 8040023C */  lui         $2, (0x40800000 >> 16)
/* 0EB0BC 001EAFBC 00008244 */  mtc1        $2, $f0
/* 0EB0C0 001EAFC0 00000000 */  nop
/* 0EB0C4 001EAFC4 03080046 */  div.s       $f0, $f1, $f0
/* 0EB0C8 001EAFC8 00130046 */  add.s       $f12, $f2, $f0
/* 0EB0CC 001EAFCC D901013C */  lui         $1, %hi(ShopMenu + 0x16C)
/* 0EB0D0 001EAFD0 3C022CE4 */  swc1        $f12, %lo(ShopMenu + 0x16C)($1)
/* 0EB0D4 001EAFD4 2C44040C */  jal         fptosi
/* 0EB0D8 001EAFD8 00000000 */   nop
/* 0EB0DC 001EAFDC 28864070 */  paddub      $16, $2, $0
/* 0EB0E0 001EAFE0 28260070 */  paddub      $4, $0, $0
/* 0EB0E4 001EAFE4 64000524 */  addiu       $5, $0, 0x64
/* 0EB0E8 001EAFE8 2836C072 */  paddub      $6, $22, $0
/* 0EB0EC 001EAFEC 283E0072 */  paddub      $7, $16, $0
/* 0EB0F0 001EAFF0 2846C073 */  paddub      $8, $30, $0
/* 0EB0F4 001EAFF4 284EE072 */  paddub      $9, $23, $0
/* 0EB0F8 001EAFF8 88948A8F */  lw          $10, -0x6B78($28)
/* 0EB0FC 001EAFFC 285E6072 */  paddub      $11, $19, $0
/* 0EB100 001EB000 70C3080C */  jal         DrawPerBoardDraw__FiiiiiiP8CTexturei
/* 0EB104 001EB004 00000000 */   nop
/* 0EB108 001EB008 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0EB10C 001EB00C DC00318C */  lw          $17, %lo(ShopMenu + 0xC)($1)
/* 0EB110 001EB010 02000224 */  addiu       $2, $0, 0x2
/* 0EB114 001EB014 2D002212 */  beq         $17, $2, .L001EB0CC
/* 0EB118 001EB018 00000000 */   nop
/* 0EB11C 001EB01C 1A002012 */  beqz        $17, .L001EB088
/* 0EB120 001EB020 00000000 */   nop
/* 0EB124 001EB024 01000224 */  addiu       $2, $0, 0x1
/* 0EB128 001EB028 03002212 */  beq         $17, $2, .L001EB038
/* 0EB12C 001EB02C 00000000 */   nop
/* 0EB130 001EB030 57000010 */  b           .L001EB190
/* 0EB134 001EB034 00000000 */   nop
.L001EB038:
/* 0EB138 001EB038 28960070 */  paddub      $18, $0, $0
/* 0EB13C 001EB03C 0D000010 */  b           .L001EB074
/* 0EB140 001EB040 00000000 */   nop
.L001EB044:
/* 0EB144 001EB044 8C94838F */  lw          $3, -0x6B74($28)
/* 0EB148 001EB048 40111200 */  sll         $2, $18, 5
/* 0EB14C 001EB04C 23105200 */  subu        $2, $2, $18
/* 0EB150 001EB050 C0100200 */  sll         $2, $2, 3
/* 0EB154 001EB054 21104300 */  addu        $2, $2, $3
/* 0EB158 001EB058 F0004384 */  lh          $3, 0xF0($2)
/* 0EB15C 001EB05C 40101200 */  sll         $2, $18, 1
/* 0EB160 001EB060 21105D00 */  addu        $2, $2, $29
/* 0EB164 001EB064 A00043A4 */  sh          $3, 0xA0($2)
/* 0EB168 001EB068 21105D02 */  addu        $2, $18, $29
/* 0EB16C 001EB06C 900140A0 */  sb          $0, 0x190($2)
/* 0EB170 001EB070 01005226 */  addiu       $18, $18, 0x1
.L001EB074:
/* 0EB174 001EB074 1E00422A */  slti        $2, $18, 0x1E
/* 0EB178 001EB078 F2FF4014 */  bnez        $2, .L001EB044
/* 0EB17C 001EB07C 00000000 */   nop
/* 0EB180 001EB080 43000010 */  b           .L001EB190
/* 0EB184 001EB084 00000000 */   nop
.L001EB088:
/* 0EB188 001EB088 28960070 */  paddub      $18, $0, $0
/* 0EB18C 001EB08C 0A000010 */  b           .L001EB0B8
/* 0EB190 001EB090 00000000 */   nop
.L001EB094:
/* 0EB194 001EB094 40201200 */  sll         $4, $18, 1
/* 0EB198 001EB098 8C94828F */  lw          $2, -0x6B74($28)
/* 0EB19C 001EB09C 21104400 */  addu        $2, $2, $4
/* 0EB1A0 001EB0A0 00004384 */  lh          $3, 0x0($2)
/* 0EB1A4 001EB0A4 21109D00 */  addu        $2, $4, $29
/* 0EB1A8 001EB0A8 A00043A4 */  sh          $3, 0xA0($2)
/* 0EB1AC 001EB0AC 21105D02 */  addu        $2, $18, $29
/* 0EB1B0 001EB0B0 900140A0 */  sb          $0, 0x190($2)
/* 0EB1B4 001EB0B4 01005226 */  addiu       $18, $18, 0x1
.L001EB0B8:
/* 0EB1B8 001EB0B8 3C00422A */  slti        $2, $18, 0x3C
/* 0EB1BC 001EB0BC F5FF4014 */  bnez        $2, .L001EB094
/* 0EB1C0 001EB0C0 00000000 */   nop
/* 0EB1C4 001EB0C4 32000010 */  b           .L001EB190
/* 0EB1C8 001EB0C8 00000000 */   nop
.L001EB0CC:
/* 0EB1CC 001EB0CC 28960070 */  paddub      $18, $0, $0
/* 0EB1D0 001EB0D0 23000010 */  b           .L001EB160
/* 0EB1D4 001EB0D4 00000000 */   nop
.L001EB0D8:
/* 0EB1D8 001EB0D8 8C94868F */  lw          $6, -0x6B74($28)
/* 0EB1DC 001EB0DC 40291200 */  sll         $5, $18, 5
/* 0EB1E0 001EB0E0 2120A600 */  addu        $4, $5, $6
/* 0EB1E4 001EB0E4 001E8384 */  lh          $3, 0x1E00($4)
/* 0EB1E8 001EB0E8 40101200 */  sll         $2, $18, 1
/* 0EB1EC 001EB0EC 21105D00 */  addu        $2, $2, $29
/* 0EB1F0 001EB0F0 A0004224 */  addiu       $2, $2, 0xA0
/* 0EB1F4 001EB0F4 000043A4 */  sh          $3, 0x0($2)
/* 0EB1F8 001EB0F8 00004384 */  lh          $3, 0x0($2)
/* 0EB1FC 001EB0FC 5B006228 */  slti        $2, $3, 0x5B
/* 0EB200 001EB100 0B004014 */  bnez        $2, .L001EB130
/* 0EB204 001EB104 00000000 */   nop
/* 0EB208 001EB108 5F006128 */  slti        $1, $3, 0x5F
/* 0EB20C 001EB10C 08002010 */  beqz        $1, .L001EB130
/* 0EB210 001EB110 00000000 */   nop
/* 0EB214 001EB114 40100300 */  sll         $2, $3, 1
/* 0EB218 001EB118 21104400 */  addu        $2, $2, $4
/* 0EB21C 001EB11C 521D4390 */  lbu         $3, 0x1D52($2)
/* 0EB220 001EB120 21105D02 */  addu        $2, $18, $29
/* 0EB224 001EB124 900143A0 */  sb          $3, 0x190($2)
/* 0EB228 001EB128 0C000010 */  b           .L001EB15C
/* 0EB22C 001EB12C 00000000 */   nop
.L001EB130:
/* 0EB230 001EB130 5A000224 */  addiu       $2, $0, 0x5A
/* 0EB234 001EB134 07006214 */  bne         $3, $2, .L001EB154
/* 0EB238 001EB138 00000000 */   nop
/* 0EB23C 001EB13C 2110A600 */  addu        $2, $5, $6
/* 0EB240 001EB140 021E4390 */  lbu         $3, 0x1E02($2)
/* 0EB244 001EB144 21105D02 */  addu        $2, $18, $29
/* 0EB248 001EB148 900143A0 */  sb          $3, 0x190($2)
/* 0EB24C 001EB14C 03000010 */  b           .L001EB15C
/* 0EB250 001EB150 00000000 */   nop
.L001EB154:
/* 0EB254 001EB154 21105D02 */  addu        $2, $18, $29
/* 0EB258 001EB158 900140A0 */  sb          $0, 0x190($2)
.L001EB15C:
/* 0EB25C 001EB15C 01005226 */  addiu       $18, $18, 0x1
.L001EB160:
/* 0EB260 001EB160 1E00422A */  slti        $2, $18, 0x1E
/* 0EB264 001EB164 DCFF4014 */  bnez        $2, .L001EB0D8
/* 0EB268 001EB168 00000000 */   nop
/* 0EB26C 001EB16C 08000010 */  b           .L001EB190
/* 0EB270 001EB170 00000000 */   nop
.L001EB174:
/* 0EB274 001EB174 FFFF0324 */  addiu       $3, $0, -0x1
/* 0EB278 001EB178 40101200 */  sll         $2, $18, 1
/* 0EB27C 001EB17C 21105D00 */  addu        $2, $2, $29
/* 0EB280 001EB180 A00043A4 */  sh          $3, 0xA0($2)
/* 0EB284 001EB184 21105D02 */  addu        $2, $18, $29
/* 0EB288 001EB188 900140A0 */  sb          $0, 0x190($2)
/* 0EB28C 001EB18C 01005226 */  addiu       $18, $18, 0x1
.L001EB190:
/* 0EB290 001EB190 3C00422A */  slti        $2, $18, 0x3C
/* 0EB294 001EB194 F7FF4014 */  bnez        $2, .L001EB174
/* 0EB298 001EB198 00000000 */   nop
/* 0EB29C 001EB19C 0400C726 */  addiu       $7, $22, 0x4
/* 0EB2A0 001EB1A0 06000826 */  addiu       $8, $16, 0x6
/* 0EB2A4 001EB1A4 A000A427 */  addiu       $4, $29, 0xA0
/* 0EB2A8 001EB1A8 9001A527 */  addiu       $5, $29, 0x190
/* 0EB2AC 001EB1AC 80000624 */  addiu       $6, $0, 0x80
/* 0EB2B0 001EB1B0 284EC073 */  paddub      $9, $30, $0
/* 0EB2B4 001EB1B4 2856E072 */  paddub      $10, $23, $0
/* 0EB2B8 001EB1B8 285EC070 */  paddub      $11, $6, $0
/* 0EB2BC 001EB1BC 889C070C */  jal         ShopIconDraw__FPsPUciiiiii
/* 0EB2C0 001EB1C0 00000000 */   nop
/* 0EB2C4 001EB1C4 28460070 */  paddub      $8, $0, $0
/* 0EB2C8 001EB1C8 02000224 */  addiu       $2, $0, 0x2
/* 0EB2CC 001EB1CC 0E002212 */  beq         $17, $2, .L001EB208
/* 0EB2D0 001EB1D0 00000000 */   nop
/* 0EB2D4 001EB1D4 01000224 */  addiu       $2, $0, 0x1
/* 0EB2D8 001EB1D8 08002212 */  beq         $17, $2, .L001EB1FC
/* 0EB2DC 001EB1DC 00000000 */   nop
/* 0EB2E0 001EB1E0 03002012 */  beqz        $17, .L001EB1F0
/* 0EB2E4 001EB1E4 00000000 */   nop
/* 0EB2E8 001EB1E8 08000010 */  b           .L001EB20C
/* 0EB2EC 001EB1EC 00000000 */   nop
.L001EB1F0:
/* 0EB2F0 001EB1F0 0C000825 */  addiu       $8, $8, 0xC
/* 0EB2F4 001EB1F4 05000010 */  b           .L001EB20C
/* 0EB2F8 001EB1F8 00000000 */   nop
.L001EB1FC:
/* 0EB2FC 001EB1FC 0A000825 */  addiu       $8, $8, 0xA
/* 0EB300 001EB200 02000010 */  b           .L001EB20C
/* 0EB304 001EB204 00000000 */   nop
.L001EB208:
/* 0EB308 001EB208 01000824 */  addiu       $8, $0, 0x1
.L001EB20C:
/* 0EB30C 001EB20C 28262072 */  paddub      $4, $17, $0
/* 0EB310 001EB210 282EA072 */  paddub      $5, $21, $0
/* 0EB314 001EB214 28368072 */  paddub      $6, $20, $0
/* 0EB318 001EB218 8894878F */  lw          $7, -0x6B78($28)
/* 0EB31C 001EB21C 284E6072 */  paddub      $9, $19, $0
/* 0EB320 001EB220 84C0080C */  jal         PersonalBoardTagDraw__FiiiP8CTextureii
/* 0EB324 001EB224 00000000 */   nop
/* 0EB328 001EB228 2826A072 */  paddub      $4, $21, $0
/* 0EB32C 001EB22C 282E8072 */  paddub      $5, $20, $0
/* 0EB330 001EB230 8894868F */  lw          $6, -0x6B78($28)
/* 0EB334 001EB234 283E6072 */  paddub      $7, $19, $0
/* 0EB338 001EB238 F0BF080C */  jal         PersonalBoardDrawWaku__FiiP8CTexturei
/* 0EB33C 001EB23C 00000000 */   nop
/* 0EB340 001EB240 40181100 */  sll         $3, $17, 1
/* 0EB344 001EB244 00888227 */  addiu       $2, $28, -0x7800
/* 0EB348 001EB248 21804300 */  addu        $16, $2, $3
/* 0EB34C 001EB24C 00000486 */  lh          $4, 0x0($16)
/* 0EB350 001EB250 282EA072 */  paddub      $5, $21, $0
/* 0EB354 001EB254 28368072 */  paddub      $6, $20, $0
/* 0EB358 001EB258 D901023C */  lui         $2, %hi(ShopMenu + 0x170)
/* 0EB35C 001EB25C 40024724 */  addiu       $7, $2, %lo(ShopMenu + 0x170)
/* 0EB360 001EB260 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0EB364 001EB264 46022890 */  lbu         $8, %lo(ShopMenu + 0x176)($1)
/* 0EB368 001EB268 8894898F */  lw          $9, -0x6B78($28)
/* 0EB36C 001EB26C 28566072 */  paddub      $10, $19, $0
/* 0EB370 001EB270 C8C1080C */  jal         PersonalBoardScrlBarDraw__FiiiRfUcP8CTexturei
/* 0EB374 001EB274 00000000 */   nop
/* 0EB378 001EB278 00000486 */  lh          $4, 0x0($16)
/* 0EB37C 001EB27C 282EA072 */  paddub      $5, $21, $0
/* 0EB380 001EB280 28368072 */  paddub      $6, $20, $0
/* 0EB384 001EB284 283E6072 */  paddub      $7, $19, $0
/* 0EB388 001EB288 54AB070C */  jal         ChargeShopMaxDraw__Fiiii
/* 0EB38C 001EB28C 00000000 */   nop
/* 0EB390 001EB290 9000BF7B */  lq          $31, 0x90($29)
/* 0EB394 001EB294 8000BE7B */  lq          $30, 0x80($29)
/* 0EB398 001EB298 7000B77B */  lq          $23, 0x70($29)
/* 0EB39C 001EB29C 6000B67B */  lq          $22, 0x60($29)
/* 0EB3A0 001EB2A0 5000B57B */  lq          $21, 0x50($29)
/* 0EB3A4 001EB2A4 4000B47B */  lq          $20, 0x40($29)
/* 0EB3A8 001EB2A8 3000B37B */  lq          $19, 0x30($29)
/* 0EB3AC 001EB2AC 2000B27B */  lq          $18, 0x20($29)
/* 0EB3B0 001EB2B0 1000B17B */  lq          $17, 0x10($29)
/* 0EB3B4 001EB2B4 0000B07B */  lq          $16, 0x0($29)
/* 0EB3B8 001EB2B8 1002BD27 */  addiu       $29, $29, 0x210
/* 0EB3BC 001EB2BC 0800E003 */  jr          $31
/* 0EB3C0 001EB2C0 00000000 */   nop
/* 0EB3C4 001EB2C4 00000000 */  nop
/* 0EB3C8 001EB2C8 00000000 */  nop
/* 0EB3CC 001EB2CC 00000000 */  nop
