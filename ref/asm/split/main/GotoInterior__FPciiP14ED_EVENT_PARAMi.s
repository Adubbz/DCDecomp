.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GotoInterior__FPciiP14ED_EVENT_PARAMi
/* 07EEE0 0017EDE0 B0FEBD27 */  addiu       $29, $29, -0x150
/* 07EEE4 0017EDE4 6000BF7F */  sq          $31, 0x60($29)
/* 07EEE8 0017EDE8 5000B57F */  sq          $21, 0x50($29)
/* 07EEEC 0017EDEC 4000B47F */  sq          $20, 0x40($29)
/* 07EEF0 0017EDF0 3000B37F */  sq          $19, 0x30($29)
/* 07EEF4 0017EDF4 2000B27F */  sq          $18, 0x20($29)
/* 07EEF8 0017EDF8 1000B17F */  sq          $17, 0x10($29)
/* 07EEFC 0017EDFC 0000B07F */  sq          $16, 0x0($29)
/* 07EF00 0017EE00 28AE8070 */  paddub      $21, $4, $0
/* 07EF04 0017EE04 28A6A070 */  paddub      $20, $5, $0
/* 07EF08 0017EE08 289EC070 */  paddub      $19, $6, $0
/* 07EF0C 0017EE0C 2896E070 */  paddub      $18, $7, $0
/* 07EF10 0017EE10 288E0071 */  paddub      $17, $8, $0
/* 07EF14 0017EE14 2700023C */  lui         $2, %hi(LIT_2365)
/* 07EF18 0017EE18 80944224 */  addiu       $2, $2, %lo(LIT_2365)
/* 07EF1C 0017EE1C 7000A427 */  addiu       $4, $29, 0x70
/* 07EF20 0017EE20 00004378 */  lq          $3, 0x0($2)
/* 07EF24 0017EE24 100042C4 */  lwc1        $f2, 0x10($2)
/* 07EF28 0017EE28 0000837C */  sq          $3, 0x0($4)
/* 07EF2C 0017EE2C 100082E4 */  swc1        $f2, 0x10($4)
/* 07EF30 0017EE30 04918CC7 */  lwc1        $f12, -0x6EFC($28)
/* 07EF34 0017EE34 981F060C */  jal         EdGetTime__Ff
/* 07EF38 0017EE38 00000000 */   nop
/* 07EF3C 0017EE3C 28864070 */  paddub      $16, $2, $0
/* 07EF40 0017EE40 D201023C */  lui         $2, %hi(EdInteriorName)
/* 07EF44 0017EE44 00B54424 */  addiu       $4, $2, %lo(EdInteriorName)
/* 07EF48 0017EE48 282EA072 */  paddub      $5, $21, $0
/* 07EF4C 0017EE4C 5A15040C */  jal         strcpy
/* 07EF50 0017EE50 00000000 */   nop
/* 07EF54 0017EE54 80101000 */  sll         $2, $16, 2
/* 07EF58 0017EE58 21185D00 */  addu        $3, $2, $29
/* 07EF5C 0017EE5C 9000A427 */  addiu       $4, $29, 0x90
/* 07EF60 0017EE60 2A00023C */  lui         $2, %hi(LIT_2389)
/* 07EF64 0017EE64 68AC4524 */  addiu       $5, $2, %lo(LIT_2389)
/* 07EF68 0017EE68 D201023C */  lui         $2, %hi(EditDataDir)
/* 07EF6C 0017EE6C E0B34624 */  addiu       $6, $2, %lo(EditDataDir)
/* 07EF70 0017EE70 283EA072 */  paddub      $7, $21, $0
/* 07EF74 0017EE74 2846A072 */  paddub      $8, $21, $0
/* 07EF78 0017EE78 7000698C */  lw          $9, 0x70($3)
/* 07EF7C 0017EE7C 1614040C */  jal         sprintf
/* 07EF80 0017EE80 00000000 */   nop
/* 07EF84 0017EE84 D301023C */  lui         $2, %hi(interior_map_name)
/* 07EF88 0017EE88 80594424 */  addiu       $4, $2, %lo(interior_map_name)
/* 07EF8C 0017EE8C 2A00023C */  lui         $2, %hi(LIT_2390)
/* 07EF90 0017EE90 78AC4524 */  addiu       $5, $2, %lo(LIT_2390)
/* 07EF94 0017EE94 9000A627 */  addiu       $6, $29, 0x90
/* 07EF98 0017EE98 1614040C */  jal         sprintf
/* 07EF9C 0017EE9C 00000000 */   nop
/* 07EFA0 0017EEA0 309094AF */  sw          $20, -0x6FD0($28)
/* 07EFA4 0017EEA4 D201013C */  lui         $1, %hi(EdNPCBuffer + 0x8)
/* 07EFA8 0017EEA8 58B320AC */  sw          $0, %lo(EdNPCBuffer + 0x8)($1)
/* 07EFAC 0017EEAC 02004016 */  bnez        $18, .L0017EEB8
/* 07EFB0 0017EEB0 00000000 */   nop
/* 07EFB4 0017EEB4 289E0070 */  paddub      $19, $0, $0
.L0017EEB8:
/* 07EFB8 0017EEB8 349080AF */  sw          $0, -0x6FCC($28)
/* 07EFBC 0017EEBC 04004012 */  beqz        $18, .L0017EED0
/* 07EFC0 0017EEC0 00000000 */   nop
/* 07EFC4 0017EEC4 5000428E */  lw          $2, 0x50($18)
/* 07EFC8 0017EEC8 0400428C */  lw          $2, 0x4($2)
/* 07EFCC 0017EECC 349082AF */  sw          $2, -0x6FCC($28)
.L0017EED0:
/* 07EFD0 0017EED0 349193AF */  sw          $19, -0x6ECC($28)
/* 07EFD4 0017EED4 A0000324 */  addiu       $3, $0, 0xA0
/* 07EFD8 0017EED8 309183AF */  sw          $3, -0x6ED0($28)
/* 07EFDC 0017EEDC 0B000224 */  addiu       $2, $0, 0xB
/* 07EFE0 0017EEE0 608782AF */  sw          $2, -0x78A0($28)
/* 07EFE4 0017EEE4 FFFF0224 */  addiu       $2, $0, -0x1
/* 07EFE8 0017EEE8 389082AF */  sw          $2, -0x6FC8($28)
/* 07EFEC 0017EEEC 5B006012 */  beqz        $19, .L0017F05C
/* 07EFF0 0017EEF0 00000000 */   nop
/* 07EFF4 0017EEF4 01000224 */  addiu       $2, $0, 0x1
/* 07EFF8 0017EEF8 389182AF */  sw          $2, -0x6EC8($28)
/* 07EFFC 0017EEFC 5000428E */  lw          $2, 0x50($18)
/* 07F000 0017EF00 2000428C */  lw          $2, 0x20($2)
/* 07F004 0017EF04 389082AF */  sw          $2, -0x6FC8($28)
/* 07F008 0017EF08 2A281300 */  slt         $5, $0, $19
/* 07F00C 0017EF0C 5000428E */  lw          $2, 0x50($18)
/* 07F010 0017EF10 2000448C */  lw          $4, 0x20($2)
/* 07F014 0017EF14 70C8050C */  jal         EdGetDoorMotion__Fii
/* 07F018 0017EF18 00000000 */   nop
/* 07F01C 0017EF1C 6487838F */  lw          $3, -0x789C($28)
/* 07F020 0017EF20 680C62AC */  sw          $2, 0xC68($3)
/* 07F024 0017EF24 06000224 */  addiu       $2, $0, 0x6
/* 07F028 0017EF28 640C62AC */  sw          $2, 0xC64($3)
/* 07F02C 0017EF2C 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 07F030 0017EF30 600C62AC */  sw          $2, 0xC60($3)
/* 07F034 0017EF34 D301023C */  lui         $2, %hi(fix_chara_pos)
/* 07F038 0017EF38 50594424 */  addiu       $4, $2, %lo(fix_chara_pos)
/* 07F03C 0017EF3C 10004526 */  addiu       $5, $18, 0x10
/* 07F040 0017EF40 0C86040C */  jal         sceVu0CopyVector
/* 07F044 0017EF44 00000000 */   nop
/* 07F048 0017EF48 D301023C */  lui         $2, %hi(fix_chara_rot)
/* 07F04C 0017EF4C 60594424 */  addiu       $4, $2, %lo(fix_chara_rot)
/* 07F050 0017EF50 30004526 */  addiu       $5, $18, 0x30
/* 07F054 0017EF54 0C86040C */  jal         sceVu0CopyVector
/* 07F058 0017EF58 00000000 */   nop
/* 07F05C 0017EF5C 6487848F */  lw          $4, -0x789C($28)
/* 07F060 0017EF60 D301023C */  lui         $2, %hi(fix_chara_pos)
/* 07F064 0017EF64 50594524 */  addiu       $5, $2, %lo(fix_chara_pos)
/* 07F068 0017EF68 A000998C */  lw          $25, 0xA0($4)
/* 07F06C 0017EF6C 1400398F */  lw          $25, 0x14($25)
/* 07F070 0017EF70 09F82003 */  jalr        $25
/* 07F074 0017EF74 00000000 */   nop
/* 07F078 0017EF78 6487848F */  lw          $4, -0x789C($28)
/* 07F07C 0017EF7C D301013C */  lui         $1, %hi(fix_chara_rot)
/* 07F080 0017EF80 60592CC4 */  lwc1        $f12, %lo(fix_chara_rot)($1)
/* 07F084 0017EF84 D301013C */  lui         $1, %hi(fix_chara_rot + 0x4)
/* 07F088 0017EF88 64592DC4 */  lwc1        $f13, %lo(fix_chara_rot + 0x4)($1)
/* 07F08C 0017EF8C D301013C */  lui         $1, %hi(fix_chara_rot + 0x8)
/* 07F090 0017EF90 68592EC4 */  lwc1        $f14, %lo(fix_chara_rot + 0x8)($1)
/* 07F094 0017EF94 A000998C */  lw          $25, 0xA0($4)
/* 07F098 0017EF98 3000398F */  lw          $25, 0x30($25)
/* 07F09C 0017EF9C 09F82003 */  jalr        $25
/* 07F0A0 0017EFA0 00000000 */   nop
/* 07F0A4 0017EFA4 6487848F */  lw          $4, -0x789C($28)
/* 07F0A8 0017EFA8 FFFF0524 */  addiu       $5, $0, -0x1
/* 07F0AC 0017EFAC A000998C */  lw          $25, 0xA0($4)
/* 07F0B0 0017EFB0 9400398F */  lw          $25, 0x94($25)
/* 07F0B4 0017EFB4 09F82003 */  jalr        $25
/* 07F0B8 0017EFB8 00000000 */   nop
/* 07F0BC 0017EFBC D301023C */  lui         $2, %hi(fix_camera_pos)
/* 07F0C0 0017EFC0 70594424 */  addiu       $4, $2, %lo(fix_camera_pos)
/* 07F0C4 0017EFC4 20004526 */  addiu       $5, $18, 0x20
/* 07F0C8 0017EFC8 0C86040C */  jal         sceVu0CopyVector
/* 07F0CC 0017EFCC 00000000 */   nop
/* 07F0D0 0017EFD0 D301023C */  lui         $2, %hi(MainCamera)
/* 07F0D4 0017EFD4 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07F0D8 0017EFD8 D301023C */  lui         $2, %hi(fix_camera_pos)
/* 07F0DC 0017EFDC 70594524 */  addiu       $5, $2, %lo(fix_camera_pos)
/* 07F0E0 0017EFE0 A490040C */  jal         SetPos__7CCameraFPf
/* 07F0E4 0017EFE4 00000000 */   nop
/* 07F0E8 0017EFE8 6041023C */  lui         $2, (0x41600000 >> 16)
/* 07F0EC 0017EFEC 00088244 */  mtc1        $2, $f1
/* 07F0F0 0017EFF0 D301013C */  lui         $1, %hi(fix_chara_pos + 0x4)
/* 07F0F4 0017EFF4 545920C4 */  lwc1        $f0, %lo(fix_chara_pos + 0x4)($1)
/* 07F0F8 0017EFF8 400B0046 */  add.s       $f13, $f1, $f0
/* 07F0FC 0017EFFC D301023C */  lui         $2, %hi(MainCamera)
/* 07F100 0017F000 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07F104 0017F004 D301013C */  lui         $1, %hi(fix_chara_pos)
/* 07F108 0017F008 50592CC4 */  lwc1        $f12, %lo(fix_chara_pos)($1)
/* 07F10C 0017F00C D301013C */  lui         $1, %hi(fix_chara_pos + 0x8)
/* 07F110 0017F010 58592EC4 */  lwc1        $f14, %lo(fix_chara_pos + 0x8)($1)
/* 07F114 0017F014 D490040C */  jal         SetRef__7CCameraFfff
/* 07F118 0017F018 00000000 */   nop
/* 07F11C 0017F01C D301023C */  lui         $2, %hi(MainCamera)
/* 07F120 0017F020 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07F124 0017F024 C492040C */  jal         FollowOff__13CCameraFollowFv
/* 07F128 0017F028 00000000 */   nop
/* 07F12C 0017F02C D301023C */  lui         $2, %hi(MainCamera)
/* 07F130 0017F030 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07F134 0017F034 0A000524 */  addiu       $5, $0, 0xA
/* 07F138 0017F038 F491040C */  jal         Step__13CCameraFollowFi
/* 07F13C 0017F03C 00000000 */   nop
/* 07F140 0017F040 D301023C */  lui         $2, %hi(MainCamera)
/* 07F144 0017F044 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07F148 0017F048 FFFF0524 */  addiu       $5, $0, -0x1
/* 07F14C 0017F04C F491040C */  jal         Step__13CCameraFollowFi
/* 07F150 0017F050 00000000 */   nop
/* 07F154 0017F054 73000010 */  b           .L0017F224
/* 07F158 0017F058 00000000 */   nop
.L0017F05C:
/* 07F15C 0017F05C 389180AF */  sw          $0, -0x6EC8($28)
/* 07F160 0017F060 A09083AF */  sw          $3, -0x6F60($28)
/* 07F164 0017F064 D000A427 */  addiu       $4, $29, 0xD0
/* 07F168 0017F068 282EA072 */  paddub      $5, $21, $0
/* 07F16C 0017F06C 28360070 */  paddub      $6, $0, $0
/* 07F170 0017F070 04918CC7 */  lwc1        $f12, -0x6EFC($28)
/* 07F174 0017F074 2C13060C */  jal         EdSearchEvent__FP14ED_EVENT_PARAMPcif
/* 07F178 0017F078 00000000 */   nop
/* 07F17C 0017F07C 37004010 */  beqz        $2, .L0017F15C
/* 07F180 0017F080 00000000 */   nop
/* 07F184 0017F084 D301023C */  lui         $2, %hi(fix_chara_pos)
/* 07F188 0017F088 50594424 */  addiu       $4, $2, %lo(fix_chara_pos)
/* 07F18C 0017F08C E000A527 */  addiu       $5, $29, 0xE0
/* 07F190 0017F090 0C86040C */  jal         sceVu0CopyVector
/* 07F194 0017F094 00000000 */   nop
/* 07F198 0017F098 D301023C */  lui         $2, %hi(fix_chara_rot)
/* 07F19C 0017F09C 60594424 */  addiu       $4, $2, %lo(fix_chara_rot)
/* 07F1A0 0017F0A0 0001A527 */  addiu       $5, $29, 0x100
/* 07F1A4 0017F0A4 0C86040C */  jal         sceVu0CopyVector
/* 07F1A8 0017F0A8 00000000 */   nop
/* 07F1AC 0017F0AC 6487848F */  lw          $4, -0x789C($28)
/* 07F1B0 0017F0B0 D301023C */  lui         $2, %hi(fix_chara_pos)
/* 07F1B4 0017F0B4 50594524 */  addiu       $5, $2, %lo(fix_chara_pos)
/* 07F1B8 0017F0B8 A000998C */  lw          $25, 0xA0($4)
/* 07F1BC 0017F0BC 1400398F */  lw          $25, 0x14($25)
/* 07F1C0 0017F0C0 09F82003 */  jalr        $25
/* 07F1C4 0017F0C4 00000000 */   nop
/* 07F1C8 0017F0C8 6487848F */  lw          $4, -0x789C($28)
/* 07F1CC 0017F0CC D301013C */  lui         $1, %hi(fix_chara_rot)
/* 07F1D0 0017F0D0 60592CC4 */  lwc1        $f12, %lo(fix_chara_rot)($1)
/* 07F1D4 0017F0D4 D301013C */  lui         $1, %hi(fix_chara_rot + 0x4)
/* 07F1D8 0017F0D8 64592DC4 */  lwc1        $f13, %lo(fix_chara_rot + 0x4)($1)
/* 07F1DC 0017F0DC D301013C */  lui         $1, %hi(fix_chara_rot + 0x8)
/* 07F1E0 0017F0E0 68592EC4 */  lwc1        $f14, %lo(fix_chara_rot + 0x8)($1)
/* 07F1E4 0017F0E4 A000998C */  lw          $25, 0xA0($4)
/* 07F1E8 0017F0E8 3000398F */  lw          $25, 0x30($25)
/* 07F1EC 0017F0EC 09F82003 */  jalr        $25
/* 07F1F0 0017F0F0 00000000 */   nop
/* 07F1F4 0017F0F4 D301023C */  lui         $2, %hi(fix_camera_pos)
/* 07F1F8 0017F0F8 70594424 */  addiu       $4, $2, %lo(fix_camera_pos)
/* 07F1FC 0017F0FC F000A527 */  addiu       $5, $29, 0xF0
/* 07F200 0017F100 0C86040C */  jal         sceVu0CopyVector
/* 07F204 0017F104 00000000 */   nop
/* 07F208 0017F108 D301023C */  lui         $2, %hi(MainCamera)
/* 07F20C 0017F10C 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07F210 0017F110 D301023C */  lui         $2, %hi(fix_camera_pos)
/* 07F214 0017F114 70594524 */  addiu       $5, $2, %lo(fix_camera_pos)
/* 07F218 0017F118 A490040C */  jal         SetPos__7CCameraFPf
/* 07F21C 0017F11C 00000000 */   nop
/* 07F220 0017F120 6041023C */  lui         $2, (0x41600000 >> 16)
/* 07F224 0017F124 00088244 */  mtc1        $2, $f1
/* 07F228 0017F128 D301013C */  lui         $1, %hi(fix_chara_pos + 0x4)
/* 07F22C 0017F12C 545920C4 */  lwc1        $f0, %lo(fix_chara_pos + 0x4)($1)
/* 07F230 0017F130 400B0046 */  add.s       $f13, $f1, $f0
/* 07F234 0017F134 D301023C */  lui         $2, %hi(MainCamera)
/* 07F238 0017F138 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07F23C 0017F13C D301013C */  lui         $1, %hi(fix_chara_pos)
/* 07F240 0017F140 50592CC4 */  lwc1        $f12, %lo(fix_chara_pos)($1)
/* 07F244 0017F144 D301013C */  lui         $1, %hi(fix_chara_pos + 0x8)
/* 07F248 0017F148 58592EC4 */  lwc1        $f14, %lo(fix_chara_pos + 0x8)($1)
/* 07F24C 0017F14C D490040C */  jal         SetRef__7CCameraFfff
/* 07F250 0017F150 00000000 */   nop
/* 07F254 0017F154 33000010 */  b           .L0017F224
/* 07F258 0017F158 00000000 */   nop
.L0017F15C:
/* 07F25C 0017F15C 6487848F */  lw          $4, -0x789C($28)
/* 07F260 0017F160 3001A527 */  addiu       $5, $29, 0x130
/* 07F264 0017F164 A000998C */  lw          $25, 0xA0($4)
/* 07F268 0017F168 A000398F */  lw          $25, 0xA0($25)
/* 07F26C 0017F16C 09F82003 */  jalr        $25
/* 07F270 0017F170 00000000 */   nop
/* 07F274 0017F174 6487848F */  lw          $4, -0x789C($28)
/* 07F278 0017F178 4001A527 */  addiu       $5, $29, 0x140
/* 07F27C 0017F17C A000998C */  lw          $25, 0xA0($4)
/* 07F280 0017F180 5800398F */  lw          $25, 0x58($25)
/* 07F284 0017F184 09F82003 */  jalr        $25
/* 07F288 0017F188 00000000 */   nop
/* 07F28C 0017F18C D301023C */  lui         $2, %hi(fix_chara_pos)
/* 07F290 0017F190 50594424 */  addiu       $4, $2, %lo(fix_chara_pos)
/* 07F294 0017F194 3001A527 */  addiu       $5, $29, 0x130
/* 07F298 0017F198 0C86040C */  jal         sceVu0CopyVector
/* 07F29C 0017F19C 00000000 */   nop
/* 07F2A0 0017F1A0 D301023C */  lui         $2, %hi(fix_chara_rot)
/* 07F2A4 0017F1A4 60594424 */  addiu       $4, $2, %lo(fix_chara_rot)
/* 07F2A8 0017F1A8 4001A527 */  addiu       $5, $29, 0x140
/* 07F2AC 0017F1AC 0C86040C */  jal         sceVu0CopyVector
/* 07F2B0 0017F1B0 00000000 */   nop
/* 07F2B4 0017F1B4 D301023C */  lui         $2, %hi(MainCamera)
/* 07F2B8 0017F1B8 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07F2BC 0017F1BC 3001A527 */  addiu       $5, $29, 0x130
/* 07F2C0 0017F1C0 9C91040C */  jal         GetPos__7CCameraFPf
/* 07F2C4 0017F1C4 00000000 */   nop
/* 07F2C8 0017F1C8 D301023C */  lui         $2, %hi(MainCamera)
/* 07F2CC 0017F1CC 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07F2D0 0017F1D0 4001A527 */  addiu       $5, $29, 0x140
/* 07F2D4 0017F1D4 A891040C */  jal         GetRef__7CCameraFPf
/* 07F2D8 0017F1D8 00000000 */   nop
/* 07F2DC 0017F1DC D301023C */  lui         $2, %hi(fix_camera_pos)
/* 07F2E0 0017F1E0 70594424 */  addiu       $4, $2, %lo(fix_camera_pos)
/* 07F2E4 0017F1E4 3001A527 */  addiu       $5, $29, 0x130
/* 07F2E8 0017F1E8 0C86040C */  jal         sceVu0CopyVector
/* 07F2EC 0017F1EC 00000000 */   nop
/* 07F2F0 0017F1F0 6041023C */  lui         $2, (0x41600000 >> 16)
/* 07F2F4 0017F1F4 00088244 */  mtc1        $2, $f1
/* 07F2F8 0017F1F8 D301013C */  lui         $1, %hi(fix_chara_pos + 0x4)
/* 07F2FC 0017F1FC 545920C4 */  lwc1        $f0, %lo(fix_chara_pos + 0x4)($1)
/* 07F300 0017F200 400B0046 */  add.s       $f13, $f1, $f0
/* 07F304 0017F204 D301023C */  lui         $2, %hi(MainCamera)
/* 07F308 0017F208 40454424 */  addiu       $4, $2, %lo(MainCamera)
/* 07F30C 0017F20C D301013C */  lui         $1, %hi(fix_chara_pos)
/* 07F310 0017F210 50592CC4 */  lwc1        $f12, %lo(fix_chara_pos)($1)
/* 07F314 0017F214 D301013C */  lui         $1, %hi(fix_chara_pos + 0x8)
/* 07F318 0017F218 58592EC4 */  lwc1        $f14, %lo(fix_chara_pos + 0x8)($1)
/* 07F31C 0017F21C D490040C */  jal         SetRef__7CCameraFfff
/* 07F320 0017F220 00000000 */   nop
.L0017F224:
/* 07F324 0017F224 00608044 */  mtc1        $0, $f12
/* 07F328 0017F228 00000000 */  nop
/* 07F32C 0017F22C 46630046 */  mov.s       $f13, $f12
/* 07F330 0017F230 86630046 */  mov.s       $f14, $f12
/* 07F334 0017F234 64000424 */  addiu       $4, $0, 0x64
/* 07F338 0017F238 E425060C */  jal         EdFadeOut__Fifff
/* 07F33C 0017F23C 00000000 */   nop
/* 07F340 0017F240 28260070 */  paddub      $4, $0, $0
/* 07F344 0017F244 0B000010 */  b           .L0017F274
/* 07F348 0017F248 00000000 */   nop
.L0017F24C:
/* 07F34C 0017F24C 40110400 */  sll         $2, $4, 5
/* 07F350 0017F250 21184400 */  addu        $3, $2, $4
/* 07F354 0017F254 80100300 */  sll         $2, $3, 2
/* 07F358 0017F258 21106200 */  addu        $2, $3, $2
/* 07F35C 0017F25C 40190200 */  sll         $3, $2, 5
/* 07F360 0017F260 D201023C */  lui         $2, %hi(EdVillager + 0x1474)
/* 07F364 0017F264 04704224 */  addiu       $2, $2, %lo(EdVillager + 0x1474)
/* 07F368 0017F268 21104300 */  addu        $2, $2, $3
/* 07F36C 0017F26C 000040AC */  sw          $0, 0x0($2)
/* 07F370 0017F270 01008424 */  addiu       $4, $4, 0x1
.L0017F274:
/* 07F374 0017F274 0A008228 */  slti        $2, $4, 0xA
/* 07F378 0017F278 F4FF4014 */  bnez        $2, .L0017F24C
/* 07F37C 0017F27C 00000000 */   nop
/* 07F380 0017F280 3C9091AF */  sw          $17, -0x6FC4($28)
/* 07F384 0017F284 03002106 */  bgez        $17, .L0017F294
/* 07F388 0017F288 00000000 */   nop
/* 07F38C 0017F28C 80000224 */  addiu       $2, $0, 0x80
/* 07F390 0017F290 3C9082AF */  sw          $2, -0x6FC4($28)
.L0017F294:
/* 07F394 0017F294 01000224 */  addiu       $2, $0, 0x1
/* 07F398 0017F298 6000BF7B */  lq          $31, 0x60($29)
/* 07F39C 0017F29C 5000B57B */  lq          $21, 0x50($29)
/* 07F3A0 0017F2A0 4000B47B */  lq          $20, 0x40($29)
/* 07F3A4 0017F2A4 3000B37B */  lq          $19, 0x30($29)
/* 07F3A8 0017F2A8 2000B27B */  lq          $18, 0x20($29)
/* 07F3AC 0017F2AC 1000B17B */  lq          $17, 0x10($29)
/* 07F3B0 0017F2B0 0000B07B */  lq          $16, 0x0($29)
/* 07F3B4 0017F2B4 5001BD27 */  addiu       $29, $29, 0x150
/* 07F3B8 0017F2B8 0800E003 */  jr          $31
/* 07F3BC 0017F2BC 00000000 */   nop
