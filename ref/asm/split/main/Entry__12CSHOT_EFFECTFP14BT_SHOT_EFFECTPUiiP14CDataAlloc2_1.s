.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Entry__12CSHOT_EFFECTFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
/* 0ACD70 001ACC70 30FFBD27 */  addiu       $29, $29, -0xD0
/* 0ACD74 001ACC74 8000BF7F */  sq          $31, 0x80($29)
/* 0ACD78 001ACC78 7000B77F */  sq          $23, 0x70($29)
/* 0ACD7C 001ACC7C 6000B67F */  sq          $22, 0x60($29)
/* 0ACD80 001ACC80 5000B57F */  sq          $21, 0x50($29)
/* 0ACD84 001ACC84 4000B47F */  sq          $20, 0x40($29)
/* 0ACD88 001ACC88 3000B37F */  sq          $19, 0x30($29)
/* 0ACD8C 001ACC8C 2000B27F */  sq          $18, 0x20($29)
/* 0ACD90 001ACC90 1000B17F */  sq          $17, 0x10($29)
/* 0ACD94 001ACC94 0000B07F */  sq          $16, 0x0($29)
/* 0ACD98 001ACC98 28A68070 */  paddub      $20, $4, $0
/* 0ACD9C 001ACC9C 289EA070 */  paddub      $19, $5, $0
/* 0ACDA0 001ACCA0 28AEC070 */  paddub      $21, $6, $0
/* 0ACDA4 001ACCA4 2886E070 */  paddub      $16, $7, $0
/* 0ACDA8 001ACCA8 28960071 */  paddub      $18, $8, $0
/* 0ACDAC 001ACCAC 288E2071 */  paddub      $17, $9, $0
/* 0ACDB0 001ACCB0 0000828C */  lw          $2, 0x0($4)
/* 0ACDB4 001ACCB4 04004010 */  beqz        $2, .L001ACCC8
/* 0ACDB8 001ACCB8 00000000 */   nop
/* 0ACDBC 001ACCBC 28160070 */  paddub      $2, $0, $0
/* 0ACDC0 001ACCC0 58010010 */  b           .L001AD224
/* 0ACDC4 001ACCC4 00000000 */   nop
.L001ACCC8:
/* 0ACDC8 001ACCC8 9000A427 */  addiu       $4, $29, 0x90
/* 0ACDCC 001ACCCC 2A00023C */  lui         $2, %hi(LIT_899)
/* 0ACDD0 001ACCD0 E0B44524 */  addiu       $5, $2, %lo(LIT_899)
/* 0ACDD4 001ACCD4 28366072 */  paddub      $6, $19, $0
/* 0ACDD8 001ACCD8 1614040C */  jal         sprintf
/* 0ACDDC 001ACCDC 00000000 */   nop
/* 0ACDE0 001ACCE0 9000A427 */  addiu       $4, $29, 0x90
/* 0ACDE4 001ACCE4 282EA072 */  paddub      $5, $21, $0
/* 0ACDE8 001ACCE8 28360070 */  paddub      $6, $0, $0
/* 0ACDEC 001ACCEC D8FC040C */  jal         LoadFile__FPcPvPi
/* 0ACDF0 001ACCF0 00000000 */   nop
/* 0ACDF4 001ACCF4 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 0ACDF8 001ACCF8 00000000 */   nop
/* 0ACDFC 001ACCFC 0100013C */  lui         $1, (0x10000 >> 16)
/* 0ACE00 001ACD00 21088102 */  addu        $1, $20, $1
/* 0ACE04 001ACD04 54A130AC */  sw          $16, -0x5EAC($1)
/* 0ACE08 001ACD08 9000A427 */  addiu       $4, $29, 0x90
/* 0ACE0C 001ACD0C 2A00023C */  lui         $2, %hi(LIT_900)
/* 0ACE10 001ACD10 F8B44524 */  addiu       $5, $2, %lo(LIT_900)
/* 0ACE14 001ACD14 28366072 */  paddub      $6, $19, $0
/* 0ACE18 001ACD18 1614040C */  jal         sprintf
/* 0ACE1C 001ACD1C 00000000 */   nop
/* 0ACE20 001ACD20 10008426 */  addiu       $4, $20, 0x10
/* 0ACE24 001ACD24 B000998E */  lw          $25, 0xB0($20)
/* 0ACE28 001ACD28 C400398F */  lw          $25, 0xC4($25)
/* 0ACE2C 001ACD2C 09F82003 */  jalr        $25
/* 0ACE30 001ACD30 00000000 */   nop
/* 0ACE34 001ACD34 10008426 */  addiu       $4, $20, 0x10
/* 0ACE38 001ACD38 282EA072 */  paddub      $5, $21, $0
/* 0ACE3C 001ACD3C 9000A627 */  addiu       $6, $29, 0x90
/* 0ACE40 001ACD40 283E4072 */  paddub      $7, $18, $0
/* 0ACE44 001ACD44 0100013C */  lui         $1, (0x10000 >> 16)
/* 0ACE48 001ACD48 21088102 */  addu        $1, $20, $1
/* 0ACE4C 001ACD4C 54A1288C */  lw          $8, -0x5EAC($1)
/* 0ACE50 001ACD50 284E4072 */  paddub      $9, $18, $0
/* 0ACE54 001ACD54 01000A24 */  addiu       $10, $0, 0x1
/* 0ACE58 001ACD58 10000B24 */  addiu       $11, $0, 0x10
/* 0ACE5C 001ACD5C B000998E */  lw          $25, 0xB0($20)
/* 0ACE60 001ACD60 C000398F */  lw          $25, 0xC0($25)
/* 0ACE64 001ACD64 09F82003 */  jalr        $25
/* 0ACE68 001ACD68 00000000 */   nop
/* 0ACE6C 001ACD6C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0ACE70 001ACD70 21088102 */  addu        $1, $20, $1
/* 0ACE74 001ACD74 4CA131AC */  sw          $17, -0x5EB4($1)
/* 0ACE78 001ACD78 28AE0070 */  paddub      $21, $0, $0
/* 0ACE7C 001ACD7C 21010010 */  b           .L001AD204
/* 0ACE80 001ACD80 00000000 */   nop
.L001ACD84:
/* 0ACE84 001ACD84 B0110224 */  addiu       $2, $0, 0x11B0
/* 0ACE88 001ACD88 18B0A202 */  mult        $22, $21, $2
/* 0ACE8C 001ACD8C 21B89602 */  addu        $23, $20, $22
/* 0ACE90 001ACD90 C011E426 */  addiu       $4, $23, 0x11C0
/* 0ACE94 001ACD94 10008526 */  addiu       $5, $20, 0x10
/* 0ACE98 001ACD98 780C050C */  jal         func_001431E0
/* 0ACE9C 001ACD9C 00000000 */   nop
/* 0ACEA0 001ACDA0 C00080C6 */  lwc1        $f0, 0xC0($20)
/* 0ACEA4 001ACDA4 281EE072 */  paddub      $3, $23, $0
/* 0ACEA8 001ACDA8 701260E4 */  swc1        $f0, 0x1270($3)
/* 0ACEAC 001ACDAC C40080C6 */  lwc1        $f0, 0xC4($20)
/* 0ACEB0 001ACDB0 741260E4 */  swc1        $f0, 0x1274($3)
/* 0ACEB4 001ACDB4 C80080C6 */  lwc1        $f0, 0xC8($20)
/* 0ACEB8 001ACDB8 781260E4 */  swc1        $f0, 0x1278($3)
/* 0ACEBC 001ACDBC CC00828E */  lw          $2, 0xCC($20)
/* 0ACEC0 001ACDC0 7C127024 */  addiu       $16, $3, 0x127C
/* 0ACEC4 001ACDC4 7C1262AC */  sw          $2, 0x127C($3)
/* 0ACEC8 001ACDC8 D000828E */  lw          $2, 0xD0($20)
/* 0ACECC 001ACDCC 801262AC */  sw          $2, 0x1280($3)
/* 0ACED0 001ACDD0 D40083C6 */  lwc1        $f3, 0xD4($20)
/* 0ACED4 001ACDD4 D80082C6 */  lwc1        $f2, 0xD8($20)
/* 0ACED8 001ACDD8 DC0081C6 */  lwc1        $f1, 0xDC($20)
/* 0ACEDC 001ACDDC E00080C6 */  lwc1        $f0, 0xE0($20)
/* 0ACEE0 001ACDE0 841263E4 */  swc1        $f3, 0x1284($3)
/* 0ACEE4 001ACDE4 881262E4 */  swc1        $f2, 0x1288($3)
/* 0ACEE8 001ACDE8 8C1261E4 */  swc1        $f1, 0x128C($3)
/* 0ACEEC 001ACDEC 901260E4 */  swc1        $f0, 0x1290($3)
/* 0ACEF0 001ACDF0 E400828E */  lw          $2, 0xE4($20)
/* 0ACEF4 001ACDF4 941262AC */  sw          $2, 0x1294($3)
/* 0ACEF8 001ACDF8 E800828E */  lw          $2, 0xE8($20)
/* 0ACEFC 001ACDFC 981262AC */  sw          $2, 0x1298($3)
/* 0ACF00 001ACE00 EC008626 */  addiu       $6, $20, 0xEC
/* 0ACF04 001ACE04 9C126524 */  addiu       $5, $3, 0x129C
/* 0ACF08 001ACE08 3E000424 */  addiu       $4, $0, 0x3E
.L001ACE0C:
/* 0ACF0C 001ACE0C 0000C38C */  lw          $3, 0x0($6)
/* 0ACF10 001ACE10 0400C28C */  lw          $2, 0x4($6)
/* 0ACF14 001ACE14 0800C624 */  addiu       $6, $6, 0x8
/* 0ACF18 001ACE18 FFFF8424 */  addiu       $4, $4, -0x1
/* 0ACF1C 001ACE1C 0000A3AC */  sw          $3, 0x0($5)
/* 0ACF20 001ACE20 0400A2AC */  sw          $2, 0x4($5)
/* 0ACF24 001ACE24 0800A524 */  addiu       $5, $5, 0x8
/* 0ACF28 001ACE28 F8FF801C */  bgtz        $4, .L001ACE0C
/* 0ACF2C 001ACE2C 00000000 */   nop
/* 0ACF30 001ACE30 DC02828E */  lw          $2, 0x2DC($20)
/* 0ACF34 001ACE34 2118D402 */  addu        $3, $22, $20
/* 0ACF38 001ACE38 8C1462AC */  sw          $2, 0x148C($3)
/* 0ACF3C 001ACE3C E002828E */  lw          $2, 0x2E0($20)
/* 0ACF40 001ACE40 901462AC */  sw          $2, 0x1490($3)
/* 0ACF44 001ACE44 F0028626 */  addiu       $6, $20, 0x2F0
/* 0ACF48 001ACE48 A0146524 */  addiu       $5, $3, 0x14A0
/* 0ACF4C 001ACE4C 04000424 */  addiu       $4, $0, 0x4
.L001ACE50:
/* 0ACF50 001ACE50 0000C378 */  lq          $3, 0x0($6)
/* 0ACF54 001ACE54 1000C278 */  lq          $2, 0x10($6)
/* 0ACF58 001ACE58 2000C624 */  addiu       $6, $6, 0x20
/* 0ACF5C 001ACE5C FFFF8424 */  addiu       $4, $4, -0x1
/* 0ACF60 001ACE60 0000A37C */  sq          $3, 0x0($5)
/* 0ACF64 001ACE64 1000A27C */  sq          $2, 0x10($5)
/* 0ACF68 001ACE68 2000A524 */  addiu       $5, $5, 0x20
/* 0ACF6C 001ACE6C F8FF801C */  bgtz        $4, .L001ACE50
/* 0ACF70 001ACE70 00000000 */   nop
/* 0ACF74 001ACE74 2110D402 */  addu        $2, $22, $20
/* 0ACF78 001ACE78 70038626 */  addiu       $6, $20, 0x370
/* 0ACF7C 001ACE7C 20154524 */  addiu       $5, $2, 0x1520
/* 0ACF80 001ACE80 04000424 */  addiu       $4, $0, 0x4
.L001ACE84:
/* 0ACF84 001ACE84 0000C378 */  lq          $3, 0x0($6)
/* 0ACF88 001ACE88 1000C278 */  lq          $2, 0x10($6)
/* 0ACF8C 001ACE8C 2000C624 */  addiu       $6, $6, 0x20
/* 0ACF90 001ACE90 FFFF8424 */  addiu       $4, $4, -0x1
/* 0ACF94 001ACE94 0000A37C */  sq          $3, 0x0($5)
/* 0ACF98 001ACE98 1000A27C */  sq          $2, 0x10($5)
/* 0ACF9C 001ACE9C 2000A524 */  addiu       $5, $5, 0x20
/* 0ACFA0 001ACEA0 F8FF801C */  bgtz        $4, .L001ACE84
/* 0ACFA4 001ACEA4 00000000 */   nop
/* 0ACFA8 001ACEA8 2110D402 */  addu        $2, $22, $20
/* 0ACFAC 001ACEAC F0038626 */  addiu       $6, $20, 0x3F0
/* 0ACFB0 001ACEB0 A0154524 */  addiu       $5, $2, 0x15A0
/* 0ACFB4 001ACEB4 04000424 */  addiu       $4, $0, 0x4
.L001ACEB8:
/* 0ACFB8 001ACEB8 0000C38C */  lw          $3, 0x0($6)
/* 0ACFBC 001ACEBC 0400C28C */  lw          $2, 0x4($6)
/* 0ACFC0 001ACEC0 0800C624 */  addiu       $6, $6, 0x8
/* 0ACFC4 001ACEC4 FFFF8424 */  addiu       $4, $4, -0x1
/* 0ACFC8 001ACEC8 0000A3AC */  sw          $3, 0x0($5)
/* 0ACFCC 001ACECC 0400A2AC */  sw          $2, 0x4($5)
/* 0ACFD0 001ACED0 0800A524 */  addiu       $5, $5, 0x8
/* 0ACFD4 001ACED4 F8FF801C */  bgtz        $4, .L001ACEB8
/* 0ACFD8 001ACED8 00000000 */   nop
/* 0ACFDC 001ACEDC 2110D402 */  addu        $2, $22, $20
/* 0ACFE0 001ACEE0 10048626 */  addiu       $6, $20, 0x410
/* 0ACFE4 001ACEE4 C0154524 */  addiu       $5, $2, 0x15C0
/* 0ACFE8 001ACEE8 04000424 */  addiu       $4, $0, 0x4
.L001ACEEC:
/* 0ACFEC 001ACEEC 0000C38C */  lw          $3, 0x0($6)
/* 0ACFF0 001ACEF0 0400C28C */  lw          $2, 0x4($6)
/* 0ACFF4 001ACEF4 0800C624 */  addiu       $6, $6, 0x8
/* 0ACFF8 001ACEF8 FFFF8424 */  addiu       $4, $4, -0x1
/* 0ACFFC 001ACEFC 0000A3AC */  sw          $3, 0x0($5)
/* 0AD000 001ACF00 0400A2AC */  sw          $2, 0x4($5)
/* 0AD004 001ACF04 0800A524 */  addiu       $5, $5, 0x8
/* 0AD008 001ACF08 F8FF801C */  bgtz        $4, .L001ACEEC
/* 0AD00C 001ACF0C 00000000 */   nop
/* 0AD010 001ACF10 2110D402 */  addu        $2, $22, $20
/* 0AD014 001ACF14 30048626 */  addiu       $6, $20, 0x430
/* 0AD018 001ACF18 E0154524 */  addiu       $5, $2, 0x15E0
/* 0AD01C 001ACF1C 80000424 */  addiu       $4, $0, 0x80
.L001ACF20:
/* 0AD020 001ACF20 0000C38C */  lw          $3, 0x0($6)
/* 0AD024 001ACF24 0400C28C */  lw          $2, 0x4($6)
/* 0AD028 001ACF28 0800C624 */  addiu       $6, $6, 0x8
/* 0AD02C 001ACF2C FFFF8424 */  addiu       $4, $4, -0x1
/* 0AD030 001ACF30 0000A3AC */  sw          $3, 0x0($5)
/* 0AD034 001ACF34 0400A2AC */  sw          $2, 0x4($5)
/* 0AD038 001ACF38 0800A524 */  addiu       $5, $5, 0x8
/* 0AD03C 001ACF3C F8FF801C */  bgtz        $4, .L001ACF20
/* 0AD040 001ACF40 00000000 */   nop
/* 0AD044 001ACF44 2110D402 */  addu        $2, $22, $20
/* 0AD048 001ACF48 30088626 */  addiu       $6, $20, 0x830
/* 0AD04C 001ACF4C E0194524 */  addiu       $5, $2, 0x19E0
/* 0AD050 001ACF50 80000424 */  addiu       $4, $0, 0x80
.L001ACF54:
/* 0AD054 001ACF54 0000C38C */  lw          $3, 0x0($6)
/* 0AD058 001ACF58 0400C28C */  lw          $2, 0x4($6)
/* 0AD05C 001ACF5C 0800C624 */  addiu       $6, $6, 0x8
/* 0AD060 001ACF60 FFFF8424 */  addiu       $4, $4, -0x1
/* 0AD064 001ACF64 0000A3AC */  sw          $3, 0x0($5)
/* 0AD068 001ACF68 0400A2AC */  sw          $2, 0x4($5)
/* 0AD06C 001ACF6C 0800A524 */  addiu       $5, $5, 0x8
/* 0AD070 001ACF70 F8FF801C */  bgtz        $4, .L001ACF54
/* 0AD074 001ACF74 00000000 */   nop
/* 0AD078 001ACF78 2110D402 */  addu        $2, $22, $20
/* 0AD07C 001ACF7C E01D4224 */  addiu       $2, $2, 0x1DE0
/* 0AD080 001ACF80 300C8726 */  addiu       $7, $20, 0xC30
/* 0AD084 001ACF84 04000524 */  addiu       $5, $0, 0x4
/* 0AD088 001ACF88 28364070 */  paddub      $6, $2, $0
.L001ACF8C:
/* 0AD08C 001ACF8C 0000E48C */  lw          $4, 0x0($7)
/* 0AD090 001ACF90 0400E38C */  lw          $3, 0x4($7)
/* 0AD094 001ACF94 0800E724 */  addiu       $7, $7, 0x8
/* 0AD098 001ACF98 FFFFA524 */  addiu       $5, $5, -0x1
/* 0AD09C 001ACF9C 0000C4AC */  sw          $4, 0x0($6)
/* 0AD0A0 001ACFA0 0400C3AC */  sw          $3, 0x4($6)
/* 0AD0A4 001ACFA4 0800C624 */  addiu       $6, $6, 0x8
/* 0AD0A8 001ACFA8 F8FFA01C */  bgtz        $5, .L001ACF8C
/* 0AD0AC 001ACFAC 00000000 */   nop
/* 0AD0B0 001ACFB0 2118D402 */  addu        $3, $22, $20
/* 0AD0B4 001ACFB4 500C8726 */  addiu       $7, $20, 0xC50
/* 0AD0B8 001ACFB8 001E6624 */  addiu       $6, $3, 0x1E00
/* 0AD0BC 001ACFBC 04000524 */  addiu       $5, $0, 0x4
.L001ACFC0:
/* 0AD0C0 001ACFC0 0000E48C */  lw          $4, 0x0($7)
/* 0AD0C4 001ACFC4 0400E38C */  lw          $3, 0x4($7)
/* 0AD0C8 001ACFC8 0800E724 */  addiu       $7, $7, 0x8
/* 0AD0CC 001ACFCC FFFFA524 */  addiu       $5, $5, -0x1
/* 0AD0D0 001ACFD0 0000C4AC */  sw          $4, 0x0($6)
/* 0AD0D4 001ACFD4 0400C3AC */  sw          $3, 0x4($6)
/* 0AD0D8 001ACFD8 0800C624 */  addiu       $6, $6, 0x8
/* 0AD0DC 001ACFDC F8FFA01C */  bgtz        $5, .L001ACFC0
/* 0AD0E0 001ACFE0 00000000 */   nop
/* 0AD0E4 001ACFE4 700C80C6 */  lwc1        $f0, 0xC70($20)
/* 0AD0E8 001ACFE8 2120D402 */  addu        $4, $22, $20
/* 0AD0EC 001ACFEC 201E80E4 */  swc1        $f0, 0x1E20($4)
/* 0AD0F0 001ACFF0 740C838E */  lw          $3, 0xC74($20)
/* 0AD0F4 001ACFF4 241E83AC */  sw          $3, 0x1E24($4)
/* 0AD0F8 001ACFF8 780C838E */  lw          $3, 0xC78($20)
/* 0AD0FC 001ACFFC 281E83AC */  sw          $3, 0x1E28($4)
/* 0AD100 001AD000 7C0C80C6 */  lwc1        $f0, 0xC7C($20)
/* 0AD104 001AD004 2C1E80E4 */  swc1        $f0, 0x1E2C($4)
/* 0AD108 001AD008 800C838E */  lw          $3, 0xC80($20)
/* 0AD10C 001AD00C 301E83AC */  sw          $3, 0x1E30($4)
/* 0AD110 001AD010 840C838E */  lw          $3, 0xC84($20)
/* 0AD114 001AD014 341E83AC */  sw          $3, 0x1E34($4)
/* 0AD118 001AD018 880C8726 */  addiu       $7, $20, 0xC88
/* 0AD11C 001AD01C 381E8624 */  addiu       $6, $4, 0x1E38
/* 0AD120 001AD020 04000524 */  addiu       $5, $0, 0x4
.L001AD024:
/* 0AD124 001AD024 0000E48C */  lw          $4, 0x0($7)
/* 0AD128 001AD028 0400E38C */  lw          $3, 0x4($7)
/* 0AD12C 001AD02C 0800E724 */  addiu       $7, $7, 0x8
/* 0AD130 001AD030 FFFFA524 */  addiu       $5, $5, -0x1
/* 0AD134 001AD034 0000C4AC */  sw          $4, 0x0($6)
/* 0AD138 001AD038 0400C3AC */  sw          $3, 0x4($6)
/* 0AD13C 001AD03C 0800C624 */  addiu       $6, $6, 0x8
/* 0AD140 001AD040 F8FFA01C */  bgtz        $5, .L001AD024
/* 0AD144 001AD044 00000000 */   nop
/* 0AD148 001AD048 A80C838E */  lw          $3, 0xCA8($20)
/* 0AD14C 001AD04C 2120D402 */  addu        $4, $22, $20
/* 0AD150 001AD050 581E83AC */  sw          $3, 0x1E58($4)
/* 0AD154 001AD054 AC0C838E */  lw          $3, 0xCAC($20)
/* 0AD158 001AD058 5C1E83AC */  sw          $3, 0x1E5C($4)
/* 0AD15C 001AD05C B00C838E */  lw          $3, 0xCB0($20)
/* 0AD160 001AD060 601E83AC */  sw          $3, 0x1E60($4)
/* 0AD164 001AD064 C00C8726 */  addiu       $7, $20, 0xCC0
/* 0AD168 001AD068 701E8624 */  addiu       $6, $4, 0x1E70
/* 0AD16C 001AD06C 04000524 */  addiu       $5, $0, 0x4
.L001AD070:
/* 0AD170 001AD070 0000E48C */  lw          $4, 0x0($7)
/* 0AD174 001AD074 0400E38C */  lw          $3, 0x4($7)
/* 0AD178 001AD078 0800E724 */  addiu       $7, $7, 0x8
/* 0AD17C 001AD07C FFFFA524 */  addiu       $5, $5, -0x1
/* 0AD180 001AD080 0000C4AC */  sw          $4, 0x0($6)
/* 0AD184 001AD084 0400C3AC */  sw          $3, 0x4($6)
/* 0AD188 001AD088 0800C624 */  addiu       $6, $6, 0x8
/* 0AD18C 001AD08C F8FFA01C */  bgtz        $5, .L001AD070
/* 0AD190 001AD090 00000000 */   nop
/* 0AD194 001AD094 2118D402 */  addu        $3, $22, $20
/* 0AD198 001AD098 E00C83C6 */  lwc1        $f3, 0xCE0($20)
/* 0AD19C 001AD09C E40C82C6 */  lwc1        $f2, 0xCE4($20)
/* 0AD1A0 001AD0A0 E80C81C6 */  lwc1        $f1, 0xCE8($20)
/* 0AD1A4 001AD0A4 EC0C80C6 */  lwc1        $f0, 0xCEC($20)
/* 0AD1A8 001AD0A8 901E63E4 */  swc1        $f3, 0x1E90($3)
/* 0AD1AC 001AD0AC 941E62E4 */  swc1        $f2, 0x1E94($3)
/* 0AD1B0 001AD0B0 981E61E4 */  swc1        $f1, 0x1E98($3)
/* 0AD1B4 001AD0B4 9C1E60E4 */  swc1        $f0, 0x1E9C($3)
/* 0AD1B8 001AD0B8 F00C83C6 */  lwc1        $f3, 0xCF0($20)
/* 0AD1BC 001AD0BC F40C82C6 */  lwc1        $f2, 0xCF4($20)
/* 0AD1C0 001AD0C0 F80C81C6 */  lwc1        $f1, 0xCF8($20)
/* 0AD1C4 001AD0C4 FC0C80C6 */  lwc1        $f0, 0xCFC($20)
/* 0AD1C8 001AD0C8 A01E63E4 */  swc1        $f3, 0x1EA0($3)
/* 0AD1CC 001AD0CC A41E62E4 */  swc1        $f2, 0x1EA4($3)
/* 0AD1D0 001AD0D0 A81E61E4 */  swc1        $f1, 0x1EA8($3)
/* 0AD1D4 001AD0D4 AC1E60E4 */  swc1        $f0, 0x1EAC($3)
/* 0AD1D8 001AD0D8 000D83C6 */  lwc1        $f3, 0xD00($20)
/* 0AD1DC 001AD0DC 040D82C6 */  lwc1        $f2, 0xD04($20)
/* 0AD1E0 001AD0E0 080D81C6 */  lwc1        $f1, 0xD08($20)
/* 0AD1E4 001AD0E4 0C0D80C6 */  lwc1        $f0, 0xD0C($20)
/* 0AD1E8 001AD0E8 B01E63E4 */  swc1        $f3, 0x1EB0($3)
/* 0AD1EC 001AD0EC B41E62E4 */  swc1        $f2, 0x1EB4($3)
/* 0AD1F0 001AD0F0 B81E61E4 */  swc1        $f1, 0x1EB8($3)
/* 0AD1F4 001AD0F4 BC1E60E4 */  swc1        $f0, 0x1EBC($3)
/* 0AD1F8 001AD0F8 100D8726 */  addiu       $7, $20, 0xD10
/* 0AD1FC 001AD0FC C01E6624 */  addiu       $6, $3, 0x1EC0
/* 0AD200 001AD100 0C000524 */  addiu       $5, $0, 0xC
.L001AD104:
/* 0AD204 001AD104 0000E48C */  lw          $4, 0x0($7)
/* 0AD208 001AD108 0400E38C */  lw          $3, 0x4($7)
/* 0AD20C 001AD10C 0800E724 */  addiu       $7, $7, 0x8
/* 0AD210 001AD110 FFFFA524 */  addiu       $5, $5, -0x1
/* 0AD214 001AD114 0000C4AC */  sw          $4, 0x0($6)
/* 0AD218 001AD118 0400C3AC */  sw          $3, 0x4($6)
/* 0AD21C 001AD11C 0800C624 */  addiu       $6, $6, 0x8
/* 0AD220 001AD120 F8FFA01C */  bgtz        $5, .L001AD104
/* 0AD224 001AD124 00000000 */   nop
/* 0AD228 001AD128 2118D402 */  addu        $3, $22, $20
/* 0AD22C 001AD12C 700D8726 */  addiu       $7, $20, 0xD70
/* 0AD230 001AD130 201F6624 */  addiu       $6, $3, 0x1F20
/* 0AD234 001AD134 0F000524 */  addiu       $5, $0, 0xF
.L001AD138:
/* 0AD238 001AD138 0000E48C */  lw          $4, 0x0($7)
/* 0AD23C 001AD13C 0400E38C */  lw          $3, 0x4($7)
/* 0AD240 001AD140 0800E724 */  addiu       $7, $7, 0x8
/* 0AD244 001AD144 FFFFA524 */  addiu       $5, $5, -0x1
/* 0AD248 001AD148 0000C4AC */  sw          $4, 0x0($6)
/* 0AD24C 001AD14C 0400C3AC */  sw          $3, 0x4($6)
/* 0AD250 001AD150 0800C624 */  addiu       $6, $6, 0x8
/* 0AD254 001AD154 F8FFA01C */  bgtz        $5, .L001AD138
/* 0AD258 001AD158 00000000 */   nop
/* 0AD25C 001AD15C E80D838E */  lw          $3, 0xDE8($20)
/* 0AD260 001AD160 2120D402 */  addu        $4, $22, $20
/* 0AD264 001AD164 981F83AC */  sw          $3, 0x1F98($4)
/* 0AD268 001AD168 EC0D838E */  lw          $3, 0xDEC($20)
/* 0AD26C 001AD16C 9C1F83AC */  sw          $3, 0x1F9C($4)
/* 0AD270 001AD170 F00D838E */  lw          $3, 0xDF0($20)
/* 0AD274 001AD174 A01F83AC */  sw          $3, 0x1FA0($4)
/* 0AD278 001AD178 F40D838E */  lw          $3, 0xDF4($20)
/* 0AD27C 001AD17C A41F83AC */  sw          $3, 0x1FA4($4)
/* 0AD280 001AD180 F80D8726 */  addiu       $7, $20, 0xDF8
/* 0AD284 001AD184 A81F8624 */  addiu       $6, $4, 0x1FA8
/* 0AD288 001AD188 50000524 */  addiu       $5, $0, 0x50
.L001AD18C:
/* 0AD28C 001AD18C 0000E48C */  lw          $4, 0x0($7)
/* 0AD290 001AD190 0400E38C */  lw          $3, 0x4($7)
/* 0AD294 001AD194 0800E724 */  addiu       $7, $7, 0x8
/* 0AD298 001AD198 FFFFA524 */  addiu       $5, $5, -0x1
/* 0AD29C 001AD19C 0000C4AC */  sw          $4, 0x0($6)
/* 0AD2A0 001AD1A0 0400C3AC */  sw          $3, 0x4($6)
/* 0AD2A4 001AD1A4 0800C624 */  addiu       $6, $6, 0x8
/* 0AD2A8 001AD1A8 F8FFA01C */  bgtz        $5, .L001AD18C
/* 0AD2AC 001AD1AC 00000000 */   nop
/* 0AD2B0 001AD1B0 2118D402 */  addu        $3, $22, $20
/* 0AD2B4 001AD1B4 78108726 */  addiu       $7, $20, 0x1078
/* 0AD2B8 001AD1B8 28226624 */  addiu       $6, $3, 0x2228
/* 0AD2BC 001AD1BC 28000524 */  addiu       $5, $0, 0x28
.L001AD1C0:
/* 0AD2C0 001AD1C0 0000E48C */  lw          $4, 0x0($7)
/* 0AD2C4 001AD1C4 0400E38C */  lw          $3, 0x4($7)
/* 0AD2C8 001AD1C8 0800E724 */  addiu       $7, $7, 0x8
/* 0AD2CC 001AD1CC FFFFA524 */  addiu       $5, $5, -0x1
/* 0AD2D0 001AD1D0 0000C4AC */  sw          $4, 0x0($6)
/* 0AD2D4 001AD1D4 0400C3AC */  sw          $3, 0x4($6)
/* 0AD2D8 001AD1D8 0800C624 */  addiu       $6, $6, 0x8
/* 0AD2DC 001AD1DC F8FFA01C */  bgtz        $5, .L001AD1C0
/* 0AD2E0 001AD1E0 00000000 */   nop
/* 0AD2E4 001AD1E4 A014E326 */  addiu       $3, $23, 0x14A0
/* 0AD2E8 001AD1E8 000043AC */  sw          $3, 0x0($2)
/* 0AD2EC 001AD1EC CC00848E */  lw          $4, 0xCC($20)
/* 0AD2F0 001AD1F0 282E4072 */  paddub      $5, $18, $0
/* 0AD2F4 001AD1F4 849D040C */  jal         CopyFrameVu1__FP9CFrameVu1P14CDataAlloc2_1_
/* 0AD2F8 001AD1F8 00000000 */   nop
/* 0AD2FC 001AD1FC 000002AE */  sw          $2, 0x0($16)
/* 0AD300 001AD200 0100B526 */  addiu       $21, $21, 0x1
.L001AD204:
/* 0AD304 001AD204 2A10B102 */  slt         $2, $21, $17
/* 0AD308 001AD208 DEFE4014 */  bnez        $2, .L001ACD84
/* 0AD30C 001AD20C 00000000 */   nop
/* 0AD310 001AD210 000093AE */  sw          $19, 0x0($20)
/* 0AD314 001AD214 0000848E */  lw          $4, 0x0($20)
/* 0AD318 001AD218 28160070 */  paddub      $2, $0, $0
/* 0AD31C 001AD21C 01000324 */  addiu       $3, $0, 0x1
/* 0AD320 001AD220 0B106400 */  movn        $2, $3, $4
.L001AD224:
/* 0AD324 001AD224 8000BF7B */  lq          $31, 0x80($29)
/* 0AD328 001AD228 7000B77B */  lq          $23, 0x70($29)
/* 0AD32C 001AD22C 6000B67B */  lq          $22, 0x60($29)
/* 0AD330 001AD230 5000B57B */  lq          $21, 0x50($29)
/* 0AD334 001AD234 4000B47B */  lq          $20, 0x40($29)
/* 0AD338 001AD238 3000B37B */  lq          $19, 0x30($29)
/* 0AD33C 001AD23C 2000B27B */  lq          $18, 0x20($29)
/* 0AD340 001AD240 1000B17B */  lq          $17, 0x10($29)
/* 0AD344 001AD244 0000B07B */  lq          $16, 0x0($29)
/* 0AD348 001AD248 D000BD27 */  addiu       $29, $29, 0xD0
/* 0AD34C 001AD24C 0800E003 */  jr          $31
/* 0AD350 001AD250 00000000 */   nop
/* 0AD354 001AD254 00000000 */  nop
/* 0AD358 001AD258 00000000 */  nop
/* 0AD35C 001AD25C 00000000 */  nop
