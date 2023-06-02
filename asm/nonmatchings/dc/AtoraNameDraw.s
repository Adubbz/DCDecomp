.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AtoraNameDraw__Fi
/* 11DD60 0021DC60 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 11DD64 0021DC64 5000BF7F */  sq         $31, 0x50($sp)
/* 11DD68 0021DC68 4000B47F */  sq         $20, 0x40($sp)
/* 11DD6C 0021DC6C 3000B37F */  sq         $19, 0x30($sp)
/* 11DD70 0021DC70 2000B27F */  sq         $18, 0x20($sp)
/* 11DD74 0021DC74 1000B17F */  sq         $17, 0x10($sp)
/* 11DD78 0021DC78 0000B07F */  sq         $16, 0x0($sp)
/* 11DD7C 0021DC7C DA01013C */  lui        $at, (0x1DA6A1C >> 16)
/* 11DD80 0021DC80 1C6A248C */  lw         $4, (0x1DA6A1C & 0xFFFF)($at)
/* 11DD84 0021DC84 38B4080C */  jal        MenuTextureReload__Fi
/* 11DD88 0021DC88 00000000 */   nop
/* 11DD8C 0021DC8C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11DD90 0021DC90 DE802284 */  lh         $2, -0x7F22($at)
/* 11DD94 0021DC94 FFFF5024 */  addiu      $16, $2, -0x1
/* 11DD98 0021DC98 28360070 */  paddub     $6, $0, $0
/* 11DD9C 0021DC9C 09000010 */  b          .L0021DCC4
/* 11DDA0 0021DCA0 00000000 */   nop
.L0021DCA4:
/* 11DDA4 0021DCA4 80380600 */  sll        $7, $6, 2
/* 11DDA8 0021DCA8 DA01023C */  lui        $2, %hi(D_1DA69B0)
/* 11DDAC 0021DCAC B0694224 */  addiu      $2, $2, %lo(D_1DA69B0)
/* 11DDB0 0021DCB0 21104700 */  addu       $2, $2, $7
/* 11DDB4 0021DCB4 0000438C */  lw         $3, 0x0($2)
/* 11DDB8 0021DCB8 2110FD00 */  addu       $2, $7, $sp
/* 11DDBC 0021DCBC 600043AC */  sw         $3, 0x60($2)
/* 11DDC0 0021DCC0 0100C624 */  addiu      $6, $6, 0x1
.L0021DCC4:
/* 11DDC4 0021DCC4 0300C228 */  slti       $2, $6, 0x3
/* 11DDC8 0021DCC8 F6FF4014 */  bnez       $2, .L0021DCA4
/* 11DDCC 0021DCCC 00000000 */   nop
/* 11DDD0 0021DCD0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11DDD4 0021DCD4 E080228C */  lw         $2, -0x7F20($at)
/* 11DDD8 0021DCD8 5C004224 */  addiu      $2, $2, 0x5C
/* 11DDDC 0021DCDC 00008244 */  mtc1       $2, $f0
/* 11DDE0 0021DCE0 00000000 */  nop
/* 11DDE4 0021DCE4 A0008046 */  cvt.s.w    $f2, $f0
/* 11DDE8 0021DCE8 0243023C */  lui        $2, (0x43020000 >> 16)
/* 11DDEC 0021DCEC 00088244 */  mtc1       $2, $f1
/* 11DDF0 0021DCF0 00009044 */  mtc1       $16, $f0
/* 11DDF4 0021DCF4 00000000 */  nop
/* 11DDF8 0021DCF8 20008046 */  cvt.s.w    $f0, $f0
/* 11DDFC 0021DCFC 02080046 */  mul.s      $f0, $f1, $f0
/* 11DE00 0021DD00 00130046 */  add.s      $f12, $f2, $f0
/* 11DE04 0021DD04 2C44040C */  jal        fptosi
/* 11DE08 0021DD08 00000000 */   nop
/* 11DE0C 0021DD0C 288E4070 */  paddub     $17, $2, $0
/* 11DE10 0021DD10 28960070 */  paddub     $18, $0, $0
/* 11DE14 0021DD14 66000010 */  b          .L0021DEB0
/* 11DE18 0021DD18 00000000 */   nop
.L0021DD1C:
/* 11DE1C 0021DD1C 6000222A */  slti       $2, $17, 0x60
/* 11DE20 0021DD20 04004014 */  bnez       $2, .L0021DD34
/* 11DE24 0021DD24 00000000 */   nop
/* 11DE28 0021DD28 5601212A */  slti       $at, $17, 0x156
/* 11DE2C 0021DD2C 04002014 */  bnez       $at, .L0021DD40
/* 11DE30 0021DD30 00000000 */   nop
.L0021DD34:
/* 11DE34 0021DD34 E7031324 */  addiu      $19, $0, 0x3E7
/* 11DE38 0021DD38 0F000010 */  b          .L0021DD78
/* 11DE3C 0021DD3C 00000000 */   nop
.L0021DD40:
/* 11DE40 0021DD40 28260072 */  paddub     $4, $16, $0
/* 11DE44 0021DD44 1C61080C */  jal        SearchAtoraInfo__Fi
/* 11DE48 0021DD48 00000000 */   nop
/* 11DE4C 0021DD4C 09004010 */  beqz       $2, .L0021DD74
/* 11DE50 0021DD50 00000000 */   nop
/* 11DE54 0021DD54 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11DE58 0021DD58 DC802484 */  lh         $4, -0x7F24($at)
/* 11DE5C 0021DD5C 0000458C */  lw         $5, 0x0($2)
/* 11DE60 0021DD60 3063080C */  jal        GetAtraMsgNo__Fii
/* 11DE64 0021DD64 00000000 */   nop
/* 11DE68 0021DD68 289E4070 */  paddub     $19, $2, $0
/* 11DE6C 0021DD6C 02000010 */  b          .L0021DD78
/* 11DE70 0021DD70 00000000 */   nop
.L0021DD74:
/* 11DE74 0021DD74 E7031324 */  addiu      $19, $0, 0x3E7
.L0021DD78:
/* 11DE78 0021DD78 80181200 */  sll        $3, $18, 2
/* 11DE7C 0021DD7C DA01023C */  lui        $2, %hi(D_1DA69B0)
/* 11DE80 0021DD80 B0694224 */  addiu      $2, $2, %lo(D_1DA69B0)
/* 11DE84 0021DD84 21104300 */  addu       $2, $2, $3
/* 11DE88 0021DD88 000053AC */  sw         $19, 0x0($2)
/* 11DE8C 0021DD8C DA01023C */  lui        $2, %hi(AtoraNameMes)
/* 11DE90 0021DD90 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* 11DE94 0021DD94 282E6072 */  paddub     $5, $19, $0
/* 11DE98 0021DD98 5C60080C */  jal        GetMsgLengthMenu__FP6ClsMesi
/* 11DE9C 0021DD9C 00000000 */   nop
/* 11DEA0 0021DDA0 28A64070 */  paddub     $20, $2, $0
/* 11DEA4 0021DDA4 80AE080C */  jal        GetMenuLangFlag__Fv
/* 11DEA8 0021DDA8 00000000 */   nop
/* 11DEAC 0021DDAC 08004014 */  bnez       $2, .L0021DDD0
/* 11DEB0 0021DDB0 00000000 */   nop
/* 11DEB4 0021DDB4 E8030224 */  addiu      $2, $0, 0x3E8
/* 11DEB8 0021DDB8 05006216 */  bne        $19, $2, .L0021DDD0
/* 11DEBC 0021DDBC 00000000 */   nop
/* 11DEC0 0021DDC0 28260070 */  paddub     $4, $0, $0
/* 11DEC4 0021DDC4 78F3080C */  jal        GetMsgLengthCharaName__Fi
/* 11DEC8 0021DDC8 00000000 */   nop
/* 11DECC 0021DDCC 03005424 */  addiu      $20, $2, 0x3
.L0021DDD0:
/* 11DED0 0021DDD0 00009444 */  mtc1       $20, $f0
/* 11DED4 0021DDD4 00000000 */  nop
/* 11DED8 0021DDD8 60008046 */  cvt.s.w    $f1, $f0
/* 11DEDC 0021DDDC 2041023C */  lui        $2, (0x41200000 >> 16)
/* 11DEE0 0021DDE0 00008244 */  mtc1       $2, $f0
/* 11DEE4 0021DDE4 00000000 */  nop
/* 11DEE8 0021DDE8 43080046 */  div.s      $f1, $f1, $f0
/* 11DEEC 0021DDEC 6842023C */  lui        $2, (0x42680000 >> 16)
/* 11DEF0 0021DDF0 00008244 */  mtc1       $2, $f0
/* 11DEF4 0021DDF4 00000000 */  nop
/* 11DEF8 0021DDF8 42000146 */  mul.s      $f1, $f0, $f1
/* 11DEFC 0021DDFC 3A43023C */  lui        $2, (0x433A0000 >> 16)
/* 11DF00 0021DE00 00008244 */  mtc1       $2, $f0
/* 11DF04 0021DE04 00000000 */  nop
/* 11DF08 0021DE08 01030146 */  sub.s      $f12, $f0, $f1
/* 11DF0C 0021DE0C 2C44040C */  jal        fptosi
/* 11DF10 0021DE10 00000000 */   nop
/* 11DF14 0021DE14 28A64070 */  paddub     $20, $2, $0
/* 11DF18 0021DE18 80AE080C */  jal        GetMenuLangFlag__Fv
/* 11DF1C 0021DE1C 00000000 */   nop
/* 11DF20 0021DE20 09004018 */  blez       $2, .L0021DE48
/* 11DF24 0021DE24 00000000 */   nop
/* 11DF28 0021DE28 D1070224 */  addiu      $2, $0, 0x7D1
/* 11DF2C 0021DE2C 02006216 */  bne        $19, $2, .L0021DE38
/* 11DF30 0021DE30 00000000 */   nop
/* 11DF34 0021DE34 06009426 */  addiu      $20, $20, 0x6
.L0021DE38:
/* 11DF38 0021DE38 D2070224 */  addiu      $2, $0, 0x7D2
/* 11DF3C 0021DE3C 02006216 */  bne        $19, $2, .L0021DE48
/* 11DF40 0021DE40 00000000 */   nop
/* 11DF44 0021DE44 08009426 */  addiu      $20, $20, 0x8
.L0021DE48:
/* 11DF48 0021DE48 0D004006 */  bltz       $18, .L0021DE80
/* 11DF4C 0021DE4C 00000000 */   nop
/* 11DF50 0021DE50 0A00412A */  slti       $at, $18, 0xA
/* 11DF54 0021DE54 0A002010 */  beqz       $at, .L0021DE80
/* 11DF58 0021DE58 00000000 */   nop
/* 11DF5C 0021DE5C C0181200 */  sll        $3, $18, 3
/* 11DF60 0021DE60 DA01023C */  lui        $2, %hi(D_1DA6A20)
/* 11DF64 0021DE64 206A4224 */  addiu      $2, $2, %lo(D_1DA6A20)
/* 11DF68 0021DE68 21104300 */  addu       $2, $2, $3
/* 11DF6C 0021DE6C 000054AC */  sw         $20, 0x0($2)
/* 11DF70 0021DE70 DA01023C */  lui        $2, %hi(D_1DA6A24)
/* 11DF74 0021DE74 246A4224 */  addiu      $2, $2, %lo(D_1DA6A24)
/* 11DF78 0021DE78 21104300 */  addu       $2, $2, $3
/* 11DF7C 0021DE7C 000051AC */  sw         $17, 0x0($2)
.L0021DE80:
/* 11DF80 0021DE80 00009144 */  mtc1       $17, $f0
/* 11DF84 0021DE84 00000000 */  nop
/* 11DF88 0021DE88 60008046 */  cvt.s.w    $f1, $f0
/* 11DF8C 0021DE8C 0243023C */  lui        $2, (0x43020000 >> 16)
/* 11DF90 0021DE90 00008244 */  mtc1       $2, $f0
/* 11DF94 0021DE94 00000000 */  nop
/* 11DF98 0021DE98 000B0046 */  add.s      $f12, $f1, $f0
/* 11DF9C 0021DE9C 2C44040C */  jal        fptosi
/* 11DFA0 0021DEA0 00000000 */   nop
/* 11DFA4 0021DEA4 288E4070 */  paddub     $17, $2, $0
/* 11DFA8 0021DEA8 01001026 */  addiu      $16, $16, 0x1
/* 11DFAC 0021DEAC 01005226 */  addiu      $18, $18, 0x1
.L0021DEB0:
/* 11DFB0 0021DEB0 0300422A */  slti       $2, $18, 0x3
/* 11DFB4 0021DEB4 99FF4014 */  bnez       $2, .L0021DD1C
/* 11DFB8 0021DEB8 00000000 */   nop
/* 11DFBC 0021DEBC 28260070 */  paddub     $4, $0, $0
/* 11DFC0 0021DEC0 17000010 */  b          .L0021DF20
/* 11DFC4 0021DEC4 00000000 */   nop
.L0021DEC8:
/* 11DFC8 0021DEC8 80280400 */  sll        $5, $4, 2
/* 11DFCC 0021DECC DA01023C */  lui        $2, %hi(D_1DA69B0)
/* 11DFD0 0021DED0 B0694224 */  addiu      $2, $2, %lo(D_1DA69B0)
/* 11DFD4 0021DED4 21184500 */  addu       $3, $2, $5
/* 11DFD8 0021DED8 2110BD00 */  addu       $2, $5, $sp
/* 11DFDC 0021DEDC 0000638C */  lw         $3, 0x0($3)
/* 11DFE0 0021DEE0 6000428C */  lw         $2, 0x60($2)
/* 11DFE4 0021DEE4 26106200 */  xor        $2, $3, $2
/* 11DFE8 0021DEE8 2B100200 */  sltu       $2, $0, $2
/* 11DFEC 0021DEEC 0B004010 */  beqz       $2, .L0021DF1C
/* 11DFF0 0021DEF0 00000000 */   nop
/* 11DFF4 0021DEF4 FFFF0224 */  addiu      $2, $0, -0x1
/* 11DFF8 0021DEF8 DA01013C */  lui        $at, (0x1DA698C >> 16)
/* 11DFFC 0021DEFC 8C6922AC */  sw         $2, (0x1DA698C & 0xFFFF)($at)
/* 11E000 0021DF00 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* 11E004 0021DF04 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* 11E008 0021DF08 D2000524 */  addiu      $5, $0, 0xD2
/* 11E00C 0021DF0C 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 11E010 0021DF10 00000000 */   nop
/* 11E014 0021DF14 05000010 */  b          .L0021DF2C
/* 11E018 0021DF18 00000000 */   nop
.L0021DF1C:
/* 11E01C 0021DF1C 01008424 */  addiu      $4, $4, 0x1
.L0021DF20:
/* 11E020 0021DF20 03008228 */  slti       $2, $4, 0x3
/* 11E024 0021DF24 E8FF4014 */  bnez       $2, .L0021DEC8
/* 11E028 0021DF28 00000000 */   nop
.L0021DF2C:
/* 11E02C 0021DF2C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E030 0021DF30 64822484 */  lh         $4, -0x7D9C($at)
/* 11E034 0021DF34 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E038 0021DF38 5C82238C */  lw         $3, -0x7DA4($at)
/* 11E03C 0021DF3C 08000224 */  addiu      $2, $0, 0x8
/* 11E040 0021DF40 1C006210 */  beq        $3, $2, .L0021DFB4
/* 11E044 0021DF44 00000000 */   nop
/* 11E048 0021DF48 09000224 */  addiu      $2, $0, 0x9
/* 11E04C 0021DF4C 10006210 */  beq        $3, $2, .L0021DF90
/* 11E050 0021DF50 00000000 */   nop
/* 11E054 0021DF54 07000224 */  addiu      $2, $0, 0x7
/* 11E058 0021DF58 03006210 */  beq        $3, $2, .L0021DF68
/* 11E05C 0021DF5C 00000000 */   nop
/* 11E060 0021DF60 15000010 */  b          .L0021DFB8
/* 11E064 0021DF64 00000000 */   nop
.L0021DF68:
/* 11E068 0021DF68 80000324 */  addiu      $3, $0, 0x80
/* 11E06C 0021DF6C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E070 0021DF70 6082228C */  lw         $2, -0x7DA0($at)
/* 11E074 0021DF74 40100200 */  sll        $2, $2, 1
/* 11E078 0021DF78 23206200 */  subu       $4, $3, $2
/* 11E07C 0021DF7C 0E008104 */  bgez       $4, .L0021DFB8
/* 11E080 0021DF80 00000000 */   nop
/* 11E084 0021DF84 28260070 */  paddub     $4, $0, $0
/* 11E088 0021DF88 0B000010 */  b          .L0021DFB8
/* 11E08C 0021DF8C 00000000 */   nop
.L0021DF90:
/* 11E090 0021DF90 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11E094 0021DF94 6082228C */  lw         $2, -0x7DA0($at)
/* 11E098 0021DF98 40200200 */  sll        $4, $2, 1
/* 11E09C 0021DF9C 81008128 */  slti       $at, $4, 0x81
/* 11E0A0 0021DFA0 05002014 */  bnez       $at, .L0021DFB8
/* 11E0A4 0021DFA4 00000000 */   nop
/* 11E0A8 0021DFA8 80000424 */  addiu      $4, $0, 0x80
/* 11E0AC 0021DFAC 02000010 */  b          .L0021DFB8
/* 11E0B0 0021DFB0 00000000 */   nop
.L0021DFB4:
/* 11E0B4 0021DFB4 28260070 */  paddub     $4, $0, $0
.L0021DFB8:
/* 11E0B8 0021DFB8 DA01013C */  lui        $at, (0x1DA69A4 >> 16)
/* 11E0BC 0021DFBC A46924AC */  sw         $4, (0x1DA69A4 & 0xFFFF)($at)
/* 11E0C0 0021DFC0 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* 11E0C4 0021DFC4 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* 11E0C8 0021DFC8 6437050C */  jal        Step__6ClsMesFv
/* 11E0CC 0021DFCC 00000000 */   nop
/* 11E0D0 0021DFD0 DA01023C */  lui        $2, %hi(AtoraNameMes)
/* 11E0D4 0021DFD4 D0524424 */  addiu      $4, $2, %lo(AtoraNameMes)
/* 11E0D8 0021DFD8 C44C050C */  jal        DrawMesWin__6ClsMesFv
/* 11E0DC 0021DFDC 00000000 */   nop
/* 11E0E0 0021DFE0 2468080C */  jal        GetMenuAtraEventFlag__Fv
/* 11E0E4 0021DFE4 00000000 */   nop
/* 11E0E8 0021DFE8 03004014 */  bnez       $2, .L0021DFF8
/* 11E0EC 0021DFEC 00000000 */   nop
/* 11E0F0 0021DFF0 2476080C */  jal        AtoraBoardFadeEffect__Fv
/* 11E0F4 0021DFF4 00000000 */   nop
.L0021DFF8:
/* 11E0F8 0021DFF8 5000BF7B */  lq         $31, 0x50($sp)
/* 11E0FC 0021DFFC 4000B47B */  lq         $20, 0x40($sp)
/* 11E100 0021E000 3000B37B */  lq         $19, 0x30($sp)
/* 11E104 0021E004 2000B27B */  lq         $18, 0x20($sp)
/* 11E108 0021E008 1000B17B */  lq         $17, 0x10($sp)
/* 11E10C 0021E00C 0000B07B */  lq         $16, 0x0($sp)
/* 11E110 0021E010 7000BD27 */  addiu      $sp, $sp, 0x70
/* 11E114 0021E014 0800E003 */  jr         $31
/* 11E118 0021E018 00000000 */   nop
/* 11E11C 0021E01C 00000000 */  nop
