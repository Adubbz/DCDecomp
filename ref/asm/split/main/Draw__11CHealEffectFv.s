.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw__11CHealEffectFv
/* 0B2E50 001B2D50 90FFBD27 */  addiu       $29, $29, -0x70
/* 0B2E54 001B2D54 4000BF7F */  sq          $31, 0x40($29)
/* 0B2E58 001B2D58 3000B37F */  sq          $19, 0x30($29)
/* 0B2E5C 001B2D5C 2000B27F */  sq          $18, 0x20($29)
/* 0B2E60 001B2D60 1000B17F */  sq          $17, 0x10($29)
/* 0B2E64 001B2D64 0000B07F */  sq          $16, 0x0($29)
/* 0B2E68 001B2D68 289E8070 */  paddub      $19, $4, $0
/* 0B2E6C 001B2D6C 1005838C */  lw          $3, 0x510($4)
/* 0B2E70 001B2D70 3E006010 */  beqz        $3, .L001B2E6C
/* 0B2E74 001B2D74 00000000 */   nop
/* 0B2E78 001B2D78 2700023C */  lui         $2, %hi(LIT_1418)
/* 0B2E7C 001B2D7C D0B04224 */  addiu       $2, $2, %lo(LIT_1418)
/* 0B2E80 001B2D80 6000A327 */  addiu       $3, $29, 0x60
/* 0B2E84 001B2D84 00004278 */  lq          $2, 0x0($2)
/* 0B2E88 001B2D88 0000627C */  sq          $2, 0x0($3)
/* 0B2E8C 001B2D8C C701023C */  lui         $2, %hi(TexManager)
/* 0B2E90 001B2D90 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0B2E94 001B2D94 2A00023C */  lui         $2, %hi(LIT_1430)
/* 0B2E98 001B2D98 F8B64524 */  addiu       $5, $2, %lo(LIT_1430)
/* 0B2E9C 001B2D9C FFFF0624 */  addiu       $6, $0, -0x1
/* 0B2EA0 001B2DA0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0B2EA4 001B2DA4 00000000 */   nop
/* 0B2EA8 001B2DA8 28864070 */  paddub      $16, $2, $0
/* 0B2EAC 001B2DAC 28266072 */  paddub      $4, $19, $0
/* 0B2EB0 001B2DB0 EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 0B2EB4 001B2DB4 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 0B2EB8 001B2DB8 0C86040C */  jal         sceVu0CopyVector
/* 0B2EBC 001B2DBC 00000000 */   nop
/* 0B2EC0 001B2DC0 288E0070 */  paddub      $17, $0, $0
/* 0B2EC4 001B2DC4 26000010 */  b           .L001B2E60
/* 0B2EC8 001B2DC8 00000000 */   nop
.L001B2DCC:
/* 0B2ECC 001B2DCC 80901100 */  sll         $18, $17, 2
/* 0B2ED0 001B2DD0 21185302 */  addu        $3, $18, $19
/* 0B2ED4 001B2DD4 100461C4 */  lwc1        $f1, 0x410($3)
/* 0B2ED8 001B2DD8 B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 0B2EDC 001B2DDC 34080046 */  c.lt.s      $f1, $f0
/* 0B2EE0 001B2DE0 00000000 */  nop
/* 0B2EE4 001B2DE4 1D000045 */  bc1f        .L001B2E5C
/* 0B2EE8 001B2DE8 00000000 */   nop
/* 0B2EEC 001B2DEC 00111100 */  sll         $2, $17, 4
/* 0B2EF0 001B2DF0 21105300 */  addu        $2, $2, $19
/* 0B2EF4 001B2DF4 100041C4 */  lwc1        $f1, 0x10($2)
/* 0B2EF8 001B2DF8 000060C6 */  lwc1        $f0, 0x0($19)
/* 0B2EFC 001B2DFC 00000146 */  add.s       $f0, $f0, $f1
/* 0B2F00 001B2E00 5000A0E7 */  swc1        $f0, 0x50($29)
/* 0B2F04 001B2E04 040061C6 */  lwc1        $f1, 0x4($19)
/* 0B2F08 001B2E08 140040C4 */  lwc1        $f0, 0x14($2)
/* 0B2F0C 001B2E0C 00080046 */  add.s       $f0, $f1, $f0
/* 0B2F10 001B2E10 5400A0E7 */  swc1        $f0, 0x54($29)
/* 0B2F14 001B2E14 080061C6 */  lwc1        $f1, 0x8($19)
/* 0B2F18 001B2E18 180040C4 */  lwc1        $f0, 0x18($2)
/* 0B2F1C 001B2E1C 00080046 */  add.s       $f0, $f1, $f0
/* 0B2F20 001B2E20 5800A0E7 */  swc1        $f0, 0x58($29)
/* 0B2F24 001B2E24 90036CC4 */  lwc1        $f12, 0x390($3)
/* 0B2F28 001B2E28 2C44040C */  jal         fptosi
/* 0B2F2C 001B2E2C 00000000 */   nop
/* 0B2F30 001B2E30 21185302 */  addu        $3, $18, $19
/* 0B2F34 001B2E34 5000A427 */  addiu       $4, $29, 0x50
/* 0B2F38 001B2E38 282E0072 */  paddub      $5, $16, $0
/* 0B2F3C 001B2E3C 90046CC4 */  lwc1        $f12, 0x490($3)
/* 0B2F40 001B2E40 10000624 */  addiu       $6, $0, 0x10
/* 0B2F44 001B2E44 283E0070 */  paddub      $7, $0, $0
/* 0B2F48 001B2E48 20000824 */  addiu       $8, $0, 0x20
/* 0B2F4C 001B2E4C 284E0071 */  paddub      $9, $8, $0
/* 0B2F50 001B2E50 28564070 */  paddub      $10, $2, $0
/* 0B2F54 001B2E54 FCC9060C */  jal         BtSet3DCellModel__FPfP8CTexturefiiiii
/* 0B2F58 001B2E58 00000000 */   nop
.L001B2E5C:
/* 0B2F5C 001B2E5C 01003126 */  addiu       $17, $17, 0x1
.L001B2E60:
/* 0B2F60 001B2E60 2000232A */  slti        $3, $17, 0x20
/* 0B2F64 001B2E64 D9FF6014 */  bnez        $3, .L001B2DCC
/* 0B2F68 001B2E68 00000000 */   nop
.L001B2E6C:
/* 0B2F6C 001B2E6C 4000BF7B */  lq          $31, 0x40($29)
/* 0B2F70 001B2E70 3000B37B */  lq          $19, 0x30($29)
/* 0B2F74 001B2E74 2000B27B */  lq          $18, 0x20($29)
/* 0B2F78 001B2E78 1000B17B */  lq          $17, 0x10($29)
/* 0B2F7C 001B2E7C 0000B07B */  lq          $16, 0x0($29)
/* 0B2F80 001B2E80 7000BD27 */  addiu       $29, $29, 0x70
/* 0B2F84 001B2E84 0800E003 */  jr          $31
/* 0B2F88 001B2E88 00000000 */   nop
/* 0B2F8C 001B2E8C 00000000 */  nop
