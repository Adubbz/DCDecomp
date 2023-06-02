.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MoveCheck2__12CMonstorUnitFv
/* DCED0 001DCDD0 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* DCED4 001DCDD4 3000BF7F */  sq         $31, 0x30($sp)
/* DCED8 001DCDD8 2000B27F */  sq         $18, 0x20($sp)
/* DCEDC 001DCDDC 1000B17F */  sq         $17, 0x10($sp)
/* DCEE0 001DCDE0 0000B07F */  sq         $16, 0x0($sp)
/* DCEE4 001DCDE4 28968070 */  paddub     $18, $4, $0
/* DCEE8 001DCDE8 4000A427 */  addiu      $4, $sp, 0x40
/* DCEEC 001DCDEC EA01023C */  lui        $2, %hi(D_1EA1D30)
/* DCEF0 001DCDF0 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* DCEF4 001DCDF4 0C86040C */  jal        sceVu0CopyVector
/* DCEF8 001DCDF8 00000000 */   nop
/* DCEFC 001DCDFC 9000438E */  lw         $3, 0x90($18)
/* DCF00 001DCE00 10350224 */  addiu      $2, $0, 0x3510
/* DCF04 001DCE04 18106200 */  mult       $2, $3, $2
/* DCF08 001DCE08 21104202 */  addu       $2, $18, $2
/* DCF0C 001DCE0C 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DCF10 001DCE10 D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DCF14 001DCE14 21204100 */  addu       $4, $2, $at
/* DCF18 001DCE18 6000A527 */  addiu      $5, $sp, 0x60
/* DCF1C 001DCE1C A000998C */  lw         $25, 0xA0($4)
/* DCF20 001DCE20 A000398F */  lw         $25, 0xA0($25)
/* DCF24 001DCE24 09F82003 */  jalr       $25
/* DCF28 001DCE28 00000000 */   nop
/* DCF2C 001DCE2C 9000438E */  lw         $3, 0x90($18)
/* DCF30 001DCE30 80100300 */  sll        $2, $3, 2
/* DCF34 001DCE34 21184300 */  addu       $3, $2, $3
/* DCF38 001DCE38 80100300 */  sll        $2, $3, 2
/* DCF3C 001DCE3C 21106200 */  addu       $2, $3, $2
/* DCF40 001DCE40 00110200 */  sll        $2, $2, 4
/* DCF44 001DCE44 21105200 */  addu       $2, $2, $18
/* DCF48 001DCE48 0200013C */  lui        $at, (0x20000 >> 16)
/* DCF4C 001DCE4C 21084100 */  addu       $at, $2, $at
/* DCF50 001DCE50 30E421C4 */  lwc1       $f1, -0x1BD0($at)
/* DCF54 001DCE54 0200013C */  lui        $at, (0x20000 >> 16)
/* DCF58 001DCE58 21084100 */  addu       $at, $2, $at
/* DCF5C 001DCE5C 50E420C4 */  lwc1       $f0, -0x1BB0($at)
/* DCF60 001DCE60 02080046 */  mul.s      $f0, $f1, $f0
/* DCF64 001DCE64 6000A2C7 */  lwc1       $f2, 0x60($sp)
/* DCF68 001DCE68 00100046 */  add.s      $f0, $f2, $f0
/* DCF6C 001DCE6C 5000A0E7 */  swc1       $f0, 0x50($sp)
/* DCF70 001DCE70 9000438E */  lw         $3, 0x90($18)
/* DCF74 001DCE74 80100300 */  sll        $2, $3, 2
/* DCF78 001DCE78 21184300 */  addu       $3, $2, $3
/* DCF7C 001DCE7C 80100300 */  sll        $2, $3, 2
/* DCF80 001DCE80 21106200 */  addu       $2, $3, $2
/* DCF84 001DCE84 00110200 */  sll        $2, $2, 4
/* DCF88 001DCE88 21105200 */  addu       $2, $2, $18
/* DCF8C 001DCE8C 0200013C */  lui        $at, (0x20000 >> 16)
/* DCF90 001DCE90 21084100 */  addu       $at, $2, $at
/* DCF94 001DCE94 34E421C4 */  lwc1       $f1, -0x1BCC($at)
/* DCF98 001DCE98 0200013C */  lui        $at, (0x20000 >> 16)
/* DCF9C 001DCE9C 21084100 */  addu       $at, $2, $at
/* DCFA0 001DCEA0 50E420C4 */  lwc1       $f0, -0x1BB0($at)
/* DCFA4 001DCEA4 42080046 */  mul.s      $f1, $f1, $f0
/* DCFA8 001DCEA8 6400A0C7 */  lwc1       $f0, 0x64($sp)
/* DCFAC 001DCEAC 00000146 */  add.s      $f0, $f0, $f1
/* DCFB0 001DCEB0 5400B027 */  addiu      $16, $sp, 0x54
/* DCFB4 001DCEB4 000000E6 */  swc1       $f0, 0x0($16)
/* DCFB8 001DCEB8 9000438E */  lw         $3, 0x90($18)
/* DCFBC 001DCEBC 80100300 */  sll        $2, $3, 2
/* DCFC0 001DCEC0 21184300 */  addu       $3, $2, $3
/* DCFC4 001DCEC4 80100300 */  sll        $2, $3, 2
/* DCFC8 001DCEC8 21106200 */  addu       $2, $3, $2
/* DCFCC 001DCECC 00110200 */  sll        $2, $2, 4
/* DCFD0 001DCED0 21105200 */  addu       $2, $2, $18
/* DCFD4 001DCED4 0200013C */  lui        $at, (0x20000 >> 16)
/* DCFD8 001DCED8 21084100 */  addu       $at, $2, $at
/* DCFDC 001DCEDC 38E421C4 */  lwc1       $f1, -0x1BC8($at)
/* DCFE0 001DCEE0 0200013C */  lui        $at, (0x20000 >> 16)
/* DCFE4 001DCEE4 21084100 */  addu       $at, $2, $at
/* DCFE8 001DCEE8 50E420C4 */  lwc1       $f0, -0x1BB0($at)
/* DCFEC 001DCEEC 02080046 */  mul.s      $f0, $f1, $f0
/* DCFF0 001DCEF0 6800B127 */  addiu      $17, $sp, 0x68
/* DCFF4 001DCEF4 000021C6 */  lwc1       $f1, 0x0($17)
/* DCFF8 001DCEF8 00080046 */  add.s      $f0, $f1, $f0
/* DCFFC 001DCEFC 5800A227 */  addiu      $2, $sp, 0x58
/* DD000 001DCF00 000040E4 */  swc1       $f0, 0x0($2)
/* DD004 001DCF04 5000A0C7 */  lwc1       $f0, 0x50($sp)
/* DD008 001DCF08 01000246 */  sub.s      $f0, $f0, $f2
/* DD00C 001DCF0C 8000A0E7 */  swc1       $f0, 0x80($sp)
/* DD010 001DCF10 8400A0AF */  sw         $0, 0x84($sp)
/* DD014 001DCF14 000040C4 */  lwc1       $f0, 0x0($2)
/* DD018 001DCF18 01000146 */  sub.s      $f0, $f0, $f1
/* DD01C 001DCF1C 8800A0E7 */  swc1       $f0, 0x88($sp)
/* DD020 001DCF20 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DD024 001DCF24 8C00A2AF */  sw         $2, 0x8C($sp)
/* DD028 001DCF28 8000A427 */  addiu      $4, $sp, 0x80
/* DD02C 001DCF2C 282E8070 */  paddub     $5, $4, $0
/* DD030 001DCF30 9285040C */  jal        sceVu0Normalize
/* DD034 001DCF34 00000000 */   nop
/* DD038 001DCF38 9000438E */  lw         $3, 0x90($18)
/* DD03C 001DCF3C 80100300 */  sll        $2, $3, 2
/* DD040 001DCF40 21184300 */  addu       $3, $2, $3
/* DD044 001DCF44 80100300 */  sll        $2, $3, 2
/* DD048 001DCF48 21106200 */  addu       $2, $3, $2
/* DD04C 001DCF4C 00110200 */  sll        $2, $2, 4
/* DD050 001DCF50 21104202 */  addu       $2, $18, $2
/* DD054 001DCF54 7000A427 */  addiu      $4, $sp, 0x70
/* DD058 001DCF58 0100013C */  lui        $at, (0x1E430 >> 16)
/* DD05C 001DCF5C 30E42134 */  ori        $at, $at, (0x1E430 & 0xFFFF)
/* DD060 001DCF60 21284100 */  addu       $5, $2, $at
/* DD064 001DCF64 9285040C */  jal        sceVu0Normalize
/* DD068 001DCF68 00000000 */   nop
/* DD06C 001DCF6C A000A427 */  addiu      $4, $sp, 0xA0
/* DD070 001DCF70 4000A527 */  addiu      $5, $sp, 0x40
/* DD074 001DCF74 0C86040C */  jal        sceVu0CopyVector
/* DD078 001DCF78 00000000 */   nop
/* DD07C 001DCF7C B000A427 */  addiu      $4, $sp, 0xB0
/* DD080 001DCF80 5000A527 */  addiu      $5, $sp, 0x50
/* DD084 001DCF84 0C86040C */  jal        sceVu0CopyVector
/* DD088 001DCF88 00000000 */   nop
/* DD08C 001DCF8C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DD090 001DCF90 A400A2AF */  sw         $2, 0xA4($sp)
/* DD094 001DCF94 B400A2AF */  sw         $2, 0xB4($sp)
/* DD098 001DCF98 A000A427 */  addiu      $4, $sp, 0xA0
/* DD09C 001DCF9C B000A527 */  addiu      $5, $sp, 0xB0
/* DD0A0 001DCFA0 648D040C */  jal        DistVector__FPfPf
/* DD0A4 001DCFA4 00000000 */   nop
/* DD0A8 001DCFA8 9000448E */  lw         $4, 0x90($18)
/* DD0AC 001DCFAC 80180400 */  sll        $3, $4, 2
/* DD0B0 001DCFB0 21206400 */  addu       $4, $3, $4
/* DD0B4 001DCFB4 80180400 */  sll        $3, $4, 2
/* DD0B8 001DCFB8 21188300 */  addu       $3, $4, $3
/* DD0BC 001DCFBC 00190300 */  sll        $3, $3, 4
/* DD0C0 001DCFC0 21187200 */  addu       $3, $3, $18
/* DD0C4 001DCFC4 0200013C */  lui        $at, (0x20000 >> 16)
/* DD0C8 001DCFC8 21086100 */  addu       $at, $3, $at
/* DD0CC 001DCFCC 14E422C4 */  lwc1       $f2, -0x1BEC($at)
/* DD0D0 001DCFD0 C040033C */  lui        $3, (0x40C00000 >> 16)
/* DD0D4 001DCFD4 00088344 */  mtc1       $3, $f1
/* DD0D8 001DCFD8 00000000 */  nop
/* DD0DC 001DCFDC 40080246 */  add.s      $f1, $f1, $f2
/* DD0E0 001DCFE0 36000146 */  c.le.s     $f0, $f1
/* DD0E4 001DCFE4 00000000 */  nop
/* DD0E8 001DCFE8 4D000045 */  bc1f       .L001DD120
/* DD0EC 001DCFEC 00000000 */   nop
/* DD0F0 001DCFF0 000002C6 */  lwc1       $f2, 0x0($16)
/* DD0F4 001DCFF4 9041033C */  lui        $3, (0x41900000 >> 16)
/* DD0F8 001DCFF8 00088344 */  mtc1       $3, $f1
/* DD0FC 001DCFFC 4400A0C7 */  lwc1       $f0, 0x44($sp)
/* DD100 001DD000 00080046 */  add.s      $f0, $f1, $f0
/* DD104 001DD004 34100046 */  c.lt.s     $f2, $f0
/* DD108 001DD008 00000000 */  nop
/* DD10C 001DD00C 44000045 */  bc1f       .L001DD120
/* DD110 001DD010 00000000 */   nop
/* DD114 001DD014 4000A1C7 */  lwc1       $f1, 0x40($sp)
/* DD118 001DD018 6000A0C7 */  lwc1       $f0, 0x60($sp)
/* DD11C 001DD01C 01080046 */  sub.s      $f0, $f1, $f0
/* DD120 001DD020 9000A0E7 */  swc1       $f0, 0x90($sp)
/* DD124 001DD024 4800A1C7 */  lwc1       $f1, 0x48($sp)
/* DD128 001DD028 000020C6 */  lwc1       $f0, 0x0($17)
/* DD12C 001DD02C 01080046 */  sub.s      $f0, $f1, $f0
/* DD130 001DD030 9800A0E7 */  swc1       $f0, 0x98($sp)
/* DD134 001DD034 9400A0AF */  sw         $0, 0x94($sp)
/* DD138 001DD038 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DD13C 001DD03C 9C00A2AF */  sw         $2, 0x9C($sp)
/* DD140 001DD040 9000A427 */  addiu      $4, $sp, 0x90
/* DD144 001DD044 282E8070 */  paddub     $5, $4, $0
/* DD148 001DD048 9285040C */  jal        sceVu0Normalize
/* DD14C 001DD04C 00000000 */   nop
/* DD150 001DD050 8000A427 */  addiu      $4, $sp, 0x80
/* DD154 001DD054 9000A527 */  addiu      $5, $sp, 0x90
/* DD158 001DD058 8885040C */  jal        sceVu0InnerProduct
/* DD15C 001DD05C 00000000 */   nop
/* DD160 001DD060 00088044 */  mtc1       $0, $f1
/* DD164 001DD064 00000000 */  nop
/* DD168 001DD068 36000146 */  c.le.s     $f0, $f1
/* DD16C 001DD06C 00000000 */  nop
/* DD170 001DD070 2B000145 */  bc1t       .L001DD120
/* DD174 001DD074 00000000 */   nop
/* DD178 001DD078 9000448E */  lw         $4, 0x90($18)
/* DD17C 001DD07C 80180400 */  sll        $3, $4, 2
/* DD180 001DD080 21206400 */  addu       $4, $3, $4
/* DD184 001DD084 80180400 */  sll        $3, $4, 2
/* DD188 001DD088 21188300 */  addu       $3, $4, $3
/* DD18C 001DD08C 00190300 */  sll        $3, $3, 4
/* DD190 001DD090 21187200 */  addu       $3, $3, $18
/* DD194 001DD094 0200013C */  lui        $at, (0x20000 >> 16)
/* DD198 001DD098 21086100 */  addu       $at, $3, $at
/* DD19C 001DD09C 30E420AC */  sw         $0, -0x1BD0($at)
/* DD1A0 001DD0A0 9000448E */  lw         $4, 0x90($18)
/* DD1A4 001DD0A4 80180400 */  sll        $3, $4, 2
/* DD1A8 001DD0A8 21206400 */  addu       $4, $3, $4
/* DD1AC 001DD0AC 80180400 */  sll        $3, $4, 2
/* DD1B0 001DD0B0 21188300 */  addu       $3, $4, $3
/* DD1B4 001DD0B4 00190300 */  sll        $3, $3, 4
/* DD1B8 001DD0B8 21187200 */  addu       $3, $3, $18
/* DD1BC 001DD0BC 0200013C */  lui        $at, (0x20000 >> 16)
/* DD1C0 001DD0C0 21086100 */  addu       $at, $3, $at
/* DD1C4 001DD0C4 34E420AC */  sw         $0, -0x1BCC($at)
/* DD1C8 001DD0C8 9000448E */  lw         $4, 0x90($18)
/* DD1CC 001DD0CC 80180400 */  sll        $3, $4, 2
/* DD1D0 001DD0D0 21206400 */  addu       $4, $3, $4
/* DD1D4 001DD0D4 80180400 */  sll        $3, $4, 2
/* DD1D8 001DD0D8 21188300 */  addu       $3, $4, $3
/* DD1DC 001DD0DC 00190300 */  sll        $3, $3, 4
/* DD1E0 001DD0E0 21187200 */  addu       $3, $3, $18
/* DD1E4 001DD0E4 0200013C */  lui        $at, (0x20000 >> 16)
/* DD1E8 001DD0E8 21086100 */  addu       $at, $3, $at
/* DD1EC 001DD0EC 38E420AC */  sw         $0, -0x1BC8($at)
/* DD1F0 001DD0F0 9000448E */  lw         $4, 0x90($18)
/* DD1F4 001DD0F4 80180400 */  sll        $3, $4, 2
/* DD1F8 001DD0F8 21206400 */  addu       $4, $3, $4
/* DD1FC 001DD0FC 80180400 */  sll        $3, $4, 2
/* DD200 001DD100 21188300 */  addu       $3, $4, $3
/* DD204 001DD104 00190300 */  sll        $3, $3, 4
/* DD208 001DD108 21187200 */  addu       $3, $3, $18
/* DD20C 001DD10C 0200013C */  lui        $at, (0x20000 >> 16)
/* DD210 001DD110 21086100 */  addu       $at, $3, $at
/* DD214 001DD114 50E420AC */  sw         $0, -0x1BB0($at)
/* DD218 001DD118 01000010 */  b          .L001DD120
/* DD21C 001DD11C 00000000 */   nop
.L001DD120:
/* DD220 001DD120 3000BF7B */  lq         $31, 0x30($sp)
/* DD224 001DD124 2000B27B */  lq         $18, 0x20($sp)
/* DD228 001DD128 1000B17B */  lq         $17, 0x10($sp)
/* DD22C 001DD12C 0000B07B */  lq         $16, 0x0($sp)
/* DD230 001DD130 C000BD27 */  addiu      $sp, $sp, 0xC0
/* DD234 001DD134 0800E003 */  jr         $31
/* DD238 001DD138 00000000 */   nop
/* DD23C 001DD13C 00000000 */  nop
