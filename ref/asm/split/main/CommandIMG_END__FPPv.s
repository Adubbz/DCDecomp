.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandIMG_END__FPPv
/* 03AC10 0013AB10 B0FFBD27 */  addiu       $29, $29, -0x50
/* 03AC14 0013AB14 0000BF7F */  sq          $31, 0x0($29)
/* 03AC18 0013AB18 1400A0AF */  sw          $0, 0x14($29)
/* 03AC1C 0013AB1C 1800A0AF */  sw          $0, 0x18($29)
/* 03AC20 0013AB20 1000A0AF */  sw          $0, 0x10($29)
/* 03AC24 0013AB24 28360070 */  paddub      $6, $0, $0
/* 03AC28 0013AB28 A08C838F */  lw          $3, -0x7360($28)
/* 03AC2C 0013AB2C C400648C */  lw          $4, 0xC4($3)
/* 03AC30 0013AB30 07008010 */  beqz        $4, .L0013AB50
/* 03AC34 0013AB34 00000000 */   nop
/* 03AC38 0013AB38 C801013C */  lui         $1, %hi(load_img)
/* 03AC3C 0013AB3C B0B0238C */  lw          $3, %lo(load_img)($1)
/* 03AC40 0013AB40 03006014 */  bnez        $3, .L0013AB50
/* 03AC44 0013AB44 00000000 */   nop
/* 03AC48 0013AB48 C801013C */  lui         $1, %hi(load_img)
/* 03AC4C 0013AB4C B0B024AC */  sw          $4, %lo(load_img)($1)
.L0013AB50:
/* 03AC50 0013AB50 282E0070 */  paddub      $5, $0, $0
/* 03AC54 0013AB54 16000010 */  b           .L0013ABB0
/* 03AC58 0013AB58 00000000 */   nop
.L0013AB5C:
/* 03AC5C 0013AB5C 80380500 */  sll         $7, $5, 2
/* 03AC60 0013AB60 C801033C */  lui         $3, %hi(load_img)
/* 03AC64 0013AB64 B0B06324 */  addiu       $3, $3, %lo(load_img)
/* 03AC68 0013AB68 21406700 */  addu        $8, $3, $7
/* 03AC6C 0013AB6C 0000048D */  lw          $4, 0x0($8)
/* 03AC70 0013AB70 A08C838F */  lw          $3, -0x7360($28)
/* 03AC74 0013AB74 2118E300 */  addu        $3, $7, $3
/* 03AC78 0013AB78 C40064AC */  sw          $4, 0xC4($3)
/* 03AC7C 0013AB7C 0000078D */  lw          $7, 0x0($8)
/* 03AC80 0013AB80 0A00E010 */  beqz        $7, .L0013ABAC
/* 03AC84 0013AB84 00000000 */   nop
/* 03AC88 0013AB88 9C8C848F */  lw          $4, -0x7364($28)
/* 03AC8C 0013AB8C 40180600 */  sll         $3, $6, 1
/* 03AC90 0013AB90 21186600 */  addu        $3, $3, $6
/* 03AC94 0013AB94 80180300 */  sll         $3, $3, 2
/* 03AC98 0013AB98 21187D00 */  addu        $3, $3, $29
/* 03AC9C 0013AB9C 140064AC */  sw          $4, 0x14($3)
/* 03ACA0 0013ABA0 180060AC */  sw          $0, 0x18($3)
/* 03ACA4 0013ABA4 100067AC */  sw          $7, 0x10($3)
/* 03ACA8 0013ABA8 0100C624 */  addiu       $6, $6, 0x1
.L0013ABAC:
/* 03ACAC 0013ABAC 0100A524 */  addiu       $5, $5, 0x1
.L0013ABB0:
/* 03ACB0 0013ABB0 0400A328 */  slti        $3, $5, 0x4
/* 03ACB4 0013ABB4 E9FF6014 */  bnez        $3, .L0013AB5C
/* 03ACB8 0013ABB8 00000000 */   nop
/* 03ACBC 0013ABBC 40180600 */  sll         $3, $6, 1
/* 03ACC0 0013ABC0 21186600 */  addu        $3, $3, $6
/* 03ACC4 0013ABC4 80180300 */  sll         $3, $3, 2
/* 03ACC8 0013ABC8 21187D00 */  addu        $3, $3, $29
/* 03ACCC 0013ABCC 140060AC */  sw          $0, 0x14($3)
/* 03ACD0 0013ABD0 180060AC */  sw          $0, 0x18($3)
/* 03ACD4 0013ABD4 100060AC */  sw          $0, 0x10($3)
/* 03ACD8 0013ABD8 0F00C018 */  blez        $6, .L0013AC18
/* 03ACDC 0013ABDC 00000000 */   nop
/* 03ACE0 0013ABE0 D08C828F */  lw          $2, -0x7330($28)
/* 03ACE4 0013ABE4 06004014 */  bnez        $2, .L0013AC00
/* 03ACE8 0013ABE8 00000000 */   nop
/* 03ACEC 0013ABEC C701023C */  lui         $2, %hi(TexManager)
/* 03ACF0 0013ABF0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 03ACF4 0013ABF4 9C8C858F */  lw          $5, -0x7364($28)
/* 03ACF8 0013ABF8 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 03ACFC 0013ABFC 00000000 */   nop
.L0013AC00:
/* 03AD00 0013AC00 C701023C */  lui         $2, %hi(TexManager)
/* 03AD04 0013AC04 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 03AD08 0013AC08 9C8C858F */  lw          $5, -0x7364($28)
/* 03AD0C 0013AC0C 1000A627 */  addiu       $6, $29, 0x10
/* 03AD10 0013AC10 30D0040C */  jal         LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 03AD14 0013AC14 00000000 */   nop
.L0013AC18:
/* 03AD18 0013AC18 EC8C858F */  lw          $5, -0x7314($28)
/* 03AD1C 0013AC1C 0600A010 */  beqz        $5, .L0013AC38
/* 03AD20 0013AC20 00000000 */   nop
/* 03AD24 0013AC24 A08C828F */  lw          $2, -0x7360($28)
/* 03AD28 0013AC28 DC004424 */  addiu       $4, $2, 0xDC
/* 03AD2C 0013AC2C F08C868F */  lw          $6, -0x7310($28)
/* 03AD30 0013AC30 F09E050C */  jal         LoadCFGFile__13CTextureAnimeFPci
/* 03AD34 0013AC34 00000000 */   nop
.L0013AC38:
/* 03AD38 0013AC38 0000BF7B */  lq          $31, 0x0($29)
/* 03AD3C 0013AC3C 5000BD27 */  addiu       $29, $29, 0x50
/* 03AD40 0013AC40 0800E003 */  jr          $31
/* 03AD44 0013AC44 00000000 */   nop
/* 03AD48 0013AC48 00000000 */  nop
/* 03AD4C 0013AC4C 00000000 */  nop
