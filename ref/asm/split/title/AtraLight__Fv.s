.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AtraLight__Fv
/* 0214D0 01DCD1D0 40FFBD27 */  addiu       $29, $29, -0xC0
/* 0214D4 01DCD1D4 3000BF7F */  sq          $31, 0x30($29)
/* 0214D8 01DCD1D8 2000B17F */  sq          $17, 0x20($29)
/* 0214DC 01DCD1DC 1000B07F */  sq          $16, 0x10($29)
/* 0214E0 01DCD1E0 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0214E4 01DCD1E4 DF01013C */  lui         $1, %hi(Chara__3 + 0x2650)
/* 0214E8 01DCD1E8 302521C4 */  lwc1        $f1, %lo(Chara__3 + 0x2650)($1)
/* 0214EC 01DCD1EC 2042033C */  lui         $3, (0x42200000 >> 16)
/* 0214F0 01DCD1F0 00008344 */  mtc1        $3, $f0
/* 0214F4 01DCD1F4 00000000 */  nop
/* 0214F8 01DCD1F8 34080046 */  c.lt.s      $f1, $f0
/* 0214FC 01DCD1FC 00000000 */  nop
/* 021500 01DCD200 8F000145 */  bc1t        .L01DCD440_2D2C40
/* 021504 01DCD204 00000000 */   nop
/* 021508 01DCD208 DF01013C */  lui         $1, %hi(Chara__3 + 0x241C)
/* 02150C 01DCD20C FC22248C */  lw          $4, %lo(Chara__3 + 0x241C)($1)
/* 021510 01DCD210 DE01023C */  lui         $2, %hi(LIT_1155__3)
/* 021514 01DCD214 98044524 */  addiu       $5, $2, %lo(LIT_1155__3)
/* 021518 01DCD218 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 02151C 01DCD21C 00000000 */   nop
/* 021520 01DCD220 28864070 */  paddub      $16, $2, $0
/* 021524 01DCD224 86000012 */  beqz        $16, .L01DCD440_2D2C40
/* 021528 01DCD228 00000000 */   nop
/* 02152C 01DCD22C 8000A427 */  addiu       $4, $29, 0x80
/* 021530 01DCD230 D0010526 */  addiu       $5, $16, 0x1D0
/* 021534 01DCD234 1086040C */  jal         sceVu0CopyMatrix
/* 021538 01DCD238 00000000 */   nop
/* 02153C 01DCD23C B000A0C7 */  lwc1        $f0, 0xB0($29)
/* 021540 01DCD240 4000A0E7 */  swc1        $f0, 0x40($29)
/* 021544 01DCD244 B400A0C7 */  lwc1        $f0, 0xB4($29)
/* 021548 01DCD248 4400A0E7 */  swc1        $f0, 0x44($29)
/* 02154C 01DCD24C B800A0C7 */  lwc1        $f0, 0xB8($29)
/* 021550 01DCD250 4800A0E7 */  swc1        $f0, 0x48($29)
/* 021554 01DCD254 28260072 */  paddub      $4, $16, $0
/* 021558 01DCD258 7000A527 */  addiu       $5, $29, 0x70
/* 02155C 01DCD25C 4000A627 */  addiu       $6, $29, 0x40
/* 021560 01DCD260 58A3040C */  jal         GetWorldPosition__6CFrameFPfPf
/* 021564 01DCD264 00000000 */   nop
/* 021568 01DCD268 DF01013C */  lui         $1, %hi(Chara__3 + 0xBC)
/* 02156C 01DCD26C 9CFF228C */  lw          $2, %lo(Chara__3 + 0xBC)($1)
/* 021570 01DCD270 B09B82AF */  sw          $2, -0x6450($28)
/* 021574 01DCD274 B09B828F */  lw          $2, -0x6450($28)
/* 021578 01DCD278 5000A427 */  addiu       $4, $29, 0x50
/* 02157C 01DCD27C 20024524 */  addiu       $5, $2, 0x220
/* 021580 01DCD280 0C86040C */  jal         sceVu0CopyVector
/* 021584 01DCD284 00000000 */   nop
/* 021588 01DCD288 7000A1C7 */  lwc1        $f1, 0x70($29)
/* 02158C 01DCD28C 5000A0C7 */  lwc1        $f0, 0x50($29)
/* 021590 01DCD290 01080046 */  sub.s       $f0, $f1, $f0
/* 021594 01DCD294 6000A0E7 */  swc1        $f0, 0x60($29)
/* 021598 01DCD298 7400A1C7 */  lwc1        $f1, 0x74($29)
/* 02159C 01DCD29C 5400A0C7 */  lwc1        $f0, 0x54($29)
/* 0215A0 01DCD2A0 41080046 */  sub.s       $f1, $f1, $f0
/* 0215A4 01DCD2A4 4041023C */  lui         $2, (0x41400000 >> 16)
/* 0215A8 01DCD2A8 00008244 */  mtc1        $2, $f0
/* 0215AC 01DCD2AC 00000000 */  nop
/* 0215B0 01DCD2B0 01080046 */  sub.s       $f0, $f1, $f0
/* 0215B4 01DCD2B4 6400B027 */  addiu       $16, $29, 0x64
/* 0215B8 01DCD2B8 000000E6 */  swc1        $f0, 0x0($16)
/* 0215BC 01DCD2BC 7800A1C7 */  lwc1        $f1, 0x78($29)
/* 0215C0 01DCD2C0 5800A0C7 */  lwc1        $f0, 0x58($29)
/* 0215C4 01DCD2C4 01080046 */  sub.s       $f0, $f1, $f0
/* 0215C8 01DCD2C8 6800B127 */  addiu       $17, $29, 0x68
/* 0215CC 01DCD2CC 000020E6 */  swc1        $f0, 0x0($17)
/* 0215D0 01DCD2D0 6000A0C7 */  lwc1        $f0, 0x60($29)
/* 0215D4 01DCD2D4 42000046 */  mul.s       $f1, $f0, $f0
/* 0215D8 01DCD2D8 000000C6 */  lwc1        $f0, 0x0($16)
/* 0215DC 01DCD2DC 02000046 */  mul.s       $f0, $f0, $f0
/* 0215E0 01DCD2E0 18080046 */  adda.s      $f1, $f0
/* 0215E4 01DCD2E4 000020C6 */  lwc1        $f0, 0x0($17)
/* 0215E8 01DCD2E8 1C030046 */  madd.s      $f12, $f0, $f0
/* 0215EC 01DCD2EC 9044040C */  jal         fptodp
/* 0215F0 01DCD2F0 00000000 */   nop
/* 0215F4 01DCD2F4 28264070 */  paddub      $4, $2, $0
/* 0215F8 01DCD2F8 CC76040C */  jal         sqrt
/* 0215FC 01DCD2FC 00000000 */   nop
/* 021600 01DCD300 28264070 */  paddub      $4, $2, $0
/* 021604 01DCD304 9241040C */  jal         dptofp
/* 021608 01DCD308 00000000 */   nop
/* 02160C 01DCD30C 2041023C */  lui         $2, (0x41200000 >> 16)
/* 021610 01DCD310 00088244 */  mtc1        $2, $f1
/* 021614 01DCD314 00000000 */  nop
/* 021618 01DCD318 36000146 */  c.le.s      $f0, $f1
/* 02161C 01DCD31C 00000000 */  nop
/* 021620 01DCD320 02000045 */  bc1f        .L01DCD32C_2D2B2C
/* 021624 01DCD324 00000000 */   nop
/* 021628 01DCD328 06080046 */  mov.s       $f0, $f1
.L01DCD32C_2D2B2C:
/* 02162C 01DCD32C 42000046 */  mul.s       $f1, $f0, $f0
/* 021630 01DCD330 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 021634 01DCD334 00008244 */  mtc1        $2, $f0
/* 021638 01DCD338 00000000 */  nop
/* 02163C 01DCD33C 43000146 */  div.s       $f1, $f0, $f1
/* 021640 01DCD340 A040023C */  lui         $2, (0x40A00000 >> 16)
/* 021644 01DCD344 00008244 */  mtc1        $2, $f0
/* 021648 01DCD348 00000000 */  nop
/* 02164C 01DCD34C 02050146 */  mul.s       $f20, $f0, $f1
/* 021650 01DCD350 6000A427 */  addiu       $4, $29, 0x60
/* 021654 01DCD354 282E8070 */  paddub      $5, $4, $0
/* 021658 01DCD358 9285040C */  jal         sceVu0Normalize
/* 02165C 01DCD35C 00000000 */   nop
/* 021660 01DCD360 6000A0C7 */  lwc1        $f0, 0x60($29)
/* 021664 01DCD364 02001446 */  mul.s       $f0, $f0, $f20
/* 021668 01DCD368 6000A0E7 */  swc1        $f0, 0x60($29)
/* 02166C 01DCD36C 000000C6 */  lwc1        $f0, 0x0($16)
/* 021670 01DCD370 02001446 */  mul.s       $f0, $f0, $f20
/* 021674 01DCD374 000000E6 */  swc1        $f0, 0x0($16)
/* 021678 01DCD378 000020C6 */  lwc1        $f0, 0x0($17)
/* 02167C 01DCD37C 02001446 */  mul.s       $f0, $f0, $f20
/* 021680 01DCD380 000020E6 */  swc1        $f0, 0x0($17)
/* 021684 01DCD384 6C00A0AF */  sw          $0, 0x6C($29)
/* 021688 01DCD388 6000A0C7 */  lwc1        $f0, 0x60($29)
/* 02168C 01DCD38C 2500013C */  lui         $1, %hi(light + 0xC)
/* 021690 01DCD390 8C1B20E4 */  swc1        $f0, %lo(light + 0xC)($1)
/* 021694 01DCD394 000000C6 */  lwc1        $f0, 0x0($16)
/* 021698 01DCD398 2500013C */  lui         $1, %hi(light + 0x1C)
/* 02169C 01DCD39C 9C1B20E4 */  swc1        $f0, %lo(light + 0x1C)($1)
/* 0216A0 01DCD3A0 000020C6 */  lwc1        $f0, 0x0($17)
/* 0216A4 01DCD3A4 2500013C */  lui         $1, %hi(light + 0x2C)
/* 0216A8 01DCD3A8 AC1B20E4 */  swc1        $f0, %lo(light + 0x2C)($1)
/* 0216AC 01DCD3AC 2500013C */  lui         $1, %hi(light + 0x3C)
/* 0216B0 01DCD3B0 BC1B20AC */  sw          $0, %lo(light + 0x3C)($1)
/* 0216B4 01DCD3B4 563F023C */  lui         $2, (0x3F560000 >> 16)
/* 0216B8 01DCD3B8 00008244 */  mtc1        $2, $f0
/* 0216BC 01DCD3BC D89B81C7 */  lwc1        $f1, -0x6428($28)
/* 0216C0 01DCD3C0 02000146 */  mul.s       $f0, $f0, $f1
/* 0216C4 01DCD3C4 2500013C */  lui         $1, %hi(lightcolor + 0x30)
/* 0216C8 01DCD3C8 F01B20E4 */  swc1        $f0, %lo(lightcolor + 0x30)($1)
/* 0216CC 01DCD3CC 7A3F023C */  lui         $2, (0x3F7A0000 >> 16)
/* 0216D0 01DCD3D0 00008244 */  mtc1        $2, $f0
/* 0216D4 01DCD3D4 00000000 */  nop
/* 0216D8 01DCD3D8 02000146 */  mul.s       $f0, $f0, $f1
/* 0216DC 01DCD3DC 2500013C */  lui         $1, %hi(lightcolor + 0x34)
/* 0216E0 01DCD3E0 F41B20E4 */  swc1        $f0, %lo(lightcolor + 0x34)($1)
/* 0216E4 01DCD3E4 293F023C */  lui         $2, (0x3F290000 >> 16)
/* 0216E8 01DCD3E8 00008244 */  mtc1        $2, $f0
/* 0216EC 01DCD3EC 00000000 */  nop
/* 0216F0 01DCD3F0 02000146 */  mul.s       $f0, $f0, $f1
/* 0216F4 01DCD3F4 2500013C */  lui         $1, %hi(lightcolor + 0x38)
/* 0216F8 01DCD3F8 F81B20E4 */  swc1        $f0, %lo(lightcolor + 0x38)($1)
/* 0216FC 01DCD3FC 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 021700 01DCD400 00008244 */  mtc1        $2, $f0
/* 021704 01DCD404 00000000 */  nop
/* 021708 01DCD408 02000146 */  mul.s       $f0, $f0, $f1
/* 02170C 01DCD40C 2500013C */  lui         $1, %hi(lightcolor + 0x3C)
/* 021710 01DCD410 FC1B20E4 */  swc1        $f0, %lo(lightcolor + 0x3C)($1)
/* 021714 01DCD414 0040023C */  lui         $2, (0x40000000 >> 16)
/* 021718 01DCD418 00008244 */  mtc1        $2, $f0
/* 02171C 01DCD41C 00000000 */  nop
/* 021720 01DCD420 00080046 */  add.s       $f0, $f1, $f0
/* 021724 01DCD424 D89B80E7 */  swc1        $f0, -0x6428($28)
/* 021728 01DCD428 2500023C */  lui         $2, %hi(light)
/* 02172C 01DCD42C 801B4424 */  addiu       $4, $2, %lo(light)
/* 021730 01DCD430 2500023C */  lui         $2, %hi(lightcolor)
/* 021734 01DCD434 C01B4524 */  addiu       $5, $2, %lo(lightcolor)
/* 021738 01DCD438 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 02173C 01DCD43C 00000000 */   nop
.L01DCD440_2D2C40:
/* 021740 01DCD440 3000BF7B */  lq          $31, 0x30($29)
/* 021744 01DCD444 2000B17B */  lq          $17, 0x20($29)
/* 021748 01DCD448 1000B07B */  lq          $16, 0x10($29)
/* 02174C 01DCD44C 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 021750 01DCD450 C000BD27 */  addiu       $29, $29, 0xC0
/* 021754 01DCD454 0800E003 */  jr          $31
/* 021758 01DCD458 00000000 */   nop
/* 02175C 01DCD45C 00000000 */  nop
