.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel IsDefaultWeapon__Fi
/* 0F3EC0 001F3DC0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0F3EC4 001F3DC4 3000BF7F */  sq          $31, 0x30($29)
/* 0F3EC8 001F3DC8 2000B27F */  sq          $18, 0x20($29)
/* 0F3ECC 001F3DCC 1000B17F */  sq          $17, 0x10($29)
/* 0F3ED0 001F3DD0 0000B07F */  sq          $16, 0x0($29)
/* 0F3ED4 001F3DD4 28968070 */  paddub      $18, $4, $0
/* 0F3ED8 001F3DD8 FFFF1024 */  addiu       $16, $0, -0x1
/* 0F3EDC 001F3DDC 288E0070 */  paddub      $17, $0, $0
/* 0F3EE0 001F3DE0 0D000010 */  b           .L001F3E18
/* 0F3EE4 001F3DE4 00000000 */   nop
.L001F3DE8:
/* 0F3EE8 001F3DE8 28262072 */  paddub      $4, $17, $0
/* 0F3EEC 001F3DEC 68CF070C */  jal         GetDefaultWeaponNo__Fi
/* 0F3EF0 001F3DF0 00000000 */   nop
/* 0F3EF4 001F3DF4 04005210 */  beq         $2, $18, .L001F3E08
/* 0F3EF8 001F3DF8 00000000 */   nop
/* 0F3EFC 001F3DFC 01004224 */  addiu       $2, $2, 0x1
/* 0F3F00 001F3E00 04005214 */  bne         $2, $18, .L001F3E14
/* 0F3F04 001F3E04 00000000 */   nop
.L001F3E08:
/* 0F3F08 001F3E08 28862072 */  paddub      $16, $17, $0
/* 0F3F0C 001F3E0C 05000010 */  b           .L001F3E24
/* 0F3F10 001F3E10 00000000 */   nop
.L001F3E14:
/* 0F3F14 001F3E14 01003126 */  addiu       $17, $17, 0x1
.L001F3E18:
/* 0F3F18 001F3E18 0600212A */  slti        $1, $17, 0x6
/* 0F3F1C 001F3E1C F2FF2014 */  bnez        $1, .L001F3DE8
/* 0F3F20 001F3E20 00000000 */   nop
.L001F3E24:
/* 0F3F24 001F3E24 28160072 */  paddub      $2, $16, $0
/* 0F3F28 001F3E28 3000BF7B */  lq          $31, 0x30($29)
/* 0F3F2C 001F3E2C 2000B27B */  lq          $18, 0x20($29)
/* 0F3F30 001F3E30 1000B17B */  lq          $17, 0x10($29)
/* 0F3F34 001F3E34 0000B07B */  lq          $16, 0x0($29)
/* 0F3F38 001F3E38 4000BD27 */  addiu       $29, $29, 0x40
/* 0F3F3C 001F3E3C 0800E003 */  jr          $31
/* 0F3F40 001F3E40 00000000 */   nop
/* 0F3F44 001F3E44 00000000 */  nop
/* 0F3F48 001F3E48 00000000 */  nop
/* 0F3F4C 001F3E4C 00000000 */  nop
