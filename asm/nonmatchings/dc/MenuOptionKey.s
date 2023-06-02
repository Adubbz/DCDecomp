.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuOptionKey__Fv
/* 11EAB0 0021E9B0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 11EAB4 0021E9B4 3000BF7F */  sq         $31, 0x30($sp)
/* 11EAB8 0021E9B8 2000B27F */  sq         $18, 0x20($sp)
/* 11EABC 0021E9BC 1000B17F */  sq         $17, 0x10($sp)
/* 11EAC0 0021E9C0 0000B07F */  sq         $16, 0x0($sp)
/* 11EAC4 0021E9C4 28860070 */  paddub     $16, $0, $0
/* 11EAC8 0021E9C8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EACC 0021E9CC 508A238C */  lw         $3, -0x75B0($at)
/* 11EAD0 0021E9D0 02000224 */  addiu      $2, $0, 0x2
/* 11EAD4 0021E9D4 69006210 */  beq        $3, $2, .L0021EB7C
/* 11EAD8 0021E9D8 00000000 */   nop
/* 11EADC 0021E9DC 01000224 */  addiu      $2, $0, 0x1
/* 11EAE0 0021E9E0 03006210 */  beq        $3, $2, .L0021E9F0
/* 11EAE4 0021E9E4 00000000 */   nop
/* 11EAE8 0021E9E8 71000010 */  b          .L0021EBB0
/* 11EAEC 0021E9EC 00000000 */   nop
.L0021E9F0:
/* 11EAF0 0021E9F0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EAF4 0021E9F4 C48A2284 */  lh         $2, -0x753C($at)
/* 11EAF8 0021E9F8 51004014 */  bnez       $2, .L0021EB40
/* 11EAFC 0021E9FC 00000000 */   nop
/* 11EB00 0021EA00 38FB040C */  jal        ReadBG__Fv
/* 11EB04 0021EA04 00000000 */   nop
/* 11EB08 0021EA08 8CFB040C */  jal        ReadBGSync__Fv
/* 11EB0C 0021EA0C 00000000 */   nop
/* 11EB10 0021EA10 4B004014 */  bnez       $2, .L0021EB40
/* 11EB14 0021EA14 00000000 */   nop
/* 11EB18 0021EA18 2900023C */  lui        $2, %hi(_2252)
/* 11EB1C 0021EA1C 203F4524 */  addiu      $5, $2, %lo(_2252)
/* 11EB20 0021EA20 4000A427 */  addiu      $4, $sp, 0x40
/* 11EB24 0021EA24 02000324 */  addiu      $3, $0, 0x2
.L0021EA28:
/* 11EB28 0021EA28 0000A278 */  lq         $2, 0x0($5)
/* 11EB2C 0021EA2C 1000A524 */  addiu      $5, $5, 0x10
/* 11EB30 0021EA30 FFFF6324 */  addiu      $3, $3, -0x1
/* 11EB34 0021EA34 0000827C */  sq         $2, 0x0($4)
/* 11EB38 0021EA38 10008424 */  addiu      $4, $4, 0x10
/* 11EB3C 0021EA3C FAFF601C */  bgtz       $3, .L0021EA28
/* 11EB40 0021EA40 00000000 */   nop
/* 11EB44 0021EA44 0000A2C4 */  lwc1       $f2, 0x0($5)
/* 11EB48 0021EA48 000082E4 */  swc1       $f2, 0x0($4)
/* 11EB4C 0021EA4C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EB50 0021EA50 C68A2284 */  lh         $2, -0x753A($at)
/* 11EB54 0021EA54 4400A2AF */  sw         $2, 0x44($sp)
/* 11EB58 0021EA58 5000A2AF */  sw         $2, 0x50($sp)
/* 11EB5C 0021EA5C 28260070 */  paddub     $4, $0, $0
/* 11EB60 0021EA60 18FB040C */  jal        GetReadBGFile__Fi
/* 11EB64 0021EA64 00000000 */   nop
/* 11EB68 0021EA68 288E4070 */  paddub     $17, $2, $0
/* 11EB6C 0021EA6C 8C00448C */  lw         $4, 0x8C($2)
/* 11EB70 0021EA70 2A00023C */  lui        $2, %hi(_2345)
/* 11EB74 0021EA74 00EB4524 */  addiu      $5, $2, %lo(_2345)
/* 11EB78 0021EA78 28360070 */  paddub     $6, $0, $0
/* 11EB7C 0021EA7C C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 11EB80 0021EA80 00000000 */   nop
/* 11EB84 0021EA84 4C00A2AF */  sw         $2, 0x4C($sp)
/* 11EB88 0021EA88 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EB8C 0021EA8C C68A2584 */  lh         $5, -0x753A($at)
/* 11EB90 0021EA90 C701023C */  lui        $2, %hi(TexManager)
/* 11EB94 0021EA94 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11EB98 0021EA98 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 11EB9C 0021EA9C 00000000 */   nop
/* 11EBA0 0021EAA0 C701023C */  lui        $2, %hi(TexManager)
/* 11EBA4 0021EAA4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11EBA8 0021EAA8 98CE040C */  jal        CleanUpTextureList__15CTextureManagerFv
/* 11EBAC 0021EAAC 00000000 */   nop
/* 11EBB0 0021EAB0 C701023C */  lui        $2, %hi(TexManager)
/* 11EBB4 0021EAB4 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11EBB8 0021EAB8 FFFF0524 */  addiu      $5, $0, -0x1
/* 11EBBC 0021EABC 4000A627 */  addiu      $6, $sp, 0x40
/* 11EBC0 0021EAC0 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 11EBC4 0021EAC4 00000000 */   nop
/* 11EBC8 0021EAC8 C701023C */  lui        $2, %hi(TexManager)
/* 11EBCC 0021EACC 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 11EBD0 0021EAD0 2A00023C */  lui        $2, %hi(_2346)
/* 11EBD4 0021EAD4 10EB4524 */  addiu      $5, $2, %lo(_2346)
/* 11EBD8 0021EAD8 FFFF0624 */  addiu      $6, $0, -0x1
/* 11EBDC 0021EADC B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 11EBE0 0021EAE0 00000000 */   nop
/* 11EBE4 0021EAE4 D89682AF */  sw         $2, -0x6928($gp)
/* 11EBE8 0021EAE8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EBEC 0021EAEC 408A228C */  lw         $2, -0x75C0($at)
/* 11EBF0 0021EAF0 10004014 */  bnez       $2, .L0021EB34
/* 11EBF4 0021EAF4 00000000 */   nop
/* 11EBF8 0021EAF8 8C00248E */  lw         $4, 0x8C($17)
/* 11EBFC 0021EAFC 2A00023C */  lui        $2, %hi(_2347)
/* 11EC00 0021EB00 18EB4524 */  addiu      $5, $2, %lo(_2347)
/* 11EC04 0021EB04 28360070 */  paddub     $6, $0, $0
/* 11EC08 0021EB08 C8FD040C */  jal        GetPackFile__FPUiPcPi
/* 11EC0C 0021EB0C 00000000 */   nop
/* 11EC10 0021EB10 28260070 */  paddub     $4, $0, $0
/* 11EC14 0021EB14 282E4070 */  paddub     $5, $2, $0
/* 11EC18 0021EB18 50B0080C */  jal        InitMenuMesSet__FiPs
/* 11EC1C 0021EB1C 00000000 */   nop
/* 11EC20 0021EB20 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 11EC24 0021EB24 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 11EC28 0021EB28 5E010524 */  addiu      $5, $0, 0x15E
/* 11EC2C 0021EB2C 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 11EC30 0021EB30 00000000 */   nop
.L0021EB34:
/* 11EC34 0021EB34 01000224 */  addiu      $2, $0, 0x1
/* 11EC38 0021EB38 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EC3C 0021EB3C C48A22A4 */  sh         $2, -0x753C($at)
.L0021EB40:
/* 11EC40 0021EB40 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EC44 0021EB44 C48A2284 */  lh         $2, -0x753C($at)
/* 11EC48 0021EB48 CF014010 */  beqz       $2, .L0021F288
/* 11EC4C 0021EB4C 00000000 */   nop
/* 11EC50 0021EB50 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EC54 0021EB54 548A228C */  lw         $2, -0x75AC($at)
/* 11EC58 0021EB58 0D004128 */  slti       $at, $2, 0xD
/* 11EC5C 0021EB5C CA012014 */  bnez       $at, .L0021F288
/* 11EC60 0021EB60 00000000 */   nop
/* 11EC64 0021EB64 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EC68 0021EB68 508A20AC */  sw         $0, -0x75B0($at)
/* 11EC6C 0021EB6C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EC70 0021EB70 548A20AC */  sw         $0, -0x75AC($at)
/* 11EC74 0021EB74 C4010010 */  b          .L0021F288
/* 11EC78 0021EB78 00000000 */   nop
.L0021EB7C:
/* 11EC7C 0021EB7C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EC80 0021EB80 548A228C */  lw         $2, -0x75AC($at)
/* 11EC84 0021EB84 19004128 */  slti       $at, $2, 0x19
/* 11EC88 0021EB88 BF012014 */  bnez       $at, .L0021F288
/* 11EC8C 0021EB8C 00000000 */   nop
/* 11EC90 0021EB90 E079080C */  jal        ExitMenuOption__Fv
/* 11EC94 0021EB94 00000000 */   nop
/* 11EC98 0021EB98 FFFF0224 */  addiu      $2, $0, -0x1
/* 11EC9C 0021EB9C DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* 11ECA0 0021EBA0 0C3A22AC */  sw         $2, (0x1DA3A0C & 0xFFFF)($at)
/* 11ECA4 0021EBA4 01001024 */  addiu      $16, $0, 0x1
/* 11ECA8 0021EBA8 B7010010 */  b          .L0021F288
/* 11ECAC 0021EBAC 00000000 */   nop
.L0021EBB0:
/* 11ECB0 0021EBB0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11ECB4 0021EBB4 4C8A318C */  lw         $17, -0x75B4($at)
/* 11ECB8 0021EBB8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11ECBC 0021EBBC 448A328C */  lw         $18, -0x75BC($at)
/* 11ECC0 0021EBC0 CC01023C */  lui        $2, %hi(GamePad)
/* 11ECC4 0021EBC4 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11ECC8 0021EBC8 0F000524 */  addiu      $5, $0, 0xF
/* 11ECCC 0021EBCC 1CAE040C */  jal        Down__8CGamePadFi
/* 11ECD0 0021EBD0 00000000 */   nop
/* 11ECD4 0021EBD4 19004010 */  beqz       $2, .L0021EC3C
/* 11ECD8 0021EBD8 00000000 */   nop
/* 11ECDC 0021EBDC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11ECE0 0021EBE0 4C8A238C */  lw         $3, -0x75B4($at)
/* 11ECE4 0021EBE4 0A000224 */  addiu      $2, $0, 0xA
/* 11ECE8 0021EBE8 1A006200 */  div        $0, $3, $2
/* 11ECEC 0021EBEC 02004014 */  bnez       $2, .L0021EBF8
/* 11ECF0 0021EBF0 00000000 */   nop
/* 11ECF4 0021EBF4 CD010000 */  break      0, 7
.L0021EBF8:
/* 11ECF8 0021EBF8 12100000 */  mflo       $2
/* 11ECFC 0021EBFC FFFF4224 */  addiu      $2, $2, -0x1
/* 11ED00 0021EC00 06004128 */  slti       $at, $2, 0x6
/* 11ED04 0021EC04 08002010 */  beqz       $at, .L0021EC28
/* 11ED08 0021EC08 00000000 */   nop
/* 11ED0C 0021EC0C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11ED10 0021EC10 4C8A228C */  lw         $2, -0x75B4($at)
/* 11ED14 0021EC14 3C004224 */  addiu      $2, $2, 0x3C
/* 11ED18 0021EC18 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11ED1C 0021EC1C 4C8A22AC */  sw         $2, -0x75B4($at)
/* 11ED20 0021EC20 06000010 */  b          .L0021EC3C
/* 11ED24 0021EC24 00000000 */   nop
.L0021EC28:
/* 11ED28 0021EC28 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11ED2C 0021EC2C 4C8A228C */  lw         $2, -0x75B4($at)
/* 11ED30 0021EC30 C4FF4224 */  addiu      $2, $2, -0x3C
/* 11ED34 0021EC34 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11ED38 0021EC38 4C8A22AC */  sw         $2, -0x75B4($at)
.L0021EC3C:
/* 11ED3C 0021EC3C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11ED40 0021EC40 448A238C */  lw         $3, -0x75BC($at)
/* 11ED44 0021EC44 01000224 */  addiu      $2, $0, 0x1
/* 11ED48 0021EC48 01016210 */  beq        $3, $2, .L0021F050
/* 11ED4C 0021EC4C 00000000 */   nop
/* 11ED50 0021EC50 03006010 */  beqz       $3, .L0021EC60
/* 11ED54 0021EC54 00000000 */   nop
/* 11ED58 0021EC58 5B010010 */  b          .L0021F1C8
/* 11ED5C 0021EC5C 00000000 */   nop
.L0021EC60:
/* 11ED60 0021EC60 CC01023C */  lui        $2, %hi(GamePad)
/* 11ED64 0021EC64 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11ED68 0021EC68 00400524 */  addiu      $5, $0, 0x4000
/* 11ED6C 0021EC6C 1CAE040C */  jal        Down__8CGamePadFi
/* 11ED70 0021EC70 00000000 */   nop
/* 11ED74 0021EC74 1C004010 */  beqz       $2, .L0021ECE8
/* 11ED78 0021EC78 00000000 */   nop
/* 11ED7C 0021EC7C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11ED80 0021EC80 4C8A238C */  lw         $3, -0x75B4($at)
/* 11ED84 0021EC84 0A000224 */  addiu      $2, $0, 0xA
/* 11ED88 0021EC88 1A006200 */  div        $0, $3, $2
/* 11ED8C 0021EC8C 02004014 */  bnez       $2, .L0021EC98
/* 11ED90 0021EC90 00000000 */   nop
/* 11ED94 0021EC94 CD010000 */  break      0, 7
.L0021EC98:
/* 11ED98 0021EC98 12100000 */  mflo       $2
/* 11ED9C 0021EC9C FFFF4324 */  addiu      $3, $2, -0x1
/* 11EDA0 0021ECA0 0B000224 */  addiu      $2, $0, 0xB
/* 11EDA4 0021ECA4 06006210 */  beq        $3, $2, .L0021ECC0
/* 11EDA8 0021ECA8 00000000 */   nop
/* 11EDAC 0021ECAC 05000224 */  addiu      $2, $0, 0x5
/* 11EDB0 0021ECB0 03006210 */  beq        $3, $2, .L0021ECC0
/* 11EDB4 0021ECB4 00000000 */   nop
/* 11EDB8 0021ECB8 06000010 */  b          .L0021ECD4
/* 11EDBC 0021ECBC 00000000 */   nop
.L0021ECC0:
/* 11EDC0 0021ECC0 01000224 */  addiu      $2, $0, 0x1
/* 11EDC4 0021ECC4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EDC8 0021ECC8 448A22AC */  sw         $2, -0x75BC($at)
/* 11EDCC 0021ECCC 06000010 */  b          .L0021ECE8
/* 11EDD0 0021ECD0 00000000 */   nop
.L0021ECD4:
/* 11EDD4 0021ECD4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EDD8 0021ECD8 4C8A228C */  lw         $2, -0x75B4($at)
/* 11EDDC 0021ECDC 0A004224 */  addiu      $2, $2, 0xA
/* 11EDE0 0021ECE0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EDE4 0021ECE4 4C8A22AC */  sw         $2, -0x75B4($at)
.L0021ECE8:
/* 11EDE8 0021ECE8 CC01023C */  lui        $2, %hi(GamePad)
/* 11EDEC 0021ECEC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11EDF0 0021ECF0 00100524 */  addiu      $5, $0, 0x1000
/* 11EDF4 0021ECF4 1CAE040C */  jal        Down__8CGamePadFi
/* 11EDF8 0021ECF8 00000000 */   nop
/* 11EDFC 0021ECFC 1B004010 */  beqz       $2, .L0021ED6C
/* 11EE00 0021ED00 00000000 */   nop
/* 11EE04 0021ED04 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EE08 0021ED08 4C8A238C */  lw         $3, -0x75B4($at)
/* 11EE0C 0021ED0C 0A000224 */  addiu      $2, $0, 0xA
/* 11EE10 0021ED10 1A006200 */  div        $0, $3, $2
/* 11EE14 0021ED14 02004014 */  bnez       $2, .L0021ED20
/* 11EE18 0021ED18 00000000 */   nop
/* 11EE1C 0021ED1C CD010000 */  break      0, 7
.L0021ED20:
/* 11EE20 0021ED20 12100000 */  mflo       $2
/* 11EE24 0021ED24 FFFF4324 */  addiu      $3, $2, -0x1
/* 11EE28 0021ED28 06000224 */  addiu      $2, $0, 0x6
/* 11EE2C 0021ED2C 05006210 */  beq        $3, $2, .L0021ED44
/* 11EE30 0021ED30 00000000 */   nop
/* 11EE34 0021ED34 03006010 */  beqz       $3, .L0021ED44
/* 11EE38 0021ED38 00000000 */   nop
/* 11EE3C 0021ED3C 06000010 */  b          .L0021ED58
/* 11EE40 0021ED40 00000000 */   nop
.L0021ED44:
/* 11EE44 0021ED44 01000224 */  addiu      $2, $0, 0x1
/* 11EE48 0021ED48 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EE4C 0021ED4C 448A22AC */  sw         $2, -0x75BC($at)
/* 11EE50 0021ED50 06000010 */  b          .L0021ED6C
/* 11EE54 0021ED54 00000000 */   nop
.L0021ED58:
/* 11EE58 0021ED58 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EE5C 0021ED5C 4C8A228C */  lw         $2, -0x75B4($at)
/* 11EE60 0021ED60 F6FF4224 */  addiu      $2, $2, -0xA
/* 11EE64 0021ED64 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EE68 0021ED68 4C8A22AC */  sw         $2, -0x75B4($at)
.L0021ED6C:
/* 11EE6C 0021ED6C CC01023C */  lui        $2, %hi(GamePad)
/* 11EE70 0021ED70 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11EE74 0021ED74 00200524 */  addiu      $5, $0, 0x2000
/* 11EE78 0021ED78 1CAE040C */  jal        Down__8CGamePadFi
/* 11EE7C 0021ED7C 00000000 */   nop
/* 11EE80 0021ED80 45004010 */  beqz       $2, .L0021EE98
/* 11EE84 0021ED84 00000000 */   nop
/* 11EE88 0021ED88 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EE8C 0021ED8C 4C8A228C */  lw         $2, -0x75B4($at)
/* 11EE90 0021ED90 01004224 */  addiu      $2, $2, 0x1
/* 11EE94 0021ED94 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EE98 0021ED98 4C8A22AC */  sw         $2, -0x75B4($at)
/* 11EE9C 0021ED9C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EEA0 0021EDA0 4C8A258C */  lw         $5, -0x75B4($at)
/* 11EEA4 0021EDA4 0A000224 */  addiu      $2, $0, 0xA
/* 11EEA8 0021EDA8 1A00A200 */  div        $0, $5, $2
/* 11EEAC 0021EDAC 02004014 */  bnez       $2, .L0021EDB8
/* 11EEB0 0021EDB0 00000000 */   nop
/* 11EEB4 0021EDB4 CD010000 */  break      0, 7
.L0021EDB8:
/* 11EEB8 0021EDB8 12100000 */  mflo       $2
/* 11EEBC 0021EDBC FFFF4324 */  addiu      $3, $2, -0x1
/* 11EEC0 0021EDC0 06000224 */  addiu      $2, $0, 0x6
/* 11EEC4 0021EDC4 03006210 */  beq        $3, $2, .L0021EDD4
/* 11EEC8 0021EDC8 00000000 */   nop
/* 11EECC 0021EDCC 10000010 */  b          .L0021EE10
/* 11EED0 0021EDD0 00000000 */   nop
.L0021EDD4:
/* 11EED4 0021EDD4 0A000224 */  addiu      $2, $0, 0xA
/* 11EED8 0021EDD8 1A00A200 */  div        $0, $5, $2
/* 11EEDC 0021EDDC 00000000 */  nop
/* 11EEE0 0021EDE0 00000000 */  nop
/* 11EEE4 0021EDE4 10180000 */  mfhi       $3
/* 11EEE8 0021EDE8 04000224 */  addiu      $2, $0, 0x4
/* 11EEEC 0021EDEC 2A006214 */  bne        $3, $2, .L0021EE98
/* 11EEF0 0021EDF0 00000000 */   nop
/* 11EEF4 0021EDF4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EEF8 0021EDF8 4C8A228C */  lw         $2, -0x75B4($at)
/* 11EEFC 0021EDFC C0FF4224 */  addiu      $2, $2, -0x40
/* 11EF00 0021EE00 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EF04 0021EE04 4C8A22AC */  sw         $2, -0x75B4($at)
/* 11EF08 0021EE08 23000010 */  b          .L0021EE98
/* 11EF0C 0021EE0C 00000000 */   nop
.L0021EE10:
/* 11EF10 0021EE10 0A000424 */  addiu      $4, $0, 0xA
/* 11EF14 0021EE14 1A00A400 */  div        $0, $5, $4
/* 11EF18 0021EE18 00000000 */  nop
/* 11EF1C 0021EE1C 00000000 */  nop
/* 11EF20 0021EE20 10180000 */  mfhi       $3
/* 11EF24 0021EE24 02000224 */  addiu      $2, $0, 0x2
/* 11EF28 0021EE28 1B006214 */  bne        $3, $2, .L0021EE98
/* 11EF2C 0021EE2C 00000000 */   nop
/* 11EF30 0021EE30 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EF34 0021EE34 4C8A228C */  lw         $2, -0x75B4($at)
/* 11EF38 0021EE38 FEFF4224 */  addiu      $2, $2, -0x2
/* 11EF3C 0021EE3C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EF40 0021EE40 4C8A22AC */  sw         $2, -0x75B4($at)
/* 11EF44 0021EE44 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EF48 0021EE48 4C8A228C */  lw         $2, -0x75B4($at)
/* 11EF4C 0021EE4C 3C004224 */  addiu      $2, $2, 0x3C
/* 11EF50 0021EE50 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EF54 0021EE54 4C8A22AC */  sw         $2, -0x75B4($at)
/* 11EF58 0021EE58 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EF5C 0021EE5C 4C8A228C */  lw         $2, -0x75B4($at)
/* 11EF60 0021EE60 1A004400 */  div        $0, $2, $4
/* 11EF64 0021EE64 02008014 */  bnez       $4, .L0021EE70
/* 11EF68 0021EE68 00000000 */   nop
/* 11EF6C 0021EE6C CD010000 */  break      0, 7
.L0021EE70:
/* 11EF70 0021EE70 12100000 */  mflo       $2
/* 11EF74 0021EE74 FFFF4224 */  addiu      $2, $2, -0x1
/* 11EF78 0021EE78 0C004228 */  slti       $2, $2, 0xC
/* 11EF7C 0021EE7C 06004014 */  bnez       $2, .L0021EE98
/* 11EF80 0021EE80 00000000 */   nop
/* 11EF84 0021EE84 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EF88 0021EE88 4C8A228C */  lw         $2, -0x75B4($at)
/* 11EF8C 0021EE8C 88FF4224 */  addiu      $2, $2, -0x78
/* 11EF90 0021EE90 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EF94 0021EE94 4C8A22AC */  sw         $2, -0x75B4($at)
.L0021EE98:
/* 11EF98 0021EE98 CC01023C */  lui        $2, %hi(GamePad)
/* 11EF9C 0021EE9C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11EFA0 0021EEA0 00800534 */  ori        $5, $0, 0x8000
/* 11EFA4 0021EEA4 1CAE040C */  jal        Down__8CGamePadFi
/* 11EFA8 0021EEA8 00000000 */   nop
/* 11EFAC 0021EEAC 32004010 */  beqz       $2, .L0021EF78
/* 11EFB0 0021EEB0 00000000 */   nop
/* 11EFB4 0021EEB4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EFB8 0021EEB8 4C8A248C */  lw         $4, -0x75B4($at)
/* 11EFBC 0021EEBC 0A000324 */  addiu      $3, $0, 0xA
/* 11EFC0 0021EEC0 1A008300 */  div        $0, $4, $3
/* 11EFC4 0021EEC4 00000000 */  nop
/* 11EFC8 0021EEC8 00000000 */  nop
/* 11EFCC 0021EECC 10100000 */  mfhi       $2
/* 11EFD0 0021EED0 06004010 */  beqz       $2, .L0021EEEC
/* 11EFD4 0021EED4 00000000 */   nop
/* 11EFD8 0021EED8 FFFF8224 */  addiu      $2, $4, -0x1
/* 11EFDC 0021EEDC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11EFE0 0021EEE0 4C8A22AC */  sw         $2, -0x75B4($at)
/* 11EFE4 0021EEE4 24000010 */  b          .L0021EF78
/* 11EFE8 0021EEE8 00000000 */   nop
.L0021EEEC:
/* 11EFEC 0021EEEC 1A008300 */  div        $0, $4, $3
/* 11EFF0 0021EEF0 02006014 */  bnez       $3, .L0021EEFC
/* 11EFF4 0021EEF4 00000000 */   nop
/* 11EFF8 0021EEF8 CD010000 */  break      0, 7
.L0021EEFC:
/* 11EFFC 0021EEFC 12100000 */  mflo       $2
/* 11F000 0021EF00 FFFF4224 */  addiu      $2, $2, -0x1
/* 11F004 0021EF04 03004010 */  beqz       $2, .L0021EF14
/* 11F008 0021EF08 00000000 */   nop
/* 11F00C 0021EF0C 06000010 */  b          .L0021EF28
/* 11F010 0021EF10 00000000 */   nop
.L0021EF14:
/* 11F014 0021EF14 49000224 */  addiu      $2, $0, 0x49
/* 11F018 0021EF18 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F01C 0021EF1C 4C8A22AC */  sw         $2, -0x75B4($at)
/* 11F020 0021EF20 15000010 */  b          .L0021EF78
/* 11F024 0021EF24 00000000 */   nop
.L0021EF28:
/* 11F028 0021EF28 06004128 */  slti       $at, $2, 0x6
/* 11F02C 0021EF2C 08002010 */  beqz       $at, .L0021EF50
/* 11F030 0021EF30 00000000 */   nop
/* 11F034 0021EF34 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F038 0021EF38 4C8A228C */  lw         $2, -0x75B4($at)
/* 11F03C 0021EF3C 3C004224 */  addiu      $2, $2, 0x3C
/* 11F040 0021EF40 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F044 0021EF44 4C8A22AC */  sw         $2, -0x75B4($at)
/* 11F048 0021EF48 06000010 */  b          .L0021EF64
/* 11F04C 0021EF4C 00000000 */   nop
.L0021EF50:
/* 11F050 0021EF50 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F054 0021EF54 4C8A228C */  lw         $2, -0x75B4($at)
/* 11F058 0021EF58 C4FF4224 */  addiu      $2, $2, -0x3C
/* 11F05C 0021EF5C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F060 0021EF60 4C8A22AC */  sw         $2, -0x75B4($at)
.L0021EF64:
/* 11F064 0021EF64 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F068 0021EF68 4C8A228C */  lw         $2, -0x75B4($at)
/* 11F06C 0021EF6C 01004224 */  addiu      $2, $2, 0x1
/* 11F070 0021EF70 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F074 0021EF74 4C8A22AC */  sw         $2, -0x75B4($at)
.L0021EF78:
/* 11F078 0021EF78 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F07C 0021EF7C 4C8A248C */  lw         $4, -0x75B4($at)
/* 11F080 0021EF80 0A000224 */  addiu      $2, $0, 0xA
/* 11F084 0021EF84 1A008200 */  div        $0, $4, $2
/* 11F088 0021EF88 02004014 */  bnez       $2, .L0021EF94
/* 11F08C 0021EF8C 00000000 */   nop
/* 11F090 0021EF90 CD010000 */  break      0, 7
.L0021EF94:
/* 11F094 0021EF94 12100000 */  mflo       $2
/* 11F098 0021EF98 FFFF4324 */  addiu      $3, $2, -0x1
/* 11F09C 0021EF9C 06000224 */  addiu      $2, $0, 0x6
/* 11F0A0 0021EFA0 0E006210 */  beq        $3, $2, .L0021EFDC
/* 11F0A4 0021EFA4 00000000 */   nop
/* 11F0A8 0021EFA8 0A000224 */  addiu      $2, $0, 0xA
/* 11F0AC 0021EFAC 1A008200 */  div        $0, $4, $2
/* 11F0B0 0021EFB0 00000000 */  nop
/* 11F0B4 0021EFB4 00000000 */  nop
/* 11F0B8 0021EFB8 10100000 */  mfhi       $2
/* 11F0BC 0021EFBC 02004228 */  slti       $2, $2, 0x2
/* 11F0C0 0021EFC0 06004014 */  bnez       $2, .L0021EFDC
/* 11F0C4 0021EFC4 00000000 */   nop
/* 11F0C8 0021EFC8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F0CC 0021EFCC 4C8A228C */  lw         $2, -0x75B4($at)
/* 11F0D0 0021EFD0 FFFF4224 */  addiu      $2, $2, -0x1
/* 11F0D4 0021EFD4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F0D8 0021EFD8 4C8A22AC */  sw         $2, -0x75B4($at)
.L0021EFDC:
/* 11F0DC 0021EFDC CC01023C */  lui        $2, %hi(GamePad)
/* 11F0E0 0021EFE0 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11F0E4 0021EFE4 40000524 */  addiu      $5, $0, 0x40
/* 11F0E8 0021EFE8 1CAE040C */  jal        Down__8CGamePadFi
/* 11F0EC 0021EFEC 00000000 */   nop
/* 11F0F0 0021EFF0 75004010 */  beqz       $2, .L0021F1C8
/* 11F0F4 0021EFF4 00000000 */   nop
/* 11F0F8 0021EFF8 01000424 */  addiu      $4, $0, 0x1
/* 11F0FC 0021EFFC BCB3080C */  jal        ComMenuSePlay__Fi
/* 11F100 0021F000 00000000 */   nop
/* 11F104 0021F004 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F108 0021F008 4C8A238C */  lw         $3, -0x75B4($at)
/* 11F10C 0021F00C 0A000224 */  addiu      $2, $0, 0xA
/* 11F110 0021F010 1A006200 */  div        $0, $3, $2
/* 11F114 0021F014 00000000 */  nop
/* 11F118 0021F018 00000000 */  nop
/* 11F11C 0021F01C 10200000 */  mfhi       $4
/* 11F120 0021F020 1A006200 */  div        $0, $3, $2
/* 11F124 0021F024 02004014 */  bnez       $2, .L0021F030
/* 11F128 0021F028 00000000 */   nop
/* 11F12C 0021F02C CD010000 */  break      0, 7
.L0021F030:
/* 11F130 0021F030 12100000 */  mflo       $2
/* 11F134 0021F034 80180200 */  sll        $3, $2, 2
/* 11F138 0021F038 DB01023C */  lui        $2, %hi(D_1DA8A60)
/* 11F13C 0021F03C 608A4224 */  addiu      $2, $2, %lo(D_1DA8A60)
/* 11F140 0021F040 21104300 */  addu       $2, $2, $3
/* 11F144 0021F044 000044AC */  sw         $4, 0x0($2)
/* 11F148 0021F048 5F000010 */  b          .L0021F1C8
/* 11F14C 0021F04C 00000000 */   nop
.L0021F050:
/* 11F150 0021F050 CC01023C */  lui        $2, %hi(GamePad)
/* 11F154 0021F054 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11F158 0021F058 00400524 */  addiu      $5, $0, 0x4000
/* 11F15C 0021F05C 1CAE040C */  jal        Down__8CGamePadFi
/* 11F160 0021F060 00000000 */   nop
/* 11F164 0021F064 17004010 */  beqz       $2, .L0021F0C4
/* 11F168 0021F068 00000000 */   nop
/* 11F16C 0021F06C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F170 0021F070 448A20AC */  sw         $0, -0x75BC($at)
/* 11F174 0021F074 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F178 0021F078 4C8A238C */  lw         $3, -0x75B4($at)
/* 11F17C 0021F07C 0A000224 */  addiu      $2, $0, 0xA
/* 11F180 0021F080 1A006200 */  div        $0, $3, $2
/* 11F184 0021F084 02004014 */  bnez       $2, .L0021F090
/* 11F188 0021F088 00000000 */   nop
/* 11F18C 0021F08C CD010000 */  break      0, 7
.L0021F090:
/* 11F190 0021F090 12100000 */  mflo       $2
/* 11F194 0021F094 FFFF4224 */  addiu      $2, $2, -0x1
/* 11F198 0021F098 06004128 */  slti       $at, $2, 0x6
/* 11F19C 0021F09C 06002010 */  beqz       $at, .L0021F0B8
/* 11F1A0 0021F0A0 00000000 */   nop
/* 11F1A4 0021F0A4 0A000224 */  addiu      $2, $0, 0xA
/* 11F1A8 0021F0A8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F1AC 0021F0AC 4C8A22AC */  sw         $2, -0x75B4($at)
/* 11F1B0 0021F0B0 04000010 */  b          .L0021F0C4
/* 11F1B4 0021F0B4 00000000 */   nop
.L0021F0B8:
/* 11F1B8 0021F0B8 3C000224 */  addiu      $2, $0, 0x3C
/* 11F1BC 0021F0BC DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F1C0 0021F0C0 4C8A22AC */  sw         $2, -0x75B4($at)
.L0021F0C4:
/* 11F1C4 0021F0C4 CC01023C */  lui        $2, %hi(GamePad)
/* 11F1C8 0021F0C8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11F1CC 0021F0CC 00100524 */  addiu      $5, $0, 0x1000
/* 11F1D0 0021F0D0 1CAE040C */  jal        Down__8CGamePadFi
/* 11F1D4 0021F0D4 00000000 */   nop
/* 11F1D8 0021F0D8 17004010 */  beqz       $2, .L0021F138
/* 11F1DC 0021F0DC 00000000 */   nop
/* 11F1E0 0021F0E0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F1E4 0021F0E4 448A20AC */  sw         $0, -0x75BC($at)
/* 11F1E8 0021F0E8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F1EC 0021F0EC 4C8A238C */  lw         $3, -0x75B4($at)
/* 11F1F0 0021F0F0 0A000224 */  addiu      $2, $0, 0xA
/* 11F1F4 0021F0F4 1A006200 */  div        $0, $3, $2
/* 11F1F8 0021F0F8 02004014 */  bnez       $2, .L0021F104
/* 11F1FC 0021F0FC 00000000 */   nop
/* 11F200 0021F100 CD010000 */  break      0, 7
.L0021F104:
/* 11F204 0021F104 12100000 */  mflo       $2
/* 11F208 0021F108 FFFF4224 */  addiu      $2, $2, -0x1
/* 11F20C 0021F10C 06004128 */  slti       $at, $2, 0x6
/* 11F210 0021F110 06002010 */  beqz       $at, .L0021F12C
/* 11F214 0021F114 00000000 */   nop
/* 11F218 0021F118 3C000224 */  addiu      $2, $0, 0x3C
/* 11F21C 0021F11C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F220 0021F120 4C8A22AC */  sw         $2, -0x75B4($at)
/* 11F224 0021F124 04000010 */  b          .L0021F138
/* 11F228 0021F128 00000000 */   nop
.L0021F12C:
/* 11F22C 0021F12C 78000224 */  addiu      $2, $0, 0x78
/* 11F230 0021F130 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F234 0021F134 4C8A22AC */  sw         $2, -0x75B4($at)
.L0021F138:
/* 11F238 0021F138 CC01023C */  lui        $2, %hi(GamePad)
/* 11F23C 0021F13C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11F240 0021F140 40000524 */  addiu      $5, $0, 0x40
/* 11F244 0021F144 1CAE040C */  jal        Down__8CGamePadFi
/* 11F248 0021F148 00000000 */   nop
/* 11F24C 0021F14C 0A004010 */  beqz       $2, .L0021F178
/* 11F250 0021F150 00000000 */   nop
/* 11F254 0021F154 02000424 */  addiu      $4, $0, 0x2
/* 11F258 0021F158 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F25C 0021F15C 508A24AC */  sw         $4, -0x75B0($at)
/* 11F260 0021F160 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F264 0021F164 548A20AC */  sw         $0, -0x75AC($at)
/* 11F268 0021F168 BCB3080C */  jal        ComMenuSePlay__Fi
/* 11F26C 0021F16C 00000000 */   nop
/* 11F270 0021F170 15000010 */  b          .L0021F1C8
/* 11F274 0021F174 00000000 */   nop
.L0021F178:
/* 11F278 0021F178 CC01023C */  lui        $2, %hi(GamePad)
/* 11F27C 0021F17C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11F280 0021F180 80000524 */  addiu      $5, $0, 0x80
/* 11F284 0021F184 1CAE040C */  jal        Down__8CGamePadFi
/* 11F288 0021F188 00000000 */   nop
/* 11F28C 0021F18C 05004010 */  beqz       $2, .L0021F1A4
/* 11F290 0021F190 00000000 */   nop
/* 11F294 0021F194 447A080C */  jal        InitOptionFlag__Fv
/* 11F298 0021F198 00000000 */   nop
/* 11F29C 0021F19C 0A000010 */  b          .L0021F1C8
/* 11F2A0 0021F1A0 00000000 */   nop
.L0021F1A4:
/* 11F2A4 0021F1A4 CC01023C */  lui        $2, %hi(GamePad)
/* 11F2A8 0021F1A8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11F2AC 0021F1AC 10000524 */  addiu      $5, $0, 0x10
/* 11F2B0 0021F1B0 1CAE040C */  jal        Down__8CGamePadFi
/* 11F2B4 0021F1B4 00000000 */   nop
/* 11F2B8 0021F1B8 03004010 */  beqz       $2, .L0021F1C8
/* 11F2BC 0021F1BC 00000000 */   nop
/* 11F2C0 0021F1C0 587A080C */  jal        PrevOptionSetFunc__Fv
/* 11F2C4 0021F1C4 00000000 */   nop
.L0021F1C8:
/* 11F2C8 0021F1C8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F2CC 0021F1CC 4C8A228C */  lw         $2, -0x75B4($at)
/* 11F2D0 0021F1D0 05002216 */  bne        $17, $2, .L0021F1E8
/* 11F2D4 0021F1D4 00000000 */   nop
/* 11F2D8 0021F1D8 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F2DC 0021F1DC 448A228C */  lw         $2, -0x75BC($at)
/* 11F2E0 0021F1E0 04004212 */  beq        $18, $2, .L0021F1F4
/* 11F2E4 0021F1E4 00000000 */   nop
.L0021F1E8:
/* 11F2E8 0021F1E8 28260070 */  paddub     $4, $0, $0
/* 11F2EC 0021F1EC BCB3080C */  jal        ComMenuSePlay__Fi
/* 11F2F0 0021F1F0 00000000 */   nop
.L0021F1F4:
/* 11F2F4 0021F1F4 CC01023C */  lui        $2, %hi(GamePad)
/* 11F2F8 0021F1F8 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 11F2FC 0021F1FC 20000524 */  addiu      $5, $0, 0x20
/* 11F300 0021F200 1CAE040C */  jal        Down__8CGamePadFi
/* 11F304 0021F204 00000000 */   nop
/* 11F308 0021F208 08004010 */  beqz       $2, .L0021F22C
/* 11F30C 0021F20C 00000000 */   nop
/* 11F310 0021F210 02000424 */  addiu      $4, $0, 0x2
/* 11F314 0021F214 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F318 0021F218 508A24AC */  sw         $4, -0x75B0($at)
/* 11F31C 0021F21C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F320 0021F220 548A20AC */  sw         $0, -0x75AC($at)
/* 11F324 0021F224 BCB3080C */  jal        ComMenuSePlay__Fi
/* 11F328 0021F228 00000000 */   nop
.L0021F22C:
/* 11F32C 0021F22C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F330 0021F230 4C8A238C */  lw         $3, -0x75B4($at)
/* 11F334 0021F234 0A000224 */  addiu      $2, $0, 0xA
/* 11F338 0021F238 1A006200 */  div        $0, $3, $2
/* 11F33C 0021F23C 02004014 */  bnez       $2, .L0021F248
/* 11F340 0021F240 00000000 */   nop
/* 11F344 0021F244 CD010000 */  break      0, 7
.L0021F248:
/* 11F348 0021F248 12100000 */  mflo       $2
/* 11F34C 0021F24C 5D014524 */  addiu      $5, $2, 0x15D
/* 11F350 0021F250 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11F354 0021F254 448A238C */  lw         $3, -0x75BC($at)
/* 11F358 0021F258 01000224 */  addiu      $2, $0, 0x1
/* 11F35C 0021F25C 02006214 */  bne        $3, $2, .L0021F268
/* 11F360 0021F260 00000000 */   nop
/* 11F364 0021F264 71010524 */  addiu      $5, $0, 0x171
.L0021F268:
/* 11F368 0021F268 DA01013C */  lui        $at, (0x1DA3A0C >> 16)
/* 11F36C 0021F26C 0C3A228C */  lw         $2, (0x1DA3A0C & 0xFFFF)($at)
/* 11F370 0021F270 05004510 */  beq        $2, $5, .L0021F288
/* 11F374 0021F274 00000000 */   nop
/* 11F378 0021F278 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 11F37C 0021F27C 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 11F380 0021F280 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 11F384 0021F284 00000000 */   nop
.L0021F288:
/* 11F388 0021F288 28160072 */  paddub     $2, $16, $0
/* 11F38C 0021F28C 3000BF7B */  lq         $31, 0x30($sp)
/* 11F390 0021F290 2000B27B */  lq         $18, 0x20($sp)
/* 11F394 0021F294 1000B17B */  lq         $17, 0x10($sp)
/* 11F398 0021F298 0000B07B */  lq         $16, 0x0($sp)
/* 11F39C 0021F29C 7000BD27 */  addiu      $sp, $sp, 0x70
/* 11F3A0 0021F2A0 0800E003 */  jr         $31
/* 11F3A4 0021F2A4 00000000 */   nop
/* 11F3A8 0021F2A8 00000000 */  nop
/* 11F3AC 0021F2AC 00000000 */  nop
