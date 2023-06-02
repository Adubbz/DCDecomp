.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GotoInterior__FPciiP14ED_EVENT_PARAMi
/* 7EEE0 0017EDE0 B0FEBD27 */  addiu      $sp, $sp, -0x150
/* 7EEE4 0017EDE4 6000BF7F */  sq         $31, 0x60($sp)
/* 7EEE8 0017EDE8 5000B57F */  sq         $21, 0x50($sp)
/* 7EEEC 0017EDEC 4000B47F */  sq         $20, 0x40($sp)
/* 7EEF0 0017EDF0 3000B37F */  sq         $19, 0x30($sp)
/* 7EEF4 0017EDF4 2000B27F */  sq         $18, 0x20($sp)
/* 7EEF8 0017EDF8 1000B17F */  sq         $17, 0x10($sp)
/* 7EEFC 0017EDFC 0000B07F */  sq         $16, 0x0($sp)
/* 7EF00 0017EE00 28AE8070 */  paddub     $21, $4, $0
/* 7EF04 0017EE04 28A6A070 */  paddub     $20, $5, $0
/* 7EF08 0017EE08 289EC070 */  paddub     $19, $6, $0
/* 7EF0C 0017EE0C 2896E070 */  paddub     $18, $7, $0
/* 7EF10 0017EE10 288E0071 */  paddub     $17, $8, $0
/* 7EF14 0017EE14 2700023C */  lui        $2, %hi(_2365)
/* 7EF18 0017EE18 80944224 */  addiu      $2, $2, %lo(_2365)
/* 7EF1C 0017EE1C 7000A427 */  addiu      $4, $sp, 0x70
/* 7EF20 0017EE20 00004378 */  lq         $3, 0x0($2)
/* 7EF24 0017EE24 100042C4 */  lwc1       $f2, 0x10($2)
/* 7EF28 0017EE28 0000837C */  sq         $3, 0x0($4)
/* 7EF2C 0017EE2C 100082E4 */  swc1       $f2, 0x10($4)
/* 7EF30 0017EE30 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7EF34 0017EE34 981F060C */  jal        EdGetTime__Ff
/* 7EF38 0017EE38 00000000 */   nop
/* 7EF3C 0017EE3C 28864070 */  paddub     $16, $2, $0
/* 7EF40 0017EE40 D201023C */  lui        $2, %hi(EdInteriorName)
/* 7EF44 0017EE44 00B54424 */  addiu      $4, $2, %lo(EdInteriorName)
/* 7EF48 0017EE48 282EA072 */  paddub     $5, $21, $0
/* 7EF4C 0017EE4C 5A15040C */  jal        strcpy
/* 7EF50 0017EE50 00000000 */   nop
/* 7EF54 0017EE54 80101000 */  sll        $2, $16, 2
/* 7EF58 0017EE58 21185D00 */  addu       $3, $2, $sp
/* 7EF5C 0017EE5C 9000A427 */  addiu      $4, $sp, 0x90
/* 7EF60 0017EE60 2A00023C */  lui        $2, %hi(_2389)
/* 7EF64 0017EE64 68AC4524 */  addiu      $5, $2, %lo(_2389)
/* 7EF68 0017EE68 D201023C */  lui        $2, %hi(EditDataDir)
/* 7EF6C 0017EE6C E0B34624 */  addiu      $6, $2, %lo(EditDataDir)
/* 7EF70 0017EE70 283EA072 */  paddub     $7, $21, $0
/* 7EF74 0017EE74 2846A072 */  paddub     $8, $21, $0
/* 7EF78 0017EE78 7000698C */  lw         $9, 0x70($3)
/* 7EF7C 0017EE7C 1614040C */  jal        sprintf
/* 7EF80 0017EE80 00000000 */   nop
/* 7EF84 0017EE84 D301023C */  lui        $2, %hi(interior_map_name)
/* 7EF88 0017EE88 80594424 */  addiu      $4, $2, %lo(interior_map_name)
/* 7EF8C 0017EE8C 2A00023C */  lui        $2, %hi(_2390)
/* 7EF90 0017EE90 78AC4524 */  addiu      $5, $2, %lo(_2390)
/* 7EF94 0017EE94 9000A627 */  addiu      $6, $sp, 0x90
/* 7EF98 0017EE98 1614040C */  jal        sprintf
/* 7EF9C 0017EE9C 00000000 */   nop
/* 7EFA0 0017EEA0 309094AF */  sw         $20, -0x6FD0($gp)
/* 7EFA4 0017EEA4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 7EFA8 0017EEA8 58B320AC */  sw         $0, -0x4CA8($at)
/* 7EFAC 0017EEAC 02004016 */  bnez       $18, .L0017EEB8
/* 7EFB0 0017EEB0 00000000 */   nop
/* 7EFB4 0017EEB4 289E0070 */  paddub     $19, $0, $0
.L0017EEB8:
/* 7EFB8 0017EEB8 349080AF */  sw         $0, -0x6FCC($gp)
/* 7EFBC 0017EEBC 04004012 */  beqz       $18, .L0017EED0
/* 7EFC0 0017EEC0 00000000 */   nop
/* 7EFC4 0017EEC4 5000428E */  lw         $2, 0x50($18)
/* 7EFC8 0017EEC8 0400428C */  lw         $2, 0x4($2)
/* 7EFCC 0017EECC 349082AF */  sw         $2, -0x6FCC($gp)
.L0017EED0:
/* 7EFD0 0017EED0 349193AF */  sw         $19, -0x6ECC($gp)
/* 7EFD4 0017EED4 A0000324 */  addiu      $3, $0, 0xA0
/* 7EFD8 0017EED8 309183AF */  sw         $3, -0x6ED0($gp)
/* 7EFDC 0017EEDC 0B000224 */  addiu      $2, $0, 0xB
/* 7EFE0 0017EEE0 608782AF */  sw         $2, -0x78A0($gp)
/* 7EFE4 0017EEE4 FFFF0224 */  addiu      $2, $0, -0x1
/* 7EFE8 0017EEE8 389082AF */  sw         $2, -0x6FC8($gp)
/* 7EFEC 0017EEEC 5B006012 */  beqz       $19, .L0017F05C
/* 7EFF0 0017EEF0 00000000 */   nop
/* 7EFF4 0017EEF4 01000224 */  addiu      $2, $0, 0x1
/* 7EFF8 0017EEF8 389182AF */  sw         $2, -0x6EC8($gp)
/* 7EFFC 0017EEFC 5000428E */  lw         $2, 0x50($18)
/* 7F000 0017EF00 2000428C */  lw         $2, 0x20($2)
/* 7F004 0017EF04 389082AF */  sw         $2, -0x6FC8($gp)
/* 7F008 0017EF08 2A281300 */  slt        $5, $0, $19
/* 7F00C 0017EF0C 5000428E */  lw         $2, 0x50($18)
/* 7F010 0017EF10 2000448C */  lw         $4, 0x20($2)
/* 7F014 0017EF14 70C8050C */  jal        EdGetDoorMotion__Fii
/* 7F018 0017EF18 00000000 */   nop
/* 7F01C 0017EF1C 6487838F */  lw         $3, -0x789C($gp)
/* 7F020 0017EF20 680C62AC */  sw         $2, 0xC68($3)
/* 7F024 0017EF24 06000224 */  addiu      $2, $0, 0x6
/* 7F028 0017EF28 640C62AC */  sw         $2, 0xC64($3)
/* 7F02C 0017EF2C 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* 7F030 0017EF30 600C62AC */  sw         $2, 0xC60($3)
/* 7F034 0017EF34 D301023C */  lui        $2, %hi(fix_chara_pos)
/* 7F038 0017EF38 50594424 */  addiu      $4, $2, %lo(fix_chara_pos)
/* 7F03C 0017EF3C 10004526 */  addiu      $5, $18, 0x10
/* 7F040 0017EF40 0C86040C */  jal        sceVu0CopyVector
/* 7F044 0017EF44 00000000 */   nop
/* 7F048 0017EF48 D301023C */  lui        $2, %hi(fix_chara_rot)
/* 7F04C 0017EF4C 60594424 */  addiu      $4, $2, %lo(fix_chara_rot)
/* 7F050 0017EF50 30004526 */  addiu      $5, $18, 0x30
/* 7F054 0017EF54 0C86040C */  jal        sceVu0CopyVector
/* 7F058 0017EF58 00000000 */   nop
/* 7F05C 0017EF5C 6487848F */  lw         $4, -0x789C($gp)
/* 7F060 0017EF60 D301023C */  lui        $2, %hi(fix_chara_pos)
/* 7F064 0017EF64 50594524 */  addiu      $5, $2, %lo(fix_chara_pos)
/* 7F068 0017EF68 A000998C */  lw         $25, 0xA0($4)
/* 7F06C 0017EF6C 1400398F */  lw         $25, 0x14($25)
/* 7F070 0017EF70 09F82003 */  jalr       $25
/* 7F074 0017EF74 00000000 */   nop
/* 7F078 0017EF78 6487848F */  lw         $4, -0x789C($gp)
/* 7F07C 0017EF7C D301013C */  lui        $at, (0x1D35960 >> 16)
/* 7F080 0017EF80 60592CC4 */  lwc1       $f12, (0x1D35960 & 0xFFFF)($at)
/* 7F084 0017EF84 D301013C */  lui        $at, (0x1D35964 >> 16)
/* 7F088 0017EF88 64592DC4 */  lwc1       $f13, (0x1D35964 & 0xFFFF)($at)
/* 7F08C 0017EF8C D301013C */  lui        $at, (0x1D35968 >> 16)
/* 7F090 0017EF90 68592EC4 */  lwc1       $f14, (0x1D35968 & 0xFFFF)($at)
/* 7F094 0017EF94 A000998C */  lw         $25, 0xA0($4)
/* 7F098 0017EF98 3000398F */  lw         $25, 0x30($25)
/* 7F09C 0017EF9C 09F82003 */  jalr       $25
/* 7F0A0 0017EFA0 00000000 */   nop
/* 7F0A4 0017EFA4 6487848F */  lw         $4, -0x789C($gp)
/* 7F0A8 0017EFA8 FFFF0524 */  addiu      $5, $0, -0x1
/* 7F0AC 0017EFAC A000998C */  lw         $25, 0xA0($4)
/* 7F0B0 0017EFB0 9400398F */  lw         $25, 0x94($25)
/* 7F0B4 0017EFB4 09F82003 */  jalr       $25
/* 7F0B8 0017EFB8 00000000 */   nop
/* 7F0BC 0017EFBC D301023C */  lui        $2, %hi(fix_camera_pos)
/* 7F0C0 0017EFC0 70594424 */  addiu      $4, $2, %lo(fix_camera_pos)
/* 7F0C4 0017EFC4 20004526 */  addiu      $5, $18, 0x20
/* 7F0C8 0017EFC8 0C86040C */  jal        sceVu0CopyVector
/* 7F0CC 0017EFCC 00000000 */   nop
/* 7F0D0 0017EFD0 D301023C */  lui        $2, %hi(MainCamera)
/* 7F0D4 0017EFD4 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7F0D8 0017EFD8 D301023C */  lui        $2, %hi(fix_camera_pos)
/* 7F0DC 0017EFDC 70594524 */  addiu      $5, $2, %lo(fix_camera_pos)
/* 7F0E0 0017EFE0 A490040C */  jal        SetPos__7CCameraFPf
/* 7F0E4 0017EFE4 00000000 */   nop
/* 7F0E8 0017EFE8 6041023C */  lui        $2, (0x41600000 >> 16)
/* 7F0EC 0017EFEC 00088244 */  mtc1       $2, $f1
/* 7F0F0 0017EFF0 D301013C */  lui        $at, (0x1D35954 >> 16)
/* 7F0F4 0017EFF4 545920C4 */  lwc1       $f0, (0x1D35954 & 0xFFFF)($at)
/* 7F0F8 0017EFF8 400B0046 */  add.s      $f13, $f1, $f0
/* 7F0FC 0017EFFC D301023C */  lui        $2, %hi(MainCamera)
/* 7F100 0017F000 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7F104 0017F004 D301013C */  lui        $at, (0x1D35950 >> 16)
/* 7F108 0017F008 50592CC4 */  lwc1       $f12, (0x1D35950 & 0xFFFF)($at)
/* 7F10C 0017F00C D301013C */  lui        $at, (0x1D35958 >> 16)
/* 7F110 0017F010 58592EC4 */  lwc1       $f14, (0x1D35958 & 0xFFFF)($at)
/* 7F114 0017F014 D490040C */  jal        SetRef__7CCameraFfff
/* 7F118 0017F018 00000000 */   nop
/* 7F11C 0017F01C D301023C */  lui        $2, %hi(MainCamera)
/* 7F120 0017F020 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7F124 0017F024 C492040C */  jal        FollowOff__13CCameraFollowFv
/* 7F128 0017F028 00000000 */   nop
/* 7F12C 0017F02C D301023C */  lui        $2, %hi(MainCamera)
/* 7F130 0017F030 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7F134 0017F034 0A000524 */  addiu      $5, $0, 0xA
/* 7F138 0017F038 F491040C */  jal        Step__13CCameraFollowFi
/* 7F13C 0017F03C 00000000 */   nop
/* 7F140 0017F040 D301023C */  lui        $2, %hi(MainCamera)
/* 7F144 0017F044 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7F148 0017F048 FFFF0524 */  addiu      $5, $0, -0x1
/* 7F14C 0017F04C F491040C */  jal        Step__13CCameraFollowFi
/* 7F150 0017F050 00000000 */   nop
/* 7F154 0017F054 73000010 */  b          .L0017F224
/* 7F158 0017F058 00000000 */   nop
.L0017F05C:
/* 7F15C 0017F05C 389180AF */  sw         $0, -0x6EC8($gp)
/* 7F160 0017F060 A09083AF */  sw         $3, -0x6F60($gp)
/* 7F164 0017F064 D000A427 */  addiu      $4, $sp, 0xD0
/* 7F168 0017F068 282EA072 */  paddub     $5, $21, $0
/* 7F16C 0017F06C 28360070 */  paddub     $6, $0, $0
/* 7F170 0017F070 04918CC7 */  lwc1       $f12, -0x6EFC($gp)
/* 7F174 0017F074 2C13060C */  jal        EdSearchEvent__FP14ED_EVENT_PARAMPcif
/* 7F178 0017F078 00000000 */   nop
/* 7F17C 0017F07C 37004010 */  beqz       $2, .L0017F15C
/* 7F180 0017F080 00000000 */   nop
/* 7F184 0017F084 D301023C */  lui        $2, %hi(fix_chara_pos)
/* 7F188 0017F088 50594424 */  addiu      $4, $2, %lo(fix_chara_pos)
/* 7F18C 0017F08C E000A527 */  addiu      $5, $sp, 0xE0
/* 7F190 0017F090 0C86040C */  jal        sceVu0CopyVector
/* 7F194 0017F094 00000000 */   nop
/* 7F198 0017F098 D301023C */  lui        $2, %hi(fix_chara_rot)
/* 7F19C 0017F09C 60594424 */  addiu      $4, $2, %lo(fix_chara_rot)
/* 7F1A0 0017F0A0 0001A527 */  addiu      $5, $sp, 0x100
/* 7F1A4 0017F0A4 0C86040C */  jal        sceVu0CopyVector
/* 7F1A8 0017F0A8 00000000 */   nop
/* 7F1AC 0017F0AC 6487848F */  lw         $4, -0x789C($gp)
/* 7F1B0 0017F0B0 D301023C */  lui        $2, %hi(fix_chara_pos)
/* 7F1B4 0017F0B4 50594524 */  addiu      $5, $2, %lo(fix_chara_pos)
/* 7F1B8 0017F0B8 A000998C */  lw         $25, 0xA0($4)
/* 7F1BC 0017F0BC 1400398F */  lw         $25, 0x14($25)
/* 7F1C0 0017F0C0 09F82003 */  jalr       $25
/* 7F1C4 0017F0C4 00000000 */   nop
/* 7F1C8 0017F0C8 6487848F */  lw         $4, -0x789C($gp)
/* 7F1CC 0017F0CC D301013C */  lui        $at, (0x1D35960 >> 16)
/* 7F1D0 0017F0D0 60592CC4 */  lwc1       $f12, (0x1D35960 & 0xFFFF)($at)
/* 7F1D4 0017F0D4 D301013C */  lui        $at, (0x1D35964 >> 16)
/* 7F1D8 0017F0D8 64592DC4 */  lwc1       $f13, (0x1D35964 & 0xFFFF)($at)
/* 7F1DC 0017F0DC D301013C */  lui        $at, (0x1D35968 >> 16)
/* 7F1E0 0017F0E0 68592EC4 */  lwc1       $f14, (0x1D35968 & 0xFFFF)($at)
/* 7F1E4 0017F0E4 A000998C */  lw         $25, 0xA0($4)
/* 7F1E8 0017F0E8 3000398F */  lw         $25, 0x30($25)
/* 7F1EC 0017F0EC 09F82003 */  jalr       $25
/* 7F1F0 0017F0F0 00000000 */   nop
/* 7F1F4 0017F0F4 D301023C */  lui        $2, %hi(fix_camera_pos)
/* 7F1F8 0017F0F8 70594424 */  addiu      $4, $2, %lo(fix_camera_pos)
/* 7F1FC 0017F0FC F000A527 */  addiu      $5, $sp, 0xF0
/* 7F200 0017F100 0C86040C */  jal        sceVu0CopyVector
/* 7F204 0017F104 00000000 */   nop
/* 7F208 0017F108 D301023C */  lui        $2, %hi(MainCamera)
/* 7F20C 0017F10C 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7F210 0017F110 D301023C */  lui        $2, %hi(fix_camera_pos)
/* 7F214 0017F114 70594524 */  addiu      $5, $2, %lo(fix_camera_pos)
/* 7F218 0017F118 A490040C */  jal        SetPos__7CCameraFPf
/* 7F21C 0017F11C 00000000 */   nop
/* 7F220 0017F120 6041023C */  lui        $2, (0x41600000 >> 16)
/* 7F224 0017F124 00088244 */  mtc1       $2, $f1
/* 7F228 0017F128 D301013C */  lui        $at, (0x1D35954 >> 16)
/* 7F22C 0017F12C 545920C4 */  lwc1       $f0, (0x1D35954 & 0xFFFF)($at)
/* 7F230 0017F130 400B0046 */  add.s      $f13, $f1, $f0
/* 7F234 0017F134 D301023C */  lui        $2, %hi(MainCamera)
/* 7F238 0017F138 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7F23C 0017F13C D301013C */  lui        $at, (0x1D35950 >> 16)
/* 7F240 0017F140 50592CC4 */  lwc1       $f12, (0x1D35950 & 0xFFFF)($at)
/* 7F244 0017F144 D301013C */  lui        $at, (0x1D35958 >> 16)
/* 7F248 0017F148 58592EC4 */  lwc1       $f14, (0x1D35958 & 0xFFFF)($at)
/* 7F24C 0017F14C D490040C */  jal        SetRef__7CCameraFfff
/* 7F250 0017F150 00000000 */   nop
/* 7F254 0017F154 33000010 */  b          .L0017F224
/* 7F258 0017F158 00000000 */   nop
.L0017F15C:
/* 7F25C 0017F15C 6487848F */  lw         $4, -0x789C($gp)
/* 7F260 0017F160 3001A527 */  addiu      $5, $sp, 0x130
/* 7F264 0017F164 A000998C */  lw         $25, 0xA0($4)
/* 7F268 0017F168 A000398F */  lw         $25, 0xA0($25)
/* 7F26C 0017F16C 09F82003 */  jalr       $25
/* 7F270 0017F170 00000000 */   nop
/* 7F274 0017F174 6487848F */  lw         $4, -0x789C($gp)
/* 7F278 0017F178 4001A527 */  addiu      $5, $sp, 0x140
/* 7F27C 0017F17C A000998C */  lw         $25, 0xA0($4)
/* 7F280 0017F180 5800398F */  lw         $25, 0x58($25)
/* 7F284 0017F184 09F82003 */  jalr       $25
/* 7F288 0017F188 00000000 */   nop
/* 7F28C 0017F18C D301023C */  lui        $2, %hi(fix_chara_pos)
/* 7F290 0017F190 50594424 */  addiu      $4, $2, %lo(fix_chara_pos)
/* 7F294 0017F194 3001A527 */  addiu      $5, $sp, 0x130
/* 7F298 0017F198 0C86040C */  jal        sceVu0CopyVector
/* 7F29C 0017F19C 00000000 */   nop
/* 7F2A0 0017F1A0 D301023C */  lui        $2, %hi(fix_chara_rot)
/* 7F2A4 0017F1A4 60594424 */  addiu      $4, $2, %lo(fix_chara_rot)
/* 7F2A8 0017F1A8 4001A527 */  addiu      $5, $sp, 0x140
/* 7F2AC 0017F1AC 0C86040C */  jal        sceVu0CopyVector
/* 7F2B0 0017F1B0 00000000 */   nop
/* 7F2B4 0017F1B4 D301023C */  lui        $2, %hi(MainCamera)
/* 7F2B8 0017F1B8 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7F2BC 0017F1BC 3001A527 */  addiu      $5, $sp, 0x130
/* 7F2C0 0017F1C0 9C91040C */  jal        GetPos__7CCameraFPf
/* 7F2C4 0017F1C4 00000000 */   nop
/* 7F2C8 0017F1C8 D301023C */  lui        $2, %hi(MainCamera)
/* 7F2CC 0017F1CC 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7F2D0 0017F1D0 4001A527 */  addiu      $5, $sp, 0x140
/* 7F2D4 0017F1D4 A891040C */  jal        GetRef__7CCameraFPf
/* 7F2D8 0017F1D8 00000000 */   nop
/* 7F2DC 0017F1DC D301023C */  lui        $2, %hi(fix_camera_pos)
/* 7F2E0 0017F1E0 70594424 */  addiu      $4, $2, %lo(fix_camera_pos)
/* 7F2E4 0017F1E4 3001A527 */  addiu      $5, $sp, 0x130
/* 7F2E8 0017F1E8 0C86040C */  jal        sceVu0CopyVector
/* 7F2EC 0017F1EC 00000000 */   nop
/* 7F2F0 0017F1F0 6041023C */  lui        $2, (0x41600000 >> 16)
/* 7F2F4 0017F1F4 00088244 */  mtc1       $2, $f1
/* 7F2F8 0017F1F8 D301013C */  lui        $at, (0x1D35954 >> 16)
/* 7F2FC 0017F1FC 545920C4 */  lwc1       $f0, (0x1D35954 & 0xFFFF)($at)
/* 7F300 0017F200 400B0046 */  add.s      $f13, $f1, $f0
/* 7F304 0017F204 D301023C */  lui        $2, %hi(MainCamera)
/* 7F308 0017F208 40454424 */  addiu      $4, $2, %lo(MainCamera)
/* 7F30C 0017F20C D301013C */  lui        $at, (0x1D35950 >> 16)
/* 7F310 0017F210 50592CC4 */  lwc1       $f12, (0x1D35950 & 0xFFFF)($at)
/* 7F314 0017F214 D301013C */  lui        $at, (0x1D35958 >> 16)
/* 7F318 0017F218 58592EC4 */  lwc1       $f14, (0x1D35958 & 0xFFFF)($at)
/* 7F31C 0017F21C D490040C */  jal        SetRef__7CCameraFfff
/* 7F320 0017F220 00000000 */   nop
.L0017F224:
/* 7F324 0017F224 00608044 */  mtc1       $0, $f12
/* 7F328 0017F228 00000000 */  nop
/* 7F32C 0017F22C 46630046 */  mov.s      $f13, $f12
/* 7F330 0017F230 86630046 */  mov.s      $f14, $f12
/* 7F334 0017F234 64000424 */  addiu      $4, $0, 0x64
/* 7F338 0017F238 E425060C */  jal        EdFadeOut__Fifff
/* 7F33C 0017F23C 00000000 */   nop
/* 7F340 0017F240 28260070 */  paddub     $4, $0, $0
/* 7F344 0017F244 0B000010 */  b          .L0017F274
/* 7F348 0017F248 00000000 */   nop
.L0017F24C:
/* 7F34C 0017F24C 40110400 */  sll        $2, $4, 5
/* 7F350 0017F250 21184400 */  addu       $3, $2, $4
/* 7F354 0017F254 80100300 */  sll        $2, $3, 2
/* 7F358 0017F258 21106200 */  addu       $2, $3, $2
/* 7F35C 0017F25C 40190200 */  sll        $3, $2, 5
/* 7F360 0017F260 D201023C */  lui        $2, %hi(D_1D27004)
/* 7F364 0017F264 04704224 */  addiu      $2, $2, %lo(D_1D27004)
/* 7F368 0017F268 21104300 */  addu       $2, $2, $3
/* 7F36C 0017F26C 000040AC */  sw         $0, 0x0($2)
/* 7F370 0017F270 01008424 */  addiu      $4, $4, 0x1
.L0017F274:
/* 7F374 0017F274 0A008228 */  slti       $2, $4, 0xA
/* 7F378 0017F278 F4FF4014 */  bnez       $2, .L0017F24C
/* 7F37C 0017F27C 00000000 */   nop
/* 7F380 0017F280 3C9091AF */  sw         $17, -0x6FC4($gp)
/* 7F384 0017F284 03002106 */  bgez       $17, .L0017F294
/* 7F388 0017F288 00000000 */   nop
/* 7F38C 0017F28C 80000224 */  addiu      $2, $0, 0x80
/* 7F390 0017F290 3C9082AF */  sw         $2, -0x6FC4($gp)
.L0017F294:
/* 7F394 0017F294 01000224 */  addiu      $2, $0, 0x1
/* 7F398 0017F298 6000BF7B */  lq         $31, 0x60($sp)
/* 7F39C 0017F29C 5000B57B */  lq         $21, 0x50($sp)
/* 7F3A0 0017F2A0 4000B47B */  lq         $20, 0x40($sp)
/* 7F3A4 0017F2A4 3000B37B */  lq         $19, 0x30($sp)
/* 7F3A8 0017F2A8 2000B27B */  lq         $18, 0x20($sp)
/* 7F3AC 0017F2AC 1000B17B */  lq         $17, 0x10($sp)
/* 7F3B0 0017F2B0 0000B07B */  lq         $16, 0x0($sp)
/* 7F3B4 0017F2B4 5001BD27 */  addiu      $sp, $sp, 0x150
/* 7F3B8 0017F2B8 0800E003 */  jr         $31
/* 7F3BC 0017F2BC 00000000 */   nop
