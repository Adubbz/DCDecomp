.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CharaChangeLoop__Fv
/* 128CB0 00228BB0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 128CB4 00228BB4 1000BF7F */  sq         $31, 0x10($sp)
/* 128CB8 00228BB8 0000B07F */  sq         $16, 0x0($sp)
/* 128CBC 00228BBC 8CFB040C */  jal        ReadBGSync__Fv
/* 128CC0 00228BC0 00000000 */   nop
/* 128CC4 00228BC4 72004014 */  bnez       $2, .L00228D90
/* 128CC8 00228BC8 00000000 */   nop
/* 128CCC 00228BCC 84978287 */  lh         $2, -0x687C($gp)
/* 128CD0 00228BD0 6F004014 */  bnez       $2, .L00228D90
/* 128CD4 00228BD4 00000000 */   nop
/* 128CD8 00228BD8 2900023C */  lui        $2, %hi(_1356_2)
/* 128CDC 00228BDC 50424524 */  addiu      $5, $2, %lo(_1356_2)
/* 128CE0 00228BE0 2000A427 */  addiu      $4, $sp, 0x20
/* 128CE4 00228BE4 02000324 */  addiu      $3, $0, 0x2
.L00228BE8:
/* 128CE8 00228BE8 0000A278 */  lq         $2, 0x0($5)
/* 128CEC 00228BEC 1000A524 */  addiu      $5, $5, 0x10
/* 128CF0 00228BF0 FFFF6324 */  addiu      $3, $3, -0x1
/* 128CF4 00228BF4 0000827C */  sq         $2, 0x0($4)
/* 128CF8 00228BF8 10008424 */  addiu      $4, $4, 0x10
/* 128CFC 00228BFC FAFF601C */  bgtz       $3, .L00228BE8
/* 128D00 00228C00 00000000 */   nop
/* 128D04 00228C04 0000A2C4 */  lwc1       $f2, 0x0($5)
/* 128D08 00228C08 000082E4 */  swc1       $f2, 0x0($4)
/* 128D0C 00228C0C 80978287 */  lh         $2, -0x6880($gp)
/* 128D10 00228C10 2400A2AF */  sw         $2, 0x24($sp)
/* 128D14 00228C14 3000A2AF */  sw         $2, 0x30($sp)
/* 128D18 00228C18 28260070 */  paddub     $4, $0, $0
/* 128D1C 00228C1C 18FB040C */  jal        GetReadBGFile__Fi
/* 128D20 00228C20 00000000 */   nop
/* 128D24 00228C24 28864070 */  paddub     $16, $2, $0
/* 128D28 00228C28 04000016 */  bnez       $16, .L00228C3C
/* 128D2C 00228C2C 00000000 */   nop
/* 128D30 00228C30 01000224 */  addiu      $2, $0, 0x1
/* 128D34 00228C34 90000010 */  b          .L00228E78
/* 128D38 00228C38 00000000 */   nop
.L00228C3C:
/* 128D3C 00228C3C 8C00048E */  lw         $4, 0x8C($16)
/* 128D40 00228C40 2A00023C */  lui        $2, %hi(_1373)
/* 128D44 00228C44 C8EF4524 */  addiu      $5, $2, %lo(_1373)
/* 128D48 00228C48 28360070 */  paddub     $6, $0, $0
/* 128D4C 00228C4C C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 128D50 00228C50 00000000 */   nop
/* 128D54 00228C54 2C00A2AF */  sw         $2, 0x2C($sp)
/* 128D58 00228C58 80978587 */  lh         $5, -0x6880($gp)
/* 128D5C 00228C5C C701023C */  lui        $2, %hi(TexManager)
/* 128D60 00228C60 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 128D64 00228C64 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 128D68 00228C68 00000000 */   nop
/* 128D6C 00228C6C C701023C */  lui        $2, %hi(TexManager)
/* 128D70 00228C70 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 128D74 00228C74 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 128D78 00228C78 00000000 */   nop
/* 128D7C 00228C7C C701023C */  lui        $2, %hi(TexManager)
/* 128D80 00228C80 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 128D84 00228C84 FFFF0524 */  addiu      $5, $0, -0x1
/* 128D88 00228C88 2000A627 */  addiu      $6, $sp, 0x20
/* 128D8C 00228C8C 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 128D90 00228C90 00000000 */   nop
/* 128D94 00228C94 C701023C */  lui        $2, %hi(TexManager)
/* 128D98 00228C98 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 128D9C 00228C9C 2A00023C */  lui        $2, %hi(_1374)
/* 128DA0 00228CA0 D8EF4524 */  addiu      $5, $2, %lo(_1374)
/* 128DA4 00228CA4 FFFF0624 */  addiu      $6, $0, -0x1
/* 128DA8 00228CA8 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 128DAC 00228CAC 00000000 */   nop
/* 128DB0 00228CB0 8C9782AF */  sw         $2, -0x6874($gp)
/* 128DB4 00228CB4 9000028E */  lw         $2, 0x90($16)
/* 128DB8 00228CB8 03110200 */  sra        $2, $2, 4
/* 128DBC 00228CBC 00190200 */  sll        $3, $2, 4
/* 128DC0 00228CC0 8C00028E */  lw         $2, 0x8C($16)
/* 128DC4 00228CC4 21104300 */  addu       $2, $2, $3
/* 128DC8 00228CC8 40004224 */  addiu      $2, $2, 0x40
/* 128DCC 00228CCC 889782AF */  sw         $2, -0x6878($gp)
/* 128DD0 00228CD0 8897848F */  lw         $4, -0x6878($gp)
/* 128DD4 00228CD4 00AF080C */  jal        MenuCalcBufAlignment__FP1
/* 128DD8 00228CD8 00000000 */   nop
/* 128DDC 00228CDC 889782AF */  sw         $2, -0x6878($gp)
/* 128DE0 00228CE0 01000224 */  addiu      $2, $0, 0x1
/* 128DE4 00228CE4 849782A7 */  sh         $2, -0x687C($gp)
/* 128DE8 00228CE8 8C00048E */  lw         $4, 0x8C($16)
/* 128DEC 00228CEC 2A00023C */  lui        $2, %hi(_1375)
/* 128DF0 00228CF0 E8EF4524 */  addiu      $5, $2, %lo(_1375)
/* 128DF4 00228CF4 28360070 */  paddub     $6, $0, $0
/* 128DF8 00228CF8 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 128DFC 00228CFC 00000000 */   nop
/* 128E00 00228D00 28260070 */  paddub     $4, $0, $0
/* 128E04 00228D04 282E4070 */  paddub     $5, $2, $0
/* 128E08 00228D08 50B0080C */  jal        InitMenuMesSet__FiPs
/* 128E0C 00228D0C 00000000 */   nop
/* 128E10 00228D10 FFFF0224 */  addiu      $2, $0, -0x1
/* 128E14 00228D14 DA01013C */  lui        $at, (0x1DA3B64 >> 16)
/* 128E18 00228D18 643B22AC */  sw         $2, (0x1DA3B64 & 0xFFFF)($at)
/* 128E1C 00228D1C DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* 128E20 00228D20 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* 128E24 00228D24 01000524 */  addiu      $5, $0, 0x1
/* 128E28 00228D28 9836050C */  jal        Preset__6ClsMesFi
/* 128E2C 00228D2C 00000000 */   nop
/* 128E30 00228D30 01000524 */  addiu      $5, $0, 0x1
/* 128E34 00228D34 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 128E38 00228D38 828D2380 */  lb         $3, -0x727E($at)
/* 128E3C 00228D3C 02006514 */  bne        $3, $5, .L00228D48
/* 128E40 00228D40 00000000 */   nop
/* 128E44 00228D44 04000524 */  addiu      $5, $0, 0x4
.L00228D48:
/* 128E48 00228D48 02000224 */  addiu      $2, $0, 0x2
/* 128E4C 00228D4C 02006214 */  bne        $3, $2, .L00228D58
/* 128E50 00228D50 00000000 */   nop
/* 128E54 00228D54 05000524 */  addiu      $5, $0, 0x5
.L00228D58:
/* 128E58 00228D58 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* 128E5C 00228D5C 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* 128E60 00228D60 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 128E64 00228D64 00000000 */   nop
/* 128E68 00228D68 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 128E6C 00228D6C 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 128E70 00228D70 01000524 */  addiu      $5, $0, 0x1
/* 128E74 00228D74 9836050C */  jal        Preset__6ClsMesFi
/* 128E78 00228D78 00000000 */   nop
/* 128E7C 00228D7C DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 128E80 00228D80 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 128E84 00228D84 03000524 */  addiu      $5, $0, 0x3
/* 128E88 00228D88 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 128E8C 00228D8C 00000000 */   nop
.L00228D90:
/* 128E90 00228D90 28860070 */  paddub     $16, $0, $0
/* 128E94 00228D94 84978287 */  lh         $2, -0x687C($gp)
/* 128E98 00228D98 04004010 */  beqz       $2, .L00228DAC
/* 128E9C 00228D9C 00000000 */   nop
/* 128EA0 00228DA0 A4A3080C */  jal        CharaChangeKey__Fv
/* 128EA4 00228DA4 00000000 */   nop
/* 128EA8 00228DA8 28864070 */  paddub     $16, $2, $0
.L00228DAC:
/* 128EAC 00228DAC D0A5080C */  jal        CharaChangeDraw__Fv
/* 128EB0 00228DB0 00000000 */   nop
/* 128EB4 00228DB4 DB01023C */  lui        $2, %hi(ItemVolumeStep)
/* 128EB8 00228DB8 10BC4424 */  addiu      $4, $2, %lo(ItemVolumeStep)
/* 128EBC 00228DBC 3C000524 */  addiu      $5, $0, 0x3C
/* 128EC0 00228DC0 B4D5080C */  jal        LoopStep__13CMenuItemStepFi
/* 128EC4 00228DC4 00000000 */   nop
/* 128EC8 00228DC8 2A000012 */  beqz       $16, .L00228E74
/* 128ECC 00228DCC 00000000 */   nop
/* 128ED0 00228DD0 80978487 */  lh         $4, -0x6880($gp)
/* 128ED4 00228DD4 38B4080C */  jal        MenuTextureReload__Fi
/* 128ED8 00228DD8 00000000 */   nop
/* 128EDC 00228DDC ACA9080C */  jal        DngActiveWeaponTextureCopy__Fv
/* 128EE0 00228DE0 00000000 */   nop
/* 128EE4 00228DE4 849780A7 */  sh         $0, -0x687C($gp)
/* 128EE8 00228DE8 DB01023C */  lui        $2, %hi(ItemVolumeStep)
/* 128EEC 00228DEC 10BC4424 */  addiu      $4, $2, %lo(ItemVolumeStep)
/* 128EF0 00228DF0 C8D5080C */  jal        CheckItemVolume__13CMenuItemStepFv
/* 128EF4 00228DF4 00000000 */   nop
/* 128EF8 00228DF8 CC01023C */  lui        $2, %hi(GamePad)
/* 128EFC 00228DFC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 128F00 00228E00 4CAE040C */  jal        MenuModeOff__8CGamePadFv
/* 128F04 00228E04 00000000 */   nop
/* 128F08 00228E08 CC01023C */  lui        $2, %hi(GamePad)
/* 128F0C 00228E0C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 128F10 00228E10 3CAE040C */  jal        AutoRepeatOff__8CGamePadFv
/* 128F14 00228E14 00000000 */   nop
/* 128F18 00228E18 80978587 */  lh         $5, -0x6880($gp)
/* 128F1C 00228E1C C701023C */  lui        $2, %hi(TexManager)
/* 128F20 00228E20 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 128F24 00228E24 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 128F28 00228E28 00000000 */   nop
/* 128F2C 00228E2C C701023C */  lui        $2, %hi(TexManager)
/* 128F30 00228E30 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 128F34 00228E34 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 128F38 00228E38 00000000 */   nop
/* 128F3C 00228E3C 2900023C */  lui        $2, %hi(_1368_2)
/* 128F40 00228E40 80424224 */  addiu      $2, $2, %lo(_1368_2)
/* 128F44 00228E44 5000A627 */  addiu      $6, $sp, 0x50
/* 128F48 00228E48 00004378 */  lq         $3, 0x0($2)
/* 128F4C 00228E4C 100042DC */  ld         $2, 0x10($2)
/* 128F50 00228E50 0000C37C */  sq         $3, 0x0($6)
/* 128F54 00228E54 1000C2FC */  sd         $2, 0x10($6)
/* 128F58 00228E58 80978287 */  lh         $2, -0x6880($gp)
/* 128F5C 00228E5C 5400A2AF */  sw         $2, 0x54($sp)
/* 128F60 00228E60 C701023C */  lui        $2, %hi(TexManager)
/* 128F64 00228E64 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 128F68 00228E68 FFFF0524 */  addiu      $5, $0, -0x1
/* 128F6C 00228E6C 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 128F70 00228E70 00000000 */   nop
.L00228E74:
/* 128F74 00228E74 28160072 */  paddub     $2, $16, $0
.L00228E78:
/* 128F78 00228E78 1000BF7B */  lq         $31, 0x10($sp)
/* 128F7C 00228E7C 0000B07B */  lq         $16, 0x0($sp)
/* 128F80 00228E80 7000BD27 */  addiu      $sp, $sp, 0x70
/* 128F84 00228E84 0800E003 */  jr         $31
/* 128F88 00228E88 00000000 */   nop
/* 128F8C 00228E8C 00000000 */  nop
