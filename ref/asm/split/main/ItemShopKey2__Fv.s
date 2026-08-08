.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ItemShopKey2__Fv
/* 0EEE70 001EED70 60FCBD27 */  addiu       $29, $29, -0x3A0
/* 0EEE74 001EED74 9000BF7F */  sq          $31, 0x90($29)
/* 0EEE78 001EED78 8000BE7F */  sq          $30, 0x80($29)
/* 0EEE7C 001EED7C 7000B77F */  sq          $23, 0x70($29)
/* 0EEE80 001EED80 6000B67F */  sq          $22, 0x60($29)
/* 0EEE84 001EED84 5000B57F */  sq          $21, 0x50($29)
/* 0EEE88 001EED88 4000B47F */  sq          $20, 0x40($29)
/* 0EEE8C 001EED8C 3000B37F */  sq          $19, 0x30($29)
/* 0EEE90 001EED90 2000B27F */  sq          $18, 0x20($29)
/* 0EEE94 001EED94 1000B17F */  sq          $17, 0x10($29)
/* 0EEE98 001EED98 0000B07F */  sq          $16, 0x0($29)
/* 0EEE9C 001EED9C 28B60070 */  paddub      $22, $0, $0
/* 0EEEA0 001EEDA0 D901013C */  lui         $1, %hi(ShopMenu + 0x188)
/* 0EEEA4 001EEDA4 58022284 */  lh          $2, %lo(ShopMenu + 0x188)($1)
/* 0EEEA8 001EEDA8 0E004014 */  bnez        $2, .L001EEDE4
/* 0EEEAC 001EEDAC 00000000 */   nop
/* 0EEEB0 001EEDB0 8CFB040C */  jal         ReadBGSync__Fv
/* 0EEEB4 001EEDB4 00000000 */   nop
/* 0EEEB8 001EEDB8 83064014 */  bnez        $2, .L.L001F07C8$b
/* 0EEEBC 001EEDBC 00000000 */   nop
/* 0EEEC0 001EEDC0 349F070C */  jal         ShopTextureLoadFix__Fv
/* 0EEEC4 001EEDC4 00000000 */   nop
/* 0EEEC8 001EEDC8 D901013C */  lui         $1, %hi(ShopMenu)
/* 0EEECC 001EEDCC D0002584 */  lh          $5, %lo(ShopMenu)($1)
/* 0EEED0 001EEDD0 01000424 */  addiu       $4, $0, 0x1
/* 0EEED4 001EEDD4 E89F070C */  jal         ShopPersonReadStart__Fii
/* 0EEED8 001EEDD8 00000000 */   nop
/* 0EEEDC 001EEDDC 7A060010 */  b           .L.L001F07C8$b
/* 0EEEE0 001EEDE0 00000000 */   nop
.L001EEDE4:
/* 0EEEE4 001EEDE4 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0EEEE8 001EEDE8 50022484 */  lh          $4, %lo(ShopMenu + 0x180)($1)
/* 0EEEEC 001EEDEC 1A00812C */  sltiu       $1, $4, 0x1A
/* 0EEEF0 001EEDF0 75062010 */  beqz        $1, .L.L001F07C8$b
/* 0EEEF4 001EEDF4 00000000 */   nop
/* 0EEEF8 001EEDF8 2A00023C */  lui         $2, %hi(LIT_2794)
/* 0EEEFC 001EEDFC 70D34324 */  addiu       $3, $2, %lo(LIT_2794)
/* 0EEF00 001EEE00 80100400 */  sll         $2, $4, 2
/* 0EEF04 001EEE04 21104300 */  addu        $2, $2, $3
/* 0EEF08 001EEE08 0000428C */  lw          $2, 0x0($2)
/* 0EEF0C 001EEE0C 08004000 */  jr          $2
/* 0EEF10 001EEE10 00000000 */   nop
jlabel .L001EEE14
/* 0EEF14 001EEE14 D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0EEF18 001EEE18 5E022284 */  lh          $2, %lo(ShopMenu + 0x18E)($1)
/* 0EEF1C 001EEE1C 08004224 */  addiu       $2, $2, 0x8
/* 0EEF20 001EEE20 D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0EEF24 001EEE24 5E0222A4 */  sh          $2, %lo(ShopMenu + 0x18E)($1)
/* 0EEF28 001EEE28 D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0EEF2C 001EEE2C 5E022284 */  lh          $2, %lo(ShopMenu + 0x18E)($1)
/* 0EEF30 001EEE30 80004228 */  slti        $2, $2, 0x80
/* 0EEF34 001EEE34 04004014 */  bnez        $2, .L001EEE48
/* 0EEF38 001EEE38 00000000 */   nop
/* 0EEF3C 001EEE3C 80000224 */  addiu       $2, $0, 0x80
/* 0EEF40 001EEE40 D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0EEF44 001EEE44 5E0222A4 */  sh          $2, %lo(ShopMenu + 0x18E)($1)
.L001EEE48:
/* 0EEF48 001EEE48 D901013C */  lui         $1, %hi(ShopMenu + 0x184)
/* 0EEF4C 001EEE4C 5402228C */  lw          $2, %lo(ShopMenu + 0x184)($1)
/* 0EEF50 001EEE50 15004128 */  slti        $1, $2, 0x15
/* 0EEF54 001EEE54 5C062014 */  bnez        $1, .L.L001F07C8$b
/* 0EEF58 001EEE58 00000000 */   nop
/* 0EEF5C 001EEE5C D901013C */  lui         $1, %hi(ShopMenu + 0x188)
/* 0EEF60 001EEE60 58022284 */  lh          $2, %lo(ShopMenu + 0x188)($1)
/* 0EEF64 001EEE64 58064010 */  beqz        $2, .L.L001F07C8$b
/* 0EEF68 001EEE68 00000000 */   nop
/* 0EEF6C 001EEE6C D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0EEF70 001EEE70 5E022284 */  lh          $2, %lo(ShopMenu + 0x18E)($1)
/* 0EEF74 001EEE74 80004228 */  slti        $2, $2, 0x80
/* 0EEF78 001EEE78 53064014 */  bnez        $2, .L.L001F07C8$b
/* 0EEF7C 001EEE7C 00000000 */   nop
/* 0EEF80 001EEE80 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0EEF84 001EEE84 500220A4 */  sh          $0, %lo(ShopMenu + 0x180)($1)
/* 0EEF88 001EEE88 4F060010 */  b           .L.L001F07C8$b
/* 0EEF8C 001EEE8C 00000000 */   nop
jlabel .L001EEE90
/* 0EEF90 001EEE90 D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0EEF94 001EEE94 5E022284 */  lh          $2, %lo(ShopMenu + 0x18E)($1)
/* 0EEF98 001EEE98 F8FF4224 */  addiu       $2, $2, -0x8
/* 0EEF9C 001EEE9C D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0EEFA0 001EEEA0 5E0222A4 */  sh          $2, %lo(ShopMenu + 0x18E)($1)
/* 0EEFA4 001EEEA4 D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0EEFA8 001EEEA8 5E022284 */  lh          $2, %lo(ShopMenu + 0x18E)($1)
/* 0EEFAC 001EEEAC 0300401C */  bgtz        $2, .L001EEEBC
/* 0EEFB0 001EEEB0 00000000 */   nop
/* 0EEFB4 001EEEB4 D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0EEFB8 001EEEB8 5E0220A4 */  sh          $0, %lo(ShopMenu + 0x18E)($1)
.L001EEEBC:
/* 0EEFBC 001EEEBC D901013C */  lui         $1, %hi(ShopMenu + 0x184)
/* 0EEFC0 001EEEC0 5402228C */  lw          $2, %lo(ShopMenu + 0x184)($1)
/* 0EEFC4 001EEEC4 1B004128 */  slti        $1, $2, 0x1B
/* 0EEFC8 001EEEC8 3F062014 */  bnez        $1, .L.L001F07C8$b
/* 0EEFCC 001EEECC 00000000 */   nop
/* 0EEFD0 001EEED0 D901013C */  lui         $1, %hi(ShopMenu + 0x18E)
/* 0EEFD4 001EEED4 5E022284 */  lh          $2, %lo(ShopMenu + 0x18E)($1)
/* 0EEFD8 001EEED8 3B06401C */  bgtz        $2, .L.L001F07C8$b
/* 0EEFDC 001EEEDC 00000000 */   nop
/* 0EEFE0 001EEEE0 01001624 */  addiu       $22, $0, 0x1
/* 0EEFE4 001EEEE4 38060010 */  b           .L.L001F07C8$b
/* 0EEFE8 001EEEE8 00000000 */   nop
jlabel .L001EEEEC
/* 0EEFEC 001EEEEC CC01023C */  lui         $2, %hi(GamePad)
/* 0EEFF0 001EEEF0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EEFF4 001EEEF4 50000524 */  addiu       $5, $0, 0x50
/* 0EEFF8 001EEEF8 1CAE040C */  jal         Down__8CGamePadFi
/* 0EEFFC 001EEEFC 00000000 */   nop
/* 0EF000 001EEF00 6C004010 */  beqz        $2, .L001EF0B4
/* 0EF004 001EEF04 00000000 */   nop
/* 0EF008 001EEF08 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EF00C 001EEF0C E4003084 */  lh          $16, %lo(ShopMenu + 0x14)($1)
/* 0EF010 001EEF10 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0EF014 001EEF14 DC00238C */  lw          $3, %lo(ShopMenu + 0xC)($1)
/* 0EF018 001EEF18 01000224 */  addiu       $2, $0, 0x1
/* 0EF01C 001EEF1C 24006210 */  beq         $3, $2, .L001EEFB0
/* 0EF020 001EEF20 00000000 */   nop
/* 0EF024 001EEF24 02000224 */  addiu       $2, $0, 0x2
/* 0EF028 001EEF28 12006210 */  beq         $3, $2, .L001EEF74
/* 0EF02C 001EEF2C 00000000 */   nop
/* 0EF030 001EEF30 03006010 */  beqz        $3, .L001EEF40
/* 0EF034 001EEF34 00000000 */   nop
/* 0EF038 001EEF38 36000010 */  b           .L001EF014
/* 0EF03C 001EEF3C 00000000 */   nop
.L001EEF40:
/* 0EF040 001EEF40 8494828F */  lw          $2, -0x6B7C($28)
/* 0EF044 001EEF44 60434324 */  addiu       $3, $2, 0x4360
/* 0EF048 001EEF48 3C141000 */  dsll32      $2, $16, 16
/* 0EF04C 001EEF4C 3F140200 */  dsra32      $2, $2, 16
/* 0EF050 001EEF50 40100200 */  sll         $2, $2, 1
/* 0EF054 001EEF54 21184300 */  addu        $3, $2, $3
/* 0EF058 001EEF58 0E007184 */  lh          $17, 0xE($3)
/* 0EF05C 001EEF5C FFFF0224 */  addiu       $2, $0, -0x1
/* 0EF060 001EEF60 0E0062A4 */  sh          $2, 0xE($3)
/* 0EF064 001EEF64 DC0060A4 */  sh          $0, 0xDC($3)
/* 0EF068 001EEF68 9494938F */  lw          $19, -0x6B6C($28)
/* 0EF06C 001EEF6C 29000010 */  b           .L001EF014
/* 0EF070 001EEF70 00000000 */   nop
.L001EEF74:
/* 0EF074 001EEF74 8494828F */  lw          $2, -0x6B7C($28)
/* 0EF078 001EEF78 04054324 */  addiu       $3, $2, 0x504
/* 0EF07C 001EEF7C F87F6324 */  addiu       $3, $3, 0x7FF8
/* 0EF080 001EEF80 3C141000 */  dsll32      $2, $16, 16
/* 0EF084 001EEF84 3F140200 */  dsra32      $2, $2, 16
/* 0EF088 001EEF88 40110200 */  sll         $2, $2, 5
/* 0EF08C 001EEF8C 21206200 */  addu        $4, $3, $2
/* 0EF090 001EEF90 00009184 */  lh          $17, 0x0($4)
/* 0EF094 001EEF94 282E0070 */  paddub      $5, $0, $0
/* 0EF098 001EEF98 20000624 */  addiu       $6, $0, 0x20
/* 0EF09C 001EEF9C 5A0D040C */  jal         memset
/* 0EF0A0 001EEFA0 00000000 */   nop
/* 0EF0A4 001EEFA4 9C94938F */  lw          $19, -0x6B64($28)
/* 0EF0A8 001EEFA8 1A000010 */  b           .L001EF014
/* 0EF0AC 001EEFAC 00000000 */   nop
.L001EEFB0:
/* 0EF0B0 001EEFB0 8494848F */  lw          $4, -0x6B7C($28)
/* 0EF0B4 001EEFB4 3C2C1000 */  dsll32      $5, $16, 16
/* 0EF0B8 001EEFB8 3F2C0500 */  dsra32      $5, $5, 16
/* 0EF0BC 001EEFBC 0A000224 */  addiu       $2, $0, 0xA
/* 0EF0C0 001EEFC0 1A00A200 */  div         $0, $5, $2
/* 0EF0C4 001EEFC4 02004014 */  bnez        $2, .L001EEFD0
/* 0EF0C8 001EEFC8 00000000 */   nop
/* 0EF0CC 001EEFCC CD010000 */  break       0, 7
.L001EEFD0:
/* 0EF0D0 001EEFD0 12180000 */  mflo        $3
/* 0EF0D4 001EEFD4 A80A0224 */  addiu       $2, $0, 0xAA8
/* 0EF0D8 001EEFD8 18106200 */  mult        $2, $3, $2
/* 0EF0DC 001EEFDC 21108200 */  addu        $2, $4, $2
/* 0EF0E0 001EEFE0 0C454424 */  addiu       $4, $2, 0x450C
/* 0EF0E4 001EEFE4 0A000224 */  addiu       $2, $0, 0xA
/* 0EF0E8 001EEFE8 1A00A200 */  div         $0, $5, $2
/* 0EF0EC 001EEFEC 00000000 */  nop
/* 0EF0F0 001EEFF0 00000000 */  nop
/* 0EF0F4 001EEFF4 10180000 */  mfhi        $3
/* 0EF0F8 001EEFF8 40110300 */  sll         $2, $3, 5
/* 0EF0FC 001EEFFC 23104300 */  subu        $2, $2, $3
/* 0EF100 001EF000 C0100200 */  sll         $2, $2, 3
/* 0EF104 001EF004 21A08200 */  addu        $20, $4, $2
/* 0EF108 001EF008 00009186 */  lh          $17, 0x0($20)
/* 0EF10C 001EF00C 9894938F */  lw          $19, -0x6B68($28)
/* 0EF110 001EF010 00000000 */  nop
.L001EF014:
/* 0EF114 001EF014 28262072 */  paddub      $4, $17, $0
/* 0EF118 001EF018 01000524 */  addiu       $5, $0, 0x1
/* 0EF11C 001EF01C B4AC070C */  jal         CalItemMoney__Fii
/* 0EF120 001EF020 00000000 */   nop
/* 0EF124 001EF024 28964070 */  paddub      $18, $2, $0
/* 0EF128 001EF028 0101222A */  slti        $2, $17, 0x101
/* 0EF12C 001EF02C 0A004014 */  bnez        $2, .L001EF058
/* 0EF130 001EF030 00000000 */   nop
/* 0EF134 001EF034 28268072 */  paddub      $4, $20, $0
/* 0EF138 001EF038 C4AC070C */  jal         WeaponCalMoney__FP11WEAPON_HAVEi
/* 0EF13C 001EF03C 00000000 */   nop
/* 0EF140 001EF040 21904202 */  addu        $18, $18, $2
/* 0EF144 001EF044 28268072 */  paddub      $4, $20, $0
/* 0EF148 001EF048 282E0070 */  paddub      $5, $0, $0
/* 0EF14C 001EF04C F8000624 */  addiu       $6, $0, 0xF8
/* 0EF150 001EF050 5A0D040C */  jal         memset
/* 0EF154 001EF054 00000000 */   nop
.L001EF058:
/* 0EF158 001EF058 8494858F */  lw          $5, -0x6B7C($28)
/* 0EF15C 001EF05C 4643A294 */  lhu         $2, 0x4346($5)
/* 0EF160 001EF060 21205200 */  addu        $4, $2, $18
/* 0EF164 001EF064 FFFF0334 */  ori         $3, $0, 0xFFFF
/* 0EF168 001EF068 2A108300 */  slt         $2, $4, $3
/* 0EF16C 001EF06C 04004014 */  bnez        $2, .L001EF080
/* 0EF170 001EF070 00000000 */   nop
/* 0EF174 001EF074 4643A3A4 */  sh          $3, 0x4346($5)
/* 0EF178 001EF078 02000010 */  b           .L001EF084
/* 0EF17C 001EF07C 00000000 */   nop
.L001EF080:
/* 0EF180 001EF080 4643A4A4 */  sh          $4, 0x4346($5)
.L001EF084:
/* 0EF184 001EF084 3C141000 */  dsll32      $2, $16, 16
/* 0EF188 001EF088 3F140200 */  dsra32      $2, $2, 16
/* 0EF18C 001EF08C 80100200 */  sll         $2, $2, 2
/* 0EF190 001EF090 21106202 */  addu        $2, $19, $2
/* 0EF194 001EF094 000040AC */  sw          $0, 0x0($2)
/* 0EF198 001EF098 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0EF19C 001EF09C 500220A4 */  sh          $0, %lo(ShopMenu + 0x180)($1)
/* 0EF1A0 001EF0A0 9A000424 */  addiu       $4, $0, 0x9A
/* 0EF1A4 001EF0A4 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EF1A8 001EF0A8 00000000 */   nop
/* 0EF1AC 001EF0AC C6050010 */  b           .L.L001F07C8$b
/* 0EF1B0 001EF0B0 00000000 */   nop
.L001EF0B4:
/* 0EF1B4 001EF0B4 CC01023C */  lui         $2, %hi(GamePad)
/* 0EF1B8 001EF0B8 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EF1BC 001EF0BC 20000524 */  addiu       $5, $0, 0x20
/* 0EF1C0 001EF0C0 1CAE040C */  jal         Down__8CGamePadFi
/* 0EF1C4 001EF0C4 00000000 */   nop
/* 0EF1C8 001EF0C8 BF054010 */  beqz        $2, .L.L001F07C8$b
/* 0EF1CC 001EF0CC 00000000 */   nop
/* 0EF1D0 001EF0D0 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0EF1D4 001EF0D4 500220A4 */  sh          $0, %lo(ShopMenu + 0x180)($1)
/* 0EF1D8 001EF0D8 02000424 */  addiu       $4, $0, 0x2
/* 0EF1DC 001EF0DC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EF1E0 001EF0E0 00000000 */   nop
/* 0EF1E4 001EF0E4 B8050010 */  b           .L.L001F07C8$b
/* 0EF1E8 001EF0E8 00000000 */   nop
jlabel .L001EF0EC
/* 0EF1EC 001EF0EC DA01013C */  lui         $1, %hi(CommonMenuMes1 + 0x16BC)
/* 0EF1F0 001EF0F0 4C22228C */  lw          $2, %lo(CommonMenuMes1 + 0x16BC)($1)
/* 0EF1F4 001EF0F4 B4040524 */  addiu       $5, $0, 0x4B4
/* 0EF1F8 001EF0F8 05004510 */  beq         $2, $5, .L001EF110
/* 0EF1FC 001EF0FC 00000000 */   nop
/* 0EF200 001EF100 DA01023C */  lui         $2, %hi(CommonMenuMes1)
/* 0EF204 001EF104 900B4424 */  addiu       $4, $2, %lo(CommonMenuMes1)
/* 0EF208 001EF108 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0EF20C 001EF10C 00000000 */   nop
.L001EF110:
/* 0EF210 001EF110 CC01023C */  lui         $2, %hi(GamePad)
/* 0EF214 001EF114 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EF218 001EF118 50000524 */  addiu       $5, $0, 0x50
/* 0EF21C 001EF11C 1CAE040C */  jal         Down__8CGamePadFi
/* 0EF220 001EF120 00000000 */   nop
/* 0EF224 001EF124 D2004010 */  beqz        $2, .L001EF470
/* 0EF228 001EF128 00000000 */   nop
/* 0EF22C 001EF12C D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EF230 001EF130 E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0EF234 001EF134 80110300 */  sll         $2, $3, 6
/* 0EF238 001EF138 23104300 */  subu        $2, $2, $3
/* 0EF23C 001EF13C 80180200 */  sll         $3, $2, 2
/* 0EF240 001EF140 A094828F */  lw          $2, -0x6B60($28)
/* 0EF244 001EF144 21104300 */  addu        $2, $2, $3
/* 0EF248 001EF148 00005084 */  lh          $16, 0x0($2)
/* 0EF24C 001EF14C D901013C */  lui         $1, %hi(ShopDataMove + 0x6)
/* 0EF250 001EF150 86022284 */  lh          $2, %lo(ShopDataMove + 0x6)($1)
/* 0EF254 001EF154 1A004004 */  bltz        $2, .L001EF1C0
/* 0EF258 001EF158 00000000 */   nop
/* 0EF25C 001EF15C C4948587 */  lh          $5, -0x6B3C($28)
/* 0EF260 001EF160 D901023C */  lui         $2, %hi(ShopDataMove)
/* 0EF264 001EF164 80024424 */  addiu       $4, $2, %lo(ShopDataMove)
/* 0EF268 001EF168 01000624 */  addiu       $6, $0, 0x1
/* 0EF26C 001EF16C 689A070C */  jal         IconAutoMove__12ShopIconMoveFii
/* 0EF270 001EF170 00000000 */   nop
/* 0EF274 001EF174 FFFF0224 */  addiu       $2, $0, -0x1
/* 0EF278 001EF178 D901013C */  lui         $1, %hi(ShopDataMove + 0x2)
/* 0EF27C 001EF17C 820222A4 */  sh          $2, %lo(ShopDataMove + 0x2)($1)
/* 0EF280 001EF180 D901013C */  lui         $1, %hi(ShopDataMove + 0x4)
/* 0EF284 001EF184 840222A4 */  sh          $2, %lo(ShopDataMove + 0x4)($1)
/* 0EF288 001EF188 D901013C */  lui         $1, %hi(ShopDataMove + 0x6)
/* 0EF28C 001EF18C 860222A4 */  sh          $2, %lo(ShopDataMove + 0x6)($1)
/* 0EF290 001EF190 D901013C */  lui         $1, %hi(ShopDataMove + 0x10)
/* 0EF294 001EF194 900222A4 */  sh          $2, %lo(ShopDataMove + 0x10)($1)
/* 0EF298 001EF198 D901013C */  lui         $1, %hi(ShopDataMove + 0xC)
/* 0EF29C 001EF19C 8C0220AC */  sw          $0, %lo(ShopDataMove + 0xC)($1)
/* 0EF2A0 001EF1A0 D901013C */  lui         $1, %hi(ShopDataMove + 0x8)
/* 0EF2A4 001EF1A4 880220AC */  sw          $0, %lo(ShopDataMove + 0x8)($1)
/* 0EF2A8 001EF1A8 D901023C */  lui         $2, %hi(ShopDataMove + 0x14)
/* 0EF2AC 001EF1AC 94024424 */  addiu       $4, $2, %lo(ShopDataMove + 0x14)
/* 0EF2B0 001EF1B0 282E0070 */  paddub      $5, $0, $0
/* 0EF2B4 001EF1B4 F8000624 */  addiu       $6, $0, 0xF8
/* 0EF2B8 001EF1B8 5A0D040C */  jal         memset
/* 0EF2BC 001EF1BC 00000000 */   nop
.L001EF1C0:
/* 0EF2C0 001EF1C0 28260072 */  paddub      $4, $16, $0
/* 0EF2C4 001EF1C4 282E0070 */  paddub      $5, $0, $0
/* 0EF2C8 001EF1C8 B4AC070C */  jal         CalItemMoney__Fii
/* 0EF2CC 001EF1CC 00000000 */   nop
/* 0EF2D0 001EF1D0 288E4070 */  paddub      $17, $2, $0
/* 0EF2D4 001EF1D4 88C7080C */  jal         WhatIsKindofItem__Fi
/* 0EF2D8 001EF1D8 00000000 */   nop
/* 0EF2DC 001EF1DC 9403A2AF */  sw          $2, 0x394($29)
/* 0EF2E0 001EF1E0 28260072 */  paddub      $4, $16, $0
/* 0EF2E4 001EF1E4 9403A527 */  addiu       $5, $29, 0x394
/* 0EF2E8 001EF1E8 70C5080C */  jal         GetBoardSpace__FiPi
/* 0EF2EC 001EF1EC 00000000 */   nop
/* 0EF2F0 001EF1F0 28964070 */  paddub      $18, $2, $0
/* 0EF2F4 001EF1F4 D901013C */  lui         $1, %hi(ShopMenu + 0x20)
/* 0EF2F8 001EF1F8 F000238C */  lw          $3, %lo(ShopMenu + 0x20)($1)
/* 0EF2FC 001EF1FC 80100300 */  sll         $2, $3, 2
/* 0EF300 001EF200 21104300 */  addu        $2, $2, $3
/* 0EF304 001EF204 23A04202 */  subu        $20, $18, $2
/* 0EF308 001EF208 9403A38F */  lw          $3, 0x394($29)
/* 0EF30C 001EF20C 02000224 */  addiu       $2, $0, 0x2
/* 0EF310 001EF210 23006210 */  beq         $3, $2, .L001EF2A0
/* 0EF314 001EF214 00000000 */   nop
/* 0EF318 001EF218 01000224 */  addiu       $2, $0, 0x1
/* 0EF31C 001EF21C 11006210 */  beq         $3, $2, .L001EF264
/* 0EF320 001EF220 00000000 */   nop
/* 0EF324 001EF224 03006010 */  beqz        $3, .L001EF234
/* 0EF328 001EF228 00000000 */   nop
/* 0EF32C 001EF22C 2A000010 */  b           .L001EF2D8
/* 0EF330 001EF230 00000000 */   nop
.L001EF234:
/* 0EF334 001EF234 A094848F */  lw          $4, -0x6B60($28)
/* 0EF338 001EF238 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EF33C 001EF23C E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0EF340 001EF240 80110300 */  sll         $2, $3, 6
/* 0EF344 001EF244 23104300 */  subu        $2, $2, $3
/* 0EF348 001EF248 80100200 */  sll         $2, $2, 2
/* 0EF34C 001EF24C 21104400 */  addu        $2, $2, $4
/* 0EF350 001EF250 0400428C */  lw          $2, 0x4($2)
/* 0EF354 001EF254 A000A2AF */  sw          $2, 0xA0($29)
/* 0EF358 001EF258 9494938F */  lw          $19, -0x6B6C($28)
/* 0EF35C 001EF25C 1E000010 */  b           .L001EF2D8
/* 0EF360 001EF260 00000000 */   nop
.L001EF264:
/* 0EF364 001EF264 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EF368 001EF268 E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0EF36C 001EF26C 80110300 */  sll         $2, $3, 6
/* 0EF370 001EF270 23104300 */  subu        $2, $2, $3
/* 0EF374 001EF274 80180200 */  sll         $3, $2, 2
/* 0EF378 001EF278 A094828F */  lw          $2, -0x6B60($28)
/* 0EF37C 001EF27C 21104300 */  addu        $2, $2, $3
/* 0EF380 001EF280 A000A427 */  addiu       $4, $29, 0xA0
/* 0EF384 001EF284 04004524 */  addiu       $5, $2, 0x4
/* 0EF388 001EF288 F8000624 */  addiu       $6, $0, 0xF8
/* 0EF38C 001EF28C EC0C040C */  jal         memcpy
/* 0EF390 001EF290 00000000 */   nop
/* 0EF394 001EF294 9894938F */  lw          $19, -0x6B68($28)
/* 0EF398 001EF298 0F000010 */  b           .L001EF2D8
/* 0EF39C 001EF29C 00000000 */   nop
.L001EF2A0:
/* 0EF3A0 001EF2A0 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EF3A4 001EF2A4 E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0EF3A8 001EF2A8 80110300 */  sll         $2, $3, 6
/* 0EF3AC 001EF2AC 23104300 */  subu        $2, $2, $3
/* 0EF3B0 001EF2B0 80180200 */  sll         $3, $2, 2
/* 0EF3B4 001EF2B4 A094828F */  lw          $2, -0x6B60($28)
/* 0EF3B8 001EF2B8 21104300 */  addu        $2, $2, $3
/* 0EF3BC 001EF2BC A000A427 */  addiu       $4, $29, 0xA0
/* 0EF3C0 001EF2C0 04004524 */  addiu       $5, $2, 0x4
/* 0EF3C4 001EF2C4 20000624 */  addiu       $6, $0, 0x20
/* 0EF3C8 001EF2C8 EC0C040C */  jal         memcpy
/* 0EF3CC 001EF2CC 00000000 */   nop
/* 0EF3D0 001EF2D0 9C94938F */  lw          $19, -0x6B64($28)
/* 0EF3D4 001EF2D4 00000000 */  nop
.L001EF2D8:
/* 0EF3D8 001EF2D8 9403A28F */  lw          $2, 0x394($29)
/* 0EF3DC 001EF2DC D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0EF3E0 001EF2E0 DC0022AC */  sw          $2, %lo(ShopMenu + 0xC)($1)
/* 0EF3E4 001EF2E4 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EF3E8 001EF2E8 E400248C */  lw          $4, %lo(ShopMenu + 0x14)($1)
/* 0EF3EC 001EF2EC 05000224 */  addiu       $2, $0, 0x5
/* 0EF3F0 001EF2F0 1A008200 */  div         $0, $4, $2
/* 0EF3F4 001EF2F4 02004014 */  bnez        $2, .L001EF300
/* 0EF3F8 001EF2F8 00000000 */   nop
/* 0EF3FC 001EF2FC CD010000 */  break       0, 7
.L001EF300:
/* 0EF400 001EF300 12180000 */  mflo        $3
/* 0EF404 001EF304 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0EF408 001EF308 46022290 */  lbu         $2, %lo(ShopMenu + 0x176)($1)
/* 0EF40C 001EF30C 23286200 */  subu        $5, $3, $2
/* 0EF410 001EF310 05000224 */  addiu       $2, $0, 0x5
/* 0EF414 001EF314 1A008200 */  div         $0, $4, $2
/* 0EF418 001EF318 00000000 */  nop
/* 0EF41C 001EF31C 00000000 */  nop
/* 0EF420 001EF320 10180000 */  mfhi        $3
/* 0EF424 001EF324 80100300 */  sll         $2, $3, 2
/* 0EF428 001EF328 21104300 */  addu        $2, $2, $3
/* 0EF42C 001EF32C C0100200 */  sll         $2, $2, 3
/* 0EF430 001EF330 34004324 */  addiu       $3, $2, 0x34
/* 0EF434 001EF334 80100500 */  sll         $2, $5, 2
/* 0EF438 001EF338 21104500 */  addu        $2, $2, $5
/* 0EF43C 001EF33C C0100200 */  sll         $2, $2, 3
/* 0EF440 001EF340 94004224 */  addiu       $2, $2, 0x94
/* 0EF444 001EF344 00008344 */  mtc1        $3, $f0
/* 0EF448 001EF348 00000000 */  nop
/* 0EF44C 001EF34C 20038046 */  cvt.s.w     $f12, $f0
/* 0EF450 001EF350 00008244 */  mtc1        $2, $f0
/* 0EF454 001EF354 00000000 */  nop
/* 0EF458 001EF358 60038046 */  cvt.s.w     $f13, $f0
/* 0EF45C 001EF35C D901023C */  lui         $2, %hi(ShopDataMove)
/* 0EF460 001EF360 80024424 */  addiu       $4, $2, %lo(ShopDataMove)
/* 0EF464 001EF364 282E4072 */  paddub      $5, $18, $0
/* 0EF468 001EF368 28368072 */  paddub      $6, $20, $0
/* 0EF46C 001EF36C 283E0072 */  paddub      $7, $16, $0
/* 0EF470 001EF370 A000A827 */  addiu       $8, $29, 0xA0
/* 0EF474 001EF374 284E0070 */  paddub      $9, $0, $0
/* 0EF478 001EF378 4C9A070C */  jal         IconMoveTarSet__12ShopIconMoveFiiiP13MENU_ITEMDATAffi
/* 0EF47C 001EF37C 00000000 */   nop
/* 0EF480 001EF380 04008006 */  bltz        $20, .L001EF394
/* 0EF484 001EF384 00000000 */   nop
/* 0EF488 001EF388 1400822A */  slti        $2, $20, 0x14
/* 0EF48C 001EF38C 1A004014 */  bnez        $2, .L001EF3F8
/* 0EF490 001EF390 00000000 */   nop
.L001EF394:
/* 0EF494 001EF394 C4948587 */  lh          $5, -0x6B3C($28)
/* 0EF498 001EF398 D901023C */  lui         $2, %hi(ShopDataMove)
/* 0EF49C 001EF39C 80024424 */  addiu       $4, $2, %lo(ShopDataMove)
/* 0EF4A0 001EF3A0 01000624 */  addiu       $6, $0, 0x1
/* 0EF4A4 001EF3A4 689A070C */  jal         IconAutoMove__12ShopIconMoveFii
/* 0EF4A8 001EF3A8 00000000 */   nop
/* 0EF4AC 001EF3AC FFFF0224 */  addiu       $2, $0, -0x1
/* 0EF4B0 001EF3B0 D901013C */  lui         $1, %hi(ShopDataMove + 0x2)
/* 0EF4B4 001EF3B4 820222A4 */  sh          $2, %lo(ShopDataMove + 0x2)($1)
/* 0EF4B8 001EF3B8 D901013C */  lui         $1, %hi(ShopDataMove + 0x4)
/* 0EF4BC 001EF3BC 840222A4 */  sh          $2, %lo(ShopDataMove + 0x4)($1)
/* 0EF4C0 001EF3C0 D901013C */  lui         $1, %hi(ShopDataMove + 0x6)
/* 0EF4C4 001EF3C4 860222A4 */  sh          $2, %lo(ShopDataMove + 0x6)($1)
/* 0EF4C8 001EF3C8 D901013C */  lui         $1, %hi(ShopDataMove + 0x10)
/* 0EF4CC 001EF3CC 900222A4 */  sh          $2, %lo(ShopDataMove + 0x10)($1)
/* 0EF4D0 001EF3D0 D901013C */  lui         $1, %hi(ShopDataMove + 0xC)
/* 0EF4D4 001EF3D4 8C0220AC */  sw          $0, %lo(ShopDataMove + 0xC)($1)
/* 0EF4D8 001EF3D8 D901013C */  lui         $1, %hi(ShopDataMove + 0x8)
/* 0EF4DC 001EF3DC 880220AC */  sw          $0, %lo(ShopDataMove + 0x8)($1)
/* 0EF4E0 001EF3E0 D901023C */  lui         $2, %hi(ShopDataMove + 0x14)
/* 0EF4E4 001EF3E4 94024424 */  addiu       $4, $2, %lo(ShopDataMove + 0x14)
/* 0EF4E8 001EF3E8 282E0070 */  paddub      $5, $0, $0
/* 0EF4EC 001EF3EC F8000624 */  addiu       $6, $0, 0xF8
/* 0EF4F0 001EF3F0 5A0D040C */  jal         memset
/* 0EF4F4 001EF3F4 00000000 */   nop
.L001EF3F8:
/* 0EF4F8 001EF3F8 02000324 */  addiu       $3, $0, 0x2
/* 0EF4FC 001EF3FC 80101200 */  sll         $2, $18, 2
/* 0EF500 001EF400 21106202 */  addu        $2, $19, $2
/* 0EF504 001EF404 000043AC */  sw          $3, 0x0($2)
/* 0EF508 001EF408 B8BA080C */  jal         PersonalBoardLimmitCheck__Fv
/* 0EF50C 001EF40C 00000000 */   nop
/* 0EF510 001EF410 88AE070C */  jal         ShopSpecialFunc__Fv
/* 0EF514 001EF414 00000000 */   nop
/* 0EF518 001EF418 8494858F */  lw          $5, -0x6B7C($28)
/* 0EF51C 001EF41C 4643A494 */  lhu         $4, 0x4346($5)
/* 0EF520 001EF420 23109100 */  subu        $2, $4, $17
/* 0EF524 001EF424 FFFF0334 */  ori         $3, $0, 0xFFFF
/* 0EF528 001EF428 2A104300 */  slt         $2, $2, $3
/* 0EF52C 001EF42C 04004014 */  bnez        $2, .L001EF440
/* 0EF530 001EF430 00000000 */   nop
/* 0EF534 001EF434 4643A3A4 */  sh          $3, 0x4346($5)
/* 0EF538 001EF438 04000010 */  b           .L001EF44C
/* 0EF53C 001EF43C 00000000 */   nop
.L001EF440:
/* 0EF540 001EF440 23101100 */  negu        $2, $17
/* 0EF544 001EF444 21108200 */  addu        $2, $4, $2
/* 0EF548 001EF448 4643A2A4 */  sh          $2, 0x4346($5)
.L001EF44C:
/* 0EF54C 001EF44C 28260070 */  paddub      $4, $0, $0
/* 0EF550 001EF450 282E0070 */  paddub      $5, $0, $0
/* 0EF554 001EF454 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EF558 001EF458 00000000 */   nop
/* 0EF55C 001EF45C 9A000424 */  addiu       $4, $0, 0x9A
/* 0EF560 001EF460 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EF564 001EF464 00000000 */   nop
/* 0EF568 001EF468 D7040010 */  b           .L.L001F07C8$b
/* 0EF56C 001EF46C 00000000 */   nop
.L001EF470:
/* 0EF570 001EF470 CC01023C */  lui         $2, %hi(GamePad)
/* 0EF574 001EF474 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EF578 001EF478 20000524 */  addiu       $5, $0, 0x20
/* 0EF57C 001EF47C 1CAE040C */  jal         Down__8CGamePadFi
/* 0EF580 001EF480 00000000 */   nop
/* 0EF584 001EF484 D0044010 */  beqz        $2, .L.L001F07C8$b
/* 0EF588 001EF488 00000000 */   nop
/* 0EF58C 001EF48C 28260070 */  paddub      $4, $0, $0
/* 0EF590 001EF490 282E0070 */  paddub      $5, $0, $0
/* 0EF594 001EF494 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EF598 001EF498 00000000 */   nop
/* 0EF59C 001EF49C 02000424 */  addiu       $4, $0, 0x2
/* 0EF5A0 001EF4A0 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EF5A4 001EF4A4 00000000 */   nop
/* 0EF5A8 001EF4A8 C7040010 */  b           .L.L001F07C8$b
/* 0EF5AC 001EF4AC 00000000 */   nop
jlabel .L001EF4B0
/* 0EF5B0 001EF4B0 01000224 */  addiu       $2, $0, 0x1
/* 0EF5B4 001EF4B4 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0EF5B8 001EF4B8 D45122AC */  sw          $2, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0EF5BC 001EF4BC CC01023C */  lui         $2, %hi(GamePad)
/* 0EF5C0 001EF4C0 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EF5C4 001EF4C4 40000524 */  addiu       $5, $0, 0x40
/* 0EF5C8 001EF4C8 1CAE040C */  jal         Down__8CGamePadFi
/* 0EF5CC 001EF4CC 00000000 */   nop
/* 0EF5D0 001EF4D0 0C004010 */  beqz        $2, .L001EF504
/* 0EF5D4 001EF4D4 00000000 */   nop
/* 0EF5D8 001EF4D8 28260070 */  paddub      $4, $0, $0
/* 0EF5DC 001EF4DC 282E0070 */  paddub      $5, $0, $0
/* 0EF5E0 001EF4E0 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EF5E4 001EF4E4 00000000 */   nop
/* 0EF5E8 001EF4E8 01000424 */  addiu       $4, $0, 0x1
/* 0EF5EC 001EF4EC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EF5F0 001EF4F0 00000000 */   nop
/* 0EF5F4 001EF4F4 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0EF5F8 001EF4F8 D45120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0EF5FC 001EF4FC B2040010 */  b           .L.L001F07C8$b
/* 0EF600 001EF500 00000000 */   nop
.L001EF504:
/* 0EF604 001EF504 CC01023C */  lui         $2, %hi(GamePad)
/* 0EF608 001EF508 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EF60C 001EF50C 20000524 */  addiu       $5, $0, 0x20
/* 0EF610 001EF510 1CAE040C */  jal         Down__8CGamePadFi
/* 0EF614 001EF514 00000000 */   nop
/* 0EF618 001EF518 AB044010 */  beqz        $2, .L.L001F07C8$b
/* 0EF61C 001EF51C 00000000 */   nop
/* 0EF620 001EF520 02000424 */  addiu       $4, $0, 0x2
/* 0EF624 001EF524 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EF628 001EF528 00000000 */   nop
/* 0EF62C 001EF52C DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0EF630 001EF530 D45120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0EF634 001EF534 28260070 */  paddub      $4, $0, $0
/* 0EF638 001EF538 282E0070 */  paddub      $5, $0, $0
/* 0EF63C 001EF53C 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EF640 001EF540 00000000 */   nop
/* 0EF644 001EF544 E4B3070C */  jal         ShopCancelGoodReturn2__Fv
/* 0EF648 001EF548 00000000 */   nop
/* 0EF64C 001EF54C 9E040010 */  b           .L.L001F07C8$b
/* 0EF650 001EF550 00000000 */   nop
jlabel .L001EF554
/* 0EF654 001EF554 CC01023C */  lui         $2, %hi(GamePad)
/* 0EF658 001EF558 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EF65C 001EF55C 60000524 */  addiu       $5, $0, 0x60
/* 0EF660 001EF560 1CAE040C */  jal         Down__8CGamePadFi
/* 0EF664 001EF564 00000000 */   nop
/* 0EF668 001EF568 97044010 */  beqz        $2, .L.L001F07C8$b
/* 0EF66C 001EF56C 00000000 */   nop
/* 0EF670 001EF570 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0EF674 001EF574 500220A4 */  sh          $0, %lo(ShopMenu + 0x180)($1)
/* 0EF678 001EF578 B894828F */  lw          $2, -0x6B48($28)
/* 0EF67C 001EF57C 10005084 */  lh          $16, 0x10($2)
/* 0EF680 001EF580 28260072 */  paddub      $4, $16, $0
/* 0EF684 001EF584 9803A527 */  addiu       $5, $29, 0x398
/* 0EF688 001EF588 70C5080C */  jal         GetBoardSpace__FiPi
/* 0EF68C 001EF58C 00000000 */   nop
/* 0EF690 001EF590 06004104 */  bgez        $2, .L001EF5AC
/* 0EF694 001EF594 00000000 */   nop
/* 0EF698 001EF598 02000424 */  addiu       $4, $0, 0x2
/* 0EF69C 001EF59C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EF6A0 001EF5A0 00000000 */   nop
/* 0EF6A4 001EF5A4 88040010 */  b           .L.L001F07C8$b
/* 0EF6A8 001EF5A8 00000000 */   nop
.L001EF5AC:
/* 0EF6AC 001EF5AC 8494878F */  lw          $7, -0x6B7C($28)
/* 0EF6B0 001EF5B0 6043E524 */  addiu       $5, $7, 0x4360
/* 0EF6B4 001EF5B4 0405E624 */  addiu       $6, $7, 0x504
/* 0EF6B8 001EF5B8 F87FC624 */  addiu       $6, $6, 0x7FF8
/* 0EF6BC 001EF5BC 9803A48F */  lw          $4, 0x398($29)
/* 0EF6C0 001EF5C0 02000324 */  addiu       $3, $0, 0x2
/* 0EF6C4 001EF5C4 35008310 */  beq         $4, $3, .L001EF69C
/* 0EF6C8 001EF5C8 00000000 */   nop
/* 0EF6CC 001EF5CC 01000324 */  addiu       $3, $0, 0x1
/* 0EF6D0 001EF5D0 0D008310 */  beq         $4, $3, .L001EF608
/* 0EF6D4 001EF5D4 00000000 */   nop
/* 0EF6D8 001EF5D8 03008010 */  beqz        $4, .L001EF5E8
/* 0EF6DC 001EF5DC 00000000 */   nop
/* 0EF6E0 001EF5E0 36000010 */  b           .L001EF6BC
/* 0EF6E4 001EF5E4 00000000 */   nop
.L001EF5E8:
/* 0EF6E8 001EF5E8 40100200 */  sll         $2, $2, 1
/* 0EF6EC 001EF5EC 21184500 */  addu        $3, $2, $5
/* 0EF6F0 001EF5F0 0E0070A4 */  sh          $16, 0xE($3)
/* 0EF6F4 001EF5F4 B894828F */  lw          $2, -0x6B48($28)
/* 0EF6F8 001EF5F8 12004284 */  lh          $2, 0x12($2)
/* 0EF6FC 001EF5FC DC0062A4 */  sh          $2, 0xDC($3)
/* 0EF700 001EF600 2E000010 */  b           .L001EF6BC
/* 0EF704 001EF604 00000000 */   nop
.L001EF608:
/* 0EF708 001EF608 0A000324 */  addiu       $3, $0, 0xA
/* 0EF70C 001EF60C 1A004300 */  div         $0, $2, $3
/* 0EF710 001EF610 02006014 */  bnez        $3, .L001EF61C
/* 0EF714 001EF614 00000000 */   nop
/* 0EF718 001EF618 CD010000 */  break       0, 7
.L001EF61C:
/* 0EF71C 001EF61C 12880000 */  mflo        $17
/* 0EF720 001EF620 0A000324 */  addiu       $3, $0, 0xA
/* 0EF724 001EF624 1A004300 */  div         $0, $2, $3
/* 0EF728 001EF628 00000000 */  nop
/* 0EF72C 001EF62C 00000000 */  nop
/* 0EF730 001EF630 10900000 */  mfhi        $18
/* 0EF734 001EF634 A80A0224 */  addiu       $2, $0, 0xAA8
/* 0EF738 001EF638 18102202 */  mult        $2, $17, $2
/* 0EF73C 001EF63C 2110E200 */  addu        $2, $7, $2
/* 0EF740 001EF640 0C454324 */  addiu       $3, $2, 0x450C
/* 0EF744 001EF644 40111200 */  sll         $2, $18, 5
/* 0EF748 001EF648 23105200 */  subu        $2, $2, $18
/* 0EF74C 001EF64C C0100200 */  sll         $2, $2, 3
/* 0EF750 001EF650 21986200 */  addu        $19, $3, $2
/* 0EF754 001EF654 28266072 */  paddub      $4, $19, $0
/* 0EF758 001EF658 BC94858F */  lw          $5, -0x6B44($28)
/* 0EF75C 001EF65C F8000624 */  addiu       $6, $0, 0xF8
/* 0EF760 001EF660 EC0C040C */  jal         memcpy
/* 0EF764 001EF664 00000000 */   nop
/* 0EF768 001EF668 000070A6 */  sh          $16, 0x0($19)
/* 0EF76C 001EF66C D901013C */  lui         $1, %hi(ShopMenu + 0x164)
/* 0EF770 001EF670 3402228C */  lw          $2, %lo(ShopMenu + 0x164)($1)
/* 0EF774 001EF674 11004004 */  bltz        $2, .L001EF6BC
/* 0EF778 001EF678 00000000 */   nop
/* 0EF77C 001EF67C 8494828F */  lw          $2, -0x6B7C($28)
/* 0EF780 001EF680 21102202 */  addu        $2, $17, $2
/* 0EF784 001EF684 404352A0 */  sb          $18, 0x4340($2)
/* 0EF788 001EF688 FFFF0224 */  addiu       $2, $0, -0x1
/* 0EF78C 001EF68C D901013C */  lui         $1, %hi(ShopMenu + 0x164)
/* 0EF790 001EF690 340222AC */  sw          $2, %lo(ShopMenu + 0x164)($1)
/* 0EF794 001EF694 09000010 */  b           .L001EF6BC
/* 0EF798 001EF698 00000000 */   nop
.L001EF69C:
/* 0EF79C 001EF69C 40110200 */  sll         $2, $2, 5
/* 0EF7A0 001EF6A0 2188C200 */  addu        $17, $6, $2
/* 0EF7A4 001EF6A4 28262072 */  paddub      $4, $17, $0
/* 0EF7A8 001EF6A8 C094858F */  lw          $5, -0x6B40($28)
/* 0EF7AC 001EF6AC 20000624 */  addiu       $6, $0, 0x20
/* 0EF7B0 001EF6B0 EC0C040C */  jal         memcpy
/* 0EF7B4 001EF6B4 00000000 */   nop
/* 0EF7B8 001EF6B8 000030A6 */  sh          $16, 0x0($17)
.L001EF6BC:
/* 0EF7BC 001EF6BC F49B070C */  jal         InitAllHaveData__Fv
/* 0EF7C0 001EF6C0 00000000 */   nop
/* 0EF7C4 001EF6C4 02000424 */  addiu       $4, $0, 0x2
/* 0EF7C8 001EF6C8 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EF7CC 001EF6CC 00000000 */   nop
/* 0EF7D0 001EF6D0 3D040010 */  b           .L.L001F07C8$b
/* 0EF7D4 001EF6D4 00000000 */   nop
jlabel .L001EF6D8
/* 0EF7D8 001EF6D8 CC01023C */  lui         $2, %hi(GamePad)
/* 0EF7DC 001EF6DC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EF7E0 001EF6E0 60F00534 */  ori         $5, $0, 0xF060
/* 0EF7E4 001EF6E4 1CAE040C */  jal         Down__8CGamePadFi
/* 0EF7E8 001EF6E8 00000000 */   nop
/* 0EF7EC 001EF6EC 36044010 */  beqz        $2, .L.L001F07C8$b
/* 0EF7F0 001EF6F0 00000000 */   nop
/* 0EF7F4 001EF6F4 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0EF7F8 001EF6F8 500220A4 */  sh          $0, %lo(ShopMenu + 0x180)($1)
/* 0EF7FC 001EF6FC DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0EF800 001EF700 D45120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0EF804 001EF704 30040010 */  b           .L.L001F07C8$b
/* 0EF808 001EF708 00000000 */   nop
jlabel .L001EF70C
/* 0EF80C 001EF70C 01000224 */  addiu       $2, $0, 0x1
/* 0EF810 001EF710 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0EF814 001EF714 D45122AC */  sw          $2, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0EF818 001EF718 CC01023C */  lui         $2, %hi(GamePad)
/* 0EF81C 001EF71C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EF820 001EF720 60000524 */  addiu       $5, $0, 0x60
/* 0EF824 001EF724 1CAE040C */  jal         Down__8CGamePadFi
/* 0EF828 001EF728 00000000 */   nop
/* 0EF82C 001EF72C 26044010 */  beqz        $2, .L.L001F07C8$b
/* 0EF830 001EF730 00000000 */   nop
/* 0EF834 001EF734 02000424 */  addiu       $4, $0, 0x2
/* 0EF838 001EF738 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EF83C 001EF73C 00000000 */   nop
/* 0EF840 001EF740 28260070 */  paddub      $4, $0, $0
/* 0EF844 001EF744 282E0070 */  paddub      $5, $0, $0
/* 0EF848 001EF748 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EF84C 001EF74C 00000000 */   nop
/* 0EF850 001EF750 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0EF854 001EF754 D45120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0EF858 001EF758 1B040010 */  b           .L.L001F07C8$b
/* 0EF85C 001EF75C 00000000 */   nop
jlabel .L001EF760
/* 0EF860 001EF760 01000224 */  addiu       $2, $0, 0x1
/* 0EF864 001EF764 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0EF868 001EF768 D45122AC */  sw          $2, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0EF86C 001EF76C CC01023C */  lui         $2, %hi(GamePad)
/* 0EF870 001EF770 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EF874 001EF774 60000524 */  addiu       $5, $0, 0x60
/* 0EF878 001EF778 1CAE040C */  jal         Down__8CGamePadFi
/* 0EF87C 001EF77C 00000000 */   nop
/* 0EF880 001EF780 11044010 */  beqz        $2, .L.L001F07C8$b
/* 0EF884 001EF784 00000000 */   nop
/* 0EF888 001EF788 02000424 */  addiu       $4, $0, 0x2
/* 0EF88C 001EF78C D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0EF890 001EF790 500224A4 */  sh          $4, %lo(ShopMenu + 0x180)($1)
/* 0EF894 001EF794 D901013C */  lui         $1, %hi(ShopMenu + 0x184)
/* 0EF898 001EF798 540220AC */  sw          $0, %lo(ShopMenu + 0x184)($1)
/* 0EF89C 001EF79C DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0EF8A0 001EF7A0 D45120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0EF8A4 001EF7A4 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EF8A8 001EF7A8 00000000 */   nop
/* 0EF8AC 001EF7AC 06040010 */  b           .L.L001F07C8$b
/* 0EF8B0 001EF7B0 00000000 */   nop
jlabel .L001EF7B4
/* 0EF8B4 001EF7B4 01000224 */  addiu       $2, $0, 0x1
/* 0EF8B8 001EF7B8 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0EF8BC 001EF7BC D45122AC */  sw          $2, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0EF8C0 001EF7C0 CC01023C */  lui         $2, %hi(GamePad)
/* 0EF8C4 001EF7C4 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EF8C8 001EF7C8 40000524 */  addiu       $5, $0, 0x40
/* 0EF8CC 001EF7CC 1CAE040C */  jal         Down__8CGamePadFi
/* 0EF8D0 001EF7D0 00000000 */   nop
/* 0EF8D4 001EF7D4 0C004010 */  beqz        $2, .L001EF808
/* 0EF8D8 001EF7D8 00000000 */   nop
/* 0EF8DC 001EF7DC 28260070 */  paddub      $4, $0, $0
/* 0EF8E0 001EF7E0 282E0070 */  paddub      $5, $0, $0
/* 0EF8E4 001EF7E4 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EF8E8 001EF7E8 00000000 */   nop
/* 0EF8EC 001EF7EC DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0EF8F0 001EF7F0 D45120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0EF8F4 001EF7F4 01000424 */  addiu       $4, $0, 0x1
/* 0EF8F8 001EF7F8 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EF8FC 001EF7FC 00000000 */   nop
/* 0EF900 001EF800 F1030010 */  b           .L.L001F07C8$b
/* 0EF904 001EF804 00000000 */   nop
.L001EF808:
/* 0EF908 001EF808 CC01023C */  lui         $2, %hi(GamePad)
/* 0EF90C 001EF80C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EF910 001EF810 20000524 */  addiu       $5, $0, 0x20
/* 0EF914 001EF814 1CAE040C */  jal         Down__8CGamePadFi
/* 0EF918 001EF818 00000000 */   nop
/* 0EF91C 001EF81C EA034010 */  beqz        $2, .L.L001F07C8$b
/* 0EF920 001EF820 00000000 */   nop
/* 0EF924 001EF824 19000424 */  addiu       $4, $0, 0x19
/* 0EF928 001EF828 01000524 */  addiu       $5, $0, 0x1
/* 0EF92C 001EF82C 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EF930 001EF830 00000000 */   nop
/* 0EF934 001EF834 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16C4)
/* 0EF938 001EF838 D45120AC */  sw          $0, %lo(CommonMenuMes3 + 0x16C4)($1)
/* 0EF93C 001EF83C 2826A070 */  paddub      $4, $5, $0
/* 0EF940 001EF840 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EF944 001EF844 00000000 */   nop
/* 0EF948 001EF848 DF030010 */  b           .L.L001F07C8$b
/* 0EF94C 001EF84C 00000000 */   nop
jlabel .L001EF850
/* 0EF950 001EF850 CC01023C */  lui         $2, %hi(GamePad)
/* 0EF954 001EF854 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EF958 001EF858 40000524 */  addiu       $5, $0, 0x40
/* 0EF95C 001EF85C 1CAE040C */  jal         Down__8CGamePadFi
/* 0EF960 001EF860 00000000 */   nop
/* 0EF964 001EF864 0C004010 */  beqz        $2, .L001EF898
/* 0EF968 001EF868 00000000 */   nop
/* 0EF96C 001EF86C 14000424 */  addiu       $4, $0, 0x14
/* 0EF970 001EF870 01000524 */  addiu       $5, $0, 0x1
/* 0EF974 001EF874 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EF978 001EF878 00000000 */   nop
/* 0EF97C 001EF87C 80AD070C */  jal         IncludeBuyItem2__Fv
/* 0EF980 001EF880 00000000 */   nop
/* 0EF984 001EF884 9A000424 */  addiu       $4, $0, 0x9A
/* 0EF988 001EF888 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EF98C 001EF88C 00000000 */   nop
/* 0EF990 001EF890 CD030010 */  b           .L.L001F07C8$b
/* 0EF994 001EF894 00000000 */   nop
.L001EF898:
/* 0EF998 001EF898 CC01023C */  lui         $2, %hi(GamePad)
/* 0EF99C 001EF89C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EF9A0 001EF8A0 20000524 */  addiu       $5, $0, 0x20
/* 0EF9A4 001EF8A4 1CAE040C */  jal         Down__8CGamePadFi
/* 0EF9A8 001EF8A8 00000000 */   nop
/* 0EF9AC 001EF8AC C6034010 */  beqz        $2, .L.L001F07C8$b
/* 0EF9B0 001EF8B0 00000000 */   nop
/* 0EF9B4 001EF8B4 28260070 */  paddub      $4, $0, $0
/* 0EF9B8 001EF8B8 282E0070 */  paddub      $5, $0, $0
/* 0EF9BC 001EF8BC 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EF9C0 001EF8C0 00000000 */   nop
/* 0EF9C4 001EF8C4 02000424 */  addiu       $4, $0, 0x2
/* 0EF9C8 001EF8C8 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EF9CC 001EF8CC 00000000 */   nop
/* 0EF9D0 001EF8D0 BD030010 */  b           .L.L001F07C8$b
/* 0EF9D4 001EF8D4 00000000 */   nop
jlabel .L001EF8D8
/* 0EF9D8 001EF8D8 D901013C */  lui         $1, %hi(ShopMenu + 0x194)
/* 0EF9DC 001EF8DC 64022284 */  lh          $2, %lo(ShopMenu + 0x194)($1)
/* 0EF9E0 001EF8E0 08004014 */  bnez        $2, .L001EF904
/* 0EF9E4 001EF8E4 00000000 */   nop
/* 0EF9E8 001EF8E8 D901013C */  lui         $1, %hi(ShopMenu)
/* 0EF9EC 001EF8EC D0002584 */  lh          $5, %lo(ShopMenu)($1)
/* 0EF9F0 001EF8F0 01000424 */  addiu       $4, $0, 0x1
/* 0EF9F4 001EF8F4 10A0070C */  jal         ShopPersonBuild__Fii
/* 0EF9F8 001EF8F8 00000000 */   nop
/* 0EF9FC 001EF8FC D901013C */  lui         $1, %hi(ShopMenu + 0x194)
/* 0EFA00 001EF900 640222A4 */  sh          $2, %lo(ShopMenu + 0x194)($1)
.L001EF904:
/* 0EFA04 001EF904 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EFA08 001EF908 E4003E8C */  lw          $30, %lo(ShopMenu + 0x14)($1)
/* 0EFA0C 001EF90C D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0EFA10 001EF910 DC00378C */  lw          $23, %lo(ShopMenu + 0xC)($1)
/* 0EFA14 001EF914 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0EFA18 001EF918 D2002384 */  lh          $3, %lo(ShopMenu + 0x2)($1)
/* 0EFA1C 001EF91C 01000224 */  addiu       $2, $0, 0x1
/* 0EFA20 001EF920 10006210 */  beq         $3, $2, .L001EF964
/* 0EFA24 001EF924 00000000 */   nop
/* 0EFA28 001EF928 0A006010 */  beqz        $3, .L001EF954
/* 0EFA2C 001EF92C 00000000 */   nop
/* 0EFA30 001EF930 02000224 */  addiu       $2, $0, 0x2
/* 0EFA34 001EF934 03006210 */  beq         $3, $2, .L001EF944
/* 0EFA38 001EF938 00000000 */   nop
/* 0EFA3C 001EF93C 80010010 */  b           .L001EFF40
/* 0EFA40 001EF940 00000000 */   nop
.L001EF944:
/* 0EFA44 001EF944 5CB0070C */  jal         CheckSideKey2__Fv
/* 0EFA48 001EF948 00000000 */   nop
/* 0EFA4C 001EF94C 7C010010 */  b           .L001EFF40
/* 0EFA50 001EF950 00000000 */   nop
.L001EF954:
/* 0EFA54 001EF954 A0B8070C */  jal         ItemShopSelectKey2__Fv
/* 0EFA58 001EF958 00000000 */   nop
/* 0EFA5C 001EF95C 78010010 */  b           .L001EFF40
/* 0EFA60 001EF960 00000000 */   nop
.L001EF964:
/* 0EFA64 001EF964 D8BB080C */  jal         PersonalBoardKey__Fv
/* 0EFA68 001EF968 00000000 */   nop
/* 0EFA6C 001EF96C 28864070 */  paddub      $16, $2, $0
/* 0EFA70 001EF970 73000016 */  bnez        $16, .L001EFB40
/* 0EFA74 001EF974 00000000 */   nop
/* 0EFA78 001EF978 CC01023C */  lui         $2, %hi(GamePad)
/* 0EFA7C 001EF97C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EFA80 001EF980 40000524 */  addiu       $5, $0, 0x40
/* 0EFA84 001EF984 1CAE040C */  jal         Down__8CGamePadFi
/* 0EFA88 001EF988 00000000 */   nop
/* 0EFA8C 001EF98C 6C004010 */  beqz        $2, .L001EFB40
/* 0EFA90 001EF990 00000000 */   nop
/* 0EFA94 001EF994 D901023C */  lui         $2, %hi(ShopMenu + 0x8)
/* 0EFA98 001EF998 D8005124 */  addiu       $17, $2, %lo(ShopMenu + 0x8)
/* 0EFA9C 001EF99C B894858F */  lw          $5, -0x6B48($28)
/* 0EFAA0 001EF9A0 0000B48C */  lw          $20, 0x0($5)
/* 0EFAA4 001EF9A4 0800228E */  lw          $2, 0x8($17)
/* 0EFAA8 001EF9A8 01000324 */  addiu       $3, $0, 0x1
/* 0EFAAC 001EF9AC 1B004310 */  beq         $2, $3, .L001EFA1C
/* 0EFAB0 001EF9B0 00000000 */   nop
/* 0EFAB4 001EF9B4 02000424 */  addiu       $4, $0, 0x2
/* 0EFAB8 001EF9B8 03004410 */  beq         $2, $4, .L001EF9C8
/* 0EFABC 001EF9BC 00000000 */   nop
/* 0EFAC0 001EF9C0 48010010 */  b           .L001EFEE4
/* 0EFAC4 001EF9C4 00000000 */   nop
.L001EF9C8:
/* 0EFAC8 001EF9C8 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EFACC 001EF9CC 00000000 */   nop
/* 0EFAD0 001EF9D0 B894828F */  lw          $2, -0x6B48($28)
/* 0EFAD4 001EF9D4 10004484 */  lh          $4, 0x10($2)
/* 0EFAD8 001EF9D8 51008228 */  slti        $2, $4, 0x51
/* 0EFADC 001EF9DC 41014014 */  bnez        $2, .L001EFEE4
/* 0EFAE0 001EF9E0 00000000 */   nop
/* 0EFAE4 001EF9E4 01000224 */  addiu       $2, $0, 0x1
/* 0EFAE8 001EF9E8 3E018212 */  beq         $20, $2, .L001EFEE4
/* 0EFAEC 001EF9EC 00000000 */   nop
/* 0EFAF0 001EF9F0 68C4080C */  jal         IsEnableTrushThrow__Fi
/* 0EFAF4 001EF9F4 00000000 */   nop
/* 0EFAF8 001EF9F8 3A014010 */  beqz        $2, .L001EFEE4
/* 0EFAFC 001EF9FC 00000000 */   nop
/* 0EFB00 001EFA00 01000224 */  addiu       $2, $0, 0x1
/* 0EFB04 001EFA04 1C0022A6 */  sh          $2, 0x1C($17)
/* 0EFB08 001EFA08 200020AE */  sw          $0, 0x20($17)
/* 0EFB0C 001EFA0C B894828F */  lw          $2, -0x6B48($28)
/* 0EFB10 001EFA10 100040A4 */  sh          $0, 0x10($2)
/* 0EFB14 001EFA14 33010010 */  b           .L001EFEE4
/* 0EFB18 001EFA18 00000000 */   nop
.L001EFA1C:
/* 0EFB1C 001EFA1C D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EFB20 001EFA20 E400318C */  lw          $17, %lo(ShopMenu + 0x14)($1)
/* 0EFB24 001EFA24 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0EFB28 001EFA28 DC00248C */  lw          $4, %lo(ShopMenu + 0xC)($1)
/* 0EFB2C 001EFA2C 02000224 */  addiu       $2, $0, 0x2
/* 0EFB30 001EFA30 0D008210 */  beq         $4, $2, .L001EFA68
/* 0EFB34 001EFA34 00000000 */   nop
/* 0EFB38 001EFA38 08008310 */  beq         $4, $3, .L001EFA5C
/* 0EFB3C 001EFA3C 00000000 */   nop
/* 0EFB40 001EFA40 03008010 */  beqz        $4, .L001EFA50
/* 0EFB44 001EFA44 00000000 */   nop
/* 0EFB48 001EFA48 09000010 */  b           .L001EFA70
/* 0EFB4C 001EFA4C 00000000 */   nop
.L001EFA50:
/* 0EFB50 001EFA50 9494928F */  lw          $18, -0x6B6C($28)
/* 0EFB54 001EFA54 06000010 */  b           .L001EFA70
/* 0EFB58 001EFA58 00000000 */   nop
.L001EFA5C:
/* 0EFB5C 001EFA5C 9894928F */  lw          $18, -0x6B68($28)
/* 0EFB60 001EFA60 03000010 */  b           .L001EFA70
/* 0EFB64 001EFA64 00000000 */   nop
.L001EFA68:
/* 0EFB68 001EFA68 9C94928F */  lw          $18, -0x6B64($28)
/* 0EFB6C 001EFA6C 00000000 */  nop
.L001EFA70:
/* 0EFB70 001EFA70 80101100 */  sll         $2, $17, 2
/* 0EFB74 001EFA74 21A84202 */  addu        $21, $18, $2
/* 0EFB78 001EFA78 0000B28E */  lw          $18, 0x0($21)
/* 0EFB7C 001EFA7C 01000224 */  addiu       $2, $0, 0x1
/* 0EFB80 001EFA80 0F008214 */  bne         $4, $2, .L001EFAC0
/* 0EFB84 001EFA84 00000000 */   nop
/* 0EFB88 001EFA88 0D008216 */  bne         $20, $2, .L001EFAC0
/* 0EFB8C 001EFA8C 00000000 */   nop
/* 0EFB90 001EFA90 1000A384 */  lh          $3, 0x10($5)
/* 0EFB94 001EFA94 B1000224 */  addiu       $2, $0, 0xB1
/* 0EFB98 001EFA98 04006210 */  beq         $3, $2, .L001EFAAC
/* 0EFB9C 001EFA9C 00000000 */   nop
/* 0EFBA0 001EFAA0 B2000224 */  addiu       $2, $0, 0xB2
/* 0EFBA4 001EFAA4 06006214 */  bne         $3, $2, .L001EFAC0
/* 0EFBA8 001EFAA8 00000000 */   nop
.L001EFAAC:
/* 0EFBAC 001EFAAC 02000424 */  addiu       $4, $0, 0x2
/* 0EFBB0 001EFAB0 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EFBB4 001EFAB4 00000000 */   nop
/* 0EFBB8 001EFAB8 0A010010 */  b           .L001EFEE4
/* 0EFBBC 001EFABC 00000000 */   nop
.L001EFAC0:
/* 0EFBC0 001EFAC0 28262072 */  paddub      $4, $17, $0
/* 0EFBC4 001EFAC4 34BD080C */  jal         PersonalBoardItemGetorSwap__Fi
/* 0EFBC8 001EFAC8 00000000 */   nop
/* 0EFBCC 001EFACC 01000324 */  addiu       $3, $0, 0x1
/* 0EFBD0 001EFAD0 06004310 */  beq         $2, $3, .L001EFAEC
/* 0EFBD4 001EFAD4 00000000 */   nop
/* 0EFBD8 001EFAD8 02000424 */  addiu       $4, $0, 0x2
/* 0EFBDC 001EFADC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EFBE0 001EFAE0 00000000 */   nop
/* 0EFBE4 001EFAE4 FF000010 */  b           .L001EFEE4
/* 0EFBE8 001EFAE8 00000000 */   nop
.L001EFAEC:
/* 0EFBEC 001EFAEC B894828F */  lw          $2, -0x6B48($28)
/* 0EFBF0 001EFAF0 000052AC */  sw          $18, 0x0($2)
/* 0EFBF4 001EFAF4 0000B4AE */  sw          $20, 0x0($21)
/* 0EFBF8 001EFAF8 B894838F */  lw          $3, -0x6B48($28)
/* 0EFBFC 001EFAFC 10006284 */  lh          $2, 0x10($3)
/* 0EFC00 001EFB00 51004128 */  slti        $1, $2, 0x51
/* 0EFC04 001EFB04 08002010 */  beqz        $1, .L001EFB28
/* 0EFC08 001EFB08 00000000 */   nop
/* 0EFC0C 001EFB0C F49B070C */  jal         InitAllHaveData__Fv
/* 0EFC10 001EFB10 00000000 */   nop
/* 0EFC14 001EFB14 FFFF0224 */  addiu       $2, $0, -0x1
/* 0EFC18 001EFB18 D901013C */  lui         $1, %hi(ShopMenu + 0x164)
/* 0EFC1C 001EFB1C 340222AC */  sw          $2, %lo(ShopMenu + 0x164)($1)
/* 0EFC20 001EFB20 02000010 */  b           .L001EFB2C
/* 0EFC24 001EFB24 00000000 */   nop
.L001EFB28:
/* 0EFC28 001EFB28 080071AC */  sw          $17, 0x8($3)
.L001EFB2C:
/* 0EFC2C 001EFB2C 01000424 */  addiu       $4, $0, 0x1
/* 0EFC30 001EFB30 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EFC34 001EFB34 00000000 */   nop
/* 0EFC38 001EFB38 EA000010 */  b           .L001EFEE4
/* 0EFC3C 001EFB3C 00000000 */   nop
.L001EFB40:
/* 0EFC40 001EFB40 E8000016 */  bnez        $16, .L001EFEE4
/* 0EFC44 001EFB44 00000000 */   nop
/* 0EFC48 001EFB48 CC01023C */  lui         $2, %hi(GamePad)
/* 0EFC4C 001EFB4C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0EFC50 001EFB50 10000524 */  addiu       $5, $0, 0x10
/* 0EFC54 001EFB54 1CAE040C */  jal         Down__8CGamePadFi
/* 0EFC58 001EFB58 00000000 */   nop
/* 0EFC5C 001EFB5C E1004010 */  beqz        $2, .L001EFEE4
/* 0EFC60 001EFB60 00000000 */   nop
/* 0EFC64 001EFB64 01000224 */  addiu       $2, $0, 0x1
/* 0EFC68 001EFB68 D901013C */  lui         $1, %hi(ShopMenu + 0x6)
/* 0EFC6C 001EFB6C D60022A4 */  sh          $2, %lo(ShopMenu + 0x6)($1)
/* 0EFC70 001EFB70 B894828F */  lw          $2, -0x6B48($28)
/* 0EFC74 001EFB74 10004284 */  lh          $2, 0x10($2)
/* 0EFC78 001EFB78 51004228 */  slti        $2, $2, 0x51
/* 0EFC7C 001EFB7C 07004014 */  bnez        $2, .L001EFB9C
/* 0EFC80 001EFB80 00000000 */   nop
/* 0EFC84 001EFB84 02000424 */  addiu       $4, $0, 0x2
/* 0EFC88 001EFB88 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EFC8C 001EFB8C 00000000 */   nop
/* 0EFC90 001EFB90 28160070 */  paddub      $2, $0, $0
/* 0EFC94 001EFB94 0D030010 */  b           .L001F07CC
/* 0EFC98 001EFB98 00000000 */   nop
.L001EFB9C:
/* 0EFC9C 001EFB9C D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0EFCA0 001EFBA0 DC00248C */  lw          $4, %lo(ShopMenu + 0xC)($1)
/* 0EFCA4 001EFBA4 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EFCA8 001EFBA8 E400258C */  lw          $5, %lo(ShopMenu + 0x14)($1)
/* 0EFCAC 001EFBAC 38C5080C */  jal         SearchBoardNowPosItemExist__Fii
/* 0EFCB0 001EFBB0 00000000 */   nop
/* 0EFCB4 001EFBB4 288E4070 */  paddub      $17, $2, $0
/* 0EFCB8 001EFBB8 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0EFCBC 001EFBBC DC00238C */  lw          $3, %lo(ShopMenu + 0xC)($1)
/* 0EFCC0 001EFBC0 01000224 */  addiu       $2, $0, 0x1
/* 0EFCC4 001EFBC4 16006210 */  beq         $3, $2, .L001EFC20
/* 0EFCC8 001EFBC8 00000000 */   nop
/* 0EFCCC 001EFBCC 02000224 */  addiu       $2, $0, 0x2
/* 0EFCD0 001EFBD0 0C006210 */  beq         $3, $2, .L001EFC04
/* 0EFCD4 001EFBD4 00000000 */   nop
/* 0EFCD8 001EFBD8 03006010 */  beqz        $3, .L001EFBE8
/* 0EFCDC 001EFBDC 00000000 */   nop
/* 0EFCE0 001EFBE0 14000010 */  b           .L001EFC34
/* 0EFCE4 001EFBE4 00000000 */   nop
.L001EFBE8:
/* 0EFCE8 001EFBE8 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EFCEC 001EFBEC E400228C */  lw          $2, %lo(ShopMenu + 0x14)($1)
/* 0EFCF0 001EFBF0 80180200 */  sll         $3, $2, 2
/* 0EFCF4 001EFBF4 9494828F */  lw          $2, -0x6B6C($28)
/* 0EFCF8 001EFBF8 21904300 */  addu        $18, $2, $3
/* 0EFCFC 001EFBFC 0D000010 */  b           .L001EFC34
/* 0EFD00 001EFC00 00000000 */   nop
.L001EFC04:
/* 0EFD04 001EFC04 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EFD08 001EFC08 E400228C */  lw          $2, %lo(ShopMenu + 0x14)($1)
/* 0EFD0C 001EFC0C 80180200 */  sll         $3, $2, 2
/* 0EFD10 001EFC10 9C94828F */  lw          $2, -0x6B64($28)
/* 0EFD14 001EFC14 21904300 */  addu        $18, $2, $3
/* 0EFD18 001EFC18 06000010 */  b           .L001EFC34
/* 0EFD1C 001EFC1C 00000000 */   nop
.L001EFC20:
/* 0EFD20 001EFC20 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EFD24 001EFC24 E400228C */  lw          $2, %lo(ShopMenu + 0x14)($1)
/* 0EFD28 001EFC28 80180200 */  sll         $3, $2, 2
/* 0EFD2C 001EFC2C 9894828F */  lw          $2, -0x6B68($28)
/* 0EFD30 001EFC30 21904300 */  addu        $18, $2, $3
.L001EFC34:
/* 0EFD34 001EFC34 0000438E */  lw          $3, 0x0($18)
/* 0EFD38 001EFC38 01000224 */  addiu       $2, $0, 0x1
/* 0EFD3C 001EFC3C 06006214 */  bne         $3, $2, .L001EFC58
/* 0EFD40 001EFC40 00000000 */   nop
/* 0EFD44 001EFC44 02000424 */  addiu       $4, $0, 0x2
/* 0EFD48 001EFC48 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EFD4C 001EFC4C 00000000 */   nop
/* 0EFD50 001EFC50 A4000010 */  b           .L001EFEE4
/* 0EFD54 001EFC54 00000000 */   nop
.L001EFC58:
/* 0EFD58 001EFC58 28262072 */  paddub      $4, $17, $0
/* 0EFD5C 001EFC5C 109E070C */  jal         IsEnableCharge__Fi
/* 0EFD60 001EFC60 00000000 */   nop
/* 0EFD64 001EFC64 28964070 */  paddub      $18, $2, $0
/* 0EFD68 001EFC68 54004012 */  beqz        $18, .L001EFDBC
/* 0EFD6C 001EFC6C 00000000 */   nop
/* 0EFD70 001EFC70 0201212A */  slti        $1, $17, 0x102
/* 0EFD74 001EFC74 17002010 */  beqz        $1, .L001EFCD4
/* 0EFD78 001EFC78 00000000 */   nop
/* 0EFD7C 001EFC7C 8400222A */  slti        $2, $17, 0x84
/* 0EFD80 001EFC80 14004014 */  bnez        $2, .L001EFCD4
/* 0EFD84 001EFC84 00000000 */   nop
/* 0EFD88 001EFC88 28262072 */  paddub      $4, $17, $0
/* 0EFD8C 001EFC8C A043070C */  jal         GetItemData__Fi
/* 0EFD90 001EFC90 00000000 */   nop
/* 0EFD94 001EFC94 0F004010 */  beqz        $2, .L001EFCD4
/* 0EFD98 001EFC98 00000000 */   nop
/* 0EFD9C 001EFC9C 08004284 */  lh          $2, 0x8($2)
/* 0EFDA0 001EFCA0 10004230 */  andi        $2, $2, 0x10
/* 0EFDA4 001EFCA4 06004014 */  bnez        $2, .L001EFCC0
/* 0EFDA8 001EFCA8 00000000 */   nop
/* 0EFDAC 001EFCAC B894828F */  lw          $2, -0x6B48($28)
/* 0EFDB0 001EFCB0 10004384 */  lh          $3, 0x10($2)
/* 0EFDB4 001EFCB4 B9000224 */  addiu       $2, $0, 0xB9
/* 0EFDB8 001EFCB8 06006214 */  bne         $3, $2, .L001EFCD4
/* 0EFDBC 001EFCBC 00000000 */   nop
.L001EFCC0:
/* 0EFDC0 001EFCC0 28960070 */  paddub      $18, $0, $0
/* 0EFDC4 001EFCC4 04000424 */  addiu       $4, $0, 0x4
/* 0EFDC8 001EFCC8 01000524 */  addiu       $5, $0, 0x1
/* 0EFDCC 001EFCCC 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EFDD0 001EFCD0 00000000 */   nop
.L001EFCD4:
/* 0EFDD4 001EFCD4 0101222A */  slti        $2, $17, 0x101
/* 0EFDD8 001EFCD8 3C004014 */  bnez        $2, .L001EFDCC
/* 0EFDDC 001EFCDC 00000000 */   nop
/* 0EFDE0 001EFCE0 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EFDE4 001EFCE4 E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0EFDE8 001EFCE8 0A000224 */  addiu       $2, $0, 0xA
/* 0EFDEC 001EFCEC 1A006200 */  div         $0, $3, $2
/* 0EFDF0 001EFCF0 02004014 */  bnez        $2, .L001EFCFC
/* 0EFDF4 001EFCF4 00000000 */   nop
/* 0EFDF8 001EFCF8 CD010000 */  break       0, 7
.L001EFCFC:
/* 0EFDFC 001EFCFC 12A00000 */  mflo        $20
/* 0EFE00 001EFD00 28262072 */  paddub      $4, $17, $0
/* 0EFE04 001EFD04 70CF070C */  jal         IsDefaultWeapon__Fi
/* 0EFE08 001EFD08 00000000 */   nop
/* 0EFE0C 001EFD0C 06008216 */  bne         $20, $2, .L001EFD28
/* 0EFE10 001EFD10 00000000 */   nop
/* 0EFE14 001EFD14 04000424 */  addiu       $4, $0, 0x4
/* 0EFE18 001EFD18 01000524 */  addiu       $5, $0, 0x1
/* 0EFE1C 001EFD1C 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EFE20 001EFD20 00000000 */   nop
/* 0EFE24 001EFD24 28960070 */  paddub      $18, $0, $0
.L001EFD28:
/* 0EFE28 001EFD28 0C010224 */  addiu       $2, $0, 0x10C
/* 0EFE2C 001EFD2C 0A002216 */  bne         $17, $2, .L001EFD58
/* 0EFE30 001EFD30 00000000 */   nop
/* 0EFE34 001EFD34 E02F080C */  jal         GetMenuHebikiriFlag__Fv
/* 0EFE38 001EFD38 00000000 */   nop
/* 0EFE3C 001EFD3C 06004014 */  bnez        $2, .L001EFD58
/* 0EFE40 001EFD40 00000000 */   nop
/* 0EFE44 001EFD44 04000424 */  addiu       $4, $0, 0x4
/* 0EFE48 001EFD48 01000524 */  addiu       $5, $0, 0x1
/* 0EFE4C 001EFD4C 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EFE50 001EFD50 00000000 */   nop
/* 0EFE54 001EFD54 28960070 */  paddub      $18, $0, $0
.L001EFD58:
/* 0EFE58 001EFD58 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EFE5C 001EFD5C E400248C */  lw          $4, %lo(ShopMenu + 0x14)($1)
/* 0EFE60 001EFD60 0A000224 */  addiu       $2, $0, 0xA
/* 0EFE64 001EFD64 1A008200 */  div         $0, $4, $2
/* 0EFE68 001EFD68 02004014 */  bnez        $2, .L001EFD74
/* 0EFE6C 001EFD6C 00000000 */   nop
/* 0EFE70 001EFD70 CD010000 */  break       0, 7
.L001EFD74:
/* 0EFE74 001EFD74 12100000 */  mflo        $2
/* 0EFE78 001EFD78 8494838F */  lw          $3, -0x6B7C($28)
/* 0EFE7C 001EFD7C 21104300 */  addu        $2, $2, $3
/* 0EFE80 001EFD80 40434380 */  lb          $3, 0x4340($2)
/* 0EFE84 001EFD84 0A000224 */  addiu       $2, $0, 0xA
/* 0EFE88 001EFD88 1A008200 */  div         $0, $4, $2
/* 0EFE8C 001EFD8C 00000000 */  nop
/* 0EFE90 001EFD90 00000000 */  nop
/* 0EFE94 001EFD94 10100000 */  mfhi        $2
/* 0EFE98 001EFD98 0C004314 */  bne         $2, $3, .L001EFDCC
/* 0EFE9C 001EFD9C 00000000 */   nop
/* 0EFEA0 001EFDA0 28960070 */  paddub      $18, $0, $0
/* 0EFEA4 001EFDA4 05000424 */  addiu       $4, $0, 0x5
/* 0EFEA8 001EFDA8 01000524 */  addiu       $5, $0, 0x1
/* 0EFEAC 001EFDAC 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EFEB0 001EFDB0 00000000 */   nop
/* 0EFEB4 001EFDB4 05000010 */  b           .L001EFDCC
/* 0EFEB8 001EFDB8 00000000 */   nop
.L001EFDBC:
/* 0EFEBC 001EFDBC 04000424 */  addiu       $4, $0, 0x4
/* 0EFEC0 001EFDC0 01000524 */  addiu       $5, $0, 0x1
/* 0EFEC4 001EFDC4 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EFEC8 001EFDC8 00000000 */   nop
.L001EFDCC:
/* 0EFECC 001EFDCC 8494828F */  lw          $2, -0x6B7C($28)
/* 0EFED0 001EFDD0 46434A94 */  lhu         $10, 0x4346($2)
/* 0EFED4 001EFDD4 28262072 */  paddub      $4, $17, $0
/* 0EFED8 001EFDD8 01000524 */  addiu       $5, $0, 0x1
/* 0EFEDC 001EFDDC B4AC070C */  jal         CalItemMoney__Fii
/* 0EFEE0 001EFDE0 00000000 */   nop
/* 0EFEE4 001EFDE4 284E4070 */  paddub      $9, $2, $0
/* 0EFEE8 001EFDE8 0101222A */  slti        $2, $17, 0x101
/* 0EFEEC 001EFDEC 1B004014 */  bnez        $2, .L001EFE5C
/* 0EFEF0 001EFDF0 00000000 */   nop
/* 0EFEF4 001EFDF4 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EFEF8 001EFDF8 E400258C */  lw          $5, %lo(ShopMenu + 0x14)($1)
/* 0EFEFC 001EFDFC 0A000224 */  addiu       $2, $0, 0xA
/* 0EFF00 001EFE00 1A00A200 */  div         $0, $5, $2
/* 0EFF04 001EFE04 02004014 */  bnez        $2, .L001EFE10
/* 0EFF08 001EFE08 00000000 */   nop
/* 0EFF0C 001EFE0C CD010000 */  break       0, 7
.L001EFE10:
/* 0EFF10 001EFE10 12180000 */  mflo        $3
/* 0EFF14 001EFE14 8494848F */  lw          $4, -0x6B7C($28)
/* 0EFF18 001EFE18 A80A0224 */  addiu       $2, $0, 0xAA8
/* 0EFF1C 001EFE1C 18106200 */  mult        $2, $3, $2
/* 0EFF20 001EFE20 21108200 */  addu        $2, $4, $2
/* 0EFF24 001EFE24 0C454424 */  addiu       $4, $2, 0x450C
/* 0EFF28 001EFE28 0A000224 */  addiu       $2, $0, 0xA
/* 0EFF2C 001EFE2C 1A00A200 */  div         $0, $5, $2
/* 0EFF30 001EFE30 00000000 */  nop
/* 0EFF34 001EFE34 00000000 */  nop
/* 0EFF38 001EFE38 10180000 */  mfhi        $3
/* 0EFF3C 001EFE3C 40110300 */  sll         $2, $3, 5
/* 0EFF40 001EFE40 23104300 */  subu        $2, $2, $3
/* 0EFF44 001EFE44 C0100200 */  sll         $2, $2, 3
/* 0EFF48 001EFE48 21208200 */  addu        $4, $4, $2
/* 0EFF4C 001EFE4C 01000524 */  addiu       $5, $0, 0x1
/* 0EFF50 001EFE50 C4AC070C */  jal         WeaponCalMoney__FP11WEAPON_HAVEi
/* 0EFF54 001EFE54 00000000 */   nop
/* 0EFF58 001EFE58 21482201 */  addu        $9, $9, $2
.L001EFE5C:
/* 0EFF5C 001EFE5C 0200201D */  bgtz        $9, .L001EFE68
/* 0EFF60 001EFE60 00000000 */   nop
/* 0EFF64 001EFE64 01000924 */  addiu       $9, $0, 0x1
.L001EFE68:
/* 0EFF68 001EFE68 21104901 */  addu        $2, $10, $9
/* 0EFF6C 001EFE6C 0100013C */  lui         $1, (0x10000 >> 16)
/* 0EFF70 001EFE70 2A084100 */  slt         $1, $2, $1
/* 0EFF74 001EFE74 06002014 */  bnez        $1, .L001EFE90
/* 0EFF78 001EFE78 00000000 */   nop
/* 0EFF7C 001EFE7C 16000424 */  addiu       $4, $0, 0x16
/* 0EFF80 001EFE80 01000524 */  addiu       $5, $0, 0x1
/* 0EFF84 001EFE84 749C070C */  jal         SetItemShopTalkMode__Fii
/* 0EFF88 001EFE88 00000000 */   nop
/* 0EFF8C 001EFE8C 28960070 */  paddub      $18, $0, $0
.L001EFE90:
/* 0EFF90 001EFE90 5100212A */  slti        $1, $17, 0x51
/* 0EFF94 001EFE94 06002010 */  beqz        $1, .L001EFEB0
/* 0EFF98 001EFE98 00000000 */   nop
/* 0EFF9C 001EFE9C 02000424 */  addiu       $4, $0, 0x2
/* 0EFFA0 001EFEA0 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EFFA4 001EFEA4 00000000 */   nop
/* 0EFFA8 001EFEA8 0E000010 */  b           .L001EFEE4
/* 0EFFAC 001EFEAC 00000000 */   nop
.L001EFEB0:
/* 0EFFB0 001EFEB0 09004012 */  beqz        $18, .L001EFED8
/* 0EFFB4 001EFEB4 00000000 */   nop
/* 0EFFB8 001EFEB8 0E000224 */  addiu       $2, $0, 0xE
/* 0EFFBC 001EFEBC D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0EFFC0 001EFEC0 500222A4 */  sh          $2, %lo(ShopMenu + 0x180)($1)
/* 0EFFC4 001EFEC4 01000424 */  addiu       $4, $0, 0x1
/* 0EFFC8 001EFEC8 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EFFCC 001EFECC 00000000 */   nop
/* 0EFFD0 001EFED0 04000010 */  b           .L001EFEE4
/* 0EFFD4 001EFED4 00000000 */   nop
.L001EFED8:
/* 0EFFD8 001EFED8 02000424 */  addiu       $4, $0, 0x2
/* 0EFFDC 001EFEDC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0EFFE0 001EFEE0 00000000 */   nop
.L001EFEE4:
/* 0EFFE4 001EFEE4 16000012 */  beqz        $16, .L001EFF40
/* 0EFFE8 001EFEE8 00000000 */   nop
/* 0EFFEC 001EFEEC D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0EFFF0 001EFEF0 D20020A4 */  sh          $0, %lo(ShopMenu + 0x2)($1)
/* 0EFFF4 001EFEF4 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0EFFF8 001EFEF8 E400238C */  lw          $3, %lo(ShopMenu + 0x14)($1)
/* 0EFFFC 001EFEFC 05000224 */  addiu       $2, $0, 0x5
/* 0F0000 001EFF00 1A006200 */  div         $0, $3, $2
/* 0F0004 001EFF04 02004014 */  bnez        $2, .L001EFF10
/* 0F0008 001EFF08 00000000 */   nop
/* 0F000C 001EFF0C CD010000 */  break       0, 7
.L001EFF10:
/* 0F0010 001EFF10 12180000 */  mflo        $3
/* 0F0014 001EFF14 D901013C */  lui         $1, %hi(ShopMenu + 0x20)
/* 0F0018 001EFF18 F000228C */  lw          $2, %lo(ShopMenu + 0x20)($1)
/* 0F001C 001EFF1C 23186200 */  subu        $3, $3, $2
/* 0F0020 001EFF20 D901013C */  lui         $1, %hi(ShopMenu + 0x176)
/* 0F0024 001EFF24 46022290 */  lbu         $2, %lo(ShopMenu + 0x176)($1)
/* 0F0028 001EFF28 21184300 */  addu        $3, $2, $3
/* 0F002C 001EFF2C 80100300 */  sll         $2, $3, 2
/* 0F0030 001EFF30 21104300 */  addu        $2, $2, $3
/* 0F0034 001EFF34 04004224 */  addiu       $2, $2, 0x4
/* 0F0038 001EFF38 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0F003C 001EFF3C E40022AC */  sw          $2, %lo(ShopMenu + 0x14)($1)
.L001EFF40:
/* 0F0040 001EFF40 D901013C */  lui         $1, %hi(ShopMenu + 0x6)
/* 0F0044 001EFF44 D6002284 */  lh          $2, %lo(ShopMenu + 0x6)($1)
/* 0F0048 001EFF48 2D014014 */  bnez        $2, .L001F0400
/* 0F004C 001EFF4C 00000000 */   nop
/* 0F0050 001EFF50 CC01023C */  lui         $2, %hi(GamePad)
/* 0F0054 001EFF54 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F0058 001EFF58 20000524 */  addiu       $5, $0, 0x20
/* 0F005C 001EFF5C 1CAE040C */  jal         Down__8CGamePadFi
/* 0F0060 001EFF60 00000000 */   nop
/* 0F0064 001EFF64 26014010 */  beqz        $2, .L001F0400
/* 0F0068 001EFF68 00000000 */   nop
/* 0F006C 001EFF6C 02000424 */  addiu       $4, $0, 0x2
/* 0F0070 001EFF70 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F0074 001EFF74 00000000 */   nop
/* 0F0078 001EFF78 B894828F */  lw          $2, -0x6B48($28)
/* 0F007C 001EFF7C 10005184 */  lh          $17, 0x10($2)
/* 0F0080 001EFF80 5100212A */  slti        $1, $17, 0x51
/* 0F0084 001EFF84 29002010 */  beqz        $1, .L001F002C
/* 0F0088 001EFF88 00000000 */   nop
/* 0F008C 001EFF8C D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0F0090 001EFF90 D2002384 */  lh          $3, %lo(ShopMenu + 0x2)($1)
/* 0F0094 001EFF94 02000224 */  addiu       $2, $0, 0x2
/* 0F0098 001EFF98 20006214 */  bne         $3, $2, .L001F001C
/* 0F009C 001EFF9C 00000000 */   nop
/* 0F00A0 001EFFA0 FFFF0224 */  addiu       $2, $0, -0x1
/* 0F00A4 001EFFA4 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16BC)
/* 0F00A8 001EFFA8 CC5122AC */  sw          $2, %lo(CommonMenuMes3 + 0x16BC)($1)
/* 0F00AC 001EFFAC 01000224 */  addiu       $2, $0, 0x1
/* 0F00B0 001EFFB0 D901013C */  lui         $1, %hi(ShopMenu + 0x19A)
/* 0F00B4 001EFFB4 6A0222A4 */  sh          $2, %lo(ShopMenu + 0x19A)($1)
/* 0F00B8 001EFFB8 ECAD070C */  jal         CheckBuyItemFunc2__Fv
/* 0F00BC 001EFFBC 00000000 */   nop
/* 0F00C0 001EFFC0 01004330 */  andi        $3, $2, 0x1
/* 0F00C4 001EFFC4 04006010 */  beqz        $3, .L001EFFD8
/* 0F00C8 001EFFC8 00000000 */   nop
/* 0F00CC 001EFFCC 18000324 */  addiu       $3, $0, 0x18
/* 0F00D0 001EFFD0 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0F00D4 001EFFD4 500223A4 */  sh          $3, %lo(ShopMenu + 0x180)($1)
.L001EFFD8:
/* 0F00D8 001EFFD8 06004330 */  andi        $3, $2, 0x6
/* 0F00DC 001EFFDC 07006010 */  beqz        $3, .L001EFFFC
/* 0F00E0 001EFFE0 00000000 */   nop
/* 0F00E4 001EFFE4 06000324 */  addiu       $3, $0, 0x6
/* 0F00E8 001EFFE8 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0F00EC 001EFFEC 500223A4 */  sh          $3, %lo(ShopMenu + 0x180)($1)
/* 0F00F0 001EFFF0 02000324 */  addiu       $3, $0, 0x2
/* 0F00F4 001EFFF4 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0F00F8 001EFFF8 D20023A4 */  sh          $3, %lo(ShopMenu + 0x2)($1)
.L001EFFFC:
/* 0F00FC 001EFFFC 08004230 */  andi        $2, $2, 0x8
/* 0F0100 001F0000 21014010 */  beqz        $2, .L001F0488
/* 0F0104 001F0004 00000000 */   nop
/* 0F0108 001F0008 0A000224 */  addiu       $2, $0, 0xA
/* 0F010C 001F000C D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0F0110 001F0010 500222A4 */  sh          $2, %lo(ShopMenu + 0x180)($1)
/* 0F0114 001F0014 1C010010 */  b           .L001F0488
/* 0F0118 001F0018 00000000 */   nop
.L001F001C:
/* 0F011C 001F001C D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0F0120 001F0020 D20022A4 */  sh          $2, %lo(ShopMenu + 0x2)($1)
/* 0F0124 001F0024 18010010 */  b           .L001F0488
/* 0F0128 001F0028 00000000 */   nop
.L001F002C:
/* 0F012C 001F002C 0000508C */  lw          $16, 0x0($2)
/* 0F0130 001F0030 02000224 */  addiu       $2, $0, 0x2
/* 0F0134 001F0034 A8000212 */  beq         $16, $2, .L001F02D8
/* 0F0138 001F0038 00000000 */   nop
/* 0F013C 001F003C 01000224 */  addiu       $2, $0, 0x1
/* 0F0140 001F0040 03000212 */  beq         $16, $2, .L001F0050
/* 0F0144 001F0044 00000000 */   nop
/* 0F0148 001F0048 0F010010 */  b           .L001F0488
/* 0F014C 001F004C 00000000 */   nop
.L001F0050:
/* 0F0150 001F0050 FFFF1024 */  addiu       $16, $0, -0x1
/* 0F0154 001F0054 28260070 */  paddub      $4, $0, $0
/* 0F0158 001F0058 0B000010 */  b           .L001F0088
/* 0F015C 001F005C 00000000 */   nop
.L001F0060:
/* 0F0160 001F0060 80180400 */  sll         $3, $4, 2
/* 0F0164 001F0064 9094828F */  lw          $2, -0x6B70($28)
/* 0F0168 001F0068 21104300 */  addu        $2, $2, $3
/* 0F016C 001F006C 0000428C */  lw          $2, 0x0($2)
/* 0F0170 001F0070 04004014 */  bnez        $2, .L001F0084
/* 0F0174 001F0074 00000000 */   nop
/* 0F0178 001F0078 28868070 */  paddub      $16, $4, $0
/* 0F017C 001F007C 05000010 */  b           .L001F0094
/* 0F0180 001F0080 00000000 */   nop
.L001F0084:
/* 0F0184 001F0084 01008424 */  addiu       $4, $4, 0x1
.L001F0088:
/* 0F0188 001F0088 1E008228 */  slti        $2, $4, 0x1E
/* 0F018C 001F008C F4FF4014 */  bnez        $2, .L001F0060
/* 0F0190 001F0090 00000000 */   nop
.L001F0094:
/* 0F0194 001F0094 06000106 */  bgez        $16, .L001F00B0
/* 0F0198 001F0098 00000000 */   nop
/* 0F019C 001F009C 02000424 */  addiu       $4, $0, 0x2
/* 0F01A0 001F00A0 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F01A4 001F00A4 00000000 */   nop
/* 0F01A8 001F00A8 F7000010 */  b           .L001F0488
/* 0F01AC 001F00AC 00000000 */   nop
.L001F00B0:
/* 0F01B0 001F00B0 80111000 */  sll         $2, $16, 6
/* 0F01B4 001F00B4 23105000 */  subu        $2, $2, $16
/* 0F01B8 001F00B8 80180200 */  sll         $3, $2, 2
/* 0F01BC 001F00BC A094828F */  lw          $2, -0x6B60($28)
/* 0F01C0 001F00C0 21884300 */  addu        $17, $2, $3
/* 0F01C4 001F00C4 A001A427 */  addiu       $4, $29, 0x1A0
/* 0F01C8 001F00C8 282E0070 */  paddub      $5, $0, $0
/* 0F01CC 001F00CC F0010624 */  addiu       $6, $0, 0x1F0
/* 0F01D0 001F00D0 5A0D040C */  jal         memset
/* 0F01D4 001F00D4 00000000 */   nop
/* 0F01D8 001F00D8 00002486 */  lh          $4, 0x0($17)
/* 0F01DC 001F00DC 88C7080C */  jal         WhatIsKindofItem__Fi
/* 0F01E0 001F00E0 00000000 */   nop
/* 0F01E4 001F00E4 28964070 */  paddub      $18, $2, $0
/* 0F01E8 001F00E8 02000224 */  addiu       $2, $0, 0x2
/* 0F01EC 001F00EC 13004212 */  beq         $18, $2, .L001F013C
/* 0F01F0 001F00F0 00000000 */   nop
/* 0F01F4 001F00F4 01000224 */  addiu       $2, $0, 0x1
/* 0F01F8 001F00F8 09004212 */  beq         $18, $2, .L001F0120
/* 0F01FC 001F00FC 00000000 */   nop
/* 0F0200 001F0100 03004012 */  beqz        $18, .L001F0110
/* 0F0204 001F0104 00000000 */   nop
/* 0F0208 001F0108 11000010 */  b           .L001F0150
/* 0F020C 001F010C 00000000 */   nop
.L001F0110:
/* 0F0210 001F0110 0400228E */  lw          $2, 0x4($17)
/* 0F0214 001F0114 A001A2AF */  sw          $2, 0x1A0($29)
/* 0F0218 001F0118 0D000010 */  b           .L001F0150
/* 0F021C 001F011C 00000000 */   nop
.L001F0120:
/* 0F0220 001F0120 A001A427 */  addiu       $4, $29, 0x1A0
/* 0F0224 001F0124 04002526 */  addiu       $5, $17, 0x4
/* 0F0228 001F0128 F8000624 */  addiu       $6, $0, 0xF8
/* 0F022C 001F012C EC0C040C */  jal         memcpy
/* 0F0230 001F0130 00000000 */   nop
/* 0F0234 001F0134 06000010 */  b           .L001F0150
/* 0F0238 001F0138 00000000 */   nop
.L001F013C:
/* 0F023C 001F013C A001A427 */  addiu       $4, $29, 0x1A0
/* 0F0240 001F0140 04002526 */  addiu       $5, $17, 0x4
/* 0F0244 001F0144 20000624 */  addiu       $6, $0, 0x20
/* 0F0248 001F0148 EC0C040C */  jal         memcpy
/* 0F024C 001F014C 00000000 */   nop
.L001F0150:
/* 0F0250 001F0150 B894828F */  lw          $2, -0x6B48($28)
/* 0F0254 001F0154 10004484 */  lh          $4, 0x10($2)
/* 0F0258 001F0158 88C7080C */  jal         WhatIsKindofItem__Fi
/* 0F025C 001F015C 00000000 */   nop
/* 0F0260 001F0160 289E4070 */  paddub      $19, $2, $0
/* 0F0264 001F0164 02000224 */  addiu       $2, $0, 0x2
/* 0F0268 001F0168 14006212 */  beq         $19, $2, .L001F01BC
/* 0F026C 001F016C 00000000 */   nop
/* 0F0270 001F0170 01000224 */  addiu       $2, $0, 0x1
/* 0F0274 001F0174 0A006212 */  beq         $19, $2, .L001F01A0
/* 0F0278 001F0178 00000000 */   nop
/* 0F027C 001F017C 03006012 */  beqz        $19, .L001F018C
/* 0F0280 001F0180 00000000 */   nop
/* 0F0284 001F0184 12000010 */  b           .L001F01D0
/* 0F0288 001F0188 00000000 */   nop
.L001F018C:
/* 0F028C 001F018C B894828F */  lw          $2, -0x6B48($28)
/* 0F0290 001F0190 12004284 */  lh          $2, 0x12($2)
/* 0F0294 001F0194 9802A2AF */  sw          $2, 0x298($29)
/* 0F0298 001F0198 0D000010 */  b           .L001F01D0
/* 0F029C 001F019C 00000000 */   nop
.L001F01A0:
/* 0F02A0 001F01A0 9802A427 */  addiu       $4, $29, 0x298
/* 0F02A4 001F01A4 BC94858F */  lw          $5, -0x6B44($28)
/* 0F02A8 001F01A8 F8000624 */  addiu       $6, $0, 0xF8
/* 0F02AC 001F01AC EC0C040C */  jal         memcpy
/* 0F02B0 001F01B0 00000000 */   nop
/* 0F02B4 001F01B4 06000010 */  b           .L001F01D0
/* 0F02B8 001F01B8 00000000 */   nop
.L001F01BC:
/* 0F02BC 001F01BC 9802A427 */  addiu       $4, $29, 0x298
/* 0F02C0 001F01C0 C094858F */  lw          $5, -0x6B40($28)
/* 0F02C4 001F01C4 20000624 */  addiu       $6, $0, 0x20
/* 0F02C8 001F01C8 EC0C040C */  jal         memcpy
/* 0F02CC 001F01CC 00000000 */   nop
.L001F01D0:
/* 0F02D0 001F01D0 02000224 */  addiu       $2, $0, 0x2
/* 0F02D4 001F01D4 14004212 */  beq         $18, $2, .L001F0228
/* 0F02D8 001F01D8 00000000 */   nop
/* 0F02DC 001F01DC 01000224 */  addiu       $2, $0, 0x1
/* 0F02E0 001F01E0 0A004212 */  beq         $18, $2, .L001F020C
/* 0F02E4 001F01E4 00000000 */   nop
/* 0F02E8 001F01E8 03004012 */  beqz        $18, .L001F01F8
/* 0F02EC 001F01EC 00000000 */   nop
/* 0F02F0 001F01F0 12000010 */  b           .L001F023C
/* 0F02F4 001F01F4 00000000 */   nop
.L001F01F8:
/* 0F02F8 001F01F8 A001A387 */  lh          $3, 0x1A0($29)
/* 0F02FC 001F01FC B894828F */  lw          $2, -0x6B48($28)
/* 0F0300 001F0200 120043A4 */  sh          $3, 0x12($2)
/* 0F0304 001F0204 0D000010 */  b           .L001F023C
/* 0F0308 001F0208 00000000 */   nop
.L001F020C:
/* 0F030C 001F020C BC94848F */  lw          $4, -0x6B44($28)
/* 0F0310 001F0210 A001A527 */  addiu       $5, $29, 0x1A0
/* 0F0314 001F0214 F8000624 */  addiu       $6, $0, 0xF8
/* 0F0318 001F0218 EC0C040C */  jal         memcpy
/* 0F031C 001F021C 00000000 */   nop
/* 0F0320 001F0220 06000010 */  b           .L001F023C
/* 0F0324 001F0224 00000000 */   nop
.L001F0228:
/* 0F0328 001F0228 C094848F */  lw          $4, -0x6B40($28)
/* 0F032C 001F022C A001A527 */  addiu       $5, $29, 0x1A0
/* 0F0330 001F0230 20000624 */  addiu       $6, $0, 0x20
/* 0F0334 001F0234 EC0C040C */  jal         memcpy
/* 0F0338 001F0238 00000000 */   nop
.L001F023C:
/* 0F033C 001F023C 02000224 */  addiu       $2, $0, 0x2
/* 0F0340 001F0240 13006212 */  beq         $19, $2, .L001F0290
/* 0F0344 001F0244 00000000 */   nop
/* 0F0348 001F0248 01000224 */  addiu       $2, $0, 0x1
/* 0F034C 001F024C 09006212 */  beq         $19, $2, .L001F0274
/* 0F0350 001F0250 00000000 */   nop
/* 0F0354 001F0254 03006012 */  beqz        $19, .L001F0264
/* 0F0358 001F0258 00000000 */   nop
/* 0F035C 001F025C 11000010 */  b           .L001F02A4
/* 0F0360 001F0260 00000000 */   nop
.L001F0264:
/* 0F0364 001F0264 9802A28F */  lw          $2, 0x298($29)
/* 0F0368 001F0268 040022AE */  sw          $2, 0x4($17)
/* 0F036C 001F026C 0D000010 */  b           .L001F02A4
/* 0F0370 001F0270 00000000 */   nop
.L001F0274:
/* 0F0374 001F0274 04002426 */  addiu       $4, $17, 0x4
/* 0F0378 001F0278 9802A527 */  addiu       $5, $29, 0x298
/* 0F037C 001F027C F8000624 */  addiu       $6, $0, 0xF8
/* 0F0380 001F0280 EC0C040C */  jal         memcpy
/* 0F0384 001F0284 00000000 */   nop
/* 0F0388 001F0288 06000010 */  b           .L001F02A4
/* 0F038C 001F028C 00000000 */   nop
.L001F0290:
/* 0F0390 001F0290 04002426 */  addiu       $4, $17, 0x4
/* 0F0394 001F0294 9802A527 */  addiu       $5, $29, 0x298
/* 0F0398 001F0298 20000624 */  addiu       $6, $0, 0x20
/* 0F039C 001F029C EC0C040C */  jal         memcpy
/* 0F03A0 001F02A0 00000000 */   nop
.L001F02A4:
/* 0F03A4 001F02A4 80181000 */  sll         $3, $16, 2
/* 0F03A8 001F02A8 9094828F */  lw          $2, -0x6B70($28)
/* 0F03AC 001F02AC 21284300 */  addu        $5, $2, $3
/* 0F03B0 001F02B0 B894848F */  lw          $4, -0x6B48($28)
/* 0F03B4 001F02B4 44B9080C */  jal         MenuDataSwap__FPiPi
/* 0F03B8 001F02B8 00000000 */   nop
/* 0F03BC 001F02BC B894828F */  lw          $2, -0x6B48($28)
/* 0F03C0 001F02C0 10004424 */  addiu       $4, $2, 0x10
/* 0F03C4 001F02C4 282E2072 */  paddub      $5, $17, $0
/* 0F03C8 001F02C8 38B9080C */  jal         MenuDataSwap__FPsPs
/* 0F03CC 001F02CC 00000000 */   nop
/* 0F03D0 001F02D0 6D000010 */  b           .L001F0488
/* 0F03D4 001F02D4 00000000 */   nop
.L001F02D8:
/* 0F03D8 001F02D8 28262072 */  paddub      $4, $17, $0
/* 0F03DC 001F02DC 88C7080C */  jal         WhatIsKindofItem__Fi
/* 0F03E0 001F02E0 00000000 */   nop
/* 0F03E4 001F02E4 9C03A2AF */  sw          $2, 0x39C($29)
/* 0F03E8 001F02E8 9C03A38F */  lw          $3, 0x39C($29)
/* 0F03EC 001F02EC 02000224 */  addiu       $2, $0, 0x2
/* 0F03F0 001F02F0 0E006210 */  beq         $3, $2, .L001F032C
/* 0F03F4 001F02F4 00000000 */   nop
/* 0F03F8 001F02F8 01000224 */  addiu       $2, $0, 0x1
/* 0F03FC 001F02FC 08006210 */  beq         $3, $2, .L001F0320
/* 0F0400 001F0300 00000000 */   nop
/* 0F0404 001F0304 03006010 */  beqz        $3, .L001F0314
/* 0F0408 001F0308 00000000 */   nop
/* 0F040C 001F030C 09000010 */  b           .L001F0334
/* 0F0410 001F0310 00000000 */   nop
.L001F0314:
/* 0F0414 001F0314 9494938F */  lw          $19, -0x6B6C($28)
/* 0F0418 001F0318 06000010 */  b           .L001F0334
/* 0F041C 001F031C 00000000 */   nop
.L001F0320:
/* 0F0420 001F0320 9894938F */  lw          $19, -0x6B68($28)
/* 0F0424 001F0324 03000010 */  b           .L001F0334
/* 0F0428 001F0328 00000000 */   nop
.L001F032C:
/* 0F042C 001F032C 9C94938F */  lw          $19, -0x6B64($28)
/* 0F0430 001F0330 00000000 */  nop
.L001F0334:
/* 0F0434 001F0334 28262072 */  paddub      $4, $17, $0
/* 0F0438 001F0338 9C03A527 */  addiu       $5, $29, 0x39C
/* 0F043C 001F033C 70C5080C */  jal         GetBoardSpace__FiPi
/* 0F0440 001F0340 00000000 */   nop
/* 0F0444 001F0344 28964070 */  paddub      $18, $2, $0
/* 0F0448 001F0348 9C03A48F */  lw          $4, 0x39C($29)
/* 0F044C 001F034C D8BD080C */  jal         PersonalRetMax__Fi
/* 0F0450 001F0350 00000000 */   nop
/* 0F0454 001F0354 04004006 */  bltz        $18, .L001F0368
/* 0F0458 001F0358 00000000 */   nop
/* 0F045C 001F035C 2A084202 */  slt         $1, $18, $2
/* 0F0460 001F0360 06002014 */  bnez        $1, .L001F037C
/* 0F0464 001F0364 00000000 */   nop
.L001F0368:
/* 0F0468 001F0368 02000424 */  addiu       $4, $0, 0x2
/* 0F046C 001F036C BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F0470 001F0370 00000000 */   nop
/* 0F0474 001F0374 44000010 */  b           .L001F0488
/* 0F0478 001F0378 00000000 */   nop
.L001F037C:
/* 0F047C 001F037C 80101200 */  sll         $2, $18, 2
/* 0F0480 001F0380 21886202 */  addu        $17, $19, $2
/* 0F0484 001F0384 0000338E */  lw          $19, 0x0($17)
/* 0F0488 001F0388 9C03A38F */  lw          $3, 0x39C($29)
/* 0F048C 001F038C B894828F */  lw          $2, -0x6B48($28)
/* 0F0490 001F0390 040043AC */  sw          $3, 0x4($2)
/* 0F0494 001F0394 B894828F */  lw          $2, -0x6B48($28)
/* 0F0498 001F0398 0C0052AC */  sw          $18, 0xC($2)
/* 0F049C 001F039C D901013C */  lui         $1, %hi(ShopMenu + 0x164)
/* 0F04A0 001F03A0 3402348C */  lw          $20, %lo(ShopMenu + 0x164)($1)
/* 0F04A4 001F03A4 B894828F */  lw          $2, -0x6B48($28)
/* 0F04A8 001F03A8 10005584 */  lh          $21, 0x10($2)
/* 0F04AC 001F03AC 54BD080C */  jal         PersonalBoardItemCancel__Fv
/* 0F04B0 001F03B0 00000000 */   nop
/* 0F04B4 001F03B4 2A088002 */  slt         $1, $20, $0
/* 0F04B8 001F03B8 0C002014 */  bnez        $1, .L001F03EC
/* 0F04BC 001F03BC 00000000 */   nop
/* 0F04C0 001F03C0 2826A072 */  paddub      $4, $21, $0
/* 0F04C4 001F03C4 A4C7080C */  jal         WhoIsWeaponEquip__Fi
/* 0F04C8 001F03C8 00000000 */   nop
/* 0F04CC 001F03CC 0A000324 */  addiu       $3, $0, 0xA
/* 0F04D0 001F03D0 1A004302 */  div         $0, $18, $3
/* 0F04D4 001F03D4 00000000 */  nop
/* 0F04D8 001F03D8 00000000 */  nop
/* 0F04DC 001F03DC 10200000 */  mfhi        $4
/* 0F04E0 001F03E0 8494838F */  lw          $3, -0x6B7C($28)
/* 0F04E4 001F03E4 21104300 */  addu        $2, $2, $3
/* 0F04E8 001F03E8 404344A0 */  sb          $4, 0x4340($2)
.L001F03EC:
/* 0F04EC 001F03EC B894828F */  lw          $2, -0x6B48($28)
/* 0F04F0 001F03F0 000053AC */  sw          $19, 0x0($2)
/* 0F04F4 001F03F4 000030AE */  sw          $16, 0x0($17)
/* 0F04F8 001F03F8 23000010 */  b           .L001F0488
/* 0F04FC 001F03FC 00000000 */   nop
.L001F0400:
/* 0F0500 001F0400 CC01023C */  lui         $2, %hi(GamePad)
/* 0F0504 001F0404 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0F0508 001F0408 80000524 */  addiu       $5, $0, 0x80
/* 0F050C 001F040C 1CAE040C */  jal         Down__8CGamePadFi
/* 0F0510 001F0410 00000000 */   nop
/* 0F0514 001F0414 1C004010 */  beqz        $2, .L001F0488
/* 0F0518 001F0418 00000000 */   nop
/* 0F051C 001F041C D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0F0520 001F0420 DC00238C */  lw          $3, %lo(ShopMenu + 0xC)($1)
/* 0F0524 001F0424 02000224 */  addiu       $2, $0, 0x2
/* 0F0528 001F0428 0F006210 */  beq         $3, $2, .L001F0468
/* 0F052C 001F042C 00000000 */   nop
/* 0F0530 001F0430 03006010 */  beqz        $3, .L001F0440
/* 0F0534 001F0434 00000000 */   nop
/* 0F0538 001F0438 10000010 */  b           .L001F047C
/* 0F053C 001F043C 00000000 */   nop
.L001F0440:
/* 0F0540 001F0440 8494828F */  lw          $2, -0x6B7C($28)
/* 0F0544 001F0444 60435024 */  addiu       $16, $2, 0x4360
/* 0F0548 001F0448 28260072 */  paddub      $4, $16, $0
/* 0F054C 001F044C 6CAF070C */  jal         SeitonShopItemBoard__FP9ITEM_PACK
/* 0F0550 001F0450 00000000 */   nop
/* 0F0554 001F0454 28260072 */  paddub      $4, $16, $0
/* 0F0558 001F0458 98B9080C */  jal         SetMenuTrushMark__FP9ITEM_PACK
/* 0F055C 001F045C 00000000 */   nop
/* 0F0560 001F0460 06000010 */  b           .L001F047C
/* 0F0564 001F0464 00000000 */   nop
.L001F0468:
/* 0F0568 001F0468 8494828F */  lw          $2, -0x6B7C($28)
/* 0F056C 001F046C 04054424 */  addiu       $4, $2, 0x504
/* 0F0570 001F0470 F87F8424 */  addiu       $4, $4, 0x7FF8
/* 0F0574 001F0474 20B0070C */  jal         SeitonShopAttachBoard__FP11ATTACH_LIST
/* 0F0578 001F0478 00000000 */   nop
.L001F047C:
/* 0F057C 001F047C 01000424 */  addiu       $4, $0, 0x1
/* 0F0580 001F0480 BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F0584 001F0484 00000000 */   nop
.L001F0488:
/* 0F0588 001F0488 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0F058C 001F048C E400228C */  lw          $2, %lo(ShopMenu + 0x14)($1)
/* 0F0590 001F0490 0500C217 */  bne         $30, $2, .L001F04A8
/* 0F0594 001F0494 00000000 */   nop
/* 0F0598 001F0498 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0F059C 001F049C DC00228C */  lw          $2, %lo(ShopMenu + 0xC)($1)
/* 0F05A0 001F04A0 0400E212 */  beq         $23, $2, .L001F04B4
/* 0F05A4 001F04A4 00000000 */   nop
.L001F04A8:
/* 0F05A8 001F04A8 28260070 */  paddub      $4, $0, $0
/* 0F05AC 001F04AC BCB3080C */  jal         ComMenuSePlay__Fi
/* 0F05B0 001F04B0 00000000 */   nop
.L001F04B4:
/* 0F05B4 001F04B4 28860070 */  paddub      $16, $0, $0
/* 0F05B8 001F04B8 288E0070 */  paddub      $17, $0, $0
/* 0F05BC 001F04BC FFFF1224 */  addiu       $18, $0, -0x1
/* 0F05C0 001F04C0 B894828F */  lw          $2, -0x6B48($28)
/* 0F05C4 001F04C4 10004484 */  lh          $4, 0x10($2)
/* 0F05C8 001F04C8 51008228 */  slti        $2, $4, 0x51
/* 0F05CC 001F04CC 17004014 */  bnez        $2, .L001F052C
/* 0F05D0 001F04D0 00000000 */   nop
/* 0F05D4 001F04D4 7443070C */  jal         GetCommonItemInfo__Fi
/* 0F05D8 001F04D8 00000000 */   nop
/* 0F05DC 001F04DC 05004010 */  beqz        $2, .L001F04F4
/* 0F05E0 001F04E0 00000000 */   nop
/* 0F05E4 001F04E4 06004284 */  lh          $2, 0x6($2)
/* 0F05E8 001F04E8 F4015024 */  addiu       $16, $2, 0x1F4
/* 0F05EC 001F04EC 01000010 */  b           .L001F04F4
/* 0F05F0 001F04F0 00000000 */   nop
.L001F04F4:
/* 0F05F4 001F04F4 C094848F */  lw          $4, -0x6B40($28)
/* 0F05F8 001F04F8 2C98080C */  jal         GetAttachVolumeForMsg__FP11ATTACH_LIST
/* 0F05FC 001F04FC 00000000 */   nop
/* 0F0600 001F0500 288E4070 */  paddub      $17, $2, $0
/* 0F0604 001F0504 B894828F */  lw          $2, -0x6B48($28)
/* 0F0608 001F0508 10004384 */  lh          $3, 0x10($2)
/* 0F060C 001F050C 5A000224 */  addiu       $2, $0, 0x5A
/* 0F0610 001F0510 06006214 */  bne         $3, $2, .L001F052C
/* 0F0614 001F0514 00000000 */   nop
/* 0F0618 001F0518 C094828F */  lw          $2, -0x6B40($28)
/* 0F061C 001F051C 02004484 */  lh          $4, 0x2($2)
/* 0F0620 001F0520 10AA080C */  jal         GetWeaponMsgNo2__Fi
/* 0F0624 001F0524 00000000 */   nop
/* 0F0628 001F0528 28964070 */  paddub      $18, $2, $0
.L001F052C:
/* 0F062C 001F052C FFFF1324 */  addiu       $19, $0, -0x1
/* 0F0630 001F0530 D901013C */  lui         $1, %hi(ShopMenu + 0x14)
/* 0F0634 001F0534 E400258C */  lw          $5, %lo(ShopMenu + 0x14)($1)
/* 0F0638 001F0538 D901013C */  lui         $1, %hi(ShopMenu + 0x2)
/* 0F063C 001F053C D2002384 */  lh          $3, %lo(ShopMenu + 0x2)($1)
/* 0F0640 001F0540 01000424 */  addiu       $4, $0, 0x1
/* 0F0644 001F0544 2F006410 */  beq         $3, $4, .L001F0604
/* 0F0648 001F0548 00000000 */   nop
/* 0F064C 001F054C 09006010 */  beqz        $3, .L001F0574
/* 0F0650 001F0550 00000000 */   nop
/* 0F0654 001F0554 02000224 */  addiu       $2, $0, 0x2
/* 0F0658 001F0558 03006210 */  beq         $3, $2, .L001F0568
/* 0F065C 001F055C 00000000 */   nop
/* 0F0660 001F0560 68000010 */  b           .L001F0704
/* 0F0664 001F0564 00000000 */   nop
.L001F0568:
/* 0F0668 001F0568 B3041024 */  addiu       $16, $0, 0x4B3
/* 0F066C 001F056C 65000010 */  b           .L001F0704
/* 0F0670 001F0570 00000000 */   nop
.L001F0574:
/* 0F0674 001F0574 A094838F */  lw          $3, -0x6B60($28)
/* 0F0678 001F0578 80110500 */  sll         $2, $5, 6
/* 0F067C 001F057C 23104500 */  subu        $2, $2, $5
/* 0F0680 001F0580 80A80200 */  sll         $21, $2, 2
/* 0F0684 001F0584 21187500 */  addu        $3, $3, $21
/* 0F0688 001F0588 00007384 */  lh          $19, 0x0($3)
/* 0F068C 001F058C 0101622A */  slti        $2, $19, 0x101
/* 0F0690 001F0590 03004014 */  bnez        $2, .L001F05A0
/* 0F0694 001F0594 00000000 */   nop
/* 0F0698 001F0598 06007184 */  lh          $17, 0x6($3)
/* 0F069C 001F059C 00000000 */  nop
.L001F05A0:
/* 0F06A0 001F05A0 5B00622A */  slti        $2, $19, 0x5B
/* 0F06A4 001F05A4 09004014 */  bnez        $2, .L001F05CC
/* 0F06A8 001F05A8 00000000 */   nop
/* 0F06AC 001F05AC 5F00612A */  slti        $1, $19, 0x5F
/* 0F06B0 001F05B0 06002010 */  beqz        $1, .L001F05CC
/* 0F06B4 001F05B4 00000000 */   nop
/* 0F06B8 001F05B8 04007424 */  addiu       $20, $3, 0x4
/* 0F06BC 001F05BC 28268072 */  paddub      $4, $20, $0
/* 0F06C0 001F05C0 2C98080C */  jal         GetAttachVolumeForMsg__FP11ATTACH_LIST
/* 0F06C4 001F05C4 00000000 */   nop
/* 0F06C8 001F05C8 288E4070 */  paddub      $17, $2, $0
.L001F05CC:
/* 0F06CC 001F05CC 5A000224 */  addiu       $2, $0, 0x5A
/* 0F06D0 001F05D0 4C006216 */  bne         $19, $2, .L001F0704
/* 0F06D4 001F05D4 00000000 */   nop
/* 0F06D8 001F05D8 A094828F */  lw          $2, -0x6B60($28)
/* 0F06DC 001F05DC 2110A202 */  addu        $2, $21, $2
/* 0F06E0 001F05E0 06004484 */  lh          $4, 0x6($2)
/* 0F06E4 001F05E4 10AA080C */  jal         GetWeaponMsgNo2__Fi
/* 0F06E8 001F05E8 00000000 */   nop
/* 0F06EC 001F05EC 28964070 */  paddub      $18, $2, $0
/* 0F06F0 001F05F0 A094828F */  lw          $2, -0x6B60($28)
/* 0F06F4 001F05F4 2110A202 */  addu        $2, $21, $2
/* 0F06F8 001F05F8 0A005180 */  lb          $17, 0xA($2)
/* 0F06FC 001F05FC 41000010 */  b           .L001F0704
/* 0F0700 001F0600 00000000 */   nop
.L001F0604:
/* 0F0704 001F0604 D901013C */  lui         $1, %hi(ShopMenu + 0xC)
/* 0F0708 001F0608 DC00238C */  lw          $3, %lo(ShopMenu + 0xC)($1)
/* 0F070C 001F060C 02000224 */  addiu       $2, $0, 0x2
/* 0F0710 001F0610 26006210 */  beq         $3, $2, .L001F06AC
/* 0F0714 001F0614 00000000 */   nop
/* 0F0718 001F0618 0C006410 */  beq         $3, $4, .L001F064C
/* 0F071C 001F061C 00000000 */   nop
/* 0F0720 001F0620 03006010 */  beqz        $3, .L001F0630
/* 0F0724 001F0624 00000000 */   nop
/* 0F0728 001F0628 36000010 */  b           .L001F0704
/* 0F072C 001F062C 00000000 */   nop
.L001F0630:
/* 0F0730 001F0630 8494828F */  lw          $2, -0x6B7C($28)
/* 0F0734 001F0634 60434324 */  addiu       $3, $2, 0x4360
/* 0F0738 001F0638 40100500 */  sll         $2, $5, 1
/* 0F073C 001F063C 21104300 */  addu        $2, $2, $3
/* 0F0740 001F0640 0E005384 */  lh          $19, 0xE($2)
/* 0F0744 001F0644 2F000010 */  b           .L001F0704
/* 0F0748 001F0648 00000000 */   nop
.L001F064C:
/* 0F074C 001F064C 8494848F */  lw          $4, -0x6B7C($28)
/* 0F0750 001F0650 0A000224 */  addiu       $2, $0, 0xA
/* 0F0754 001F0654 1A00A200 */  div         $0, $5, $2
/* 0F0758 001F0658 02004014 */  bnez        $2, .L001F0664
/* 0F075C 001F065C 00000000 */   nop
/* 0F0760 001F0660 CD010000 */  break       0, 7
.L001F0664:
/* 0F0764 001F0664 12180000 */  mflo        $3
/* 0F0768 001F0668 A80A0224 */  addiu       $2, $0, 0xAA8
/* 0F076C 001F066C 18106200 */  mult        $2, $3, $2
/* 0F0770 001F0670 21108200 */  addu        $2, $4, $2
/* 0F0774 001F0674 0C454424 */  addiu       $4, $2, 0x450C
/* 0F0778 001F0678 0A000224 */  addiu       $2, $0, 0xA
/* 0F077C 001F067C 1A00A200 */  div         $0, $5, $2
/* 0F0780 001F0680 00000000 */  nop
/* 0F0784 001F0684 00000000 */  nop
/* 0F0788 001F0688 10180000 */  mfhi        $3
/* 0F078C 001F068C 40110300 */  sll         $2, $3, 5
/* 0F0790 001F0690 23104300 */  subu        $2, $2, $3
/* 0F0794 001F0694 C0100200 */  sll         $2, $2, 3
/* 0F0798 001F0698 21108200 */  addu        $2, $4, $2
/* 0F079C 001F069C 00005384 */  lh          $19, 0x0($2)
/* 0F07A0 001F06A0 02005184 */  lh          $17, 0x2($2)
/* 0F07A4 001F06A4 17000010 */  b           .L001F0704
/* 0F07A8 001F06A8 00000000 */   nop
.L001F06AC:
/* 0F07AC 001F06AC 8494828F */  lw          $2, -0x6B7C($28)
/* 0F07B0 001F06B0 04054324 */  addiu       $3, $2, 0x504
/* 0F07B4 001F06B4 F87F6324 */  addiu       $3, $3, 0x7FF8
/* 0F07B8 001F06B8 40110500 */  sll         $2, $5, 5
/* 0F07BC 001F06BC 21A06200 */  addu        $20, $3, $2
/* 0F07C0 001F06C0 10008012 */  beqz        $20, .L001F0704
/* 0F07C4 001F06C4 00000000 */   nop
/* 0F07C8 001F06C8 00009386 */  lh          $19, 0x0($20)
/* 0F07CC 001F06CC 0D00601A */  blez        $19, .L001F0704
/* 0F07D0 001F06D0 00000000 */   nop
/* 0F07D4 001F06D4 28268072 */  paddub      $4, $20, $0
/* 0F07D8 001F06D8 2C98080C */  jal         GetAttachVolumeForMsg__FP11ATTACH_LIST
/* 0F07DC 001F06DC 00000000 */   nop
/* 0F07E0 001F06E0 288E4070 */  paddub      $17, $2, $0
/* 0F07E4 001F06E4 00008386 */  lh          $3, 0x0($20)
/* 0F07E8 001F06E8 5A000224 */  addiu       $2, $0, 0x5A
/* 0F07EC 001F06EC 05006214 */  bne         $3, $2, .L001F0704
/* 0F07F0 001F06F0 00000000 */   nop
/* 0F07F4 001F06F4 02008486 */  lh          $4, 0x2($20)
/* 0F07F8 001F06F8 10AA080C */  jal         GetWeaponMsgNo2__Fi
/* 0F07FC 001F06FC 00000000 */   nop
/* 0F0800 001F0700 28964070 */  paddub      $18, $2, $0
.L001F0704:
/* 0F0804 001F0704 5100622A */  slti        $2, $19, 0x51
/* 0F0808 001F0708 08004014 */  bnez        $2, .L001F072C
/* 0F080C 001F070C 00000000 */   nop
/* 0F0810 001F0710 28266072 */  paddub      $4, $19, $0
/* 0F0814 001F0714 7443070C */  jal         GetCommonItemInfo__Fi
/* 0F0818 001F0718 00000000 */   nop
/* 0F081C 001F071C 03004010 */  beqz        $2, .L001F072C
/* 0F0820 001F0720 00000000 */   nop
/* 0F0824 001F0724 06004284 */  lh          $2, 0x6($2)
/* 0F0828 001F0728 F4015024 */  addiu       $16, $2, 0x1F4
.L001F072C:
/* 0F082C 001F072C DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16BC)
/* 0F0830 001F0730 0C3A228C */  lw          $2, %lo(CommonMenuMes2 + 0x16BC)($1)
/* 0F0834 001F0734 0C005014 */  bne         $2, $16, .L001F0768
/* 0F0838 001F0738 00000000 */   nop
/* 0F083C 001F073C 0600401A */  blez        $18, .L001F0758
/* 0F0840 001F0740 00000000 */   nop
/* 0F0844 001F0744 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16E0)
/* 0F0848 001F0748 303A238C */  lw          $3, %lo(CommonMenuMes2 + 0x16E0)($1)
/* 0F084C 001F074C 64004226 */  addiu       $2, $18, 0x64
/* 0F0850 001F0750 05006214 */  bne         $3, $2, .L001F0768
/* 0F0854 001F0754 00000000 */   nop
.L001F0758:
/* 0F0858 001F0758 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x1728)
/* 0F085C 001F075C 783A228C */  lw          $2, %lo(CommonMenuMes2 + 0x1728)($1)
/* 0F0860 001F0760 19005110 */  beq         $2, $17, .L.L001F07C8$b
/* 0F0864 001F0764 00000000 */   nop
.L001F0768:
/* 0F0868 001F0768 01000224 */  addiu       $2, $0, 0x1
/* 0F086C 001F076C DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x172C)
/* 0F0870 001F0770 7C3A22AC */  sw          $2, %lo(CommonMenuMes2 + 0x172C)($1)
/* 0F0874 001F0774 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x1730)
/* 0F0878 001F0778 803A20AC */  sw          $0, %lo(CommonMenuMes2 + 0x1730)($1)
/* 0F087C 001F077C DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x1728)
/* 0F0880 001F0780 783A31AC */  sw          $17, %lo(CommonMenuMes2 + 0x1728)($1)
/* 0F0884 001F0784 0400401A */  blez        $18, .L001F0798
/* 0F0888 001F0788 00000000 */   nop
/* 0F088C 001F078C 64004226 */  addiu       $2, $18, 0x64
/* 0F0890 001F0790 DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16E0)
/* 0F0894 001F0794 303A22AC */  sw          $2, %lo(CommonMenuMes2 + 0x16E0)($1)
.L001F0798:
/* 0F0898 001F0798 F501012A */  slti        $1, $16, 0x1F5
/* 0F089C 001F079C 02002010 */  beqz        $1, .L001F07A8
/* 0F08A0 001F07A0 00000000 */   nop
/* 0F08A4 001F07A4 28860070 */  paddub      $16, $0, $0
.L001F07A8:
/* 0F08A8 001F07A8 FFFF0224 */  addiu       $2, $0, -0x1
/* 0F08AC 001F07AC DA01013C */  lui         $1, %hi(CommonMenuMes2 + 0x16BC)
/* 0F08B0 001F07B0 0C3A22AC */  sw          $2, %lo(CommonMenuMes2 + 0x16BC)($1)
/* 0F08B4 001F07B4 DA01023C */  lui         $2, %hi(CommonMenuMes2)
/* 0F08B8 001F07B8 50234424 */  addiu       $4, $2, %lo(CommonMenuMes2)
/* 0F08BC 001F07BC 282E0072 */  paddub      $5, $16, $0
/* 0F08C0 001F07C0 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0F08C4 001F07C4 00000000 */   nop
jlabel .L001F07C8
.L.L001F07C8$b:
/* 0F08C8 001F07C8 2816C072 */  paddub      $2, $22, $0
.L001F07CC:
/* 0F08CC 001F07CC 9000BF7B */  lq          $31, 0x90($29)
/* 0F08D0 001F07D0 8000BE7B */  lq          $30, 0x80($29)
/* 0F08D4 001F07D4 7000B77B */  lq          $23, 0x70($29)
/* 0F08D8 001F07D8 6000B67B */  lq          $22, 0x60($29)
/* 0F08DC 001F07DC 5000B57B */  lq          $21, 0x50($29)
/* 0F08E0 001F07E0 4000B47B */  lq          $20, 0x40($29)
/* 0F08E4 001F07E4 3000B37B */  lq          $19, 0x30($29)
/* 0F08E8 001F07E8 2000B27B */  lq          $18, 0x20($29)
/* 0F08EC 001F07EC 1000B17B */  lq          $17, 0x10($29)
/* 0F08F0 001F07F0 0000B07B */  lq          $16, 0x0($29)
/* 0F08F4 001F07F4 A003BD27 */  addiu       $29, $29, 0x3A0
/* 0F08F8 001F07F8 0800E003 */  jr          $31
/* 0F08FC 001F07FC 00000000 */   nop
