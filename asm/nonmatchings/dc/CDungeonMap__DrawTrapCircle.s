.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawTrapCircle__11CDungeonMapFv
/* C7CD0 001C7BD0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* C7CD4 001C7BD4 6000BF7F */  sq         $31, 0x60($sp)
/* C7CD8 001C7BD8 5000B47F */  sq         $20, 0x50($sp)
/* C7CDC 001C7BDC 4000B37F */  sq         $19, 0x40($sp)
/* C7CE0 001C7BE0 3000B27F */  sq         $18, 0x30($sp)
/* C7CE4 001C7BE4 2000B17F */  sq         $17, 0x20($sp)
/* C7CE8 001C7BE8 1000B07F */  sq         $16, 0x10($sp)
/* C7CEC 001C7BEC 0000B4E7 */  swc1       $f20, 0x0($sp)
/* C7CF0 001C7BF0 28A68070 */  paddub     $20, $4, $0
/* C7CF4 001C7BF4 28860070 */  paddub     $16, $0, $0
/* C7CF8 001C7BF8 7000A427 */  addiu      $4, $sp, 0x70
/* C7CFC 001C7BFC EA01023C */  lui        $2, %hi(D_1EA1D30)
/* C7D00 001C7C00 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* C7D04 001C7C04 0C86040C */  jal        sceVu0CopyVector
/* C7D08 001C7C08 00000000 */   nop
/* C7D0C 001C7C0C 288E0070 */  paddub     $17, $0, $0
/* C7D10 001C7C10 4B000010 */  b          .L001C7D40
/* C7D14 001C7C14 00000000 */   nop
.L001C7C18:
/* C7D18 001C7C18 40911100 */  sll        $18, $17, 5
/* C7D1C 001C7C1C 21205402 */  addu       $4, $18, $20
/* C7D20 001C7C20 0100013C */  lui        $at, (0x10AC0 >> 16)
/* C7D24 001C7C24 21088100 */  addu       $at, $4, $at
/* C7D28 001C7C28 C00A238C */  lw         $3, (0x10AC0 & 0xFFFF)($at)
/* C7D2C 001C7C2C 43006010 */  beqz       $3, .L001C7D3C
/* C7D30 001C7C30 00000000 */   nop
/* C7D34 001C7C34 0100013C */  lui        $at, (0x10AB0 >> 16)
/* C7D38 001C7C38 B00A2134 */  ori        $at, $at, (0x10AB0 & 0xFFFF)
/* C7D3C 001C7C3C 21988100 */  addu       $19, $4, $at
/* C7D40 001C7C40 28266072 */  paddub     $4, $19, $0
/* C7D44 001C7C44 7000A527 */  addiu      $5, $sp, 0x70
/* C7D48 001C7C48 648D040C */  jal        DistVector__FPfPf
/* C7D4C 001C7C4C 00000000 */   nop
/* C7D50 001C7C50 2043033C */  lui        $3, (0x43200000 >> 16)
/* C7D54 001C7C54 00108344 */  mtc1       $3, $f2
/* C7D58 001C7C58 B00381C6 */  lwc1       $f1, 0x3B0($20)
/* C7D5C 001C7C5C 42100146 */  mul.s      $f1, $f2, $f1
/* C7D60 001C7C60 36000146 */  c.le.s     $f0, $f1
/* C7D64 001C7C64 00000000 */  nop
/* C7D68 001C7C68 34000045 */  bc1f       .L001C7D3C
/* C7D6C 001C7C6C 00000000 */   nop
/* C7D70 001C7C70 0D000016 */  bnez       $16, .L001C7CA8
/* C7D74 001C7C74 00000000 */   nop
/* C7D78 001C7C78 01001024 */  addiu      $16, $0, 0x1
/* C7D7C 001C7C7C C701023C */  lui        $2, %hi(TexManager)
/* C7D80 001C7C80 70584424 */  addiu      $4, $2, %lo(TexManager)
/* C7D84 001C7C84 D48B858F */  lw         $5, -0x742C($gp)
/* C7D88 001C7C88 47000624 */  addiu      $6, $0, 0x47
/* C7D8C 001C7C8C 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* C7D90 001C7C90 00000000 */   nop
/* C7D94 001C7C94 EB01023C */  lui        $2, %hi(D_1EB11D0)
/* C7D98 001C7C98 D0114424 */  addiu      $4, $2, %lo(D_1EB11D0)
/* C7D9C 001C7C9C 47000524 */  addiu      $5, $0, 0x47
/* C7DA0 001C7CA0 14E0040C */  jal        TextureAnime__10CCharacterFi
/* C7DA4 001C7CA4 00000000 */   nop
.L001C7CA8:
/* C7DA8 001C7CA8 21105402 */  addu       $2, $18, $20
/* C7DAC 001C7CAC 0100013C */  lui        $at, (0x10AC8 >> 16)
/* C7DB0 001C7CB0 C80A2134 */  ori        $at, $at, (0x10AC8 & 0xFFFF)
/* C7DB4 001C7CB4 21904100 */  addu       $18, $2, $at
/* C7DB8 001C7CB8 00004CC6 */  lwc1       $f12, 0x0($18)
/* C7DBC 001C7CBC 2876040C */  jal        sinf
/* C7DC0 001C7CC0 00000000 */   nop
/* C7DC4 001C7CC4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* C7DC8 001C7CC8 00088244 */  mtc1       $2, $f1
/* C7DCC 001C7CCC 00000000 */  nop
/* C7DD0 001C7CD0 000D0046 */  add.s      $f20, $f1, $f0
/* C7DD4 001C7CD4 00004CC6 */  lwc1       $f12, 0x0($18)
/* C7DD8 001C7CD8 2876040C */  jal        sinf
/* C7DDC 001C7CDC 00000000 */   nop
/* C7DE0 001C7CE0 0040023C */  lui        $2, (0x40000000 >> 16)
/* C7DE4 001C7CE4 00088244 */  mtc1       $2, $f1
/* C7DE8 001C7CE8 00000000 */  nop
/* C7DEC 001C7CEC 43000146 */  div.s      $f1, $f0, $f1
/* C7DF0 001C7CF0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* C7DF4 001C7CF4 00008244 */  mtc1       $2, $f0
/* C7DF8 001C7CF8 00000000 */  nop
/* C7DFC 001C7CFC 00030146 */  add.s      $f12, $f0, $f1
/* C7E00 001C7D00 EB01023C */  lui        $2, %hi(D_1EB11D0)
/* C7E04 001C7D04 D0114424 */  addiu      $4, $2, %lo(D_1EB11D0)
/* C7E08 001C7D08 46A30046 */  mov.s      $f13, $f20
/* C7E0C 001C7D0C 86630046 */  mov.s      $f14, $f12
/* C7E10 001C7D10 94E4040C */  jal        SetScale__10CCharacterFfff
/* C7E14 001C7D14 00000000 */   nop
/* C7E18 001C7D18 EB01023C */  lui        $2, %hi(D_1EB11D0)
/* C7E1C 001C7D1C D0114424 */  addiu      $4, $2, %lo(D_1EB11D0)
/* C7E20 001C7D20 282E6072 */  paddub     $5, $19, $0
/* C7E24 001C7D24 38E4040C */  jal        SetPosition__10CCharacterFPf
/* C7E28 001C7D28 00000000 */   nop
/* C7E2C 001C7D2C EB01023C */  lui        $2, %hi(D_1EB11D0)
/* C7E30 001C7D30 D0114424 */  addiu      $4, $2, %lo(D_1EB11D0)
/* C7E34 001C7D34 C4E4040C */  jal        Draw__10CCharacterFv
/* C7E38 001C7D38 00000000 */   nop
.L001C7D3C:
/* C7E3C 001C7D3C 01003126 */  addiu      $17, $17, 0x1
.L001C7D40:
/* C7E40 001C7D40 0300232A */  slti       $3, $17, 0x3
/* C7E44 001C7D44 B4FF6014 */  bnez       $3, .L001C7C18
/* C7E48 001C7D48 00000000 */   nop
/* C7E4C 001C7D4C 6000BF7B */  lq         $31, 0x60($sp)
/* C7E50 001C7D50 5000B47B */  lq         $20, 0x50($sp)
/* C7E54 001C7D54 4000B37B */  lq         $19, 0x40($sp)
/* C7E58 001C7D58 3000B27B */  lq         $18, 0x30($sp)
/* C7E5C 001C7D5C 2000B17B */  lq         $17, 0x20($sp)
/* C7E60 001C7D60 1000B07B */  lq         $16, 0x10($sp)
/* C7E64 001C7D64 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* C7E68 001C7D68 8000BD27 */  addiu      $sp, $sp, 0x80
/* C7E6C 001C7D6C 0800E003 */  jr         $31
/* C7E70 001C7D70 00000000 */   nop
/* C7E74 001C7D74 00000000 */  nop
/* C7E78 001C7D78 00000000 */  nop
/* C7E7C 001C7D7C 00000000 */  nop
