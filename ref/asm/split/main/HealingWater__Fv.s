.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel HealingWater__Fv
/* 0AFA80 001AF980 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0AFA84 001AF984 1000BF7F */  sq          $31, 0x10($29)
/* 0AFA88 001AF988 0000B07F */  sq          $16, 0x0($29)
/* 0AFA8C 001AF98C B8BD060C */  jal         CheckHealZone__Fv
/* 0AFA90 001AF990 00000000 */   nop
/* 0AFA94 001AF994 05004014 */  bnez        $2, .L001AF9AC
/* 0AFA98 001AF998 00000000 */   nop
/* 0AFA9C 001AF99C ECBC060C */  jal         CheckHealingWater__Fv
/* 0AFAA0 001AF9A0 00000000 */   nop
/* 0AFAA4 001AF9A4 47004010 */  beqz        $2, .L001AFAC4
/* 0AFAA8 001AF9A8 00000000 */   nop
.L001AF9AC:
/* 0AFAAC 001AF9AC 9893838F */  lw          $3, -0x6C68($28)
/* 0AFAB0 001AF9B0 1400601C */  bgtz        $3, .L001AFA04
/* 0AFAB4 001AF9B4 00000000 */   nop
/* 0AFAB8 001AF9B8 789C848F */  lw          $4, -0x6388($28)
/* 0AFABC 001AF9BC 04009080 */  lb          $16, 0x4($4)
/* 0AFAC0 001AF9C0 7F43023C */  lui         $2, (0x437F0000 >> 16)
/* 0AFAC4 001AF9C4 00608244 */  mtc1        $2, $f12
/* 0AFAC8 001AF9C8 282E0072 */  paddub      $5, $16, $0
/* 0AFACC 001AF9CC FF000624 */  addiu       $6, $0, 0xFF
/* 0AFAD0 001AF9D0 44F9060C */  jal         AddDrink__11CUserStatusFisf
/* 0AFAD4 001AF9D4 00000000 */   nop
/* 0AFAD8 001AF9D8 7F43023C */  lui         $2, (0x437F0000 >> 16)
/* 0AFADC 001AF9DC 00608244 */  mtc1        $2, $f12
/* 0AFAE0 001AF9E0 789C848F */  lw          $4, -0x6388($28)
/* 0AFAE4 001AF9E4 282E0072 */  paddub      $5, $16, $0
/* 0AFAE8 001AF9E8 FF000624 */  addiu       $6, $0, 0xFF
/* 0AFAEC 001AF9EC C4F9060C */  jal         AddNowLife__11CUserStatusFisf
/* 0AFAF0 001AF9F0 00000000 */   nop
/* 0AFAF4 001AF9F4 0A000324 */  addiu       $3, $0, 0xA
/* 0AFAF8 001AF9F8 989383AF */  sw          $3, -0x6C68($28)
/* 0AFAFC 001AF9FC 03000010 */  b           .L001AFA0C
/* 0AFB00 001AFA00 00000000 */   nop
.L001AFA04:
/* 0AFB04 001AFA04 FFFF6324 */  addiu       $3, $3, -0x1
/* 0AFB08 001AFA08 989383AF */  sw          $3, -0x6C68($28)
.L001AFA0C:
/* 0AFB0C 001AFA0C EC01013C */  lui         $1, %hi(HealEffect + 0x510)
/* 0AFB10 001AFA10 5050238C */  lw          $3, %lo(HealEffect + 0x510)($1)
/* 0AFB14 001AFA14 1C006014 */  bnez        $3, .L001AFA88
/* 0AFB18 001AFA18 00000000 */   nop
/* 0AFB1C 001AFA1C 789C848F */  lw          $4, -0x6388($28)
/* 0AFB20 001AFA20 04008380 */  lb          $3, 0x4($4)
/* 0AFB24 001AFA24 40180300 */  sll         $3, $3, 1
/* 0AFB28 001AFA28 21186400 */  addu        $3, $3, $4
/* 0AFB2C 001AFA2C 06006484 */  lh          $4, 0x6($3)
/* 0AFB30 001AFA30 12006384 */  lh          $3, 0x12($3)
/* 0AFB34 001AFA34 23006410 */  beq         $3, $4, .L001AFAC4
/* 0AFB38 001AFA38 00000000 */   nop
/* 0AFB3C 001AFA3C 2000A427 */  addiu       $4, $29, 0x20
/* 0AFB40 001AFA40 EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 0AFB44 001AFA44 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 0AFB48 001AFA48 0C86040C */  jal         sceVu0CopyVector
/* 0AFB4C 001AFA4C 00000000 */   nop
/* 0AFB50 001AFA50 EC01023C */  lui         $2, %hi(HealEffect)
/* 0AFB54 001AFA54 404B4424 */  addiu       $4, $2, %lo(HealEffect)
/* 0AFB58 001AFA58 2000A527 */  addiu       $5, $29, 0x20
/* 0AFB5C 001AFA5C 40CA060C */  jal         Set__11CHealEffectFPf
/* 0AFB60 001AFA60 00000000 */   nop
/* 0AFB64 001AFA64 B8010424 */  addiu       $4, $0, 0x1B8
/* 0AFB68 001AFA68 FFFF0524 */  addiu       $5, $0, -0x1
/* 0AFB6C 001AFA6C 28360070 */  paddub      $6, $0, $0
/* 0AFB70 001AFA70 AC69050C */  jal         SndSePlay__Fiii
/* 0AFB74 001AFA74 00000000 */   nop
/* 0AFB78 001AFA78 01000324 */  addiu       $3, $0, 0x1
/* 0AFB7C 001AFA7C 9C9383AF */  sw          $3, -0x6C64($28)
/* 0AFB80 001AFA80 10000010 */  b           .L001AFAC4
/* 0AFB84 001AFA84 00000000 */   nop
.L001AFA88:
/* 0AFB88 001AFA88 9C93838F */  lw          $3, -0x6C64($28)
/* 0AFB8C 001AFA8C 0D006010 */  beqz        $3, .L001AFAC4
/* 0AFB90 001AFA90 00000000 */   nop
/* 0AFB94 001AFA94 7042023C */  lui         $2, (0x42700000 >> 16)
/* 0AFB98 001AFA98 00608244 */  mtc1        $2, $f12
/* 0AFB9C 001AFA9C 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 0AFBA0 001AFAA0 00688244 */  mtc1        $2, $f13
/* 0AFBA4 001AFAA4 00708044 */  mtc1        $0, $f14
/* 0AFBA8 001AFAA8 F442023C */  lui         $2, (0x42F40000 >> 16)
/* 0AFBAC 001AFAAC 00788244 */  mtc1        $2, $f15
/* 0AFBB0 001AFAB0 5043023C */  lui         $2, (0x43500000 >> 16)
/* 0AFBB4 001AFAB4 00808244 */  mtc1        $2, $f16
/* 0AFBB8 001AFAB8 0004770C */  jal         setUnitAmbientAnime__Ffffff
/* 0AFBBC 001AFABC 00000000 */   nop
/* 0AFBC0 001AFAC0 9C9380AF */  sw          $0, -0x6C64($28)
.L001AFAC4:
/* 0AFBC4 001AFAC4 1000BF7B */  lq          $31, 0x10($29)
/* 0AFBC8 001AFAC8 0000B07B */  lq          $16, 0x0($29)
/* 0AFBCC 001AFACC 3000BD27 */  addiu       $29, $29, 0x30
/* 0AFBD0 001AFAD0 0800E003 */  jr          $31
/* 0AFBD4 001AFAD4 00000000 */   nop
/* 0AFBD8 001AFAD8 00000000 */  nop
/* 0AFBDC 001AFADC 00000000 */  nop
