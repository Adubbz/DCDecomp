.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Draw_Cold__14CWeaponElementFv
/* 0B8DA0 001B8CA0 00FFBD27 */  addiu       $29, $29, -0x100
/* 0B8DA4 001B8CA4 8000BF7F */  sq          $31, 0x80($29)
/* 0B8DA8 001B8CA8 7000B77F */  sq          $23, 0x70($29)
/* 0B8DAC 001B8CAC 6000B67F */  sq          $22, 0x60($29)
/* 0B8DB0 001B8CB0 5000B57F */  sq          $21, 0x50($29)
/* 0B8DB4 001B8CB4 4000B47F */  sq          $20, 0x40($29)
/* 0B8DB8 001B8CB8 3000B37F */  sq          $19, 0x30($29)
/* 0B8DBC 001B8CBC 2000B27F */  sq          $18, 0x20($29)
/* 0B8DC0 001B8CC0 1000B17F */  sq          $17, 0x10($29)
/* 0B8DC4 001B8CC4 0000B07F */  sq          $16, 0x0($29)
/* 0B8DC8 001B8CC8 28AE8070 */  paddub      $21, $4, $0
/* 0B8DCC 001B8CCC C701023C */  lui         $2, %hi(TexManager)
/* 0B8DD0 001B8CD0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0B8DD4 001B8CD4 2A00023C */  lui         $2, %hi(LIT_1182)
/* 0B8DD8 001B8CD8 88BC4524 */  addiu       $5, $2, %lo(LIT_1182)
/* 0B8DDC 001B8CDC FFFF0624 */  addiu       $6, $0, -0x1
/* 0B8DE0 001B8CE0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0B8DE4 001B8CE4 00000000 */   nop
/* 0B8DE8 001B8CE8 28864070 */  paddub      $16, $2, $0
/* 0B8DEC 001B8CEC D000A427 */  addiu       $4, $29, 0xD0
/* 0B8DF0 001B8CF0 0000A58E */  lw          $5, 0x0($21)
/* 0B8DF4 001B8CF4 0C86040C */  jal         sceVu0CopyVector
/* 0B8DF8 001B8CF8 00000000 */   nop
/* 0B8DFC 001B8CFC 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 0B8E00 001B8D00 EC00A3AF */  sw          $3, 0xEC($29)
/* 0B8E04 001B8D04 288E0070 */  paddub      $17, $0, $0
/* 0B8E08 001B8D08 51000010 */  b           .L001B8E50
/* 0B8E0C 001B8D0C 00000000 */   nop
.L001B8D10:
/* 0B8E10 001B8D10 40181100 */  sll         $3, $17, 1
/* 0B8E14 001B8D14 21187500 */  addu        $3, $3, $21
/* 0B8E18 001B8D18 FA067284 */  lh          $18, 0x6FA($3)
/* 0B8E1C 001B8D1C 80181100 */  sll         $3, $17, 2
/* 0B8E20 001B8D20 21187500 */  addu        $3, $3, $21
/* 0B8E24 001B8D24 20057424 */  addiu       $20, $3, 0x520
/* 0B8E28 001B8D28 200561C4 */  lwc1        $f1, 0x520($3)
/* 0B8E2C 001B8D2C 00008044 */  mtc1        $0, $f0
/* 0B8E30 001B8D30 00000000 */  nop
/* 0B8E34 001B8D34 36080046 */  c.le.s      $f1, $f0
/* 0B8E38 001B8D38 00000000 */  nop
/* 0B8E3C 001B8D3C 43000145 */  bc1t        .L001B8E4C
/* 0B8E40 001B8D40 00000000 */   nop
/* 0B8E44 001B8D44 200461C4 */  lwc1        $f1, 0x420($3)
/* 0B8E48 001B8D48 A00460C4 */  lwc1        $f0, 0x4A0($3)
/* 0B8E4C 001B8D4C 42080046 */  mul.s       $f1, $f1, $f0
/* 0B8E50 001B8D50 B005A0C6 */  lwc1        $f0, 0x5B0($21)
/* 0B8E54 001B8D54 02030146 */  mul.s       $f12, $f0, $f1
/* 0B8E58 001B8D58 00111100 */  sll         $2, $17, 4
/* 0B8E5C 001B8D5C 21105500 */  addu        $2, $2, $21
/* 0B8E60 001B8D60 200041C4 */  lwc1        $f1, 0x20($2)
/* 0B8E64 001B8D64 D000A0C7 */  lwc1        $f0, 0xD0($29)
/* 0B8E68 001B8D68 00000146 */  add.s       $f0, $f0, $f1
/* 0B8E6C 001B8D6C E000A0E7 */  swc1        $f0, 0xE0($29)
/* 0B8E70 001B8D70 240041C4 */  lwc1        $f1, 0x24($2)
/* 0B8E74 001B8D74 D400A0C7 */  lwc1        $f0, 0xD4($29)
/* 0B8E78 001B8D78 00000146 */  add.s       $f0, $f0, $f1
/* 0B8E7C 001B8D7C E400A0E7 */  swc1        $f0, 0xE4($29)
/* 0B8E80 001B8D80 280041C4 */  lwc1        $f1, 0x28($2)
/* 0B8E84 001B8D84 D800A0C7 */  lwc1        $f0, 0xD8($29)
/* 0B8E88 001B8D88 00000146 */  add.s       $f0, $f0, $f1
/* 0B8E8C 001B8D8C E800A0E7 */  swc1        $f0, 0xE8($29)
/* 0B8E90 001B8D90 0040023C */  lui         $2, (0x40000000 >> 16)
/* 0B8E94 001B8D94 00008244 */  mtc1        $2, $f0
/* 0B8E98 001B8D98 00000000 */  nop
/* 0B8E9C 001B8D9C 43630046 */  div.s       $f13, $f12, $f0
/* 0B8EA0 001B8DA0 C000B327 */  addiu       $19, $29, 0xC0
/* 0B8EA4 001B8DA4 9000A427 */  addiu       $4, $29, 0x90
/* 0B8EA8 001B8DA8 282E6072 */  paddub      $5, $19, $0
/* 0B8EAC 001B8DAC E000A627 */  addiu       $6, $29, 0xE0
/* 0B8EB0 001B8DB0 283E0070 */  paddub      $7, $0, $0
/* 0B8EB4 001B8DB4 D0B9040C */  jal         MGRotTransPers3DSprite__FPiPiPfffi
/* 0B8EB8 001B8DB8 00000000 */   nop
/* 0B8EBC 001B8DBC 01000324 */  addiu       $3, $0, 0x1
/* 0B8EC0 001B8DC0 22004314 */  bne         $2, $3, .L001B8E4C
/* 0B8EC4 001B8DC4 00000000 */   nop
/* 0B8EC8 001B8DC8 0000628E */  lw          $2, 0x0($19)
/* 0B8ECC 001B8DCC A000B627 */  addiu       $22, $29, 0xA0
/* 0B8ED0 001B8DD0 0000C2AE */  sw          $2, 0x0($22)
/* 0B8ED4 001B8DD4 9400A28F */  lw          $2, 0x94($29)
/* 0B8ED8 001B8DD8 A400A2AF */  sw          $2, 0xA4($29)
/* 0B8EDC 001B8DDC 9800A28F */  lw          $2, 0x98($29)
/* 0B8EE0 001B8DE0 A800A2AF */  sw          $2, 0xA8($29)
/* 0B8EE4 001B8DE4 9000A28F */  lw          $2, 0x90($29)
/* 0B8EE8 001B8DE8 B000B727 */  addiu       $23, $29, 0xB0
/* 0B8EEC 001B8DEC 0000E2AE */  sw          $2, 0x0($23)
/* 0B8EF0 001B8DF0 C400A28F */  lw          $2, 0xC4($29)
/* 0B8EF4 001B8DF4 B400A2AF */  sw          $2, 0xB4($29)
/* 0B8EF8 001B8DF8 C800A28F */  lw          $2, 0xC8($29)
/* 0B8EFC 001B8DFC B800A2AF */  sw          $2, 0xB8($29)
/* 0B8F00 001B8E00 A0000224 */  addiu       $2, $0, 0xA0
/* 0B8F04 001B8E04 F000A2AF */  sw          $2, 0xF0($29)
/* 0B8F08 001B8E08 F400B2AF */  sw          $18, 0xF4($29)
/* 0B8F0C 001B8E0C 30000224 */  addiu       $2, $0, 0x30
/* 0B8F10 001B8E10 F800A2AF */  sw          $2, 0xF8($29)
/* 0B8F14 001B8E14 FC00A2AF */  sw          $2, 0xFC($29)
/* 0B8F18 001B8E18 00008CC6 */  lwc1        $f12, 0x0($20)
/* 0B8F1C 001B8E1C 5044040C */  jal         fptoui
/* 0B8F20 001B8E20 00000000 */   nop
/* 0B8F24 001B8E24 D48B848F */  lw          $4, -0x742C($28)
/* 0B8F28 001B8E28 282E0072 */  paddub      $5, $16, $0
/* 0B8F2C 001B8E2C F000A627 */  addiu       $6, $29, 0xF0
/* 0B8F30 001B8E30 9000A727 */  addiu       $7, $29, 0x90
/* 0B8F34 001B8E34 2846C072 */  paddub      $8, $22, $0
/* 0B8F38 001B8E38 284EE072 */  paddub      $9, $23, $0
/* 0B8F3C 001B8E3C 28566072 */  paddub      $10, $19, $0
/* 0B8F40 001B8E40 285E4070 */  paddub      $11, $2, $0
/* 0B8F44 001B8E44 1C75050C */  jal         set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* 0B8F48 001B8E48 00000000 */   nop
.L001B8E4C:
/* 0B8F4C 001B8E4C 01003126 */  addiu       $17, $17, 0x1
.L001B8E50:
/* 0B8F50 001B8E50 2000232A */  slti        $3, $17, 0x20
/* 0B8F54 001B8E54 AEFF6014 */  bnez        $3, .L001B8D10
/* 0B8F58 001B8E58 00000000 */   nop
/* 0B8F5C 001B8E5C 8000BF7B */  lq          $31, 0x80($29)
/* 0B8F60 001B8E60 7000B77B */  lq          $23, 0x70($29)
/* 0B8F64 001B8E64 6000B67B */  lq          $22, 0x60($29)
/* 0B8F68 001B8E68 5000B57B */  lq          $21, 0x50($29)
/* 0B8F6C 001B8E6C 4000B47B */  lq          $20, 0x40($29)
/* 0B8F70 001B8E70 3000B37B */  lq          $19, 0x30($29)
/* 0B8F74 001B8E74 2000B27B */  lq          $18, 0x20($29)
/* 0B8F78 001B8E78 1000B17B */  lq          $17, 0x10($29)
/* 0B8F7C 001B8E7C 0000B07B */  lq          $16, 0x0($29)
/* 0B8F80 001B8E80 0001BD27 */  addiu       $29, $29, 0x100
/* 0B8F84 001B8E84 0800E003 */  jr          $31
/* 0B8F88 001B8E88 00000000 */   nop
/* 0B8F8C 001B8E8C 00000000 */  nop
