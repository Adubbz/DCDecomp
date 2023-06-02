.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StepWater__Fv
/* 9DBE0 0019DAE0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 9DBE4 0019DAE4 7000BF7F */  sq         $31, 0x70($sp)
/* 9DBE8 0019DAE8 6000B67F */  sq         $22, 0x60($sp)
/* 9DBEC 0019DAEC 5000B57F */  sq         $21, 0x50($sp)
/* 9DBF0 0019DAF0 4000B47F */  sq         $20, 0x40($sp)
/* 9DBF4 0019DAF4 3000B37F */  sq         $19, 0x30($sp)
/* 9DBF8 0019DAF8 2000B27F */  sq         $18, 0x20($sp)
/* 9DBFC 0019DAFC 1000B17F */  sq         $17, 0x10($sp)
/* 9DC00 0019DB00 0000B07F */  sq         $16, 0x0($sp)
/* 9DC04 0019DB04 D501033C */  lui        $3, %hi(Water)
/* 9DC08 0019DB08 F0367224 */  addiu      $18, $3, %lo(Water)
/* 9DC0C 0019DB0C 28860070 */  paddub     $16, $0, $0
/* 9DC10 0019DB10 67000010 */  b          .L0019DCB0
/* 9DC14 0019DB14 00000000 */   nop
.L0019DB18:
/* 9DC18 0019DB18 2000438E */  lw         $3, 0x20($18)
/* 9DC1C 0019DB1C 62006010 */  beqz       $3, .L0019DCA8
/* 9DC20 0019DB20 00000000 */   nop
/* 9DC24 0019DB24 90004426 */  addiu      $4, $18, 0x90
/* 9DC28 0019DB28 4084050C */  jal        CheckClip__6CWaterFv
/* 9DC2C 0019DB2C 00000000 */   nop
/* 9DC30 0019DB30 5D004014 */  bnez       $2, .L0019DCA8
/* 9DC34 0019DB34 00000000 */   nop
/* 9DC38 0019DB38 288E0070 */  paddub     $17, $0, $0
/* 9DC3C 0019DB3C 54000010 */  b          .L0019DC90
/* 9DC40 0019DB40 00000000 */   nop
.L0019DB44:
/* 9DC44 0019DB44 00A91100 */  sll        $21, $17, 4
/* 9DC48 0019DB48 2110B202 */  addu       $2, $21, $18
/* 9DC4C 0019DB4C 5C005624 */  addiu      $22, $2, 0x5C
/* 9DC50 0019DB50 5C0040C4 */  lwc1       $f0, 0x5C($2)
/* 9DC54 0019DB54 00088044 */  mtc1       $0, $f1
/* 9DC58 0019DB58 00000000 */  nop
/* 9DC5C 0019DB5C 32080046 */  c.eq.s     $f1, $f0
/* 9DC60 0019DB60 00000000 */  nop
/* 9DC64 0019DB64 06000045 */  bc1f       .L0019DB80
/* 9DC68 0019DB68 00000000 */   nop
/* 9DC6C 0019DB6C 580040C4 */  lwc1       $f0, 0x58($2)
/* 9DC70 0019DB70 32080046 */  c.eq.s     $f1, $f0
/* 9DC74 0019DB74 00000000 */  nop
/* 9DC78 0019DB78 48000145 */  bc1t       .L0019DC9C
/* 9DC7C 0019DB7C 00000000 */   nop
.L0019DB80:
/* 9DC80 0019DB80 2110B202 */  addu       $2, $21, $18
/* 9DC84 0019DB84 50004CC4 */  lwc1       $f12, 0x50($2)
/* 9DC88 0019DB88 2C44040C */  jal        fptosi
/* 9DC8C 0019DB8C 00000000 */   nop
/* 9DC90 0019DB90 289E4070 */  paddub     $19, $2, $0
/* 9DC94 0019DB94 2110B202 */  addu       $2, $21, $18
/* 9DC98 0019DB98 54004CC4 */  lwc1       $f12, 0x54($2)
/* 9DC9C 0019DB9C 2C44040C */  jal        fptosi
/* 9DCA0 0019DBA0 00000000 */   nop
/* 9DCA4 0019DBA4 28A64070 */  paddub     $20, $2, $0
/* 9DCA8 0019DBA8 12006106 */  bgez       $19, .L0019DBF4
/* 9DCAC 0019DBAC 00000000 */   nop
/* 9DCB0 0019DBB0 9000538E */  lw         $19, 0x90($18)
/* 9DCB4 0019DBB4 BE11040C */  jal        rand
/* 9DCB8 0019DBB8 00000000 */   nop
/* 9DCBC 0019DBBC 00008244 */  mtc1       $2, $f0
/* 9DCC0 0019DBC0 00000000 */  nop
/* 9DCC4 0019DBC4 60008046 */  cvt.s.w    $f1, $f0
/* 9DCC8 0019DBC8 00009344 */  mtc1       $19, $f0
/* 9DCCC 0019DBCC 00000000 */  nop
/* 9DCD0 0019DBD0 20008046 */  cvt.s.w    $f0, $f0
/* 9DCD4 0019DBD4 42000146 */  mul.s      $f1, $f0, $f1
/* 9DCD8 0019DBD8 004F023C */  lui        $2, (0x4F000000 >> 16)
/* 9DCDC 0019DBDC 00008244 */  mtc1       $2, $f0
/* 9DCE0 0019DBE0 00000000 */  nop
/* 9DCE4 0019DBE4 030B0046 */  div.s      $f12, $f1, $f0
/* 9DCE8 0019DBE8 2C44040C */  jal        fptosi
/* 9DCEC 0019DBEC 00000000 */   nop
/* 9DCF0 0019DBF0 289E4070 */  paddub     $19, $2, $0
.L0019DBF4:
/* 9DCF4 0019DBF4 12008106 */  bgez       $20, .L0019DC40
/* 9DCF8 0019DBF8 00000000 */   nop
/* 9DCFC 0019DBFC 9000548E */  lw         $20, 0x90($18)
/* 9DD00 0019DC00 BE11040C */  jal        rand
/* 9DD04 0019DC04 00000000 */   nop
/* 9DD08 0019DC08 00008244 */  mtc1       $2, $f0
/* 9DD0C 0019DC0C 00000000 */  nop
/* 9DD10 0019DC10 60008046 */  cvt.s.w    $f1, $f0
/* 9DD14 0019DC14 00009444 */  mtc1       $20, $f0
/* 9DD18 0019DC18 00000000 */  nop
/* 9DD1C 0019DC1C 20008046 */  cvt.s.w    $f0, $f0
/* 9DD20 0019DC20 42000146 */  mul.s      $f1, $f0, $f1
/* 9DD24 0019DC24 004F023C */  lui        $2, (0x4F000000 >> 16)
/* 9DD28 0019DC28 00008244 */  mtc1       $2, $f0
/* 9DD2C 0019DC2C 00000000 */  nop
/* 9DD30 0019DC30 030B0046 */  div.s      $f12, $f1, $f0
/* 9DD34 0019DC34 2C44040C */  jal        fptosi
/* 9DD38 0019DC38 00000000 */   nop
/* 9DD3C 0019DC3C 28A64070 */  paddub     $20, $2, $0
.L0019DC40:
/* 9DD40 0019DC40 BE11040C */  jal        rand
/* 9DD44 0019DC44 00000000 */   nop
/* 9DD48 0019DC48 00008244 */  mtc1       $2, $f0
/* 9DD4C 0019DC4C 00000000 */  nop
/* 9DD50 0019DC50 60008046 */  cvt.s.w    $f1, $f0
/* 9DD54 0019DC54 2110B202 */  addu       $2, $21, $18
/* 9DD58 0019DC58 580040C4 */  lwc1       $f0, 0x58($2)
/* 9DD5C 0019DC5C 42000146 */  mul.s      $f1, $f0, $f1
/* 9DD60 0019DC60 004F023C */  lui        $2, (0x4F000000 >> 16)
/* 9DD64 0019DC64 00008244 */  mtc1       $2, $f0
/* 9DD68 0019DC68 00000000 */  nop
/* 9DD6C 0019DC6C 43080046 */  div.s      $f1, $f1, $f0
/* 9DD70 0019DC70 0000C0C6 */  lwc1       $f0, 0x0($22)
/* 9DD74 0019DC74 00030146 */  add.s      $f12, $f0, $f1
/* 9DD78 0019DC78 90004426 */  addiu      $4, $18, 0x90
/* 9DD7C 0019DC7C 282E6072 */  paddub     $5, $19, $0
/* 9DD80 0019DC80 28368072 */  paddub     $6, $20, $0
/* 9DD84 0019DC84 DC84050C */  jal        Shake__6CWaterFiif
/* 9DD88 0019DC88 00000000 */   nop
/* 9DD8C 0019DC8C 01003126 */  addiu      $17, $17, 0x1
.L0019DC90:
/* 9DD90 0019DC90 0400222A */  slti       $2, $17, 0x4
/* 9DD94 0019DC94 ABFF4014 */  bnez       $2, .L0019DB44
/* 9DD98 0019DC98 00000000 */   nop
.L0019DC9C:
/* 9DD9C 0019DC9C 90004426 */  addiu      $4, $18, 0x90
/* 9DDA0 0019DCA0 7484050C */  jal        Hamon__6CWaterFv
/* 9DDA4 0019DCA4 00000000 */   nop
.L0019DCA8:
/* 9DDA8 0019DCA8 01001026 */  addiu      $16, $16, 0x1
/* 9DDAC 0019DCAC B0035226 */  addiu      $18, $18, 0x3B0
.L0019DCB0:
/* 9DDB0 0019DCB0 99FF001A */  blez       $16, .L0019DB18
/* 9DDB4 0019DCB4 00000000 */   nop
/* 9DDB8 0019DCB8 7000BF7B */  lq         $31, 0x70($sp)
/* 9DDBC 0019DCBC 6000B67B */  lq         $22, 0x60($sp)
/* 9DDC0 0019DCC0 5000B57B */  lq         $21, 0x50($sp)
/* 9DDC4 0019DCC4 4000B47B */  lq         $20, 0x40($sp)
/* 9DDC8 0019DCC8 3000B37B */  lq         $19, 0x30($sp)
/* 9DDCC 0019DCCC 2000B27B */  lq         $18, 0x20($sp)
/* 9DDD0 0019DCD0 1000B17B */  lq         $17, 0x10($sp)
/* 9DDD4 0019DCD4 0000B07B */  lq         $16, 0x0($sp)
/* 9DDD8 0019DCD8 8000BD27 */  addiu      $sp, $sp, 0x80
/* 9DDDC 0019DCDC 0800E003 */  jr         $31
/* 9DDE0 0019DCE0 00000000 */   nop
/* 9DDE4 0019DCE4 00000000 */  nop
/* 9DDE8 0019DCE8 00000000 */  nop
/* 9DDEC 0019DCEC 00000000 */  nop
