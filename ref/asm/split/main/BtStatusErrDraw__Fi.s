.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtStatusErrDraw__Fi
/* 0B1E80 001B1D80 40FFBD27 */  addiu       $29, $29, -0xC0
/* 0B1E84 001B1D84 4000BF7F */  sq          $31, 0x40($29)
/* 0B1E88 001B1D88 3000B37F */  sq          $19, 0x30($29)
/* 0B1E8C 001B1D8C 2000B27F */  sq          $18, 0x20($29)
/* 0B1E90 001B1D90 1000B17F */  sq          $17, 0x10($29)
/* 0B1E94 001B1D94 0000B07F */  sq          $16, 0x0($29)
/* 0B1E98 001B1D98 289E8070 */  paddub      $19, $4, $0
/* 0B1E9C 001B1D9C C701023C */  lui         $2, %hi(TexManager)
/* 0B1EA0 001B1DA0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 0B1EA4 001B1DA4 2A00023C */  lui         $2, %hi(LIT_1150)
/* 0B1EA8 001B1DA8 50B54524 */  addiu       $5, $2, %lo(LIT_1150)
/* 0B1EAC 001B1DAC FFFF0624 */  addiu       $6, $0, -0x1
/* 0B1EB0 001B1DB0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 0B1EB4 001B1DB4 00000000 */   nop
/* 0B1EB8 001B1DB8 28864070 */  paddub      $16, $2, $0
/* 0B1EBC 001B1DBC 2700033C */  lui         $3, %hi(LIT_1238)
/* 0B1EC0 001B1DC0 70B06324 */  addiu       $3, $3, %lo(LIT_1238)
/* 0B1EC4 001B1DC4 5000A527 */  addiu       $5, $29, 0x50
/* 0B1EC8 001B1DC8 00006478 */  lq          $4, 0x0($3)
/* 0B1ECC 001B1DCC 100063C4 */  lwc1        $f3, 0x10($3)
/* 0B1ED0 001B1DD0 0000A47C */  sq          $4, 0x0($5)
/* 0B1ED4 001B1DD4 1000A3E4 */  swc1        $f3, 0x10($5)
/* 0B1ED8 001B1DD8 2700033C */  lui         $3, %hi(LIT_1239)
/* 0B1EDC 001B1DDC 90B06624 */  addiu       $6, $3, %lo(LIT_1239)
/* 0B1EE0 001B1DE0 7000A527 */  addiu       $5, $29, 0x70
/* 0B1EE4 001B1DE4 02000424 */  addiu       $4, $0, 0x2
.L001B1DE8:
/* 0B1EE8 001B1DE8 0000C378 */  lq          $3, 0x0($6)
/* 0B1EEC 001B1DEC 1000C624 */  addiu       $6, $6, 0x10
/* 0B1EF0 001B1DF0 FFFF8424 */  addiu       $4, $4, -0x1
/* 0B1EF4 001B1DF4 0000A37C */  sq          $3, 0x0($5)
/* 0B1EF8 001B1DF8 1000A524 */  addiu       $5, $5, 0x10
/* 0B1EFC 001B1DFC FAFF801C */  bgtz        $4, .L001B1DE8
/* 0B1F00 001B1E00 00000000 */   nop
/* 0B1F04 001B1E04 0000C3DC */  ld          $3, 0x0($6)
/* 0B1F08 001B1E08 0000A3FC */  sd          $3, 0x0($5)
/* 0B1F0C 001B1E0C 789C848F */  lw          $4, -0x6388($28)
/* 0B1F10 001B1E10 04008380 */  lb          $3, 0x4($4)
/* 0B1F14 001B1E14 80180300 */  sll         $3, $3, 2
/* 0B1F18 001B1E18 21186400 */  addu        $3, $3, $4
/* 0B1F1C 001B1E1C C842718C */  lw          $17, 0x42C8($3)
/* 0B1F20 001B1E20 04001224 */  addiu       $18, $0, 0x4
/* 0B1F24 001B1E24 27000010 */  b           .L001B1EC4
/* 0B1F28 001B1E28 00000000 */   nop
.L001B1E2C:
/* 0B1F2C 001B1E2C 80181200 */  sll         $3, $18, 2
/* 0B1F30 001B1E30 21187D00 */  addu        $3, $3, $29
/* 0B1F34 001B1E34 5000638C */  lw          $3, 0x50($3)
/* 0B1F38 001B1E38 24182302 */  and         $3, $17, $3
/* 0B1F3C 001B1E3C 20006010 */  beqz        $3, .L001B1EC0
/* 0B1F40 001B1E40 00000000 */   nop
/* 0B1F44 001B1E44 C0101200 */  sll         $2, $18, 3
/* 0B1F48 001B1E48 21205D00 */  addu        $4, $2, $29
/* 0B1F4C 001B1E4C 7400838C */  lw          $3, 0x74($4)
/* 0B1F50 001B1E50 C0100300 */  sll         $2, $3, 3
/* 0B1F54 001B1E54 21104300 */  addu        $2, $2, $3
/* 0B1F58 001B1E58 80100200 */  sll         $2, $2, 2
/* 0B1F5C 001B1E5C 54004524 */  addiu       $5, $2, 0x54
/* 0B1F60 001B1E60 7000838C */  lw          $3, 0x70($4)
/* 0B1F64 001B1E64 40110300 */  sll         $2, $3, 5
/* 0B1F68 001B1E68 23104300 */  subu        $2, $2, $3
/* 0B1F6C 001B1E6C 40100200 */  sll         $2, $2, 1
/* 0B1F70 001B1E70 84004224 */  addiu       $2, $2, 0x84
/* 0B1F74 001B1E74 B000A2AF */  sw          $2, 0xB0($29)
/* 0B1F78 001B1E78 B400A5AF */  sw          $5, 0xB4($29)
/* 0B1F7C 001B1E7C 3E000324 */  addiu       $3, $0, 0x3E
/* 0B1F80 001B1E80 B800A3AF */  sw          $3, 0xB8($29)
/* 0B1F84 001B1E84 24000224 */  addiu       $2, $0, 0x24
/* 0B1F88 001B1E88 BC00A2AF */  sw          $2, 0xBC($29)
/* 0B1F8C 001B1E8C AE010224 */  addiu       $2, $0, 0x1AE
/* 0B1F90 001B1E90 A000A2AF */  sw          $2, 0xA0($29)
/* 0B1F94 001B1E94 F6FF6226 */  addiu       $2, $19, -0xA
/* 0B1F98 001B1E98 A400A2AF */  sw          $2, 0xA4($29)
/* 0B1F9C 001B1E9C A800A3AF */  sw          $3, 0xA8($29)
/* 0B1FA0 001B1EA0 23000224 */  addiu       $2, $0, 0x23
/* 0B1FA4 001B1EA4 AC00A2AF */  sw          $2, 0xAC($29)
/* 0B1FA8 001B1EA8 D48B848F */  lw          $4, -0x742C($28)
/* 0B1FAC 001B1EAC 282E0072 */  paddub      $5, $16, $0
/* 0B1FB0 001B1EB0 A000A627 */  addiu       $6, $29, 0xA0
/* 0B1FB4 001B1EB4 B000A727 */  addiu       $7, $29, 0xB0
/* 0B1FB8 001B1EB8 0070050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
/* 0B1FBC 001B1EBC 00000000 */   nop
.L001B1EC0:
/* 0B1FC0 001B1EC0 FFFF5226 */  addiu       $18, $18, -0x1
.L001B1EC4:
/* 0B1FC4 001B1EC4 D9FF4106 */  bgez        $18, .L001B1E2C
/* 0B1FC8 001B1EC8 00000000 */   nop
/* 0B1FCC 001B1ECC 4000BF7B */  lq          $31, 0x40($29)
/* 0B1FD0 001B1ED0 3000B37B */  lq          $19, 0x30($29)
/* 0B1FD4 001B1ED4 2000B27B */  lq          $18, 0x20($29)
/* 0B1FD8 001B1ED8 1000B17B */  lq          $17, 0x10($29)
/* 0B1FDC 001B1EDC 0000B07B */  lq          $16, 0x0($29)
/* 0B1FE0 001B1EE0 C000BD27 */  addiu       $29, $29, 0xC0
/* 0B1FE4 001B1EE4 0800E003 */  jr          $31
/* 0B1FE8 001B1EE8 00000000 */   nop
/* 0B1FEC 001B1EEC 00000000 */  nop
