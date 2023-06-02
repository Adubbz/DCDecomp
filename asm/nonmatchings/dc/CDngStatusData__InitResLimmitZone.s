.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitResLimmitZone__14CDngStatusDataFv
/* BF060 001BEF60 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* BF064 001BEF64 3000BF7F */  sq         $31, 0x30($sp)
/* BF068 001BEF68 2000B27F */  sq         $18, 0x20($sp)
/* BF06C 001BEF6C 1000B17F */  sq         $17, 0x10($sp)
/* BF070 001BEF70 0000B07F */  sq         $16, 0x0($sp)
/* BF074 001BEF74 28968070 */  paddub     $18, $4, $0
/* BF078 001BEF78 288E0070 */  paddub     $17, $0, $0
/* BF07C 001BEF7C 2A000010 */  b          .L001BF028
/* BF080 001BEF80 00000000 */   nop
.L001BEF84:
/* BF084 001BEF84 BE11040C */  jal        rand
/* BF088 001BEF88 00000000 */   nop
/* BF08C 001BEF8C 00008244 */  mtc1       $2, $f0
/* BF090 001BEF90 00000000 */  nop
/* BF094 001BEF94 60008046 */  cvt.s.w    $f1, $f0
/* BF098 001BEF98 7041023C */  lui        $2, (0x41700000 >> 16)
/* BF09C 001BEF9C 00008244 */  mtc1       $2, $f0
/* BF0A0 001BEFA0 00000000 */  nop
/* BF0A4 001BEFA4 42000146 */  mul.s      $f1, $f0, $f1
/* BF0A8 001BEFA8 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BF0AC 001BEFAC 00008244 */  mtc1       $2, $f0
/* BF0B0 001BEFB0 00000000 */  nop
/* BF0B4 001BEFB4 030B0046 */  div.s      $f12, $f1, $f0
/* BF0B8 001BEFB8 2C44040C */  jal        fptosi
/* BF0BC 001BEFBC 00000000 */   nop
/* BF0C0 001BEFC0 28864070 */  paddub     $16, $2, $0
/* BF0C4 001BEFC4 BE11040C */  jal        rand
/* BF0C8 001BEFC8 00000000 */   nop
/* BF0CC 001BEFCC 00008244 */  mtc1       $2, $f0
/* BF0D0 001BEFD0 00000000 */  nop
/* BF0D4 001BEFD4 60008046 */  cvt.s.w    $f1, $f0
/* BF0D8 001BEFD8 C842023C */  lui        $2, (0x42C80000 >> 16)
/* BF0DC 001BEFDC 00008244 */  mtc1       $2, $f0
/* BF0E0 001BEFE0 00000000 */  nop
/* BF0E4 001BEFE4 42000146 */  mul.s      $f1, $f0, $f1
/* BF0E8 001BEFE8 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BF0EC 001BEFEC 00008244 */  mtc1       $2, $f0
/* BF0F0 001BEFF0 00000000 */  nop
/* BF0F4 001BEFF4 030B0046 */  div.s      $f12, $f1, $f0
/* BF0F8 001BEFF8 2C44040C */  jal        fptosi
/* BF0FC 001BEFFC 00000000 */   nop
/* BF100 001BF000 32004328 */  slti       $3, $2, 0x32
/* BF104 001BF004 04006014 */  bnez       $3, .L001BF018
/* BF108 001BF008 00000000 */   nop
/* BF10C 001BF00C 0A000424 */  addiu      $4, $0, 0xA
/* BF110 001BF010 02000010 */  b          .L001BF01C
/* BF114 001BF014 00000000 */   nop
.L001BF018:
/* BF118 001BF018 0B000424 */  addiu      $4, $0, 0xB
.L001BF01C:
/* BF11C 001BF01C 21181202 */  addu       $3, $16, $18
/* BF120 001BF020 294264A0 */  sb         $4, 0x4229($3)
/* BF124 001BF024 01003126 */  addiu      $17, $17, 0x1
.L001BF028:
/* BF128 001BF028 0300232A */  slti       $3, $17, 0x3
/* BF12C 001BF02C D5FF6014 */  bnez       $3, .L001BEF84
/* BF130 001BF030 00000000 */   nop
/* BF134 001BF034 288E0070 */  paddub     $17, $0, $0
/* BF138 001BF038 2A000010 */  b          .L001BF0E4
/* BF13C 001BF03C 00000000 */   nop
.L001BF040:
/* BF140 001BF040 BE11040C */  jal        rand
/* BF144 001BF044 00000000 */   nop
/* BF148 001BF048 00008244 */  mtc1       $2, $f0
/* BF14C 001BF04C 00000000 */  nop
/* BF150 001BF050 60008046 */  cvt.s.w    $f1, $f0
/* BF154 001BF054 8041023C */  lui        $2, (0x41800000 >> 16)
/* BF158 001BF058 00008244 */  mtc1       $2, $f0
/* BF15C 001BF05C 00000000 */  nop
/* BF160 001BF060 42000146 */  mul.s      $f1, $f0, $f1
/* BF164 001BF064 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BF168 001BF068 00008244 */  mtc1       $2, $f0
/* BF16C 001BF06C 00000000 */  nop
/* BF170 001BF070 030B0046 */  div.s      $f12, $f1, $f0
/* BF174 001BF074 2C44040C */  jal        fptosi
/* BF178 001BF078 00000000 */   nop
/* BF17C 001BF07C 28864070 */  paddub     $16, $2, $0
/* BF180 001BF080 BE11040C */  jal        rand
/* BF184 001BF084 00000000 */   nop
/* BF188 001BF088 00008244 */  mtc1       $2, $f0
/* BF18C 001BF08C 00000000 */  nop
/* BF190 001BF090 60008046 */  cvt.s.w    $f1, $f0
/* BF194 001BF094 C842023C */  lui        $2, (0x42C80000 >> 16)
/* BF198 001BF098 00008244 */  mtc1       $2, $f0
/* BF19C 001BF09C 00000000 */  nop
/* BF1A0 001BF0A0 42000146 */  mul.s      $f1, $f0, $f1
/* BF1A4 001BF0A4 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BF1A8 001BF0A8 00008244 */  mtc1       $2, $f0
/* BF1AC 001BF0AC 00000000 */  nop
/* BF1B0 001BF0B0 030B0046 */  div.s      $f12, $f1, $f0
/* BF1B4 001BF0B4 2C44040C */  jal        fptosi
/* BF1B8 001BF0B8 00000000 */   nop
/* BF1BC 001BF0BC 32004328 */  slti       $3, $2, 0x32
/* BF1C0 001BF0C0 04006014 */  bnez       $3, .L001BF0D4
/* BF1C4 001BF0C4 00000000 */   nop
/* BF1C8 001BF0C8 0A000424 */  addiu      $4, $0, 0xA
/* BF1CC 001BF0CC 02000010 */  b          .L001BF0D8
/* BF1D0 001BF0D0 00000000 */   nop
.L001BF0D4:
/* BF1D4 001BF0D4 0B000424 */  addiu      $4, $0, 0xB
.L001BF0D8:
/* BF1D8 001BF0D8 21181202 */  addu       $3, $16, $18
/* BF1DC 001BF0DC 424264A0 */  sb         $4, 0x4242($3)
/* BF1E0 001BF0E0 01003126 */  addiu      $17, $17, 0x1
.L001BF0E4:
/* BF1E4 001BF0E4 0300232A */  slti       $3, $17, 0x3
/* BF1E8 001BF0E8 D5FF6014 */  bnez       $3, .L001BF040
/* BF1EC 001BF0EC 00000000 */   nop
/* BF1F0 001BF0F0 288E0070 */  paddub     $17, $0, $0
/* BF1F4 001BF0F4 2A000010 */  b          .L001BF1A0
/* BF1F8 001BF0F8 00000000 */   nop
.L001BF0FC:
/* BF1FC 001BF0FC BE11040C */  jal        rand
/* BF200 001BF100 00000000 */   nop
/* BF204 001BF104 00008244 */  mtc1       $2, $f0
/* BF208 001BF108 00000000 */  nop
/* BF20C 001BF10C 60008046 */  cvt.s.w    $f1, $f0
/* BF210 001BF110 8041023C */  lui        $2, (0x41800000 >> 16)
/* BF214 001BF114 00008244 */  mtc1       $2, $f0
/* BF218 001BF118 00000000 */  nop
/* BF21C 001BF11C 42000146 */  mul.s      $f1, $f0, $f1
/* BF220 001BF120 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BF224 001BF124 00008244 */  mtc1       $2, $f0
/* BF228 001BF128 00000000 */  nop
/* BF22C 001BF12C 030B0046 */  div.s      $f12, $f1, $f0
/* BF230 001BF130 2C44040C */  jal        fptosi
/* BF234 001BF134 00000000 */   nop
/* BF238 001BF138 28864070 */  paddub     $16, $2, $0
/* BF23C 001BF13C BE11040C */  jal        rand
/* BF240 001BF140 00000000 */   nop
/* BF244 001BF144 00008244 */  mtc1       $2, $f0
/* BF248 001BF148 00000000 */  nop
/* BF24C 001BF14C 60008046 */  cvt.s.w    $f1, $f0
/* BF250 001BF150 C842023C */  lui        $2, (0x42C80000 >> 16)
/* BF254 001BF154 00008244 */  mtc1       $2, $f0
/* BF258 001BF158 00000000 */  nop
/* BF25C 001BF15C 42000146 */  mul.s      $f1, $f0, $f1
/* BF260 001BF160 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BF264 001BF164 00008244 */  mtc1       $2, $f0
/* BF268 001BF168 00000000 */  nop
/* BF26C 001BF16C 030B0046 */  div.s      $f12, $f1, $f0
/* BF270 001BF170 2C44040C */  jal        fptosi
/* BF274 001BF174 00000000 */   nop
/* BF278 001BF178 32004328 */  slti       $3, $2, 0x32
/* BF27C 001BF17C 04006014 */  bnez       $3, .L001BF190
/* BF280 001BF180 00000000 */   nop
/* BF284 001BF184 0A000424 */  addiu      $4, $0, 0xA
/* BF288 001BF188 02000010 */  b          .L001BF194
/* BF28C 001BF18C 00000000 */   nop
.L001BF190:
/* BF290 001BF190 0B000424 */  addiu      $4, $0, 0xB
.L001BF194:
/* BF294 001BF194 21181202 */  addu       $3, $16, $18
/* BF298 001BF198 5B4264A0 */  sb         $4, 0x425B($3)
/* BF29C 001BF19C 01003126 */  addiu      $17, $17, 0x1
.L001BF1A0:
/* BF2A0 001BF1A0 0300232A */  slti       $3, $17, 0x3
/* BF2A4 001BF1A4 D5FF6014 */  bnez       $3, .L001BF0FC
/* BF2A8 001BF1A8 00000000 */   nop
/* BF2AC 001BF1AC 288E0070 */  paddub     $17, $0, $0
/* BF2B0 001BF1B0 2A000010 */  b          .L001BF25C
/* BF2B4 001BF1B4 00000000 */   nop
.L001BF1B8:
/* BF2B8 001BF1B8 BE11040C */  jal        rand
/* BF2BC 001BF1BC 00000000 */   nop
/* BF2C0 001BF1C0 00008244 */  mtc1       $2, $f0
/* BF2C4 001BF1C4 00000000 */  nop
/* BF2C8 001BF1C8 60008046 */  cvt.s.w    $f1, $f0
/* BF2CC 001BF1CC 6041023C */  lui        $2, (0x41600000 >> 16)
/* BF2D0 001BF1D0 00008244 */  mtc1       $2, $f0
/* BF2D4 001BF1D4 00000000 */  nop
/* BF2D8 001BF1D8 42000146 */  mul.s      $f1, $f0, $f1
/* BF2DC 001BF1DC 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BF2E0 001BF1E0 00008244 */  mtc1       $2, $f0
/* BF2E4 001BF1E4 00000000 */  nop
/* BF2E8 001BF1E8 030B0046 */  div.s      $f12, $f1, $f0
/* BF2EC 001BF1EC 2C44040C */  jal        fptosi
/* BF2F0 001BF1F0 00000000 */   nop
/* BF2F4 001BF1F4 28864070 */  paddub     $16, $2, $0
/* BF2F8 001BF1F8 BE11040C */  jal        rand
/* BF2FC 001BF1FC 00000000 */   nop
/* BF300 001BF200 00008244 */  mtc1       $2, $f0
/* BF304 001BF204 00000000 */  nop
/* BF308 001BF208 60008046 */  cvt.s.w    $f1, $f0
/* BF30C 001BF20C C842023C */  lui        $2, (0x42C80000 >> 16)
/* BF310 001BF210 00008244 */  mtc1       $2, $f0
/* BF314 001BF214 00000000 */  nop
/* BF318 001BF218 42000146 */  mul.s      $f1, $f0, $f1
/* BF31C 001BF21C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BF320 001BF220 00008244 */  mtc1       $2, $f0
/* BF324 001BF224 00000000 */  nop
/* BF328 001BF228 030B0046 */  div.s      $f12, $f1, $f0
/* BF32C 001BF22C 2C44040C */  jal        fptosi
/* BF330 001BF230 00000000 */   nop
/* BF334 001BF234 32004328 */  slti       $3, $2, 0x32
/* BF338 001BF238 04006014 */  bnez       $3, .L001BF24C
/* BF33C 001BF23C 00000000 */   nop
/* BF340 001BF240 0A000424 */  addiu      $4, $0, 0xA
/* BF344 001BF244 02000010 */  b          .L001BF250
/* BF348 001BF248 00000000 */   nop
.L001BF24C:
/* BF34C 001BF24C 0B000424 */  addiu      $4, $0, 0xB
.L001BF250:
/* BF350 001BF250 21181202 */  addu       $3, $16, $18
/* BF354 001BF254 744264A0 */  sb         $4, 0x4274($3)
/* BF358 001BF258 01003126 */  addiu      $17, $17, 0x1
.L001BF25C:
/* BF35C 001BF25C 0400232A */  slti       $3, $17, 0x4
/* BF360 001BF260 D5FF6014 */  bnez       $3, .L001BF1B8
/* BF364 001BF264 00000000 */   nop
/* BF368 001BF268 288E0070 */  paddub     $17, $0, $0
/* BF36C 001BF26C 2A000010 */  b          .L001BF318
/* BF370 001BF270 00000000 */   nop
.L001BF274:
/* BF374 001BF274 BE11040C */  jal        rand
/* BF378 001BF278 00000000 */   nop
/* BF37C 001BF27C 00008244 */  mtc1       $2, $f0
/* BF380 001BF280 00000000 */  nop
/* BF384 001BF284 60008046 */  cvt.s.w    $f1, $f0
/* BF388 001BF288 B841023C */  lui        $2, (0x41B80000 >> 16)
/* BF38C 001BF28C 00008244 */  mtc1       $2, $f0
/* BF390 001BF290 00000000 */  nop
/* BF394 001BF294 42000146 */  mul.s      $f1, $f0, $f1
/* BF398 001BF298 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BF39C 001BF29C 00008244 */  mtc1       $2, $f0
/* BF3A0 001BF2A0 00000000 */  nop
/* BF3A4 001BF2A4 030B0046 */  div.s      $f12, $f1, $f0
/* BF3A8 001BF2A8 2C44040C */  jal        fptosi
/* BF3AC 001BF2AC 00000000 */   nop
/* BF3B0 001BF2B0 28864070 */  paddub     $16, $2, $0
/* BF3B4 001BF2B4 BE11040C */  jal        rand
/* BF3B8 001BF2B8 00000000 */   nop
/* BF3BC 001BF2BC 00008244 */  mtc1       $2, $f0
/* BF3C0 001BF2C0 00000000 */  nop
/* BF3C4 001BF2C4 60008046 */  cvt.s.w    $f1, $f0
/* BF3C8 001BF2C8 C842023C */  lui        $2, (0x42C80000 >> 16)
/* BF3CC 001BF2CC 00008244 */  mtc1       $2, $f0
/* BF3D0 001BF2D0 00000000 */  nop
/* BF3D4 001BF2D4 42000146 */  mul.s      $f1, $f0, $f1
/* BF3D8 001BF2D8 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BF3DC 001BF2DC 00008244 */  mtc1       $2, $f0
/* BF3E0 001BF2E0 00000000 */  nop
/* BF3E4 001BF2E4 030B0046 */  div.s      $f12, $f1, $f0
/* BF3E8 001BF2E8 2C44040C */  jal        fptosi
/* BF3EC 001BF2EC 00000000 */   nop
/* BF3F0 001BF2F0 32004328 */  slti       $3, $2, 0x32
/* BF3F4 001BF2F4 04006014 */  bnez       $3, .L001BF308
/* BF3F8 001BF2F8 00000000 */   nop
/* BF3FC 001BF2FC 0A000424 */  addiu      $4, $0, 0xA
/* BF400 001BF300 02000010 */  b          .L001BF30C
/* BF404 001BF304 00000000 */   nop
.L001BF308:
/* BF408 001BF308 0B000424 */  addiu      $4, $0, 0xB
.L001BF30C:
/* BF40C 001BF30C 21181202 */  addu       $3, $16, $18
/* BF410 001BF310 8D4264A0 */  sb         $4, 0x428D($3)
/* BF414 001BF314 01003126 */  addiu      $17, $17, 0x1
.L001BF318:
/* BF418 001BF318 0400232A */  slti       $3, $17, 0x4
/* BF41C 001BF31C D5FF6014 */  bnez       $3, .L001BF274
/* BF420 001BF320 00000000 */   nop
/* BF424 001BF324 3000BF7B */  lq         $31, 0x30($sp)
/* BF428 001BF328 2000B27B */  lq         $18, 0x20($sp)
/* BF42C 001BF32C 1000B17B */  lq         $17, 0x10($sp)
/* BF430 001BF330 0000B07B */  lq         $16, 0x0($sp)
/* BF434 001BF334 4000BD27 */  addiu      $sp, $sp, 0x40
/* BF438 001BF338 0800E003 */  jr         $31
/* BF43C 001BF33C 00000000 */   nop
