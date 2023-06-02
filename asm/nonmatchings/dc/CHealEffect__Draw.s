.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__11CHealEffectFv
/* B2E50 001B2D50 90FFBD27 */  addiu      $sp, $sp, -0x70
/* B2E54 001B2D54 4000BF7F */  sq         $31, 0x40($sp)
/* B2E58 001B2D58 3000B37F */  sq         $19, 0x30($sp)
/* B2E5C 001B2D5C 2000B27F */  sq         $18, 0x20($sp)
/* B2E60 001B2D60 1000B17F */  sq         $17, 0x10($sp)
/* B2E64 001B2D64 0000B07F */  sq         $16, 0x0($sp)
/* B2E68 001B2D68 289E8070 */  paddub     $19, $4, $0
/* B2E6C 001B2D6C 1005838C */  lw         $3, 0x510($4)
/* B2E70 001B2D70 3E006010 */  beqz       $3, .L001B2E6C
/* B2E74 001B2D74 00000000 */   nop
/* B2E78 001B2D78 2700023C */  lui        $2, %hi(_1418)
/* B2E7C 001B2D7C D0B04224 */  addiu      $2, $2, %lo(_1418)
/* B2E80 001B2D80 6000A327 */  addiu      $3, $sp, 0x60
/* B2E84 001B2D84 00004278 */  lq         $2, 0x0($2)
/* B2E88 001B2D88 0000627C */  sq         $2, 0x0($3)
/* B2E8C 001B2D8C C701023C */  lui        $2, %hi(TexManager)
/* B2E90 001B2D90 70584424 */  addiu      $4, $2, %lo(TexManager)
/* B2E94 001B2D94 2A00023C */  lui        $2, %hi(_1430)
/* B2E98 001B2D98 F8B64524 */  addiu      $5, $2, %lo(_1430)
/* B2E9C 001B2D9C FFFF0624 */  addiu      $6, $0, -0x1
/* B2EA0 001B2DA0 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* B2EA4 001B2DA4 00000000 */   nop
/* B2EA8 001B2DA8 28864070 */  paddub     $16, $2, $0
/* B2EAC 001B2DAC 28266072 */  paddub     $4, $19, $0
/* B2EB0 001B2DB0 EA01023C */  lui        $2, %hi(D_1EA1D30)
/* B2EB4 001B2DB4 301D4524 */  addiu      $5, $2, %lo(D_1EA1D30)
/* B2EB8 001B2DB8 0C86040C */  jal        sceVu0CopyVector
/* B2EBC 001B2DBC 00000000 */   nop
/* B2EC0 001B2DC0 288E0070 */  paddub     $17, $0, $0
/* B2EC4 001B2DC4 26000010 */  b          .L001B2E60
/* B2EC8 001B2DC8 00000000 */   nop
.L001B2DCC:
/* B2ECC 001B2DCC 80901100 */  sll        $18, $17, 2
/* B2ED0 001B2DD0 21185302 */  addu       $3, $18, $19
/* B2ED4 001B2DD4 100461C4 */  lwc1       $f1, 0x410($3)
/* B2ED8 001B2DD8 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* B2EDC 001B2DDC 34080046 */  c.lt.s     $f1, $f0
/* B2EE0 001B2DE0 00000000 */  nop
/* B2EE4 001B2DE4 1D000045 */  bc1f       .L001B2E5C
/* B2EE8 001B2DE8 00000000 */   nop
/* B2EEC 001B2DEC 00111100 */  sll        $2, $17, 4
/* B2EF0 001B2DF0 21105300 */  addu       $2, $2, $19
/* B2EF4 001B2DF4 100041C4 */  lwc1       $f1, 0x10($2)
/* B2EF8 001B2DF8 000060C6 */  lwc1       $f0, 0x0($19)
/* B2EFC 001B2DFC 00000146 */  add.s      $f0, $f0, $f1
/* B2F00 001B2E00 5000A0E7 */  swc1       $f0, 0x50($sp)
/* B2F04 001B2E04 040061C6 */  lwc1       $f1, 0x4($19)
/* B2F08 001B2E08 140040C4 */  lwc1       $f0, 0x14($2)
/* B2F0C 001B2E0C 00080046 */  add.s      $f0, $f1, $f0
/* B2F10 001B2E10 5400A0E7 */  swc1       $f0, 0x54($sp)
/* B2F14 001B2E14 080061C6 */  lwc1       $f1, 0x8($19)
/* B2F18 001B2E18 180040C4 */  lwc1       $f0, 0x18($2)
/* B2F1C 001B2E1C 00080046 */  add.s      $f0, $f1, $f0
/* B2F20 001B2E20 5800A0E7 */  swc1       $f0, 0x58($sp)
/* B2F24 001B2E24 90036CC4 */  lwc1       $f12, 0x390($3)
/* B2F28 001B2E28 2C44040C */  jal        fptosi
/* B2F2C 001B2E2C 00000000 */   nop
/* B2F30 001B2E30 21185302 */  addu       $3, $18, $19
/* B2F34 001B2E34 5000A427 */  addiu      $4, $sp, 0x50
/* B2F38 001B2E38 282E0072 */  paddub     $5, $16, $0
/* B2F3C 001B2E3C 90046CC4 */  lwc1       $f12, 0x490($3)
/* B2F40 001B2E40 10000624 */  addiu      $6, $0, 0x10
/* B2F44 001B2E44 283E0070 */  paddub     $7, $0, $0
/* B2F48 001B2E48 20000824 */  addiu      $8, $0, 0x20
/* B2F4C 001B2E4C 284E0071 */  paddub     $9, $8, $0
/* B2F50 001B2E50 28564070 */  paddub     $10, $2, $0
/* B2F54 001B2E54 FCC9060C */  jal        BtSet3DCellModel__FPfP8CTexturefiiiii
/* B2F58 001B2E58 00000000 */   nop
.L001B2E5C:
/* B2F5C 001B2E5C 01003126 */  addiu      $17, $17, 0x1
.L001B2E60:
/* B2F60 001B2E60 2000232A */  slti       $3, $17, 0x20
/* B2F64 001B2E64 D9FF6014 */  bnez       $3, .L001B2DCC
/* B2F68 001B2E68 00000000 */   nop
.L001B2E6C:
/* B2F6C 001B2E6C 4000BF7B */  lq         $31, 0x40($sp)
/* B2F70 001B2E70 3000B37B */  lq         $19, 0x30($sp)
/* B2F74 001B2E74 2000B27B */  lq         $18, 0x20($sp)
/* B2F78 001B2E78 1000B17B */  lq         $17, 0x10($sp)
/* B2F7C 001B2E7C 0000B07B */  lq         $16, 0x0($sp)
/* B2F80 001B2E80 7000BD27 */  addiu      $sp, $sp, 0x70
/* B2F84 001B2E84 0800E003 */  jr         $31
/* B2F88 001B2E88 00000000 */   nop
/* B2F8C 001B2E8C 00000000 */  nop
