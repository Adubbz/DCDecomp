.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DngWepEffectReadStart__Fv
/* 10D1B0 0020D0B0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 10D1B4 0020D0B4 0000BF7F */  sq         $31, 0x0($sp)
/* 10D1B8 0020D0B8 D494858F */  lw         $5, -0x6B2C($gp)
/* 10D1BC 0020D0BC 0400A480 */  lb         $4, 0x4($5)
/* 10D1C0 0020D0C0 21108500 */  addu       $2, $4, $5
/* 10D1C4 0020D0C4 40434380 */  lb         $3, 0x4340($2)
/* 10D1C8 0020D0C8 A80A0224 */  addiu      $2, $0, 0xAA8
/* 10D1CC 0020D0CC 18108200 */  mult       $2, $4, $2
/* 10D1D0 0020D0D0 2110A200 */  addu       $2, $5, $2
/* 10D1D4 0020D0D4 0C454524 */  addiu      $5, $2, 0x450C
/* 10D1D8 0020D0D8 40110300 */  sll        $2, $3, 5
/* 10D1DC 0020D0DC 23104300 */  subu       $2, $2, $3
/* 10D1E0 0020D0E0 C0100200 */  sll        $2, $2, 3
/* 10D1E4 0020D0E4 2110A200 */  addu       $2, $5, $2
/* 10D1E8 0020D0E8 16004580 */  lb         $5, 0x16($2)
/* 10D1EC 0020D0EC 18E8760C */  jal        func_1DBA060
/* 10D1F0 0020D0F0 00000000 */   nop
/* 10D1F4 0020D0F4 E89582AF */  sw         $2, -0x6A18($gp)
/* 10D1F8 0020D0F8 1000A427 */  addiu      $4, $sp, 0x10
/* 10D1FC 0020D0FC 2A00023C */  lui        $2, %hi(_936_3)
/* 10D200 0020D100 B0DD4524 */  addiu      $5, $2, %lo(_936_3)
/* 10D204 0020D104 E895868F */  lw         $6, -0x6A18($gp)
/* 10D208 0020D108 1614040C */  jal        sprintf
/* 10D20C 0020D10C 00000000 */   nop
/* 10D210 0020D110 2034080C */  jal        GetWepEffectMenuReadBuf__Fv
/* 10D214 0020D114 00000000 */   nop
/* 10D218 0020D118 EC9582AF */  sw         $2, -0x6A14($gp)
/* 10D21C 0020D11C EC95848F */  lw         $4, -0x6A14($gp)
/* 10D220 0020D120 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 10D224 0020D124 00000000 */   nop
/* 10D228 0020D128 EC9582AF */  sw         $2, -0x6A14($gp)
/* 10D22C 0020D12C EC95858F */  lw         $5, -0x6A14($gp)
/* 10D230 0020D130 1000A427 */  addiu      $4, $sp, 0x10
/* 10D234 0020D134 5C00A627 */  addiu      $6, $sp, 0x5C
/* 10D238 0020D138 ACFA040C */  jal        LoadFileBG__FPcP1Pi
/* 10D23C 0020D13C 00000000 */   nop
/* 10D240 0020D140 01000424 */  addiu      $4, $0, 0x1
/* 10D244 0020D144 1434080C */  jal        SetMenuCharaEffectReadFlag__Fi
/* 10D248 0020D148 00000000 */   nop
/* 10D24C 0020D14C 1C34080C */  jal        GetDngWepEffectPointer__Fv
/* 10D250 0020D150 00000000 */   nop
/* 10D254 0020D154 0000BF7B */  lq         $31, 0x0($sp)
/* 10D258 0020D158 6000BD27 */  addiu      $sp, $sp, 0x60
/* 10D25C 0020D15C 0800E003 */  jr         $31
/* 10D260 0020D160 00000000 */   nop
/* 10D264 0020D164 00000000 */  nop
/* 10D268 0020D168 00000000 */  nop
/* 10D26C 0020D16C 00000000 */  nop
