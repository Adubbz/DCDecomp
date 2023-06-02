.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Entry2__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
/* AD360 001AD260 30FFBD27 */  addiu      $sp, $sp, -0xD0
/* AD364 001AD264 8000BF7F */  sq         $31, 0x80($sp)
/* AD368 001AD268 7000B77F */  sq         $23, 0x70($sp)
/* AD36C 001AD26C 6000B67F */  sq         $22, 0x60($sp)
/* AD370 001AD270 5000B57F */  sq         $21, 0x50($sp)
/* AD374 001AD274 4000B47F */  sq         $20, 0x40($sp)
/* AD378 001AD278 3000B37F */  sq         $19, 0x30($sp)
/* AD37C 001AD27C 2000B27F */  sq         $18, 0x20($sp)
/* AD380 001AD280 1000B17F */  sq         $17, 0x10($sp)
/* AD384 001AD284 0000B07F */  sq         $16, 0x0($sp)
/* AD388 001AD288 28A68070 */  paddub     $20, $4, $0
/* AD38C 001AD28C 289EA070 */  paddub     $19, $5, $0
/* AD390 001AD290 28AEC070 */  paddub     $21, $6, $0
/* AD394 001AD294 2886E070 */  paddub     $16, $7, $0
/* AD398 001AD298 28960071 */  paddub     $18, $8, $0
/* AD39C 001AD29C 288E2071 */  paddub     $17, $9, $0
/* AD3A0 001AD2A0 0000828C */  lw         $2, 0x0($4)
/* AD3A4 001AD2A4 04004010 */  beqz       $2, .L001AD2B8
/* AD3A8 001AD2A8 00000000 */   nop
/* AD3AC 001AD2AC 28160070 */  paddub     $2, $0, $0
/* AD3B0 001AD2B0 49010010 */  b          .L001AD7D8
/* AD3B4 001AD2B4 00000000 */   nop
.L001AD2B8:
/* AD3B8 001AD2B8 9000A427 */  addiu      $4, $sp, 0x90
/* AD3BC 001AD2BC 2A00023C */  lui        $2, %hi(_900)
/* AD3C0 001AD2C0 F8B44524 */  addiu      $5, $2, %lo(_900)
/* AD3C4 001AD2C4 28366072 */  paddub     $6, $19, $0
/* AD3C8 001AD2C8 1614040C */  jal        sprintf
/* AD3CC 001AD2CC 00000000 */   nop
/* AD3D0 001AD2D0 0100013C */  lui        $at, (0x10000 >> 16)
/* AD3D4 001AD2D4 21088102 */  addu       $at, $20, $at
/* AD3D8 001AD2D8 54A130AC */  sw         $16, -0x5EAC($at)
/* AD3DC 001AD2DC 10008426 */  addiu      $4, $20, 0x10
/* AD3E0 001AD2E0 B000998E */  lw         $25, 0xB0($20)
/* AD3E4 001AD2E4 C400398F */  lw         $25, 0xC4($25)
/* AD3E8 001AD2E8 09F82003 */  jalr       $25
/* AD3EC 001AD2EC 00000000 */   nop
/* AD3F0 001AD2F0 10008426 */  addiu      $4, $20, 0x10
/* AD3F4 001AD2F4 282EA072 */  paddub     $5, $21, $0
/* AD3F8 001AD2F8 9000A627 */  addiu      $6, $sp, 0x90
/* AD3FC 001AD2FC 283E4072 */  paddub     $7, $18, $0
/* AD400 001AD300 28460072 */  paddub     $8, $16, $0
/* AD404 001AD304 284E4072 */  paddub     $9, $18, $0
/* AD408 001AD308 01000A24 */  addiu      $10, $0, 0x1
/* AD40C 001AD30C 10000B24 */  addiu      $11, $0, 0x10
/* AD410 001AD310 B000998E */  lw         $25, 0xB0($20)
/* AD414 001AD314 C000398F */  lw         $25, 0xC0($25)
/* AD418 001AD318 09F82003 */  jalr       $25
/* AD41C 001AD31C 00000000 */   nop
/* AD420 001AD320 0100013C */  lui        $at, (0x10000 >> 16)
/* AD424 001AD324 21088102 */  addu       $at, $20, $at
/* AD428 001AD328 4CA131AC */  sw         $17, -0x5EB4($at)
/* AD42C 001AD32C 28AE0070 */  paddub     $21, $0, $0
/* AD430 001AD330 21010010 */  b          .L001AD7B8
/* AD434 001AD334 00000000 */   nop
.L001AD338:
/* AD438 001AD338 B0110224 */  addiu      $2, $0, 0x11B0
/* AD43C 001AD33C 18B0A202 */  mult       $22, $21, $2
/* AD440 001AD340 21B89602 */  addu       $23, $20, $22
/* AD444 001AD344 C011E426 */  addiu      $4, $23, 0x11C0
/* AD448 001AD348 10008526 */  addiu      $5, $20, 0x10
/* AD44C 001AD34C 780C050C */  jal        __as__7CObjectFRC7CObject
/* AD450 001AD350 00000000 */   nop
/* AD454 001AD354 C00080C6 */  lwc1       $f0, 0xC0($20)
/* AD458 001AD358 281EE072 */  paddub     $3, $23, $0
/* AD45C 001AD35C 701260E4 */  swc1       $f0, 0x1270($3)
/* AD460 001AD360 C40080C6 */  lwc1       $f0, 0xC4($20)
/* AD464 001AD364 741260E4 */  swc1       $f0, 0x1274($3)
/* AD468 001AD368 C80080C6 */  lwc1       $f0, 0xC8($20)
/* AD46C 001AD36C 781260E4 */  swc1       $f0, 0x1278($3)
/* AD470 001AD370 CC00828E */  lw         $2, 0xCC($20)
/* AD474 001AD374 7C127024 */  addiu      $16, $3, 0x127C
/* AD478 001AD378 7C1262AC */  sw         $2, 0x127C($3)
/* AD47C 001AD37C D000828E */  lw         $2, 0xD0($20)
/* AD480 001AD380 801262AC */  sw         $2, 0x1280($3)
/* AD484 001AD384 D40083C6 */  lwc1       $f3, 0xD4($20)
/* AD488 001AD388 D80082C6 */  lwc1       $f2, 0xD8($20)
/* AD48C 001AD38C DC0081C6 */  lwc1       $f1, 0xDC($20)
/* AD490 001AD390 E00080C6 */  lwc1       $f0, 0xE0($20)
/* AD494 001AD394 841263E4 */  swc1       $f3, 0x1284($3)
/* AD498 001AD398 881262E4 */  swc1       $f2, 0x1288($3)
/* AD49C 001AD39C 8C1261E4 */  swc1       $f1, 0x128C($3)
/* AD4A0 001AD3A0 901260E4 */  swc1       $f0, 0x1290($3)
/* AD4A4 001AD3A4 E400828E */  lw         $2, 0xE4($20)
/* AD4A8 001AD3A8 941262AC */  sw         $2, 0x1294($3)
/* AD4AC 001AD3AC E800828E */  lw         $2, 0xE8($20)
/* AD4B0 001AD3B0 981262AC */  sw         $2, 0x1298($3)
/* AD4B4 001AD3B4 EC008626 */  addiu      $6, $20, 0xEC
/* AD4B8 001AD3B8 9C126524 */  addiu      $5, $3, 0x129C
/* AD4BC 001AD3BC 3E000424 */  addiu      $4, $0, 0x3E
.L001AD3C0:
/* AD4C0 001AD3C0 0000C38C */  lw         $3, 0x0($6)
/* AD4C4 001AD3C4 0400C28C */  lw         $2, 0x4($6)
/* AD4C8 001AD3C8 0800C624 */  addiu      $6, $6, 0x8
/* AD4CC 001AD3CC FFFF8424 */  addiu      $4, $4, -0x1
/* AD4D0 001AD3D0 0000A3AC */  sw         $3, 0x0($5)
/* AD4D4 001AD3D4 0400A2AC */  sw         $2, 0x4($5)
/* AD4D8 001AD3D8 0800A524 */  addiu      $5, $5, 0x8
/* AD4DC 001AD3DC F8FF801C */  bgtz       $4, .L001AD3C0
/* AD4E0 001AD3E0 00000000 */   nop
/* AD4E4 001AD3E4 DC02828E */  lw         $2, 0x2DC($20)
/* AD4E8 001AD3E8 2118D402 */  addu       $3, $22, $20
/* AD4EC 001AD3EC 8C1462AC */  sw         $2, 0x148C($3)
/* AD4F0 001AD3F0 E002828E */  lw         $2, 0x2E0($20)
/* AD4F4 001AD3F4 901462AC */  sw         $2, 0x1490($3)
/* AD4F8 001AD3F8 F0028626 */  addiu      $6, $20, 0x2F0
/* AD4FC 001AD3FC A0146524 */  addiu      $5, $3, 0x14A0
/* AD500 001AD400 04000424 */  addiu      $4, $0, 0x4
.L001AD404:
/* AD504 001AD404 0000C378 */  lq         $3, 0x0($6)
/* AD508 001AD408 1000C278 */  lq         $2, 0x10($6)
/* AD50C 001AD40C 2000C624 */  addiu      $6, $6, 0x20
/* AD510 001AD410 FFFF8424 */  addiu      $4, $4, -0x1
/* AD514 001AD414 0000A37C */  sq         $3, 0x0($5)
/* AD518 001AD418 1000A27C */  sq         $2, 0x10($5)
/* AD51C 001AD41C 2000A524 */  addiu      $5, $5, 0x20
/* AD520 001AD420 F8FF801C */  bgtz       $4, .L001AD404
/* AD524 001AD424 00000000 */   nop
/* AD528 001AD428 2110D402 */  addu       $2, $22, $20
/* AD52C 001AD42C 70038626 */  addiu      $6, $20, 0x370
/* AD530 001AD430 20154524 */  addiu      $5, $2, 0x1520
/* AD534 001AD434 04000424 */  addiu      $4, $0, 0x4
.L001AD438:
/* AD538 001AD438 0000C378 */  lq         $3, 0x0($6)
/* AD53C 001AD43C 1000C278 */  lq         $2, 0x10($6)
/* AD540 001AD440 2000C624 */  addiu      $6, $6, 0x20
/* AD544 001AD444 FFFF8424 */  addiu      $4, $4, -0x1
/* AD548 001AD448 0000A37C */  sq         $3, 0x0($5)
/* AD54C 001AD44C 1000A27C */  sq         $2, 0x10($5)
/* AD550 001AD450 2000A524 */  addiu      $5, $5, 0x20
/* AD554 001AD454 F8FF801C */  bgtz       $4, .L001AD438
/* AD558 001AD458 00000000 */   nop
/* AD55C 001AD45C 2110D402 */  addu       $2, $22, $20
/* AD560 001AD460 F0038626 */  addiu      $6, $20, 0x3F0
/* AD564 001AD464 A0154524 */  addiu      $5, $2, 0x15A0
/* AD568 001AD468 04000424 */  addiu      $4, $0, 0x4
.L001AD46C:
/* AD56C 001AD46C 0000C38C */  lw         $3, 0x0($6)
/* AD570 001AD470 0400C28C */  lw         $2, 0x4($6)
/* AD574 001AD474 0800C624 */  addiu      $6, $6, 0x8
/* AD578 001AD478 FFFF8424 */  addiu      $4, $4, -0x1
/* AD57C 001AD47C 0000A3AC */  sw         $3, 0x0($5)
/* AD580 001AD480 0400A2AC */  sw         $2, 0x4($5)
/* AD584 001AD484 0800A524 */  addiu      $5, $5, 0x8
/* AD588 001AD488 F8FF801C */  bgtz       $4, .L001AD46C
/* AD58C 001AD48C 00000000 */   nop
/* AD590 001AD490 2110D402 */  addu       $2, $22, $20
/* AD594 001AD494 10048626 */  addiu      $6, $20, 0x410
/* AD598 001AD498 C0154524 */  addiu      $5, $2, 0x15C0
/* AD59C 001AD49C 04000424 */  addiu      $4, $0, 0x4
.L001AD4A0:
/* AD5A0 001AD4A0 0000C38C */  lw         $3, 0x0($6)
/* AD5A4 001AD4A4 0400C28C */  lw         $2, 0x4($6)
/* AD5A8 001AD4A8 0800C624 */  addiu      $6, $6, 0x8
/* AD5AC 001AD4AC FFFF8424 */  addiu      $4, $4, -0x1
/* AD5B0 001AD4B0 0000A3AC */  sw         $3, 0x0($5)
/* AD5B4 001AD4B4 0400A2AC */  sw         $2, 0x4($5)
/* AD5B8 001AD4B8 0800A524 */  addiu      $5, $5, 0x8
/* AD5BC 001AD4BC F8FF801C */  bgtz       $4, .L001AD4A0
/* AD5C0 001AD4C0 00000000 */   nop
/* AD5C4 001AD4C4 2110D402 */  addu       $2, $22, $20
/* AD5C8 001AD4C8 30048626 */  addiu      $6, $20, 0x430
/* AD5CC 001AD4CC E0154524 */  addiu      $5, $2, 0x15E0
/* AD5D0 001AD4D0 80000424 */  addiu      $4, $0, 0x80
.L001AD4D4:
/* AD5D4 001AD4D4 0000C38C */  lw         $3, 0x0($6)
/* AD5D8 001AD4D8 0400C28C */  lw         $2, 0x4($6)
/* AD5DC 001AD4DC 0800C624 */  addiu      $6, $6, 0x8
/* AD5E0 001AD4E0 FFFF8424 */  addiu      $4, $4, -0x1
/* AD5E4 001AD4E4 0000A3AC */  sw         $3, 0x0($5)
/* AD5E8 001AD4E8 0400A2AC */  sw         $2, 0x4($5)
/* AD5EC 001AD4EC 0800A524 */  addiu      $5, $5, 0x8
/* AD5F0 001AD4F0 F8FF801C */  bgtz       $4, .L001AD4D4
/* AD5F4 001AD4F4 00000000 */   nop
/* AD5F8 001AD4F8 2110D402 */  addu       $2, $22, $20
/* AD5FC 001AD4FC 30088626 */  addiu      $6, $20, 0x830
/* AD600 001AD500 E0194524 */  addiu      $5, $2, 0x19E0
/* AD604 001AD504 80000424 */  addiu      $4, $0, 0x80
.L001AD508:
/* AD608 001AD508 0000C38C */  lw         $3, 0x0($6)
/* AD60C 001AD50C 0400C28C */  lw         $2, 0x4($6)
/* AD610 001AD510 0800C624 */  addiu      $6, $6, 0x8
/* AD614 001AD514 FFFF8424 */  addiu      $4, $4, -0x1
/* AD618 001AD518 0000A3AC */  sw         $3, 0x0($5)
/* AD61C 001AD51C 0400A2AC */  sw         $2, 0x4($5)
/* AD620 001AD520 0800A524 */  addiu      $5, $5, 0x8
/* AD624 001AD524 F8FF801C */  bgtz       $4, .L001AD508
/* AD628 001AD528 00000000 */   nop
/* AD62C 001AD52C 2110D402 */  addu       $2, $22, $20
/* AD630 001AD530 E01D4224 */  addiu      $2, $2, 0x1DE0
/* AD634 001AD534 300C8726 */  addiu      $7, $20, 0xC30
/* AD638 001AD538 04000524 */  addiu      $5, $0, 0x4
/* AD63C 001AD53C 28364070 */  paddub     $6, $2, $0
.L001AD540:
/* AD640 001AD540 0000E48C */  lw         $4, 0x0($7)
/* AD644 001AD544 0400E38C */  lw         $3, 0x4($7)
/* AD648 001AD548 0800E724 */  addiu      $7, $7, 0x8
/* AD64C 001AD54C FFFFA524 */  addiu      $5, $5, -0x1
/* AD650 001AD550 0000C4AC */  sw         $4, 0x0($6)
/* AD654 001AD554 0400C3AC */  sw         $3, 0x4($6)
/* AD658 001AD558 0800C624 */  addiu      $6, $6, 0x8
/* AD65C 001AD55C F8FFA01C */  bgtz       $5, .L001AD540
/* AD660 001AD560 00000000 */   nop
/* AD664 001AD564 2118D402 */  addu       $3, $22, $20
/* AD668 001AD568 500C8726 */  addiu      $7, $20, 0xC50
/* AD66C 001AD56C 001E6624 */  addiu      $6, $3, 0x1E00
/* AD670 001AD570 04000524 */  addiu      $5, $0, 0x4
.L001AD574:
/* AD674 001AD574 0000E48C */  lw         $4, 0x0($7)
/* AD678 001AD578 0400E38C */  lw         $3, 0x4($7)
/* AD67C 001AD57C 0800E724 */  addiu      $7, $7, 0x8
/* AD680 001AD580 FFFFA524 */  addiu      $5, $5, -0x1
/* AD684 001AD584 0000C4AC */  sw         $4, 0x0($6)
/* AD688 001AD588 0400C3AC */  sw         $3, 0x4($6)
/* AD68C 001AD58C 0800C624 */  addiu      $6, $6, 0x8
/* AD690 001AD590 F8FFA01C */  bgtz       $5, .L001AD574
/* AD694 001AD594 00000000 */   nop
/* AD698 001AD598 700C80C6 */  lwc1       $f0, 0xC70($20)
/* AD69C 001AD59C 2120D402 */  addu       $4, $22, $20
/* AD6A0 001AD5A0 201E80E4 */  swc1       $f0, 0x1E20($4)
/* AD6A4 001AD5A4 740C838E */  lw         $3, 0xC74($20)
/* AD6A8 001AD5A8 241E83AC */  sw         $3, 0x1E24($4)
/* AD6AC 001AD5AC 780C838E */  lw         $3, 0xC78($20)
/* AD6B0 001AD5B0 281E83AC */  sw         $3, 0x1E28($4)
/* AD6B4 001AD5B4 7C0C80C6 */  lwc1       $f0, 0xC7C($20)
/* AD6B8 001AD5B8 2C1E80E4 */  swc1       $f0, 0x1E2C($4)
/* AD6BC 001AD5BC 800C838E */  lw         $3, 0xC80($20)
/* AD6C0 001AD5C0 301E83AC */  sw         $3, 0x1E30($4)
/* AD6C4 001AD5C4 840C838E */  lw         $3, 0xC84($20)
/* AD6C8 001AD5C8 341E83AC */  sw         $3, 0x1E34($4)
/* AD6CC 001AD5CC 880C8726 */  addiu      $7, $20, 0xC88
/* AD6D0 001AD5D0 381E8624 */  addiu      $6, $4, 0x1E38
/* AD6D4 001AD5D4 04000524 */  addiu      $5, $0, 0x4
.L001AD5D8:
/* AD6D8 001AD5D8 0000E48C */  lw         $4, 0x0($7)
/* AD6DC 001AD5DC 0400E38C */  lw         $3, 0x4($7)
/* AD6E0 001AD5E0 0800E724 */  addiu      $7, $7, 0x8
/* AD6E4 001AD5E4 FFFFA524 */  addiu      $5, $5, -0x1
/* AD6E8 001AD5E8 0000C4AC */  sw         $4, 0x0($6)
/* AD6EC 001AD5EC 0400C3AC */  sw         $3, 0x4($6)
/* AD6F0 001AD5F0 0800C624 */  addiu      $6, $6, 0x8
/* AD6F4 001AD5F4 F8FFA01C */  bgtz       $5, .L001AD5D8
/* AD6F8 001AD5F8 00000000 */   nop
/* AD6FC 001AD5FC A80C838E */  lw         $3, 0xCA8($20)
/* AD700 001AD600 2120D402 */  addu       $4, $22, $20
/* AD704 001AD604 581E83AC */  sw         $3, 0x1E58($4)
/* AD708 001AD608 AC0C838E */  lw         $3, 0xCAC($20)
/* AD70C 001AD60C 5C1E83AC */  sw         $3, 0x1E5C($4)
/* AD710 001AD610 B00C838E */  lw         $3, 0xCB0($20)
/* AD714 001AD614 601E83AC */  sw         $3, 0x1E60($4)
/* AD718 001AD618 C00C8726 */  addiu      $7, $20, 0xCC0
/* AD71C 001AD61C 701E8624 */  addiu      $6, $4, 0x1E70
/* AD720 001AD620 04000524 */  addiu      $5, $0, 0x4
.L001AD624:
/* AD724 001AD624 0000E48C */  lw         $4, 0x0($7)
/* AD728 001AD628 0400E38C */  lw         $3, 0x4($7)
/* AD72C 001AD62C 0800E724 */  addiu      $7, $7, 0x8
/* AD730 001AD630 FFFFA524 */  addiu      $5, $5, -0x1
/* AD734 001AD634 0000C4AC */  sw         $4, 0x0($6)
/* AD738 001AD638 0400C3AC */  sw         $3, 0x4($6)
/* AD73C 001AD63C 0800C624 */  addiu      $6, $6, 0x8
/* AD740 001AD640 F8FFA01C */  bgtz       $5, .L001AD624
/* AD744 001AD644 00000000 */   nop
/* AD748 001AD648 2118D402 */  addu       $3, $22, $20
/* AD74C 001AD64C E00C83C6 */  lwc1       $f3, 0xCE0($20)
/* AD750 001AD650 E40C82C6 */  lwc1       $f2, 0xCE4($20)
/* AD754 001AD654 E80C81C6 */  lwc1       $f1, 0xCE8($20)
/* AD758 001AD658 EC0C80C6 */  lwc1       $f0, 0xCEC($20)
/* AD75C 001AD65C 901E63E4 */  swc1       $f3, 0x1E90($3)
/* AD760 001AD660 941E62E4 */  swc1       $f2, 0x1E94($3)
/* AD764 001AD664 981E61E4 */  swc1       $f1, 0x1E98($3)
/* AD768 001AD668 9C1E60E4 */  swc1       $f0, 0x1E9C($3)
/* AD76C 001AD66C F00C83C6 */  lwc1       $f3, 0xCF0($20)
/* AD770 001AD670 F40C82C6 */  lwc1       $f2, 0xCF4($20)
/* AD774 001AD674 F80C81C6 */  lwc1       $f1, 0xCF8($20)
/* AD778 001AD678 FC0C80C6 */  lwc1       $f0, 0xCFC($20)
/* AD77C 001AD67C A01E63E4 */  swc1       $f3, 0x1EA0($3)
/* AD780 001AD680 A41E62E4 */  swc1       $f2, 0x1EA4($3)
/* AD784 001AD684 A81E61E4 */  swc1       $f1, 0x1EA8($3)
/* AD788 001AD688 AC1E60E4 */  swc1       $f0, 0x1EAC($3)
/* AD78C 001AD68C 000D83C6 */  lwc1       $f3, 0xD00($20)
/* AD790 001AD690 040D82C6 */  lwc1       $f2, 0xD04($20)
/* AD794 001AD694 080D81C6 */  lwc1       $f1, 0xD08($20)
/* AD798 001AD698 0C0D80C6 */  lwc1       $f0, 0xD0C($20)
/* AD79C 001AD69C B01E63E4 */  swc1       $f3, 0x1EB0($3)
/* AD7A0 001AD6A0 B41E62E4 */  swc1       $f2, 0x1EB4($3)
/* AD7A4 001AD6A4 B81E61E4 */  swc1       $f1, 0x1EB8($3)
/* AD7A8 001AD6A8 BC1E60E4 */  swc1       $f0, 0x1EBC($3)
/* AD7AC 001AD6AC 100D8726 */  addiu      $7, $20, 0xD10
/* AD7B0 001AD6B0 C01E6624 */  addiu      $6, $3, 0x1EC0
/* AD7B4 001AD6B4 0C000524 */  addiu      $5, $0, 0xC
.L001AD6B8:
/* AD7B8 001AD6B8 0000E48C */  lw         $4, 0x0($7)
/* AD7BC 001AD6BC 0400E38C */  lw         $3, 0x4($7)
/* AD7C0 001AD6C0 0800E724 */  addiu      $7, $7, 0x8
/* AD7C4 001AD6C4 FFFFA524 */  addiu      $5, $5, -0x1
/* AD7C8 001AD6C8 0000C4AC */  sw         $4, 0x0($6)
/* AD7CC 001AD6CC 0400C3AC */  sw         $3, 0x4($6)
/* AD7D0 001AD6D0 0800C624 */  addiu      $6, $6, 0x8
/* AD7D4 001AD6D4 F8FFA01C */  bgtz       $5, .L001AD6B8
/* AD7D8 001AD6D8 00000000 */   nop
/* AD7DC 001AD6DC 2118D402 */  addu       $3, $22, $20
/* AD7E0 001AD6E0 700D8726 */  addiu      $7, $20, 0xD70
/* AD7E4 001AD6E4 201F6624 */  addiu      $6, $3, 0x1F20
/* AD7E8 001AD6E8 0F000524 */  addiu      $5, $0, 0xF
.L001AD6EC:
/* AD7EC 001AD6EC 0000E48C */  lw         $4, 0x0($7)
/* AD7F0 001AD6F0 0400E38C */  lw         $3, 0x4($7)
/* AD7F4 001AD6F4 0800E724 */  addiu      $7, $7, 0x8
/* AD7F8 001AD6F8 FFFFA524 */  addiu      $5, $5, -0x1
/* AD7FC 001AD6FC 0000C4AC */  sw         $4, 0x0($6)
/* AD800 001AD700 0400C3AC */  sw         $3, 0x4($6)
/* AD804 001AD704 0800C624 */  addiu      $6, $6, 0x8
/* AD808 001AD708 F8FFA01C */  bgtz       $5, .L001AD6EC
/* AD80C 001AD70C 00000000 */   nop
/* AD810 001AD710 E80D838E */  lw         $3, 0xDE8($20)
/* AD814 001AD714 2120D402 */  addu       $4, $22, $20
/* AD818 001AD718 981F83AC */  sw         $3, 0x1F98($4)
/* AD81C 001AD71C EC0D838E */  lw         $3, 0xDEC($20)
/* AD820 001AD720 9C1F83AC */  sw         $3, 0x1F9C($4)
/* AD824 001AD724 F00D838E */  lw         $3, 0xDF0($20)
/* AD828 001AD728 A01F83AC */  sw         $3, 0x1FA0($4)
/* AD82C 001AD72C F40D838E */  lw         $3, 0xDF4($20)
/* AD830 001AD730 A41F83AC */  sw         $3, 0x1FA4($4)
/* AD834 001AD734 F80D8726 */  addiu      $7, $20, 0xDF8
/* AD838 001AD738 A81F8624 */  addiu      $6, $4, 0x1FA8
/* AD83C 001AD73C 50000524 */  addiu      $5, $0, 0x50
.L001AD740:
/* AD840 001AD740 0000E48C */  lw         $4, 0x0($7)
/* AD844 001AD744 0400E38C */  lw         $3, 0x4($7)
/* AD848 001AD748 0800E724 */  addiu      $7, $7, 0x8
/* AD84C 001AD74C FFFFA524 */  addiu      $5, $5, -0x1
/* AD850 001AD750 0000C4AC */  sw         $4, 0x0($6)
/* AD854 001AD754 0400C3AC */  sw         $3, 0x4($6)
/* AD858 001AD758 0800C624 */  addiu      $6, $6, 0x8
/* AD85C 001AD75C F8FFA01C */  bgtz       $5, .L001AD740
/* AD860 001AD760 00000000 */   nop
/* AD864 001AD764 2118D402 */  addu       $3, $22, $20
/* AD868 001AD768 78108726 */  addiu      $7, $20, 0x1078
/* AD86C 001AD76C 28226624 */  addiu      $6, $3, 0x2228
/* AD870 001AD770 28000524 */  addiu      $5, $0, 0x28
.L001AD774:
/* AD874 001AD774 0000E48C */  lw         $4, 0x0($7)
/* AD878 001AD778 0400E38C */  lw         $3, 0x4($7)
/* AD87C 001AD77C 0800E724 */  addiu      $7, $7, 0x8
/* AD880 001AD780 FFFFA524 */  addiu      $5, $5, -0x1
/* AD884 001AD784 0000C4AC */  sw         $4, 0x0($6)
/* AD888 001AD788 0400C3AC */  sw         $3, 0x4($6)
/* AD88C 001AD78C 0800C624 */  addiu      $6, $6, 0x8
/* AD890 001AD790 F8FFA01C */  bgtz       $5, .L001AD774
/* AD894 001AD794 00000000 */   nop
/* AD898 001AD798 A014E326 */  addiu      $3, $23, 0x14A0
/* AD89C 001AD79C 000043AC */  sw         $3, 0x0($2)
/* AD8A0 001AD7A0 CC00848E */  lw         $4, 0xCC($20)
/* AD8A4 001AD7A4 282E4072 */  paddub     $5, $18, $0
/* AD8A8 001AD7A8 849D040C */  jal        CopyFrameVu1__FP9CFrameVu1P14CDataAlloc2_1_
/* AD8AC 001AD7AC 00000000 */   nop
/* AD8B0 001AD7B0 000002AE */  sw         $2, 0x0($16)
/* AD8B4 001AD7B4 0100B526 */  addiu      $21, $21, 0x1
.L001AD7B8:
/* AD8B8 001AD7B8 2A10B102 */  slt        $2, $21, $17
/* AD8BC 001AD7BC DEFE4014 */  bnez       $2, .L001AD338
/* AD8C0 001AD7C0 00000000 */   nop
/* AD8C4 001AD7C4 000093AE */  sw         $19, 0x0($20)
/* AD8C8 001AD7C8 0000848E */  lw         $4, 0x0($20)
/* AD8CC 001AD7CC 28160070 */  paddub     $2, $0, $0
/* AD8D0 001AD7D0 01000324 */  addiu      $3, $0, 0x1
/* AD8D4 001AD7D4 0B106400 */  movn       $2, $3, $4
.L001AD7D8:
/* AD8D8 001AD7D8 8000BF7B */  lq         $31, 0x80($sp)
/* AD8DC 001AD7DC 7000B77B */  lq         $23, 0x70($sp)
/* AD8E0 001AD7E0 6000B67B */  lq         $22, 0x60($sp)
/* AD8E4 001AD7E4 5000B57B */  lq         $21, 0x50($sp)
/* AD8E8 001AD7E8 4000B47B */  lq         $20, 0x40($sp)
/* AD8EC 001AD7EC 3000B37B */  lq         $19, 0x30($sp)
/* AD8F0 001AD7F0 2000B27B */  lq         $18, 0x20($sp)
/* AD8F4 001AD7F4 1000B17B */  lq         $17, 0x10($sp)
/* AD8F8 001AD7F8 0000B07B */  lq         $16, 0x0($sp)
/* AD8FC 001AD7FC D000BD27 */  addiu      $sp, $sp, 0xD0
/* AD900 001AD800 0800E003 */  jr         $31
/* AD904 001AD804 00000000 */   nop
/* AD908 001AD808 00000000 */  nop
/* AD90C 001AD80C 00000000 */  nop
