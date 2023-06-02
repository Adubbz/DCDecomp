.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BattleSubWeaponDmg__Ffi
/* B5E90 001B5D90 70FFBD27 */  addiu      $sp, $sp, -0x90
/* B5E94 001B5D94 6000BF7F */  sq         $31, 0x60($sp)
/* B5E98 001B5D98 5000B47F */  sq         $20, 0x50($sp)
/* B5E9C 001B5D9C 4000B37F */  sq         $19, 0x40($sp)
/* B5EA0 001B5DA0 3000B27F */  sq         $18, 0x30($sp)
/* B5EA4 001B5DA4 2000B17F */  sq         $17, 0x20($sp)
/* B5EA8 001B5DA8 1000B07F */  sq         $16, 0x10($sp)
/* B5EAC 001B5DAC 0400B5E7 */  swc1       $f21, 0x4($sp)
/* B5EB0 001B5DB0 0000B4E7 */  swc1       $f20, 0x0($sp)
/* B5EB4 001B5DB4 46650046 */  mov.s      $f21, $f12
/* B5EB8 001B5DB8 28A68070 */  paddub     $20, $4, $0
/* B5EBC 001B5DBC 2700023C */  lui        $2, %hi(_612)
/* B5EC0 001B5DC0 D0B14224 */  addiu      $2, $2, %lo(_612)
/* B5EC4 001B5DC4 7000A427 */  addiu      $4, $sp, 0x70
/* B5EC8 001B5DC8 00004378 */  lq         $3, 0x0($2)
/* B5ECC 001B5DCC 100042DC */  ld         $2, 0x10($2)
/* B5ED0 001B5DD0 0000837C */  sq         $3, 0x0($4)
/* B5ED4 001B5DD4 100082FC */  sd         $2, 0x10($4)
/* B5ED8 001B5DD8 789C848F */  lw         $4, -0x6388($gp)
/* B5EDC 001B5DDC 04009080 */  lb         $16, 0x4($4)
/* B5EE0 001B5DE0 21100402 */  addu       $2, $16, $4
/* B5EE4 001B5DE4 40434380 */  lb         $3, 0x4340($2)
/* B5EE8 001B5DE8 40110300 */  sll        $2, $3, 5
/* B5EEC 001B5DEC 23104300 */  subu       $2, $2, $3
/* B5EF0 001B5DF0 C0180200 */  sll        $3, $2, 3
/* B5EF4 001B5DF4 A80A0224 */  addiu      $2, $0, 0xAA8
/* B5EF8 001B5DF8 18980202 */  mult       $19, $16, $2
/* B5EFC 001B5DFC 21109300 */  addu       $2, $4, $19
/* B5F00 001B5E00 21104300 */  addu       $2, $2, $3
/* B5F04 001B5E04 0C455224 */  addiu      $18, $2, 0x450C
/* B5F08 001B5E08 0C454384 */  lh         $3, 0x450C($2)
/* B5F0C 001B5E0C 0C010224 */  addiu      $2, $0, 0x10C
/* B5F10 001B5E10 0A006214 */  bne        $3, $2, .L001B5E3C
/* B5F14 001B5E14 00000000 */   nop
/* B5F18 001B5E18 1C8D848F */  lw         $4, -0x72E4($gp)
/* B5F1C 001B5E1C 30000524 */  addiu      $5, $0, 0x30
/* B5F20 001B5E20 8060050C */  jal        GetGameFlag__9CSaveDataFi
/* B5F24 001B5E24 00000000 */   nop
/* B5F28 001B5E28 04004014 */  bnez       $2, .L001B5E3C
/* B5F2C 001B5E2C 00000000 */   nop
/* B5F30 001B5E30 28160070 */  paddub     $2, $0, $0
/* B5F34 001B5E34 27010010 */  b          .L001B62D4
/* B5F38 001B5E38 00000000 */   nop
.L001B5E3C:
/* B5F3C 001B5E3C EE004386 */  lh         $3, 0xEE($18)
/* B5F40 001B5E40 00026230 */  andi       $2, $3, 0x200
/* B5F44 001B5E44 05004010 */  beqz       $2, .L001B5E5C
/* B5F48 001B5E48 00000000 */   nop
/* B5F4C 001B5E4C 003F023C */  lui        $2, (0x3F000000 >> 16)
/* B5F50 001B5E50 00008244 */  mtc1       $2, $f0
/* B5F54 001B5E54 00000000 */  nop
/* B5F58 001B5E58 42AD0046 */  mul.s      $f21, $f21, $f0
.L001B5E5C:
/* B5F5C 001B5E5C 00016230 */  andi       $2, $3, 0x100
/* B5F60 001B5E60 05004010 */  beqz       $2, .L001B5E78
/* B5F64 001B5E64 00000000 */   nop
/* B5F68 001B5E68 0040023C */  lui        $2, (0x40000000 >> 16)
/* B5F6C 001B5E6C 00008244 */  mtc1       $2, $f0
/* B5F70 001B5E70 00000000 */  nop
/* B5F74 001B5E74 42AD0046 */  mul.s      $f21, $f21, $f0
.L001B5E78:
/* B5F78 001B5E78 80101000 */  sll        $2, $16, 2
/* B5F7C 001B5E7C 21105D00 */  addu       $2, $2, $sp
/* B5F80 001B5E80 7000518C */  lw         $17, 0x70($2)
/* B5F84 001B5E84 789C848F */  lw         $4, -0x6388($gp)
/* B5F88 001B5E88 21100402 */  addu       $2, $16, $4
/* B5F8C 001B5E8C 40434380 */  lb         $3, 0x4340($2)
/* B5F90 001B5E90 40110300 */  sll        $2, $3, 5
/* B5F94 001B5E94 23104300 */  subu       $2, $2, $3
/* B5F98 001B5E98 C0180200 */  sll        $3, $2, 3
/* B5F9C 001B5E9C 21106402 */  addu       $2, $19, $4
/* B5FA0 001B5EA0 21106200 */  addu       $2, $3, $2
/* B5FA4 001B5EA4 0C454284 */  lh         $2, 0x450C($2)
/* B5FA8 001B5EA8 04002216 */  bne        $17, $2, .L001B5EBC
/* B5FAC 001B5EAC 00000000 */   nop
/* B5FB0 001B5EB0 28160070 */  paddub     $2, $0, $0
/* B5FB4 001B5EB4 07010010 */  b          .L001B62D4
/* B5FB8 001B5EB8 00000000 */   nop
.L001B5EBC:
/* B5FBC 001B5EBC 049D828F */  lw         $2, -0x62FC($gp)
/* B5FC0 001B5EC0 06004284 */  lh         $2, 0x6($2)
/* B5FC4 001B5EC4 00008244 */  mtc1       $2, $f0
/* B5FC8 001B5EC8 00000000 */  nop
/* B5FCC 001B5ECC 60008046 */  cvt.s.w    $f1, $f0
/* B5FD0 001B5ED0 148480C7 */  lwc1       $f0, -0x7BEC($gp)
/* B5FD4 001B5ED4 42000146 */  mul.s      $f1, $f0, $f1
/* B5FD8 001B5ED8 C03F023C */  lui        $2, (0x3FC00000 >> 16)
/* B5FDC 001B5EDC 00008244 */  mtc1       $2, $f0
/* B5FE0 001B5EE0 00000000 */  nop
/* B5FE4 001B5EE4 81000146 */  sub.s      $f2, $f0, $f1
/* B5FE8 001B5EE8 100054C6 */  lwc1       $f20, 0x10($18)
/* B5FEC 001B5EEC 82101546 */  mul.s      $f2, $f2, $f21
/* B5FF0 001B5EF0 00009444 */  mtc1       $20, $f0
/* B5FF4 001B5EF4 00000000 */  nop
/* B5FF8 001B5EF8 60008046 */  cvt.s.w    $f1, $f0
/* B5FFC 001B5EFC 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* B6000 001B5F00 02000146 */  mul.s      $f0, $f0, $f1
/* B6004 001B5F04 80100046 */  add.s      $f2, $f2, $f0
/* B6008 001B5F08 41A00246 */  sub.s      $f1, $f20, $f2
/* B600C 001B5F0C 100041E6 */  swc1       $f1, 0x10($18)
/* B6010 001B5F10 00008044 */  mtc1       $0, $f0
/* B6014 001B5F14 00000000 */  nop
/* B6018 001B5F18 36080046 */  c.le.s     $f1, $f0
/* B601C 001B5F1C 00000000 */  nop
/* B6020 001B5F20 1D000045 */  bc1f       .L001B5F98
/* B6024 001B5F24 00000000 */   nop
/* B6028 001B5F28 789C848F */  lw         $4, -0x6388($gp)
/* B602C 001B5F2C B7000524 */  addiu      $5, $0, 0xB7
/* B6030 001B5F30 18F9060C */  jal        CheckActItemSlot__14CDngStatusDataFi
/* B6034 001B5F34 00000000 */   nop
/* B6038 001B5F38 FFFF0324 */  addiu      $3, $0, -0x1
/* B603C 001B5F3C 16004310 */  beq        $2, $3, .L001B5F98
/* B6040 001B5F40 00000000 */   nop
/* B6044 001B5F44 01004424 */  addiu      $4, $2, 0x1
/* B6048 001B5F48 74FE760C */  jal        func_1DBF9D0
/* B604C 001B5F4C 00000000 */   nop
/* B6050 001B5F50 0C004286 */  lh         $2, 0xC($18)
/* B6054 001B5F54 00008244 */  mtc1       $2, $f0
/* B6058 001B5F58 00000000 */  nop
/* B605C 001B5F5C 20008046 */  cvt.s.w    $f0, $f0
/* B6060 001B5F60 100040E6 */  swc1       $f0, 0x10($18)
/* B6064 001B5F64 BC000224 */  addiu      $2, $0, 0xBC
/* B6068 001B5F68 EA01013C */  lui        $at, (0x1EA76B4 >> 16)
/* B606C 001B5F6C B47622AC */  sw         $2, (0x1EA76B4 & 0xFFFF)($at)
/* B6070 001B5F70 F0000224 */  addiu      $2, $0, 0xF0
/* B6074 001B5F74 EA01013C */  lui        $at, (0x1EA7694 >> 16)
/* B6078 001B5F78 947622AC */  sw         $2, (0x1EA7694 & 0xFFFF)($at)
/* B607C 001B5F7C EA01013C */  lui        $at, (0x1EA76AC >> 16)
/* B6080 001B5F80 AC7620AC */  sw         $0, (0x1EA76AC & 0xFFFF)($at)
/* B6084 001B5F84 18000424 */  addiu      $4, $0, 0x18
/* B6088 001B5F88 FFFF0524 */  addiu      $5, $0, -0x1
/* B608C 001B5F8C 28360070 */  paddub     $6, $0, $0
/* B6090 001B5F90 AC69050C */  jal        SndSePlay__Fiii
/* B6094 001B5F94 00000000 */   nop
.L001B5F98:
/* B6098 001B5F98 100041C6 */  lwc1       $f1, 0x10($18)
/* B609C 001B5F9C 00008044 */  mtc1       $0, $f0
/* B60A0 001B5FA0 00000000 */  nop
/* B60A4 001B5FA4 36080046 */  c.le.s     $f1, $f0
/* B60A8 001B5FA8 00000000 */  nop
/* B60AC 001B5FAC 8A000045 */  bc1f       .L001B61D8
/* B60B0 001B5FB0 00000000 */   nop
/* B60B4 001B5FB4 100040AE */  sw         $0, 0x10($18)
/* B60B8 001B5FB8 E0000424 */  addiu      $4, $0, 0xE0
/* B60BC 001B5FBC FFFF0524 */  addiu      $5, $0, -0x1
/* B60C0 001B5FC0 28360070 */  paddub     $6, $0, $0
/* B60C4 001B5FC4 AC69050C */  jal        SndSePlay__Fiii
/* B60C8 001B5FC8 00000000 */   nop
/* B60CC 001B5FCC 789C848F */  lw         $4, -0x6388($gp)
/* B60D0 001B5FD0 21100402 */  addu       $2, $16, $4
/* B60D4 001B5FD4 40434524 */  addiu      $5, $2, 0x4340
/* B60D8 001B5FD8 40434380 */  lb         $3, 0x4340($2)
/* B60DC 001B5FDC 40110300 */  sll        $2, $3, 5
/* B60E0 001B5FE0 23104300 */  subu       $2, $2, $3
/* B60E4 001B5FE4 C0100200 */  sll        $2, $2, 3
/* B60E8 001B5FE8 21206402 */  addu       $4, $19, $4
/* B60EC 001B5FEC 21104400 */  addu       $2, $2, $4
/* B60F0 001B5FF0 0C454284 */  lh         $2, 0x450C($2)
/* B60F4 001B5FF4 01002326 */  addiu      $3, $17, 0x1
/* B60F8 001B5FF8 1E006214 */  bne        $3, $2, .L001B6074
/* B60FC 001B5FFC 00000000 */   nop
/* B6100 001B6000 00004486 */  lh         $4, 0x0($18)
/* B6104 001B6004 0044070C */  jal        GetCommonItemDataSystemMsg__Fi
/* B6108 001B6008 00000000 */   nop
/* B610C 001B600C EA01013C */  lui        $at, (0x1EA769C >> 16)
/* B6110 001B6010 9C7622AC */  sw         $2, (0x1EA769C & 0xFFFF)($at)
/* B6114 001B6014 02004286 */  lh         $2, 0x2($18)
/* B6118 001B6018 EA01013C */  lui        $at, (0x1EA76A4 >> 16)
/* B611C 001B601C A47622AC */  sw         $2, (0x1EA76A4 & 0xFFFF)($at)
/* B6120 001B6020 A1000224 */  addiu      $2, $0, 0xA1
/* B6124 001B6024 EA01013C */  lui        $at, (0x1EA76B4 >> 16)
/* B6128 001B6028 B47622AC */  sw         $2, (0x1EA76B4 & 0xFFFF)($at)
/* B612C 001B602C E0010224 */  addiu      $2, $0, 0x1E0
/* B6130 001B6030 EA01013C */  lui        $at, (0x1EA7694 >> 16)
/* B6134 001B6034 947622AC */  sw         $2, (0x1EA7694 & 0xFFFF)($at)
/* B6138 001B6038 EA01013C */  lui        $at, (0x1EA76AC >> 16)
/* B613C 001B603C AC7620AC */  sw         $0, (0x1EA76AC & 0xFFFF)($at)
/* B6140 001B6040 28262072 */  paddub     $4, $17, $0
/* B6144 001B6044 282E4072 */  paddub     $5, $18, $0
/* B6148 001B6048 24C9080C */  jal        WepDataListToHaveCopy__FiP11WEAPON_HAVE
/* B614C 001B604C 00000000 */   nop
/* B6150 001B6050 049D848F */  lw         $4, -0x62FC($gp)
/* B6154 001B6054 A896080C */  jal        SetWeaponAttachStatus__FP11WEAPON_HAVE
/* B6158 001B6058 00000000 */   nop
/* B615C 001B605C 049D828F */  lw         $2, -0x62FC($gp)
/* B6160 001B6060 100040AC */  sw         $0, 0x10($2)
/* B6164 001B6064 100040AE */  sw         $0, 0x10($18)
/* B6168 001B6068 01000224 */  addiu      $2, $0, 0x1
/* B616C 001B606C 99000010 */  b          .L001B62D4
/* B6170 001B6070 00000000 */   nop
.L001B6074:
/* B6174 001B6074 3C140200 */  dsll32     $2, $2, 16
/* B6178 001B6078 3F140200 */  dsra32     $2, $2, 16
/* B617C 001B607C 56006210 */  beq        $3, $2, .L001B61D8
/* B6180 001B6080 00000000 */   nop
/* B6184 001B6084 0C459324 */  addiu      $19, $4, 0x450C
/* B6188 001B6088 28260070 */  paddub     $4, $0, $0
/* B618C 001B608C 4F000010 */  b          .L001B61CC
/* B6190 001B6090 00000000 */   nop
.L001B6094:
/* B6194 001B6094 00006386 */  lh         $3, 0x0($19)
/* B6198 001B6098 22007114 */  bne        $3, $17, .L001B6124
/* B619C 001B609C 00000000 */   nop
/* B61A0 001B60A0 0000A4A0 */  sb         $4, 0x0($5)
/* B61A4 001B60A4 049D848F */  lw         $4, -0x62FC($gp)
/* B61A8 001B60A8 A896080C */  jal        SetWeaponAttachStatus__FP11WEAPON_HAVE
/* B61AC 001B60AC 00000000 */   nop
/* B61B0 001B60B0 00004486 */  lh         $4, 0x0($18)
/* B61B4 001B60B4 0044070C */  jal        GetCommonItemDataSystemMsg__Fi
/* B61B8 001B60B8 00000000 */   nop
/* B61BC 001B60BC EA01013C */  lui        $at, (0x1EA769C >> 16)
/* B61C0 001B60C0 9C7622AC */  sw         $2, (0x1EA769C & 0xFFFF)($at)
/* B61C4 001B60C4 02004286 */  lh         $2, 0x2($18)
/* B61C8 001B60C8 EA01013C */  lui        $at, (0x1EA76A4 >> 16)
/* B61CC 001B60CC A47622AC */  sw         $2, (0x1EA76A4 & 0xFFFF)($at)
/* B61D0 001B60D0 00006486 */  lh         $4, 0x0($19)
/* B61D4 001B60D4 0044070C */  jal        GetCommonItemDataSystemMsg__Fi
/* B61D8 001B60D8 00000000 */   nop
/* B61DC 001B60DC EA01013C */  lui        $at, (0x1EA76A0 >> 16)
/* B61E0 001B60E0 A07622AC */  sw         $2, (0x1EA76A0 & 0xFFFF)($at)
/* B61E4 001B60E4 02006286 */  lh         $2, 0x2($19)
/* B61E8 001B60E8 EA01013C */  lui        $at, (0x1EA76A8 >> 16)
/* B61EC 001B60EC A87622AC */  sw         $2, (0x1EA76A8 & 0xFFFF)($at)
/* B61F0 001B60F0 A0000224 */  addiu      $2, $0, 0xA0
/* B61F4 001B60F4 EA01013C */  lui        $at, (0x1EA76B4 >> 16)
/* B61F8 001B60F8 B47622AC */  sw         $2, (0x1EA76B4 & 0xFFFF)($at)
/* B61FC 001B60FC E0010224 */  addiu      $2, $0, 0x1E0
/* B6200 001B6100 EA01013C */  lui        $at, (0x1EA7694 >> 16)
/* B6204 001B6104 947622AC */  sw         $2, (0x1EA7694 & 0xFFFF)($at)
/* B6208 001B6108 EA01013C */  lui        $at, (0x1EA76AC >> 16)
/* B620C 001B610C AC7620AC */  sw         $0, (0x1EA76AC & 0xFFFF)($at)
/* B6210 001B6110 FFFF0224 */  addiu      $2, $0, -0x1
/* B6214 001B6114 000042A6 */  sh         $2, 0x0($18)
/* B6218 001B6118 01000224 */  addiu      $2, $0, 0x1
/* B621C 001B611C 6D000010 */  b          .L001B62D4
/* B6220 001B6120 00000000 */   nop
.L001B6124:
/* B6224 001B6124 01002226 */  addiu      $2, $17, 0x1
/* B6228 001B6128 26006214 */  bne        $3, $2, .L001B61C4
/* B622C 001B612C 00000000 */   nop
/* B6230 001B6130 0000A4A0 */  sb         $4, 0x0($5)
/* B6234 001B6134 049D848F */  lw         $4, -0x62FC($gp)
/* B6238 001B6138 A896080C */  jal        SetWeaponAttachStatus__FP11WEAPON_HAVE
/* B623C 001B613C 00000000 */   nop
/* B6240 001B6140 00004486 */  lh         $4, 0x0($18)
/* B6244 001B6144 0044070C */  jal        GetCommonItemDataSystemMsg__Fi
/* B6248 001B6148 00000000 */   nop
/* B624C 001B614C EA01013C */  lui        $at, (0x1EA769C >> 16)
/* B6250 001B6150 9C7622AC */  sw         $2, (0x1EA769C & 0xFFFF)($at)
/* B6254 001B6154 02004286 */  lh         $2, 0x2($18)
/* B6258 001B6158 EA01013C */  lui        $at, (0x1EA76A4 >> 16)
/* B625C 001B615C A47622AC */  sw         $2, (0x1EA76A4 & 0xFFFF)($at)
/* B6260 001B6160 00006486 */  lh         $4, 0x0($19)
/* B6264 001B6164 0044070C */  jal        GetCommonItemDataSystemMsg__Fi
/* B6268 001B6168 00000000 */   nop
/* B626C 001B616C EA01013C */  lui        $at, (0x1EA76A0 >> 16)
/* B6270 001B6170 A07622AC */  sw         $2, (0x1EA76A0 & 0xFFFF)($at)
/* B6274 001B6174 02006286 */  lh         $2, 0x2($19)
/* B6278 001B6178 EA01013C */  lui        $at, (0x1EA76A8 >> 16)
/* B627C 001B617C A87622AC */  sw         $2, (0x1EA76A8 & 0xFFFF)($at)
/* B6280 001B6180 A0000224 */  addiu      $2, $0, 0xA0
/* B6284 001B6184 EA01013C */  lui        $at, (0x1EA76B4 >> 16)
/* B6288 001B6188 B47622AC */  sw         $2, (0x1EA76B4 & 0xFFFF)($at)
/* B628C 001B618C E0010224 */  addiu      $2, $0, 0x1E0
/* B6290 001B6190 EA01013C */  lui        $at, (0x1EA7694 >> 16)
/* B6294 001B6194 947622AC */  sw         $2, (0x1EA7694 & 0xFFFF)($at)
/* B6298 001B6198 EA01013C */  lui        $at, (0x1EA76AC >> 16)
/* B629C 001B619C AC7620AC */  sw         $0, (0x1EA76AC & 0xFFFF)($at)
/* B62A0 001B61A0 03000224 */  addiu      $2, $0, 0x3
/* B62A4 001B61A4 02000216 */  bne        $16, $2, .L001B61B0
/* B62A8 001B61A8 00000000 */   nop
/* B62AC 001B61AC 160060A2 */  sb         $0, 0x16($19)
.L001B61B0:
/* B62B0 001B61B0 FFFF0224 */  addiu      $2, $0, -0x1
/* B62B4 001B61B4 000042A6 */  sh         $2, 0x0($18)
/* B62B8 001B61B8 02000224 */  addiu      $2, $0, 0x2
/* B62BC 001B61BC 45000010 */  b          .L001B62D4
/* B62C0 001B61C0 00000000 */   nop
.L001B61C4:
/* B62C4 001B61C4 F8007326 */  addiu      $19, $19, 0xF8
/* B62C8 001B61C8 01008424 */  addiu      $4, $4, 0x1
.L001B61CC:
/* B62CC 001B61CC 0A008228 */  slti       $2, $4, 0xA
/* B62D0 001B61D0 B0FF4014 */  bnez       $2, .L001B6094
/* B62D4 001B61D4 00000000 */   nop
.L001B61D8:
/* B62D8 001B61D8 0C004286 */  lh         $2, 0xC($18)
/* B62DC 001B61DC 00008244 */  mtc1       $2, $f0
/* B62E0 001B61E0 00000000 */  nop
/* B62E4 001B61E4 60008046 */  cvt.s.w    $f1, $f0
/* B62E8 001B61E8 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* B62EC 001B61EC 42000146 */  mul.s      $f1, $f0, $f1
/* B62F0 001B61F0 36081446 */  c.le.s     $f1, $f20
/* B62F4 001B61F4 00000000 */  nop
/* B62F8 001B61F8 16000045 */  bc1f       .L001B6254
/* B62FC 001B61FC 00000000 */   nop
/* B6300 001B6200 100040C6 */  lwc1       $f0, 0x10($18)
/* B6304 001B6204 36080046 */  c.le.s     $f1, $f0
/* B6308 001B6208 00000000 */  nop
/* B630C 001B620C 11000145 */  bc1t       .L001B6254
/* B6310 001B6210 00000000 */   nop
/* B6314 001B6214 00004486 */  lh         $4, 0x0($18)
/* B6318 001B6218 0044070C */  jal        GetCommonItemDataSystemMsg__Fi
/* B631C 001B621C 00000000 */   nop
/* B6320 001B6220 EA01013C */  lui        $at, (0x1EA769C >> 16)
/* B6324 001B6224 9C7622AC */  sw         $2, (0x1EA769C & 0xFFFF)($at)
/* B6328 001B6228 02004286 */  lh         $2, 0x2($18)
/* B632C 001B622C EA01013C */  lui        $at, (0x1EA76A4 >> 16)
/* B6330 001B6230 A47622AC */  sw         $2, (0x1EA76A4 & 0xFFFF)($at)
/* B6334 001B6234 97000224 */  addiu      $2, $0, 0x97
/* B6338 001B6238 EA01013C */  lui        $at, (0x1EA76B4 >> 16)
/* B633C 001B623C B47622AC */  sw         $2, (0x1EA76B4 & 0xFFFF)($at)
/* B6340 001B6240 F0000224 */  addiu      $2, $0, 0xF0
/* B6344 001B6244 EA01013C */  lui        $at, (0x1EA7694 >> 16)
/* B6348 001B6248 947622AC */  sw         $2, (0x1EA7694 & 0xFFFF)($at)
/* B634C 001B624C EA01013C */  lui        $at, (0x1EA76AC >> 16)
/* B6350 001B6250 AC7620AC */  sw         $0, (0x1EA76AC & 0xFFFF)($at)
.L001B6254:
/* B6354 001B6254 0C004286 */  lh         $2, 0xC($18)
/* B6358 001B6258 00008244 */  mtc1       $2, $f0
/* B635C 001B625C 00000000 */  nop
/* B6360 001B6260 60008046 */  cvt.s.w    $f1, $f0
/* B6364 001B6264 C08480C7 */  lwc1       $f0, -0x7B40($gp)
/* B6368 001B6268 42000146 */  mul.s      $f1, $f0, $f1
/* B636C 001B626C 36081446 */  c.le.s     $f1, $f20
/* B6370 001B6270 00000000 */  nop
/* B6374 001B6274 16000045 */  bc1f       .L001B62D0
/* B6378 001B6278 00000000 */   nop
/* B637C 001B627C 100040C6 */  lwc1       $f0, 0x10($18)
/* B6380 001B6280 36080046 */  c.le.s     $f1, $f0
/* B6384 001B6284 00000000 */  nop
/* B6388 001B6288 11000145 */  bc1t       .L001B62D0
/* B638C 001B628C 00000000 */   nop
/* B6390 001B6290 00004486 */  lh         $4, 0x0($18)
/* B6394 001B6294 0044070C */  jal        GetCommonItemDataSystemMsg__Fi
/* B6398 001B6298 00000000 */   nop
/* B639C 001B629C EA01013C */  lui        $at, (0x1EA769C >> 16)
/* B63A0 001B62A0 9C7622AC */  sw         $2, (0x1EA769C & 0xFFFF)($at)
/* B63A4 001B62A4 02004286 */  lh         $2, 0x2($18)
/* B63A8 001B62A8 EA01013C */  lui        $at, (0x1EA76A4 >> 16)
/* B63AC 001B62AC A47622AC */  sw         $2, (0x1EA76A4 & 0xFFFF)($at)
/* B63B0 001B62B0 98000224 */  addiu      $2, $0, 0x98
/* B63B4 001B62B4 EA01013C */  lui        $at, (0x1EA76B4 >> 16)
/* B63B8 001B62B8 B47622AC */  sw         $2, (0x1EA76B4 & 0xFFFF)($at)
/* B63BC 001B62BC F0000224 */  addiu      $2, $0, 0xF0
/* B63C0 001B62C0 EA01013C */  lui        $at, (0x1EA7694 >> 16)
/* B63C4 001B62C4 947622AC */  sw         $2, (0x1EA7694 & 0xFFFF)($at)
/* B63C8 001B62C8 EA01013C */  lui        $at, (0x1EA76AC >> 16)
/* B63CC 001B62CC AC7620AC */  sw         $0, (0x1EA76AC & 0xFFFF)($at)
.L001B62D0:
/* B63D0 001B62D0 28160070 */  paddub     $2, $0, $0
.L001B62D4:
/* B63D4 001B62D4 6000BF7B */  lq         $31, 0x60($sp)
/* B63D8 001B62D8 5000B47B */  lq         $20, 0x50($sp)
/* B63DC 001B62DC 4000B37B */  lq         $19, 0x40($sp)
/* B63E0 001B62E0 3000B27B */  lq         $18, 0x30($sp)
/* B63E4 001B62E4 2000B17B */  lq         $17, 0x20($sp)
/* B63E8 001B62E8 1000B07B */  lq         $16, 0x10($sp)
/* B63EC 001B62EC 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* B63F0 001B62F0 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* B63F4 001B62F4 9000BD27 */  addiu      $sp, $sp, 0x90
/* B63F8 001B62F8 0800E003 */  jr         $31
/* B63FC 001B62FC 00000000 */   nop
