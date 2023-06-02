.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ItemShopKey2__Fv
/* EEE70 001EED70 60FCBD27 */  addiu      $sp, $sp, -0x3A0
/* EEE74 001EED74 9000BF7F */  sq         $31, 0x90($sp)
/* EEE78 001EED78 8000BE7F */  sq         $fp, 0x80($sp)
/* EEE7C 001EED7C 7000B77F */  sq         $23, 0x70($sp)
/* EEE80 001EED80 6000B67F */  sq         $22, 0x60($sp)
/* EEE84 001EED84 5000B57F */  sq         $21, 0x50($sp)
/* EEE88 001EED88 4000B47F */  sq         $20, 0x40($sp)
/* EEE8C 001EED8C 3000B37F */  sq         $19, 0x30($sp)
/* EEE90 001EED90 2000B27F */  sq         $18, 0x20($sp)
/* EEE94 001EED94 1000B17F */  sq         $17, 0x10($sp)
/* EEE98 001EED98 0000B07F */  sq         $16, 0x0($sp)
/* EEE9C 001EED9C 28B60070 */  paddub     $22, $0, $0
/* EEEA0 001EEDA0 D901013C */  lui        $at, (0x1D90258 >> 16)
/* EEEA4 001EEDA4 58022284 */  lh         $2, (0x1D90258 & 0xFFFF)($at)
/* EEEA8 001EEDA8 0E004014 */  bnez       $2, .L001EEDE4
/* EEEAC 001EEDAC 00000000 */   nop
/* EEEB0 001EEDB0 8CFB040C */  jal        ReadBGSync__Fv
/* EEEB4 001EEDB4 00000000 */   nop
/* EEEB8 001EEDB8 83064014 */  bnez       $2, .L001F07C8
/* EEEBC 001EEDBC 00000000 */   nop
/* EEEC0 001EEDC0 349F070C */  jal        ShopTextureLoadFix__Fv
/* EEEC4 001EEDC4 00000000 */   nop
/* EEEC8 001EEDC8 D901013C */  lui        $at, (0x1D900D0 >> 16)
/* EEECC 001EEDCC D0002584 */  lh         $5, (0x1D900D0 & 0xFFFF)($at)
/* EEED0 001EEDD0 01000424 */  addiu      $4, $0, 0x1
/* EEED4 001EEDD4 E89F070C */  jal        ShopPersonReadStart__Fii
/* EEED8 001EEDD8 00000000 */   nop
/* EEEDC 001EEDDC 7A060010 */  b          .L001F07C8
/* EEEE0 001EEDE0 00000000 */   nop
.L001EEDE4:
/* EEEE4 001EEDE4 D901013C */  lui        $at, (0x1D90250 >> 16)
/* EEEE8 001EEDE8 50022484 */  lh         $4, (0x1D90250 & 0xFFFF)($at)
/* EEEEC 001EEDEC 1A00812C */  sltiu      $at, $4, 0x1A
/* EEEF0 001EEDF0 75062010 */  beqz       $at, .L001F07C8
/* EEEF4 001EEDF4 00000000 */   nop
/* EEEF8 001EEDF8 2A00023C */  lui        $2, %hi(_2794)
/* EEEFC 001EEDFC 70D34324 */  addiu      $3, $2, %lo(_2794)
/* EEF00 001EEE00 80100400 */  sll        $2, $4, 2
/* EEF04 001EEE04 21104300 */  addu       $2, $2, $3
/* EEF08 001EEE08 0000428C */  lw         $2, 0x0($2)
/* EEF0C 001EEE0C 08004000 */  jr         $2
/* EEF10 001EEE10 00000000 */   nop
/* EEF14 001EEE14 D901013C */  lui        $at, (0x1D9025E >> 16)
/* EEF18 001EEE18 5E022284 */  lh         $2, (0x1D9025E & 0xFFFF)($at)
/* EEF1C 001EEE1C 08004224 */  addiu      $2, $2, 0x8
/* EEF20 001EEE20 D901013C */  lui        $at, (0x1D9025E >> 16)
/* EEF24 001EEE24 5E0222A4 */  sh         $2, (0x1D9025E & 0xFFFF)($at)
/* EEF28 001EEE28 D901013C */  lui        $at, (0x1D9025E >> 16)
/* EEF2C 001EEE2C 5E022284 */  lh         $2, (0x1D9025E & 0xFFFF)($at)
/* EEF30 001EEE30 80004228 */  slti       $2, $2, 0x80
/* EEF34 001EEE34 04004014 */  bnez       $2, .L001EEE48
/* EEF38 001EEE38 00000000 */   nop
/* EEF3C 001EEE3C 80000224 */  addiu      $2, $0, 0x80
/* EEF40 001EEE40 D901013C */  lui        $at, (0x1D9025E >> 16)
/* EEF44 001EEE44 5E0222A4 */  sh         $2, (0x1D9025E & 0xFFFF)($at)
.L001EEE48:
/* EEF48 001EEE48 D901013C */  lui        $at, (0x1D90254 >> 16)
/* EEF4C 001EEE4C 5402228C */  lw         $2, (0x1D90254 & 0xFFFF)($at)
/* EEF50 001EEE50 15004128 */  slti       $at, $2, 0x15
/* EEF54 001EEE54 5C062014 */  bnez       $at, .L001F07C8
/* EEF58 001EEE58 00000000 */   nop
/* EEF5C 001EEE5C D901013C */  lui        $at, (0x1D90258 >> 16)
/* EEF60 001EEE60 58022284 */  lh         $2, (0x1D90258 & 0xFFFF)($at)
/* EEF64 001EEE64 58064010 */  beqz       $2, .L001F07C8
/* EEF68 001EEE68 00000000 */   nop
/* EEF6C 001EEE6C D901013C */  lui        $at, (0x1D9025E >> 16)
/* EEF70 001EEE70 5E022284 */  lh         $2, (0x1D9025E & 0xFFFF)($at)
/* EEF74 001EEE74 80004228 */  slti       $2, $2, 0x80
/* EEF78 001EEE78 53064014 */  bnez       $2, .L001F07C8
/* EEF7C 001EEE7C 00000000 */   nop
/* EEF80 001EEE80 D901013C */  lui        $at, (0x1D90250 >> 16)
/* EEF84 001EEE84 500220A4 */  sh         $0, (0x1D90250 & 0xFFFF)($at)
/* EEF88 001EEE88 4F060010 */  b          .L001F07C8
/* EEF8C 001EEE8C 00000000 */   nop
/* EEF90 001EEE90 D901013C */  lui        $at, (0x1D9025E >> 16)
/* EEF94 001EEE94 5E022284 */  lh         $2, (0x1D9025E & 0xFFFF)($at)
/* EEF98 001EEE98 F8FF4224 */  addiu      $2, $2, -0x8
/* EEF9C 001EEE9C D901013C */  lui        $at, (0x1D9025E >> 16)
/* EEFA0 001EEEA0 5E0222A4 */  sh         $2, (0x1D9025E & 0xFFFF)($at)
/* EEFA4 001EEEA4 D901013C */  lui        $at, (0x1D9025E >> 16)
/* EEFA8 001EEEA8 5E022284 */  lh         $2, (0x1D9025E & 0xFFFF)($at)
/* EEFAC 001EEEAC 0300401C */  bgtz       $2, .L001EEEBC
/* EEFB0 001EEEB0 00000000 */   nop
/* EEFB4 001EEEB4 D901013C */  lui        $at, (0x1D9025E >> 16)
/* EEFB8 001EEEB8 5E0220A4 */  sh         $0, (0x1D9025E & 0xFFFF)($at)
.L001EEEBC:
/* EEFBC 001EEEBC D901013C */  lui        $at, (0x1D90254 >> 16)
/* EEFC0 001EEEC0 5402228C */  lw         $2, (0x1D90254 & 0xFFFF)($at)
/* EEFC4 001EEEC4 1B004128 */  slti       $at, $2, 0x1B
/* EEFC8 001EEEC8 3F062014 */  bnez       $at, .L001F07C8
/* EEFCC 001EEECC 00000000 */   nop
/* EEFD0 001EEED0 D901013C */  lui        $at, (0x1D9025E >> 16)
/* EEFD4 001EEED4 5E022284 */  lh         $2, (0x1D9025E & 0xFFFF)($at)
/* EEFD8 001EEED8 3B06401C */  bgtz       $2, .L001F07C8
/* EEFDC 001EEEDC 00000000 */   nop
/* EEFE0 001EEEE0 01001624 */  addiu      $22, $0, 0x1
/* EEFE4 001EEEE4 38060010 */  b          .L001F07C8
/* EEFE8 001EEEE8 00000000 */   nop
/* EEFEC 001EEEEC CC01023C */  lui        $2, %hi(GamePad)
/* EEFF0 001EEEF0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EEFF4 001EEEF4 50000524 */  addiu      $5, $0, 0x50
/* EEFF8 001EEEF8 1CAE040C */  jal        Down__8CGamePadFi
/* EEFFC 001EEEFC 00000000 */   nop
/* EF000 001EEF00 6C004010 */  beqz       $2, .L001EF0B4
/* EF004 001EEF04 00000000 */   nop
/* EF008 001EEF08 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EF00C 001EEF0C E4003084 */  lh         $16, (0x1D900E4 & 0xFFFF)($at)
/* EF010 001EEF10 D901013C */  lui        $at, (0x1D900DC >> 16)
/* EF014 001EEF14 DC00238C */  lw         $3, (0x1D900DC & 0xFFFF)($at)
/* EF018 001EEF18 01000224 */  addiu      $2, $0, 0x1
/* EF01C 001EEF1C 24006210 */  beq        $3, $2, .L001EEFB0
/* EF020 001EEF20 00000000 */   nop
/* EF024 001EEF24 02000224 */  addiu      $2, $0, 0x2
/* EF028 001EEF28 12006210 */  beq        $3, $2, .L001EEF74
/* EF02C 001EEF2C 00000000 */   nop
/* EF030 001EEF30 03006010 */  beqz       $3, .L001EEF40
/* EF034 001EEF34 00000000 */   nop
/* EF038 001EEF38 36000010 */  b          .L001EF014
/* EF03C 001EEF3C 00000000 */   nop
.L001EEF40:
/* EF040 001EEF40 8494828F */  lw         $2, -0x6B7C($gp)
/* EF044 001EEF44 60434324 */  addiu      $3, $2, 0x4360
/* EF048 001EEF48 3C141000 */  dsll32     $2, $16, 16
/* EF04C 001EEF4C 3F140200 */  dsra32     $2, $2, 16
/* EF050 001EEF50 40100200 */  sll        $2, $2, 1
/* EF054 001EEF54 21184300 */  addu       $3, $2, $3
/* EF058 001EEF58 0E007184 */  lh         $17, 0xE($3)
/* EF05C 001EEF5C FFFF0224 */  addiu      $2, $0, -0x1
/* EF060 001EEF60 0E0062A4 */  sh         $2, 0xE($3)
/* EF064 001EEF64 DC0060A4 */  sh         $0, 0xDC($3)
/* EF068 001EEF68 9494938F */  lw         $19, -0x6B6C($gp)
/* EF06C 001EEF6C 29000010 */  b          .L001EF014
/* EF070 001EEF70 00000000 */   nop
.L001EEF74:
/* EF074 001EEF74 8494828F */  lw         $2, -0x6B7C($gp)
/* EF078 001EEF78 04054324 */  addiu      $3, $2, 0x504
/* EF07C 001EEF7C F87F6324 */  addiu      $3, $3, 0x7FF8
/* EF080 001EEF80 3C141000 */  dsll32     $2, $16, 16
/* EF084 001EEF84 3F140200 */  dsra32     $2, $2, 16
/* EF088 001EEF88 40110200 */  sll        $2, $2, 5
/* EF08C 001EEF8C 21206200 */  addu       $4, $3, $2
/* EF090 001EEF90 00009184 */  lh         $17, 0x0($4)
/* EF094 001EEF94 282E0070 */  paddub     $5, $0, $0
/* EF098 001EEF98 20000624 */  addiu      $6, $0, 0x20
/* EF09C 001EEF9C 5A0D040C */  jal        memset
/* EF0A0 001EEFA0 00000000 */   nop
/* EF0A4 001EEFA4 9C94938F */  lw         $19, -0x6B64($gp)
/* EF0A8 001EEFA8 1A000010 */  b          .L001EF014
/* EF0AC 001EEFAC 00000000 */   nop
.L001EEFB0:
/* EF0B0 001EEFB0 8494848F */  lw         $4, -0x6B7C($gp)
/* EF0B4 001EEFB4 3C2C1000 */  dsll32     $5, $16, 16
/* EF0B8 001EEFB8 3F2C0500 */  dsra32     $5, $5, 16
/* EF0BC 001EEFBC 0A000224 */  addiu      $2, $0, 0xA
/* EF0C0 001EEFC0 1A00A200 */  div        $0, $5, $2
/* EF0C4 001EEFC4 02004014 */  bnez       $2, .L001EEFD0
/* EF0C8 001EEFC8 00000000 */   nop
/* EF0CC 001EEFCC CD010000 */  break      0, 7
.L001EEFD0:
/* EF0D0 001EEFD0 12180000 */  mflo       $3
/* EF0D4 001EEFD4 A80A0224 */  addiu      $2, $0, 0xAA8
/* EF0D8 001EEFD8 18106200 */  mult       $2, $3, $2
/* EF0DC 001EEFDC 21108200 */  addu       $2, $4, $2
/* EF0E0 001EEFE0 0C454424 */  addiu      $4, $2, 0x450C
/* EF0E4 001EEFE4 0A000224 */  addiu      $2, $0, 0xA
/* EF0E8 001EEFE8 1A00A200 */  div        $0, $5, $2
/* EF0EC 001EEFEC 00000000 */  nop
/* EF0F0 001EEFF0 00000000 */  nop
/* EF0F4 001EEFF4 10180000 */  mfhi       $3
/* EF0F8 001EEFF8 40110300 */  sll        $2, $3, 5
/* EF0FC 001EEFFC 23104300 */  subu       $2, $2, $3
/* EF100 001EF000 C0100200 */  sll        $2, $2, 3
/* EF104 001EF004 21A08200 */  addu       $20, $4, $2
/* EF108 001EF008 00009186 */  lh         $17, 0x0($20)
/* EF10C 001EF00C 9894938F */  lw         $19, -0x6B68($gp)
/* EF110 001EF010 00000000 */  nop
.L001EF014:
/* EF114 001EF014 28262072 */  paddub     $4, $17, $0
/* EF118 001EF018 01000524 */  addiu      $5, $0, 0x1
/* EF11C 001EF01C B4AC070C */  jal        CalItemMoney__Fii
/* EF120 001EF020 00000000 */   nop
/* EF124 001EF024 28964070 */  paddub     $18, $2, $0
/* EF128 001EF028 0101222A */  slti       $2, $17, 0x101
/* EF12C 001EF02C 0A004014 */  bnez       $2, .L001EF058
/* EF130 001EF030 00000000 */   nop
/* EF134 001EF034 28268072 */  paddub     $4, $20, $0
/* EF138 001EF038 C4AC070C */  jal        WeaponCalMoney__FP11WEAPON_HAVEi
/* EF13C 001EF03C 00000000 */   nop
/* EF140 001EF040 21904202 */  addu       $18, $18, $2
/* EF144 001EF044 28268072 */  paddub     $4, $20, $0
/* EF148 001EF048 282E0070 */  paddub     $5, $0, $0
/* EF14C 001EF04C F8000624 */  addiu      $6, $0, 0xF8
/* EF150 001EF050 5A0D040C */  jal        memset
/* EF154 001EF054 00000000 */   nop
.L001EF058:
/* EF158 001EF058 8494858F */  lw         $5, -0x6B7C($gp)
/* EF15C 001EF05C 4643A294 */  lhu        $2, 0x4346($5)
/* EF160 001EF060 21205200 */  addu       $4, $2, $18
/* EF164 001EF064 FFFF0334 */  ori        $3, $0, 0xFFFF
/* EF168 001EF068 2A108300 */  slt        $2, $4, $3
/* EF16C 001EF06C 04004014 */  bnez       $2, .L001EF080
/* EF170 001EF070 00000000 */   nop
/* EF174 001EF074 4643A3A4 */  sh         $3, 0x4346($5)
/* EF178 001EF078 02000010 */  b          .L001EF084
/* EF17C 001EF07C 00000000 */   nop
.L001EF080:
/* EF180 001EF080 4643A4A4 */  sh         $4, 0x4346($5)
.L001EF084:
/* EF184 001EF084 3C141000 */  dsll32     $2, $16, 16
/* EF188 001EF088 3F140200 */  dsra32     $2, $2, 16
/* EF18C 001EF08C 80100200 */  sll        $2, $2, 2
/* EF190 001EF090 21106202 */  addu       $2, $19, $2
/* EF194 001EF094 000040AC */  sw         $0, 0x0($2)
/* EF198 001EF098 D901013C */  lui        $at, (0x1D90250 >> 16)
/* EF19C 001EF09C 500220A4 */  sh         $0, (0x1D90250 & 0xFFFF)($at)
/* EF1A0 001EF0A0 9A000424 */  addiu      $4, $0, 0x9A
/* EF1A4 001EF0A4 BCB3080C */  jal        ComMenuSePlay__Fi
/* EF1A8 001EF0A8 00000000 */   nop
/* EF1AC 001EF0AC C6050010 */  b          .L001F07C8
/* EF1B0 001EF0B0 00000000 */   nop
.L001EF0B4:
/* EF1B4 001EF0B4 CC01023C */  lui        $2, %hi(GamePad)
/* EF1B8 001EF0B8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EF1BC 001EF0BC 20000524 */  addiu      $5, $0, 0x20
/* EF1C0 001EF0C0 1CAE040C */  jal        Down__8CGamePadFi
/* EF1C4 001EF0C4 00000000 */   nop
/* EF1C8 001EF0C8 BF054010 */  beqz       $2, .L001F07C8
/* EF1CC 001EF0CC 00000000 */   nop
/* EF1D0 001EF0D0 D901013C */  lui        $at, (0x1D90250 >> 16)
/* EF1D4 001EF0D4 500220A4 */  sh         $0, (0x1D90250 & 0xFFFF)($at)
/* EF1D8 001EF0D8 02000424 */  addiu      $4, $0, 0x2
/* EF1DC 001EF0DC BCB3080C */  jal        ComMenuSePlay__Fi
/* EF1E0 001EF0E0 00000000 */   nop
/* EF1E4 001EF0E4 B8050010 */  b          .L001F07C8
/* EF1E8 001EF0E8 00000000 */   nop
/* EF1EC 001EF0EC DA01013C */  lui        $at, (0x1DA224C >> 16)
/* EF1F0 001EF0F0 4C22228C */  lw         $2, (0x1DA224C & 0xFFFF)($at)
/* EF1F4 001EF0F4 B4040524 */  addiu      $5, $0, 0x4B4
/* EF1F8 001EF0F8 05004510 */  beq        $2, $5, .L001EF110
/* EF1FC 001EF0FC 00000000 */   nop
/* EF200 001EF100 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* EF204 001EF104 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* EF208 001EF108 5441050C */  jal        MakeMesWin__6ClsMesFi
/* EF20C 001EF10C 00000000 */   nop
.L001EF110:
/* EF210 001EF110 CC01023C */  lui        $2, %hi(GamePad)
/* EF214 001EF114 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EF218 001EF118 50000524 */  addiu      $5, $0, 0x50
/* EF21C 001EF11C 1CAE040C */  jal        Down__8CGamePadFi
/* EF220 001EF120 00000000 */   nop
/* EF224 001EF124 D2004010 */  beqz       $2, .L001EF470
/* EF228 001EF128 00000000 */   nop
/* EF22C 001EF12C D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EF230 001EF130 E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EF234 001EF134 80110300 */  sll        $2, $3, 6
/* EF238 001EF138 23104300 */  subu       $2, $2, $3
/* EF23C 001EF13C 80180200 */  sll        $3, $2, 2
/* EF240 001EF140 A094828F */  lw         $2, -0x6B60($gp)
/* EF244 001EF144 21104300 */  addu       $2, $2, $3
/* EF248 001EF148 00005084 */  lh         $16, 0x0($2)
/* EF24C 001EF14C D901013C */  lui        $at, (0x1D90286 >> 16)
/* EF250 001EF150 86022284 */  lh         $2, (0x1D90286 & 0xFFFF)($at)
/* EF254 001EF154 1A004004 */  bltz       $2, .L001EF1C0
/* EF258 001EF158 00000000 */   nop
/* EF25C 001EF15C C4948587 */  lh         $5, -0x6B3C($gp)
/* EF260 001EF160 D901023C */  lui        $2, %hi(ShopDataMove)
/* EF264 001EF164 80024424 */  addiu      $4, $2, %lo(ShopDataMove)
/* EF268 001EF168 01000624 */  addiu      $6, $0, 0x1
/* EF26C 001EF16C 689A070C */  jal        IconAutoMove__12ShopIconMoveFii
/* EF270 001EF170 00000000 */   nop
/* EF274 001EF174 FFFF0224 */  addiu      $2, $0, -0x1
/* EF278 001EF178 D901013C */  lui        $at, (0x1D90282 >> 16)
/* EF27C 001EF17C 820222A4 */  sh         $2, (0x1D90282 & 0xFFFF)($at)
/* EF280 001EF180 D901013C */  lui        $at, (0x1D90284 >> 16)
/* EF284 001EF184 840222A4 */  sh         $2, (0x1D90284 & 0xFFFF)($at)
/* EF288 001EF188 D901013C */  lui        $at, (0x1D90286 >> 16)
/* EF28C 001EF18C 860222A4 */  sh         $2, (0x1D90286 & 0xFFFF)($at)
/* EF290 001EF190 D901013C */  lui        $at, (0x1D90290 >> 16)
/* EF294 001EF194 900222A4 */  sh         $2, (0x1D90290 & 0xFFFF)($at)
/* EF298 001EF198 D901013C */  lui        $at, (0x1D9028C >> 16)
/* EF29C 001EF19C 8C0220AC */  sw         $0, (0x1D9028C & 0xFFFF)($at)
/* EF2A0 001EF1A0 D901013C */  lui        $at, (0x1D90288 >> 16)
/* EF2A4 001EF1A4 880220AC */  sw         $0, (0x1D90288 & 0xFFFF)($at)
/* EF2A8 001EF1A8 D901023C */  lui        $2, %hi(D_1D90294)
/* EF2AC 001EF1AC 94024424 */  addiu      $4, $2, %lo(D_1D90294)
/* EF2B0 001EF1B0 282E0070 */  paddub     $5, $0, $0
/* EF2B4 001EF1B4 F8000624 */  addiu      $6, $0, 0xF8
/* EF2B8 001EF1B8 5A0D040C */  jal        memset
/* EF2BC 001EF1BC 00000000 */   nop
.L001EF1C0:
/* EF2C0 001EF1C0 28260072 */  paddub     $4, $16, $0
/* EF2C4 001EF1C4 282E0070 */  paddub     $5, $0, $0
/* EF2C8 001EF1C8 B4AC070C */  jal        CalItemMoney__Fii
/* EF2CC 001EF1CC 00000000 */   nop
/* EF2D0 001EF1D0 288E4070 */  paddub     $17, $2, $0
/* EF2D4 001EF1D4 88C7080C */  jal        WhatIsKindofItem__Fi
/* EF2D8 001EF1D8 00000000 */   nop
/* EF2DC 001EF1DC 9403A2AF */  sw         $2, 0x394($sp)
/* EF2E0 001EF1E0 28260072 */  paddub     $4, $16, $0
/* EF2E4 001EF1E4 9403A527 */  addiu      $5, $sp, 0x394
/* EF2E8 001EF1E8 70C5080C */  jal        GetBoardSpace__FiPi
/* EF2EC 001EF1EC 00000000 */   nop
/* EF2F0 001EF1F0 28964070 */  paddub     $18, $2, $0
/* EF2F4 001EF1F4 D901013C */  lui        $at, (0x1D900F0 >> 16)
/* EF2F8 001EF1F8 F000238C */  lw         $3, (0x1D900F0 & 0xFFFF)($at)
/* EF2FC 001EF1FC 80100300 */  sll        $2, $3, 2
/* EF300 001EF200 21104300 */  addu       $2, $2, $3
/* EF304 001EF204 23A04202 */  subu       $20, $18, $2
/* EF308 001EF208 9403A38F */  lw         $3, 0x394($sp)
/* EF30C 001EF20C 02000224 */  addiu      $2, $0, 0x2
/* EF310 001EF210 23006210 */  beq        $3, $2, .L001EF2A0
/* EF314 001EF214 00000000 */   nop
/* EF318 001EF218 01000224 */  addiu      $2, $0, 0x1
/* EF31C 001EF21C 11006210 */  beq        $3, $2, .L001EF264
/* EF320 001EF220 00000000 */   nop
/* EF324 001EF224 03006010 */  beqz       $3, .L001EF234
/* EF328 001EF228 00000000 */   nop
/* EF32C 001EF22C 2A000010 */  b          .L001EF2D8
/* EF330 001EF230 00000000 */   nop
.L001EF234:
/* EF334 001EF234 A094848F */  lw         $4, -0x6B60($gp)
/* EF338 001EF238 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EF33C 001EF23C E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EF340 001EF240 80110300 */  sll        $2, $3, 6
/* EF344 001EF244 23104300 */  subu       $2, $2, $3
/* EF348 001EF248 80100200 */  sll        $2, $2, 2
/* EF34C 001EF24C 21104400 */  addu       $2, $2, $4
/* EF350 001EF250 0400428C */  lw         $2, 0x4($2)
/* EF354 001EF254 A000A2AF */  sw         $2, 0xA0($sp)
/* EF358 001EF258 9494938F */  lw         $19, -0x6B6C($gp)
/* EF35C 001EF25C 1E000010 */  b          .L001EF2D8
/* EF360 001EF260 00000000 */   nop
.L001EF264:
/* EF364 001EF264 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EF368 001EF268 E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EF36C 001EF26C 80110300 */  sll        $2, $3, 6
/* EF370 001EF270 23104300 */  subu       $2, $2, $3
/* EF374 001EF274 80180200 */  sll        $3, $2, 2
/* EF378 001EF278 A094828F */  lw         $2, -0x6B60($gp)
/* EF37C 001EF27C 21104300 */  addu       $2, $2, $3
/* EF380 001EF280 A000A427 */  addiu      $4, $sp, 0xA0
/* EF384 001EF284 04004524 */  addiu      $5, $2, 0x4
/* EF388 001EF288 F8000624 */  addiu      $6, $0, 0xF8
/* EF38C 001EF28C EC0C040C */  jal        memcpy
/* EF390 001EF290 00000000 */   nop
/* EF394 001EF294 9894938F */  lw         $19, -0x6B68($gp)
/* EF398 001EF298 0F000010 */  b          .L001EF2D8
/* EF39C 001EF29C 00000000 */   nop
.L001EF2A0:
/* EF3A0 001EF2A0 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EF3A4 001EF2A4 E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EF3A8 001EF2A8 80110300 */  sll        $2, $3, 6
/* EF3AC 001EF2AC 23104300 */  subu       $2, $2, $3
/* EF3B0 001EF2B0 80180200 */  sll        $3, $2, 2
/* EF3B4 001EF2B4 A094828F */  lw         $2, -0x6B60($gp)
/* EF3B8 001EF2B8 21104300 */  addu       $2, $2, $3
/* EF3BC 001EF2BC A000A427 */  addiu      $4, $sp, 0xA0
/* EF3C0 001EF2C0 04004524 */  addiu      $5, $2, 0x4
/* EF3C4 001EF2C4 20000624 */  addiu      $6, $0, 0x20
/* EF3C8 001EF2C8 EC0C040C */  jal        memcpy
/* EF3CC 001EF2CC 00000000 */   nop
/* EF3D0 001EF2D0 9C94938F */  lw         $19, -0x6B64($gp)
/* EF3D4 001EF2D4 00000000 */  nop
.L001EF2D8:
/* EF3D8 001EF2D8 9403A28F */  lw         $2, 0x394($sp)
/* EF3DC 001EF2DC D901013C */  lui        $at, (0x1D900DC >> 16)
/* EF3E0 001EF2E0 DC0022AC */  sw         $2, (0x1D900DC & 0xFFFF)($at)
/* EF3E4 001EF2E4 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EF3E8 001EF2E8 E400248C */  lw         $4, (0x1D900E4 & 0xFFFF)($at)
/* EF3EC 001EF2EC 05000224 */  addiu      $2, $0, 0x5
/* EF3F0 001EF2F0 1A008200 */  div        $0, $4, $2
/* EF3F4 001EF2F4 02004014 */  bnez       $2, .L001EF300
/* EF3F8 001EF2F8 00000000 */   nop
/* EF3FC 001EF2FC CD010000 */  break      0, 7
.L001EF300:
/* EF400 001EF300 12180000 */  mflo       $3
/* EF404 001EF304 D901013C */  lui        $at, (0x1D90246 >> 16)
/* EF408 001EF308 46022290 */  lbu        $2, (0x1D90246 & 0xFFFF)($at)
/* EF40C 001EF30C 23286200 */  subu       $5, $3, $2
/* EF410 001EF310 05000224 */  addiu      $2, $0, 0x5
/* EF414 001EF314 1A008200 */  div        $0, $4, $2
/* EF418 001EF318 00000000 */  nop
/* EF41C 001EF31C 00000000 */  nop
/* EF420 001EF320 10180000 */  mfhi       $3
/* EF424 001EF324 80100300 */  sll        $2, $3, 2
/* EF428 001EF328 21104300 */  addu       $2, $2, $3
/* EF42C 001EF32C C0100200 */  sll        $2, $2, 3
/* EF430 001EF330 34004324 */  addiu      $3, $2, 0x34
/* EF434 001EF334 80100500 */  sll        $2, $5, 2
/* EF438 001EF338 21104500 */  addu       $2, $2, $5
/* EF43C 001EF33C C0100200 */  sll        $2, $2, 3
/* EF440 001EF340 94004224 */  addiu      $2, $2, 0x94
/* EF444 001EF344 00008344 */  mtc1       $3, $f0
/* EF448 001EF348 00000000 */  nop
/* EF44C 001EF34C 20038046 */  cvt.s.w    $f12, $f0
/* EF450 001EF350 00008244 */  mtc1       $2, $f0
/* EF454 001EF354 00000000 */  nop
/* EF458 001EF358 60038046 */  cvt.s.w    $f13, $f0
/* EF45C 001EF35C D901023C */  lui        $2, %hi(ShopDataMove)
/* EF460 001EF360 80024424 */  addiu      $4, $2, %lo(ShopDataMove)
/* EF464 001EF364 282E4072 */  paddub     $5, $18, $0
/* EF468 001EF368 28368072 */  paddub     $6, $20, $0
/* EF46C 001EF36C 283E0072 */  paddub     $7, $16, $0
/* EF470 001EF370 A000A827 */  addiu      $8, $sp, 0xA0
/* EF474 001EF374 284E0070 */  paddub     $9, $0, $0
/* EF478 001EF378 4C9A070C */  jal        IconMoveTarSet__12ShopIconMoveFiiiP13MENU_ITEMDATAffi
/* EF47C 001EF37C 00000000 */   nop
/* EF480 001EF380 04008006 */  bltz       $20, .L001EF394
/* EF484 001EF384 00000000 */   nop
/* EF488 001EF388 1400822A */  slti       $2, $20, 0x14
/* EF48C 001EF38C 1A004014 */  bnez       $2, .L001EF3F8
/* EF490 001EF390 00000000 */   nop
.L001EF394:
/* EF494 001EF394 C4948587 */  lh         $5, -0x6B3C($gp)
/* EF498 001EF398 D901023C */  lui        $2, %hi(ShopDataMove)
/* EF49C 001EF39C 80024424 */  addiu      $4, $2, %lo(ShopDataMove)
/* EF4A0 001EF3A0 01000624 */  addiu      $6, $0, 0x1
/* EF4A4 001EF3A4 689A070C */  jal        IconAutoMove__12ShopIconMoveFii
/* EF4A8 001EF3A8 00000000 */   nop
/* EF4AC 001EF3AC FFFF0224 */  addiu      $2, $0, -0x1
/* EF4B0 001EF3B0 D901013C */  lui        $at, (0x1D90282 >> 16)
/* EF4B4 001EF3B4 820222A4 */  sh         $2, (0x1D90282 & 0xFFFF)($at)
/* EF4B8 001EF3B8 D901013C */  lui        $at, (0x1D90284 >> 16)
/* EF4BC 001EF3BC 840222A4 */  sh         $2, (0x1D90284 & 0xFFFF)($at)
/* EF4C0 001EF3C0 D901013C */  lui        $at, (0x1D90286 >> 16)
/* EF4C4 001EF3C4 860222A4 */  sh         $2, (0x1D90286 & 0xFFFF)($at)
/* EF4C8 001EF3C8 D901013C */  lui        $at, (0x1D90290 >> 16)
/* EF4CC 001EF3CC 900222A4 */  sh         $2, (0x1D90290 & 0xFFFF)($at)
/* EF4D0 001EF3D0 D901013C */  lui        $at, (0x1D9028C >> 16)
/* EF4D4 001EF3D4 8C0220AC */  sw         $0, (0x1D9028C & 0xFFFF)($at)
/* EF4D8 001EF3D8 D901013C */  lui        $at, (0x1D90288 >> 16)
/* EF4DC 001EF3DC 880220AC */  sw         $0, (0x1D90288 & 0xFFFF)($at)
/* EF4E0 001EF3E0 D901023C */  lui        $2, %hi(D_1D90294)
/* EF4E4 001EF3E4 94024424 */  addiu      $4, $2, %lo(D_1D90294)
/* EF4E8 001EF3E8 282E0070 */  paddub     $5, $0, $0
/* EF4EC 001EF3EC F8000624 */  addiu      $6, $0, 0xF8
/* EF4F0 001EF3F0 5A0D040C */  jal        memset
/* EF4F4 001EF3F4 00000000 */   nop
.L001EF3F8:
/* EF4F8 001EF3F8 02000324 */  addiu      $3, $0, 0x2
/* EF4FC 001EF3FC 80101200 */  sll        $2, $18, 2
/* EF500 001EF400 21106202 */  addu       $2, $19, $2
/* EF504 001EF404 000043AC */  sw         $3, 0x0($2)
/* EF508 001EF408 B8BA080C */  jal        PersonalBoardLimmitCheck__Fv
/* EF50C 001EF40C 00000000 */   nop
/* EF510 001EF410 88AE070C */  jal        ShopSpecialFunc__Fv
/* EF514 001EF414 00000000 */   nop
/* EF518 001EF418 8494858F */  lw         $5, -0x6B7C($gp)
/* EF51C 001EF41C 4643A494 */  lhu        $4, 0x4346($5)
/* EF520 001EF420 23109100 */  subu       $2, $4, $17
/* EF524 001EF424 FFFF0334 */  ori        $3, $0, 0xFFFF
/* EF528 001EF428 2A104300 */  slt        $2, $2, $3
/* EF52C 001EF42C 04004014 */  bnez       $2, .L001EF440
/* EF530 001EF430 00000000 */   nop
/* EF534 001EF434 4643A3A4 */  sh         $3, 0x4346($5)
/* EF538 001EF438 04000010 */  b          .L001EF44C
/* EF53C 001EF43C 00000000 */   nop
.L001EF440:
/* EF540 001EF440 23101100 */  negu       $2, $17
/* EF544 001EF444 21108200 */  addu       $2, $4, $2
/* EF548 001EF448 4643A2A4 */  sh         $2, 0x4346($5)
.L001EF44C:
/* EF54C 001EF44C 28260070 */  paddub     $4, $0, $0
/* EF550 001EF450 282E0070 */  paddub     $5, $0, $0
/* EF554 001EF454 749C070C */  jal        SetItemShopTalkMode__Fii
/* EF558 001EF458 00000000 */   nop
/* EF55C 001EF45C 9A000424 */  addiu      $4, $0, 0x9A
/* EF560 001EF460 BCB3080C */  jal        ComMenuSePlay__Fi
/* EF564 001EF464 00000000 */   nop
/* EF568 001EF468 D7040010 */  b          .L001F07C8
/* EF56C 001EF46C 00000000 */   nop
.L001EF470:
/* EF570 001EF470 CC01023C */  lui        $2, %hi(GamePad)
/* EF574 001EF474 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EF578 001EF478 20000524 */  addiu      $5, $0, 0x20
/* EF57C 001EF47C 1CAE040C */  jal        Down__8CGamePadFi
/* EF580 001EF480 00000000 */   nop
/* EF584 001EF484 D0044010 */  beqz       $2, .L001F07C8
/* EF588 001EF488 00000000 */   nop
/* EF58C 001EF48C 28260070 */  paddub     $4, $0, $0
/* EF590 001EF490 282E0070 */  paddub     $5, $0, $0
/* EF594 001EF494 749C070C */  jal        SetItemShopTalkMode__Fii
/* EF598 001EF498 00000000 */   nop
/* EF59C 001EF49C 02000424 */  addiu      $4, $0, 0x2
/* EF5A0 001EF4A0 BCB3080C */  jal        ComMenuSePlay__Fi
/* EF5A4 001EF4A4 00000000 */   nop
/* EF5A8 001EF4A8 C7040010 */  b          .L001F07C8
/* EF5AC 001EF4AC 00000000 */   nop
/* EF5B0 001EF4B0 01000224 */  addiu      $2, $0, 0x1
/* EF5B4 001EF4B4 DA01013C */  lui        $at, (0x1DA51D4 >> 16)
/* EF5B8 001EF4B8 D45122AC */  sw         $2, (0x1DA51D4 & 0xFFFF)($at)
/* EF5BC 001EF4BC CC01023C */  lui        $2, %hi(GamePad)
/* EF5C0 001EF4C0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EF5C4 001EF4C4 40000524 */  addiu      $5, $0, 0x40
/* EF5C8 001EF4C8 1CAE040C */  jal        Down__8CGamePadFi
/* EF5CC 001EF4CC 00000000 */   nop
/* EF5D0 001EF4D0 0C004010 */  beqz       $2, .L001EF504
/* EF5D4 001EF4D4 00000000 */   nop
/* EF5D8 001EF4D8 28260070 */  paddub     $4, $0, $0
/* EF5DC 001EF4DC 282E0070 */  paddub     $5, $0, $0
/* EF5E0 001EF4E0 749C070C */  jal        SetItemShopTalkMode__Fii
/* EF5E4 001EF4E4 00000000 */   nop
/* EF5E8 001EF4E8 01000424 */  addiu      $4, $0, 0x1
/* EF5EC 001EF4EC BCB3080C */  jal        ComMenuSePlay__Fi
/* EF5F0 001EF4F0 00000000 */   nop
/* EF5F4 001EF4F4 DA01013C */  lui        $at, (0x1DA51D4 >> 16)
/* EF5F8 001EF4F8 D45120AC */  sw         $0, (0x1DA51D4 & 0xFFFF)($at)
/* EF5FC 001EF4FC B2040010 */  b          .L001F07C8
/* EF600 001EF500 00000000 */   nop
.L001EF504:
/* EF604 001EF504 CC01023C */  lui        $2, %hi(GamePad)
/* EF608 001EF508 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EF60C 001EF50C 20000524 */  addiu      $5, $0, 0x20
/* EF610 001EF510 1CAE040C */  jal        Down__8CGamePadFi
/* EF614 001EF514 00000000 */   nop
/* EF618 001EF518 AB044010 */  beqz       $2, .L001F07C8
/* EF61C 001EF51C 00000000 */   nop
/* EF620 001EF520 02000424 */  addiu      $4, $0, 0x2
/* EF624 001EF524 BCB3080C */  jal        ComMenuSePlay__Fi
/* EF628 001EF528 00000000 */   nop
/* EF62C 001EF52C DA01013C */  lui        $at, (0x1DA51D4 >> 16)
/* EF630 001EF530 D45120AC */  sw         $0, (0x1DA51D4 & 0xFFFF)($at)
/* EF634 001EF534 28260070 */  paddub     $4, $0, $0
/* EF638 001EF538 282E0070 */  paddub     $5, $0, $0
/* EF63C 001EF53C 749C070C */  jal        SetItemShopTalkMode__Fii
/* EF640 001EF540 00000000 */   nop
/* EF644 001EF544 E4B3070C */  jal        ShopCancelGoodReturn2__Fv
/* EF648 001EF548 00000000 */   nop
/* EF64C 001EF54C 9E040010 */  b          .L001F07C8
/* EF650 001EF550 00000000 */   nop
/* EF654 001EF554 CC01023C */  lui        $2, %hi(GamePad)
/* EF658 001EF558 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EF65C 001EF55C 60000524 */  addiu      $5, $0, 0x60
/* EF660 001EF560 1CAE040C */  jal        Down__8CGamePadFi
/* EF664 001EF564 00000000 */   nop
/* EF668 001EF568 97044010 */  beqz       $2, .L001F07C8
/* EF66C 001EF56C 00000000 */   nop
/* EF670 001EF570 D901013C */  lui        $at, (0x1D90250 >> 16)
/* EF674 001EF574 500220A4 */  sh         $0, (0x1D90250 & 0xFFFF)($at)
/* EF678 001EF578 B894828F */  lw         $2, -0x6B48($gp)
/* EF67C 001EF57C 10005084 */  lh         $16, 0x10($2)
/* EF680 001EF580 28260072 */  paddub     $4, $16, $0
/* EF684 001EF584 9803A527 */  addiu      $5, $sp, 0x398
/* EF688 001EF588 70C5080C */  jal        GetBoardSpace__FiPi
/* EF68C 001EF58C 00000000 */   nop
/* EF690 001EF590 06004104 */  bgez       $2, .L001EF5AC
/* EF694 001EF594 00000000 */   nop
/* EF698 001EF598 02000424 */  addiu      $4, $0, 0x2
/* EF69C 001EF59C BCB3080C */  jal        ComMenuSePlay__Fi
/* EF6A0 001EF5A0 00000000 */   nop
/* EF6A4 001EF5A4 88040010 */  b          .L001F07C8
/* EF6A8 001EF5A8 00000000 */   nop
.L001EF5AC:
/* EF6AC 001EF5AC 8494878F */  lw         $7, -0x6B7C($gp)
/* EF6B0 001EF5B0 6043E524 */  addiu      $5, $7, 0x4360
/* EF6B4 001EF5B4 0405E624 */  addiu      $6, $7, 0x504
/* EF6B8 001EF5B8 F87FC624 */  addiu      $6, $6, 0x7FF8
/* EF6BC 001EF5BC 9803A48F */  lw         $4, 0x398($sp)
/* EF6C0 001EF5C0 02000324 */  addiu      $3, $0, 0x2
/* EF6C4 001EF5C4 35008310 */  beq        $4, $3, .L001EF69C
/* EF6C8 001EF5C8 00000000 */   nop
/* EF6CC 001EF5CC 01000324 */  addiu      $3, $0, 0x1
/* EF6D0 001EF5D0 0D008310 */  beq        $4, $3, .L001EF608
/* EF6D4 001EF5D4 00000000 */   nop
/* EF6D8 001EF5D8 03008010 */  beqz       $4, .L001EF5E8
/* EF6DC 001EF5DC 00000000 */   nop
/* EF6E0 001EF5E0 36000010 */  b          .L001EF6BC
/* EF6E4 001EF5E4 00000000 */   nop
.L001EF5E8:
/* EF6E8 001EF5E8 40100200 */  sll        $2, $2, 1
/* EF6EC 001EF5EC 21184500 */  addu       $3, $2, $5
/* EF6F0 001EF5F0 0E0070A4 */  sh         $16, 0xE($3)
/* EF6F4 001EF5F4 B894828F */  lw         $2, -0x6B48($gp)
/* EF6F8 001EF5F8 12004284 */  lh         $2, 0x12($2)
/* EF6FC 001EF5FC DC0062A4 */  sh         $2, 0xDC($3)
/* EF700 001EF600 2E000010 */  b          .L001EF6BC
/* EF704 001EF604 00000000 */   nop
.L001EF608:
/* EF708 001EF608 0A000324 */  addiu      $3, $0, 0xA
/* EF70C 001EF60C 1A004300 */  div        $0, $2, $3
/* EF710 001EF610 02006014 */  bnez       $3, .L001EF61C
/* EF714 001EF614 00000000 */   nop
/* EF718 001EF618 CD010000 */  break      0, 7
.L001EF61C:
/* EF71C 001EF61C 12880000 */  mflo       $17
/* EF720 001EF620 0A000324 */  addiu      $3, $0, 0xA
/* EF724 001EF624 1A004300 */  div        $0, $2, $3
/* EF728 001EF628 00000000 */  nop
/* EF72C 001EF62C 00000000 */  nop
/* EF730 001EF630 10900000 */  mfhi       $18
/* EF734 001EF634 A80A0224 */  addiu      $2, $0, 0xAA8
/* EF738 001EF638 18102202 */  mult       $2, $17, $2
/* EF73C 001EF63C 2110E200 */  addu       $2, $7, $2
/* EF740 001EF640 0C454324 */  addiu      $3, $2, 0x450C
/* EF744 001EF644 40111200 */  sll        $2, $18, 5
/* EF748 001EF648 23105200 */  subu       $2, $2, $18
/* EF74C 001EF64C C0100200 */  sll        $2, $2, 3
/* EF750 001EF650 21986200 */  addu       $19, $3, $2
/* EF754 001EF654 28266072 */  paddub     $4, $19, $0
/* EF758 001EF658 BC94858F */  lw         $5, -0x6B44($gp)
/* EF75C 001EF65C F8000624 */  addiu      $6, $0, 0xF8
/* EF760 001EF660 EC0C040C */  jal        memcpy
/* EF764 001EF664 00000000 */   nop
/* EF768 001EF668 000070A6 */  sh         $16, 0x0($19)
/* EF76C 001EF66C D901013C */  lui        $at, (0x1D90234 >> 16)
/* EF770 001EF670 3402228C */  lw         $2, (0x1D90234 & 0xFFFF)($at)
/* EF774 001EF674 11004004 */  bltz       $2, .L001EF6BC
/* EF778 001EF678 00000000 */   nop
/* EF77C 001EF67C 8494828F */  lw         $2, -0x6B7C($gp)
/* EF780 001EF680 21102202 */  addu       $2, $17, $2
/* EF784 001EF684 404352A0 */  sb         $18, 0x4340($2)
/* EF788 001EF688 FFFF0224 */  addiu      $2, $0, -0x1
/* EF78C 001EF68C D901013C */  lui        $at, (0x1D90234 >> 16)
/* EF790 001EF690 340222AC */  sw         $2, (0x1D90234 & 0xFFFF)($at)
/* EF794 001EF694 09000010 */  b          .L001EF6BC
/* EF798 001EF698 00000000 */   nop
.L001EF69C:
/* EF79C 001EF69C 40110200 */  sll        $2, $2, 5
/* EF7A0 001EF6A0 2188C200 */  addu       $17, $6, $2
/* EF7A4 001EF6A4 28262072 */  paddub     $4, $17, $0
/* EF7A8 001EF6A8 C094858F */  lw         $5, -0x6B40($gp)
/* EF7AC 001EF6AC 20000624 */  addiu      $6, $0, 0x20
/* EF7B0 001EF6B0 EC0C040C */  jal        memcpy
/* EF7B4 001EF6B4 00000000 */   nop
/* EF7B8 001EF6B8 000030A6 */  sh         $16, 0x0($17)
.L001EF6BC:
/* EF7BC 001EF6BC F49B070C */  jal        InitAllHaveData__Fv
/* EF7C0 001EF6C0 00000000 */   nop
/* EF7C4 001EF6C4 02000424 */  addiu      $4, $0, 0x2
/* EF7C8 001EF6C8 BCB3080C */  jal        ComMenuSePlay__Fi
/* EF7CC 001EF6CC 00000000 */   nop
/* EF7D0 001EF6D0 3D040010 */  b          .L001F07C8
/* EF7D4 001EF6D4 00000000 */   nop
/* EF7D8 001EF6D8 CC01023C */  lui        $2, %hi(GamePad)
/* EF7DC 001EF6DC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EF7E0 001EF6E0 60F00534 */  ori        $5, $0, 0xF060
/* EF7E4 001EF6E4 1CAE040C */  jal        Down__8CGamePadFi
/* EF7E8 001EF6E8 00000000 */   nop
/* EF7EC 001EF6EC 36044010 */  beqz       $2, .L001F07C8
/* EF7F0 001EF6F0 00000000 */   nop
/* EF7F4 001EF6F4 D901013C */  lui        $at, (0x1D90250 >> 16)
/* EF7F8 001EF6F8 500220A4 */  sh         $0, (0x1D90250 & 0xFFFF)($at)
/* EF7FC 001EF6FC DA01013C */  lui        $at, (0x1DA51D4 >> 16)
/* EF800 001EF700 D45120AC */  sw         $0, (0x1DA51D4 & 0xFFFF)($at)
/* EF804 001EF704 30040010 */  b          .L001F07C8
/* EF808 001EF708 00000000 */   nop
/* EF80C 001EF70C 01000224 */  addiu      $2, $0, 0x1
/* EF810 001EF710 DA01013C */  lui        $at, (0x1DA51D4 >> 16)
/* EF814 001EF714 D45122AC */  sw         $2, (0x1DA51D4 & 0xFFFF)($at)
/* EF818 001EF718 CC01023C */  lui        $2, %hi(GamePad)
/* EF81C 001EF71C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EF820 001EF720 60000524 */  addiu      $5, $0, 0x60
/* EF824 001EF724 1CAE040C */  jal        Down__8CGamePadFi
/* EF828 001EF728 00000000 */   nop
/* EF82C 001EF72C 26044010 */  beqz       $2, .L001F07C8
/* EF830 001EF730 00000000 */   nop
/* EF834 001EF734 02000424 */  addiu      $4, $0, 0x2
/* EF838 001EF738 BCB3080C */  jal        ComMenuSePlay__Fi
/* EF83C 001EF73C 00000000 */   nop
/* EF840 001EF740 28260070 */  paddub     $4, $0, $0
/* EF844 001EF744 282E0070 */  paddub     $5, $0, $0
/* EF848 001EF748 749C070C */  jal        SetItemShopTalkMode__Fii
/* EF84C 001EF74C 00000000 */   nop
/* EF850 001EF750 DA01013C */  lui        $at, (0x1DA51D4 >> 16)
/* EF854 001EF754 D45120AC */  sw         $0, (0x1DA51D4 & 0xFFFF)($at)
/* EF858 001EF758 1B040010 */  b          .L001F07C8
/* EF85C 001EF75C 00000000 */   nop
/* EF860 001EF760 01000224 */  addiu      $2, $0, 0x1
/* EF864 001EF764 DA01013C */  lui        $at, (0x1DA51D4 >> 16)
/* EF868 001EF768 D45122AC */  sw         $2, (0x1DA51D4 & 0xFFFF)($at)
/* EF86C 001EF76C CC01023C */  lui        $2, %hi(GamePad)
/* EF870 001EF770 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EF874 001EF774 60000524 */  addiu      $5, $0, 0x60
/* EF878 001EF778 1CAE040C */  jal        Down__8CGamePadFi
/* EF87C 001EF77C 00000000 */   nop
/* EF880 001EF780 11044010 */  beqz       $2, .L001F07C8
/* EF884 001EF784 00000000 */   nop
/* EF888 001EF788 02000424 */  addiu      $4, $0, 0x2
/* EF88C 001EF78C D901013C */  lui        $at, (0x1D90250 >> 16)
/* EF890 001EF790 500224A4 */  sh         $4, (0x1D90250 & 0xFFFF)($at)
/* EF894 001EF794 D901013C */  lui        $at, (0x1D90254 >> 16)
/* EF898 001EF798 540220AC */  sw         $0, (0x1D90254 & 0xFFFF)($at)
/* EF89C 001EF79C DA01013C */  lui        $at, (0x1DA51D4 >> 16)
/* EF8A0 001EF7A0 D45120AC */  sw         $0, (0x1DA51D4 & 0xFFFF)($at)
/* EF8A4 001EF7A4 BCB3080C */  jal        ComMenuSePlay__Fi
/* EF8A8 001EF7A8 00000000 */   nop
/* EF8AC 001EF7AC 06040010 */  b          .L001F07C8
/* EF8B0 001EF7B0 00000000 */   nop
/* EF8B4 001EF7B4 01000224 */  addiu      $2, $0, 0x1
/* EF8B8 001EF7B8 DA01013C */  lui        $at, (0x1DA51D4 >> 16)
/* EF8BC 001EF7BC D45122AC */  sw         $2, (0x1DA51D4 & 0xFFFF)($at)
/* EF8C0 001EF7C0 CC01023C */  lui        $2, %hi(GamePad)
/* EF8C4 001EF7C4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EF8C8 001EF7C8 40000524 */  addiu      $5, $0, 0x40
/* EF8CC 001EF7CC 1CAE040C */  jal        Down__8CGamePadFi
/* EF8D0 001EF7D0 00000000 */   nop
/* EF8D4 001EF7D4 0C004010 */  beqz       $2, .L001EF808
/* EF8D8 001EF7D8 00000000 */   nop
/* EF8DC 001EF7DC 28260070 */  paddub     $4, $0, $0
/* EF8E0 001EF7E0 282E0070 */  paddub     $5, $0, $0
/* EF8E4 001EF7E4 749C070C */  jal        SetItemShopTalkMode__Fii
/* EF8E8 001EF7E8 00000000 */   nop
/* EF8EC 001EF7EC DA01013C */  lui        $at, (0x1DA51D4 >> 16)
/* EF8F0 001EF7F0 D45120AC */  sw         $0, (0x1DA51D4 & 0xFFFF)($at)
/* EF8F4 001EF7F4 01000424 */  addiu      $4, $0, 0x1
/* EF8F8 001EF7F8 BCB3080C */  jal        ComMenuSePlay__Fi
/* EF8FC 001EF7FC 00000000 */   nop
/* EF900 001EF800 F1030010 */  b          .L001F07C8
/* EF904 001EF804 00000000 */   nop
.L001EF808:
/* EF908 001EF808 CC01023C */  lui        $2, %hi(GamePad)
/* EF90C 001EF80C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EF910 001EF810 20000524 */  addiu      $5, $0, 0x20
/* EF914 001EF814 1CAE040C */  jal        Down__8CGamePadFi
/* EF918 001EF818 00000000 */   nop
/* EF91C 001EF81C EA034010 */  beqz       $2, .L001F07C8
/* EF920 001EF820 00000000 */   nop
/* EF924 001EF824 19000424 */  addiu      $4, $0, 0x19
/* EF928 001EF828 01000524 */  addiu      $5, $0, 0x1
/* EF92C 001EF82C 749C070C */  jal        SetItemShopTalkMode__Fii
/* EF930 001EF830 00000000 */   nop
/* EF934 001EF834 DA01013C */  lui        $at, (0x1DA51D4 >> 16)
/* EF938 001EF838 D45120AC */  sw         $0, (0x1DA51D4 & 0xFFFF)($at)
/* EF93C 001EF83C 2826A070 */  paddub     $4, $5, $0
/* EF940 001EF840 BCB3080C */  jal        ComMenuSePlay__Fi
/* EF944 001EF844 00000000 */   nop
/* EF948 001EF848 DF030010 */  b          .L001F07C8
/* EF94C 001EF84C 00000000 */   nop
/* EF950 001EF850 CC01023C */  lui        $2, %hi(GamePad)
/* EF954 001EF854 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EF958 001EF858 40000524 */  addiu      $5, $0, 0x40
/* EF95C 001EF85C 1CAE040C */  jal        Down__8CGamePadFi
/* EF960 001EF860 00000000 */   nop
/* EF964 001EF864 0C004010 */  beqz       $2, .L001EF898
/* EF968 001EF868 00000000 */   nop
/* EF96C 001EF86C 14000424 */  addiu      $4, $0, 0x14
/* EF970 001EF870 01000524 */  addiu      $5, $0, 0x1
/* EF974 001EF874 749C070C */  jal        SetItemShopTalkMode__Fii
/* EF978 001EF878 00000000 */   nop
/* EF97C 001EF87C 80AD070C */  jal        IncludeBuyItem2__Fv
/* EF980 001EF880 00000000 */   nop
/* EF984 001EF884 9A000424 */  addiu      $4, $0, 0x9A
/* EF988 001EF888 BCB3080C */  jal        ComMenuSePlay__Fi
/* EF98C 001EF88C 00000000 */   nop
/* EF990 001EF890 CD030010 */  b          .L001F07C8
/* EF994 001EF894 00000000 */   nop
.L001EF898:
/* EF998 001EF898 CC01023C */  lui        $2, %hi(GamePad)
/* EF99C 001EF89C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EF9A0 001EF8A0 20000524 */  addiu      $5, $0, 0x20
/* EF9A4 001EF8A4 1CAE040C */  jal        Down__8CGamePadFi
/* EF9A8 001EF8A8 00000000 */   nop
/* EF9AC 001EF8AC C6034010 */  beqz       $2, .L001F07C8
/* EF9B0 001EF8B0 00000000 */   nop
/* EF9B4 001EF8B4 28260070 */  paddub     $4, $0, $0
/* EF9B8 001EF8B8 282E0070 */  paddub     $5, $0, $0
/* EF9BC 001EF8BC 749C070C */  jal        SetItemShopTalkMode__Fii
/* EF9C0 001EF8C0 00000000 */   nop
/* EF9C4 001EF8C4 02000424 */  addiu      $4, $0, 0x2
/* EF9C8 001EF8C8 BCB3080C */  jal        ComMenuSePlay__Fi
/* EF9CC 001EF8CC 00000000 */   nop
/* EF9D0 001EF8D0 BD030010 */  b          .L001F07C8
/* EF9D4 001EF8D4 00000000 */   nop
/* EF9D8 001EF8D8 D901013C */  lui        $at, (0x1D90264 >> 16)
/* EF9DC 001EF8DC 64022284 */  lh         $2, (0x1D90264 & 0xFFFF)($at)
/* EF9E0 001EF8E0 08004014 */  bnez       $2, .L001EF904
/* EF9E4 001EF8E4 00000000 */   nop
/* EF9E8 001EF8E8 D901013C */  lui        $at, (0x1D900D0 >> 16)
/* EF9EC 001EF8EC D0002584 */  lh         $5, (0x1D900D0 & 0xFFFF)($at)
/* EF9F0 001EF8F0 01000424 */  addiu      $4, $0, 0x1
/* EF9F4 001EF8F4 10A0070C */  jal        ShopPersonBuild__Fii
/* EF9F8 001EF8F8 00000000 */   nop
/* EF9FC 001EF8FC D901013C */  lui        $at, (0x1D90264 >> 16)
/* EFA00 001EF900 640222A4 */  sh         $2, (0x1D90264 & 0xFFFF)($at)
.L001EF904:
/* EFA04 001EF904 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EFA08 001EF908 E4003E8C */  lw         $fp, (0x1D900E4 & 0xFFFF)($at)
/* EFA0C 001EF90C D901013C */  lui        $at, (0x1D900DC >> 16)
/* EFA10 001EF910 DC00378C */  lw         $23, (0x1D900DC & 0xFFFF)($at)
/* EFA14 001EF914 D901013C */  lui        $at, (0x1D900D2 >> 16)
/* EFA18 001EF918 D2002384 */  lh         $3, (0x1D900D2 & 0xFFFF)($at)
/* EFA1C 001EF91C 01000224 */  addiu      $2, $0, 0x1
/* EFA20 001EF920 10006210 */  beq        $3, $2, .L001EF964
/* EFA24 001EF924 00000000 */   nop
/* EFA28 001EF928 0A006010 */  beqz       $3, .L001EF954
/* EFA2C 001EF92C 00000000 */   nop
/* EFA30 001EF930 02000224 */  addiu      $2, $0, 0x2
/* EFA34 001EF934 03006210 */  beq        $3, $2, .L001EF944
/* EFA38 001EF938 00000000 */   nop
/* EFA3C 001EF93C 80010010 */  b          .L001EFF40
/* EFA40 001EF940 00000000 */   nop
.L001EF944:
/* EFA44 001EF944 5CB0070C */  jal        CheckSideKey2__Fv
/* EFA48 001EF948 00000000 */   nop
/* EFA4C 001EF94C 7C010010 */  b          .L001EFF40
/* EFA50 001EF950 00000000 */   nop
.L001EF954:
/* EFA54 001EF954 A0B8070C */  jal        ItemShopSelectKey2__Fv
/* EFA58 001EF958 00000000 */   nop
/* EFA5C 001EF95C 78010010 */  b          .L001EFF40
/* EFA60 001EF960 00000000 */   nop
.L001EF964:
/* EFA64 001EF964 D8BB080C */  jal        PersonalBoardKey__Fv
/* EFA68 001EF968 00000000 */   nop
/* EFA6C 001EF96C 28864070 */  paddub     $16, $2, $0
/* EFA70 001EF970 73000016 */  bnez       $16, .L001EFB40
/* EFA74 001EF974 00000000 */   nop
/* EFA78 001EF978 CC01023C */  lui        $2, %hi(GamePad)
/* EFA7C 001EF97C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EFA80 001EF980 40000524 */  addiu      $5, $0, 0x40
/* EFA84 001EF984 1CAE040C */  jal        Down__8CGamePadFi
/* EFA88 001EF988 00000000 */   nop
/* EFA8C 001EF98C 6C004010 */  beqz       $2, .L001EFB40
/* EFA90 001EF990 00000000 */   nop
/* EFA94 001EF994 D901023C */  lui        $2, %hi(D_1D900D8)
/* EFA98 001EF998 D8005124 */  addiu      $17, $2, %lo(D_1D900D8)
/* EFA9C 001EF99C B894858F */  lw         $5, -0x6B48($gp)
/* EFAA0 001EF9A0 0000B48C */  lw         $20, 0x0($5)
/* EFAA4 001EF9A4 0800228E */  lw         $2, 0x8($17)
/* EFAA8 001EF9A8 01000324 */  addiu      $3, $0, 0x1
/* EFAAC 001EF9AC 1B004310 */  beq        $2, $3, .L001EFA1C
/* EFAB0 001EF9B0 00000000 */   nop
/* EFAB4 001EF9B4 02000424 */  addiu      $4, $0, 0x2
/* EFAB8 001EF9B8 03004410 */  beq        $2, $4, .L001EF9C8
/* EFABC 001EF9BC 00000000 */   nop
/* EFAC0 001EF9C0 48010010 */  b          .L001EFEE4
/* EFAC4 001EF9C4 00000000 */   nop
.L001EF9C8:
/* EFAC8 001EF9C8 BCB3080C */  jal        ComMenuSePlay__Fi
/* EFACC 001EF9CC 00000000 */   nop
/* EFAD0 001EF9D0 B894828F */  lw         $2, -0x6B48($gp)
/* EFAD4 001EF9D4 10004484 */  lh         $4, 0x10($2)
/* EFAD8 001EF9D8 51008228 */  slti       $2, $4, 0x51
/* EFADC 001EF9DC 41014014 */  bnez       $2, .L001EFEE4
/* EFAE0 001EF9E0 00000000 */   nop
/* EFAE4 001EF9E4 01000224 */  addiu      $2, $0, 0x1
/* EFAE8 001EF9E8 3E018212 */  beq        $20, $2, .L001EFEE4
/* EFAEC 001EF9EC 00000000 */   nop
/* EFAF0 001EF9F0 68C4080C */  jal        IsEnableTrushThrow__Fi
/* EFAF4 001EF9F4 00000000 */   nop
/* EFAF8 001EF9F8 3A014010 */  beqz       $2, .L001EFEE4
/* EFAFC 001EF9FC 00000000 */   nop
/* EFB00 001EFA00 01000224 */  addiu      $2, $0, 0x1
/* EFB04 001EFA04 1C0022A6 */  sh         $2, 0x1C($17)
/* EFB08 001EFA08 200020AE */  sw         $0, 0x20($17)
/* EFB0C 001EFA0C B894828F */  lw         $2, -0x6B48($gp)
/* EFB10 001EFA10 100040A4 */  sh         $0, 0x10($2)
/* EFB14 001EFA14 33010010 */  b          .L001EFEE4
/* EFB18 001EFA18 00000000 */   nop
.L001EFA1C:
/* EFB1C 001EFA1C D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EFB20 001EFA20 E400318C */  lw         $17, (0x1D900E4 & 0xFFFF)($at)
/* EFB24 001EFA24 D901013C */  lui        $at, (0x1D900DC >> 16)
/* EFB28 001EFA28 DC00248C */  lw         $4, (0x1D900DC & 0xFFFF)($at)
/* EFB2C 001EFA2C 02000224 */  addiu      $2, $0, 0x2
/* EFB30 001EFA30 0D008210 */  beq        $4, $2, .L001EFA68
/* EFB34 001EFA34 00000000 */   nop
/* EFB38 001EFA38 08008310 */  beq        $4, $3, .L001EFA5C
/* EFB3C 001EFA3C 00000000 */   nop
/* EFB40 001EFA40 03008010 */  beqz       $4, .L001EFA50
/* EFB44 001EFA44 00000000 */   nop
/* EFB48 001EFA48 09000010 */  b          .L001EFA70
/* EFB4C 001EFA4C 00000000 */   nop
.L001EFA50:
/* EFB50 001EFA50 9494928F */  lw         $18, -0x6B6C($gp)
/* EFB54 001EFA54 06000010 */  b          .L001EFA70
/* EFB58 001EFA58 00000000 */   nop
.L001EFA5C:
/* EFB5C 001EFA5C 9894928F */  lw         $18, -0x6B68($gp)
/* EFB60 001EFA60 03000010 */  b          .L001EFA70
/* EFB64 001EFA64 00000000 */   nop
.L001EFA68:
/* EFB68 001EFA68 9C94928F */  lw         $18, -0x6B64($gp)
/* EFB6C 001EFA6C 00000000 */  nop
.L001EFA70:
/* EFB70 001EFA70 80101100 */  sll        $2, $17, 2
/* EFB74 001EFA74 21A84202 */  addu       $21, $18, $2
/* EFB78 001EFA78 0000B28E */  lw         $18, 0x0($21)
/* EFB7C 001EFA7C 01000224 */  addiu      $2, $0, 0x1
/* EFB80 001EFA80 0F008214 */  bne        $4, $2, .L001EFAC0
/* EFB84 001EFA84 00000000 */   nop
/* EFB88 001EFA88 0D008216 */  bne        $20, $2, .L001EFAC0
/* EFB8C 001EFA8C 00000000 */   nop
/* EFB90 001EFA90 1000A384 */  lh         $3, 0x10($5)
/* EFB94 001EFA94 B1000224 */  addiu      $2, $0, 0xB1
/* EFB98 001EFA98 04006210 */  beq        $3, $2, .L001EFAAC
/* EFB9C 001EFA9C 00000000 */   nop
/* EFBA0 001EFAA0 B2000224 */  addiu      $2, $0, 0xB2
/* EFBA4 001EFAA4 06006214 */  bne        $3, $2, .L001EFAC0
/* EFBA8 001EFAA8 00000000 */   nop
.L001EFAAC:
/* EFBAC 001EFAAC 02000424 */  addiu      $4, $0, 0x2
/* EFBB0 001EFAB0 BCB3080C */  jal        ComMenuSePlay__Fi
/* EFBB4 001EFAB4 00000000 */   nop
/* EFBB8 001EFAB8 0A010010 */  b          .L001EFEE4
/* EFBBC 001EFABC 00000000 */   nop
.L001EFAC0:
/* EFBC0 001EFAC0 28262072 */  paddub     $4, $17, $0
/* EFBC4 001EFAC4 34BD080C */  jal        PersonalBoardItemGetorSwap__Fi
/* EFBC8 001EFAC8 00000000 */   nop
/* EFBCC 001EFACC 01000324 */  addiu      $3, $0, 0x1
/* EFBD0 001EFAD0 06004310 */  beq        $2, $3, .L001EFAEC
/* EFBD4 001EFAD4 00000000 */   nop
/* EFBD8 001EFAD8 02000424 */  addiu      $4, $0, 0x2
/* EFBDC 001EFADC BCB3080C */  jal        ComMenuSePlay__Fi
/* EFBE0 001EFAE0 00000000 */   nop
/* EFBE4 001EFAE4 FF000010 */  b          .L001EFEE4
/* EFBE8 001EFAE8 00000000 */   nop
.L001EFAEC:
/* EFBEC 001EFAEC B894828F */  lw         $2, -0x6B48($gp)
/* EFBF0 001EFAF0 000052AC */  sw         $18, 0x0($2)
/* EFBF4 001EFAF4 0000B4AE */  sw         $20, 0x0($21)
/* EFBF8 001EFAF8 B894838F */  lw         $3, -0x6B48($gp)
/* EFBFC 001EFAFC 10006284 */  lh         $2, 0x10($3)
/* EFC00 001EFB00 51004128 */  slti       $at, $2, 0x51
/* EFC04 001EFB04 08002010 */  beqz       $at, .L001EFB28
/* EFC08 001EFB08 00000000 */   nop
/* EFC0C 001EFB0C F49B070C */  jal        InitAllHaveData__Fv
/* EFC10 001EFB10 00000000 */   nop
/* EFC14 001EFB14 FFFF0224 */  addiu      $2, $0, -0x1
/* EFC18 001EFB18 D901013C */  lui        $at, (0x1D90234 >> 16)
/* EFC1C 001EFB1C 340222AC */  sw         $2, (0x1D90234 & 0xFFFF)($at)
/* EFC20 001EFB20 02000010 */  b          .L001EFB2C
/* EFC24 001EFB24 00000000 */   nop
.L001EFB28:
/* EFC28 001EFB28 080071AC */  sw         $17, 0x8($3)
.L001EFB2C:
/* EFC2C 001EFB2C 01000424 */  addiu      $4, $0, 0x1
/* EFC30 001EFB30 BCB3080C */  jal        ComMenuSePlay__Fi
/* EFC34 001EFB34 00000000 */   nop
/* EFC38 001EFB38 EA000010 */  b          .L001EFEE4
/* EFC3C 001EFB3C 00000000 */   nop
.L001EFB40:
/* EFC40 001EFB40 E8000016 */  bnez       $16, .L001EFEE4
/* EFC44 001EFB44 00000000 */   nop
/* EFC48 001EFB48 CC01023C */  lui        $2, %hi(GamePad)
/* EFC4C 001EFB4C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* EFC50 001EFB50 10000524 */  addiu      $5, $0, 0x10
/* EFC54 001EFB54 1CAE040C */  jal        Down__8CGamePadFi
/* EFC58 001EFB58 00000000 */   nop
/* EFC5C 001EFB5C E1004010 */  beqz       $2, .L001EFEE4
/* EFC60 001EFB60 00000000 */   nop
/* EFC64 001EFB64 01000224 */  addiu      $2, $0, 0x1
/* EFC68 001EFB68 D901013C */  lui        $at, (0x1D900D6 >> 16)
/* EFC6C 001EFB6C D60022A4 */  sh         $2, (0x1D900D6 & 0xFFFF)($at)
/* EFC70 001EFB70 B894828F */  lw         $2, -0x6B48($gp)
/* EFC74 001EFB74 10004284 */  lh         $2, 0x10($2)
/* EFC78 001EFB78 51004228 */  slti       $2, $2, 0x51
/* EFC7C 001EFB7C 07004014 */  bnez       $2, .L001EFB9C
/* EFC80 001EFB80 00000000 */   nop
/* EFC84 001EFB84 02000424 */  addiu      $4, $0, 0x2
/* EFC88 001EFB88 BCB3080C */  jal        ComMenuSePlay__Fi
/* EFC8C 001EFB8C 00000000 */   nop
/* EFC90 001EFB90 28160070 */  paddub     $2, $0, $0
/* EFC94 001EFB94 0D030010 */  b          .L001F07CC
/* EFC98 001EFB98 00000000 */   nop
.L001EFB9C:
/* EFC9C 001EFB9C D901013C */  lui        $at, (0x1D900DC >> 16)
/* EFCA0 001EFBA0 DC00248C */  lw         $4, (0x1D900DC & 0xFFFF)($at)
/* EFCA4 001EFBA4 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EFCA8 001EFBA8 E400258C */  lw         $5, (0x1D900E4 & 0xFFFF)($at)
/* EFCAC 001EFBAC 38C5080C */  jal        SearchBoardNowPosItemExist__Fii
/* EFCB0 001EFBB0 00000000 */   nop
/* EFCB4 001EFBB4 288E4070 */  paddub     $17, $2, $0
/* EFCB8 001EFBB8 D901013C */  lui        $at, (0x1D900DC >> 16)
/* EFCBC 001EFBBC DC00238C */  lw         $3, (0x1D900DC & 0xFFFF)($at)
/* EFCC0 001EFBC0 01000224 */  addiu      $2, $0, 0x1
/* EFCC4 001EFBC4 16006210 */  beq        $3, $2, .L001EFC20
/* EFCC8 001EFBC8 00000000 */   nop
/* EFCCC 001EFBCC 02000224 */  addiu      $2, $0, 0x2
/* EFCD0 001EFBD0 0C006210 */  beq        $3, $2, .L001EFC04
/* EFCD4 001EFBD4 00000000 */   nop
/* EFCD8 001EFBD8 03006010 */  beqz       $3, .L001EFBE8
/* EFCDC 001EFBDC 00000000 */   nop
/* EFCE0 001EFBE0 14000010 */  b          .L001EFC34
/* EFCE4 001EFBE4 00000000 */   nop
.L001EFBE8:
/* EFCE8 001EFBE8 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EFCEC 001EFBEC E400228C */  lw         $2, (0x1D900E4 & 0xFFFF)($at)
/* EFCF0 001EFBF0 80180200 */  sll        $3, $2, 2
/* EFCF4 001EFBF4 9494828F */  lw         $2, -0x6B6C($gp)
/* EFCF8 001EFBF8 21904300 */  addu       $18, $2, $3
/* EFCFC 001EFBFC 0D000010 */  b          .L001EFC34
/* EFD00 001EFC00 00000000 */   nop
.L001EFC04:
/* EFD04 001EFC04 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EFD08 001EFC08 E400228C */  lw         $2, (0x1D900E4 & 0xFFFF)($at)
/* EFD0C 001EFC0C 80180200 */  sll        $3, $2, 2
/* EFD10 001EFC10 9C94828F */  lw         $2, -0x6B64($gp)
/* EFD14 001EFC14 21904300 */  addu       $18, $2, $3
/* EFD18 001EFC18 06000010 */  b          .L001EFC34
/* EFD1C 001EFC1C 00000000 */   nop
.L001EFC20:
/* EFD20 001EFC20 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EFD24 001EFC24 E400228C */  lw         $2, (0x1D900E4 & 0xFFFF)($at)
/* EFD28 001EFC28 80180200 */  sll        $3, $2, 2
/* EFD2C 001EFC2C 9894828F */  lw         $2, -0x6B68($gp)
/* EFD30 001EFC30 21904300 */  addu       $18, $2, $3
.L001EFC34:
/* EFD34 001EFC34 0000438E */  lw         $3, 0x0($18)
/* EFD38 001EFC38 01000224 */  addiu      $2, $0, 0x1
/* EFD3C 001EFC3C 06006214 */  bne        $3, $2, .L001EFC58
/* EFD40 001EFC40 00000000 */   nop
/* EFD44 001EFC44 02000424 */  addiu      $4, $0, 0x2
/* EFD48 001EFC48 BCB3080C */  jal        ComMenuSePlay__Fi
/* EFD4C 001EFC4C 00000000 */   nop
/* EFD50 001EFC50 A4000010 */  b          .L001EFEE4
/* EFD54 001EFC54 00000000 */   nop
.L001EFC58:
/* EFD58 001EFC58 28262072 */  paddub     $4, $17, $0
/* EFD5C 001EFC5C 109E070C */  jal        IsEnableCharge__Fi
/* EFD60 001EFC60 00000000 */   nop
/* EFD64 001EFC64 28964070 */  paddub     $18, $2, $0
/* EFD68 001EFC68 54004012 */  beqz       $18, .L001EFDBC
/* EFD6C 001EFC6C 00000000 */   nop
/* EFD70 001EFC70 0201212A */  slti       $at, $17, 0x102
/* EFD74 001EFC74 17002010 */  beqz       $at, .L001EFCD4
/* EFD78 001EFC78 00000000 */   nop
/* EFD7C 001EFC7C 8400222A */  slti       $2, $17, 0x84
/* EFD80 001EFC80 14004014 */  bnez       $2, .L001EFCD4
/* EFD84 001EFC84 00000000 */   nop
/* EFD88 001EFC88 28262072 */  paddub     $4, $17, $0
/* EFD8C 001EFC8C A043070C */  jal        GetItemData__Fi
/* EFD90 001EFC90 00000000 */   nop
/* EFD94 001EFC94 0F004010 */  beqz       $2, .L001EFCD4
/* EFD98 001EFC98 00000000 */   nop
/* EFD9C 001EFC9C 08004284 */  lh         $2, 0x8($2)
/* EFDA0 001EFCA0 10004230 */  andi       $2, $2, 0x10
/* EFDA4 001EFCA4 06004014 */  bnez       $2, .L001EFCC0
/* EFDA8 001EFCA8 00000000 */   nop
/* EFDAC 001EFCAC B894828F */  lw         $2, -0x6B48($gp)
/* EFDB0 001EFCB0 10004384 */  lh         $3, 0x10($2)
/* EFDB4 001EFCB4 B9000224 */  addiu      $2, $0, 0xB9
/* EFDB8 001EFCB8 06006214 */  bne        $3, $2, .L001EFCD4
/* EFDBC 001EFCBC 00000000 */   nop
.L001EFCC0:
/* EFDC0 001EFCC0 28960070 */  paddub     $18, $0, $0
/* EFDC4 001EFCC4 04000424 */  addiu      $4, $0, 0x4
/* EFDC8 001EFCC8 01000524 */  addiu      $5, $0, 0x1
/* EFDCC 001EFCCC 749C070C */  jal        SetItemShopTalkMode__Fii
/* EFDD0 001EFCD0 00000000 */   nop
.L001EFCD4:
/* EFDD4 001EFCD4 0101222A */  slti       $2, $17, 0x101
/* EFDD8 001EFCD8 3C004014 */  bnez       $2, .L001EFDCC
/* EFDDC 001EFCDC 00000000 */   nop
/* EFDE0 001EFCE0 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EFDE4 001EFCE4 E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EFDE8 001EFCE8 0A000224 */  addiu      $2, $0, 0xA
/* EFDEC 001EFCEC 1A006200 */  div        $0, $3, $2
/* EFDF0 001EFCF0 02004014 */  bnez       $2, .L001EFCFC
/* EFDF4 001EFCF4 00000000 */   nop
/* EFDF8 001EFCF8 CD010000 */  break      0, 7
.L001EFCFC:
/* EFDFC 001EFCFC 12A00000 */  mflo       $20
/* EFE00 001EFD00 28262072 */  paddub     $4, $17, $0
/* EFE04 001EFD04 70CF070C */  jal        IsDefaultWeapon__Fi
/* EFE08 001EFD08 00000000 */   nop
/* EFE0C 001EFD0C 06008216 */  bne        $20, $2, .L001EFD28
/* EFE10 001EFD10 00000000 */   nop
/* EFE14 001EFD14 04000424 */  addiu      $4, $0, 0x4
/* EFE18 001EFD18 01000524 */  addiu      $5, $0, 0x1
/* EFE1C 001EFD1C 749C070C */  jal        SetItemShopTalkMode__Fii
/* EFE20 001EFD20 00000000 */   nop
/* EFE24 001EFD24 28960070 */  paddub     $18, $0, $0
.L001EFD28:
/* EFE28 001EFD28 0C010224 */  addiu      $2, $0, 0x10C
/* EFE2C 001EFD2C 0A002216 */  bne        $17, $2, .L001EFD58
/* EFE30 001EFD30 00000000 */   nop
/* EFE34 001EFD34 E02F080C */  jal        GetMenuHebikiriFlag__Fv
/* EFE38 001EFD38 00000000 */   nop
/* EFE3C 001EFD3C 06004014 */  bnez       $2, .L001EFD58
/* EFE40 001EFD40 00000000 */   nop
/* EFE44 001EFD44 04000424 */  addiu      $4, $0, 0x4
/* EFE48 001EFD48 01000524 */  addiu      $5, $0, 0x1
/* EFE4C 001EFD4C 749C070C */  jal        SetItemShopTalkMode__Fii
/* EFE50 001EFD50 00000000 */   nop
/* EFE54 001EFD54 28960070 */  paddub     $18, $0, $0
.L001EFD58:
/* EFE58 001EFD58 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EFE5C 001EFD5C E400248C */  lw         $4, (0x1D900E4 & 0xFFFF)($at)
/* EFE60 001EFD60 0A000224 */  addiu      $2, $0, 0xA
/* EFE64 001EFD64 1A008200 */  div        $0, $4, $2
/* EFE68 001EFD68 02004014 */  bnez       $2, .L001EFD74
/* EFE6C 001EFD6C 00000000 */   nop
/* EFE70 001EFD70 CD010000 */  break      0, 7
.L001EFD74:
/* EFE74 001EFD74 12100000 */  mflo       $2
/* EFE78 001EFD78 8494838F */  lw         $3, -0x6B7C($gp)
/* EFE7C 001EFD7C 21104300 */  addu       $2, $2, $3
/* EFE80 001EFD80 40434380 */  lb         $3, 0x4340($2)
/* EFE84 001EFD84 0A000224 */  addiu      $2, $0, 0xA
/* EFE88 001EFD88 1A008200 */  div        $0, $4, $2
/* EFE8C 001EFD8C 00000000 */  nop
/* EFE90 001EFD90 00000000 */  nop
/* EFE94 001EFD94 10100000 */  mfhi       $2
/* EFE98 001EFD98 0C004314 */  bne        $2, $3, .L001EFDCC
/* EFE9C 001EFD9C 00000000 */   nop
/* EFEA0 001EFDA0 28960070 */  paddub     $18, $0, $0
/* EFEA4 001EFDA4 05000424 */  addiu      $4, $0, 0x5
/* EFEA8 001EFDA8 01000524 */  addiu      $5, $0, 0x1
/* EFEAC 001EFDAC 749C070C */  jal        SetItemShopTalkMode__Fii
/* EFEB0 001EFDB0 00000000 */   nop
/* EFEB4 001EFDB4 05000010 */  b          .L001EFDCC
/* EFEB8 001EFDB8 00000000 */   nop
.L001EFDBC:
/* EFEBC 001EFDBC 04000424 */  addiu      $4, $0, 0x4
/* EFEC0 001EFDC0 01000524 */  addiu      $5, $0, 0x1
/* EFEC4 001EFDC4 749C070C */  jal        SetItemShopTalkMode__Fii
/* EFEC8 001EFDC8 00000000 */   nop
.L001EFDCC:
/* EFECC 001EFDCC 8494828F */  lw         $2, -0x6B7C($gp)
/* EFED0 001EFDD0 46434A94 */  lhu        $10, 0x4346($2)
/* EFED4 001EFDD4 28262072 */  paddub     $4, $17, $0
/* EFED8 001EFDD8 01000524 */  addiu      $5, $0, 0x1
/* EFEDC 001EFDDC B4AC070C */  jal        CalItemMoney__Fii
/* EFEE0 001EFDE0 00000000 */   nop
/* EFEE4 001EFDE4 284E4070 */  paddub     $9, $2, $0
/* EFEE8 001EFDE8 0101222A */  slti       $2, $17, 0x101
/* EFEEC 001EFDEC 1B004014 */  bnez       $2, .L001EFE5C
/* EFEF0 001EFDF0 00000000 */   nop
/* EFEF4 001EFDF4 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EFEF8 001EFDF8 E400258C */  lw         $5, (0x1D900E4 & 0xFFFF)($at)
/* EFEFC 001EFDFC 0A000224 */  addiu      $2, $0, 0xA
/* EFF00 001EFE00 1A00A200 */  div        $0, $5, $2
/* EFF04 001EFE04 02004014 */  bnez       $2, .L001EFE10
/* EFF08 001EFE08 00000000 */   nop
/* EFF0C 001EFE0C CD010000 */  break      0, 7
.L001EFE10:
/* EFF10 001EFE10 12180000 */  mflo       $3
/* EFF14 001EFE14 8494848F */  lw         $4, -0x6B7C($gp)
/* EFF18 001EFE18 A80A0224 */  addiu      $2, $0, 0xAA8
/* EFF1C 001EFE1C 18106200 */  mult       $2, $3, $2
/* EFF20 001EFE20 21108200 */  addu       $2, $4, $2
/* EFF24 001EFE24 0C454424 */  addiu      $4, $2, 0x450C
/* EFF28 001EFE28 0A000224 */  addiu      $2, $0, 0xA
/* EFF2C 001EFE2C 1A00A200 */  div        $0, $5, $2
/* EFF30 001EFE30 00000000 */  nop
/* EFF34 001EFE34 00000000 */  nop
/* EFF38 001EFE38 10180000 */  mfhi       $3
/* EFF3C 001EFE3C 40110300 */  sll        $2, $3, 5
/* EFF40 001EFE40 23104300 */  subu       $2, $2, $3
/* EFF44 001EFE44 C0100200 */  sll        $2, $2, 3
/* EFF48 001EFE48 21208200 */  addu       $4, $4, $2
/* EFF4C 001EFE4C 01000524 */  addiu      $5, $0, 0x1
/* EFF50 001EFE50 C4AC070C */  jal        WeaponCalMoney__FP11WEAPON_HAVEi
/* EFF54 001EFE54 00000000 */   nop
/* EFF58 001EFE58 21482201 */  addu       $9, $9, $2
.L001EFE5C:
/* EFF5C 001EFE5C 0200201D */  bgtz       $9, .L001EFE68
/* EFF60 001EFE60 00000000 */   nop
/* EFF64 001EFE64 01000924 */  addiu      $9, $0, 0x1
.L001EFE68:
/* EFF68 001EFE68 21104901 */  addu       $2, $10, $9
/* EFF6C 001EFE6C 0100013C */  lui        $at, (0x10000 >> 16)
/* EFF70 001EFE70 2A084100 */  slt        $at, $2, $at
/* EFF74 001EFE74 06002014 */  bnez       $at, .L001EFE90
/* EFF78 001EFE78 00000000 */   nop
/* EFF7C 001EFE7C 16000424 */  addiu      $4, $0, 0x16
/* EFF80 001EFE80 01000524 */  addiu      $5, $0, 0x1
/* EFF84 001EFE84 749C070C */  jal        SetItemShopTalkMode__Fii
/* EFF88 001EFE88 00000000 */   nop
/* EFF8C 001EFE8C 28960070 */  paddub     $18, $0, $0
.L001EFE90:
/* EFF90 001EFE90 5100212A */  slti       $at, $17, 0x51
/* EFF94 001EFE94 06002010 */  beqz       $at, .L001EFEB0
/* EFF98 001EFE98 00000000 */   nop
/* EFF9C 001EFE9C 02000424 */  addiu      $4, $0, 0x2
/* EFFA0 001EFEA0 BCB3080C */  jal        ComMenuSePlay__Fi
/* EFFA4 001EFEA4 00000000 */   nop
/* EFFA8 001EFEA8 0E000010 */  b          .L001EFEE4
/* EFFAC 001EFEAC 00000000 */   nop
.L001EFEB0:
/* EFFB0 001EFEB0 09004012 */  beqz       $18, .L001EFED8
/* EFFB4 001EFEB4 00000000 */   nop
/* EFFB8 001EFEB8 0E000224 */  addiu      $2, $0, 0xE
/* EFFBC 001EFEBC D901013C */  lui        $at, (0x1D90250 >> 16)
/* EFFC0 001EFEC0 500222A4 */  sh         $2, (0x1D90250 & 0xFFFF)($at)
/* EFFC4 001EFEC4 01000424 */  addiu      $4, $0, 0x1
/* EFFC8 001EFEC8 BCB3080C */  jal        ComMenuSePlay__Fi
/* EFFCC 001EFECC 00000000 */   nop
/* EFFD0 001EFED0 04000010 */  b          .L001EFEE4
/* EFFD4 001EFED4 00000000 */   nop
.L001EFED8:
/* EFFD8 001EFED8 02000424 */  addiu      $4, $0, 0x2
/* EFFDC 001EFEDC BCB3080C */  jal        ComMenuSePlay__Fi
/* EFFE0 001EFEE0 00000000 */   nop
.L001EFEE4:
/* EFFE4 001EFEE4 16000012 */  beqz       $16, .L001EFF40
/* EFFE8 001EFEE8 00000000 */   nop
/* EFFEC 001EFEEC D901013C */  lui        $at, (0x1D900D2 >> 16)
/* EFFF0 001EFEF0 D20020A4 */  sh         $0, (0x1D900D2 & 0xFFFF)($at)
/* EFFF4 001EFEF4 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* EFFF8 001EFEF8 E400238C */  lw         $3, (0x1D900E4 & 0xFFFF)($at)
/* EFFFC 001EFEFC 05000224 */  addiu      $2, $0, 0x5
/* F0000 001EFF00 1A006200 */  div        $0, $3, $2
/* F0004 001EFF04 02004014 */  bnez       $2, .L001EFF10
/* F0008 001EFF08 00000000 */   nop
/* F000C 001EFF0C CD010000 */  break      0, 7
.L001EFF10:
/* F0010 001EFF10 12180000 */  mflo       $3
/* F0014 001EFF14 D901013C */  lui        $at, (0x1D900F0 >> 16)
/* F0018 001EFF18 F000228C */  lw         $2, (0x1D900F0 & 0xFFFF)($at)
/* F001C 001EFF1C 23186200 */  subu       $3, $3, $2
/* F0020 001EFF20 D901013C */  lui        $at, (0x1D90246 >> 16)
/* F0024 001EFF24 46022290 */  lbu        $2, (0x1D90246 & 0xFFFF)($at)
/* F0028 001EFF28 21184300 */  addu       $3, $2, $3
/* F002C 001EFF2C 80100300 */  sll        $2, $3, 2
/* F0030 001EFF30 21104300 */  addu       $2, $2, $3
/* F0034 001EFF34 04004224 */  addiu      $2, $2, 0x4
/* F0038 001EFF38 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* F003C 001EFF3C E40022AC */  sw         $2, (0x1D900E4 & 0xFFFF)($at)
.L001EFF40:
/* F0040 001EFF40 D901013C */  lui        $at, (0x1D900D6 >> 16)
/* F0044 001EFF44 D6002284 */  lh         $2, (0x1D900D6 & 0xFFFF)($at)
/* F0048 001EFF48 2D014014 */  bnez       $2, .L001F0400
/* F004C 001EFF4C 00000000 */   nop
/* F0050 001EFF50 CC01023C */  lui        $2, %hi(GamePad)
/* F0054 001EFF54 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F0058 001EFF58 20000524 */  addiu      $5, $0, 0x20
/* F005C 001EFF5C 1CAE040C */  jal        Down__8CGamePadFi
/* F0060 001EFF60 00000000 */   nop
/* F0064 001EFF64 26014010 */  beqz       $2, .L001F0400
/* F0068 001EFF68 00000000 */   nop
/* F006C 001EFF6C 02000424 */  addiu      $4, $0, 0x2
/* F0070 001EFF70 BCB3080C */  jal        ComMenuSePlay__Fi
/* F0074 001EFF74 00000000 */   nop
/* F0078 001EFF78 B894828F */  lw         $2, -0x6B48($gp)
/* F007C 001EFF7C 10005184 */  lh         $17, 0x10($2)
/* F0080 001EFF80 5100212A */  slti       $at, $17, 0x51
/* F0084 001EFF84 29002010 */  beqz       $at, .L001F002C
/* F0088 001EFF88 00000000 */   nop
/* F008C 001EFF8C D901013C */  lui        $at, (0x1D900D2 >> 16)
/* F0090 001EFF90 D2002384 */  lh         $3, (0x1D900D2 & 0xFFFF)($at)
/* F0094 001EFF94 02000224 */  addiu      $2, $0, 0x2
/* F0098 001EFF98 20006214 */  bne        $3, $2, .L001F001C
/* F009C 001EFF9C 00000000 */   nop
/* F00A0 001EFFA0 FFFF0224 */  addiu      $2, $0, -0x1
/* F00A4 001EFFA4 DA01013C */  lui        $at, (0x1DA51CC >> 16)
/* F00A8 001EFFA8 CC5122AC */  sw         $2, (0x1DA51CC & 0xFFFF)($at)
/* F00AC 001EFFAC 01000224 */  addiu      $2, $0, 0x1
/* F00B0 001EFFB0 D901013C */  lui        $at, (0x1D9026A >> 16)
/* F00B4 001EFFB4 6A0222A4 */  sh         $2, (0x1D9026A & 0xFFFF)($at)
/* F00B8 001EFFB8 ECAD070C */  jal        CheckBuyItemFunc2__Fv
/* F00BC 001EFFBC 00000000 */   nop
/* F00C0 001EFFC0 01004330 */  andi       $3, $2, 0x1
/* F00C4 001EFFC4 04006010 */  beqz       $3, .L001EFFD8
/* F00C8 001EFFC8 00000000 */   nop
/* F00CC 001EFFCC 18000324 */  addiu      $3, $0, 0x18
/* F00D0 001EFFD0 D901013C */  lui        $at, (0x1D90250 >> 16)
/* F00D4 001EFFD4 500223A4 */  sh         $3, (0x1D90250 & 0xFFFF)($at)
.L001EFFD8:
/* F00D8 001EFFD8 06004330 */  andi       $3, $2, 0x6
/* F00DC 001EFFDC 07006010 */  beqz       $3, .L001EFFFC
/* F00E0 001EFFE0 00000000 */   nop
/* F00E4 001EFFE4 06000324 */  addiu      $3, $0, 0x6
/* F00E8 001EFFE8 D901013C */  lui        $at, (0x1D90250 >> 16)
/* F00EC 001EFFEC 500223A4 */  sh         $3, (0x1D90250 & 0xFFFF)($at)
/* F00F0 001EFFF0 02000324 */  addiu      $3, $0, 0x2
/* F00F4 001EFFF4 D901013C */  lui        $at, (0x1D900D2 >> 16)
/* F00F8 001EFFF8 D20023A4 */  sh         $3, (0x1D900D2 & 0xFFFF)($at)
.L001EFFFC:
/* F00FC 001EFFFC 08004230 */  andi       $2, $2, 0x8
/* F0100 001F0000 21014010 */  beqz       $2, .L001F0488
/* F0104 001F0004 00000000 */   nop
/* F0108 001F0008 0A000224 */  addiu      $2, $0, 0xA
/* F010C 001F000C D901013C */  lui        $at, (0x1D90250 >> 16)
/* F0110 001F0010 500222A4 */  sh         $2, (0x1D90250 & 0xFFFF)($at)
/* F0114 001F0014 1C010010 */  b          .L001F0488
/* F0118 001F0018 00000000 */   nop
.L001F001C:
/* F011C 001F001C D901013C */  lui        $at, (0x1D900D2 >> 16)
/* F0120 001F0020 D20022A4 */  sh         $2, (0x1D900D2 & 0xFFFF)($at)
/* F0124 001F0024 18010010 */  b          .L001F0488
/* F0128 001F0028 00000000 */   nop
.L001F002C:
/* F012C 001F002C 0000508C */  lw         $16, 0x0($2)
/* F0130 001F0030 02000224 */  addiu      $2, $0, 0x2
/* F0134 001F0034 A8000212 */  beq        $16, $2, .L001F02D8
/* F0138 001F0038 00000000 */   nop
/* F013C 001F003C 01000224 */  addiu      $2, $0, 0x1
/* F0140 001F0040 03000212 */  beq        $16, $2, .L001F0050
/* F0144 001F0044 00000000 */   nop
/* F0148 001F0048 0F010010 */  b          .L001F0488
/* F014C 001F004C 00000000 */   nop
.L001F0050:
/* F0150 001F0050 FFFF1024 */  addiu      $16, $0, -0x1
/* F0154 001F0054 28260070 */  paddub     $4, $0, $0
/* F0158 001F0058 0B000010 */  b          .L001F0088
/* F015C 001F005C 00000000 */   nop
.L001F0060:
/* F0160 001F0060 80180400 */  sll        $3, $4, 2
/* F0164 001F0064 9094828F */  lw         $2, -0x6B70($gp)
/* F0168 001F0068 21104300 */  addu       $2, $2, $3
/* F016C 001F006C 0000428C */  lw         $2, 0x0($2)
/* F0170 001F0070 04004014 */  bnez       $2, .L001F0084
/* F0174 001F0074 00000000 */   nop
/* F0178 001F0078 28868070 */  paddub     $16, $4, $0
/* F017C 001F007C 05000010 */  b          .L001F0094
/* F0180 001F0080 00000000 */   nop
.L001F0084:
/* F0184 001F0084 01008424 */  addiu      $4, $4, 0x1
.L001F0088:
/* F0188 001F0088 1E008228 */  slti       $2, $4, 0x1E
/* F018C 001F008C F4FF4014 */  bnez       $2, .L001F0060
/* F0190 001F0090 00000000 */   nop
.L001F0094:
/* F0194 001F0094 06000106 */  bgez       $16, .L001F00B0
/* F0198 001F0098 00000000 */   nop
/* F019C 001F009C 02000424 */  addiu      $4, $0, 0x2
/* F01A0 001F00A0 BCB3080C */  jal        ComMenuSePlay__Fi
/* F01A4 001F00A4 00000000 */   nop
/* F01A8 001F00A8 F7000010 */  b          .L001F0488
/* F01AC 001F00AC 00000000 */   nop
.L001F00B0:
/* F01B0 001F00B0 80111000 */  sll        $2, $16, 6
/* F01B4 001F00B4 23105000 */  subu       $2, $2, $16
/* F01B8 001F00B8 80180200 */  sll        $3, $2, 2
/* F01BC 001F00BC A094828F */  lw         $2, -0x6B60($gp)
/* F01C0 001F00C0 21884300 */  addu       $17, $2, $3
/* F01C4 001F00C4 A001A427 */  addiu      $4, $sp, 0x1A0
/* F01C8 001F00C8 282E0070 */  paddub     $5, $0, $0
/* F01CC 001F00CC F0010624 */  addiu      $6, $0, 0x1F0
/* F01D0 001F00D0 5A0D040C */  jal        memset
/* F01D4 001F00D4 00000000 */   nop
/* F01D8 001F00D8 00002486 */  lh         $4, 0x0($17)
/* F01DC 001F00DC 88C7080C */  jal        WhatIsKindofItem__Fi
/* F01E0 001F00E0 00000000 */   nop
/* F01E4 001F00E4 28964070 */  paddub     $18, $2, $0
/* F01E8 001F00E8 02000224 */  addiu      $2, $0, 0x2
/* F01EC 001F00EC 13004212 */  beq        $18, $2, .L001F013C
/* F01F0 001F00F0 00000000 */   nop
/* F01F4 001F00F4 01000224 */  addiu      $2, $0, 0x1
/* F01F8 001F00F8 09004212 */  beq        $18, $2, .L001F0120
/* F01FC 001F00FC 00000000 */   nop
/* F0200 001F0100 03004012 */  beqz       $18, .L001F0110
/* F0204 001F0104 00000000 */   nop
/* F0208 001F0108 11000010 */  b          .L001F0150
/* F020C 001F010C 00000000 */   nop
.L001F0110:
/* F0210 001F0110 0400228E */  lw         $2, 0x4($17)
/* F0214 001F0114 A001A2AF */  sw         $2, 0x1A0($sp)
/* F0218 001F0118 0D000010 */  b          .L001F0150
/* F021C 001F011C 00000000 */   nop
.L001F0120:
/* F0220 001F0120 A001A427 */  addiu      $4, $sp, 0x1A0
/* F0224 001F0124 04002526 */  addiu      $5, $17, 0x4
/* F0228 001F0128 F8000624 */  addiu      $6, $0, 0xF8
/* F022C 001F012C EC0C040C */  jal        memcpy
/* F0230 001F0130 00000000 */   nop
/* F0234 001F0134 06000010 */  b          .L001F0150
/* F0238 001F0138 00000000 */   nop
.L001F013C:
/* F023C 001F013C A001A427 */  addiu      $4, $sp, 0x1A0
/* F0240 001F0140 04002526 */  addiu      $5, $17, 0x4
/* F0244 001F0144 20000624 */  addiu      $6, $0, 0x20
/* F0248 001F0148 EC0C040C */  jal        memcpy
/* F024C 001F014C 00000000 */   nop
.L001F0150:
/* F0250 001F0150 B894828F */  lw         $2, -0x6B48($gp)
/* F0254 001F0154 10004484 */  lh         $4, 0x10($2)
/* F0258 001F0158 88C7080C */  jal        WhatIsKindofItem__Fi
/* F025C 001F015C 00000000 */   nop
/* F0260 001F0160 289E4070 */  paddub     $19, $2, $0
/* F0264 001F0164 02000224 */  addiu      $2, $0, 0x2
/* F0268 001F0168 14006212 */  beq        $19, $2, .L001F01BC
/* F026C 001F016C 00000000 */   nop
/* F0270 001F0170 01000224 */  addiu      $2, $0, 0x1
/* F0274 001F0174 0A006212 */  beq        $19, $2, .L001F01A0
/* F0278 001F0178 00000000 */   nop
/* F027C 001F017C 03006012 */  beqz       $19, .L001F018C
/* F0280 001F0180 00000000 */   nop
/* F0284 001F0184 12000010 */  b          .L001F01D0
/* F0288 001F0188 00000000 */   nop
.L001F018C:
/* F028C 001F018C B894828F */  lw         $2, -0x6B48($gp)
/* F0290 001F0190 12004284 */  lh         $2, 0x12($2)
/* F0294 001F0194 9802A2AF */  sw         $2, 0x298($sp)
/* F0298 001F0198 0D000010 */  b          .L001F01D0
/* F029C 001F019C 00000000 */   nop
.L001F01A0:
/* F02A0 001F01A0 9802A427 */  addiu      $4, $sp, 0x298
/* F02A4 001F01A4 BC94858F */  lw         $5, -0x6B44($gp)
/* F02A8 001F01A8 F8000624 */  addiu      $6, $0, 0xF8
/* F02AC 001F01AC EC0C040C */  jal        memcpy
/* F02B0 001F01B0 00000000 */   nop
/* F02B4 001F01B4 06000010 */  b          .L001F01D0
/* F02B8 001F01B8 00000000 */   nop
.L001F01BC:
/* F02BC 001F01BC 9802A427 */  addiu      $4, $sp, 0x298
/* F02C0 001F01C0 C094858F */  lw         $5, -0x6B40($gp)
/* F02C4 001F01C4 20000624 */  addiu      $6, $0, 0x20
/* F02C8 001F01C8 EC0C040C */  jal        memcpy
/* F02CC 001F01CC 00000000 */   nop
.L001F01D0:
/* F02D0 001F01D0 02000224 */  addiu      $2, $0, 0x2
/* F02D4 001F01D4 14004212 */  beq        $18, $2, .L001F0228
/* F02D8 001F01D8 00000000 */   nop
/* F02DC 001F01DC 01000224 */  addiu      $2, $0, 0x1
/* F02E0 001F01E0 0A004212 */  beq        $18, $2, .L001F020C
/* F02E4 001F01E4 00000000 */   nop
/* F02E8 001F01E8 03004012 */  beqz       $18, .L001F01F8
/* F02EC 001F01EC 00000000 */   nop
/* F02F0 001F01F0 12000010 */  b          .L001F023C
/* F02F4 001F01F4 00000000 */   nop
.L001F01F8:
/* F02F8 001F01F8 A001A387 */  lh         $3, 0x1A0($sp)
/* F02FC 001F01FC B894828F */  lw         $2, -0x6B48($gp)
/* F0300 001F0200 120043A4 */  sh         $3, 0x12($2)
/* F0304 001F0204 0D000010 */  b          .L001F023C
/* F0308 001F0208 00000000 */   nop
.L001F020C:
/* F030C 001F020C BC94848F */  lw         $4, -0x6B44($gp)
/* F0310 001F0210 A001A527 */  addiu      $5, $sp, 0x1A0
/* F0314 001F0214 F8000624 */  addiu      $6, $0, 0xF8
/* F0318 001F0218 EC0C040C */  jal        memcpy
/* F031C 001F021C 00000000 */   nop
/* F0320 001F0220 06000010 */  b          .L001F023C
/* F0324 001F0224 00000000 */   nop
.L001F0228:
/* F0328 001F0228 C094848F */  lw         $4, -0x6B40($gp)
/* F032C 001F022C A001A527 */  addiu      $5, $sp, 0x1A0
/* F0330 001F0230 20000624 */  addiu      $6, $0, 0x20
/* F0334 001F0234 EC0C040C */  jal        memcpy
/* F0338 001F0238 00000000 */   nop
.L001F023C:
/* F033C 001F023C 02000224 */  addiu      $2, $0, 0x2
/* F0340 001F0240 13006212 */  beq        $19, $2, .L001F0290
/* F0344 001F0244 00000000 */   nop
/* F0348 001F0248 01000224 */  addiu      $2, $0, 0x1
/* F034C 001F024C 09006212 */  beq        $19, $2, .L001F0274
/* F0350 001F0250 00000000 */   nop
/* F0354 001F0254 03006012 */  beqz       $19, .L001F0264
/* F0358 001F0258 00000000 */   nop
/* F035C 001F025C 11000010 */  b          .L001F02A4
/* F0360 001F0260 00000000 */   nop
.L001F0264:
/* F0364 001F0264 9802A28F */  lw         $2, 0x298($sp)
/* F0368 001F0268 040022AE */  sw         $2, 0x4($17)
/* F036C 001F026C 0D000010 */  b          .L001F02A4
/* F0370 001F0270 00000000 */   nop
.L001F0274:
/* F0374 001F0274 04002426 */  addiu      $4, $17, 0x4
/* F0378 001F0278 9802A527 */  addiu      $5, $sp, 0x298
/* F037C 001F027C F8000624 */  addiu      $6, $0, 0xF8
/* F0380 001F0280 EC0C040C */  jal        memcpy
/* F0384 001F0284 00000000 */   nop
/* F0388 001F0288 06000010 */  b          .L001F02A4
/* F038C 001F028C 00000000 */   nop
.L001F0290:
/* F0390 001F0290 04002426 */  addiu      $4, $17, 0x4
/* F0394 001F0294 9802A527 */  addiu      $5, $sp, 0x298
/* F0398 001F0298 20000624 */  addiu      $6, $0, 0x20
/* F039C 001F029C EC0C040C */  jal        memcpy
/* F03A0 001F02A0 00000000 */   nop
.L001F02A4:
/* F03A4 001F02A4 80181000 */  sll        $3, $16, 2
/* F03A8 001F02A8 9094828F */  lw         $2, -0x6B70($gp)
/* F03AC 001F02AC 21284300 */  addu       $5, $2, $3
/* F03B0 001F02B0 B894848F */  lw         $4, -0x6B48($gp)
/* F03B4 001F02B4 44B9080C */  jal        MenuDataSwap__FPiPi
/* F03B8 001F02B8 00000000 */   nop
/* F03BC 001F02BC B894828F */  lw         $2, -0x6B48($gp)
/* F03C0 001F02C0 10004424 */  addiu      $4, $2, 0x10
/* F03C4 001F02C4 282E2072 */  paddub     $5, $17, $0
/* F03C8 001F02C8 38B9080C */  jal        MenuDataSwap__FPsPs
/* F03CC 001F02CC 00000000 */   nop
/* F03D0 001F02D0 6D000010 */  b          .L001F0488
/* F03D4 001F02D4 00000000 */   nop
.L001F02D8:
/* F03D8 001F02D8 28262072 */  paddub     $4, $17, $0
/* F03DC 001F02DC 88C7080C */  jal        WhatIsKindofItem__Fi
/* F03E0 001F02E0 00000000 */   nop
/* F03E4 001F02E4 9C03A2AF */  sw         $2, 0x39C($sp)
/* F03E8 001F02E8 9C03A38F */  lw         $3, 0x39C($sp)
/* F03EC 001F02EC 02000224 */  addiu      $2, $0, 0x2
/* F03F0 001F02F0 0E006210 */  beq        $3, $2, .L001F032C
/* F03F4 001F02F4 00000000 */   nop
/* F03F8 001F02F8 01000224 */  addiu      $2, $0, 0x1
/* F03FC 001F02FC 08006210 */  beq        $3, $2, .L001F0320
/* F0400 001F0300 00000000 */   nop
/* F0404 001F0304 03006010 */  beqz       $3, .L001F0314
/* F0408 001F0308 00000000 */   nop
/* F040C 001F030C 09000010 */  b          .L001F0334
/* F0410 001F0310 00000000 */   nop
.L001F0314:
/* F0414 001F0314 9494938F */  lw         $19, -0x6B6C($gp)
/* F0418 001F0318 06000010 */  b          .L001F0334
/* F041C 001F031C 00000000 */   nop
.L001F0320:
/* F0420 001F0320 9894938F */  lw         $19, -0x6B68($gp)
/* F0424 001F0324 03000010 */  b          .L001F0334
/* F0428 001F0328 00000000 */   nop
.L001F032C:
/* F042C 001F032C 9C94938F */  lw         $19, -0x6B64($gp)
/* F0430 001F0330 00000000 */  nop
.L001F0334:
/* F0434 001F0334 28262072 */  paddub     $4, $17, $0
/* F0438 001F0338 9C03A527 */  addiu      $5, $sp, 0x39C
/* F043C 001F033C 70C5080C */  jal        GetBoardSpace__FiPi
/* F0440 001F0340 00000000 */   nop
/* F0444 001F0344 28964070 */  paddub     $18, $2, $0
/* F0448 001F0348 9C03A48F */  lw         $4, 0x39C($sp)
/* F044C 001F034C D8BD080C */  jal        PersonalRetMax__Fi
/* F0450 001F0350 00000000 */   nop
/* F0454 001F0354 04004006 */  bltz       $18, .L001F0368
/* F0458 001F0358 00000000 */   nop
/* F045C 001F035C 2A084202 */  slt        $at, $18, $2
/* F0460 001F0360 06002014 */  bnez       $at, .L001F037C
/* F0464 001F0364 00000000 */   nop
.L001F0368:
/* F0468 001F0368 02000424 */  addiu      $4, $0, 0x2
/* F046C 001F036C BCB3080C */  jal        ComMenuSePlay__Fi
/* F0470 001F0370 00000000 */   nop
/* F0474 001F0374 44000010 */  b          .L001F0488
/* F0478 001F0378 00000000 */   nop
.L001F037C:
/* F047C 001F037C 80101200 */  sll        $2, $18, 2
/* F0480 001F0380 21886202 */  addu       $17, $19, $2
/* F0484 001F0384 0000338E */  lw         $19, 0x0($17)
/* F0488 001F0388 9C03A38F */  lw         $3, 0x39C($sp)
/* F048C 001F038C B894828F */  lw         $2, -0x6B48($gp)
/* F0490 001F0390 040043AC */  sw         $3, 0x4($2)
/* F0494 001F0394 B894828F */  lw         $2, -0x6B48($gp)
/* F0498 001F0398 0C0052AC */  sw         $18, 0xC($2)
/* F049C 001F039C D901013C */  lui        $at, (0x1D90234 >> 16)
/* F04A0 001F03A0 3402348C */  lw         $20, (0x1D90234 & 0xFFFF)($at)
/* F04A4 001F03A4 B894828F */  lw         $2, -0x6B48($gp)
/* F04A8 001F03A8 10005584 */  lh         $21, 0x10($2)
/* F04AC 001F03AC 54BD080C */  jal        PersonalBoardItemCancel__Fv
/* F04B0 001F03B0 00000000 */   nop
/* F04B4 001F03B4 2A088002 */  slt        $at, $20, $0
/* F04B8 001F03B8 0C002014 */  bnez       $at, .L001F03EC
/* F04BC 001F03BC 00000000 */   nop
/* F04C0 001F03C0 2826A072 */  paddub     $4, $21, $0
/* F04C4 001F03C4 A4C7080C */  jal        WhoIsWeaponEquip__Fi
/* F04C8 001F03C8 00000000 */   nop
/* F04CC 001F03CC 0A000324 */  addiu      $3, $0, 0xA
/* F04D0 001F03D0 1A004302 */  div        $0, $18, $3
/* F04D4 001F03D4 00000000 */  nop
/* F04D8 001F03D8 00000000 */  nop
/* F04DC 001F03DC 10200000 */  mfhi       $4
/* F04E0 001F03E0 8494838F */  lw         $3, -0x6B7C($gp)
/* F04E4 001F03E4 21104300 */  addu       $2, $2, $3
/* F04E8 001F03E8 404344A0 */  sb         $4, 0x4340($2)
.L001F03EC:
/* F04EC 001F03EC B894828F */  lw         $2, -0x6B48($gp)
/* F04F0 001F03F0 000053AC */  sw         $19, 0x0($2)
/* F04F4 001F03F4 000030AE */  sw         $16, 0x0($17)
/* F04F8 001F03F8 23000010 */  b          .L001F0488
/* F04FC 001F03FC 00000000 */   nop
.L001F0400:
/* F0500 001F0400 CC01023C */  lui        $2, %hi(GamePad)
/* F0504 001F0404 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* F0508 001F0408 80000524 */  addiu      $5, $0, 0x80
/* F050C 001F040C 1CAE040C */  jal        Down__8CGamePadFi
/* F0510 001F0410 00000000 */   nop
/* F0514 001F0414 1C004010 */  beqz       $2, .L001F0488
/* F0518 001F0418 00000000 */   nop
/* F051C 001F041C D901013C */  lui        $at, (0x1D900DC >> 16)
/* F0520 001F0420 DC00238C */  lw         $3, (0x1D900DC & 0xFFFF)($at)
/* F0524 001F0424 02000224 */  addiu      $2, $0, 0x2
/* F0528 001F0428 0F006210 */  beq        $3, $2, .L001F0468
/* F052C 001F042C 00000000 */   nop
/* F0530 001F0430 03006010 */  beqz       $3, .L001F0440
/* F0534 001F0434 00000000 */   nop
/* F0538 001F0438 10000010 */  b          .L001F047C
/* F053C 001F043C 00000000 */   nop
.L001F0440:
/* F0540 001F0440 8494828F */  lw         $2, -0x6B7C($gp)
/* F0544 001F0444 60435024 */  addiu      $16, $2, 0x4360
/* F0548 001F0448 28260072 */  paddub     $4, $16, $0
/* F054C 001F044C 6CAF070C */  jal        SeitonShopItemBoard__FP9ITEM_PACK
/* F0550 001F0450 00000000 */   nop
/* F0554 001F0454 28260072 */  paddub     $4, $16, $0
/* F0558 001F0458 98B9080C */  jal        SetMenuTrushMark__FP9ITEM_PACK
/* F055C 001F045C 00000000 */   nop
/* F0560 001F0460 06000010 */  b          .L001F047C
/* F0564 001F0464 00000000 */   nop
.L001F0468:
/* F0568 001F0468 8494828F */  lw         $2, -0x6B7C($gp)
/* F056C 001F046C 04054424 */  addiu      $4, $2, 0x504
/* F0570 001F0470 F87F8424 */  addiu      $4, $4, 0x7FF8
/* F0574 001F0474 20B0070C */  jal        SeitonShopAttachBoard__FP11ATTACH_LIST
/* F0578 001F0478 00000000 */   nop
.L001F047C:
/* F057C 001F047C 01000424 */  addiu      $4, $0, 0x1
/* F0580 001F0480 BCB3080C */  jal        ComMenuSePlay__Fi
/* F0584 001F0484 00000000 */   nop
.L001F0488:
/* F0588 001F0488 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* F058C 001F048C E400228C */  lw         $2, (0x1D900E4 & 0xFFFF)($at)
/* F0590 001F0490 0500C217 */  bne        $fp, $2, .L001F04A8
/* F0594 001F0494 00000000 */   nop
/* F0598 001F0498 D901013C */  lui        $at, (0x1D900DC >> 16)
/* F059C 001F049C DC00228C */  lw         $2, (0x1D900DC & 0xFFFF)($at)
/* F05A0 001F04A0 0400E212 */  beq        $23, $2, .L001F04B4
/* F05A4 001F04A4 00000000 */   nop
.L001F04A8:
/* F05A8 001F04A8 28260070 */  paddub     $4, $0, $0
/* F05AC 001F04AC BCB3080C */  jal        ComMenuSePlay__Fi
/* F05B0 001F04B0 00000000 */   nop
.L001F04B4:
/* F05B4 001F04B4 28860070 */  paddub     $16, $0, $0
/* F05B8 001F04B8 288E0070 */  paddub     $17, $0, $0
/* F05BC 001F04BC FFFF1224 */  addiu      $18, $0, -0x1
/* F05C0 001F04C0 B894828F */  lw         $2, -0x6B48($gp)
/* F05C4 001F04C4 10004484 */  lh         $4, 0x10($2)
/* F05C8 001F04C8 51008228 */  slti       $2, $4, 0x51
/* F05CC 001F04CC 17004014 */  bnez       $2, .L001F052C
/* F05D0 001F04D0 00000000 */   nop
/* F05D4 001F04D4 7443070C */  jal        GetCommonItemInfo__Fi
/* F05D8 001F04D8 00000000 */   nop
/* F05DC 001F04DC 05004010 */  beqz       $2, .L001F04F4
/* F05E0 001F04E0 00000000 */   nop
/* F05E4 001F04E4 06004284 */  lh         $2, 0x6($2)
/* F05E8 001F04E8 F4015024 */  addiu      $16, $2, 0x1F4
/* F05EC 001F04EC 01000010 */  b          .L001F04F4
/* F05F0 001F04F0 00000000 */   nop
.L001F04F4:
/* F05F4 001F04F4 C094848F */  lw         $4, -0x6B40($gp)
/* F05F8 001F04F8 2C98080C */  jal        GetAttachVolumeForMsg__FP11ATTACH_LIST
/* F05FC 001F04FC 00000000 */   nop
/* F0600 001F0500 288E4070 */  paddub     $17, $2, $0
/* F0604 001F0504 B894828F */  lw         $2, -0x6B48($gp)
/* F0608 001F0508 10004384 */  lh         $3, 0x10($2)
/* F060C 001F050C 5A000224 */  addiu      $2, $0, 0x5A
/* F0610 001F0510 06006214 */  bne        $3, $2, .L001F052C
/* F0614 001F0514 00000000 */   nop
/* F0618 001F0518 C094828F */  lw         $2, -0x6B40($gp)
/* F061C 001F051C 02004484 */  lh         $4, 0x2($2)
/* F0620 001F0520 10AA080C */  jal        GetWeaponMsgNo2__Fi
/* F0624 001F0524 00000000 */   nop
/* F0628 001F0528 28964070 */  paddub     $18, $2, $0
.L001F052C:
/* F062C 001F052C FFFF1324 */  addiu      $19, $0, -0x1
/* F0630 001F0530 D901013C */  lui        $at, (0x1D900E4 >> 16)
/* F0634 001F0534 E400258C */  lw         $5, (0x1D900E4 & 0xFFFF)($at)
/* F0638 001F0538 D901013C */  lui        $at, (0x1D900D2 >> 16)
/* F063C 001F053C D2002384 */  lh         $3, (0x1D900D2 & 0xFFFF)($at)
/* F0640 001F0540 01000424 */  addiu      $4, $0, 0x1
/* F0644 001F0544 2F006410 */  beq        $3, $4, .L001F0604
/* F0648 001F0548 00000000 */   nop
/* F064C 001F054C 09006010 */  beqz       $3, .L001F0574
/* F0650 001F0550 00000000 */   nop
/* F0654 001F0554 02000224 */  addiu      $2, $0, 0x2
/* F0658 001F0558 03006210 */  beq        $3, $2, .L001F0568
/* F065C 001F055C 00000000 */   nop
/* F0660 001F0560 68000010 */  b          .L001F0704
/* F0664 001F0564 00000000 */   nop
.L001F0568:
/* F0668 001F0568 B3041024 */  addiu      $16, $0, 0x4B3
/* F066C 001F056C 65000010 */  b          .L001F0704
/* F0670 001F0570 00000000 */   nop
.L001F0574:
/* F0674 001F0574 A094838F */  lw         $3, -0x6B60($gp)
/* F0678 001F0578 80110500 */  sll        $2, $5, 6
/* F067C 001F057C 23104500 */  subu       $2, $2, $5
/* F0680 001F0580 80A80200 */  sll        $21, $2, 2
/* F0684 001F0584 21187500 */  addu       $3, $3, $21
/* F0688 001F0588 00007384 */  lh         $19, 0x0($3)
/* F068C 001F058C 0101622A */  slti       $2, $19, 0x101
/* F0690 001F0590 03004014 */  bnez       $2, .L001F05A0
/* F0694 001F0594 00000000 */   nop
/* F0698 001F0598 06007184 */  lh         $17, 0x6($3)
/* F069C 001F059C 00000000 */  nop
.L001F05A0:
/* F06A0 001F05A0 5B00622A */  slti       $2, $19, 0x5B
/* F06A4 001F05A4 09004014 */  bnez       $2, .L001F05CC
/* F06A8 001F05A8 00000000 */   nop
/* F06AC 001F05AC 5F00612A */  slti       $at, $19, 0x5F
/* F06B0 001F05B0 06002010 */  beqz       $at, .L001F05CC
/* F06B4 001F05B4 00000000 */   nop
/* F06B8 001F05B8 04007424 */  addiu      $20, $3, 0x4
/* F06BC 001F05BC 28268072 */  paddub     $4, $20, $0
/* F06C0 001F05C0 2C98080C */  jal        GetAttachVolumeForMsg__FP11ATTACH_LIST
/* F06C4 001F05C4 00000000 */   nop
/* F06C8 001F05C8 288E4070 */  paddub     $17, $2, $0
.L001F05CC:
/* F06CC 001F05CC 5A000224 */  addiu      $2, $0, 0x5A
/* F06D0 001F05D0 4C006216 */  bne        $19, $2, .L001F0704
/* F06D4 001F05D4 00000000 */   nop
/* F06D8 001F05D8 A094828F */  lw         $2, -0x6B60($gp)
/* F06DC 001F05DC 2110A202 */  addu       $2, $21, $2
/* F06E0 001F05E0 06004484 */  lh         $4, 0x6($2)
/* F06E4 001F05E4 10AA080C */  jal        GetWeaponMsgNo2__Fi
/* F06E8 001F05E8 00000000 */   nop
/* F06EC 001F05EC 28964070 */  paddub     $18, $2, $0
/* F06F0 001F05F0 A094828F */  lw         $2, -0x6B60($gp)
/* F06F4 001F05F4 2110A202 */  addu       $2, $21, $2
/* F06F8 001F05F8 0A005180 */  lb         $17, 0xA($2)
/* F06FC 001F05FC 41000010 */  b          .L001F0704
/* F0700 001F0600 00000000 */   nop
.L001F0604:
/* F0704 001F0604 D901013C */  lui        $at, (0x1D900DC >> 16)
/* F0708 001F0608 DC00238C */  lw         $3, (0x1D900DC & 0xFFFF)($at)
/* F070C 001F060C 02000224 */  addiu      $2, $0, 0x2
/* F0710 001F0610 26006210 */  beq        $3, $2, .L001F06AC
/* F0714 001F0614 00000000 */   nop
/* F0718 001F0618 0C006410 */  beq        $3, $4, .L001F064C
/* F071C 001F061C 00000000 */   nop
/* F0720 001F0620 03006010 */  beqz       $3, .L001F0630
/* F0724 001F0624 00000000 */   nop
/* F0728 001F0628 36000010 */  b          .L001F0704
/* F072C 001F062C 00000000 */   nop
.L001F0630:
/* F0730 001F0630 8494828F */  lw         $2, -0x6B7C($gp)
/* F0734 001F0634 60434324 */  addiu      $3, $2, 0x4360
/* F0738 001F0638 40100500 */  sll        $2, $5, 1
/* F073C 001F063C 21104300 */  addu       $2, $2, $3
/* F0740 001F0640 0E005384 */  lh         $19, 0xE($2)
/* F0744 001F0644 2F000010 */  b          .L001F0704
/* F0748 001F0648 00000000 */   nop
.L001F064C:
/* F074C 001F064C 8494848F */  lw         $4, -0x6B7C($gp)
/* F0750 001F0650 0A000224 */  addiu      $2, $0, 0xA
/* F0754 001F0654 1A00A200 */  div        $0, $5, $2
/* F0758 001F0658 02004014 */  bnez       $2, .L001F0664
/* F075C 001F065C 00000000 */   nop
/* F0760 001F0660 CD010000 */  break      0, 7
.L001F0664:
/* F0764 001F0664 12180000 */  mflo       $3
/* F0768 001F0668 A80A0224 */  addiu      $2, $0, 0xAA8
/* F076C 001F066C 18106200 */  mult       $2, $3, $2
/* F0770 001F0670 21108200 */  addu       $2, $4, $2
/* F0774 001F0674 0C454424 */  addiu      $4, $2, 0x450C
/* F0778 001F0678 0A000224 */  addiu      $2, $0, 0xA
/* F077C 001F067C 1A00A200 */  div        $0, $5, $2
/* F0780 001F0680 00000000 */  nop
/* F0784 001F0684 00000000 */  nop
/* F0788 001F0688 10180000 */  mfhi       $3
/* F078C 001F068C 40110300 */  sll        $2, $3, 5
/* F0790 001F0690 23104300 */  subu       $2, $2, $3
/* F0794 001F0694 C0100200 */  sll        $2, $2, 3
/* F0798 001F0698 21108200 */  addu       $2, $4, $2
/* F079C 001F069C 00005384 */  lh         $19, 0x0($2)
/* F07A0 001F06A0 02005184 */  lh         $17, 0x2($2)
/* F07A4 001F06A4 17000010 */  b          .L001F0704
/* F07A8 001F06A8 00000000 */   nop
.L001F06AC:
/* F07AC 001F06AC 8494828F */  lw         $2, -0x6B7C($gp)
/* F07B0 001F06B0 04054324 */  addiu      $3, $2, 0x504
/* F07B4 001F06B4 F87F6324 */  addiu      $3, $3, 0x7FF8
/* F07B8 001F06B8 40110500 */  sll        $2, $5, 5
/* F07BC 001F06BC 21A06200 */  addu       $20, $3, $2
/* F07C0 001F06C0 10008012 */  beqz       $20, .L001F0704
/* F07C4 001F06C4 00000000 */   nop
/* F07C8 001F06C8 00009386 */  lh         $19, 0x0($20)
/* F07CC 001F06CC 0D00601A */  blez       $19, .L001F0704
/* F07D0 001F06D0 00000000 */   nop
/* F07D4 001F06D4 28268072 */  paddub     $4, $20, $0
/* F07D8 001F06D8 2C98080C */  jal        GetAttachVolumeForMsg__FP11ATTACH_LIST
/* F07DC 001F06DC 00000000 */   nop
/* F07E0 001F06E0 288E4070 */  paddub     $17, $2, $0
/* F07E4 001F06E4 00008386 */  lh         $3, 0x0($20)
/* F07E8 001F06E8 5A000224 */  addiu      $2, $0, 0x5A
/* F07EC 001F06EC 05006214 */  bne        $3, $2, .L001F0704
/* F07F0 001F06F0 00000000 */   nop
/* F07F4 001F06F4 02008486 */  lh         $4, 0x2($20)
/* F07F8 001F06F8 10AA080C */  jal        GetWeaponMsgNo2__Fi
/* F07FC 001F06FC 00000000 */   nop
/* F0800 001F0700 28964070 */  paddub     $18, $2, $0
.L001F0704:
/* F0804 001F0704 5100622A */  slti       $2, $19, 0x51
/* F0808 001F0708 08004014 */  bnez       $2, .L001F072C
/* F080C 001F070C 00000000 */   nop
/* F0810 001F0710 28266072 */  paddub     $4, $19, $0
/* F0814 001F0714 7443070C */  jal        GetCommonItemInfo__Fi
/* F0818 001F0718 00000000 */   nop
/* F081C 001F071C 03004010 */  beqz       $2, .L001F072C
/* F0820 001F0720 00000000 */   nop
/* F0824 001F0724 06004284 */  lh         $2, 0x6($2)
/* F0828 001F0728 F4015024 */  addiu      $16, $2, 0x1F4
.L001F072C:
/* F082C 001F072C DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* F0830 001F0730 0C3A228C */  lw         $2, (0x1DA3A0C & 0xFFFF)($at)
/* F0834 001F0734 0C005014 */  bne        $2, $16, .L001F0768
/* F0838 001F0738 00000000 */   nop
/* F083C 001F073C 0600401A */  blez       $18, .L001F0758
/* F0840 001F0740 00000000 */   nop
/* F0844 001F0744 DA01013C */  lui        $at, (0x1DA3A30 >> 16)
/* F0848 001F0748 303A238C */  lw         $3, (0x1DA3A30 & 0xFFFF)($at)
/* F084C 001F074C 64004226 */  addiu      $2, $18, 0x64
/* F0850 001F0750 05006214 */  bne        $3, $2, .L001F0768
/* F0854 001F0754 00000000 */   nop
.L001F0758:
/* F0858 001F0758 DA01013C */  lui        $at, (0x1DA3A78 >> 16)
/* F085C 001F075C 783A228C */  lw         $2, (0x1DA3A78 & 0xFFFF)($at)
/* F0860 001F0760 19005110 */  beq        $2, $17, .L001F07C8
/* F0864 001F0764 00000000 */   nop
.L001F0768:
/* F0868 001F0768 01000224 */  addiu      $2, $0, 0x1
/* F086C 001F076C DA01013C */  lui        $at, (0x1DA3A7C >> 16)
/* F0870 001F0770 7C3A22AC */  sw         $2, (0x1DA3A7C & 0xFFFF)($at)
/* F0874 001F0774 DA01013C */  lui        $at, (0x1DA3A80 >> 16)
/* F0878 001F0778 803A20AC */  sw         $0, (0x1DA3A80 & 0xFFFF)($at)
/* F087C 001F077C DA01013C */  lui        $at, (0x1DA3A78 >> 16)
/* F0880 001F0780 783A31AC */  sw         $17, (0x1DA3A78 & 0xFFFF)($at)
/* F0884 001F0784 0400401A */  blez       $18, .L001F0798
/* F0888 001F0788 00000000 */   nop
/* F088C 001F078C 64004226 */  addiu      $2, $18, 0x64
/* F0890 001F0790 DA01013C */  lui        $at, (0x1DA3A30 >> 16)
/* F0894 001F0794 303A22AC */  sw         $2, (0x1DA3A30 & 0xFFFF)($at)
.L001F0798:
/* F0898 001F0798 F501012A */  slti       $at, $16, 0x1F5
/* F089C 001F079C 02002010 */  beqz       $at, .L001F07A8
/* F08A0 001F07A0 00000000 */   nop
/* F08A4 001F07A4 28860070 */  paddub     $16, $0, $0
.L001F07A8:
/* F08A8 001F07A8 FFFF0224 */  addiu      $2, $0, -0x1
/* F08AC 001F07AC DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* F08B0 001F07B0 0C3A22AC */  sw         $2, (0x1DA3A0C & 0xFFFF)($at)
/* F08B4 001F07B4 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* F08B8 001F07B8 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* F08BC 001F07BC 282E0072 */  paddub     $5, $16, $0
/* F08C0 001F07C0 5441050C */  jal        MakeMesWin__6ClsMesFi
/* F08C4 001F07C4 00000000 */   nop
.L001F07C8:
/* F08C8 001F07C8 2816C072 */  paddub     $2, $22, $0
.L001F07CC:
/* F08CC 001F07CC 9000BF7B */  lq         $31, 0x90($sp)
/* F08D0 001F07D0 8000BE7B */  lq         $fp, 0x80($sp)
/* F08D4 001F07D4 7000B77B */  lq         $23, 0x70($sp)
/* F08D8 001F07D8 6000B67B */  lq         $22, 0x60($sp)
/* F08DC 001F07DC 5000B57B */  lq         $21, 0x50($sp)
/* F08E0 001F07E0 4000B47B */  lq         $20, 0x40($sp)
/* F08E4 001F07E4 3000B37B */  lq         $19, 0x30($sp)
/* F08E8 001F07E8 2000B27B */  lq         $18, 0x20($sp)
/* F08EC 001F07EC 1000B17B */  lq         $17, 0x10($sp)
/* F08F0 001F07F0 0000B07B */  lq         $16, 0x0($sp)
/* F08F4 001F07F4 A003BD27 */  addiu      $sp, $sp, 0x3A0
/* F08F8 001F07F8 0800E003 */  jr         $31
/* F08FC 001F07FC 00000000 */   nop
