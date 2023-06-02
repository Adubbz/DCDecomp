.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__12CPartsCursorFPfii
/* A5DB0 001A5CB0 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* A5DB4 001A5CB4 9000BF7F */  sq         $31, 0x90($sp)
/* A5DB8 001A5CB8 8000BE7F */  sq         $fp, 0x80($sp)
/* A5DBC 001A5CBC 7000B77F */  sq         $23, 0x70($sp)
/* A5DC0 001A5CC0 6000B67F */  sq         $22, 0x60($sp)
/* A5DC4 001A5CC4 5000B57F */  sq         $21, 0x50($sp)
/* A5DC8 001A5CC8 4000B47F */  sq         $20, 0x40($sp)
/* A5DCC 001A5CCC 3000B37F */  sq         $19, 0x30($sp)
/* A5DD0 001A5CD0 2000B27F */  sq         $18, 0x20($sp)
/* A5DD4 001A5CD4 1000B17F */  sq         $17, 0x10($sp)
/* A5DD8 001A5CD8 0000B07F */  sq         $16, 0x0($sp)
/* A5DDC 001A5CDC 28AE8070 */  paddub     $21, $4, $0
/* A5DE0 001A5CE0 288EC070 */  paddub     $17, $6, $0
/* A5DE4 001A5CE4 2886E070 */  paddub     $16, $7, $0
/* A5DE8 001A5CE8 40900600 */  sll        $18, $6, 1
/* A5DEC 001A5CEC 40980700 */  sll        $19, $7, 1
/* A5DF0 001A5CF0 B000A427 */  addiu      $4, $sp, 0xB0
/* A5DF4 001A5CF4 0C86040C */  jal        sceVu0CopyVector
/* A5DF8 001A5CF8 00000000 */   nop
/* A5DFC 001A5CFC 00009144 */  mtc1       $17, $f0
/* A5E00 001A5D00 00000000 */  nop
/* A5E04 001A5D04 60008046 */  cvt.s.w    $f1, $f0
/* A5E08 001A5D08 0400A0C6 */  lwc1       $f0, 0x4($21)
/* A5E0C 001A5D0C 02000146 */  mul.s      $f0, $f0, $f1
/* A5E10 001A5D10 003F023C */  lui        $2, (0x3F000000 >> 16)
/* A5E14 001A5D14 00108244 */  mtc1       $2, $f2
/* A5E18 001A5D18 00000000 */  nop
/* A5E1C 001A5D1C 42100046 */  mul.s      $f1, $f2, $f0
/* A5E20 001A5D20 B000A0C7 */  lwc1       $f0, 0xB0($sp)
/* A5E24 001A5D24 01000146 */  sub.s      $f0, $f0, $f1
/* A5E28 001A5D28 B000A0E7 */  swc1       $f0, 0xB0($sp)
/* A5E2C 001A5D2C 00009044 */  mtc1       $16, $f0
/* A5E30 001A5D30 00000000 */  nop
/* A5E34 001A5D34 60008046 */  cvt.s.w    $f1, $f0
/* A5E38 001A5D38 0400A0C6 */  lwc1       $f0, 0x4($21)
/* A5E3C 001A5D3C 02000146 */  mul.s      $f0, $f0, $f1
/* A5E40 001A5D40 42100046 */  mul.s      $f1, $f2, $f0
/* A5E44 001A5D44 B800B727 */  addiu      $23, $sp, 0xB8
/* A5E48 001A5D48 0000E0C6 */  lwc1       $f0, 0x0($23)
/* A5E4C 001A5D4C 01000146 */  sub.s      $f0, $f0, $f1
/* A5E50 001A5D50 0000E0E6 */  swc1       $f0, 0x0($23)
/* A5E54 001A5D54 803E023C */  lui        $2, (0x3E800000 >> 16)
/* A5E58 001A5D58 00108244 */  mtc1       $2, $f2
/* A5E5C 001A5D5C 0400A0C6 */  lwc1       $f0, 0x4($21)
/* A5E60 001A5D60 42100046 */  mul.s      $f1, $f2, $f0
/* A5E64 001A5D64 B000A0C7 */  lwc1       $f0, 0xB0($sp)
/* A5E68 001A5D68 00000146 */  add.s      $f0, $f0, $f1
/* A5E6C 001A5D6C B000A0E7 */  swc1       $f0, 0xB0($sp)
/* A5E70 001A5D70 0400A0C6 */  lwc1       $f0, 0x4($21)
/* A5E74 001A5D74 42100046 */  mul.s      $f1, $f2, $f0
/* A5E78 001A5D78 0000E0C6 */  lwc1       $f0, 0x0($23)
/* A5E7C 001A5D7C 00000146 */  add.s      $f0, $f0, $f1
/* A5E80 001A5D80 0000E0E6 */  swc1       $f0, 0x0($23)
/* A5E84 001A5D84 A000A427 */  addiu      $4, $sp, 0xA0
/* A5E88 001A5D88 B000A527 */  addiu      $5, $sp, 0xB0
/* A5E8C 001A5D8C 0C86040C */  jal        sceVu0CopyVector
/* A5E90 001A5D90 00000000 */   nop
/* A5E94 001A5D94 28860070 */  paddub     $16, $0, $0
/* A5E98 001A5D98 7F000010 */  b          .L001A5F98
/* A5E9C 001A5D9C 00000000 */   nop
.L001A5DA0:
/* A5EA0 001A5DA0 0000E0C6 */  lwc1       $f0, 0x0($23)
/* A5EA4 001A5DA4 A800BE27 */  addiu      $fp, $sp, 0xA8
/* A5EA8 001A5DA8 0000C0E7 */  swc1       $f0, 0x0($fp)
/* A5EAC 001A5DAC 288E0070 */  paddub     $17, $0, $0
/* A5EB0 001A5DB0 6E000010 */  b          .L001A5F6C
/* A5EB4 001A5DB4 00000000 */   nop
.L001A5DB8:
/* A5EB8 001A5DB8 02000324 */  addiu      $3, $0, 0x2
/* A5EBC 001A5DBC 28A60070 */  paddub     $20, $0, $0
/* A5EC0 001A5DC0 04000016 */  bnez       $16, .L001A5DD4
/* A5EC4 001A5DC4 00000000 */   nop
/* A5EC8 001A5DC8 02002016 */  bnez       $17, .L001A5DD4
/* A5ECC 001A5DCC 00000000 */   nop
/* A5ED0 001A5DD0 281E0070 */  paddub     $3, $0, $0
.L001A5DD4:
/* A5ED4 001A5DD4 0900001A */  blez       $16, .L001A5DFC
/* A5ED8 001A5DD8 00000000 */   nop
/* A5EDC 001A5DDC FFFF4226 */  addiu      $2, $18, -0x1
/* A5EE0 001A5DE0 2A080202 */  slt        $at, $16, $2
/* A5EE4 001A5DE4 05002010 */  beqz       $at, .L001A5DFC
/* A5EE8 001A5DE8 00000000 */   nop
/* A5EEC 001A5DEC 03002016 */  bnez       $17, .L001A5DFC
/* A5EF0 001A5DF0 00000000 */   nop
/* A5EF4 001A5DF4 01000324 */  addiu      $3, $0, 0x1
/* A5EF8 001A5DF8 02001424 */  addiu      $20, $0, 0x2
.L001A5DFC:
/* A5EFC 001A5DFC FFFF4226 */  addiu      $2, $18, -0x1
/* A5F00 001A5E00 05000216 */  bne        $16, $2, .L001A5E18
/* A5F04 001A5E04 00000000 */   nop
/* A5F08 001A5E08 03002016 */  bnez       $17, .L001A5E18
/* A5F0C 001A5E0C 00000000 */   nop
/* A5F10 001A5E10 281E0070 */  paddub     $3, $0, $0
/* A5F14 001A5E14 FFFF1424 */  addiu      $20, $0, -0x1
.L001A5E18:
/* A5F18 001A5E18 FFFF4226 */  addiu      $2, $18, -0x1
/* A5F1C 001A5E1C 09000216 */  bne        $16, $2, .L001A5E44
/* A5F20 001A5E20 00000000 */   nop
/* A5F24 001A5E24 0700201A */  blez       $17, .L001A5E44
/* A5F28 001A5E28 00000000 */   nop
/* A5F2C 001A5E2C FFFF6226 */  addiu      $2, $19, -0x1
/* A5F30 001A5E30 2A082202 */  slt        $at, $17, $2
/* A5F34 001A5E34 03002010 */  beqz       $at, .L001A5E44
/* A5F38 001A5E38 00000000 */   nop
/* A5F3C 001A5E3C 01000324 */  addiu      $3, $0, 0x1
/* A5F40 001A5E40 28A66070 */  paddub     $20, $3, $0
.L001A5E44:
/* A5F44 001A5E44 FFFF4226 */  addiu      $2, $18, -0x1
/* A5F48 001A5E48 06000216 */  bne        $16, $2, .L001A5E64
/* A5F4C 001A5E4C 00000000 */   nop
/* A5F50 001A5E50 FFFF6226 */  addiu      $2, $19, -0x1
/* A5F54 001A5E54 03002216 */  bne        $17, $2, .L001A5E64
/* A5F58 001A5E58 00000000 */   nop
/* A5F5C 001A5E5C 281E0070 */  paddub     $3, $0, $0
/* A5F60 001A5E60 02001424 */  addiu      $20, $0, 0x2
.L001A5E64:
/* A5F64 001A5E64 0A00001A */  blez       $16, .L001A5E90
/* A5F68 001A5E68 00000000 */   nop
/* A5F6C 001A5E6C FFFF4226 */  addiu      $2, $18, -0x1
/* A5F70 001A5E70 2A080202 */  slt        $at, $16, $2
/* A5F74 001A5E74 06002010 */  beqz       $at, .L001A5E90
/* A5F78 001A5E78 00000000 */   nop
/* A5F7C 001A5E7C FFFF6226 */  addiu      $2, $19, -0x1
/* A5F80 001A5E80 03002216 */  bne        $17, $2, .L001A5E90
/* A5F84 001A5E84 00000000 */   nop
/* A5F88 001A5E88 01000324 */  addiu      $3, $0, 0x1
/* A5F8C 001A5E8C 28A60070 */  paddub     $20, $0, $0
.L001A5E90:
/* A5F90 001A5E90 06000016 */  bnez       $16, .L001A5EAC
/* A5F94 001A5E94 00000000 */   nop
/* A5F98 001A5E98 FFFF6226 */  addiu      $2, $19, -0x1
/* A5F9C 001A5E9C 03002216 */  bne        $17, $2, .L001A5EAC
/* A5FA0 001A5EA0 00000000 */   nop
/* A5FA4 001A5EA4 281E0070 */  paddub     $3, $0, $0
/* A5FA8 001A5EA8 01001424 */  addiu      $20, $0, 0x1
.L001A5EAC:
/* A5FAC 001A5EAC 09000016 */  bnez       $16, .L001A5ED4
/* A5FB0 001A5EB0 00000000 */   nop
/* A5FB4 001A5EB4 0700201A */  blez       $17, .L001A5ED4
/* A5FB8 001A5EB8 00000000 */   nop
/* A5FBC 001A5EBC FFFF6226 */  addiu      $2, $19, -0x1
/* A5FC0 001A5EC0 2A082202 */  slt        $at, $17, $2
/* A5FC4 001A5EC4 03002010 */  beqz       $at, .L001A5ED4
/* A5FC8 001A5EC8 00000000 */   nop
/* A5FCC 001A5ECC 01000324 */  addiu      $3, $0, 0x1
/* A5FD0 001A5ED0 FFFF1424 */  addiu      $20, $0, -0x1
.L001A5ED4:
/* A5FD4 001A5ED4 80100300 */  sll        $2, $3, 2
/* A5FD8 001A5ED8 21105500 */  addu       $2, $2, $21
/* A5FDC 001A5EDC 08005624 */  addiu      $22, $2, 0x8
/* A5FE0 001A5EE0 0800448C */  lw         $4, 0x8($2)
/* A5FE4 001A5EE4 A000A527 */  addiu      $5, $sp, 0xA0
/* A5FE8 001A5EE8 B89F040C */  jal        SetPosition__6CFrameFPf
/* A5FEC 001A5EEC 00000000 */   nop
/* A5FF0 001A5EF0 00009444 */  mtc1       $20, $f0
/* A5FF4 001A5EF4 00000000 */  nop
/* A5FF8 001A5EF8 60008046 */  cvt.s.w    $f1, $f0
/* A5FFC 001A5EFC C88080C7 */  lwc1       $f0, -0x7F38($gp)
/* A6000 001A5F00 42030146 */  mul.s      $f13, $f0, $f1
/* A6004 001A5F04 00608044 */  mtc1       $0, $f12
/* A6008 001A5F08 00000000 */  nop
/* A600C 001A5F0C 86630046 */  mov.s      $f14, $f12
/* A6010 001A5F10 0000C48E */  lw         $4, 0x0($22)
/* A6014 001A5F14 70A3040C */  jal        SetRotation__6CFrameFfff
/* A6018 001A5F18 00000000 */   nop
/* A601C 001A5F1C C842023C */  lui        $2, (0x42C80000 >> 16)
/* A6020 001A5F20 00088244 */  mtc1       $2, $f1
/* A6024 001A5F24 0400A0C6 */  lwc1       $f0, 0x4($21)
/* A6028 001A5F28 03030146 */  div.s      $f12, $f0, $f1
/* A602C 001A5F2C 0000C48E */  lw         $4, 0x0($22)
/* A6030 001A5F30 46630046 */  mov.s      $f13, $f12
/* A6034 001A5F34 86630046 */  mov.s      $f14, $f12
/* A6038 001A5F38 D49F040C */  jal        SetScale__6CFrameFfff
/* A603C 001A5F3C 00000000 */   nop
/* A6040 001A5F40 0000C48E */  lw         $4, 0x0($22)
/* A6044 001A5F44 60BB040C */  jal        MGDraw__FP6CFrame
/* A6048 001A5F48 00000000 */   nop
/* A604C 001A5F4C 003F033C */  lui        $3, (0x3F000000 >> 16)
/* A6050 001A5F50 00088344 */  mtc1       $3, $f1
/* A6054 001A5F54 0400A0C6 */  lwc1       $f0, 0x4($21)
/* A6058 001A5F58 42080046 */  mul.s      $f1, $f1, $f0
/* A605C 001A5F5C 0000C0C7 */  lwc1       $f0, 0x0($fp)
/* A6060 001A5F60 00000146 */  add.s      $f0, $f0, $f1
/* A6064 001A5F64 0000C0E7 */  swc1       $f0, 0x0($fp)
/* A6068 001A5F68 01003126 */  addiu      $17, $17, 0x1
.L001A5F6C:
/* A606C 001A5F6C 2A183302 */  slt        $3, $17, $19
/* A6070 001A5F70 91FF6014 */  bnez       $3, .L001A5DB8
/* A6074 001A5F74 00000000 */   nop
/* A6078 001A5F78 003F033C */  lui        $3, (0x3F000000 >> 16)
/* A607C 001A5F7C 00088344 */  mtc1       $3, $f1
/* A6080 001A5F80 0400A0C6 */  lwc1       $f0, 0x4($21)
/* A6084 001A5F84 42080046 */  mul.s      $f1, $f1, $f0
/* A6088 001A5F88 A000A0C7 */  lwc1       $f0, 0xA0($sp)
/* A608C 001A5F8C 00000146 */  add.s      $f0, $f0, $f1
/* A6090 001A5F90 A000A0E7 */  swc1       $f0, 0xA0($sp)
/* A6094 001A5F94 01001026 */  addiu      $16, $16, 0x1
.L001A5F98:
/* A6098 001A5F98 2A181202 */  slt        $3, $16, $18
/* A609C 001A5F9C 80FF6014 */  bnez       $3, .L001A5DA0
/* A60A0 001A5FA0 00000000 */   nop
/* A60A4 001A5FA4 9000BF7B */  lq         $31, 0x90($sp)
/* A60A8 001A5FA8 8000BE7B */  lq         $fp, 0x80($sp)
/* A60AC 001A5FAC 7000B77B */  lq         $23, 0x70($sp)
/* A60B0 001A5FB0 6000B67B */  lq         $22, 0x60($sp)
/* A60B4 001A5FB4 5000B57B */  lq         $21, 0x50($sp)
/* A60B8 001A5FB8 4000B47B */  lq         $20, 0x40($sp)
/* A60BC 001A5FBC 3000B37B */  lq         $19, 0x30($sp)
/* A60C0 001A5FC0 2000B27B */  lq         $18, 0x20($sp)
/* A60C4 001A5FC4 1000B17B */  lq         $17, 0x10($sp)
/* A60C8 001A5FC8 0000B07B */  lq         $16, 0x0($sp)
/* A60CC 001A5FCC C000BD27 */  addiu      $sp, $sp, 0xC0
/* A60D0 001A5FD0 0800E003 */  jr         $31
/* A60D4 001A5FD4 00000000 */   nop
/* A60D8 001A5FD8 00000000 */  nop
/* A60DC 001A5FDC 00000000 */  nop
