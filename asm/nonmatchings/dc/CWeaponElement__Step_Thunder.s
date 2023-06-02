.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step_Thunder__14CWeaponElementFv
/* BAB20 001BAA20 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* BAB24 001BAA24 4000BF7F */  sq         $31, 0x40($sp)
/* BAB28 001BAA28 3000B37F */  sq         $19, 0x30($sp)
/* BAB2C 001BAA2C 2000B27F */  sq         $18, 0x20($sp)
/* BAB30 001BAA30 1000B17F */  sq         $17, 0x10($sp)
/* BAB34 001BAA34 0000B07F */  sq         $16, 0x0($sp)
/* BAB38 001BAA38 289E8070 */  paddub     $19, $4, $0
/* BAB3C 001BAA3C 282E0070 */  paddub     $5, $0, $0
/* BAB40 001BAA40 28360070 */  paddub     $6, $0, $0
/* BAB44 001BAA44 2F000010 */  b          .L001BAB04
/* BAB48 001BAA48 00000000 */   nop
.L001BAA4C:
/* BAB4C 001BAA4C 80180600 */  sll        $3, $6, 2
/* BAB50 001BAA50 21207300 */  addu       $4, $3, $19
/* BAB54 001BAA54 20058724 */  addiu      $7, $4, 0x520
/* BAB58 001BAA58 200581C4 */  lwc1       $f1, 0x520($4)
/* BAB5C 001BAA5C 00008044 */  mtc1       $0, $f0
/* BAB60 001BAA60 00000000 */  nop
/* BAB64 001BAA64 36080046 */  c.le.s     $f1, $f0
/* BAB68 001BAA68 00000000 */  nop
/* BAB6C 001BAA6C 04000045 */  bc1f       .L001BAA80
/* BAB70 001BAA70 00000000 */   nop
/* BAB74 001BAA74 0100A524 */  addiu      $5, $5, 0x1
/* BAB78 001BAA78 21000010 */  b          .L001BAB00
/* BAB7C 001BAA7C 00000000 */   nop
.L001BAA80:
/* BAB80 001BAA80 00190600 */  sll        $3, $6, 4
/* BAB84 001BAA84 21187300 */  addu       $3, $3, $19
/* BAB88 001BAA88 200261C4 */  lwc1       $f1, 0x220($3)
/* BAB8C 001BAA8C 200060C4 */  lwc1       $f0, 0x20($3)
/* BAB90 001BAA90 00000146 */  add.s      $f0, $f0, $f1
/* BAB94 001BAA94 200060E4 */  swc1       $f0, 0x20($3)
/* BAB98 001BAA98 240261C4 */  lwc1       $f1, 0x224($3)
/* BAB9C 001BAA9C 240060C4 */  lwc1       $f0, 0x24($3)
/* BABA0 001BAAA0 00000146 */  add.s      $f0, $f0, $f1
/* BABA4 001BAAA4 240060E4 */  swc1       $f0, 0x24($3)
/* BABA8 001BAAA8 280261C4 */  lwc1       $f1, 0x228($3)
/* BABAC 001BAAAC 280060C4 */  lwc1       $f0, 0x28($3)
/* BABB0 001BAAB0 00000146 */  add.s      $f0, $f0, $f1
/* BABB4 001BAAB4 280060E4 */  swc1       $f0, 0x28($3)
/* BABB8 001BAAB8 A00481C4 */  lwc1       $f1, 0x4A0($4)
/* BABBC 001BAABC 148480C7 */  lwc1       $f0, -0x7BEC($gp)
/* BABC0 001BAAC0 01080046 */  sub.s      $f0, $f1, $f0
/* BABC4 001BAAC4 A00480E4 */  swc1       $f0, 0x4A0($4)
/* BABC8 001BAAC8 0000E1C4 */  lwc1       $f1, 0x0($7)
/* BABCC 001BAACC 8040033C */  lui        $3, (0x40800000 >> 16)
/* BABD0 001BAAD0 00008344 */  mtc1       $3, $f0
/* BABD4 001BAAD4 00000000 */  nop
/* BABD8 001BAAD8 41080046 */  sub.s      $f1, $f1, $f0
/* BABDC 001BAADC 0000E1E4 */  swc1       $f1, 0x0($7)
/* BABE0 001BAAE0 4040033C */  lui        $3, (0x40400000 >> 16)
/* BABE4 001BAAE4 00008344 */  mtc1       $3, $f0
/* BABE8 001BAAE8 00000000 */  nop
/* BABEC 001BAAEC 36080046 */  c.le.s     $f1, $f0
/* BABF0 001BAAF0 00000000 */  nop
/* BABF4 001BAAF4 02000045 */  bc1f       .L001BAB00
/* BABF8 001BAAF8 00000000 */   nop
/* BABFC 001BAAFC 0000E0AC */  sw         $0, 0x0($7)
.L001BAB00:
/* BAC00 001BAB00 0100C624 */  addiu      $6, $6, 0x1
.L001BAB04:
/* BAC04 001BAB04 AE056486 */  lh         $4, 0x5AE($19)
/* BAC08 001BAB08 2A18C400 */  slt        $3, $6, $4
/* BAC0C 001BAB0C CFFF6014 */  bnez       $3, .L001BAA4C
/* BAC10 001BAB10 00000000 */   nop
/* BAC14 001BAB14 2A18A400 */  slt        $3, $5, $4
/* BAC18 001BAB18 04006014 */  bnez       $3, .L001BAB2C
/* BAC1C 001BAB1C 00000000 */   nop
/* BAC20 001BAB20 AC0560A6 */  sh         $0, 0x5AC($19)
/* BAC24 001BAB24 6C000010 */  b          .L001BACD8
/* BAC28 001BAB28 00000000 */   nop
.L001BAB2C:
/* BAC2C 001BAB2C 28860070 */  paddub     $16, $0, $0
/* BAC30 001BAB30 65000010 */  b          .L001BACC8
/* BAC34 001BAB34 00000000 */   nop
.L001BAB38:
/* BAC38 001BAB38 40901000 */  sll        $18, $16, 1
/* BAC3C 001BAB3C 21285302 */  addu       $5, $18, $19
/* BAC40 001BAB40 7C07B124 */  addiu      $17, $5, 0x77C
/* BAC44 001BAB44 7C07A384 */  lh         $3, 0x77C($5)
/* BAC48 001BAB48 FFFF6324 */  addiu      $3, $3, -0x1
/* BAC4C 001BAB4C 7C07A3A4 */  sh         $3, 0x77C($5)
/* BAC50 001BAB50 7C07A484 */  lh         $4, 0x77C($5)
/* BAC54 001BAB54 4B00801C */  bgtz       $4, .L001BAC84
/* BAC58 001BAB58 00000000 */   nop
/* BAC5C 001BAB5C BE11040C */  jal        rand
/* BAC60 001BAB60 00000000 */   nop
/* BAC64 001BAB64 00008244 */  mtc1       $2, $f0
/* BAC68 001BAB68 00000000 */  nop
/* BAC6C 001BAB6C 60008046 */  cvt.s.w    $f1, $f0
/* BAC70 001BAB70 AE056286 */  lh         $2, 0x5AE($19)
/* BAC74 001BAB74 00008244 */  mtc1       $2, $f0
/* BAC78 001BAB78 00000000 */  nop
/* BAC7C 001BAB7C 20008046 */  cvt.s.w    $f0, $f0
/* BAC80 001BAB80 42000146 */  mul.s      $f1, $f0, $f1
/* BAC84 001BAB84 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BAC88 001BAB88 00008244 */  mtc1       $2, $f0
/* BAC8C 001BAB8C 00000000 */  nop
/* BAC90 001BAB90 030B0046 */  div.s      $f12, $f1, $f0
/* BAC94 001BAB94 2C44040C */  jal        fptosi
/* BAC98 001BAB98 00000000 */   nop
/* BAC9C 001BAB9C 21185302 */  addu       $3, $18, $19
/* BACA0 001BABA0 3C0762A4 */  sh         $2, 0x73C($3)
/* BACA4 001BABA4 BE11040C */  jal        rand
/* BACA8 001BABA8 00000000 */   nop
/* BACAC 001BABAC 00008244 */  mtc1       $2, $f0
/* BACB0 001BABB0 00000000 */  nop
/* BACB4 001BABB4 60008046 */  cvt.s.w    $f1, $f0
/* BACB8 001BABB8 AE056286 */  lh         $2, 0x5AE($19)
/* BACBC 001BABBC 00008244 */  mtc1       $2, $f0
/* BACC0 001BABC0 00000000 */  nop
/* BACC4 001BABC4 20008046 */  cvt.s.w    $f0, $f0
/* BACC8 001BABC8 42000146 */  mul.s      $f1, $f0, $f1
/* BACCC 001BABCC 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BACD0 001BABD0 00008244 */  mtc1       $2, $f0
/* BACD4 001BABD4 00000000 */  nop
/* BACD8 001BABD8 030B0046 */  div.s      $f12, $f1, $f0
/* BACDC 001BABDC 2C44040C */  jal        fptosi
/* BACE0 001BABE0 00000000 */   nop
/* BACE4 001BABE4 21185302 */  addu       $3, $18, $19
/* BACE8 001BABE8 5C0762A4 */  sh         $2, 0x75C($3)
/* BACEC 001BABEC BE11040C */  jal        rand
/* BACF0 001BABF0 00000000 */   nop
/* BACF4 001BABF4 00008244 */  mtc1       $2, $f0
/* BACF8 001BABF8 00000000 */  nop
/* BACFC 001BABFC 60008046 */  cvt.s.w    $f1, $f0
/* BAD00 001BAC00 C040023C */  lui        $2, (0x40C00000 >> 16)
/* BAD04 001BAC04 00008244 */  mtc1       $2, $f0
/* BAD08 001BAC08 00000000 */  nop
/* BAD0C 001BAC0C 42000146 */  mul.s      $f1, $f0, $f1
/* BAD10 001BAC10 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BAD14 001BAC14 00008244 */  mtc1       $2, $f0
/* BAD18 001BAC18 00000000 */  nop
/* BAD1C 001BAC1C 030B0046 */  div.s      $f12, $f1, $f0
/* BAD20 001BAC20 2C44040C */  jal        fptosi
/* BAD24 001BAC24 00000000 */   nop
/* BAD28 001BAC28 40180200 */  sll        $3, $2, 1
/* BAD2C 001BAC2C 21106200 */  addu       $2, $3, $2
/* BAD30 001BAC30 03004224 */  addiu      $2, $2, 0x3
/* BAD34 001BAC34 000022A6 */  sh         $2, 0x0($17)
/* BAD38 001BAC38 BE11040C */  jal        rand
/* BAD3C 001BAC3C 00000000 */   nop
/* BAD40 001BAC40 00008244 */  mtc1       $2, $f0
/* BAD44 001BAC44 00000000 */  nop
/* BAD48 001BAC48 60008046 */  cvt.s.w    $f1, $f0
/* BAD4C 001BAC4C 8040023C */  lui        $2, (0x40800000 >> 16)
/* BAD50 001BAC50 00008244 */  mtc1       $2, $f0
/* BAD54 001BAC54 00000000 */  nop
/* BAD58 001BAC58 42000146 */  mul.s      $f1, $f0, $f1
/* BAD5C 001BAC5C 004F023C */  lui        $2, (0x4F000000 >> 16)
/* BAD60 001BAC60 00008244 */  mtc1       $2, $f0
/* BAD64 001BAC64 00000000 */  nop
/* BAD68 001BAC68 030B0046 */  div.s      $f12, $f1, $f0
/* BAD6C 001BAC6C 2C44040C */  jal        fptosi
/* BAD70 001BAC70 00000000 */   nop
/* BAD74 001BAC74 21185302 */  addu       $3, $18, $19
/* BAD78 001BAC78 9C0762A4 */  sh         $2, 0x79C($3)
/* BAD7C 001BAC7C 11000010 */  b          .L001BACC4
/* BAD80 001BAC80 00000000 */   nop
.L001BAC84:
/* BAD84 001BAC84 03000324 */  addiu      $3, $0, 0x3
/* BAD88 001BAC88 1A008300 */  div        $0, $4, $3
/* BAD8C 001BAC8C 00000000 */  nop
/* BAD90 001BAC90 00000000 */  nop
/* BAD94 001BAC94 10180000 */  mfhi       $3
/* BAD98 001BAC98 0A006014 */  bnez       $3, .L001BACC4
/* BAD9C 001BAC9C 00000000 */   nop
/* BADA0 001BACA0 9C07A424 */  addiu      $4, $5, 0x79C
/* BADA4 001BACA4 9C07A384 */  lh         $3, 0x79C($5)
/* BADA8 001BACA8 01006324 */  addiu      $3, $3, 0x1
/* BADAC 001BACAC 9C07A3A4 */  sh         $3, 0x79C($5)
/* BADB0 001BACB0 9C07A384 */  lh         $3, 0x79C($5)
/* BADB4 001BACB4 04006328 */  slti       $3, $3, 0x4
/* BADB8 001BACB8 02006014 */  bnez       $3, .L001BACC4
/* BADBC 001BACBC 00000000 */   nop
/* BADC0 001BACC0 000080A4 */  sh         $0, 0x0($4)
.L001BACC4:
/* BADC4 001BACC4 01001026 */  addiu      $16, $16, 0x1
.L001BACC8:
/* BADC8 001BACC8 BC076386 */  lh         $3, 0x7BC($19)
/* BADCC 001BACCC 2A180302 */  slt        $3, $16, $3
/* BADD0 001BACD0 99FF6014 */  bnez       $3, .L001BAB38
/* BADD4 001BACD4 00000000 */   nop
.L001BACD8:
/* BADD8 001BACD8 4000BF7B */  lq         $31, 0x40($sp)
/* BADDC 001BACDC 3000B37B */  lq         $19, 0x30($sp)
/* BADE0 001BACE0 2000B27B */  lq         $18, 0x20($sp)
/* BADE4 001BACE4 1000B17B */  lq         $17, 0x10($sp)
/* BADE8 001BACE8 0000B07B */  lq         $16, 0x0($sp)
/* BADEC 001BACEC 5000BD27 */  addiu      $sp, $sp, 0x50
/* BADF0 001BACF0 0800E003 */  jr         $31
/* BADF4 001BACF4 00000000 */   nop
/* BADF8 001BACF8 00000000 */  nop
/* BADFC 001BACFC 00000000 */  nop
