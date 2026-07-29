.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MoveCheck2__12CMonstorUnitFv
/* 0DCED0 001DCDD0 40FFBD27 */  addiu       $29, $29, -0xC0
/* 0DCED4 001DCDD4 3000BF7F */  sq          $31, 0x30($29)
/* 0DCED8 001DCDD8 2000B27F */  sq          $18, 0x20($29)
/* 0DCEDC 001DCDDC 1000B17F */  sq          $17, 0x10($29)
/* 0DCEE0 001DCDE0 0000B07F */  sq          $16, 0x0($29)
/* 0DCEE4 001DCDE4 28968070 */  paddub      $18, $4, $0
/* 0DCEE8 001DCDE8 4000A427 */  addiu       $4, $29, 0x40
/* 0DCEEC 001DCDEC EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 0DCEF0 001DCDF0 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 0DCEF4 001DCDF4 0C86040C */  jal         sceVu0CopyVector
/* 0DCEF8 001DCDF8 00000000 */   nop
/* 0DCEFC 001DCDFC 9000438E */  lw          $3, 0x90($18)
/* 0DCF00 001DCE00 10350224 */  addiu       $2, $0, 0x3510
/* 0DCF04 001DCE04 18106200 */  mult        $2, $3, $2
/* 0DCF08 001DCE08 21104202 */  addu        $2, $18, $2
/* 0DCF0C 001DCE0C 0100013C */  lui         $1, (0x1FCD0 >> 16)
/* 0DCF10 001DCE10 D0FC2134 */  ori         $1, $1, (0x1FCD0 & 0xFFFF)
/* 0DCF14 001DCE14 21204100 */  addu        $4, $2, $1
/* 0DCF18 001DCE18 6000A527 */  addiu       $5, $29, 0x60
/* 0DCF1C 001DCE1C A000998C */  lw          $25, 0xA0($4)
/* 0DCF20 001DCE20 A000398F */  lw          $25, 0xA0($25)
/* 0DCF24 001DCE24 09F82003 */  jalr        $25
/* 0DCF28 001DCE28 00000000 */   nop
/* 0DCF2C 001DCE2C 9000438E */  lw          $3, 0x90($18)
/* 0DCF30 001DCE30 80100300 */  sll         $2, $3, 2
/* 0DCF34 001DCE34 21184300 */  addu        $3, $2, $3
/* 0DCF38 001DCE38 80100300 */  sll         $2, $3, 2
/* 0DCF3C 001DCE3C 21106200 */  addu        $2, $3, $2
/* 0DCF40 001DCE40 00110200 */  sll         $2, $2, 4
/* 0DCF44 001DCE44 21105200 */  addu        $2, $2, $18
/* 0DCF48 001DCE48 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DCF4C 001DCE4C 21084100 */  addu        $1, $2, $1
/* 0DCF50 001DCE50 30E421C4 */  lwc1        $f1, -0x1BD0($1)
/* 0DCF54 001DCE54 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DCF58 001DCE58 21084100 */  addu        $1, $2, $1
/* 0DCF5C 001DCE5C 50E420C4 */  lwc1        $f0, -0x1BB0($1)
/* 0DCF60 001DCE60 02080046 */  mul.s       $f0, $f1, $f0
/* 0DCF64 001DCE64 6000A2C7 */  lwc1        $f2, 0x60($29)
/* 0DCF68 001DCE68 00100046 */  add.s       $f0, $f2, $f0
/* 0DCF6C 001DCE6C 5000A0E7 */  swc1        $f0, 0x50($29)
/* 0DCF70 001DCE70 9000438E */  lw          $3, 0x90($18)
/* 0DCF74 001DCE74 80100300 */  sll         $2, $3, 2
/* 0DCF78 001DCE78 21184300 */  addu        $3, $2, $3
/* 0DCF7C 001DCE7C 80100300 */  sll         $2, $3, 2
/* 0DCF80 001DCE80 21106200 */  addu        $2, $3, $2
/* 0DCF84 001DCE84 00110200 */  sll         $2, $2, 4
/* 0DCF88 001DCE88 21105200 */  addu        $2, $2, $18
/* 0DCF8C 001DCE8C 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DCF90 001DCE90 21084100 */  addu        $1, $2, $1
/* 0DCF94 001DCE94 34E421C4 */  lwc1        $f1, -0x1BCC($1)
/* 0DCF98 001DCE98 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DCF9C 001DCE9C 21084100 */  addu        $1, $2, $1
/* 0DCFA0 001DCEA0 50E420C4 */  lwc1        $f0, -0x1BB0($1)
/* 0DCFA4 001DCEA4 42080046 */  mul.s       $f1, $f1, $f0
/* 0DCFA8 001DCEA8 6400A0C7 */  lwc1        $f0, 0x64($29)
/* 0DCFAC 001DCEAC 00000146 */  add.s       $f0, $f0, $f1
/* 0DCFB0 001DCEB0 5400B027 */  addiu       $16, $29, 0x54
/* 0DCFB4 001DCEB4 000000E6 */  swc1        $f0, 0x0($16)
/* 0DCFB8 001DCEB8 9000438E */  lw          $3, 0x90($18)
/* 0DCFBC 001DCEBC 80100300 */  sll         $2, $3, 2
/* 0DCFC0 001DCEC0 21184300 */  addu        $3, $2, $3
/* 0DCFC4 001DCEC4 80100300 */  sll         $2, $3, 2
/* 0DCFC8 001DCEC8 21106200 */  addu        $2, $3, $2
/* 0DCFCC 001DCECC 00110200 */  sll         $2, $2, 4
/* 0DCFD0 001DCED0 21105200 */  addu        $2, $2, $18
/* 0DCFD4 001DCED4 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DCFD8 001DCED8 21084100 */  addu        $1, $2, $1
/* 0DCFDC 001DCEDC 38E421C4 */  lwc1        $f1, -0x1BC8($1)
/* 0DCFE0 001DCEE0 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DCFE4 001DCEE4 21084100 */  addu        $1, $2, $1
/* 0DCFE8 001DCEE8 50E420C4 */  lwc1        $f0, -0x1BB0($1)
/* 0DCFEC 001DCEEC 02080046 */  mul.s       $f0, $f1, $f0
/* 0DCFF0 001DCEF0 6800B127 */  addiu       $17, $29, 0x68
/* 0DCFF4 001DCEF4 000021C6 */  lwc1        $f1, 0x0($17)
/* 0DCFF8 001DCEF8 00080046 */  add.s       $f0, $f1, $f0
/* 0DCFFC 001DCEFC 5800A227 */  addiu       $2, $29, 0x58
/* 0DD000 001DCF00 000040E4 */  swc1        $f0, 0x0($2)
/* 0DD004 001DCF04 5000A0C7 */  lwc1        $f0, 0x50($29)
/* 0DD008 001DCF08 01000246 */  sub.s       $f0, $f0, $f2
/* 0DD00C 001DCF0C 8000A0E7 */  swc1        $f0, 0x80($29)
/* 0DD010 001DCF10 8400A0AF */  sw          $0, 0x84($29)
/* 0DD014 001DCF14 000040C4 */  lwc1        $f0, 0x0($2)
/* 0DD018 001DCF18 01000146 */  sub.s       $f0, $f0, $f1
/* 0DD01C 001DCF1C 8800A0E7 */  swc1        $f0, 0x88($29)
/* 0DD020 001DCF20 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0DD024 001DCF24 8C00A2AF */  sw          $2, 0x8C($29)
/* 0DD028 001DCF28 8000A427 */  addiu       $4, $29, 0x80
/* 0DD02C 001DCF2C 282E8070 */  paddub      $5, $4, $0
/* 0DD030 001DCF30 9285040C */  jal         sceVu0Normalize
/* 0DD034 001DCF34 00000000 */   nop
/* 0DD038 001DCF38 9000438E */  lw          $3, 0x90($18)
/* 0DD03C 001DCF3C 80100300 */  sll         $2, $3, 2
/* 0DD040 001DCF40 21184300 */  addu        $3, $2, $3
/* 0DD044 001DCF44 80100300 */  sll         $2, $3, 2
/* 0DD048 001DCF48 21106200 */  addu        $2, $3, $2
/* 0DD04C 001DCF4C 00110200 */  sll         $2, $2, 4
/* 0DD050 001DCF50 21104202 */  addu        $2, $18, $2
/* 0DD054 001DCF54 7000A427 */  addiu       $4, $29, 0x70
/* 0DD058 001DCF58 0100013C */  lui         $1, (0x1E430 >> 16)
/* 0DD05C 001DCF5C 30E42134 */  ori         $1, $1, (0x1E430 & 0xFFFF)
/* 0DD060 001DCF60 21284100 */  addu        $5, $2, $1
/* 0DD064 001DCF64 9285040C */  jal         sceVu0Normalize
/* 0DD068 001DCF68 00000000 */   nop
/* 0DD06C 001DCF6C A000A427 */  addiu       $4, $29, 0xA0
/* 0DD070 001DCF70 4000A527 */  addiu       $5, $29, 0x40
/* 0DD074 001DCF74 0C86040C */  jal         sceVu0CopyVector
/* 0DD078 001DCF78 00000000 */   nop
/* 0DD07C 001DCF7C B000A427 */  addiu       $4, $29, 0xB0
/* 0DD080 001DCF80 5000A527 */  addiu       $5, $29, 0x50
/* 0DD084 001DCF84 0C86040C */  jal         sceVu0CopyVector
/* 0DD088 001DCF88 00000000 */   nop
/* 0DD08C 001DCF8C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0DD090 001DCF90 A400A2AF */  sw          $2, 0xA4($29)
/* 0DD094 001DCF94 B400A2AF */  sw          $2, 0xB4($29)
/* 0DD098 001DCF98 A000A427 */  addiu       $4, $29, 0xA0
/* 0DD09C 001DCF9C B000A527 */  addiu       $5, $29, 0xB0
/* 0DD0A0 001DCFA0 648D040C */  jal         DistVector__FPfPf
/* 0DD0A4 001DCFA4 00000000 */   nop
/* 0DD0A8 001DCFA8 9000448E */  lw          $4, 0x90($18)
/* 0DD0AC 001DCFAC 80180400 */  sll         $3, $4, 2
/* 0DD0B0 001DCFB0 21206400 */  addu        $4, $3, $4
/* 0DD0B4 001DCFB4 80180400 */  sll         $3, $4, 2
/* 0DD0B8 001DCFB8 21188300 */  addu        $3, $4, $3
/* 0DD0BC 001DCFBC 00190300 */  sll         $3, $3, 4
/* 0DD0C0 001DCFC0 21187200 */  addu        $3, $3, $18
/* 0DD0C4 001DCFC4 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DD0C8 001DCFC8 21086100 */  addu        $1, $3, $1
/* 0DD0CC 001DCFCC 14E422C4 */  lwc1        $f2, -0x1BEC($1)
/* 0DD0D0 001DCFD0 C040033C */  lui         $3, (0x40C00000 >> 16)
/* 0DD0D4 001DCFD4 00088344 */  mtc1        $3, $f1
/* 0DD0D8 001DCFD8 00000000 */  nop
/* 0DD0DC 001DCFDC 40080246 */  add.s       $f1, $f1, $f2
/* 0DD0E0 001DCFE0 36000146 */  c.le.s      $f0, $f1
/* 0DD0E4 001DCFE4 00000000 */  nop
/* 0DD0E8 001DCFE8 4D000045 */  bc1f        .L001DD120
/* 0DD0EC 001DCFEC 00000000 */   nop
/* 0DD0F0 001DCFF0 000002C6 */  lwc1        $f2, 0x0($16)
/* 0DD0F4 001DCFF4 9041033C */  lui         $3, (0x41900000 >> 16)
/* 0DD0F8 001DCFF8 00088344 */  mtc1        $3, $f1
/* 0DD0FC 001DCFFC 4400A0C7 */  lwc1        $f0, 0x44($29)
/* 0DD100 001DD000 00080046 */  add.s       $f0, $f1, $f0
/* 0DD104 001DD004 34100046 */  c.lt.s      $f2, $f0
/* 0DD108 001DD008 00000000 */  nop
/* 0DD10C 001DD00C 44000045 */  bc1f        .L001DD120
/* 0DD110 001DD010 00000000 */   nop
/* 0DD114 001DD014 4000A1C7 */  lwc1        $f1, 0x40($29)
/* 0DD118 001DD018 6000A0C7 */  lwc1        $f0, 0x60($29)
/* 0DD11C 001DD01C 01080046 */  sub.s       $f0, $f1, $f0
/* 0DD120 001DD020 9000A0E7 */  swc1        $f0, 0x90($29)
/* 0DD124 001DD024 4800A1C7 */  lwc1        $f1, 0x48($29)
/* 0DD128 001DD028 000020C6 */  lwc1        $f0, 0x0($17)
/* 0DD12C 001DD02C 01080046 */  sub.s       $f0, $f1, $f0
/* 0DD130 001DD030 9800A0E7 */  swc1        $f0, 0x98($29)
/* 0DD134 001DD034 9400A0AF */  sw          $0, 0x94($29)
/* 0DD138 001DD038 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0DD13C 001DD03C 9C00A2AF */  sw          $2, 0x9C($29)
/* 0DD140 001DD040 9000A427 */  addiu       $4, $29, 0x90
/* 0DD144 001DD044 282E8070 */  paddub      $5, $4, $0
/* 0DD148 001DD048 9285040C */  jal         sceVu0Normalize
/* 0DD14C 001DD04C 00000000 */   nop
/* 0DD150 001DD050 8000A427 */  addiu       $4, $29, 0x80
/* 0DD154 001DD054 9000A527 */  addiu       $5, $29, 0x90
/* 0DD158 001DD058 8885040C */  jal         sceVu0InnerProduct
/* 0DD15C 001DD05C 00000000 */   nop
/* 0DD160 001DD060 00088044 */  mtc1        $0, $f1
/* 0DD164 001DD064 00000000 */  nop
/* 0DD168 001DD068 36000146 */  c.le.s      $f0, $f1
/* 0DD16C 001DD06C 00000000 */  nop
/* 0DD170 001DD070 2B000145 */  bc1t        .L001DD120
/* 0DD174 001DD074 00000000 */   nop
/* 0DD178 001DD078 9000448E */  lw          $4, 0x90($18)
/* 0DD17C 001DD07C 80180400 */  sll         $3, $4, 2
/* 0DD180 001DD080 21206400 */  addu        $4, $3, $4
/* 0DD184 001DD084 80180400 */  sll         $3, $4, 2
/* 0DD188 001DD088 21188300 */  addu        $3, $4, $3
/* 0DD18C 001DD08C 00190300 */  sll         $3, $3, 4
/* 0DD190 001DD090 21187200 */  addu        $3, $3, $18
/* 0DD194 001DD094 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DD198 001DD098 21086100 */  addu        $1, $3, $1
/* 0DD19C 001DD09C 30E420AC */  sw          $0, -0x1BD0($1)
/* 0DD1A0 001DD0A0 9000448E */  lw          $4, 0x90($18)
/* 0DD1A4 001DD0A4 80180400 */  sll         $3, $4, 2
/* 0DD1A8 001DD0A8 21206400 */  addu        $4, $3, $4
/* 0DD1AC 001DD0AC 80180400 */  sll         $3, $4, 2
/* 0DD1B0 001DD0B0 21188300 */  addu        $3, $4, $3
/* 0DD1B4 001DD0B4 00190300 */  sll         $3, $3, 4
/* 0DD1B8 001DD0B8 21187200 */  addu        $3, $3, $18
/* 0DD1BC 001DD0BC 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DD1C0 001DD0C0 21086100 */  addu        $1, $3, $1
/* 0DD1C4 001DD0C4 34E420AC */  sw          $0, -0x1BCC($1)
/* 0DD1C8 001DD0C8 9000448E */  lw          $4, 0x90($18)
/* 0DD1CC 001DD0CC 80180400 */  sll         $3, $4, 2
/* 0DD1D0 001DD0D0 21206400 */  addu        $4, $3, $4
/* 0DD1D4 001DD0D4 80180400 */  sll         $3, $4, 2
/* 0DD1D8 001DD0D8 21188300 */  addu        $3, $4, $3
/* 0DD1DC 001DD0DC 00190300 */  sll         $3, $3, 4
/* 0DD1E0 001DD0E0 21187200 */  addu        $3, $3, $18
/* 0DD1E4 001DD0E4 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DD1E8 001DD0E8 21086100 */  addu        $1, $3, $1
/* 0DD1EC 001DD0EC 38E420AC */  sw          $0, -0x1BC8($1)
/* 0DD1F0 001DD0F0 9000448E */  lw          $4, 0x90($18)
/* 0DD1F4 001DD0F4 80180400 */  sll         $3, $4, 2
/* 0DD1F8 001DD0F8 21206400 */  addu        $4, $3, $4
/* 0DD1FC 001DD0FC 80180400 */  sll         $3, $4, 2
/* 0DD200 001DD100 21188300 */  addu        $3, $4, $3
/* 0DD204 001DD104 00190300 */  sll         $3, $3, 4
/* 0DD208 001DD108 21187200 */  addu        $3, $3, $18
/* 0DD20C 001DD10C 0200013C */  lui         $1, (0x20000 >> 16)
/* 0DD210 001DD110 21086100 */  addu        $1, $3, $1
/* 0DD214 001DD114 50E420AC */  sw          $0, -0x1BB0($1)
/* 0DD218 001DD118 01000010 */  b           .L001DD120
/* 0DD21C 001DD11C 00000000 */   nop
.L001DD120:
/* 0DD220 001DD120 3000BF7B */  lq          $31, 0x30($29)
/* 0DD224 001DD124 2000B27B */  lq          $18, 0x20($29)
/* 0DD228 001DD128 1000B17B */  lq          $17, 0x10($29)
/* 0DD22C 001DD12C 0000B07B */  lq          $16, 0x0($29)
/* 0DD230 001DD130 C000BD27 */  addiu       $29, $29, 0xC0
/* 0DD234 001DD134 0800E003 */  jr          $31
/* 0DD238 001DD138 00000000 */   nop
/* 0DD23C 001DD13C 00000000 */  nop
