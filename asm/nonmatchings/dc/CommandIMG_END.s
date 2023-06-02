.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CommandIMG_END__FPPv
/* 3AC10 0013AB10 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 3AC14 0013AB14 0000BF7F */  sq         $31, 0x0($sp)
/* 3AC18 0013AB18 1400A0AF */  sw         $0, 0x14($sp)
/* 3AC1C 0013AB1C 1800A0AF */  sw         $0, 0x18($sp)
/* 3AC20 0013AB20 1000A0AF */  sw         $0, 0x10($sp)
/* 3AC24 0013AB24 28360070 */  paddub     $6, $0, $0
/* 3AC28 0013AB28 A08C838F */  lw         $3, -0x7360($gp)
/* 3AC2C 0013AB2C C400648C */  lw         $4, 0xC4($3)
/* 3AC30 0013AB30 07008010 */  beqz       $4, .L0013AB50
/* 3AC34 0013AB34 00000000 */   nop
/* 3AC38 0013AB38 C801013C */  lui        $at, (0x1C80000 >> 16)
/* 3AC3C 0013AB3C B0B0238C */  lw         $3, -0x4F50($at)
/* 3AC40 0013AB40 03006014 */  bnez       $3, .L0013AB50
/* 3AC44 0013AB44 00000000 */   nop
/* 3AC48 0013AB48 C801013C */  lui        $at, (0x1C80000 >> 16)
/* 3AC4C 0013AB4C B0B024AC */  sw         $4, -0x4F50($at)
.L0013AB50:
/* 3AC50 0013AB50 282E0070 */  paddub     $5, $0, $0
/* 3AC54 0013AB54 16000010 */  b          .L0013ABB0
/* 3AC58 0013AB58 00000000 */   nop
.L0013AB5C:
/* 3AC5C 0013AB5C 80380500 */  sll        $7, $5, 2
/* 3AC60 0013AB60 C801033C */  lui        $3, %hi(load_img)
/* 3AC64 0013AB64 B0B06324 */  addiu      $3, $3, %lo(load_img)
/* 3AC68 0013AB68 21406700 */  addu       $8, $3, $7
/* 3AC6C 0013AB6C 0000048D */  lw         $4, 0x0($8)
/* 3AC70 0013AB70 A08C838F */  lw         $3, -0x7360($gp)
/* 3AC74 0013AB74 2118E300 */  addu       $3, $7, $3
/* 3AC78 0013AB78 C40064AC */  sw         $4, 0xC4($3)
/* 3AC7C 0013AB7C 0000078D */  lw         $7, 0x0($8)
/* 3AC80 0013AB80 0A00E010 */  beqz       $7, .L0013ABAC
/* 3AC84 0013AB84 00000000 */   nop
/* 3AC88 0013AB88 9C8C848F */  lw         $4, -0x7364($gp)
/* 3AC8C 0013AB8C 40180600 */  sll        $3, $6, 1
/* 3AC90 0013AB90 21186600 */  addu       $3, $3, $6
/* 3AC94 0013AB94 80180300 */  sll        $3, $3, 2
/* 3AC98 0013AB98 21187D00 */  addu       $3, $3, $sp
/* 3AC9C 0013AB9C 140064AC */  sw         $4, 0x14($3)
/* 3ACA0 0013ABA0 180060AC */  sw         $0, 0x18($3)
/* 3ACA4 0013ABA4 100067AC */  sw         $7, 0x10($3)
/* 3ACA8 0013ABA8 0100C624 */  addiu      $6, $6, 0x1
.L0013ABAC:
/* 3ACAC 0013ABAC 0100A524 */  addiu      $5, $5, 0x1
.L0013ABB0:
/* 3ACB0 0013ABB0 0400A328 */  slti       $3, $5, 0x4
/* 3ACB4 0013ABB4 E9FF6014 */  bnez       $3, .L0013AB5C
/* 3ACB8 0013ABB8 00000000 */   nop
/* 3ACBC 0013ABBC 40180600 */  sll        $3, $6, 1
/* 3ACC0 0013ABC0 21186600 */  addu       $3, $3, $6
/* 3ACC4 0013ABC4 80180300 */  sll        $3, $3, 2
/* 3ACC8 0013ABC8 21187D00 */  addu       $3, $3, $sp
/* 3ACCC 0013ABCC 140060AC */  sw         $0, 0x14($3)
/* 3ACD0 0013ABD0 180060AC */  sw         $0, 0x18($3)
/* 3ACD4 0013ABD4 100060AC */  sw         $0, 0x10($3)
/* 3ACD8 0013ABD8 0F00C018 */  blez       $6, .L0013AC18
/* 3ACDC 0013ABDC 00000000 */   nop
/* 3ACE0 0013ABE0 D08C828F */  lw         $2, -0x7330($gp)
/* 3ACE4 0013ABE4 06004014 */  bnez       $2, .L0013AC00
/* 3ACE8 0013ABE8 00000000 */   nop
/* 3ACEC 0013ABEC C701023C */  lui        $2, %hi(TexManager)
/* 3ACF0 0013ABF0 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 3ACF4 0013ABF4 9C8C858F */  lw         $5, -0x7364($gp)
/* 3ACF8 0013ABF8 C0CD040C */  jal        DeleteTextureBlock__15CTextureManagerFi
/* 3ACFC 0013ABFC 00000000 */   nop
.L0013AC00:
/* 3AD00 0013AC00 C701023C */  lui        $2, %hi(TexManager)
/* 3AD04 0013AC04 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 3AD08 0013AC08 9C8C858F */  lw         $5, -0x7364($gp)
/* 3AD0C 0013AC0C 1000A627 */  addiu      $6, $sp, 0x10
/* 3AD10 0013AC10 30D0040C */  jal        LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
/* 3AD14 0013AC14 00000000 */   nop
.L0013AC18:
/* 3AD18 0013AC18 EC8C858F */  lw         $5, -0x7314($gp)
/* 3AD1C 0013AC1C 0600A010 */  beqz       $5, .L0013AC38
/* 3AD20 0013AC20 00000000 */   nop
/* 3AD24 0013AC24 A08C828F */  lw         $2, -0x7360($gp)
/* 3AD28 0013AC28 DC004424 */  addiu      $4, $2, 0xDC
/* 3AD2C 0013AC2C F08C868F */  lw         $6, -0x7310($gp)
/* 3AD30 0013AC30 F09E050C */  jal        LoadCFGFile__13CTextureAnimeFPci
/* 3AD34 0013AC34 00000000 */   nop
.L0013AC38:
/* 3AD38 0013AC38 0000BF7B */  lq         $31, 0x0($sp)
/* 3AD3C 0013AC3C 5000BD27 */  addiu      $sp, $sp, 0x50
/* 3AD40 0013AC40 0800E003 */  jr         $31
/* 3AD44 0013AC44 00000000 */   nop
/* 3AD48 0013AC48 00000000 */  nop
/* 3AD4C 0013AC4C 00000000 */  nop
