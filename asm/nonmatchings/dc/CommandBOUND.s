.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandBOUND__FPPv
/* 3FEB0 0013FDB0 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 3FEB4 0013FDB4 5000BF7F */  sq         $31, 0x50($sp)
/* 3FEB8 0013FDB8 4000B47F */  sq         $20, 0x40($sp)
/* 3FEBC 0013FDBC 3000B37F */  sq         $19, 0x30($sp)
/* 3FEC0 0013FDC0 2000B27F */  sq         $18, 0x20($sp)
/* 3FEC4 0013FDC4 1000B17F */  sq         $17, 0x10($sp)
/* 3FEC8 0013FDC8 0000B07F */  sq         $16, 0x0($sp)
/* 3FECC 0013FDCC 28968070 */  paddub     $18, $4, $0
/* 3FED0 0013FDD0 188D848F */  lw         $4, -0x72E8($gp)
/* 3FED4 0013FDD4 14000524 */  addiu      $5, $0, 0x14
/* 3FED8 0013FDD8 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 3FEDC 0013FDDC 00000000 */   nop
/* 3FEE0 0013FDE0 30010424 */  addiu      $4, $0, 0x130
/* 3FEE4 0013FDE4 282E4070 */  paddub     $5, $2, $0
/* 3FEE8 0013FDE8 E09E040C */  jal        __nw__FUiP1
/* 3FEEC 0013FDEC 00000000 */   nop
/* 3FEF0 0013FDF0 288E4070 */  paddub     $17, $2, $0
/* 3FEF4 0013FDF4 0A002012 */  beqz       $17, .L0013FE20
/* 3FEF8 0013FDF8 00000000 */   nop
/* 3FEFC 0013FDFC 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 3FF00 0013FE00 00708244 */  mtc1       $2, $f14
/* 3FF04 0013FE04 00000000 */  nop
/* 3FF08 0013FE08 06730046 */  mov.s      $f12, $f14
/* 3FF0C 0013FE0C 46730046 */  mov.s      $f13, $f14
/* 3FF10 0013FE10 28262072 */  paddub     $4, $17, $0
/* 3FF14 0013FE14 5CF7040C */  jal        __ct__6CBoundFfff
/* 3FF18 0013FE18 00000000 */   nop
/* 3FF1C 0013FE1C 288E4070 */  paddub     $17, $2, $0
.L0013FE20:
/* 3FF20 0013FE20 6D002012 */  beqz       $17, .L0013FFD8
/* 3FF24 0013FE24 00000000 */   nop
/* 3FF28 0013FE28 28860070 */  paddub     $16, $0, $0
/* 3FF2C 0013FE2C 28160072 */  paddub     $2, $16, $0
/* 3FF30 0013FE30 01001026 */  addiu      $16, $16, 0x1
/* 3FF34 0013FE34 80100200 */  sll        $2, $2, 2
/* 3FF38 0013FE38 21104202 */  addu       $2, $18, $2
/* 3FF3C 0013FE3C 0000458C */  lw         $5, 0x0($2)
/* 3FF40 0013FE40 148D848F */  lw         $4, -0x72EC($gp)
/* 3FF44 0013FE44 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 3FF48 0013FE48 00000000 */   nop
/* 3FF4C 0013FE4C 282E4070 */  paddub     $5, $2, $0
/* 3FF50 0013FE50 6100A010 */  beqz       $5, .L0013FFD8
/* 3FF54 0013FE54 00000000 */   nop
/* 3FF58 0013FE58 28260070 */  paddub     $4, $0, $0
/* 3FF5C 0013FE5C 18000010 */  b          .L0013FEC0
/* 3FF60 0013FE60 00000000 */   nop
.L0013FE64:
/* 3FF64 0013FE64 80101000 */  sll        $2, $16, 2
/* 3FF68 0013FE68 21104202 */  addu       $2, $18, $2
/* 3FF6C 0013FE6C 0000428C */  lw         $2, 0x0($2)
/* 3FF70 0013FE70 000040C4 */  lwc1       $f0, 0x0($2)
/* 3FF74 0013FE74 00110400 */  sll        $2, $4, 4
/* 3FF78 0013FE78 21185D00 */  addu       $3, $2, $sp
/* 3FF7C 0013FE7C 600060E4 */  swc1       $f0, 0x60($3)
/* 3FF80 0013FE80 01000226 */  addiu      $2, $16, 0x1
/* 3FF84 0013FE84 80100200 */  sll        $2, $2, 2
/* 3FF88 0013FE88 21104202 */  addu       $2, $18, $2
/* 3FF8C 0013FE8C 0000428C */  lw         $2, 0x0($2)
/* 3FF90 0013FE90 000040C4 */  lwc1       $f0, 0x0($2)
/* 3FF94 0013FE94 640060E4 */  swc1       $f0, 0x64($3)
/* 3FF98 0013FE98 02000226 */  addiu      $2, $16, 0x2
/* 3FF9C 0013FE9C 80100200 */  sll        $2, $2, 2
/* 3FFA0 0013FEA0 21104202 */  addu       $2, $18, $2
/* 3FFA4 0013FEA4 0000428C */  lw         $2, 0x0($2)
/* 3FFA8 0013FEA8 000040C4 */  lwc1       $f0, 0x0($2)
/* 3FFAC 0013FEAC 680060E4 */  swc1       $f0, 0x68($3)
/* 3FFB0 0013FEB0 03001026 */  addiu      $16, $16, 0x3
/* 3FFB4 0013FEB4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 3FFB8 0013FEB8 6C0062AC */  sw         $2, 0x6C($3)
/* 3FFBC 0013FEBC 01008424 */  addiu      $4, $4, 0x1
.L0013FEC0:
/* 3FFC0 0013FEC0 04008228 */  slti       $2, $4, 0x4
/* 3FFC4 0013FEC4 E7FF4014 */  bnez       $2, .L0013FE64
/* 3FFC8 0013FEC8 00000000 */   nop
/* 3FFCC 0013FECC 6C00A0AF */  sw         $0, 0x6C($sp)
/* 3FFD0 0013FED0 9000B427 */  addiu      $20, $sp, 0x90
/* 3FFD4 0013FED4 9400B327 */  addiu      $19, $sp, 0x94
/* 3FFD8 0013FED8 28262072 */  paddub     $4, $17, $0
/* 3FFDC 0013FEDC 7000A627 */  addiu      $6, $sp, 0x70
/* 3FFE0 0013FEE0 8000A727 */  addiu      $7, $sp, 0x80
/* 3FFE4 0013FEE4 6000A827 */  addiu      $8, $sp, 0x60
/* 3FFE8 0013FEE8 00008CC6 */  lwc1       $f12, 0x0($20)
/* 3FFEC 0013FEEC 00006DC6 */  lwc1       $f13, 0x0($19)
/* 3FFF0 0013FEF0 30F5040C */  jal        SetDir__6CBoundFP6CFramePfPfPfff
/* 3FFF4 0013FEF4 00000000 */   nop
/* 3FFF8 0013FEF8 9800A4C7 */  lwc1       $f4, 0x98($sp)
/* 3FFFC 0013FEFC 000063C6 */  lwc1       $f3, 0x0($19)
/* 40000 0013FF00 000082C6 */  lwc1       $f2, 0x0($20)
/* 40004 0013FF04 100022E6 */  swc1       $f2, 0x10($17)
/* 40008 0013FF08 140023E6 */  swc1       $f3, 0x14($17)
/* 4000C 0013FF0C 180024E6 */  swc1       $f4, 0x18($17)
/* 40010 0013FF10 100021C6 */  lwc1       $f1, 0x10($17)
/* 40014 0013FF14 00008044 */  mtc1       $0, $f0
/* 40018 0013FF18 00000000 */  nop
/* 4001C 0013FF1C 36080046 */  c.le.s     $f1, $f0
/* 40020 0013FF20 00000000 */  nop
/* 40024 0013FF24 06000145 */  bc1t       .L0013FF40
/* 40028 0013FF28 00000000 */   nop
/* 4002C 0013FF2C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 40030 0013FF30 00008344 */  mtc1       $3, $f0
/* 40034 0013FF34 00000000 */  nop
/* 40038 0013FF38 03000246 */  div.s      $f0, $f0, $f2
/* 4003C 0013FF3C 200020E6 */  swc1       $f0, 0x20($17)
.L0013FF40:
/* 40040 0013FF40 140021C6 */  lwc1       $f1, 0x14($17)
/* 40044 0013FF44 00008044 */  mtc1       $0, $f0
/* 40048 0013FF48 00000000 */  nop
/* 4004C 0013FF4C 36080046 */  c.le.s     $f1, $f0
/* 40050 0013FF50 00000000 */  nop
/* 40054 0013FF54 06000145 */  bc1t       .L0013FF70
/* 40058 0013FF58 00000000 */   nop
/* 4005C 0013FF5C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 40060 0013FF60 00008344 */  mtc1       $3, $f0
/* 40064 0013FF64 00000000 */  nop
/* 40068 0013FF68 03000346 */  div.s      $f0, $f0, $f3
/* 4006C 0013FF6C 240020E6 */  swc1       $f0, 0x24($17)
.L0013FF70:
/* 40070 0013FF70 180021C6 */  lwc1       $f1, 0x18($17)
/* 40074 0013FF74 00008044 */  mtc1       $0, $f0
/* 40078 0013FF78 00000000 */  nop
/* 4007C 0013FF7C 36080046 */  c.le.s     $f1, $f0
/* 40080 0013FF80 00000000 */  nop
/* 40084 0013FF84 06000145 */  bc1t       .L0013FFA0
/* 40088 0013FF88 00000000 */   nop
/* 4008C 0013FF8C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 40090 0013FF90 00008344 */  mtc1       $3, $f0
/* 40094 0013FF94 00000000 */  nop
/* 40098 0013FF98 03000446 */  div.s      $f0, $f0, $f4
/* 4009C 0013FF9C 280020E6 */  swc1       $f0, 0x28($17)
.L0013FFA0:
/* 400A0 0013FFA0 80181000 */  sll        $3, $16, 2
/* 400A4 0013FFA4 21184302 */  addu       $3, $18, $3
/* 400A8 0013FFA8 0000638C */  lw         $3, 0x0($3)
/* 400AC 0013FFAC 000060C4 */  lwc1       $f0, 0x0($3)
/* 400B0 0013FFB0 300020E6 */  swc1       $f0, 0x30($17)
/* 400B4 0013FFB4 108D838F */  lw         $3, -0x72F0($gp)
/* 400B8 0013FFB8 05006014 */  bnez       $3, .L0013FFD0
/* 400BC 0013FFBC 00000000 */   nop
/* 400C0 0013FFC0 0C8D838F */  lw         $3, -0x72F4($gp)
/* 400C4 0013FFC4 440071AC */  sw         $17, 0x44($3)
/* 400C8 0013FFC8 02000010 */  b          .L0013FFD4
/* 400CC 0013FFCC 00000000 */   nop
.L0013FFD0:
/* 400D0 0013FFD0 000071AC */  sw         $17, 0x0($3)
.L0013FFD4:
/* 400D4 0013FFD4 108D91AF */  sw         $17, -0x72F0($gp)
.L0013FFD8:
/* 400D8 0013FFD8 5000BF7B */  lq         $31, 0x50($sp)
/* 400DC 0013FFDC 4000B47B */  lq         $20, 0x40($sp)
/* 400E0 0013FFE0 3000B37B */  lq         $19, 0x30($sp)
/* 400E4 0013FFE4 2000B27B */  lq         $18, 0x20($sp)
/* 400E8 0013FFE8 1000B17B */  lq         $17, 0x10($sp)
/* 400EC 0013FFEC 0000B07B */  lq         $16, 0x0($sp)
/* 400F0 0013FFF0 A000BD27 */  addiu      $sp, $sp, 0xA0
/* 400F4 0013FFF4 0800E003 */  jr         $31
/* 400F8 0013FFF8 00000000 */   nop
/* 400FC 0013FFFC 00000000 */  nop