.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNowMapTransAtraMap__Fi
/* 12BE10 0022BD10 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 12BE14 0022BD14 1000BF7F */  sq         $31, 0x10($sp)
/* 12BE18 0022BD18 0000B07F */  sq         $16, 0x0($sp)
/* 12BE1C 0022BD1C 28860070 */  paddub     $16, $0, $0
/* 12BE20 0022BD20 2900023C */  lui        $2, %hi(_597_3)
/* 12BE24 0022BD24 90444624 */  addiu      $6, $2, %lo(_597_3)
/* 12BE28 0022BD28 2000A527 */  addiu      $5, $sp, 0x20
/* 12BE2C 0022BD2C 04000324 */  addiu      $3, $0, 0x4
.L0022BD30:
/* 12BE30 0022BD30 0000C278 */  lq         $2, 0x0($6)
/* 12BE34 0022BD34 1000C624 */  addiu      $6, $6, 0x10
/* 12BE38 0022BD38 FFFF6324 */  addiu      $3, $3, -0x1
/* 12BE3C 0022BD3C 0000A27C */  sq         $2, 0x0($5)
/* 12BE40 0022BD40 1000A524 */  addiu      $5, $5, 0x10
/* 12BE44 0022BD44 FAFF601C */  bgtz       $3, .L0022BD30
/* 12BE48 0022BD48 00000000 */   nop
/* 12BE4C 0022BD4C 0000C3C4 */  lwc1       $f3, 0x0($6)
/* 12BE50 0022BD50 0400C284 */  lh         $2, 0x4($6)
/* 12BE54 0022BD54 0000A3E4 */  swc1       $f3, 0x0($5)
/* 12BE58 0022BD58 0400A2A4 */  sh         $2, 0x4($5)
/* 12BE5C 0022BD5C 05008128 */  slti       $at, $4, 0x5
/* 12BE60 0022BD60 04002010 */  beqz       $at, .L0022BD74
/* 12BE64 0022BD64 00000000 */   nop
/* 12BE68 0022BD68 28868070 */  paddub     $16, $4, $0
/* 12BE6C 0022BD6C 10000010 */  b          .L0022BDB0
/* 12BE70 0022BD70 00000000 */   nop
.L0022BD74:
/* 12BE74 0022BD74 0B008228 */  slti       $2, $4, 0xB
/* 12BE78 0022BD78 09004014 */  bnez       $2, .L0022BDA0
/* 12BE7C 0022BD7C 00000000 */   nop
/* 12BE80 0022BD80 29008128 */  slti       $at, $4, 0x29
/* 12BE84 0022BD84 06002010 */  beqz       $at, .L0022BDA0
/* 12BE88 0022BD88 00000000 */   nop
/* 12BE8C 0022BD8C 40100400 */  sll        $2, $4, 1
/* 12BE90 0022BD90 21105D00 */  addu       $2, $2, $sp
/* 12BE94 0022BD94 0A005084 */  lh         $16, 0xA($2)
/* 12BE98 0022BD98 05000010 */  b          .L0022BDB0
/* 12BE9C 0022BD9C 00000000 */   nop
.L0022BDA0:
/* 12BEA0 0022BDA0 C8008228 */  slti       $2, $4, 0xC8
/* 12BEA4 0022BDA4 02004014 */  bnez       $2, .L0022BDB0
/* 12BEA8 0022BDA8 00000000 */   nop
/* 12BEAC 0022BDAC 38FF9024 */  addiu      $16, $4, -0xC8
.L0022BDB0:
/* 12BEB0 0022BDB0 10AF080C */  jal        GetAtoraMaxVillage__Fv
/* 12BEB4 0022BDB4 00000000 */   nop
/* 12BEB8 0022BDB8 FDFF4224 */  addiu      $2, $2, -0x3
/* 12BEBC 0022BDBC 2A085000 */  slt        $at, $2, $16
/* 12BEC0 0022BDC0 04002010 */  beqz       $at, .L0022BDD4
/* 12BEC4 0022BDC4 00000000 */   nop
/* 12BEC8 0022BDC8 10AF080C */  jal        GetAtoraMaxVillage__Fv
/* 12BECC 0022BDCC 00000000 */   nop
/* 12BED0 0022BDD0 FDFF5024 */  addiu      $16, $2, -0x3
.L0022BDD4:
/* 12BED4 0022BDD4 28160072 */  paddub     $2, $16, $0
/* 12BED8 0022BDD8 1000BF7B */  lq         $31, 0x10($sp)
/* 12BEDC 0022BDDC 0000B07B */  lq         $16, 0x0($sp)
/* 12BEE0 0022BDE0 7000BD27 */  addiu      $sp, $sp, 0x70
/* 12BEE4 0022BDE4 0800E003 */  jr         $31
/* 12BEE8 0022BDE8 00000000 */   nop
/* 12BEEC 0022BDEC 00000000 */  nop
