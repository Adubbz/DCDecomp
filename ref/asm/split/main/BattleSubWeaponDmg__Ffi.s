.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BattleSubWeaponDmg__Ffi
/* 0B5E90 001B5D90 70FFBD27 */  addiu       $29, $29, -0x90
/* 0B5E94 001B5D94 6000BF7F */  sq          $31, 0x60($29)
/* 0B5E98 001B5D98 5000B47F */  sq          $20, 0x50($29)
/* 0B5E9C 001B5D9C 4000B37F */  sq          $19, 0x40($29)
/* 0B5EA0 001B5DA0 3000B27F */  sq          $18, 0x30($29)
/* 0B5EA4 001B5DA4 2000B17F */  sq          $17, 0x20($29)
/* 0B5EA8 001B5DA8 1000B07F */  sq          $16, 0x10($29)
/* 0B5EAC 001B5DAC 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0B5EB0 001B5DB0 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0B5EB4 001B5DB4 46650046 */  mov.s       $f21, $f12
/* 0B5EB8 001B5DB8 28A68070 */  paddub      $20, $4, $0
/* 0B5EBC 001B5DBC 2700023C */  lui         $2, %hi(LIT_612)
/* 0B5EC0 001B5DC0 D0B14224 */  addiu       $2, $2, %lo(LIT_612)
/* 0B5EC4 001B5DC4 7000A427 */  addiu       $4, $29, 0x70
/* 0B5EC8 001B5DC8 00004378 */  lq          $3, 0x0($2)
/* 0B5ECC 001B5DCC 100042DC */  ld          $2, 0x10($2)
/* 0B5ED0 001B5DD0 0000837C */  sq          $3, 0x0($4)
/* 0B5ED4 001B5DD4 100082FC */  sd          $2, 0x10($4)
/* 0B5ED8 001B5DD8 789C848F */  lw          $4, -0x6388($28)
/* 0B5EDC 001B5DDC 04009080 */  lb          $16, 0x4($4)
/* 0B5EE0 001B5DE0 21100402 */  addu        $2, $16, $4
/* 0B5EE4 001B5DE4 40434380 */  lb          $3, 0x4340($2)
/* 0B5EE8 001B5DE8 40110300 */  sll         $2, $3, 5
/* 0B5EEC 001B5DEC 23104300 */  subu        $2, $2, $3
/* 0B5EF0 001B5DF0 C0180200 */  sll         $3, $2, 3
/* 0B5EF4 001B5DF4 A80A0224 */  addiu       $2, $0, 0xAA8
/* 0B5EF8 001B5DF8 18980202 */  mult        $19, $16, $2
/* 0B5EFC 001B5DFC 21109300 */  addu        $2, $4, $19
/* 0B5F00 001B5E00 21104300 */  addu        $2, $2, $3
/* 0B5F04 001B5E04 0C455224 */  addiu       $18, $2, 0x450C
/* 0B5F08 001B5E08 0C454384 */  lh          $3, 0x450C($2)
/* 0B5F0C 001B5E0C 0C010224 */  addiu       $2, $0, 0x10C
/* 0B5F10 001B5E10 0A006214 */  bne         $3, $2, .L001B5E3C
/* 0B5F14 001B5E14 00000000 */   nop
/* 0B5F18 001B5E18 1C8D848F */  lw          $4, -0x72E4($28)
/* 0B5F1C 001B5E1C 30000524 */  addiu       $5, $0, 0x30
/* 0B5F20 001B5E20 8060050C */  jal         GetGameFlag__9CSaveDataFi
/* 0B5F24 001B5E24 00000000 */   nop
/* 0B5F28 001B5E28 04004014 */  bnez        $2, .L001B5E3C
/* 0B5F2C 001B5E2C 00000000 */   nop
/* 0B5F30 001B5E30 28160070 */  paddub      $2, $0, $0
/* 0B5F34 001B5E34 27010010 */  b           .L001B62D4
/* 0B5F38 001B5E38 00000000 */   nop
.L001B5E3C:
/* 0B5F3C 001B5E3C EE004386 */  lh          $3, 0xEE($18)
/* 0B5F40 001B5E40 00026230 */  andi        $2, $3, 0x200
/* 0B5F44 001B5E44 05004010 */  beqz        $2, .L001B5E5C
/* 0B5F48 001B5E48 00000000 */   nop
/* 0B5F4C 001B5E4C 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 0B5F50 001B5E50 00008244 */  mtc1        $2, $f0
/* 0B5F54 001B5E54 00000000 */  nop
/* 0B5F58 001B5E58 42AD0046 */  mul.s       $f21, $f21, $f0
.L001B5E5C:
/* 0B5F5C 001B5E5C 00016230 */  andi        $2, $3, 0x100
/* 0B5F60 001B5E60 05004010 */  beqz        $2, .L001B5E78
/* 0B5F64 001B5E64 00000000 */   nop
/* 0B5F68 001B5E68 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0B5F6C 001B5E6C 00008244 */  mtc1        $2, $f0
/* 0B5F70 001B5E70 00000000 */  nop
/* 0B5F74 001B5E74 42AD0046 */  mul.s       $f21, $f21, $f0
.L001B5E78:
/* 0B5F78 001B5E78 80101000 */  sll         $2, $16, 2
/* 0B5F7C 001B5E7C 21105D00 */  addu        $2, $2, $29
/* 0B5F80 001B5E80 7000518C */  lw          $17, 0x70($2)
/* 0B5F84 001B5E84 789C848F */  lw          $4, -0x6388($28)
/* 0B5F88 001B5E88 21100402 */  addu        $2, $16, $4
/* 0B5F8C 001B5E8C 40434380 */  lb          $3, 0x4340($2)
/* 0B5F90 001B5E90 40110300 */  sll         $2, $3, 5
/* 0B5F94 001B5E94 23104300 */  subu        $2, $2, $3
/* 0B5F98 001B5E98 C0180200 */  sll         $3, $2, 3
/* 0B5F9C 001B5E9C 21106402 */  addu        $2, $19, $4
/* 0B5FA0 001B5EA0 21106200 */  addu        $2, $3, $2
/* 0B5FA4 001B5EA4 0C454284 */  lh          $2, 0x450C($2)
/* 0B5FA8 001B5EA8 04002216 */  bne         $17, $2, .L001B5EBC
/* 0B5FAC 001B5EAC 00000000 */   nop
/* 0B5FB0 001B5EB0 28160070 */  paddub      $2, $0, $0
/* 0B5FB4 001B5EB4 07010010 */  b           .L001B62D4
/* 0B5FB8 001B5EB8 00000000 */   nop
.L001B5EBC:
/* 0B5FBC 001B5EBC 049D828F */  lw          $2, -0x62FC($28)
/* 0B5FC0 001B5EC0 06004284 */  lh          $2, 0x6($2)
/* 0B5FC4 001B5EC4 00008244 */  mtc1        $2, $f0
/* 0B5FC8 001B5EC8 00000000 */  nop
/* 0B5FCC 001B5ECC 60008046 */  cvt.s.w     $f1, $f0
/* 0B5FD0 001B5ED0 148480C7 */  lwc1        $f0, -0x7BEC($28)
/* 0B5FD4 001B5ED4 42000146 */  mul.s       $f1, $f0, $f1
/* 0B5FD8 001B5ED8 C03F023C */  lui         $2, (0x3FC00000 >> 16)
/* 0B5FDC 001B5EDC 00008244 */  mtc1        $2, $f0
/* 0B5FE0 001B5EE0 00000000 */  nop
/* 0B5FE4 001B5EE4 81000146 */  sub.s       $f2, $f0, $f1
/* 0B5FE8 001B5EE8 100054C6 */  lwc1        $f20, 0x10($18)
/* 0B5FEC 001B5EEC 82101546 */  mul.s       $f2, $f2, $f21
/* 0B5FF0 001B5EF0 00009444 */  mtc1        $20, $f0
/* 0B5FF4 001B5EF4 00000000 */  nop
/* 0B5FF8 001B5EF8 60008046 */  cvt.s.w     $f1, $f0
/* 0B5FFC 001B5EFC 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 0B6000 001B5F00 02000146 */  mul.s       $f0, $f0, $f1
/* 0B6004 001B5F04 80100046 */  add.s       $f2, $f2, $f0
/* 0B6008 001B5F08 41A00246 */  sub.s       $f1, $f20, $f2
/* 0B600C 001B5F0C 100041E6 */  swc1        $f1, 0x10($18)
/* 0B6010 001B5F10 00008044 */  mtc1        $0, $f0
/* 0B6014 001B5F14 00000000 */  nop
/* 0B6018 001B5F18 36080046 */  c.le.s      $f1, $f0
/* 0B601C 001B5F1C 00000000 */  nop
/* 0B6020 001B5F20 1D000045 */  bc1f        .L001B5F98
/* 0B6024 001B5F24 00000000 */   nop
/* 0B6028 001B5F28 789C848F */  lw          $4, -0x6388($28)
/* 0B602C 001B5F2C B7000524 */  addiu       $5, $0, 0xB7
/* 0B6030 001B5F30 18F9060C */  jal         CheckActItemSlot__14CDngStatusDataFi
/* 0B6034 001B5F34 00000000 */   nop
/* 0B6038 001B5F38 FFFF0324 */  addiu       $3, $0, -0x1
/* 0B603C 001B5F3C 16004310 */  beq         $2, $3, .L001B5F98
/* 0B6040 001B5F40 00000000 */   nop
/* 0B6044 001B5F44 01004424 */  addiu       $4, $2, 0x1
/* 0B6048 001B5F48 74FE760C */  jal         DelActiveItem__Fi
/* 0B604C 001B5F4C 00000000 */   nop
/* 0B6050 001B5F50 0C004286 */  lh          $2, 0xC($18)
/* 0B6054 001B5F54 00008244 */  mtc1        $2, $f0
/* 0B6058 001B5F58 00000000 */  nop
/* 0B605C 001B5F5C 20008046 */  cvt.s.w     $f0, $f0
/* 0B6060 001B5F60 100040E6 */  swc1        $f0, 0x10($18)
/* 0B6064 001B5F64 BC000224 */  addiu       $2, $0, 0xBC
/* 0B6068 001B5F68 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 0B606C 001B5F6C B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 0B6070 001B5F70 F0000224 */  addiu       $2, $0, 0xF0
/* 0B6074 001B5F74 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 0B6078 001B5F78 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 0B607C 001B5F7C EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 0B6080 001B5F80 AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
/* 0B6084 001B5F84 18000424 */  addiu       $4, $0, 0x18
/* 0B6088 001B5F88 FFFF0524 */  addiu       $5, $0, -0x1
/* 0B608C 001B5F8C 28360070 */  paddub      $6, $0, $0
/* 0B6090 001B5F90 AC69050C */  jal         SndSePlay__Fiii
/* 0B6094 001B5F94 00000000 */   nop
.L001B5F98:
/* 0B6098 001B5F98 100041C6 */  lwc1        $f1, 0x10($18)
/* 0B609C 001B5F9C 00008044 */  mtc1        $0, $f0
/* 0B60A0 001B5FA0 00000000 */  nop
/* 0B60A4 001B5FA4 36080046 */  c.le.s      $f1, $f0
/* 0B60A8 001B5FA8 00000000 */  nop
/* 0B60AC 001B5FAC 8A000045 */  bc1f        .L001B61D8
/* 0B60B0 001B5FB0 00000000 */   nop
/* 0B60B4 001B5FB4 100040AE */  sw          $0, 0x10($18)
/* 0B60B8 001B5FB8 E0000424 */  addiu       $4, $0, 0xE0
/* 0B60BC 001B5FBC FFFF0524 */  addiu       $5, $0, -0x1
/* 0B60C0 001B5FC0 28360070 */  paddub      $6, $0, $0
/* 0B60C4 001B5FC4 AC69050C */  jal         SndSePlay__Fiii
/* 0B60C8 001B5FC8 00000000 */   nop
/* 0B60CC 001B5FCC 789C848F */  lw          $4, -0x6388($28)
/* 0B60D0 001B5FD0 21100402 */  addu        $2, $16, $4
/* 0B60D4 001B5FD4 40434524 */  addiu       $5, $2, 0x4340
/* 0B60D8 001B5FD8 40434380 */  lb          $3, 0x4340($2)
/* 0B60DC 001B5FDC 40110300 */  sll         $2, $3, 5
/* 0B60E0 001B5FE0 23104300 */  subu        $2, $2, $3
/* 0B60E4 001B5FE4 C0100200 */  sll         $2, $2, 3
/* 0B60E8 001B5FE8 21206402 */  addu        $4, $19, $4
/* 0B60EC 001B5FEC 21104400 */  addu        $2, $2, $4
/* 0B60F0 001B5FF0 0C454284 */  lh          $2, 0x450C($2)
/* 0B60F4 001B5FF4 01002326 */  addiu       $3, $17, 0x1
/* 0B60F8 001B5FF8 1E006214 */  bne         $3, $2, .L001B6074
/* 0B60FC 001B5FFC 00000000 */   nop
/* 0B6100 001B6000 00004486 */  lh          $4, 0x0($18)
/* 0B6104 001B6004 0044070C */  jal         GetCommonItemDataSystemMsg__Fi
/* 0B6108 001B6008 00000000 */   nop
/* 0B610C 001B600C EA01013C */  lui         $1, %hi(DngMessMan + 0xC)
/* 0B6110 001B6010 9C7622AC */  sw          $2, %lo(DngMessMan + 0xC)($1)
/* 0B6114 001B6014 02004286 */  lh          $2, 0x2($18)
/* 0B6118 001B6018 EA01013C */  lui         $1, %hi(DngMessMan + 0x14)
/* 0B611C 001B601C A47622AC */  sw          $2, %lo(DngMessMan + 0x14)($1)
/* 0B6120 001B6020 A1000224 */  addiu       $2, $0, 0xA1
/* 0B6124 001B6024 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 0B6128 001B6028 B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 0B612C 001B602C E0010224 */  addiu       $2, $0, 0x1E0
/* 0B6130 001B6030 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 0B6134 001B6034 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 0B6138 001B6038 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 0B613C 001B603C AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
/* 0B6140 001B6040 28262072 */  paddub      $4, $17, $0
/* 0B6144 001B6044 282E4072 */  paddub      $5, $18, $0
/* 0B6148 001B6048 24C9080C */  jal         WepDataListToHaveCopy__FiP11WEAPON_HAVE
/* 0B614C 001B604C 00000000 */   nop
/* 0B6150 001B6050 049D848F */  lw          $4, -0x62FC($28)
/* 0B6154 001B6054 A896080C */  jal         SetWeaponAttachStatus__FP11WEAPON_HAVE
/* 0B6158 001B6058 00000000 */   nop
/* 0B615C 001B605C 049D828F */  lw          $2, -0x62FC($28)
/* 0B6160 001B6060 100040AC */  sw          $0, 0x10($2)
/* 0B6164 001B6064 100040AE */  sw          $0, 0x10($18)
/* 0B6168 001B6068 01000224 */  addiu       $2, $0, 0x1
/* 0B616C 001B606C 99000010 */  b           .L001B62D4
/* 0B6170 001B6070 00000000 */   nop
.L001B6074:
/* 0B6174 001B6074 3C140200 */  dsll32      $2, $2, 16
/* 0B6178 001B6078 3F140200 */  dsra32      $2, $2, 16
/* 0B617C 001B607C 56006210 */  beq         $3, $2, .L001B61D8
/* 0B6180 001B6080 00000000 */   nop
/* 0B6184 001B6084 0C459324 */  addiu       $19, $4, 0x450C
/* 0B6188 001B6088 28260070 */  paddub      $4, $0, $0
/* 0B618C 001B608C 4F000010 */  b           .L001B61CC
/* 0B6190 001B6090 00000000 */   nop
.L001B6094:
/* 0B6194 001B6094 00006386 */  lh          $3, 0x0($19)
/* 0B6198 001B6098 22007114 */  bne         $3, $17, .L001B6124
/* 0B619C 001B609C 00000000 */   nop
/* 0B61A0 001B60A0 0000A4A0 */  sb          $4, 0x0($5)
/* 0B61A4 001B60A4 049D848F */  lw          $4, -0x62FC($28)
/* 0B61A8 001B60A8 A896080C */  jal         SetWeaponAttachStatus__FP11WEAPON_HAVE
/* 0B61AC 001B60AC 00000000 */   nop
/* 0B61B0 001B60B0 00004486 */  lh          $4, 0x0($18)
/* 0B61B4 001B60B4 0044070C */  jal         GetCommonItemDataSystemMsg__Fi
/* 0B61B8 001B60B8 00000000 */   nop
/* 0B61BC 001B60BC EA01013C */  lui         $1, %hi(DngMessMan + 0xC)
/* 0B61C0 001B60C0 9C7622AC */  sw          $2, %lo(DngMessMan + 0xC)($1)
/* 0B61C4 001B60C4 02004286 */  lh          $2, 0x2($18)
/* 0B61C8 001B60C8 EA01013C */  lui         $1, %hi(DngMessMan + 0x14)
/* 0B61CC 001B60CC A47622AC */  sw          $2, %lo(DngMessMan + 0x14)($1)
/* 0B61D0 001B60D0 00006486 */  lh          $4, 0x0($19)
/* 0B61D4 001B60D4 0044070C */  jal         GetCommonItemDataSystemMsg__Fi
/* 0B61D8 001B60D8 00000000 */   nop
/* 0B61DC 001B60DC EA01013C */  lui         $1, %hi(DngMessMan + 0x10)
/* 0B61E0 001B60E0 A07622AC */  sw          $2, %lo(DngMessMan + 0x10)($1)
/* 0B61E4 001B60E4 02006286 */  lh          $2, 0x2($19)
/* 0B61E8 001B60E8 EA01013C */  lui         $1, %hi(DngMessMan + 0x18)
/* 0B61EC 001B60EC A87622AC */  sw          $2, %lo(DngMessMan + 0x18)($1)
/* 0B61F0 001B60F0 A0000224 */  addiu       $2, $0, 0xA0
/* 0B61F4 001B60F4 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 0B61F8 001B60F8 B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 0B61FC 001B60FC E0010224 */  addiu       $2, $0, 0x1E0
/* 0B6200 001B6100 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 0B6204 001B6104 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 0B6208 001B6108 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 0B620C 001B610C AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
/* 0B6210 001B6110 FFFF0224 */  addiu       $2, $0, -0x1
/* 0B6214 001B6114 000042A6 */  sh          $2, 0x0($18)
/* 0B6218 001B6118 01000224 */  addiu       $2, $0, 0x1
/* 0B621C 001B611C 6D000010 */  b           .L001B62D4
/* 0B6220 001B6120 00000000 */   nop
.L001B6124:
/* 0B6224 001B6124 01002226 */  addiu       $2, $17, 0x1
/* 0B6228 001B6128 26006214 */  bne         $3, $2, .L001B61C4
/* 0B622C 001B612C 00000000 */   nop
/* 0B6230 001B6130 0000A4A0 */  sb          $4, 0x0($5)
/* 0B6234 001B6134 049D848F */  lw          $4, -0x62FC($28)
/* 0B6238 001B6138 A896080C */  jal         SetWeaponAttachStatus__FP11WEAPON_HAVE
/* 0B623C 001B613C 00000000 */   nop
/* 0B6240 001B6140 00004486 */  lh          $4, 0x0($18)
/* 0B6244 001B6144 0044070C */  jal         GetCommonItemDataSystemMsg__Fi
/* 0B6248 001B6148 00000000 */   nop
/* 0B624C 001B614C EA01013C */  lui         $1, %hi(DngMessMan + 0xC)
/* 0B6250 001B6150 9C7622AC */  sw          $2, %lo(DngMessMan + 0xC)($1)
/* 0B6254 001B6154 02004286 */  lh          $2, 0x2($18)
/* 0B6258 001B6158 EA01013C */  lui         $1, %hi(DngMessMan + 0x14)
/* 0B625C 001B615C A47622AC */  sw          $2, %lo(DngMessMan + 0x14)($1)
/* 0B6260 001B6160 00006486 */  lh          $4, 0x0($19)
/* 0B6264 001B6164 0044070C */  jal         GetCommonItemDataSystemMsg__Fi
/* 0B6268 001B6168 00000000 */   nop
/* 0B626C 001B616C EA01013C */  lui         $1, %hi(DngMessMan + 0x10)
/* 0B6270 001B6170 A07622AC */  sw          $2, %lo(DngMessMan + 0x10)($1)
/* 0B6274 001B6174 02006286 */  lh          $2, 0x2($19)
/* 0B6278 001B6178 EA01013C */  lui         $1, %hi(DngMessMan + 0x18)
/* 0B627C 001B617C A87622AC */  sw          $2, %lo(DngMessMan + 0x18)($1)
/* 0B6280 001B6180 A0000224 */  addiu       $2, $0, 0xA0
/* 0B6284 001B6184 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 0B6288 001B6188 B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 0B628C 001B618C E0010224 */  addiu       $2, $0, 0x1E0
/* 0B6290 001B6190 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 0B6294 001B6194 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 0B6298 001B6198 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 0B629C 001B619C AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
/* 0B62A0 001B61A0 03000224 */  addiu       $2, $0, 0x3
/* 0B62A4 001B61A4 02000216 */  bne         $16, $2, .L001B61B0
/* 0B62A8 001B61A8 00000000 */   nop
/* 0B62AC 001B61AC 160060A2 */  sb          $0, 0x16($19)
.L001B61B0:
/* 0B62B0 001B61B0 FFFF0224 */  addiu       $2, $0, -0x1
/* 0B62B4 001B61B4 000042A6 */  sh          $2, 0x0($18)
/* 0B62B8 001B61B8 02000224 */  addiu       $2, $0, 0x2
/* 0B62BC 001B61BC 45000010 */  b           .L001B62D4
/* 0B62C0 001B61C0 00000000 */   nop
.L001B61C4:
/* 0B62C4 001B61C4 F8007326 */  addiu       $19, $19, 0xF8
/* 0B62C8 001B61C8 01008424 */  addiu       $4, $4, 0x1
.L001B61CC:
/* 0B62CC 001B61CC 0A008228 */  slti        $2, $4, 0xA
/* 0B62D0 001B61D0 B0FF4014 */  bnez        $2, .L001B6094
/* 0B62D4 001B61D4 00000000 */   nop
.L001B61D8:
/* 0B62D8 001B61D8 0C004286 */  lh          $2, 0xC($18)
/* 0B62DC 001B61DC 00008244 */  mtc1        $2, $f0
/* 0B62E0 001B61E0 00000000 */  nop
/* 0B62E4 001B61E4 60008046 */  cvt.s.w     $f1, $f0
/* 0B62E8 001B61E8 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 0B62EC 001B61EC 42000146 */  mul.s       $f1, $f0, $f1
/* 0B62F0 001B61F0 36081446 */  c.le.s      $f1, $f20
/* 0B62F4 001B61F4 00000000 */  nop
/* 0B62F8 001B61F8 16000045 */  bc1f        .L001B6254
/* 0B62FC 001B61FC 00000000 */   nop
/* 0B6300 001B6200 100040C6 */  lwc1        $f0, 0x10($18)
/* 0B6304 001B6204 36080046 */  c.le.s      $f1, $f0
/* 0B6308 001B6208 00000000 */  nop
/* 0B630C 001B620C 11000145 */  bc1t        .L001B6254
/* 0B6310 001B6210 00000000 */   nop
/* 0B6314 001B6214 00004486 */  lh          $4, 0x0($18)
/* 0B6318 001B6218 0044070C */  jal         GetCommonItemDataSystemMsg__Fi
/* 0B631C 001B621C 00000000 */   nop
/* 0B6320 001B6220 EA01013C */  lui         $1, %hi(DngMessMan + 0xC)
/* 0B6324 001B6224 9C7622AC */  sw          $2, %lo(DngMessMan + 0xC)($1)
/* 0B6328 001B6228 02004286 */  lh          $2, 0x2($18)
/* 0B632C 001B622C EA01013C */  lui         $1, %hi(DngMessMan + 0x14)
/* 0B6330 001B6230 A47622AC */  sw          $2, %lo(DngMessMan + 0x14)($1)
/* 0B6334 001B6234 97000224 */  addiu       $2, $0, 0x97
/* 0B6338 001B6238 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 0B633C 001B623C B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 0B6340 001B6240 F0000224 */  addiu       $2, $0, 0xF0
/* 0B6344 001B6244 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 0B6348 001B6248 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 0B634C 001B624C EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 0B6350 001B6250 AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
.L001B6254:
/* 0B6354 001B6254 0C004286 */  lh          $2, 0xC($18)
/* 0B6358 001B6258 00008244 */  mtc1        $2, $f0
/* 0B635C 001B625C 00000000 */  nop
/* 0B6360 001B6260 60008046 */  cvt.s.w     $f1, $f0
/* 0B6364 001B6264 C08480C7 */  lwc1        $f0, -0x7B40($28)
/* 0B6368 001B6268 42000146 */  mul.s       $f1, $f0, $f1
/* 0B636C 001B626C 36081446 */  c.le.s      $f1, $f20
/* 0B6370 001B6270 00000000 */  nop
/* 0B6374 001B6274 16000045 */  bc1f        .L001B62D0
/* 0B6378 001B6278 00000000 */   nop
/* 0B637C 001B627C 100040C6 */  lwc1        $f0, 0x10($18)
/* 0B6380 001B6280 36080046 */  c.le.s      $f1, $f0
/* 0B6384 001B6284 00000000 */  nop
/* 0B6388 001B6288 11000145 */  bc1t        .L001B62D0
/* 0B638C 001B628C 00000000 */   nop
/* 0B6390 001B6290 00004486 */  lh          $4, 0x0($18)
/* 0B6394 001B6294 0044070C */  jal         GetCommonItemDataSystemMsg__Fi
/* 0B6398 001B6298 00000000 */   nop
/* 0B639C 001B629C EA01013C */  lui         $1, %hi(DngMessMan + 0xC)
/* 0B63A0 001B62A0 9C7622AC */  sw          $2, %lo(DngMessMan + 0xC)($1)
/* 0B63A4 001B62A4 02004286 */  lh          $2, 0x2($18)
/* 0B63A8 001B62A8 EA01013C */  lui         $1, %hi(DngMessMan + 0x14)
/* 0B63AC 001B62AC A47622AC */  sw          $2, %lo(DngMessMan + 0x14)($1)
/* 0B63B0 001B62B0 98000224 */  addiu       $2, $0, 0x98
/* 0B63B4 001B62B4 EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 0B63B8 001B62B8 B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 0B63BC 001B62BC F0000224 */  addiu       $2, $0, 0xF0
/* 0B63C0 001B62C0 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 0B63C4 001B62C4 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 0B63C8 001B62C8 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 0B63CC 001B62CC AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
.L001B62D0:
/* 0B63D0 001B62D0 28160070 */  paddub      $2, $0, $0
.L001B62D4:
/* 0B63D4 001B62D4 6000BF7B */  lq          $31, 0x60($29)
/* 0B63D8 001B62D8 5000B47B */  lq          $20, 0x50($29)
/* 0B63DC 001B62DC 4000B37B */  lq          $19, 0x40($29)
/* 0B63E0 001B62E0 3000B27B */  lq          $18, 0x30($29)
/* 0B63E4 001B62E4 2000B17B */  lq          $17, 0x20($29)
/* 0B63E8 001B62E8 1000B07B */  lq          $16, 0x10($29)
/* 0B63EC 001B62EC 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 0B63F0 001B62F0 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0B63F4 001B62F4 9000BD27 */  addiu       $29, $29, 0x90
/* 0B63F8 001B62F8 0800E003 */  jr          $31
/* 0B63FC 001B62FC 00000000 */   nop
