.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdDrawClock__Fii
/* 7DC60 0017DB60 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 7DC64 0017DB64 4000BF7F */  sq         $31, 0x40($sp)
/* 7DC68 0017DB68 3000B27F */  sq         $18, 0x30($sp)
/* 7DC6C 0017DB6C 2000B17F */  sq         $17, 0x20($sp)
/* 7DC70 0017DB70 1000B07F */  sq         $16, 0x10($sp)
/* 7DC74 0017DB74 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 7DC78 0017DB78 288E8070 */  paddub     $17, $4, $0
/* 7DC7C 0017DB7C 2886A070 */  paddub     $16, $5, $0
/* 7DC80 0017DB80 B890838F */  lw         $3, -0x6F48($gp)
/* 7DC84 0017DB84 59006010 */  beqz       $3, .L0017DCEC
/* 7DC88 0017DB88 00000000 */   nop
/* 7DC8C 0017DB8C 6090838F */  lw         $3, -0x6FA0($gp)
/* 7DC90 0017DB90 4000638C */  lw         $3, 0x40($3)
/* 7DC94 0017DB94 55006014 */  bnez       $3, .L0017DCEC
/* 7DC98 0017DB98 00000000 */   nop
/* 7DC9C 0017DB9C C701023C */  lui        $2, %hi(TexManager)
/* 7DCA0 0017DBA0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7DCA4 0017DBA4 D48B858F */  lw         $5, -0x742C($gp)
/* 7DCA8 0017DBA8 14000624 */  addiu      $6, $0, 0x14
/* 7DCAC 0017DBAC 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 7DCB0 0017DBB0 00000000 */   nop
/* 7DCB4 0017DBB4 28260070 */  paddub     $4, $0, $0
/* 7DCB8 0017DBB8 046F050C */  jal        setbilinear__Fi
/* 7DCBC 0017DBBC 00000000 */   nop
/* 7DCC0 0017DBC0 6000A0AF */  sw         $0, 0x60($sp)
/* 7DCC4 0017DBC4 6400A0AF */  sw         $0, 0x64($sp)
/* 7DCC8 0017DBC8 58000424 */  addiu      $4, $0, 0x58
/* 7DCCC 0017DBCC 6800A4AF */  sw         $4, 0x68($sp)
/* 7DCD0 0017DBD0 50000324 */  addiu      $3, $0, 0x50
/* 7DCD4 0017DBD4 6C00A3AF */  sw         $3, 0x6C($sp)
/* 7DCD8 0017DBD8 08022226 */  addiu      $2, $17, 0x208
/* 7DCDC 0017DBDC 5000A2AF */  sw         $2, 0x50($sp)
/* 7DCE0 0017DBE0 0E000226 */  addiu      $2, $16, 0xE
/* 7DCE4 0017DBE4 5400A2AF */  sw         $2, 0x54($sp)
/* 7DCE8 0017DBE8 5800A4AF */  sw         $4, 0x58($sp)
/* 7DCEC 0017DBEC 5C00A3AF */  sw         $3, 0x5C($sp)
/* 7DCF0 0017DBF0 A0B8040C */  jal        GetVif1Packet__Fv
/* 7DCF4 0017DBF4 00000000 */   nop
/* 7DCF8 0017DBF8 28964070 */  paddub     $18, $2, $0
/* 7DCFC 0017DBFC C701023C */  lui        $2, %hi(TexManager)
/* 7DD00 0017DC00 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7DD04 0017DC04 2A00023C */  lui        $2, %hi(_2151)
/* 7DD08 0017DC08 18AC4524 */  addiu      $5, $2, %lo(_2151)
/* 7DD0C 0017DC0C FFFF0624 */  addiu      $6, $0, -0x1
/* 7DD10 0017DC10 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 7DD14 0017DC14 00000000 */   nop
/* 7DD18 0017DC18 28264072 */  paddub     $4, $18, $0
/* 7DD1C 0017DC1C 282E4070 */  paddub     $5, $2, $0
/* 7DD20 0017DC20 5000A627 */  addiu      $6, $sp, 0x50
/* 7DD24 0017DC24 6000A727 */  addiu      $7, $sp, 0x60
/* 7DD28 0017DC28 80000824 */  addiu      $8, $0, 0x80
/* 7DD2C 0017DC2C C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 7DD30 0017DC30 00000000 */   nop
/* 7DD34 0017DC34 4041023C */  lui        $2, (0x41400000 >> 16)
/* 7DD38 0017DC38 00088244 */  mtc1       $2, $f1
/* 7DD3C 0017DC3C 049180C7 */  lwc1       $f0, -0x6EFC($gp)
/* 7DD40 0017DC40 43000146 */  div.s      $f1, $f0, $f1
/* 7DD44 0017DC44 0040023C */  lui        $2, (0x40000000 >> 16)
/* 7DD48 0017DC48 00008244 */  mtc1       $2, $f0
/* 7DD4C 0017DC4C 00000000 */  nop
/* 7DD50 0017DC50 42000146 */  mul.s      $f1, $f0, $f1
/* 7DD54 0017DC54 288180C7 */  lwc1       $f0, -0x7ED8($gp)
/* 7DD58 0017DC58 02050146 */  mul.s      $f20, $f0, $f1
/* 7DD5C 0017DC5C 808381C7 */  lwc1       $f1, -0x7C80($gp)
/* 7DD60 0017DC60 01001446 */  sub.s      $f0, $f0, $f20
/* 7DD64 0017DC64 000D0046 */  add.s      $f20, $f1, $f0
/* 7DD68 0017DC68 58000224 */  addiu      $2, $0, 0x58
/* 7DD6C 0017DC6C 8000A2AF */  sw         $2, 0x80($sp)
/* 7DD70 0017DC70 8400A0AF */  sw         $0, 0x84($sp)
/* 7DD74 0017DC74 16000424 */  addiu      $4, $0, 0x16
/* 7DD78 0017DC78 8800A4AF */  sw         $4, 0x88($sp)
/* 7DD7C 0017DC7C 28000324 */  addiu      $3, $0, 0x28
/* 7DD80 0017DC80 8C00A3AF */  sw         $3, 0x8C($sp)
/* 7DD84 0017DC84 34022226 */  addiu      $2, $17, 0x234
/* 7DD88 0017DC88 7000A2AF */  sw         $2, 0x70($sp)
/* 7DD8C 0017DC8C 36000226 */  addiu      $2, $16, 0x36
/* 7DD90 0017DC90 7400A2AF */  sw         $2, 0x74($sp)
/* 7DD94 0017DC94 7800A4AF */  sw         $4, 0x78($sp)
/* 7DD98 0017DC98 7C00A3AF */  sw         $3, 0x7C($sp)
/* 7DD9C 0017DC9C A0B8040C */  jal        GetVif1Packet__Fv
/* 7DDA0 0017DCA0 00000000 */   nop
/* 7DDA4 0017DCA4 28864070 */  paddub     $16, $2, $0
/* 7DDA8 0017DCA8 C701023C */  lui        $2, %hi(TexManager)
/* 7DDAC 0017DCAC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 7DDB0 0017DCB0 2A00023C */  lui        $2, %hi(_2151)
/* 7DDB4 0017DCB4 18AC4524 */  addiu      $5, $2, %lo(_2151)
/* 7DDB8 0017DCB8 FFFF0624 */  addiu      $6, $0, -0x1
/* 7DDBC 0017DCBC B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 7DDC0 0017DCC0 00000000 */   nop
/* 7DDC4 0017DCC4 28260072 */  paddub     $4, $16, $0
/* 7DDC8 0017DCC8 282E4070 */  paddub     $5, $2, $0
/* 7DDCC 0017DCCC 7000A627 */  addiu      $6, $sp, 0x70
/* 7DDD0 0017DCD0 8000A727 */  addiu      $7, $sp, 0x80
/* 7DDD4 0017DCD4 0C000824 */  addiu      $8, $0, 0xC
/* 7DDD8 0017DCD8 28000924 */  addiu      $9, $0, 0x28
/* 7DDDC 0017DCDC 06A30046 */  mov.s      $f12, $f20
/* 7DDE0 0017DCE0 80000A24 */  addiu      $10, $0, 0x80
/* 7DDE4 0017DCE4 740C060C */  jal        set2DSpriteRot__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iifUc
/* 7DDE8 0017DCE8 00000000 */   nop
.L0017DCEC:
/* 7DDEC 0017DCEC 4000BF7B */  lq         $31, 0x40($sp)
/* 7DDF0 0017DCF0 3000B27B */  lq         $18, 0x30($sp)
/* 7DDF4 0017DCF4 2000B17B */  lq         $17, 0x20($sp)
/* 7DDF8 0017DCF8 1000B07B */  lq         $16, 0x10($sp)
/* 7DDFC 0017DCFC 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 7DE00 0017DD00 9000BD27 */  addiu      $sp, $sp, 0x90
/* 7DE04 0017DD04 0800E003 */  jr         $31
/* 7DE08 0017DD08 00000000 */   nop
/* 7DE0C 0017DD0C 00000000 */  nop
