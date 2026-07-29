.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel FishLineDraw__Fi
/* 0AB1F0 001AB0F0 E0FEBD27 */  addiu       $29, $29, -0x120
/* 0AB1F4 001AB0F4 6000BF7F */  sq          $31, 0x60($29)
/* 0AB1F8 001AB0F8 5000B57F */  sq          $21, 0x50($29)
/* 0AB1FC 001AB0FC 4000B47F */  sq          $20, 0x40($29)
/* 0AB200 001AB100 3000B37F */  sq          $19, 0x30($29)
/* 0AB204 001AB104 2000B27F */  sq          $18, 0x20($29)
/* 0AB208 001AB108 1000B17F */  sq          $17, 0x10($29)
/* 0AB20C 001AB10C 0000B07F */  sq          $16, 0x0($29)
/* 0AB210 001AB110 28868070 */  paddub      $16, $4, $0
/* 0AB214 001AB114 A0B8040C */  jal         GetVif1Packet__Fv
/* 0AB218 001AB118 00000000 */   nop
/* 0AB21C 001AB11C C701033C */  lui         $3, %hi(TexManager)
/* 0AB220 001AB120 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 0AB224 001AB124 282E4070 */  paddub      $5, $2, $0
/* 0AB228 001AB128 5C93868F */  lw          $6, -0x6CA4($28)
/* 0AB22C 001AB12C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0AB230 001AB130 00000000 */   nop
/* 0AB234 001AB134 28960070 */  paddub      $18, $0, $0
/* 0AB238 001AB138 A0B8040C */  jal         GetVif1Packet__Fv
/* 0AB23C 001AB13C 00000000 */   nop
/* 0AB240 001AB140 28A64070 */  paddub      $20, $2, $0
/* 0AB244 001AB144 28268072 */  paddub      $4, $20, $0
/* 0AB248 001AB148 282E0070 */  paddub      $5, $0, $0
/* 0AB24C 001AB14C 2083040C */  jal         sceVif1PkCnt
/* 0AB250 001AB150 00000000 */   nop
/* 0AB254 001AB154 28268072 */  paddub      $4, $20, $0
/* 0AB258 001AB158 282E0070 */  paddub      $5, $0, $0
/* 0AB25C 001AB15C 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 0AB260 001AB160 00000000 */   nop
/* 0AB264 001AB164 C701023C */  lui         $2, %hi(GiftagAD)
/* 0AB268 001AB168 C0524224 */  addiu       $2, $2, %lo(GiftagAD)
/* 0AB26C 001AB16C 28268072 */  paddub      $4, $20, $0
/* 0AB270 001AB170 00004578 */  lq          $5, 0x0($2)
/* 0AB274 001AB174 B083040C */  jal         sceVif1PkOpenGifTag
/* 0AB278 001AB178 00000000 */   nop
/* 0AB27C 001AB17C 28268072 */  paddub      $4, $20, $0
/* 0AB280 001AB180 282E0070 */  paddub      $5, $0, $0
/* 0AB284 001AB184 4A010624 */  addiu       $6, $0, 0x14A
/* 0AB288 001AB188 0A84040C */  jal         sceVif1PkAddGsAD
/* 0AB28C 001AB18C 00000000 */   nop
/* 0AB290 001AB190 28268072 */  paddub      $4, $20, $0
/* 0AB294 001AB194 01000524 */  addiu       $5, $0, 0x1
/* 0AB298 001AB198 80800234 */  ori         $2, $0, 0x8080
/* 0AB29C 001AB19C 38140200 */  dsll        $2, $2, 16
/* 0AB2A0 001AB1A0 80804634 */  ori         $6, $2, 0x8080
/* 0AB2A4 001AB1A4 0A84040C */  jal         sceVif1PkAddGsAD
/* 0AB2A8 001AB1A8 00000000 */   nop
/* 0AB2AC 001AB1AC 1801A627 */  addiu       $6, $29, 0x118
/* 0AB2B0 001AB1B0 E88B82DF */  ld          $2, -0x7418($28)
/* 0AB2B4 001AB1B4 0000C2FC */  sd          $2, 0x0($6)
/* 0AB2B8 001AB1B8 1801A497 */  lhu         $4, 0x118($29)
/* 0AB2BC 001AB1BC FF000230 */  andi        $2, $0, 0xFF
/* 0AB2C0 001AB1C0 00190200 */  sll         $3, $2, 4
/* 0AB2C4 001AB1C4 0FF00224 */  addiu       $2, $0, -0xFF1
/* 0AB2C8 001AB1C8 24108200 */  and         $2, $4, $2
/* 0AB2CC 001AB1CC 25104300 */  or          $2, $2, $3
/* 0AB2D0 001AB1D0 1801A2A7 */  sh          $2, 0x118($29)
/* 0AB2D4 001AB1D4 28268072 */  paddub      $4, $20, $0
/* 0AB2D8 001AB1D8 47000524 */  addiu       $5, $0, 0x47
/* 0AB2DC 001AB1DC 0000C6DC */  ld          $6, 0x0($6)
/* 0AB2E0 001AB1E0 0A84040C */  jal         sceVif1PkAddGsAD
/* 0AB2E4 001AB1E4 00000000 */   nop
/* 0AB2E8 001AB1E8 289E0070 */  paddub      $19, $0, $0
/* 0AB2EC 001AB1EC 34000010 */  b           .L001AB2C0
/* 0AB2F0 001AB1F0 00000000 */   nop
.L001AB1F4:
/* 0AB2F4 001AB1F4 00A91300 */  sll         $21, $19, 4
/* 0AB2F8 001AB1F8 D501023C */  lui         $2, %hi(point)
/* 0AB2FC 001AB1FC 305E4224 */  addiu       $2, $2, %lo(point)
/* 0AB300 001AB200 21285500 */  addu        $5, $2, $21
/* 0AB304 001AB204 7000A427 */  addiu       $4, $29, 0x70
/* 0AB308 001AB208 28360070 */  paddub      $6, $0, $0
/* 0AB30C 001AB20C A4B8040C */  jal         MGRotTransPers__FPiPfi
/* 0AB310 001AB210 00000000 */   nop
/* 0AB314 001AB214 288E4070 */  paddub      $17, $2, $0
/* 0AB318 001AB218 D501023C */  lui         $2, %hi(point + 0x4)
/* 0AB31C 001AB21C 345E4224 */  addiu       $2, $2, %lo(point + 0x4)
/* 0AB320 001AB220 21105500 */  addu        $2, $2, $21
/* 0AB324 001AB224 000041C4 */  lwc1        $f1, 0x0($2)
/* 0AB328 001AB228 389380C7 */  lwc1        $f0, -0x6CC8($28)
/* 0AB32C 001AB22C 36080046 */  c.le.s      $f1, $f0
/* 0AB330 001AB230 01000224 */  addiu       $2, $0, 0x1
/* 0AB334 001AB234 02000045 */  bc1f        .L001AB240
/* 0AB338 001AB238 00000000 */   nop
/* 0AB33C 001AB23C 28160070 */  paddub      $2, $0, $0
.L001AB240:
/* 0AB340 001AB240 FF004230 */  andi        $2, $2, 0xFF
/* 0AB344 001AB244 04000524 */  addiu       $5, $0, 0x4
/* 0AB348 001AB248 03002012 */  beqz        $17, .L001AB258
/* 0AB34C 001AB24C 00000000 */   nop
/* 0AB350 001AB250 02004016 */  bnez        $18, .L001AB25C
/* 0AB354 001AB254 00000000 */   nop
.L001AB258:
/* 0AB358 001AB258 0C000524 */  addiu       $5, $0, 0xC
.L001AB25C:
/* 0AB35C 001AB25C 06000012 */  beqz        $16, .L001AB278
/* 0AB360 001AB260 00000000 */   nop
/* 0AB364 001AB264 0A004014 */  bnez        $2, .L001AB290
/* 0AB368 001AB268 00000000 */   nop
/* 0AB36C 001AB26C 0C000524 */  addiu       $5, $0, 0xC
/* 0AB370 001AB270 07000010 */  b           .L001AB290
/* 0AB374 001AB274 00000000 */   nop
.L001AB278:
/* 0AB378 001AB278 04004014 */  bnez        $2, .L001AB28C
/* 0AB37C 001AB27C 00000000 */   nop
/* 0AB380 001AB280 B087828F */  lw          $2, -0x7850($28)
/* 0AB384 001AB284 02004014 */  bnez        $2, .L001AB290
/* 0AB388 001AB288 00000000 */   nop
.L001AB28C:
/* 0AB38C 001AB28C 0C000524 */  addiu       $5, $0, 0xC
.L001AB290:
/* 0AB390 001AB290 7000A38F */  lw          $3, 0x70($29)
/* 0AB394 001AB294 7400A28F */  lw          $2, 0x74($29)
/* 0AB398 001AB298 38140200 */  dsll        $2, $2, 16
/* 0AB39C 001AB29C 25186200 */  or          $3, $3, $2
/* 0AB3A0 001AB2A0 7800A28F */  lw          $2, 0x78($29)
/* 0AB3A4 001AB2A4 3C100200 */  dsll32      $2, $2, 0
/* 0AB3A8 001AB2A8 25304300 */  or          $6, $2, $3
/* 0AB3AC 001AB2AC 28268072 */  paddub      $4, $20, $0
/* 0AB3B0 001AB2B0 0A84040C */  jal         sceVif1PkAddGsAD
/* 0AB3B4 001AB2B4 00000000 */   nop
/* 0AB3B8 001AB2B8 28962072 */  paddub      $18, $17, $0
/* 0AB3BC 001AB2BC 01007326 */  addiu       $19, $19, 0x1
.L001AB2C0:
/* 0AB3C0 001AB2C0 1800622A */  slti        $2, $19, 0x18
/* 0AB3C4 001AB2C4 CBFF4014 */  bnez        $2, .L001AB1F4
/* 0AB3C8 001AB2C8 00000000 */   nop
/* 0AB3CC 001AB2CC E88B8227 */  addiu       $2, $28, -0x7418
/* 0AB3D0 001AB2D0 28268072 */  paddub      $4, $20, $0
/* 0AB3D4 001AB2D4 47000524 */  addiu       $5, $0, 0x47
/* 0AB3D8 001AB2D8 000046DC */  ld          $6, 0x0($2)
/* 0AB3DC 001AB2DC 0A84040C */  jal         sceVif1PkAddGsAD
/* 0AB3E0 001AB2E0 00000000 */   nop
/* 0AB3E4 001AB2E4 28268072 */  paddub      $4, $20, $0
/* 0AB3E8 001AB2E8 B683040C */  jal         sceVif1PkCloseGifTag
/* 0AB3EC 001AB2EC 00000000 */   nop
/* 0AB3F0 001AB2F0 28268072 */  paddub      $4, $20, $0
/* 0AB3F4 001AB2F4 A483040C */  jal         sceVif1PkCloseDirectCode
/* 0AB3F8 001AB2F8 00000000 */   nop
/* 0AB3FC 001AB2FC 01001124 */  addiu       $17, $0, 0x1
/* 0AB400 001AB300 E000A427 */  addiu       $4, $29, 0xE0
/* 0AB404 001AB304 D501023C */  lui         $2, %hi(ukip)
/* 0AB408 001AB308 50634524 */  addiu       $5, $2, %lo(ukip)
/* 0AB40C 001AB30C D501023C */  lui         $2, %hi(ukip + 0x10)
/* 0AB410 001AB310 60634624 */  addiu       $6, $2, %lo(ukip + 0x10)
/* 0AB414 001AB314 D501023C */  lui         $2, %hi(ukip + 0x20)
/* 0AB418 001AB318 70634724 */  addiu       $7, $2, %lo(ukip + 0x20)
/* 0AB41C 001AB31C D501023C */  lui         $2, %hi(ukip + 0x30)
/* 0AB420 001AB320 80634824 */  addiu       $8, $2, %lo(ukip + 0x30)
/* 0AB424 001AB324 FC8B040C */  jal         VectorMax__FPfPfPfPfPf
/* 0AB428 001AB328 00000000 */   nop
/* 0AB42C 001AB32C 0A000012 */  beqz        $16, .L001AB358
/* 0AB430 001AB330 00000000 */   nop
/* 0AB434 001AB334 E400A1C7 */  lwc1        $f1, 0xE4($29)
/* 0AB438 001AB338 389380C7 */  lwc1        $f0, -0x6CC8($28)
/* 0AB43C 001AB33C 34080046 */  c.lt.s      $f1, $f0
/* 0AB440 001AB340 00000000 */  nop
/* 0AB444 001AB344 0E000045 */  bc1f        .L001AB380
/* 0AB448 001AB348 00000000 */   nop
/* 0AB44C 001AB34C 288E0070 */  paddub      $17, $0, $0
/* 0AB450 001AB350 0B000010 */  b           .L001AB380
/* 0AB454 001AB354 00000000 */   nop
.L001AB358:
/* 0AB458 001AB358 E400A1C7 */  lwc1        $f1, 0xE4($29)
/* 0AB45C 001AB35C 389380C7 */  lwc1        $f0, -0x6CC8($28)
/* 0AB460 001AB360 36080046 */  c.le.s      $f1, $f0
/* 0AB464 001AB364 00000000 */  nop
/* 0AB468 001AB368 04000045 */  bc1f        .L001AB37C
/* 0AB46C 001AB36C 00000000 */   nop
/* 0AB470 001AB370 B087828F */  lw          $2, -0x7850($28)
/* 0AB474 001AB374 02004014 */  bnez        $2, .L001AB380
/* 0AB478 001AB378 00000000 */   nop
.L001AB37C:
/* 0AB47C 001AB37C 288E0070 */  paddub      $17, $0, $0
.L001AB380:
/* 0AB480 001AB380 5893828F */  lw          $2, -0x6CA8($28)
/* 0AB484 001AB384 4E004010 */  beqz        $2, .L001AB4C0
/* 0AB488 001AB388 00000000 */   nop
/* 0AB48C 001AB38C 4C002012 */  beqz        $17, .L001AB4C0
/* 0AB490 001AB390 00000000 */   nop
/* 0AB494 001AB394 8000A427 */  addiu       $4, $29, 0x80
/* 0AB498 001AB398 D501023C */  lui         $2, %hi(ukip + 0x10)
/* 0AB49C 001AB39C 60634524 */  addiu       $5, $2, %lo(ukip + 0x10)
/* 0AB4A0 001AB3A0 D501023C */  lui         $2, %hi(ukip + 0x20)
/* 0AB4A4 001AB3A4 70634624 */  addiu       $6, $2, %lo(ukip + 0x20)
/* 0AB4A8 001AB3A8 E885040C */  jal         sceVu0AddVector
/* 0AB4AC 001AB3AC 00000000 */   nop
/* 0AB4B0 001AB3B0 8000A427 */  addiu       $4, $29, 0x80
/* 0AB4B4 001AB3B4 282E8070 */  paddub      $5, $4, $0
/* 0AB4B8 001AB3B8 D501023C */  lui         $2, %hi(ukip + 0x30)
/* 0AB4BC 001AB3BC 80634624 */  addiu       $6, $2, %lo(ukip + 0x30)
/* 0AB4C0 001AB3C0 E885040C */  jal         sceVu0AddVector
/* 0AB4C4 001AB3C4 00000000 */   nop
/* 0AB4C8 001AB3C8 8000A427 */  addiu       $4, $29, 0x80
/* 0AB4CC 001AB3CC 282E8070 */  paddub      $5, $4, $0
/* 0AB4D0 001AB3D0 70838CC7 */  lwc1        $f12, -0x7C90($28)
/* 0AB4D4 001AB3D4 FA85040C */  jal         sceVu0ScaleVector
/* 0AB4D8 001AB3D8 00000000 */   nop
/* 0AB4DC 001AB3DC 9000A427 */  addiu       $4, $29, 0x90
/* 0AB4E0 001AB3E0 D501023C */  lui         $2, %hi(ukip)
/* 0AB4E4 001AB3E4 50634524 */  addiu       $5, $2, %lo(ukip)
/* 0AB4E8 001AB3E8 8000A627 */  addiu       $6, $29, 0x80
/* 0AB4EC 001AB3EC EE85040C */  jal         sceVu0SubVector
/* 0AB4F0 001AB3F0 00000000 */   nop
/* 0AB4F4 001AB3F4 B000B227 */  addiu       $18, $29, 0xB0
/* 0AB4F8 001AB3F8 28264072 */  paddub      $4, $18, $0
/* 0AB4FC 001AB3FC 9000A527 */  addiu       $5, $29, 0x90
/* 0AB500 001AB400 9285040C */  jal         sceVu0Normalize
/* 0AB504 001AB404 00000000 */   nop
/* 0AB508 001AB408 BC00A0AF */  sw          $0, 0xBC($29)
/* 0AB50C 001AB40C 9000A427 */  addiu       $4, $29, 0x90
/* 0AB510 001AB410 8000A527 */  addiu       $5, $29, 0x80
/* 0AB514 001AB414 D501023C */  lui         $2, %hi(ukip + 0x10)
/* 0AB518 001AB418 60634624 */  addiu       $6, $2, %lo(ukip + 0x10)
/* 0AB51C 001AB41C EE85040C */  jal         sceVu0SubVector
/* 0AB520 001AB420 00000000 */   nop
/* 0AB524 001AB424 C000B127 */  addiu       $17, $29, 0xC0
/* 0AB528 001AB428 28262072 */  paddub      $4, $17, $0
/* 0AB52C 001AB42C 9000A527 */  addiu       $5, $29, 0x90
/* 0AB530 001AB430 9285040C */  jal         sceVu0Normalize
/* 0AB534 001AB434 00000000 */   nop
/* 0AB538 001AB438 A000A427 */  addiu       $4, $29, 0xA0
/* 0AB53C 001AB43C 282E4072 */  paddub      $5, $18, $0
/* 0AB540 001AB440 28362072 */  paddub      $6, $17, $0
/* 0AB544 001AB444 8085040C */  jal         sceVu0OuterProduct
/* 0AB548 001AB448 00000000 */   nop
/* 0AB54C 001AB44C AC00A0AF */  sw          $0, 0xAC($29)
/* 0AB550 001AB450 D800A0AF */  sw          $0, 0xD8($29)
/* 0AB554 001AB454 D400A0AF */  sw          $0, 0xD4($29)
/* 0AB558 001AB458 D000A0AF */  sw          $0, 0xD0($29)
/* 0AB55C 001AB45C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0AB560 001AB460 DC00A2AF */  sw          $2, 0xDC($29)
/* 0AB564 001AB464 D501023C */  lui         $2, %hi(UkiFrameTop)
/* 0AB568 001AB468 104A4424 */  addiu       $4, $2, %lo(UkiFrameTop)
/* 0AB56C 001AB46C 8CA8040C */  jal         Initialize__9CFrameVu1Fv
/* 0AB570 001AB470 00000000 */   nop
/* 0AB574 001AB474 D501023C */  lui         $2, %hi(UkiFrameTop)
/* 0AB578 001AB478 104A4424 */  addiu       $4, $2, %lo(UkiFrameTop)
/* 0AB57C 001AB47C A000A527 */  addiu       $5, $29, 0xA0
/* 0AB580 001AB480 58A1040C */  jal         SetTransMatrix__6CFrameFPA4_f
/* 0AB584 001AB484 00000000 */   nop
/* 0AB588 001AB488 D501023C */  lui         $2, %hi(UkiFrameTop)
/* 0AB58C 001AB48C 104A4424 */  addiu       $4, $2, %lo(UkiFrameTop)
/* 0AB590 001AB490 D501023C */  lui         $2, %hi(ukip)
/* 0AB594 001AB494 50634524 */  addiu       $5, $2, %lo(ukip)
/* 0AB598 001AB498 B89F040C */  jal         SetPosition__6CFrameFPf
/* 0AB59C 001AB49C 00000000 */   nop
/* 0AB5A0 001AB4A0 5893848F */  lw          $4, -0x6CA8($28)
/* 0AB5A4 001AB4A4 D501023C */  lui         $2, %hi(UkiFrameTop)
/* 0AB5A8 001AB4A8 104A4524 */  addiu       $5, $2, %lo(UkiFrameTop)
/* 0AB5AC 001AB4AC 60A0040C */  jal         SetReference__6CFrameFP6CFrame
/* 0AB5B0 001AB4B0 00000000 */   nop
/* 0AB5B4 001AB4B4 5893848F */  lw          $4, -0x6CA8($28)
/* 0AB5B8 001AB4B8 60BB040C */  jal         MGDraw__FP6CFrame
/* 0AB5BC 001AB4BC 00000000 */   nop
.L001AB4C0:
/* 0AB5C0 001AB4C0 01001124 */  addiu       $17, $0, 0x1
/* 0AB5C4 001AB4C4 F000A427 */  addiu       $4, $29, 0xF0
/* 0AB5C8 001AB4C8 D501023C */  lui         $2, %hi(hookp)
/* 0AB5CC 001AB4CC B0624524 */  addiu       $5, $2, %lo(hookp)
/* 0AB5D0 001AB4D0 D501023C */  lui         $2, %hi(hookp + 0x10)
/* 0AB5D4 001AB4D4 C0624624 */  addiu       $6, $2, %lo(hookp + 0x10)
/* 0AB5D8 001AB4D8 D501023C */  lui         $2, %hi(hookp + 0x20)
/* 0AB5DC 001AB4DC D0624724 */  addiu       $7, $2, %lo(hookp + 0x20)
/* 0AB5E0 001AB4E0 F48B040C */  jal         VectorMax__FPfPfPfPf
/* 0AB5E4 001AB4E4 00000000 */   nop
/* 0AB5E8 001AB4E8 0A000012 */  beqz        $16, .L001AB514
/* 0AB5EC 001AB4EC 00000000 */   nop
/* 0AB5F0 001AB4F0 F400A1C7 */  lwc1        $f1, 0xF4($29)
/* 0AB5F4 001AB4F4 389380C7 */  lwc1        $f0, -0x6CC8($28)
/* 0AB5F8 001AB4F8 34080046 */  c.lt.s      $f1, $f0
/* 0AB5FC 001AB4FC 00000000 */  nop
/* 0AB600 001AB500 0E000045 */  bc1f        .L001AB53C
/* 0AB604 001AB504 00000000 */   nop
/* 0AB608 001AB508 288E0070 */  paddub      $17, $0, $0
/* 0AB60C 001AB50C 0B000010 */  b           .L001AB53C
/* 0AB610 001AB510 00000000 */   nop
.L001AB514:
/* 0AB614 001AB514 F400A1C7 */  lwc1        $f1, 0xF4($29)
/* 0AB618 001AB518 389380C7 */  lwc1        $f0, -0x6CC8($28)
/* 0AB61C 001AB51C 36080046 */  c.le.s      $f1, $f0
/* 0AB620 001AB520 00000000 */  nop
/* 0AB624 001AB524 04000045 */  bc1f        .L001AB538
/* 0AB628 001AB528 00000000 */   nop
/* 0AB62C 001AB52C B087838F */  lw          $3, -0x7850($28)
/* 0AB630 001AB530 02006014 */  bnez        $3, .L001AB53C
/* 0AB634 001AB534 00000000 */   nop
.L001AB538:
/* 0AB638 001AB538 288E0070 */  paddub      $17, $0, $0
.L001AB53C:
/* 0AB63C 001AB53C 5493838F */  lw          $3, -0x6CAC($28)
/* 0AB640 001AB540 74006010 */  beqz        $3, .L001AB714
/* 0AB644 001AB544 00000000 */   nop
/* 0AB648 001AB548 72002012 */  beqz        $17, .L001AB714
/* 0AB64C 001AB54C 00000000 */   nop
/* 0AB650 001AB550 8000A427 */  addiu       $4, $29, 0x80
/* 0AB654 001AB554 D501023C */  lui         $2, %hi(hookp + 0x10)
/* 0AB658 001AB558 C0624524 */  addiu       $5, $2, %lo(hookp + 0x10)
/* 0AB65C 001AB55C D501023C */  lui         $2, %hi(hookp + 0x20)
/* 0AB660 001AB560 D0624624 */  addiu       $6, $2, %lo(hookp + 0x20)
/* 0AB664 001AB564 E885040C */  jal         sceVu0AddVector
/* 0AB668 001AB568 00000000 */   nop
/* 0AB66C 001AB56C 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 0AB670 001AB570 00608244 */  mtc1        $2, $f12
/* 0AB674 001AB574 8000A427 */  addiu       $4, $29, 0x80
/* 0AB678 001AB578 282E8070 */  paddub      $5, $4, $0
/* 0AB67C 001AB57C FA85040C */  jal         sceVu0ScaleVector
/* 0AB680 001AB580 00000000 */   nop
/* 0AB684 001AB584 9000A427 */  addiu       $4, $29, 0x90
/* 0AB688 001AB588 D501023C */  lui         $2, %hi(hookp)
/* 0AB68C 001AB58C B0624524 */  addiu       $5, $2, %lo(hookp)
/* 0AB690 001AB590 8000A627 */  addiu       $6, $29, 0x80
/* 0AB694 001AB594 EE85040C */  jal         sceVu0SubVector
/* 0AB698 001AB598 00000000 */   nop
/* 0AB69C 001AB59C B000B127 */  addiu       $17, $29, 0xB0
/* 0AB6A0 001AB5A0 28262072 */  paddub      $4, $17, $0
/* 0AB6A4 001AB5A4 9000A527 */  addiu       $5, $29, 0x90
/* 0AB6A8 001AB5A8 9285040C */  jal         sceVu0Normalize
/* 0AB6AC 001AB5AC 00000000 */   nop
/* 0AB6B0 001AB5B0 BC00A0AF */  sw          $0, 0xBC($29)
/* 0AB6B4 001AB5B4 8000A427 */  addiu       $4, $29, 0x80
/* 0AB6B8 001AB5B8 D501023C */  lui         $2, %hi(hookp + 0x10)
/* 0AB6BC 001AB5BC C0624524 */  addiu       $5, $2, %lo(hookp + 0x10)
/* 0AB6C0 001AB5C0 D501023C */  lui         $2, %hi(hookp)
/* 0AB6C4 001AB5C4 B0624624 */  addiu       $6, $2, %lo(hookp)
/* 0AB6C8 001AB5C8 EE85040C */  jal         sceVu0SubVector
/* 0AB6CC 001AB5CC 00000000 */   nop
/* 0AB6D0 001AB5D0 9000A427 */  addiu       $4, $29, 0x90
/* 0AB6D4 001AB5D4 D501023C */  lui         $2, %hi(hookp + 0x20)
/* 0AB6D8 001AB5D8 D0624524 */  addiu       $5, $2, %lo(hookp + 0x20)
/* 0AB6DC 001AB5DC D501023C */  lui         $2, %hi(hookp)
/* 0AB6E0 001AB5E0 B0624624 */  addiu       $6, $2, %lo(hookp)
/* 0AB6E4 001AB5E4 EE85040C */  jal         sceVu0SubVector
/* 0AB6E8 001AB5E8 00000000 */   nop
/* 0AB6EC 001AB5EC C000B027 */  addiu       $16, $29, 0xC0
/* 0AB6F0 001AB5F0 28260072 */  paddub      $4, $16, $0
/* 0AB6F4 001AB5F4 8000A527 */  addiu       $5, $29, 0x80
/* 0AB6F8 001AB5F8 9000A627 */  addiu       $6, $29, 0x90
/* 0AB6FC 001AB5FC 8085040C */  jal         sceVu0OuterProduct
/* 0AB700 001AB600 00000000 */   nop
/* 0AB704 001AB604 28260072 */  paddub      $4, $16, $0
/* 0AB708 001AB608 282E0072 */  paddub      $5, $16, $0
/* 0AB70C 001AB60C 9285040C */  jal         sceVu0Normalize
/* 0AB710 001AB610 00000000 */   nop
/* 0AB714 001AB614 CC00A0AF */  sw          $0, 0xCC($29)
/* 0AB718 001AB618 A000A427 */  addiu       $4, $29, 0xA0
/* 0AB71C 001AB61C 282E2072 */  paddub      $5, $17, $0
/* 0AB720 001AB620 28360072 */  paddub      $6, $16, $0
/* 0AB724 001AB624 8085040C */  jal         sceVu0OuterProduct
/* 0AB728 001AB628 00000000 */   nop
/* 0AB72C 001AB62C AC00A0AF */  sw          $0, 0xAC($29)
/* 0AB730 001AB630 D800A0AF */  sw          $0, 0xD8($29)
/* 0AB734 001AB634 D400A0AF */  sw          $0, 0xD4($29)
/* 0AB738 001AB638 D000A0AF */  sw          $0, 0xD0($29)
/* 0AB73C 001AB63C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0AB740 001AB640 DC00A2AF */  sw          $2, 0xDC($29)
/* 0AB744 001AB644 5493848F */  lw          $4, -0x6CAC($28)
/* 0AB748 001AB648 A000A527 */  addiu       $5, $29, 0xA0
/* 0AB74C 001AB64C 58A1040C */  jal         SetTransMatrix__6CFrameFPA4_f
/* 0AB750 001AB650 00000000 */   nop
/* 0AB754 001AB654 5493848F */  lw          $4, -0x6CAC($28)
/* 0AB758 001AB658 D501023C */  lui         $2, %hi(hookp)
/* 0AB75C 001AB65C B0624524 */  addiu       $5, $2, %lo(hookp)
/* 0AB760 001AB660 B89F040C */  jal         SetPosition__6CFrameFPf
/* 0AB764 001AB664 00000000 */   nop
/* 0AB768 001AB668 5493848F */  lw          $4, -0x6CAC($28)
/* 0AB76C 001AB66C 60BB040C */  jal         MGDraw__FP6CFrame
/* 0AB770 001AB670 00000000 */   nop
/* 0AB774 001AB674 4C93838F */  lw          $3, -0x6CB4($28)
/* 0AB778 001AB678 26006010 */  beqz        $3, .L001AB714
/* 0AB77C 001AB67C 00000000 */   nop
/* 0AB780 001AB680 0001A427 */  addiu       $4, $29, 0x100
/* 0AB784 001AB684 D501023C */  lui         $2, %hi(hookp)
/* 0AB788 001AB688 B0624524 */  addiu       $5, $2, %lo(hookp)
/* 0AB78C 001AB68C D501023C */  lui         $2, %hi(hookp + 0x10)
/* 0AB790 001AB690 C0624624 */  addiu       $6, $2, %lo(hookp + 0x10)
/* 0AB794 001AB694 E885040C */  jal         sceVu0AddVector
/* 0AB798 001AB698 00000000 */   nop
/* 0AB79C 001AB69C 0001A427 */  addiu       $4, $29, 0x100
/* 0AB7A0 001AB6A0 282E8070 */  paddub      $5, $4, $0
/* 0AB7A4 001AB6A4 D501023C */  lui         $2, %hi(hookp + 0x20)
/* 0AB7A8 001AB6A8 D0624624 */  addiu       $6, $2, %lo(hookp + 0x20)
/* 0AB7AC 001AB6AC E885040C */  jal         sceVu0AddVector
/* 0AB7B0 001AB6B0 00000000 */   nop
/* 0AB7B4 001AB6B4 0001A427 */  addiu       $4, $29, 0x100
/* 0AB7B8 001AB6B8 282E8070 */  paddub      $5, $4, $0
/* 0AB7BC 001AB6BC 74838CC7 */  lwc1        $f12, -0x7C8C($28)
/* 0AB7C0 001AB6C0 FA85040C */  jal         sceVu0ScaleVector
/* 0AB7C4 001AB6C4 00000000 */   nop
/* 0AB7C8 001AB6C8 4C93848F */  lw          $4, -0x6CB4($28)
/* 0AB7CC 001AB6CC A000A527 */  addiu       $5, $29, 0xA0
/* 0AB7D0 001AB6D0 58A1040C */  jal         SetTransMatrix__6CFrameFPA4_f
/* 0AB7D4 001AB6D4 00000000 */   nop
/* 0AB7D8 001AB6D8 4C93848F */  lw          $4, -0x6CB4($28)
/* 0AB7DC 001AB6DC 0001A527 */  addiu       $5, $29, 0x100
/* 0AB7E0 001AB6E0 B89F040C */  jal         SetPosition__6CFrameFPf
/* 0AB7E4 001AB6E4 00000000 */   nop
/* 0AB7E8 001AB6E8 A0B8040C */  jal         GetVif1Packet__Fv
/* 0AB7EC 001AB6EC 00000000 */   nop
/* 0AB7F0 001AB6F0 C701033C */  lui         $3, %hi(TexManager)
/* 0AB7F4 001AB6F4 70586424 */  addiu       $4, $3, %lo(TexManager)
/* 0AB7F8 001AB6F8 282E4070 */  paddub      $5, $2, $0
/* 0AB7FC 001AB6FC 6493868F */  lw          $6, -0x6C9C($28)
/* 0AB800 001AB700 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 0AB804 001AB704 00000000 */   nop
/* 0AB808 001AB708 4C93848F */  lw          $4, -0x6CB4($28)
/* 0AB80C 001AB70C 60BB040C */  jal         MGDraw__FP6CFrame
/* 0AB810 001AB710 00000000 */   nop
.L001AB714:
/* 0AB814 001AB714 6000BF7B */  lq          $31, 0x60($29)
/* 0AB818 001AB718 5000B57B */  lq          $21, 0x50($29)
/* 0AB81C 001AB71C 4000B47B */  lq          $20, 0x40($29)
/* 0AB820 001AB720 3000B37B */  lq          $19, 0x30($29)
/* 0AB824 001AB724 2000B27B */  lq          $18, 0x20($29)
/* 0AB828 001AB728 1000B17B */  lq          $17, 0x10($29)
/* 0AB82C 001AB72C 0000B07B */  lq          $16, 0x0($29)
/* 0AB830 001AB730 2001BD27 */  addiu       $29, $29, 0x120
/* 0AB834 001AB734 0800E003 */  jr          $31
/* 0AB838 001AB738 00000000 */   nop
/* 0AB83C 001AB73C 00000000 */  nop
