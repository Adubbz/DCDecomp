.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetFocusParts__11CEditGroundFfff
/* 0A1E00 001A1D00 C0FFBD27 */  addiu       $29, $29, -0x40
/* 0A1E04 001A1D04 3000BF7F */  sq          $31, 0x30($29)
/* 0A1E08 001A1D08 2000B17F */  sq          $17, 0x20($29)
/* 0A1E0C 001A1D0C 1000B07F */  sq          $16, 0x10($29)
/* 0A1E10 001A1D10 0800B6E7 */  swc1        $f22, 0x8($29)
/* 0A1E14 001A1D14 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0A1E18 001A1D18 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0A1E1C 001A1D1C 28868070 */  paddub      $16, $4, $0
/* 0A1E20 001A1D20 86650046 */  mov.s       $f22, $f12
/* 0A1E24 001A1D24 466D0046 */  mov.s       $f21, $f13
/* 0A1E28 001A1D28 06750046 */  mov.s       $f20, $f14
/* 0A1E2C 001A1D2C FFFF0224 */  addiu       $2, $0, -0x1
/* 0A1E30 001A1D30 0100013C */  lui         $1, (0x15F14 >> 16)
/* 0A1E34 001A1D34 21088100 */  addu        $1, $4, $1
/* 0A1E38 001A1D38 145F22AC */  sw          $2, (0x15F14 & 0xFFFF)($1)
/* 0A1E3C 001A1D3C AC85060C */  jal         GetAreaCode__11CEditGroundFfff
/* 0A1E40 001A1D40 00000000 */   nop
/* 0A1E44 001A1D44 04004104 */  bgez        $2, .L001A1D58
/* 0A1E48 001A1D48 00000000 */   nop
/* 0A1E4C 001A1D4C FFFF0224 */  addiu       $2, $0, -0x1
/* 0A1E50 001A1D50 2E000010 */  b           .L001A1E0C
/* 0A1E54 001A1D54 00000000 */   nop
.L001A1D58:
/* 0A1E58 001A1D58 80100200 */  sll         $2, $2, 2
/* 0A1E5C 001A1D5C 21105000 */  addu        $2, $2, $16
/* 0A1E60 001A1D60 0400518C */  lw          $17, 0x4($2)
/* 0A1E64 001A1D64 28262072 */  paddub      $4, $17, $0
/* 0A1E68 001A1D68 06B30046 */  mov.s       $f12, $f22
/* 0A1E6C 001A1D6C 46AB0046 */  mov.s       $f13, $f21
/* 0A1E70 001A1D70 86A30046 */  mov.s       $f14, $f20
/* 0A1E74 001A1D74 F8BA050C */  jal         SearchPartsID__9CEditAreaFfff
/* 0A1E78 001A1D78 00000000 */   nop
/* 0A1E7C 001A1D7C 04004104 */  bgez        $2, .L001A1D90
/* 0A1E80 001A1D80 00000000 */   nop
/* 0A1E84 001A1D84 FFFF0224 */  addiu       $2, $0, -0x1
/* 0A1E88 001A1D88 20000010 */  b           .L001A1E0C
/* 0A1E8C 001A1D8C 00000000 */   nop
.L001A1D90:
/* 0A1E90 001A1D90 C0180200 */  sll         $3, $2, 3
/* 0A1E94 001A1D94 23186200 */  subu        $3, $3, $2
/* 0A1E98 001A1D98 80100300 */  sll         $2, $3, 2
/* 0A1E9C 001A1D9C 23104300 */  subu        $2, $2, $3
/* 0A1EA0 001A1DA0 40110200 */  sll         $2, $2, 5
/* 0A1EA4 001A1DA4 21100202 */  addu        $2, $16, $2
/* 0A1EA8 001A1DA8 30004524 */  addiu       $5, $2, 0x30
/* 0A1EAC 001A1DAC 28262072 */  paddub      $4, $17, $0
/* 0A1EB0 001A1DB0 06B30046 */  mov.s       $f12, $f22
/* 0A1EB4 001A1DB4 46AB0046 */  mov.s       $f13, $f21
/* 0A1EB8 001A1DB8 86A30046 */  mov.s       $f14, $f20
/* 0A1EBC 001A1DBC C896060C */  jal         CheckDelete__FP9CEditAreaP9CMapPartsfff
/* 0A1EC0 001A1DC0 00000000 */   nop
/* 0A1EC4 001A1DC4 04004010 */  beqz        $2, .L001A1DD8
/* 0A1EC8 001A1DC8 00000000 */   nop
/* 0A1ECC 001A1DCC FFFF0224 */  addiu       $2, $0, -0x1
/* 0A1ED0 001A1DD0 0E000010 */  b           .L001A1E0C
/* 0A1ED4 001A1DD4 00000000 */   nop
.L001A1DD8:
/* 0A1ED8 001A1DD8 28260072 */  paddub      $4, $16, $0
/* 0A1EDC 001A1DDC 06B30046 */  mov.s       $f12, $f22
/* 0A1EE0 001A1DE0 46AB0046 */  mov.s       $f13, $f21
/* 0A1EE4 001A1DE4 86A30046 */  mov.s       $f14, $f20
/* 0A1EE8 001A1DE8 3486060C */  jal         GetPartsID__11CEditGroundFfff
/* 0A1EEC 001A1DEC 00000000 */   nop
/* 0A1EF0 001A1DF0 0100013C */  lui         $1, (0x15F14 >> 16)
/* 0A1EF4 001A1DF4 21080102 */  addu        $1, $16, $1
/* 0A1EF8 001A1DF8 145F22AC */  sw          $2, (0x15F14 & 0xFFFF)($1)
/* 0A1EFC 001A1DFC 0100013C */  lui         $1, (0x15F14 >> 16)
/* 0A1F00 001A1E00 21080102 */  addu        $1, $16, $1
/* 0A1F04 001A1E04 145F228C */  lw          $2, (0x15F14 & 0xFFFF)($1)
/* 0A1F08 001A1E08 00000000 */  nop
.L001A1E0C:
/* 0A1F0C 001A1E0C 3000BF7B */  lq          $31, 0x30($29)
/* 0A1F10 001A1E10 2000B17B */  lq          $17, 0x20($29)
/* 0A1F14 001A1E14 1000B07B */  lq          $16, 0x10($29)
/* 0A1F18 001A1E18 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 0A1F1C 001A1E1C 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 0A1F20 001A1E20 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0A1F24 001A1E24 4000BD27 */  addiu       $29, $29, 0x40
/* 0A1F28 001A1E28 0800E003 */  jr          $31
/* 0A1F2C 001A1E2C 00000000 */   nop
