.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MoveCheck__12CMonstorUnitFPfPfi
/* DC920 001DC820 B0FEBD27 */  addiu      $sp, $sp, -0x150
/* DC924 001DC824 A000BF7F */  sq         $31, 0xA0($sp)
/* DC928 001DC828 9000BE7F */  sq         $fp, 0x90($sp)
/* DC92C 001DC82C 8000B77F */  sq         $23, 0x80($sp)
/* DC930 001DC830 7000B67F */  sq         $22, 0x70($sp)
/* DC934 001DC834 6000B57F */  sq         $21, 0x60($sp)
/* DC938 001DC838 5000B47F */  sq         $20, 0x50($sp)
/* DC93C 001DC83C 4000B37F */  sq         $19, 0x40($sp)
/* DC940 001DC840 3000B27F */  sq         $18, 0x30($sp)
/* DC944 001DC844 2000B17F */  sq         $17, 0x20($sp)
/* DC948 001DC848 1000B07F */  sq         $16, 0x10($sp)
/* DC94C 001DC84C 0400B5E7 */  swc1       $f21, 0x4($sp)
/* DC950 001DC850 0000B4E7 */  swc1       $f20, 0x0($sp)
/* DC954 001DC854 28AE8070 */  paddub     $21, $4, $0
/* DC958 001DC858 28A6C070 */  paddub     $20, $6, $0
/* DC95C 001DC85C 289EE070 */  paddub     $19, $7, $0
/* DC960 001DC860 B000A427 */  addiu      $4, $sp, 0xB0
/* DC964 001DC864 0C86040C */  jal        sceVu0CopyVector
/* DC968 001DC868 00000000 */   nop
/* DC96C 001DC86C B000A1C7 */  lwc1       $f1, 0xB0($sp)
/* DC970 001DC870 000080C6 */  lwc1       $f0, 0x0($20)
/* DC974 001DC874 00080046 */  add.s      $f0, $f1, $f0
/* DC978 001DC878 E000A0E7 */  swc1       $f0, 0xE0($sp)
/* DC97C 001DC87C 040081C6 */  lwc1       $f1, 0x4($20)
/* DC980 001DC880 B400A0C7 */  lwc1       $f0, 0xB4($sp)
/* DC984 001DC884 00000146 */  add.s      $f0, $f0, $f1
/* DC988 001DC888 E400B027 */  addiu      $16, $sp, 0xE4
/* DC98C 001DC88C 000000E6 */  swc1       $f0, 0x0($16)
/* DC990 001DC890 B800BE27 */  addiu      $fp, $sp, 0xB8
/* DC994 001DC894 0000C1C7 */  lwc1       $f1, 0x0($fp)
/* DC998 001DC898 080080C6 */  lwc1       $f0, 0x8($20)
/* DC99C 001DC89C 00080046 */  add.s      $f0, $f1, $f0
/* DC9A0 001DC8A0 E800A0E7 */  swc1       $f0, 0xE8($sp)
/* DC9A4 001DC8A4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DC9A8 001DC8A8 0C0082AE */  sw         $2, 0xC($20)
/* DC9AC 001DC8AC 0001A427 */  addiu      $4, $sp, 0x100
/* DC9B0 001DC8B0 282E8072 */  paddub     $5, $20, $0
/* DC9B4 001DC8B4 9285040C */  jal        sceVu0Normalize
/* DC9B8 001DC8B8 00000000 */   nop
/* DC9BC 001DC8BC 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DC9C0 001DC8C0 0401A2AF */  sw         $2, 0x104($sp)
/* DC9C4 001DC8C4 1001A427 */  addiu      $4, $sp, 0x110
/* DC9C8 001DC8C8 E000A527 */  addiu      $5, $sp, 0xE0
/* DC9CC 001DC8CC 0C86040C */  jal        sceVu0CopyVector
/* DC9D0 001DC8D0 00000000 */   nop
/* DC9D4 001DC8D4 2001A427 */  addiu      $4, $sp, 0x120
/* DC9D8 001DC8D8 E000A527 */  addiu      $5, $sp, 0xE0
/* DC9DC 001DC8DC 0C86040C */  jal        sceVu0CopyVector
/* DC9E0 001DC8E0 00000000 */   nop
/* DC9E4 001DC8E4 789C868F */  lw         $6, -0x6388($gp)
/* DC9E8 001DC8E8 2800033C */  lui        $3, %hi(_345_6)
/* DC9EC 001DC8EC 70EB6324 */  addiu      $3, $3, %lo(_345_6)
/* DC9F0 001DC8F0 3001A527 */  addiu      $5, $sp, 0x130
/* DC9F4 001DC8F4 00006478 */  lq         $4, 0x0($3)
/* DC9F8 001DC8F8 100063DC */  ld         $3, 0x10($3)
/* DC9FC 001DC8FC 0000A47C */  sq         $4, 0x0($5)
/* DCA00 001DC900 1000A3FC */  sd         $3, 0x10($5)
/* DCA04 001DC904 0400C380 */  lb         $3, 0x4($6)
/* DCA08 001DC908 80180300 */  sll        $3, $3, 2
/* DCA0C 001DC90C 21187D00 */  addu       $3, $3, $sp
/* DCA10 001DC910 300161C4 */  lwc1       $f1, 0x130($3)
/* DCA14 001DC914 1401A427 */  addiu      $4, $sp, 0x114
/* DCA18 001DC918 000080C4 */  lwc1       $f0, 0x0($4)
/* DCA1C 001DC91C 00000146 */  add.s      $f0, $f0, $f1
/* DCA20 001DC920 000080E4 */  swc1       $f0, 0x0($4)
/* DCA24 001DC924 803F033C */  lui        $3, (0x3F800000 >> 16)
/* DCA28 001DC928 2401A3AF */  sw         $3, 0x124($sp)
/* DCA2C 001DC92C 000094C4 */  lwc1       $f20, 0x0($4)
/* DCA30 001DC930 000015C6 */  lwc1       $f21, 0x0($16)
/* DCA34 001DC934 28860070 */  paddub     $16, $0, $0
/* DCA38 001DC938 11010010 */  b          .L001DCD80
/* DCA3C 001DC93C 00000000 */   nop
.L001DC940:
/* DCA40 001DC940 80181000 */  sll        $3, $16, 2
/* DCA44 001DC944 21307000 */  addu       $6, $3, $16
/* DCA48 001DC948 80180600 */  sll        $3, $6, 2
/* DCA4C 001DC94C 2118C300 */  addu       $3, $6, $3
/* DCA50 001DC950 00890300 */  sll        $17, $3, 4
/* DCA54 001DC954 21283502 */  addu       $5, $17, $21
/* DCA58 001DC958 0200013C */  lui        $at, (0x20000 >> 16)
/* DCA5C 001DC95C 2108A100 */  addu       $at, $5, $at
/* DCA60 001DC960 D0E3248C */  lw         $4, -0x1C30($at)
/* DCA64 001DC964 02000324 */  addiu      $3, $0, 0x2
/* DCA68 001DC968 04018314 */  bne        $4, $3, .L001DCD7C
/* DCA6C 001DC96C 00000000 */   nop
/* DCA70 001DC970 0200013C */  lui        $at, (0x20000 >> 16)
/* DCA74 001DC974 2108A100 */  addu       $at, $5, $at
/* DCA78 001DC978 A4E42384 */  lh         $3, -0x1B5C($at)
/* DCA7C 001DC97C FF006010 */  beqz       $3, .L001DCD7C
/* DCA80 001DC980 00000000 */   nop
/* DCA84 001DC984 40180600 */  sll        $3, $6, 1
/* DCA88 001DC988 21187000 */  addu       $3, $3, $16
/* DCA8C 001DC98C 40910300 */  sll        $18, $3, 5
/* DCA90 001DC990 21185502 */  addu       $3, $18, $21
/* DCA94 001DC994 0500013C */  lui        $at, (0x5D9A0 >> 16)
/* DCA98 001DC998 A0D92134 */  ori        $at, $at, (0x5D9A0 & 0xFFFF)
/* DCA9C 001DC99C 21B86100 */  addu       $23, $3, $at
/* DCAA0 001DC9A0 0000E38E */  lw         $3, 0x0($23)
/* DCAA4 001DC9A4 78006014 */  bnez       $3, .L001DCB88
/* DCAA8 001DC9A8 00000000 */   nop
/* DCAAC 001DC9AC 10350224 */  addiu      $2, $0, 0x3510
/* DCAB0 001DC9B0 18100202 */  mult       $2, $16, $2
/* DCAB4 001DC9B4 2110A202 */  addu       $2, $21, $2
/* DCAB8 001DC9B8 0100013C */  lui        $at, (0x1FCD0 >> 16)
/* DCABC 001DC9BC D0FC2134 */  ori        $at, $at, (0x1FCD0 & 0xFFFF)
/* DCAC0 001DC9C0 21904100 */  addu       $18, $2, $at
/* DCAC4 001DC9C4 28264072 */  paddub     $4, $18, $0
/* DCAC8 001DC9C8 C000A527 */  addiu      $5, $sp, 0xC0
/* DCACC 001DC9CC A000598E */  lw         $25, 0xA0($18)
/* DCAD0 001DC9D0 A000398F */  lw         $25, 0xA0($25)
/* DCAD4 001DC9D4 09F82003 */  jalr       $25
/* DCAD8 001DC9D8 00000000 */   nop
/* DCADC 001DC9DC 28264072 */  paddub     $4, $18, $0
/* DCAE0 001DC9E0 D000A527 */  addiu      $5, $sp, 0xD0
/* DCAE4 001DC9E4 A000598E */  lw         $25, 0xA0($18)
/* DCAE8 001DC9E8 A000398F */  lw         $25, 0xA0($25)
/* DCAEC 001DC9EC 09F82003 */  jalr       $25
/* DCAF0 001DC9F0 00000000 */   nop
/* DCAF4 001DC9F4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DCAF8 001DC9F8 D400A2AF */  sw         $2, 0xD4($sp)
/* DCAFC 001DC9FC 03006012 */  beqz       $19, .L001DCA0C
/* DCB00 001DCA00 00000000 */   nop
/* DCB04 001DCA04 C400A2AF */  sw         $2, 0xC4($sp)
/* DCB08 001DCA08 00A88244 */  mtc1       $2, $f21
.L001DCA0C:
/* DCB0C 001DCA0C D000A427 */  addiu      $4, $sp, 0xD0
/* DCB10 001DCA10 2001A527 */  addiu      $5, $sp, 0x120
/* DCB14 001DCA14 648D040C */  jal        DistVector__FPfPf
/* DCB18 001DCA18 00000000 */   nop
/* DCB1C 001DCA1C 21183502 */  addu       $3, $17, $21
/* DCB20 001DCA20 0200013C */  lui        $at, (0x20000 >> 16)
/* DCB24 001DCA24 21086100 */  addu       $at, $3, $at
/* DCB28 001DCA28 14E422C4 */  lwc1       $f2, -0x1BEC($at)
/* DCB2C 001DCA2C C040033C */  lui        $3, (0x40C00000 >> 16)
/* DCB30 001DCA30 00088344 */  mtc1       $3, $f1
/* DCB34 001DCA34 00000000 */  nop
/* DCB38 001DCA38 40080246 */  add.s      $f1, $f1, $f2
/* DCB3C 001DCA3C 34000146 */  c.lt.s     $f0, $f1
/* DCB40 001DCA40 00000000 */  nop
/* DCB44 001DCA44 CD000045 */  bc1f       .L001DCD7C
/* DCB48 001DCA48 00000000 */   nop
/* DCB4C 001DCA4C 01000424 */  addiu      $4, $0, 0x1
/* DCB50 001DCA50 C400A1C7 */  lwc1       $f1, 0xC4($sp)
/* DCB54 001DCA54 0040033C */  lui        $3, (0x40000000 >> 16)
/* DCB58 001DCA58 00008344 */  mtc1       $3, $f0
/* DCB5C 001DCA5C 00000000 */  nop
/* DCB60 001DCA60 02000246 */  mul.s      $f0, $f0, $f2
/* DCB64 001DCA64 00080046 */  add.s      $f0, $f1, $f0
/* DCB68 001DCA68 34001446 */  c.lt.s     $f0, $f20
/* DCB6C 001DCA6C 00000000 */  nop
/* DCB70 001DCA70 06000145 */  bc1t       .L001DCA8C
/* DCB74 001DCA74 00000000 */   nop
/* DCB78 001DCA78 34081446 */  c.lt.s     $f1, $f20
/* DCB7C 001DCA7C 00000000 */  nop
/* DCB80 001DCA80 02000045 */  bc1f       .L001DCA8C
/* DCB84 001DCA84 00000000 */   nop
/* DCB88 001DCA88 28260070 */  paddub     $4, $0, $0
.L001DCA8C:
/* DCB8C 001DCA8C 34001546 */  c.lt.s     $f0, $f21
/* DCB90 001DCA90 00000000 */  nop
/* DCB94 001DCA94 06000145 */  bc1t       .L001DCAB0
/* DCB98 001DCA98 00000000 */   nop
/* DCB9C 001DCA9C 34081546 */  c.lt.s     $f1, $f21
/* DCBA0 001DCAA0 00000000 */  nop
/* DCBA4 001DCAA4 02000045 */  bc1f       .L001DCAB0
/* DCBA8 001DCAA8 00000000 */   nop
/* DCBAC 001DCAAC 28260070 */  paddub     $4, $0, $0
.L001DCAB0:
/* DCBB0 001DCAB0 36001446 */  c.le.s     $f0, $f20
/* DCBB4 001DCAB4 00000000 */  nop
/* DCBB8 001DCAB8 06000045 */  bc1f       .L001DCAD4
/* DCBBC 001DCABC 00000000 */   nop
/* DCBC0 001DCAC0 36081546 */  c.le.s     $f1, $f21
/* DCBC4 001DCAC4 00000000 */  nop
/* DCBC8 001DCAC8 02000145 */  bc1t       .L001DCAD4
/* DCBCC 001DCACC 00000000 */   nop
/* DCBD0 001DCAD0 28260070 */  paddub     $4, $0, $0
.L001DCAD4:
/* DCBD4 001DCAD4 34001446 */  c.lt.s     $f0, $f20
/* DCBD8 001DCAD8 00000000 */  nop
/* DCBDC 001DCADC 06000145 */  bc1t       .L001DCAF8
/* DCBE0 001DCAE0 00000000 */   nop
/* DCBE4 001DCAE4 34081546 */  c.lt.s     $f1, $f21
/* DCBE8 001DCAE8 00000000 */  nop
/* DCBEC 001DCAEC 02000045 */  bc1f       .L001DCAF8
/* DCBF0 001DCAF0 00000000 */   nop
/* DCBF4 001DCAF4 28260070 */  paddub     $4, $0, $0
.L001DCAF8:
/* DCBF8 001DCAF8 A0008014 */  bnez       $4, .L001DCD7C
/* DCBFC 001DCAFC 00000000 */   nop
/* DCC00 001DCB00 C000A1C7 */  lwc1       $f1, 0xC0($sp)
/* DCC04 001DCB04 B000A0C7 */  lwc1       $f0, 0xB0($sp)
/* DCC08 001DCB08 01080046 */  sub.s      $f0, $f1, $f0
/* DCC0C 001DCB0C F000A0E7 */  swc1       $f0, 0xF0($sp)
/* DCC10 001DCB10 C800A1C7 */  lwc1       $f1, 0xC8($sp)
/* DCC14 001DCB14 0000C0C7 */  lwc1       $f0, 0x0($fp)
/* DCC18 001DCB18 01080046 */  sub.s      $f0, $f1, $f0
/* DCC1C 001DCB1C F800A0E7 */  swc1       $f0, 0xF8($sp)
/* DCC20 001DCB20 F400A0AF */  sw         $0, 0xF4($sp)
/* DCC24 001DCB24 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DCC28 001DCB28 FC00A2AF */  sw         $2, 0xFC($sp)
/* DCC2C 001DCB2C F000A427 */  addiu      $4, $sp, 0xF0
/* DCC30 001DCB30 282E8070 */  paddub     $5, $4, $0
/* DCC34 001DCB34 9285040C */  jal        sceVu0Normalize
/* DCC38 001DCB38 00000000 */   nop
/* DCC3C 001DCB3C 0001A427 */  addiu      $4, $sp, 0x100
/* DCC40 001DCB40 F000A527 */  addiu      $5, $sp, 0xF0
/* DCC44 001DCB44 8885040C */  jal        sceVu0InnerProduct
/* DCC48 001DCB48 00000000 */   nop
/* DCC4C 001DCB4C 3C8581C7 */  lwc1       $f1, -0x7AC4($gp)
/* DCC50 001DCB50 36000146 */  c.le.s     $f0, $f1
/* DCC54 001DCB54 00000000 */  nop
/* DCC58 001DCB58 88000145 */  bc1t       .L001DCD7C
/* DCC5C 001DCB5C 00000000 */   nop
/* DCC60 001DCB60 000080AE */  sw         $0, 0x0($20)
/* DCC64 001DCB64 040081C6 */  lwc1       $f1, 0x4($20)
/* DCC68 001DCB68 0040033C */  lui        $3, (0x40000000 >> 16)
/* DCC6C 001DCB6C 00008344 */  mtc1       $3, $f0
/* DCC70 001DCB70 00000000 */  nop
/* DCC74 001DCB74 01080046 */  sub.s      $f0, $f1, $f0
/* DCC78 001DCB78 040080E6 */  swc1       $f0, 0x4($20)
/* DCC7C 001DCB7C 080080AE */  sw         $0, 0x8($20)
/* DCC80 001DCB80 82000010 */  b          .L001DCD8C
/* DCC84 001DCB84 00000000 */   nop
.L001DCB88:
/* DCC88 001DCB88 288E0070 */  paddub     $17, $0, $0
/* DCC8C 001DCB8C 77000010 */  b          .L001DCD6C
/* DCC90 001DCB90 00000000 */   nop
.L001DCB94:
/* DCC94 001DCB94 2118B202 */  addu       $3, $21, $18
/* DCC98 001DCB98 00111100 */  sll        $2, $17, 4
/* DCC9C 001DCB9C 21106200 */  addu       $2, $3, $2
/* DCCA0 001DCBA0 0500013C */  lui        $at, (0x5D850 >> 16)
/* DCCA4 001DCBA4 50D82134 */  ori        $at, $at, (0x5D850 & 0xFFFF)
/* DCCA8 001DCBA8 21B04100 */  addu       $22, $2, $at
/* DCCAC 001DCBAC C000A427 */  addiu      $4, $sp, 0xC0
/* DCCB0 001DCBB0 282EC072 */  paddub     $5, $22, $0
/* DCCB4 001DCBB4 0C86040C */  jal        sceVu0CopyVector
/* DCCB8 001DCBB8 00000000 */   nop
/* DCCBC 001DCBBC D000A427 */  addiu      $4, $sp, 0xD0
/* DCCC0 001DCBC0 282EC072 */  paddub     $5, $22, $0
/* DCCC4 001DCBC4 0C86040C */  jal        sceVu0CopyVector
/* DCCC8 001DCBC8 00000000 */   nop
/* DCCCC 001DCBCC 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DCCD0 001DCBD0 D400A2AF */  sw         $2, 0xD4($sp)
/* DCCD4 001DCBD4 D000A427 */  addiu      $4, $sp, 0xD0
/* DCCD8 001DCBD8 2001A527 */  addiu      $5, $sp, 0x120
/* DCCDC 001DCBDC 648D040C */  jal        DistVector__FPfPf
/* DCCE0 001DCBE0 00000000 */   nop
/* DCCE4 001DCBE4 21205502 */  addu       $4, $18, $21
/* DCCE8 001DCBE8 80181100 */  sll        $3, $17, 2
/* DCCEC 001DCBEC 21186400 */  addu       $3, $3, $4
/* DCCF0 001DCBF0 0500013C */  lui        $at, (0x5D940 >> 16)
/* DCCF4 001DCBF4 40D92134 */  ori        $at, $at, (0x5D940 & 0xFFFF)
/* DCCF8 001DCBF8 21206100 */  addu       $4, $3, $at
/* DCCFC 001DCBFC 000082C4 */  lwc1       $f2, 0x0($4)
/* DCD00 001DCC00 C040033C */  lui        $3, (0x40C00000 >> 16)
/* DCD04 001DCC04 00088344 */  mtc1       $3, $f1
/* DCD08 001DCC08 00000000 */  nop
/* DCD0C 001DCC0C 40080246 */  add.s      $f1, $f1, $f2
/* DCD10 001DCC10 36000146 */  c.le.s     $f0, $f1
/* DCD14 001DCC14 00000000 */  nop
/* DCD18 001DCC18 53000045 */  bc1f       .L001DCD68
/* DCD1C 001DCC1C 00000000 */   nop
/* DCD20 001DCC20 04006012 */  beqz       $19, .L001DCC34
/* DCD24 001DCC24 00000000 */   nop
/* DCD28 001DCC28 803F033C */  lui        $3, (0x3F800000 >> 16)
/* DCD2C 001DCC2C C400A3AF */  sw         $3, 0xC4($sp)
/* DCD30 001DCC30 00A88344 */  mtc1       $3, $f21
.L001DCC34:
/* DCD34 001DCC34 01000324 */  addiu      $3, $0, 0x1
/* DCD38 001DCC38 C400A2C7 */  lwc1       $f2, 0xC4($sp)
/* DCD3C 001DCC3C 000081C4 */  lwc1       $f1, 0x0($4)
/* DCD40 001DCC40 01100146 */  sub.s      $f0, $f2, $f1
/* DCD44 001DCC44 40100146 */  add.s      $f1, $f2, $f1
/* DCD48 001DCC48 36001446 */  c.le.s     $f0, $f20
/* DCD4C 001DCC4C 00000000 */  nop
/* DCD50 001DCC50 06000145 */  bc1t       .L001DCC6C
/* DCD54 001DCC54 00000000 */   nop
/* DCD58 001DCC58 34081446 */  c.lt.s     $f1, $f20
/* DCD5C 001DCC5C 00000000 */  nop
/* DCD60 001DCC60 02000045 */  bc1f       .L001DCC6C
/* DCD64 001DCC64 00000000 */   nop
/* DCD68 001DCC68 281E0070 */  paddub     $3, $0, $0
.L001DCC6C:
/* DCD6C 001DCC6C 36001546 */  c.le.s     $f0, $f21
/* DCD70 001DCC70 00000000 */  nop
/* DCD74 001DCC74 06000145 */  bc1t       .L001DCC90
/* DCD78 001DCC78 00000000 */   nop
/* DCD7C 001DCC7C 34081546 */  c.lt.s     $f1, $f21
/* DCD80 001DCC80 00000000 */  nop
/* DCD84 001DCC84 02000045 */  bc1f       .L001DCC90
/* DCD88 001DCC88 00000000 */   nop
/* DCD8C 001DCC8C 281E0070 */  paddub     $3, $0, $0
.L001DCC90:
/* DCD90 001DCC90 34001446 */  c.lt.s     $f0, $f20
/* DCD94 001DCC94 00000000 */  nop
/* DCD98 001DCC98 06000045 */  bc1f       .L001DCCB4
/* DCD9C 001DCC9C 00000000 */   nop
/* DCDA0 001DCCA0 36081546 */  c.le.s     $f1, $f21
/* DCDA4 001DCCA4 00000000 */  nop
/* DCDA8 001DCCA8 02000145 */  bc1t       .L001DCCB4
/* DCDAC 001DCCAC 00000000 */   nop
/* DCDB0 001DCCB0 281E0070 */  paddub     $3, $0, $0
.L001DCCB4:
/* DCDB4 001DCCB4 36001446 */  c.le.s     $f0, $f20
/* DCDB8 001DCCB8 00000000 */  nop
/* DCDBC 001DCCBC 06000145 */  bc1t       .L001DCCD8
/* DCDC0 001DCCC0 00000000 */   nop
/* DCDC4 001DCCC4 34081546 */  c.lt.s     $f1, $f21
/* DCDC8 001DCCC8 00000000 */  nop
/* DCDCC 001DCCCC 02000045 */  bc1f       .L001DCCD8
/* DCDD0 001DCCD0 00000000 */   nop
/* DCDD4 001DCCD4 281E0070 */  paddub     $3, $0, $0
.L001DCCD8:
/* DCDD8 001DCCD8 23006014 */  bnez       $3, .L001DCD68
/* DCDDC 001DCCDC 00000000 */   nop
/* DCDE0 001DCCE0 C000A1C7 */  lwc1       $f1, 0xC0($sp)
/* DCDE4 001DCCE4 B000A0C7 */  lwc1       $f0, 0xB0($sp)
/* DCDE8 001DCCE8 01080046 */  sub.s      $f0, $f1, $f0
/* DCDEC 001DCCEC F000A0E7 */  swc1       $f0, 0xF0($sp)
/* DCDF0 001DCCF0 C800A1C7 */  lwc1       $f1, 0xC8($sp)
/* DCDF4 001DCCF4 0000C0C7 */  lwc1       $f0, 0x0($fp)
/* DCDF8 001DCCF8 01080046 */  sub.s      $f0, $f1, $f0
/* DCDFC 001DCCFC F800A0E7 */  swc1       $f0, 0xF8($sp)
/* DCE00 001DCD00 F400A0AF */  sw         $0, 0xF4($sp)
/* DCE04 001DCD04 803F023C */  lui        $2, (0x3F800000 >> 16)
/* DCE08 001DCD08 FC00A2AF */  sw         $2, 0xFC($sp)
/* DCE0C 001DCD0C F000A427 */  addiu      $4, $sp, 0xF0
/* DCE10 001DCD10 282E8070 */  paddub     $5, $4, $0
/* DCE14 001DCD14 9285040C */  jal        sceVu0Normalize
/* DCE18 001DCD18 00000000 */   nop
/* DCE1C 001DCD1C 0001A427 */  addiu      $4, $sp, 0x100
/* DCE20 001DCD20 F000A527 */  addiu      $5, $sp, 0xF0
/* DCE24 001DCD24 8885040C */  jal        sceVu0InnerProduct
/* DCE28 001DCD28 00000000 */   nop
/* DCE2C 001DCD2C 3C8581C7 */  lwc1       $f1, -0x7AC4($gp)
/* DCE30 001DCD30 36000146 */  c.le.s     $f0, $f1
/* DCE34 001DCD34 00000000 */  nop
/* DCE38 001DCD38 0B000145 */  bc1t       .L001DCD68
/* DCE3C 001DCD3C 00000000 */   nop
/* DCE40 001DCD40 000080AE */  sw         $0, 0x0($20)
/* DCE44 001DCD44 040081C6 */  lwc1       $f1, 0x4($20)
/* DCE48 001DCD48 0040033C */  lui        $3, (0x40000000 >> 16)
/* DCE4C 001DCD4C 00008344 */  mtc1       $3, $f0
/* DCE50 001DCD50 00000000 */  nop
/* DCE54 001DCD54 01080046 */  sub.s      $f0, $f1, $f0
/* DCE58 001DCD58 040080E6 */  swc1       $f0, 0x4($20)
/* DCE5C 001DCD5C 080080AE */  sw         $0, 0x8($20)
/* DCE60 001DCD60 0A000010 */  b          .L001DCD8C
/* DCE64 001DCD64 00000000 */   nop
.L001DCD68:
/* DCE68 001DCD68 01003126 */  addiu      $17, $17, 0x1
.L001DCD6C:
/* DCE6C 001DCD6C 0000E38E */  lw         $3, 0x0($23)
/* DCE70 001DCD70 2A182302 */  slt        $3, $17, $3
/* DCE74 001DCD74 87FF6014 */  bnez       $3, .L001DCB94
/* DCE78 001DCD78 00000000 */   nop
.L001DCD7C:
/* DCE7C 001DCD7C 01001026 */  addiu      $16, $16, 0x1
.L001DCD80:
/* DCE80 001DCD80 1000032A */  slti       $3, $16, 0x10
/* DCE84 001DCD84 EEFE6014 */  bnez       $3, .L001DC940
/* DCE88 001DCD88 00000000 */   nop
.L001DCD8C:
/* DCE8C 001DCD8C A000BF7B */  lq         $31, 0xA0($sp)
/* DCE90 001DCD90 9000BE7B */  lq         $fp, 0x90($sp)
/* DCE94 001DCD94 8000B77B */  lq         $23, 0x80($sp)
/* DCE98 001DCD98 7000B67B */  lq         $22, 0x70($sp)
/* DCE9C 001DCD9C 6000B57B */  lq         $21, 0x60($sp)
/* DCEA0 001DCDA0 5000B47B */  lq         $20, 0x50($sp)
/* DCEA4 001DCDA4 4000B37B */  lq         $19, 0x40($sp)
/* DCEA8 001DCDA8 3000B27B */  lq         $18, 0x30($sp)
/* DCEAC 001DCDAC 2000B17B */  lq         $17, 0x20($sp)
/* DCEB0 001DCDB0 1000B07B */  lq         $16, 0x10($sp)
/* DCEB4 001DCDB4 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* DCEB8 001DCDB8 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* DCEBC 001DCDBC 5001BD27 */  addiu      $sp, $sp, 0x150
/* DCEC0 001DCDC0 0800E003 */  jr         $31
/* DCEC4 001DCDC4 00000000 */   nop
/* DCEC8 001DCDC8 00000000 */  nop
/* DCECC 001DCDCC 00000000 */  nop
