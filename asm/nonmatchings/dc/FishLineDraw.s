.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishLineDraw__Fi
/* AB1F0 001AB0F0 E0FEBD27 */  addiu      $sp, $sp, -0x120
/* AB1F4 001AB0F4 6000BF7F */  sq         $31, 0x60($sp)
/* AB1F8 001AB0F8 5000B57F */  sq         $21, 0x50($sp)
/* AB1FC 001AB0FC 4000B47F */  sq         $20, 0x40($sp)
/* AB200 001AB100 3000B37F */  sq         $19, 0x30($sp)
/* AB204 001AB104 2000B27F */  sq         $18, 0x20($sp)
/* AB208 001AB108 1000B17F */  sq         $17, 0x10($sp)
/* AB20C 001AB10C 0000B07F */  sq         $16, 0x0($sp)
/* AB210 001AB110 28868070 */  paddub     $16, $4, $0
/* AB214 001AB114 A0B8040C */  jal        GetVif1Packet__Fv
/* AB218 001AB118 00000000 */   nop
/* AB21C 001AB11C C701033C */  lui        $3, %hi(TexManager)
/* AB220 001AB120 70586424 */  addiu      $4, $3, %lo(TexManager)
/* AB224 001AB124 282E4070 */  paddub     $5, $2, $0
/* AB228 001AB128 5C93868F */  lw         $6, -0x6CA4($gp)
/* AB22C 001AB12C 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* AB230 001AB130 00000000 */   nop
/* AB234 001AB134 28960070 */  paddub     $18, $0, $0
/* AB238 001AB138 A0B8040C */  jal        GetVif1Packet__Fv
/* AB23C 001AB13C 00000000 */   nop
/* AB240 001AB140 28A64070 */  paddub     $20, $2, $0
/* AB244 001AB144 28268072 */  paddub     $4, $20, $0
/* AB248 001AB148 282E0070 */  paddub     $5, $0, $0
/* AB24C 001AB14C 2083040C */  jal        sceVif1PkCnt
/* AB250 001AB150 00000000 */   nop
/* AB254 001AB154 28268072 */  paddub     $4, $20, $0
/* AB258 001AB158 282E0070 */  paddub     $5, $0, $0
/* AB25C 001AB15C 8E83040C */  jal        sceVif1PkOpenDirectCode
/* AB260 001AB160 00000000 */   nop
/* AB264 001AB164 C701023C */  lui        $2, %hi(GiftagAD)
/* AB268 001AB168 C0524224 */  addiu      $2, $2, %lo(GiftagAD)
/* AB26C 001AB16C 28268072 */  paddub     $4, $20, $0
/* AB270 001AB170 00004578 */  lq         $5, 0x0($2)
/* AB274 001AB174 B083040C */  jal        sceVif1PkOpenGifTag
/* AB278 001AB178 00000000 */   nop
/* AB27C 001AB17C 28268072 */  paddub     $4, $20, $0
/* AB280 001AB180 282E0070 */  paddub     $5, $0, $0
/* AB284 001AB184 4A010624 */  addiu      $6, $0, 0x14A
/* AB288 001AB188 0A84040C */  jal        sceVif1PkAddGsAD
/* AB28C 001AB18C 00000000 */   nop
/* AB290 001AB190 28268072 */  paddub     $4, $20, $0
/* AB294 001AB194 01000524 */  addiu      $5, $0, 0x1
/* AB298 001AB198 80800234 */  ori        $2, $0, 0x8080
/* AB29C 001AB19C 38140200 */  dsll       $2, $2, 16
/* AB2A0 001AB1A0 80804634 */  ori        $6, $2, 0x8080
/* AB2A4 001AB1A4 0A84040C */  jal        sceVif1PkAddGsAD
/* AB2A8 001AB1A8 00000000 */   nop
/* AB2AC 001AB1AC 1801A627 */  addiu      $6, $sp, 0x118
/* AB2B0 001AB1B0 E88B82DF */  ld         $2, -0x7418($gp)
/* AB2B4 001AB1B4 0000C2FC */  sd         $2, 0x0($6)
/* AB2B8 001AB1B8 1801A497 */  lhu        $4, 0x118($sp)
/* AB2BC 001AB1BC FF000230 */  andi       $2, $0, 0xFF
/* AB2C0 001AB1C0 00190200 */  sll        $3, $2, 4
/* AB2C4 001AB1C4 0FF00224 */  addiu      $2, $0, -0xFF1
/* AB2C8 001AB1C8 24108200 */  and        $2, $4, $2
/* AB2CC 001AB1CC 25104300 */  or         $2, $2, $3
/* AB2D0 001AB1D0 1801A2A7 */  sh         $2, 0x118($sp)
/* AB2D4 001AB1D4 28268072 */  paddub     $4, $20, $0
/* AB2D8 001AB1D8 47000524 */  addiu      $5, $0, 0x47
/* AB2DC 001AB1DC 0000C6DC */  ld         $6, 0x0($6)
/* AB2E0 001AB1E0 0A84040C */  jal        sceVif1PkAddGsAD
/* AB2E4 001AB1E4 00000000 */   nop
/* AB2E8 001AB1E8 289E0070 */  paddub     $19, $0, $0
/* AB2EC 001AB1EC 34000010 */  b          .L001AB2C0
/* AB2F0 001AB1F0 00000000 */   nop
.L001AB1F4:
/* AB2F4 001AB1F4 00A91300 */  sll        $21, $19, 4
/* AB2F8 001AB1F8 D501023C */  lui        $2, %hi(point)
/* AB2FC 001AB1FC 305E4224 */  addiu      $2, $2, %lo(point)
/* AB300 001AB200 21285500 */  addu       $5, $2, $21
/* AB304 001AB204 7000A427 */  addiu      $4, $sp, 0x70
/* AB308 001AB208 28360070 */  paddub     $6, $0, $0
/* AB30C 001AB20C A4B8040C */  jal        MGRotTransPers__FPiPfi
/* AB310 001AB210 00000000 */   nop
/* AB314 001AB214 288E4070 */  paddub     $17, $2, $0
/* AB318 001AB218 D501023C */  lui        $2, %hi(D_1D55E34)
/* AB31C 001AB21C 345E4224 */  addiu      $2, $2, %lo(D_1D55E34)
/* AB320 001AB220 21105500 */  addu       $2, $2, $21
/* AB324 001AB224 000041C4 */  lwc1       $f1, 0x0($2)
/* AB328 001AB228 389380C7 */  lwc1       $f0, -0x6CC8($gp)
/* AB32C 001AB22C 36080046 */  c.le.s     $f1, $f0
/* AB330 001AB230 01000224 */  addiu      $2, $0, 0x1
/* AB334 001AB234 02000045 */  bc1f       .L001AB240
/* AB338 001AB238 00000000 */   nop
/* AB33C 001AB23C 28160070 */  paddub     $2, $0, $0
.L001AB240:
/* AB340 001AB240 FF004230 */  andi       $2, $2, 0xFF
/* AB344 001AB244 04000524 */  addiu      $5, $0, 0x4
/* AB348 001AB248 03002012 */  beqz       $17, .L001AB258
/* AB34C 001AB24C 00000000 */   nop
/* AB350 001AB250 02004016 */  bnez       $18, .L001AB25C
/* AB354 001AB254 00000000 */   nop
.L001AB258:
/* AB358 001AB258 0C000524 */  addiu      $5, $0, 0xC
.L001AB25C:
/* AB35C 001AB25C 06000012 */  beqz       $16, .L001AB278
/* AB360 001AB260 00000000 */   nop
/* AB364 001AB264 0A004014 */  bnez       $2, .L001AB290
/* AB368 001AB268 00000000 */   nop
/* AB36C 001AB26C 0C000524 */  addiu      $5, $0, 0xC
/* AB370 001AB270 07000010 */  b          .L001AB290
/* AB374 001AB274 00000000 */   nop
.L001AB278:
/* AB378 001AB278 04004014 */  bnez       $2, .L001AB28C
/* AB37C 001AB27C 00000000 */   nop
/* AB380 001AB280 B087828F */  lw         $2, -0x7850($gp)
/* AB384 001AB284 02004014 */  bnez       $2, .L001AB290
/* AB388 001AB288 00000000 */   nop
.L001AB28C:
/* AB38C 001AB28C 0C000524 */  addiu      $5, $0, 0xC
.L001AB290:
/* AB390 001AB290 7000A38F */  lw         $3, 0x70($sp)
/* AB394 001AB294 7400A28F */  lw         $2, 0x74($sp)
/* AB398 001AB298 38140200 */  dsll       $2, $2, 16
/* AB39C 001AB29C 25186200 */  or         $3, $3, $2
/* AB3A0 001AB2A0 7800A28F */  lw         $2, 0x78($sp)
/* AB3A4 001AB2A4 3C100200 */  dsll32     $2, $2, 0
/* AB3A8 001AB2A8 25304300 */  or         $6, $2, $3
/* AB3AC 001AB2AC 28268072 */  paddub     $4, $20, $0
/* AB3B0 001AB2B0 0A84040C */  jal        sceVif1PkAddGsAD
/* AB3B4 001AB2B4 00000000 */   nop
/* AB3B8 001AB2B8 28962072 */  paddub     $18, $17, $0
/* AB3BC 001AB2BC 01007326 */  addiu      $19, $19, 0x1
.L001AB2C0:
/* AB3C0 001AB2C0 1800622A */  slti       $2, $19, 0x18
/* AB3C4 001AB2C4 CBFF4014 */  bnez       $2, .L001AB1F4
/* AB3C8 001AB2C8 00000000 */   nop
/* AB3CC 001AB2CC E88B8227 */  addiu      $2, $gp, -0x7418
/* AB3D0 001AB2D0 28268072 */  paddub     $4, $20, $0
/* AB3D4 001AB2D4 47000524 */  addiu      $5, $0, 0x47
/* AB3D8 001AB2D8 000046DC */  ld         $6, 0x0($2)
/* AB3DC 001AB2DC 0A84040C */  jal        sceVif1PkAddGsAD
/* AB3E0 001AB2E0 00000000 */   nop
/* AB3E4 001AB2E4 28268072 */  paddub     $4, $20, $0
/* AB3E8 001AB2E8 B683040C */  jal        sceVif1PkCloseGifTag
/* AB3EC 001AB2EC 00000000 */   nop
/* AB3F0 001AB2F0 28268072 */  paddub     $4, $20, $0
/* AB3F4 001AB2F4 A483040C */  jal        sceVif1PkCloseDirectCode
/* AB3F8 001AB2F8 00000000 */   nop
/* AB3FC 001AB2FC 01001124 */  addiu      $17, $0, 0x1
/* AB400 001AB300 E000A427 */  addiu      $4, $sp, 0xE0
/* AB404 001AB304 D501023C */  lui        $2, %hi(ukip)
/* AB408 001AB308 50634524 */  addiu      $5, $2, %lo(ukip)
/* AB40C 001AB30C D501023C */  lui        $2, %hi(D_1D56360)
/* AB410 001AB310 60634624 */  addiu      $6, $2, %lo(D_1D56360)
/* AB414 001AB314 D501023C */  lui        $2, %hi(D_1D56370)
/* AB418 001AB318 70634724 */  addiu      $7, $2, %lo(D_1D56370)
/* AB41C 001AB31C D501023C */  lui        $2, %hi(D_1D56380)
/* AB420 001AB320 80634824 */  addiu      $8, $2, %lo(D_1D56380)
/* AB424 001AB324 FC8B040C */  jal        VectorMax__FPfPfPfPfPf
/* AB428 001AB328 00000000 */   nop
/* AB42C 001AB32C 0A000012 */  beqz       $16, .L001AB358
/* AB430 001AB330 00000000 */   nop
/* AB434 001AB334 E400A1C7 */  lwc1       $f1, 0xE4($sp)
/* AB438 001AB338 389380C7 */  lwc1       $f0, -0x6CC8($gp)
/* AB43C 001AB33C 34080046 */  c.lt.s     $f1, $f0
/* AB440 001AB340 00000000 */  nop
/* AB444 001AB344 0E000045 */  bc1f       .L001AB380
/* AB448 001AB348 00000000 */   nop
/* AB44C 001AB34C 288E0070 */  paddub     $17, $0, $0
/* AB450 001AB350 0B000010 */  b          .L001AB380
/* AB454 001AB354 00000000 */   nop
.L001AB358:
/* AB458 001AB358 E400A1C7 */  lwc1       $f1, 0xE4($sp)
/* AB45C 001AB35C 389380C7 */  lwc1       $f0, -0x6CC8($gp)
/* AB460 001AB360 36080046 */  c.le.s     $f1, $f0
/* AB464 001AB364 00000000 */  nop
/* AB468 001AB368 04000045 */  bc1f       .L001AB37C
/* AB46C 001AB36C 00000000 */   nop
/* AB470 001AB370 B087828F */  lw         $2, -0x7850($gp)
/* AB474 001AB374 02004014 */  bnez       $2, .L001AB380
/* AB478 001AB378 00000000 */   nop
.L001AB37C:
/* AB47C 001AB37C 288E0070 */  paddub     $17, $0, $0
.L001AB380:
/* AB480 001AB380 5893828F */  lw         $2, -0x6CA8($gp)
/* AB484 001AB384 4E004010 */  beqz       $2, .L001AB4C0
/* AB488 001AB388 00000000 */   nop
/* AB48C 001AB38C 4C002012 */  beqz       $17, .L001AB4C0
/* AB490 001AB390 00000000 */   nop
/* AB494 001AB394 8000A427 */  addiu      $4, $sp, 0x80
/* AB498 001AB398 D501023C */  lui        $2, %hi(D_1D56360)
/* AB49C 001AB39C 60634524 */  addiu      $5, $2, %lo(D_1D56360)
/* AB4A0 001AB3A0 D501023C */  lui        $2, %hi(D_1D56370)
/* AB4A4 001AB3A4 70634624 */  addiu      $6, $2, %lo(D_1D56370)
/* AB4A8 001AB3A8 E885040C */  jal        sceVu0AddVector
/* AB4AC 001AB3AC 00000000 */   nop
/* AB4B0 001AB3B0 8000A427 */  addiu      $4, $sp, 0x80
/* AB4B4 001AB3B4 282E8070 */  paddub     $5, $4, $0
/* AB4B8 001AB3B8 D501023C */  lui        $2, %hi(D_1D56380)
/* AB4BC 001AB3BC 80634624 */  addiu      $6, $2, %lo(D_1D56380)
/* AB4C0 001AB3C0 E885040C */  jal        sceVu0AddVector
/* AB4C4 001AB3C4 00000000 */   nop
/* AB4C8 001AB3C8 8000A427 */  addiu      $4, $sp, 0x80
/* AB4CC 001AB3CC 282E8070 */  paddub     $5, $4, $0
/* AB4D0 001AB3D0 70838CC7 */  lwc1       $f12, -0x7C90($gp)
/* AB4D4 001AB3D4 FA85040C */  jal        sceVu0ScaleVector
/* AB4D8 001AB3D8 00000000 */   nop
/* AB4DC 001AB3DC 9000A427 */  addiu      $4, $sp, 0x90
/* AB4E0 001AB3E0 D501023C */  lui        $2, %hi(ukip)
/* AB4E4 001AB3E4 50634524 */  addiu      $5, $2, %lo(ukip)
/* AB4E8 001AB3E8 8000A627 */  addiu      $6, $sp, 0x80
/* AB4EC 001AB3EC EE85040C */  jal        sceVu0SubVector
/* AB4F0 001AB3F0 00000000 */   nop
/* AB4F4 001AB3F4 B000B227 */  addiu      $18, $sp, 0xB0
/* AB4F8 001AB3F8 28264072 */  paddub     $4, $18, $0
/* AB4FC 001AB3FC 9000A527 */  addiu      $5, $sp, 0x90
/* AB500 001AB400 9285040C */  jal        sceVu0Normalize
/* AB504 001AB404 00000000 */   nop
/* AB508 001AB408 BC00A0AF */  sw         $0, 0xBC($sp)
/* AB50C 001AB40C 9000A427 */  addiu      $4, $sp, 0x90
/* AB510 001AB410 8000A527 */  addiu      $5, $sp, 0x80
/* AB514 001AB414 D501023C */  lui        $2, %hi(D_1D56360)
/* AB518 001AB418 60634624 */  addiu      $6, $2, %lo(D_1D56360)
/* AB51C 001AB41C EE85040C */  jal        sceVu0SubVector
/* AB520 001AB420 00000000 */   nop
/* AB524 001AB424 C000B127 */  addiu      $17, $sp, 0xC0
/* AB528 001AB428 28262072 */  paddub     $4, $17, $0
/* AB52C 001AB42C 9000A527 */  addiu      $5, $sp, 0x90
/* AB530 001AB430 9285040C */  jal        sceVu0Normalize
/* AB534 001AB434 00000000 */   nop
/* AB538 001AB438 A000A427 */  addiu      $4, $sp, 0xA0
/* AB53C 001AB43C 282E4072 */  paddub     $5, $18, $0
/* AB540 001AB440 28362072 */  paddub     $6, $17, $0
/* AB544 001AB444 8085040C */  jal        sceVu0OuterProduct
/* AB548 001AB448 00000000 */   nop
/* AB54C 001AB44C AC00A0AF */  sw         $0, 0xAC($sp)
/* AB550 001AB450 D800A0AF */  sw         $0, 0xD8($sp)
/* AB554 001AB454 D400A0AF */  sw         $0, 0xD4($sp)
/* AB558 001AB458 D000A0AF */  sw         $0, 0xD0($sp)
/* AB55C 001AB45C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* AB560 001AB460 DC00A2AF */  sw         $2, 0xDC($sp)
/* AB564 001AB464 D501023C */  lui        $2, %hi(UkiFrameTop)
/* AB568 001AB468 104A4424 */  addiu      $4, $2, %lo(UkiFrameTop)
/* AB56C 001AB46C 8CA8040C */  jal        Initialize__9CFrameVu1Fv
/* AB570 001AB470 00000000 */   nop
/* AB574 001AB474 D501023C */  lui        $2, %hi(UkiFrameTop)
/* AB578 001AB478 104A4424 */  addiu      $4, $2, %lo(UkiFrameTop)
/* AB57C 001AB47C A000A527 */  addiu      $5, $sp, 0xA0
/* AB580 001AB480 58A1040C */  jal        SetTransMatrix__6CFrameFPA4_f
/* AB584 001AB484 00000000 */   nop
/* AB588 001AB488 D501023C */  lui        $2, %hi(UkiFrameTop)
/* AB58C 001AB48C 104A4424 */  addiu      $4, $2, %lo(UkiFrameTop)
/* AB590 001AB490 D501023C */  lui        $2, %hi(ukip)
/* AB594 001AB494 50634524 */  addiu      $5, $2, %lo(ukip)
/* AB598 001AB498 B89F040C */  jal        SetPosition__6CFrameFPf
/* AB59C 001AB49C 00000000 */   nop
/* AB5A0 001AB4A0 5893848F */  lw         $4, -0x6CA8($gp)
/* AB5A4 001AB4A4 D501023C */  lui        $2, %hi(UkiFrameTop)
/* AB5A8 001AB4A8 104A4524 */  addiu      $5, $2, %lo(UkiFrameTop)
/* AB5AC 001AB4AC 60A0040C */  jal        SetReference__6CFrameFP6CFrame
/* AB5B0 001AB4B0 00000000 */   nop
/* AB5B4 001AB4B4 5893848F */  lw         $4, -0x6CA8($gp)
/* AB5B8 001AB4B8 60BB040C */  jal        MGDraw__FP6CFrame
/* AB5BC 001AB4BC 00000000 */   nop
.L001AB4C0:
/* AB5C0 001AB4C0 01001124 */  addiu      $17, $0, 0x1
/* AB5C4 001AB4C4 F000A427 */  addiu      $4, $sp, 0xF0
/* AB5C8 001AB4C8 D501023C */  lui        $2, %hi(hookp)
/* AB5CC 001AB4CC B0624524 */  addiu      $5, $2, %lo(hookp)
/* AB5D0 001AB4D0 D501023C */  lui        $2, %hi(D_1D562C0)
/* AB5D4 001AB4D4 C0624624 */  addiu      $6, $2, %lo(D_1D562C0)
/* AB5D8 001AB4D8 D501023C */  lui        $2, %hi(D_1D562D0)
/* AB5DC 001AB4DC D0624724 */  addiu      $7, $2, %lo(D_1D562D0)
/* AB5E0 001AB4E0 F48B040C */  jal        VectorMax__FPfPfPfPf
/* AB5E4 001AB4E4 00000000 */   nop
/* AB5E8 001AB4E8 0A000012 */  beqz       $16, .L001AB514
/* AB5EC 001AB4EC 00000000 */   nop
/* AB5F0 001AB4F0 F400A1C7 */  lwc1       $f1, 0xF4($sp)
/* AB5F4 001AB4F4 389380C7 */  lwc1       $f0, -0x6CC8($gp)
/* AB5F8 001AB4F8 34080046 */  c.lt.s     $f1, $f0
/* AB5FC 001AB4FC 00000000 */  nop
/* AB600 001AB500 0E000045 */  bc1f       .L001AB53C
/* AB604 001AB504 00000000 */   nop
/* AB608 001AB508 288E0070 */  paddub     $17, $0, $0
/* AB60C 001AB50C 0B000010 */  b          .L001AB53C
/* AB610 001AB510 00000000 */   nop
.L001AB514:
/* AB614 001AB514 F400A1C7 */  lwc1       $f1, 0xF4($sp)
/* AB618 001AB518 389380C7 */  lwc1       $f0, -0x6CC8($gp)
/* AB61C 001AB51C 36080046 */  c.le.s     $f1, $f0
/* AB620 001AB520 00000000 */  nop
/* AB624 001AB524 04000045 */  bc1f       .L001AB538
/* AB628 001AB528 00000000 */   nop
/* AB62C 001AB52C B087838F */  lw         $3, -0x7850($gp)
/* AB630 001AB530 02006014 */  bnez       $3, .L001AB53C
/* AB634 001AB534 00000000 */   nop
.L001AB538:
/* AB638 001AB538 288E0070 */  paddub     $17, $0, $0
.L001AB53C:
/* AB63C 001AB53C 5493838F */  lw         $3, -0x6CAC($gp)
/* AB640 001AB540 74006010 */  beqz       $3, .L001AB714
/* AB644 001AB544 00000000 */   nop
/* AB648 001AB548 72002012 */  beqz       $17, .L001AB714
/* AB64C 001AB54C 00000000 */   nop
/* AB650 001AB550 8000A427 */  addiu      $4, $sp, 0x80
/* AB654 001AB554 D501023C */  lui        $2, %hi(D_1D562C0)
/* AB658 001AB558 C0624524 */  addiu      $5, $2, %lo(D_1D562C0)
/* AB65C 001AB55C D501023C */  lui        $2, %hi(D_1D562D0)
/* AB660 001AB560 D0624624 */  addiu      $6, $2, %lo(D_1D562D0)
/* AB664 001AB564 E885040C */  jal        sceVu0AddVector
/* AB668 001AB568 00000000 */   nop
/* AB66C 001AB56C 003F023C */  lui        $2, (0x3F000000 >> 16)
/* AB670 001AB570 00608244 */  mtc1       $2, $f12
/* AB674 001AB574 8000A427 */  addiu      $4, $sp, 0x80
/* AB678 001AB578 282E8070 */  paddub     $5, $4, $0
/* AB67C 001AB57C FA85040C */  jal        sceVu0ScaleVector
/* AB680 001AB580 00000000 */   nop
/* AB684 001AB584 9000A427 */  addiu      $4, $sp, 0x90
/* AB688 001AB588 D501023C */  lui        $2, %hi(hookp)
/* AB68C 001AB58C B0624524 */  addiu      $5, $2, %lo(hookp)
/* AB690 001AB590 8000A627 */  addiu      $6, $sp, 0x80
/* AB694 001AB594 EE85040C */  jal        sceVu0SubVector
/* AB698 001AB598 00000000 */   nop
/* AB69C 001AB59C B000B127 */  addiu      $17, $sp, 0xB0
/* AB6A0 001AB5A0 28262072 */  paddub     $4, $17, $0
/* AB6A4 001AB5A4 9000A527 */  addiu      $5, $sp, 0x90
/* AB6A8 001AB5A8 9285040C */  jal        sceVu0Normalize
/* AB6AC 001AB5AC 00000000 */   nop
/* AB6B0 001AB5B0 BC00A0AF */  sw         $0, 0xBC($sp)
/* AB6B4 001AB5B4 8000A427 */  addiu      $4, $sp, 0x80
/* AB6B8 001AB5B8 D501023C */  lui        $2, %hi(D_1D562C0)
/* AB6BC 001AB5BC C0624524 */  addiu      $5, $2, %lo(D_1D562C0)
/* AB6C0 001AB5C0 D501023C */  lui        $2, %hi(hookp)
/* AB6C4 001AB5C4 B0624624 */  addiu      $6, $2, %lo(hookp)
/* AB6C8 001AB5C8 EE85040C */  jal        sceVu0SubVector
/* AB6CC 001AB5CC 00000000 */   nop
/* AB6D0 001AB5D0 9000A427 */  addiu      $4, $sp, 0x90
/* AB6D4 001AB5D4 D501023C */  lui        $2, %hi(D_1D562D0)
/* AB6D8 001AB5D8 D0624524 */  addiu      $5, $2, %lo(D_1D562D0)
/* AB6DC 001AB5DC D501023C */  lui        $2, %hi(hookp)
/* AB6E0 001AB5E0 B0624624 */  addiu      $6, $2, %lo(hookp)
/* AB6E4 001AB5E4 EE85040C */  jal        sceVu0SubVector
/* AB6E8 001AB5E8 00000000 */   nop
/* AB6EC 001AB5EC C000B027 */  addiu      $16, $sp, 0xC0
/* AB6F0 001AB5F0 28260072 */  paddub     $4, $16, $0
/* AB6F4 001AB5F4 8000A527 */  addiu      $5, $sp, 0x80
/* AB6F8 001AB5F8 9000A627 */  addiu      $6, $sp, 0x90
/* AB6FC 001AB5FC 8085040C */  jal        sceVu0OuterProduct
/* AB700 001AB600 00000000 */   nop
/* AB704 001AB604 28260072 */  paddub     $4, $16, $0
/* AB708 001AB608 282E0072 */  paddub     $5, $16, $0
/* AB70C 001AB60C 9285040C */  jal        sceVu0Normalize
/* AB710 001AB610 00000000 */   nop
/* AB714 001AB614 CC00A0AF */  sw         $0, 0xCC($sp)
/* AB718 001AB618 A000A427 */  addiu      $4, $sp, 0xA0
/* AB71C 001AB61C 282E2072 */  paddub     $5, $17, $0
/* AB720 001AB620 28360072 */  paddub     $6, $16, $0
/* AB724 001AB624 8085040C */  jal        sceVu0OuterProduct
/* AB728 001AB628 00000000 */   nop
/* AB72C 001AB62C AC00A0AF */  sw         $0, 0xAC($sp)
/* AB730 001AB630 D800A0AF */  sw         $0, 0xD8($sp)
/* AB734 001AB634 D400A0AF */  sw         $0, 0xD4($sp)
/* AB738 001AB638 D000A0AF */  sw         $0, 0xD0($sp)
/* AB73C 001AB63C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* AB740 001AB640 DC00A2AF */  sw         $2, 0xDC($sp)
/* AB744 001AB644 5493848F */  lw         $4, -0x6CAC($gp)
/* AB748 001AB648 A000A527 */  addiu      $5, $sp, 0xA0
/* AB74C 001AB64C 58A1040C */  jal        SetTransMatrix__6CFrameFPA4_f
/* AB750 001AB650 00000000 */   nop
/* AB754 001AB654 5493848F */  lw         $4, -0x6CAC($gp)
/* AB758 001AB658 D501023C */  lui        $2, %hi(hookp)
/* AB75C 001AB65C B0624524 */  addiu      $5, $2, %lo(hookp)
/* AB760 001AB660 B89F040C */  jal        SetPosition__6CFrameFPf
/* AB764 001AB664 00000000 */   nop
/* AB768 001AB668 5493848F */  lw         $4, -0x6CAC($gp)
/* AB76C 001AB66C 60BB040C */  jal        MGDraw__FP6CFrame
/* AB770 001AB670 00000000 */   nop
/* AB774 001AB674 4C93838F */  lw         $3, -0x6CB4($gp)
/* AB778 001AB678 26006010 */  beqz       $3, .L001AB714
/* AB77C 001AB67C 00000000 */   nop
/* AB780 001AB680 0001A427 */  addiu      $4, $sp, 0x100
/* AB784 001AB684 D501023C */  lui        $2, %hi(hookp)
/* AB788 001AB688 B0624524 */  addiu      $5, $2, %lo(hookp)
/* AB78C 001AB68C D501023C */  lui        $2, %hi(D_1D562C0)
/* AB790 001AB690 C0624624 */  addiu      $6, $2, %lo(D_1D562C0)
/* AB794 001AB694 E885040C */  jal        sceVu0AddVector
/* AB798 001AB698 00000000 */   nop
/* AB79C 001AB69C 0001A427 */  addiu      $4, $sp, 0x100
/* AB7A0 001AB6A0 282E8070 */  paddub     $5, $4, $0
/* AB7A4 001AB6A4 D501023C */  lui        $2, %hi(D_1D562D0)
/* AB7A8 001AB6A8 D0624624 */  addiu      $6, $2, %lo(D_1D562D0)
/* AB7AC 001AB6AC E885040C */  jal        sceVu0AddVector
/* AB7B0 001AB6B0 00000000 */   nop
/* AB7B4 001AB6B4 0001A427 */  addiu      $4, $sp, 0x100
/* AB7B8 001AB6B8 282E8070 */  paddub     $5, $4, $0
/* AB7BC 001AB6BC 74838CC7 */  lwc1       $f12, -0x7C8C($gp)
/* AB7C0 001AB6C0 FA85040C */  jal        sceVu0ScaleVector
/* AB7C4 001AB6C4 00000000 */   nop
/* AB7C8 001AB6C8 4C93848F */  lw         $4, -0x6CB4($gp)
/* AB7CC 001AB6CC A000A527 */  addiu      $5, $sp, 0xA0
/* AB7D0 001AB6D0 58A1040C */  jal        SetTransMatrix__6CFrameFPA4_f
/* AB7D4 001AB6D4 00000000 */   nop
/* AB7D8 001AB6D8 4C93848F */  lw         $4, -0x6CB4($gp)
/* AB7DC 001AB6DC 0001A527 */  addiu      $5, $sp, 0x100
/* AB7E0 001AB6E0 B89F040C */  jal        SetPosition__6CFrameFPf
/* AB7E4 001AB6E4 00000000 */   nop
/* AB7E8 001AB6E8 A0B8040C */  jal        GetVif1Packet__Fv
/* AB7EC 001AB6EC 00000000 */   nop
/* AB7F0 001AB6F0 C701033C */  lui        $3, %hi(TexManager)
/* AB7F4 001AB6F4 70586424 */  addiu      $4, $3, %lo(TexManager)
/* AB7F8 001AB6F8 282E4070 */  paddub     $5, $2, $0
/* AB7FC 001AB6FC 6493868F */  lw         $6, -0x6C9C($gp)
/* AB800 001AB700 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* AB804 001AB704 00000000 */   nop
/* AB808 001AB708 4C93848F */  lw         $4, -0x6CB4($gp)
/* AB80C 001AB70C 60BB040C */  jal        MGDraw__FP6CFrame
/* AB810 001AB710 00000000 */   nop
.L001AB714:
/* AB814 001AB714 6000BF7B */  lq         $31, 0x60($sp)
/* AB818 001AB718 5000B57B */  lq         $21, 0x50($sp)
/* AB81C 001AB71C 4000B47B */  lq         $20, 0x40($sp)
/* AB820 001AB720 3000B37B */  lq         $19, 0x30($sp)
/* AB824 001AB724 2000B27B */  lq         $18, 0x20($sp)
/* AB828 001AB728 1000B17B */  lq         $17, 0x10($sp)
/* AB82C 001AB72C 0000B07B */  lq         $16, 0x0($sp)
/* AB830 001AB730 2001BD27 */  addiu      $sp, $sp, 0x120
/* AB834 001AB734 0800E003 */  jr         $31
/* AB838 001AB738 00000000 */   nop
/* AB83C 001AB73C 00000000 */  nop
