.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__6ClsMesFv
/* 4DE90 0014DD90 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 4DE94 0014DD94 3000BF7F */  sq         $31, 0x30($sp)
/* 4DE98 0014DD98 2000B17F */  sq         $17, 0x20($sp)
/* 4DE9C 0014DD9C 1000B07F */  sq         $16, 0x10($sp)
/* 4DEA0 0014DDA0 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 4DEA4 0014DDA4 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 4DEA8 0014DDA8 28868070 */  paddub     $16, $4, $0
/* 4DEAC 0014DDAC 3400838C */  lw         $3, 0x34($4)
/* 4DEB0 0014DDB0 05006014 */  bnez       $3, .L0014DDC8
/* 4DEB4 0014DDB4 00000000 */   nop
/* 4DEB8 0014DDB8 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 4DEBC 0014DDBC 900003AE */  sw         $3, 0x90($16)
/* 4DEC0 0014DDC0 A7000010 */  b          .L0014E060
/* 4DEC4 0014DDC4 00000000 */   nop
.L0014DDC8:
/* 4DEC8 0014DDC8 9400038E */  lw         $3, 0x94($16)
/* 4DECC 0014DDCC 17006010 */  beqz       $3, .L0014DE2C
/* 4DED0 0014DDD0 00000000 */   nop
/* 4DED4 0014DDD4 900001C6 */  lwc1       $f1, 0x90($16)
/* 4DED8 0014DDD8 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 4DEDC 0014DDDC 00008344 */  mtc1       $3, $f0
/* 4DEE0 0014DDE0 00000000 */  nop
/* 4DEE4 0014DDE4 34080046 */  c.lt.s     $f1, $f0
/* 4DEE8 0014DDE8 00000000 */  nop
/* 4DEEC 0014DDEC 04000045 */  bc1f       .L0014DE00
/* 4DEF0 0014DDF0 00000000 */   nop
/* 4DEF4 0014DDF4 8C0000C6 */  lwc1       $f0, 0x8C($16)
/* 4DEF8 0014DDF8 00080046 */  add.s      $f0, $f1, $f0
/* 4DEFC 0014DDFC 900000E6 */  swc1       $f0, 0x90($16)
.L0014DE00:
/* 4DF00 0014DE00 900001C6 */  lwc1       $f1, 0x90($16)
/* 4DF04 0014DE04 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 4DF08 0014DE08 00008344 */  mtc1       $3, $f0
/* 4DF0C 0014DE0C 00000000 */  nop
/* 4DF10 0014DE10 34000146 */  c.lt.s     $f0, $f1
/* 4DF14 0014DE14 00000000 */  nop
/* 4DF18 0014DE18 16000045 */  bc1f       .L0014DE74
/* 4DF1C 0014DE1C 00000000 */   nop
/* 4DF20 0014DE20 900003AE */  sw         $3, 0x90($16)
/* 4DF24 0014DE24 13000010 */  b          .L0014DE74
/* 4DF28 0014DE28 00000000 */   nop
.L0014DE2C:
/* 4DF2C 0014DE2C 900001C6 */  lwc1       $f1, 0x90($16)
/* 4DF30 0014DE30 00008044 */  mtc1       $0, $f0
/* 4DF34 0014DE34 00000000 */  nop
/* 4DF38 0014DE38 34000146 */  c.lt.s     $f0, $f1
/* 4DF3C 0014DE3C 00000000 */  nop
/* 4DF40 0014DE40 04000045 */  bc1f       .L0014DE54
/* 4DF44 0014DE44 00000000 */   nop
/* 4DF48 0014DE48 8C0000C6 */  lwc1       $f0, 0x8C($16)
/* 4DF4C 0014DE4C 01080046 */  sub.s      $f0, $f1, $f0
/* 4DF50 0014DE50 900000E6 */  swc1       $f0, 0x90($16)
.L0014DE54:
/* 4DF54 0014DE54 900001C6 */  lwc1       $f1, 0x90($16)
/* 4DF58 0014DE58 00008044 */  mtc1       $0, $f0
/* 4DF5C 0014DE5C 00000000 */  nop
/* 4DF60 0014DE60 34080046 */  c.lt.s     $f1, $f0
/* 4DF64 0014DE64 00000000 */  nop
/* 4DF68 0014DE68 02000045 */  bc1f       .L0014DE74
/* 4DF6C 0014DE6C 00000000 */   nop
/* 4DF70 0014DE70 900000AE */  sw         $0, 0x90($16)
.L0014DE74:
/* 4DF74 0014DE74 5800038E */  lw         $3, 0x58($16)
/* 4DF78 0014DE78 79006010 */  beqz       $3, .L0014E060
/* 4DF7C 0014DE7C 00000000 */   nop
/* 4DF80 0014DE80 640000C6 */  lwc1       $f0, 0x64($16)
/* 4DF84 0014DE84 20008046 */  cvt.s.w    $f0, $f0
/* 4DF88 0014DE88 4800A0E7 */  swc1       $f0, 0x48($sp)
/* 4DF8C 0014DE8C 680000C6 */  lwc1       $f0, 0x68($16)
/* 4DF90 0014DE90 20008046 */  cvt.s.w    $f0, $f0
/* 4DF94 0014DE94 4C00A0E7 */  swc1       $f0, 0x4C($sp)
/* 4DF98 0014DE98 5C00038E */  lw         $3, 0x5C($16)
/* 4DF9C 0014DE9C 6400028E */  lw         $2, 0x64($16)
/* 4DFA0 0014DEA0 23106200 */  subu       $2, $3, $2
/* 4DFA4 0014DEA4 00008244 */  mtc1       $2, $f0
/* 4DFA8 0014DEA8 00000000 */  nop
/* 4DFAC 0014DEAC 20038046 */  cvt.s.w    $f12, $f0
/* 4DFB0 0014DEB0 9044040C */  jal        fptodp
/* 4DFB4 0014DEB4 00000000 */   nop
/* 4DFB8 0014DEB8 288E4070 */  paddub     $17, $2, $0
/* 4DFBC 0014DEBC 6000038E */  lw         $3, 0x60($16)
/* 4DFC0 0014DEC0 6800028E */  lw         $2, 0x68($16)
/* 4DFC4 0014DEC4 23106200 */  subu       $2, $3, $2
/* 4DFC8 0014DEC8 00008244 */  mtc1       $2, $f0
/* 4DFCC 0014DECC 00000000 */  nop
/* 4DFD0 0014DED0 20038046 */  cvt.s.w    $f12, $f0
/* 4DFD4 0014DED4 9044040C */  jal        fptodp
/* 4DFD8 0014DED8 00000000 */   nop
/* 4DFDC 0014DEDC 28262072 */  paddub     $4, $17, $0
/* 4DFE0 0014DEE0 282E4070 */  paddub     $5, $2, $0
/* 4DFE4 0014DEE4 8676040C */  jal        atan2
/* 4DFE8 0014DEE8 00000000 */   nop
/* 4DFEC 0014DEEC 28264070 */  paddub     $4, $2, $0
/* 4DFF0 0014DEF0 9241040C */  jal        dptofp
/* 4DFF4 0014DEF4 00000000 */   nop
/* 4DFF8 0014DEF8 06050046 */  mov.s      $f20, $f0
/* 4DFFC 0014DEFC 6400038E */  lw         $3, 0x64($16)
/* 4E000 0014DF00 6C00028E */  lw         $2, 0x6C($16)
/* 4E004 0014DF04 23106200 */  subu       $2, $3, $2
/* 4E008 0014DF08 00008244 */  mtc1       $2, $f0
/* 4E00C 0014DF0C 00000000 */  nop
/* 4E010 0014DF10 20008046 */  cvt.s.w    $f0, $f0
/* 4E014 0014DF14 5000A0E7 */  swc1       $f0, 0x50($sp)
/* 4E018 0014DF18 680000C6 */  lwc1       $f0, 0x68($16)
/* 4E01C 0014DF1C 20008046 */  cvt.s.w    $f0, $f0
/* 4E020 0014DF20 5400A0E7 */  swc1       $f0, 0x54($sp)
/* 4E024 0014DF24 4800A427 */  addiu      $4, $sp, 0x48
/* 4E028 0014DF28 5000A527 */  addiu      $5, $sp, 0x50
/* 4E02C 0014DF2C 06A30046 */  mov.s      $f12, $f20
/* 4E030 0014DF30 5800A627 */  addiu      $6, $sp, 0x58
/* 4E034 0014DF34 A431050C */  jal        RollPos__FPfPffPf
/* 4E038 0014DF38 00000000 */   nop
/* 4E03C 0014DF3C 5800ACC7 */  lwc1       $f12, 0x58($sp)
/* 4E040 0014DF40 2C44040C */  jal        fptosi
/* 4E044 0014DF44 00000000 */   nop
/* 4E048 0014DF48 740002AE */  sw         $2, 0x74($16)
/* 4E04C 0014DF4C 5C00ACC7 */  lwc1       $f12, 0x5C($sp)
/* 4E050 0014DF50 2C44040C */  jal        fptosi
/* 4E054 0014DF54 00000000 */   nop
/* 4E058 0014DF58 780002AE */  sw         $2, 0x78($16)
/* 4E05C 0014DF5C 6400038E */  lw         $3, 0x64($16)
/* 4E060 0014DF60 6C00028E */  lw         $2, 0x6C($16)
/* 4E064 0014DF64 21106200 */  addu       $2, $3, $2
/* 4E068 0014DF68 00008244 */  mtc1       $2, $f0
/* 4E06C 0014DF6C 00000000 */  nop
/* 4E070 0014DF70 20008046 */  cvt.s.w    $f0, $f0
/* 4E074 0014DF74 6000A0E7 */  swc1       $f0, 0x60($sp)
/* 4E078 0014DF78 680000C6 */  lwc1       $f0, 0x68($16)
/* 4E07C 0014DF7C 20008046 */  cvt.s.w    $f0, $f0
/* 4E080 0014DF80 6400A0E7 */  swc1       $f0, 0x64($sp)
/* 4E084 0014DF84 4800A427 */  addiu      $4, $sp, 0x48
/* 4E088 0014DF88 6000A527 */  addiu      $5, $sp, 0x60
/* 4E08C 0014DF8C 06A30046 */  mov.s      $f12, $f20
/* 4E090 0014DF90 6800A627 */  addiu      $6, $sp, 0x68
/* 4E094 0014DF94 A431050C */  jal        RollPos__FPfPffPf
/* 4E098 0014DF98 00000000 */   nop
/* 4E09C 0014DF9C 6800ACC7 */  lwc1       $f12, 0x68($sp)
/* 4E0A0 0014DFA0 2C44040C */  jal        fptosi
/* 4E0A4 0014DFA4 00000000 */   nop
/* 4E0A8 0014DFA8 7C0002AE */  sw         $2, 0x7C($16)
/* 4E0AC 0014DFAC 6C00ACC7 */  lwc1       $f12, 0x6C($sp)
/* 4E0B0 0014DFB0 2C44040C */  jal        fptosi
/* 4E0B4 0014DFB4 00000000 */   nop
/* 4E0B8 0014DFB8 800002AE */  sw         $2, 0x80($16)
/* 4E0BC 0014DFBC 5C00038E */  lw         $3, 0x5C($16)
/* 4E0C0 0014DFC0 6400028E */  lw         $2, 0x64($16)
/* 4E0C4 0014DFC4 23106200 */  subu       $2, $3, $2
/* 4E0C8 0014DFC8 00008244 */  mtc1       $2, $f0
/* 4E0CC 0014DFCC 00000000 */  nop
/* 4E0D0 0014DFD0 20058046 */  cvt.s.w    $f20, $f0
/* 4E0D4 0014DFD4 6000038E */  lw         $3, 0x60($16)
/* 4E0D8 0014DFD8 6800028E */  lw         $2, 0x68($16)
/* 4E0DC 0014DFDC 23106200 */  subu       $2, $3, $2
/* 4E0E0 0014DFE0 00008244 */  mtc1       $2, $f0
/* 4E0E4 0014DFE4 00000000 */  nop
/* 4E0E8 0014DFE8 60058046 */  cvt.s.w    $f21, $f0
/* 4E0EC 0014DFEC 1AA01446 */  mula.s     $f20, $f20
/* 4E0F0 0014DFF0 1CAB1546 */  madd.s     $f12, $f21, $f21
/* 4E0F4 0014DFF4 9044040C */  jal        fptodp
/* 4E0F8 0014DFF8 00000000 */   nop
/* 4E0FC 0014DFFC 28264070 */  paddub     $4, $2, $0
/* 4E100 0014E000 CC76040C */  jal        sqrt
/* 4E104 0014E004 00000000 */   nop
/* 4E108 0014E008 28264070 */  paddub     $4, $2, $0
/* 4E10C 0014E00C 9241040C */  jal        dptofp
/* 4E110 0014E010 00000000 */   nop
/* 4E114 0014E014 7000028E */  lw         $2, 0x70($16)
/* 4E118 0014E018 00088244 */  mtc1       $2, $f1
/* 4E11C 0014E01C 00000000 */  nop
/* 4E120 0014E020 A0088046 */  cvt.s.w    $f2, $f1
/* 4E124 0014E024 42101446 */  mul.s      $f1, $f2, $f20
/* 4E128 0014E028 030B0046 */  div.s      $f12, $f1, $f0
/* 4E12C 0014E02C 42101546 */  mul.s      $f1, $f2, $f21
/* 4E130 0014E030 030D0046 */  div.s      $f20, $f1, $f0
/* 4E134 0014E034 2C44040C */  jal        fptosi
/* 4E138 0014E038 00000000 */   nop
/* 4E13C 0014E03C 6400038E */  lw         $3, 0x64($16)
/* 4E140 0014E040 21104300 */  addu       $2, $2, $3
/* 4E144 0014E044 840002AE */  sw         $2, 0x84($16)
/* 4E148 0014E048 06A30046 */  mov.s      $f12, $f20
/* 4E14C 0014E04C 2C44040C */  jal        fptosi
/* 4E150 0014E050 00000000 */   nop
/* 4E154 0014E054 6800038E */  lw         $3, 0x68($16)
/* 4E158 0014E058 21184300 */  addu       $3, $2, $3
/* 4E15C 0014E05C 880003AE */  sw         $3, 0x88($16)
.L0014E060:
/* 4E160 0014E060 3000BF7B */  lq         $31, 0x30($sp)
/* 4E164 0014E064 2000B17B */  lq         $17, 0x20($sp)
/* 4E168 0014E068 1000B07B */  lq         $16, 0x10($sp)
/* 4E16C 0014E06C 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 4E170 0014E070 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 4E174 0014E074 7000BD27 */  addiu      $sp, $sp, 0x70
/* 4E178 0014E078 0800E003 */  jr         $31
/* 4E17C 0014E07C 00000000 */   nop