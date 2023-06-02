.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HealingWater__Fv
/* AFA80 001AF980 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* AFA84 001AF984 1000BF7F */  sq         $31, 0x10($sp)
/* AFA88 001AF988 0000B07F */  sq         $16, 0x0($sp)
/* AFA8C 001AF98C B8BD060C */  jal        CheckHealZone__Fv
/* AFA90 001AF990 00000000 */   nop
/* AFA94 001AF994 05004014 */  bnez       $2, .L001AF9AC
/* AFA98 001AF998 00000000 */   nop
/* AFA9C 001AF99C ECBC060C */  jal        CheckHealingWater__Fv
/* AFAA0 001AF9A0 00000000 */   nop
/* AFAA4 001AF9A4 47004010 */  beqz       $2, .L001AFAC4
/* AFAA8 001AF9A8 00000000 */   nop
.L001AF9AC:
/* AFAAC 001AF9AC 9893838F */  lw         $3, -0x6C68($gp)
/* AFAB0 001AF9B0 1400601C */  bgtz       $3, .L001AFA04
/* AFAB4 001AF9B4 00000000 */   nop
/* AFAB8 001AF9B8 789C848F */  lw         $4, -0x6388($gp)
/* AFABC 001AF9BC 04009080 */  lb         $16, 0x4($4)
/* AFAC0 001AF9C0 7F43023C */  lui        $2, (0x437F0000 >> 16)
/* AFAC4 001AF9C4 00608244 */  mtc1       $2, $f12
/* AFAC8 001AF9C8 282E0072 */  paddub     $5, $16, $0
/* AFACC 001AF9CC FF000624 */  addiu      $6, $0, 0xFF
/* AFAD0 001AF9D0 44F9060C */  jal        AddDrink__11CUserStatusFisf
/* AFAD4 001AF9D4 00000000 */   nop
/* AFAD8 001AF9D8 7F43023C */  lui        $2, (0x437F0000 >> 16)
/* AFADC 001AF9DC 00608244 */  mtc1       $2, $f12
/* AFAE0 001AF9E0 789C848F */  lw         $4, -0x6388($gp)
/* AFAE4 001AF9E4 282E0072 */  paddub     $5, $16, $0
/* AFAE8 001AF9E8 FF000624 */  addiu      $6, $0, 0xFF
/* AFAEC 001AF9EC C4F9060C */  jal        AddNowLife__11CUserStatusFisf
/* AFAF0 001AF9F0 00000000 */   nop
/* AFAF4 001AF9F4 0A000324 */  addiu      $3, $0, 0xA
/* AFAF8 001AF9F8 989383AF */  sw         $3, -0x6C68($gp)
/* AFAFC 001AF9FC 03000010 */  b          .L001AFA0C
/* AFB00 001AFA00 00000000 */   nop
.L001AFA04:
/* AFB04 001AFA04 FFFF6324 */  addiu      $3, $3, -0x1
/* AFB08 001AFA08 989383AF */  sw         $3, -0x6C68($gp)
.L001AFA0C:
/* AFB0C 001AFA0C EC01013C */  lui        $at, (0x1EC5050 >> 16)
/* AFB10 001AFA10 5050238C */  lw         $3, (0x1EC5050 & 0xFFFF)($at)
/* AFB14 001AFA14 1C006014 */  bnez       $3, .L001AFA88
/* AFB18 001AFA18 00000000 */   nop
/* AFB1C 001AFA1C 789C848F */  lw         $4, -0x6388($gp)
/* AFB20 001AFA20 04008380 */  lb         $3, 0x4($4)
/* AFB24 001AFA24 40180300 */  sll        $3, $3, 1
/* AFB28 001AFA28 21186400 */  addu       $3, $3, $4
/* AFB2C 001AFA2C 06006484 */  lh         $4, 0x6($3)
/* AFB30 001AFA30 12006384 */  lh         $3, 0x12($3)
/* AFB34 001AFA34 23006410 */  beq        $3, $4, .L001AFAC4
/* AFB38 001AFA38 00000000 */   nop
/* AFB3C 001AFA3C 2000A427 */  addiu      $4, $sp, 0x20
/* AFB40 001AFA40 EA01023C */  lui        $2, %hi(D_1EA1D30)
/* AFB44 001AFA44 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* AFB48 001AFA48 0C86040C */  jal        sceVu0CopyVector
/* AFB4C 001AFA4C 00000000 */   nop
/* AFB50 001AFA50 EC01023C */  lui        $2, %hi(D_1EC4B40)
/* AFB54 001AFA54 404B4424 */  addiu      $4, $2, %lo(D_1EC4B40)
/* AFB58 001AFA58 2000A527 */  addiu      $5, $sp, 0x20
/* AFB5C 001AFA5C 40CA060C */  jal        Set__11CHealEffectFPf
/* AFB60 001AFA60 00000000 */   nop
/* AFB64 001AFA64 B8010424 */  addiu      $4, $0, 0x1B8
/* AFB68 001AFA68 FFFF0524 */  addiu      $5, $0, -0x1
/* AFB6C 001AFA6C 28360070 */  paddub     $6, $0, $0
/* AFB70 001AFA70 AC69050C */  jal        SndSePlay__Fiii
/* AFB74 001AFA74 00000000 */   nop
/* AFB78 001AFA78 01000324 */  addiu      $3, $0, 0x1
/* AFB7C 001AFA7C 9C9383AF */  sw         $3, -0x6C64($gp)
/* AFB80 001AFA80 10000010 */  b          .L001AFAC4
/* AFB84 001AFA84 00000000 */   nop
.L001AFA88:
/* AFB88 001AFA88 9C93838F */  lw         $3, -0x6C64($gp)
/* AFB8C 001AFA8C 0D006010 */  beqz       $3, .L001AFAC4
/* AFB90 001AFA90 00000000 */   nop
/* AFB94 001AFA94 7042023C */  lui        $2, (0x42700000 >> 16)
/* AFB98 001AFA98 00608244 */  mtc1       $2, $f12
/* AFB9C 001AFA9C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* AFBA0 001AFAA0 00688244 */  mtc1       $2, $f13
/* AFBA4 001AFAA4 00708044 */  mtc1       $0, $f14
/* AFBA8 001AFAA8 F442023C */  lui        $2, (0x42F40000 >> 16)
/* AFBAC 001AFAAC 00788244 */  mtc1       $2, $f15
/* AFBB0 001AFAB0 5043023C */  lui        $2, (0x43500000 >> 16)
/* AFBB4 001AFAB4 00808244 */  mtc1       $2, $f16
/* AFBB8 001AFAB8 0004770C */  jal        func_1DC1000
/* AFBBC 001AFABC 00000000 */   nop
/* AFBC0 001AFAC0 9C9380AF */  sw         $0, -0x6C64($gp)
.L001AFAC4:
/* AFBC4 001AFAC4 1000BF7B */  lq         $31, 0x10($sp)
/* AFBC8 001AFAC8 0000B07B */  lq         $16, 0x0($sp)
/* AFBCC 001AFACC 3000BD27 */  addiu      $sp, $sp, 0x30
/* AFBD0 001AFAD0 0800E003 */  jr         $31
/* AFBD4 001AFAD4 00000000 */   nop
/* AFBD8 001AFAD8 00000000 */  nop
/* AFBDC 001AFADC 00000000 */  nop
