.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__11CUserStatusFi
/* BEB50 001BEA50 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* BEB54 001BEA54 1000BF7F */  sq         $31, 0x10($sp)
/* BEB58 001BEA58 0000B07F */  sq         $16, 0x0($sp)
/* BEB5C 001BEA5C 28868070 */  paddub     $16, $4, $0
/* BEB60 001BEA60 0100013C */  lui        $at, (0x10000 >> 16)
/* BEB64 001BEA64 21088100 */  addu       $at, $4, $at
/* BEB68 001BEA68 0C8B238C */  lw         $3, -0x74F4($at)
/* BEB6C 001BEA6C D5006014 */  bnez       $3, .L001BEDC4
/* BEB70 001BEA70 00000000 */   nop
/* BEB74 001BEA74 00000382 */  lb         $3, 0x0($16)
/* BEB78 001BEA78 00008344 */  mtc1       $3, $f0
/* BEB7C 001BEA7C 00000000 */  nop
/* BEB80 001BEA80 60008046 */  cvt.s.w    $f1, $f0
/* BEB84 001BEA84 9C8280C7 */  lwc1       $f0, -0x7D64($gp)
/* BEB88 001BEA88 42000146 */  mul.s      $f1, $f0, $f1
/* BEB8C 001BEA8C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* BEB90 001BEA90 00008344 */  mtc1       $3, $f0
/* BEB94 001BEA94 00000000 */  nop
/* BEB98 001BEA98 80000146 */  add.s      $f2, $f0, $f1
/* BEB9C 001BEA9C B48280C7 */  lwc1       $f0, -0x7D4C($gp)
/* BEBA0 001BEAA0 82000246 */  mul.s      $f2, $f0, $f2
/* BEBA4 001BEAA4 0100013C */  lui        $at, (0x10000 >> 16)
/* BEBA8 001BEAA8 21080102 */  addu       $at, $16, $at
/* BEBAC 001BEAAC 088B238C */  lw         $3, -0x74F8($at)
/* BEBB0 001BEAB0 61006014 */  bnez       $3, .L001BEC38
/* BEBB4 001BEAB4 00000000 */   nop
/* BEBB8 001BEAB8 5F00A014 */  bnez       $5, .L001BEC38
/* BEBBC 001BEABC 00000000 */   nop
/* BEBC0 001BEAC0 04000382 */  lb         $3, 0x4($16)
/* BEBC4 001BEAC4 80180300 */  sll        $3, $3, 2
/* BEBC8 001BEAC8 21187000 */  addu       $3, $3, $16
/* BEBCC 001BEACC 04436624 */  addiu      $6, $3, 0x4304
/* BEBD0 001BEAD0 044361C4 */  lwc1       $f1, 0x4304($3)
/* BEBD4 001BEAD4 00008044 */  mtc1       $0, $f0
/* BEBD8 001BEAD8 00000000 */  nop
/* BEBDC 001BEADC 36080046 */  c.le.s     $f1, $f0
/* BEBE0 001BEAE0 00000000 */  nop
/* BEBE4 001BEAE4 04000045 */  bc1f       .L001BEAF8
/* BEBE8 001BEAE8 00000000 */   nop
/* BEBEC 001BEAEC 0000C0AC */  sw         $0, 0x0($6)
/* BEBF0 001BEAF0 2A000010 */  b          .L001BEB9C
/* BEBF4 001BEAF4 00000000 */   nop
.L001BEAF8:
/* BEBF8 001BEAF8 0100013C */  lui        $at, (0x10000 >> 16)
/* BEBFC 001BEAFC 21080102 */  addu       $at, $16, $at
/* BEC00 001BEB00 108B248C */  lw         $4, -0x74F0($at)
/* BEC04 001BEB04 0B000324 */  addiu      $3, $0, 0xB
/* BEC08 001BEB08 05008314 */  bne        $4, $3, .L001BEB20
/* BEC0C 001BEB0C 00000000 */   nop
/* BEC10 001BEB10 A040033C */  lui        $3, (0x40A00000 >> 16)
/* BEC14 001BEB14 00008344 */  mtc1       $3, $f0
/* BEC18 001BEB18 00000000 */  nop
/* BEC1C 001BEB1C 82000246 */  mul.s      $f2, $f0, $f2
.L001BEB20:
/* BEC20 001BEB20 049D838F */  lw         $3, -0x62FC($gp)
/* BEC24 001BEB24 EE006484 */  lh         $4, 0xEE($3)
/* BEC28 001BEB28 08008330 */  andi       $3, $4, 0x8
/* BEC2C 001BEB2C 03006010 */  beqz       $3, .L001BEB3C
/* BEC30 001BEB30 00000000 */   nop
/* BEC34 001BEB34 008280C7 */  lwc1       $f0, -0x7E00($gp)
/* BEC38 001BEB38 82100046 */  mul.s      $f2, $f2, $f0
.L001BEB3C:
/* BEC3C 001BEB3C 10008330 */  andi       $3, $4, 0x10
/* BEC40 001BEB40 05006010 */  beqz       $3, .L001BEB58
/* BEC44 001BEB44 00000000 */   nop
/* BEC48 001BEB48 0040033C */  lui        $3, (0x40000000 >> 16)
/* BEC4C 001BEB4C 00008344 */  mtc1       $3, $f0
/* BEC50 001BEB50 00000000 */  nop
/* BEC54 001BEB54 82100046 */  mul.s      $f2, $f2, $f0
.L001BEB58:
/* BEC58 001BEB58 0400A014 */  bnez       $5, .L001BEB6C
/* BEC5C 001BEB5C 00000000 */   nop
/* BEC60 001BEB60 0000C0C4 */  lwc1       $f0, 0x0($6)
/* BEC64 001BEB64 01000246 */  sub.s      $f0, $f0, $f2
/* BEC68 001BEB68 0000C0E4 */  swc1       $f0, 0x0($6)
.L001BEB6C:
/* BEC6C 001BEB6C 04000382 */  lb         $3, 0x4($16)
/* BEC70 001BEB70 80180300 */  sll        $3, $3, 2
/* BEC74 001BEB74 21187000 */  addu       $3, $3, $16
/* BEC78 001BEB78 04436424 */  addiu      $4, $3, 0x4304
/* BEC7C 001BEB7C 044361C4 */  lwc1       $f1, 0x4304($3)
/* BEC80 001BEB80 00008044 */  mtc1       $0, $f0
/* BEC84 001BEB84 00000000 */  nop
/* BEC88 001BEB88 36080046 */  c.le.s     $f1, $f0
/* BEC8C 001BEB8C 00000000 */  nop
/* BEC90 001BEB90 02000045 */  bc1f       .L001BEB9C
/* BEC94 001BEB94 00000000 */   nop
/* BEC98 001BEB98 000080AC */  sw         $0, 0x0($4)
.L001BEB9C:
/* BEC9C 001BEB9C 04000382 */  lb         $3, 0x4($16)
/* BECA0 001BEBA0 80180300 */  sll        $3, $3, 2
/* BECA4 001BEBA4 21187000 */  addu       $3, $3, $16
/* BECA8 001BEBA8 044361C4 */  lwc1       $f1, 0x4304($3)
/* BECAC 001BEBAC 00008044 */  mtc1       $0, $f0
/* BECB0 001BEBB0 00000000 */  nop
/* BECB4 001BEBB4 36080046 */  c.le.s     $f1, $f0
/* BECB8 001BEBB8 00000000 */  nop
/* BECBC 001BEBBC 09000045 */  bc1f       .L001BEBE4
/* BECC0 001BEBC0 00000000 */   nop
/* BECC4 001BEBC4 0100013C */  lui        $at, (0x10000 >> 16)
/* BECC8 001BEBC8 21086100 */  addu       $at, $3, $at
/* BECCC 001BEBCC F08A21C4 */  lwc1       $f1, -0x7510($at)
/* BECD0 001BEBD0 B88280C7 */  lwc1       $f0, -0x7D48($gp)
/* BECD4 001BEBD4 00080046 */  add.s      $f0, $f1, $f0
/* BECD8 001BEBD8 0100013C */  lui        $at, (0x10000 >> 16)
/* BECDC 001BEBDC 21086100 */  addu       $at, $3, $at
/* BECE0 001BEBE0 F08A20E4 */  swc1       $f0, -0x7510($at)
.L001BEBE4:
/* BECE4 001BEBE4 04000382 */  lb         $3, 0x4($16)
/* BECE8 001BEBE8 80180300 */  sll        $3, $3, 2
/* BECEC 001BEBEC 21187000 */  addu       $3, $3, $16
/* BECF0 001BEBF0 F80A6424 */  addiu      $4, $3, 0xAF8
/* BECF4 001BEBF4 F87F8424 */  addiu      $4, $4, 0x7FF8
/* BECF8 001BEBF8 000081C4 */  lwc1       $f1, 0x0($4)
/* BECFC 001BEBFC 803F033C */  lui        $3, (0x3F800000 >> 16)
/* BED00 001BEC00 00008344 */  mtc1       $3, $f0
/* BED04 001BEC04 00000000 */  nop
/* BED08 001BEC08 34080046 */  c.lt.s     $f1, $f0
/* BED0C 001BEC0C 00000000 */  nop
/* BED10 001BEC10 09000145 */  bc1t       .L001BEC38
/* BED14 001BEC14 00000000 */   nop
/* BED18 001BEC18 000080AC */  sw         $0, 0x0($4)
/* BED1C 001BEC1C 2041023C */  lui        $2, (0x41200000 >> 16)
/* BED20 001BEC20 00608244 */  mtc1       $2, $f12
/* BED24 001BEC24 04000582 */  lb         $5, 0x4($16)
/* BED28 001BEC28 28260072 */  paddub     $4, $16, $0
/* BED2C 001BEC2C FFFF0624 */  addiu      $6, $0, -0x1
/* BED30 001BEC30 C4F9060C */  jal        AddNowLife__11CUserStatusFisf
/* BED34 001BEC34 00000000 */   nop
.L001BEC38:
/* BED38 001BEC38 28360070 */  paddub     $6, $0, $0
/* BED3C 001BEC3C 33000010 */  b          .L001BED0C
/* BED40 001BEC40 00000000 */   nop
.L001BEC44:
/* BED44 001BEC44 40400600 */  sll        $8, $6, 1
/* BED48 001BEC48 21281001 */  addu       $5, $8, $16
/* BED4C 001BEC4C EA0AA724 */  addiu      $7, $5, 0xAEA
/* BED50 001BEC50 F87FE724 */  addiu      $7, $7, 0x7FF8
/* BED54 001BEC54 0000E484 */  lh         $4, 0x0($7)
/* BED58 001BEC58 2B008010 */  beqz       $4, .L001BED08
/* BED5C 001BEC5C 00000000 */   nop
/* BED60 001BEC60 80180600 */  sll        $3, $6, 2
/* BED64 001BEC64 21187000 */  addu       $3, $3, $16
/* BED68 001BEC68 04436924 */  addiu      $9, $3, 0x4304
/* BED6C 001BEC6C 044361C4 */  lwc1       $f1, 0x4304($3)
/* BED70 001BEC70 00008444 */  mtc1       $4, $f0
/* BED74 001BEC74 00000000 */  nop
/* BED78 001BEC78 20008046 */  cvt.s.w    $f0, $f0
/* BED7C 001BEC7C 00080046 */  add.s      $f0, $f1, $f0
/* BED80 001BEC80 044360E4 */  swc1       $f0, 0x4304($3)
/* BED84 001BEC84 0000E384 */  lh         $3, 0x0($7)
/* BED88 001BEC88 0E006104 */  bgez       $3, .L001BECC4
/* BED8C 001BEC8C 00000000 */   nop
/* BED90 001BEC90 0100013C */  lui        $at, (0x10000 >> 16)
/* BED94 001BEC94 2108A100 */  addu       $at, $5, $at
/* BED98 001BEC98 D68A2384 */  lh         $3, -0x752A($at)
/* BED9C 001BEC9C 00008344 */  mtc1       $3, $f0
/* BEDA0 001BECA0 00000000 */  nop
/* BEDA4 001BECA4 60008046 */  cvt.s.w    $f1, $f0
/* BEDA8 001BECA8 000020C5 */  lwc1       $f0, 0x0($9)
/* BEDAC 001BECAC 36000146 */  c.le.s     $f0, $f1
/* BEDB0 001BECB0 00000000 */  nop
/* BEDB4 001BECB4 03000045 */  bc1f       .L001BECC4
/* BEDB8 001BECB8 00000000 */   nop
/* BEDBC 001BECBC 000021E5 */  swc1       $f1, 0x0($9)
/* BEDC0 001BECC0 0000E0A4 */  sh         $0, 0x0($7)
.L001BECC4:
/* BEDC4 001BECC4 0000E384 */  lh         $3, 0x0($7)
/* BEDC8 001BECC8 0F006018 */  blez       $3, .L001BED08
/* BEDCC 001BECCC 00000000 */   nop
/* BEDD0 001BECD0 21181001 */  addu       $3, $8, $16
/* BEDD4 001BECD4 0100013C */  lui        $at, (0x10000 >> 16)
/* BEDD8 001BECD8 21086100 */  addu       $at, $3, $at
/* BEDDC 001BECDC D68A2384 */  lh         $3, -0x752A($at)
/* BEDE0 001BECE0 00008344 */  mtc1       $3, $f0
/* BEDE4 001BECE4 00000000 */  nop
/* BEDE8 001BECE8 60008046 */  cvt.s.w    $f1, $f0
/* BEDEC 001BECEC 000020C5 */  lwc1       $f0, 0x0($9)
/* BEDF0 001BECF0 34000146 */  c.lt.s     $f0, $f1
/* BEDF4 001BECF4 00000000 */  nop
/* BEDF8 001BECF8 03000145 */  bc1t       .L001BED08
/* BEDFC 001BECFC 00000000 */   nop
/* BEE00 001BED00 000021E5 */  swc1       $f1, 0x0($9)
/* BEE04 001BED04 0000E0A4 */  sh         $0, 0x0($7)
.L001BED08:
/* BEE08 001BED08 0100C624 */  addiu      $6, $6, 0x1
.L001BED0C:
/* BEE0C 001BED0C 0600C328 */  slti       $3, $6, 0x6
/* BEE10 001BED10 CCFF6014 */  bnez       $3, .L001BEC44
/* BEE14 001BED14 00000000 */   nop
/* BEE18 001BED18 28360070 */  paddub     $6, $0, $0
/* BEE1C 001BED1C 26000010 */  b          .L001BEDB8
/* BEE20 001BED20 00000000 */   nop
.L001BED24:
/* BEE24 001BED24 40380600 */  sll        $7, $6, 1
/* BEE28 001BED28 2128F000 */  addu       $5, $7, $16
/* BEE2C 001BED2C 700AA824 */  addiu      $8, $5, 0xA70
/* BEE30 001BED30 F87F0825 */  addiu      $8, $8, 0x7FF8
/* BEE34 001BED34 00000485 */  lh         $4, 0x0($8)
/* BEE38 001BED38 1E008010 */  beqz       $4, .L001BEDB4
/* BEE3C 001BED3C 00000000 */   nop
/* BEE40 001BED40 1200A924 */  addiu      $9, $5, 0x12
/* BEE44 001BED44 1200A384 */  lh         $3, 0x12($5)
/* BEE48 001BED48 21186400 */  addu       $3, $3, $4
/* BEE4C 001BED4C 1200A3A4 */  sh         $3, 0x12($5)
/* BEE50 001BED50 00000385 */  lh         $3, 0x0($8)
/* BEE54 001BED54 0A006104 */  bgez       $3, .L001BED80
/* BEE58 001BED58 00000000 */   nop
/* BEE5C 001BED5C 00002485 */  lh         $4, 0x0($9)
/* BEE60 001BED60 0100013C */  lui        $at, (0x10000 >> 16)
/* BEE64 001BED64 2108A100 */  addu       $at, $5, $at
/* BEE68 001BED68 5C8A2384 */  lh         $3, -0x75A4($at)
/* BEE6C 001BED6C 2A086400 */  slt        $at, $3, $4
/* BEE70 001BED70 03002014 */  bnez       $at, .L001BED80
/* BEE74 001BED74 00000000 */   nop
/* BEE78 001BED78 000023A5 */  sh         $3, 0x0($9)
/* BEE7C 001BED7C 000000A5 */  sh         $0, 0x0($8)
.L001BED80:
/* BEE80 001BED80 00000385 */  lh         $3, 0x0($8)
/* BEE84 001BED84 0B006018 */  blez       $3, .L001BEDB4
/* BEE88 001BED88 00000000 */   nop
/* BEE8C 001BED8C 00002585 */  lh         $5, 0x0($9)
/* BEE90 001BED90 2118F000 */  addu       $3, $7, $16
/* BEE94 001BED94 0100013C */  lui        $at, (0x10000 >> 16)
/* BEE98 001BED98 21086100 */  addu       $at, $3, $at
/* BEE9C 001BED9C 5C8A2484 */  lh         $4, -0x75A4($at)
/* BEEA0 001BEDA0 2A18A400 */  slt        $3, $5, $4
/* BEEA4 001BEDA4 03006014 */  bnez       $3, .L001BEDB4
/* BEEA8 001BEDA8 00000000 */   nop
/* BEEAC 001BEDAC 000024A5 */  sh         $4, 0x0($9)
/* BEEB0 001BEDB0 000000A5 */  sh         $0, 0x0($8)
.L001BEDB4:
/* BEEB4 001BEDB4 0100C624 */  addiu      $6, $6, 0x1
.L001BEDB8:
/* BEEB8 001BEDB8 0600C328 */  slti       $3, $6, 0x6
/* BEEBC 001BEDBC D9FF6014 */  bnez       $3, .L001BED24
/* BEEC0 001BEDC0 00000000 */   nop
.L001BEDC4:
/* BEEC4 001BEDC4 1000BF7B */  lq         $31, 0x10($sp)
/* BEEC8 001BEDC8 0000B07B */  lq         $16, 0x0($sp)
/* BEECC 001BEDCC 2000BD27 */  addiu      $sp, $sp, 0x20
/* BEED0 001BEDD0 0800E003 */  jr         $31
/* BEED4 001BEDD4 00000000 */   nop
/* BEED8 001BEDD8 00000000 */  nop
/* BEEDC 001BEDDC 00000000 */  nop
